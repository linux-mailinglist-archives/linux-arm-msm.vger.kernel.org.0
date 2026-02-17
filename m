Return-Path: <linux-arm-msm+bounces-93167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBx4NVJmlGkpDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:00:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8729714C3BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:00:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B475A3011150
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62743563F4;
	Tue, 17 Feb 2026 12:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LrzkrI4q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="difsG+T8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7536D3563D6
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333195; cv=none; b=msORskowrW8pz+Hpg5eVpK3qp5IpSzKQ5k6DEQ+2/hXTHydZp8ONoaLFweD6iuhHw1r/gDJNU9mrLJyjsE9M2O3zBvzEaNfgcrejf7bL8i/ahcLOEyGxoJUgLDc6plQlI6lvziWBiSgTkpVgbXj4AydBwSRQ/4pqg0nfDWxE78w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333195; c=relaxed/simple;
	bh=mAuTC5AJsCNtBLP24UouHl7/vDNnOp6omGtW720jvec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvGyt0cFFwU+8kdXHhKnhhve5YZcv5YBtAX5Lp3V9Q3wsPI9GoqXiWdul/rVFjNCAsThyZic6NTuR1g9mJxJ1WN698dNCGkRRPmtkUblLW2h3gyPgtMJfd9ciK/L5mLwhBvuiBtSYQaL7EP6sdinMRUxzUGDVTAl3zazUuysH54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LrzkrI4q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=difsG+T8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H54e1c2111894
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0wA2FAQrRIGzPhPiBC+jIJgFGTOYwSshXjcsEayItQ=; b=LrzkrI4qeTtEcSHQ
	xzsFERCf21mSUWkLSZdYkdcP5UMuBa314R5LBNEBiKGVayLnNOvhn/BJsqpsfD3n
	bmSpOOx/C7ZH58ZRKtA/BdAnLPbOxw3UHPztCW/GCfSGmAVkVq7w2Q4jMlj3y27l
	wKSr81teZ6Tn7T/xtJb13uKmv0d5ipWkKBEUoqJe7WwEHr0EWH4a9BjGwG4c0AE2
	kE/isX9H3Pge0CMe7C3321zr4v7ceOPZ5Wj1cqpzH95yU4/O6FrnNKGaBo8AajHs
	PelJLnDrTqx1Yt1BDmLHqD5YzunFill2Ra6nvdrjqr2gr8FvLiYnEofGVwi1BifZ
	2sOECA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4h4cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:59:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb39de5c54so324962385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 04:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333193; x=1771937993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0wA2FAQrRIGzPhPiBC+jIJgFGTOYwSshXjcsEayItQ=;
        b=difsG+T8jxrxZfmAWIaIgArPSbs+MLMCITMfHoHSbtRhDMBRT0XWFOxd8nN3zBOipO
         27Tt6pBfNbO1DfZrrZT8rhxT7VbT+iqpBvVDQnOaajqyw/nLb+opW4utE+nJccdnTn79
         FUSkeSQDD+ecmfhMaqcw4aI54P+lF+nIkql4G4wjYiwLlKD8yDQbwmeQ2UATBQo3L0gG
         BATBv/JQvCSYml1P8dAKKm6H3HKgMR8Gu1lml2z4aIm5QgvNOrP2O1ea+CXLlvtXTjU2
         GYQOSYBtAGbmO6HIPArHkB6qUH3Mbe/BmqHj/MPrpVueQQIUMl82afPhqznlJR/+5pjv
         1ZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333193; x=1771937993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0wA2FAQrRIGzPhPiBC+jIJgFGTOYwSshXjcsEayItQ=;
        b=ovEEPgzJRQC2ZyNiIGcWe6s7e7bS7C0uiDLf/TRtr9lj7wbF+VUeqC41JUzDxpbAqc
         KG9AXaKg6TVM06VWHnwWncdTUGk7cAfulmza/dkLInfGkV1WWKYJPYdLwL3O6J+D8uuL
         oX34aVvzk4oTkEiJ424wMdCNs0jLiP/VJu4Ger5ElRIfllS9GUKiCUE7q4ALBhVf845m
         Fne7ZhMhj6ombjPfSrjJ8GlqT76FBo1oX7sBT6CtmKmW08Qn5RrzCFwSN4mdywPmX+R1
         q/VHeLvmvScy+uOF8tg/eTDVTrt0HKUJzr8FumAJlDS8JGck051MOst7WSd2BWOBSI5X
         LT8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlZz79X/DXcr+3J5LdfizZ5tcMvpCcbWdFrRl5HjeOC+ymz9by3uyfctsVCynBfmZd3LxusGW5Wv/TztWk@vger.kernel.org
X-Gm-Message-State: AOJu0YxP8REHPMM2DmVqoE60aLYFGplWsZaIVRF3GYN43ljW4I2WHFTf
	ON/iI/i09ZV4y3M6Msbip4DA+EHwe7JCC3XW/nL1vooC+RE4t/SW5eHf8yZspcdJtqqRT1quaf0
	Vj2KW2xTXalZBGJ+0ENezar1N32T213DIiwB+DEaY9IsczvfTtVjkhZlYLvdv3mGwpwef
X-Gm-Gg: AZuq6aJHpB/465pANkwrnQpIiCH2sRJbMvOxic3/tZaFOMCzLQHVbyUcH4lNFtm7Qzt
	NNKglUnVvo/2G9pLqLL/h+vOs2t3y7fmwRx8G7tWARh7xv5H56xE2ZJNyvYsQbT3LveOJSRy13D
	JmN12MmoAipMfeyeD6zHuy+3uBLhj1eSrAXuvqSUkSM/MXDfk12vOs4oqDOYGcAvZ6dxjeIShfk
	niZ5CmTX/To2k8J1fbgl3Tfvv0q7/s034taEVFnDcsoBrvzYI606YBoJGVh7uDG3QRqjgzkMC7D
	mg4UD6hlGRUNZMu4JGPvxZEFW/vCkxl3AuHzo1jMvtziZB1lEXVbpCkrdkeuMDUsEhtIOaiDJkt
	wMlerBhLUkVqLttaTna+gh2C5JTav+AUuMQOW3BmNK9arD+tGByne9mZAOiumoPZHt6TjZxHumX
	5ulbE=
X-Received: by 2002:a05:620a:1714:b0:8c7:110c:762f with SMTP id af79cd13be357-8cb40850a6cmr1368756985a.4.1771333192538;
        Tue, 17 Feb 2026 04:59:52 -0800 (PST)
X-Received: by 2002:a05:620a:1714:b0:8c7:110c:762f with SMTP id af79cd13be357-8cb40850a6cmr1368753885a.4.1771333192029;
        Tue, 17 Feb 2026 04:59:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7385e60sm346966866b.19.2026.02.17.04.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 04:59:51 -0800 (PST)
Message-ID: <203f6f63-e81d-4db5-8ede-ff6695a847ed@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:59:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
 <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
 <cleh7dolqus3grexqfchtavvnj6wef6rlslgv3r7gesfuyxhs5@5b6z5gwtn36b>
 <nhgxvv5bm3bevq4qkqnew6gaqlwiaicrs7yjckg26fgwnffqj5@u2phabfukljx>
 <befc5600-5cfd-4134-928c-80e3b1b4102a@oss.qualcomm.com>
 <iqg6jpq4i3olwugnlnsczisbrbysxzik6otby3pgkv5uqsez3f@diwpjgf26mk3>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <iqg6jpq4i3olwugnlnsczisbrbysxzik6otby3pgkv5uqsez3f@diwpjgf26mk3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=69946649 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=R9SVTSvzoFrXFbf9F0wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX7SNu/wIHMcLn
 SXlgb4B8XwS5DIc3PseREfSvQpiC4+ZP8syE6M/++yafIU8GHOKwvugRTNU20aPg4xFdvu1BEjH
 4310YlE16d/6+OS+dV3c50zK+e5aJw2yI0696/5wSaynpzoBbcMrnmWFzRdTDDYIv4KrC7Q4OiV
 bsehbEKolLT/BvkSSW3Hniyy5ksae9IlLPdFTZG+ZLtuu/gpJsKz9PrZb97FutDWEVVlzCE8Yqw
 vdQPZg5wyas3VE8H7692l3oPq3mdfgfw1KyhlvFZnHbtMtQxQWjaSPzI3/Pn9j12Ugcbx9ECSg9
 zxsFBulnmhLtTHsPOlKI6mxQZBusKGyKc9d9qkg0BpIgFPSzbohiDfE0yl2vb8qH/j2mPtRU4/0
 chD4RDJSrt5ST1TjlfSZVe5cgHPgzSYAb8Taf5pDxoIOLSrQqnq5cGW5T/3toiiUkFQDWIf7ToZ
 Fz5qCQQ/T6AvOO/yf8w==
X-Proofpoint-GUID: Ix1u4Ux4EmeQm61kynzTrcly3AF8CaX7
X-Proofpoint-ORIG-GUID: Ix1u4Ux4EmeQm61kynzTrcly3AF8CaX7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93167-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8729714C3BC
X-Rspamd-Action: no action

On 1/13/26 5:29 PM, Dmitry Baryshkov wrote:
> On Tue, Jan 13, 2026 at 04:31:15PM +0100, Konrad Dybcio wrote:
>> On 1/10/26 11:45 AM, Dmitry Baryshkov wrote:
>>> On Fri, Jan 09, 2026 at 11:50:46AM -0600, Bjorn Andersson wrote:
>>>> On Fri, Jan 09, 2026 at 05:21:10AM +0200, Dmitry Baryshkov wrote:
>>>>> On Thu, Jan 08, 2026 at 11:49:54AM -0600, Bjorn Andersson wrote:
>>>>>> On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
>>>>>>> On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> To make sure the correct settings for a given DRAM configuration get
>>>>>>>> applied, attempt to retrieve that data from SMEM (which happens to be
>>>>>>>> what the BSP kernel does, albeit with through convoluted means of the
>>>>>>>> bootloader altering the DT with this data).
>>>>>>>>
>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> ---
>>>>>>>> I'm not sure about this approach - perhaps a global variable storing
>>>>>>>> the selected config, which would then be non-const would be better?
>>>>>>>
>>>>>>> I'd prefer if const data was const, split HBB to a separate API.
>>>>>>>
>>>>>>
>>>>>> I agree, but I'd prefer to avoid a separate API for it.
>>>>>>
>>>>>> Instead I'd like to either return the struct by value (after updating
>>>>>> the hbb), but we then loose the ability to return errors, or by changing
>>>>>> the signature to:
>>>>>>
>>>>>> int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
>>>>>>
>>>>>> This costs us an additional 16 bytes in each client (as the pointer is
>>>>>> replaced with the data), but I think it's a cleaner API.
>>>>>
>>>>> What about:
>>>>>
>>>>> const struct qcom_ubwc_cfg_data qcom_ubwc_config_get_data(u32 *hbb)
>>>>>
>>>>> I really want to keep the data as const and, as important, use it as a
>>>>> const pointer.
>>>>>
>>>>
>>>> I guess the question is what are you actually trying to achive; my goal
>>>> was to keep the base data constant, but I'm guessing that you also want
>>>> to retain the "const" classifier in the client's context struct (e.g.
>>>> the "mdss" member in struct dpu_kms)
>>>>
>>>> If we're returning the data by value, there's no way for you to mark
>>>> it as "const" in the calling code's context object (as by definition you
>>>> shouldn't be able to change the value after initializing the object).
>>>
>>> And I, of course, misssed one star:
>>>
>>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(u32 *hbb)
>>>
>>> This leaks the knowledge that HBB is slightly different kind of property
>>> than the rest of UBWC data.
>>>
>>>>
>>>> You also can't return the data by value and then track it by reference -
>>>> as that value lives on the stack. This has the benefit of making the
>>>> lifecycle of that object clear (it lives in each client) - but perhaps
>>>> not a goal of ours... 
>>>>
>>>> How come the ubwc config is const but the hbb isn't?
>>>>
>>>>
>>>> If we want both the per-target data to remain const and data in the
>>>> client's context to be carrying the const qualifier, the one solution I
>>>> can see is:
>>>>
>>>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
>>>> {
>>>>         const struct qcom_ubwc_cfg_data *data;
>>>>         static struct qcom_ubwc_cfg_data cfg;
>>>>         int hbb;
>>>>
>>>>         ...
>>>>
>>>>         data = of_machine_get_match_data(qcom_ubwc_configs);
>>>>         ...
>>>>
>>>>         hbb = qcom_smem_dram_get_hbb();
>>>> 	...
>>>>
>>>>         cfg = *data;
>>>>         cfg.highest_bank_bit = hbb;
>>>>
>>>>         return &cfg;
>>>> }
>>>>
>>>> But we'd need to deal with the race in cfg assignment...
>>>
>>> static struct qcom_ubwc_cfg_data *cfg;
>>> static DEFINE_MUTEX(cfg_mutex);
>>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
>>> {
>>>         const struct qcom_ubwc_cfg_data *data;
>>>         int hbb;
>>>
>>> 	guard(mutex)(&cfg_mutex);
>>>
>>> 	if (cfg)
>>> 		return cfg;
>>>
>>>         data = of_machine_get_match_data(qcom_ubwc_configs);
>>> 	if (!data)
>>> 		return ERR_PTR(-ENOMEM);
>>>
>>>         hbb = qcom_smem_dram_get_hbb();
>>> 	if (hbb = -ENODATA)
>>> 		hbb = 15; /* I think it was default */
>>> 	else if (hbb < 0)
>>> 		return ERR_PTR(hbb);
>>>
>>>         cfg = kmemdup(data, sizeof(*data), GFP_KERNEL);
>>> 	if (!cfg)
>>> 		return ERR_PTR(-ENOMEM);
>>>
>>>         cfg->highest_bank_bit = hbb;
>>>
>>> 	return cfg;
>>> }
>>>
>>> This potentially leaks sizeof(*data) memory if the module gets removed.
>>> Granted that all users also use qcom_ubwc_config_get_data() symbol, it
>>> should be safe to kfree(cfg) on module removal.
>>
>> I really don't understand why you'd want a separate API for hbb, if
>> hbb is already available from the larger struct *and* if a driver needs
>> to know about the value of hbb, it really needs to know about all the
>> other values as well
> 
> Please take another look, qcom_ubwc_config_get_data() is the only public
> API, qcom_smem_dram_get_hbb() is an internal API.
> 
> My goal is to keep having UBWC db which keeps const data and which which
> also returns a const pointer.

Right

So if I understand correctly, this is almost exactly what I originally had
in mind in the under-"---" message (modulo having a static global ptr vs full
struct instance) but I failed to express that I wanted to keep returning a
const pointer to the consumers

So in the end it's

A) int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)

vs 

B) const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)

I think the latter is better since we won't have to store a separate copy
of the config in each consumer driver (which the SSOT rework was largely
sparked by), essentially removing the ability for any of these drivers to
mess with the config internally and make it out-of-sync with others again

Konrad


