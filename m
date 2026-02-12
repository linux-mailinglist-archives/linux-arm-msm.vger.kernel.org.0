Return-Path: <linux-arm-msm+bounces-92698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ETZoCRrQjWnw7QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:05:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6457C12DB66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1ABA304E837
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D72835B15A;
	Thu, 12 Feb 2026 13:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Phn6Ul8b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dy9EEjH1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D917329392
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 13:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770901527; cv=none; b=uGDZAXBUC/fo0RjTOHaDp69wKebGIj/J140Ab7qH48WbTApKoFB/rLkVgVDv51ilBM30Hv3v8JYhv5jAaDz508gqLErDb4z1/u3cdLzUAR37AC8ivi1Gcrnqk+1NN5cX3nEBVLRu5NxQIbM1OtkC1t1fpCcDF2UjMkuPADM7pp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770901527; c=relaxed/simple;
	bh=a3G5yws0G5Q5A5x8eF4TVEDtnRBjeCcYcF9sRVwvv18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0W/sMrRnJzetbns2nnQ78HfLNevnkQCaDCgSdhDEtogpk7QR90XNCYTUr+9gblmmAQvQSREPEmp9GC+ps0mvl2D38wtULT9+2dfxqn8PvzXeCWXWT588jkGPQfMxNT4mlD0Iw4nyXnqHlY17VzSPwBY7FtrdH21AVtcYU2DxMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Phn6Ul8b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dy9EEjH1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C9o5oc3562064
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 13:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gh6NSeWutFEmj42OJ5qvtSwCS60I9Bqn+t9+J1s015c=; b=Phn6Ul8bVUtPv4Nv
	9RqNjn4T9oNv1NcrnqMn2fSlDGqa+TpkdeBLPow4gycDHrZZyN7fyLzk63XFT767
	L5Tc1F3lza2R4c9CeEjBtsUl8r21gIbzos627I4s6FNAQCbgii5JEHDU3Pgt31lb
	pLqTM+hSZHdZ0ktWs8Aq9zznzLsGnsE6/7dUTI1nyJXUI2NQ8EMldiX9B0491Us3
	lraFb4PDKBr2rRKQoCHiB3qXoE1DYGUaWYh/pAQJpA6tNn6Y4qrvfSkRWWWneWsX
	t6PzjD6Vu8NxOhNjKkkyA/XajGuWVyUXppxyp3+Nb0VGBrsxPfC7kOeJwoIj0sfk
	lu+NIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ck2gk99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 13:05:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aaf2f3bef6so49495565ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 05:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770901525; x=1771506325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gh6NSeWutFEmj42OJ5qvtSwCS60I9Bqn+t9+J1s015c=;
        b=dy9EEjH1lW1bad1quOSk7q2yVZg9LYIIlYxk2XF4wKeS4KjfMRRpmWIqdcGKhaLcqh
         rPZLV/pBaKDW6Ts07rV56h2iHl/g6R6h7CiicCpzmb2t0XkCSWBwO08a+T89gutPEDYx
         YmosqTcLifdLtuXF0RQgDs9CRCONUAuZ709oYGa8ZRSf9tXW6LeTRl46WWhDaZgtLZaP
         W+RZ4xayTSPC9Eaa2xbjSl3i3G8dYPUlvtPHGQ9Zure8RfYeuG5/m+2vorz1CIkQcbIt
         oPFccqLO35Yx1CbDJp4adyFaOi2fwiGNI0poGT4A4VuVKH6SJBC4egdk7Ob+40UFCPYe
         HPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770901525; x=1771506325;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gh6NSeWutFEmj42OJ5qvtSwCS60I9Bqn+t9+J1s015c=;
        b=g2LJxMaijc6uZ0fIeXZBWPMEuo8Ms++1kgeZJS4kUQHrtPgqKg+PmQ5kVX5dSHWuwD
         /cVAtHx5qWf9SUrRf3uDk57wPFd0tWeXSExwDIY27/6RajO9WR5qts+10bN93ksCALOx
         tTeYrAmL+mHAf9PMHI7qpraEKYqZ2KcnCmL7FaaM+D3mshUx7h97BStbzNc4+TSSRtLu
         fxiBKTPVOGuedV3ytS8OHQeQvzz46NQbaKpo0HIYLBCXaJd/4mKRfO3ealovAyHlDtZR
         asPlSI93AHI1lcOzX4PX6x44C5/PvLp4vz/kyncWQ0o9A7mIR2PRhry2Q241vm7cdTel
         4myg==
X-Forwarded-Encrypted: i=1; AJvYcCVRXpCJnF+1HvgSs/4PJntxCcg0oXdDvPya7IbKzW1bTJzspkCCjJ3sbvApxCSC1Ipq/EoT320IR9oRsVlG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1mwaLMxeaQHPeV2yY5HSWiieCcnfZkP1A1rO7LwQgtrpJytTN
	TSIbowIAjMAWCM8K6u1sMWMuklKgP3RxeykngyaGgYCFdtzNQS8TLxh+MmekH/g+s5yXT8JLd6l
	lisbAQE6Q3200pWzRL50Ulg7mGAGJxO6ogLT1ut7qzvIaX+x1co0eODDBwYpNFXAkJtLU8uEzcE
	Jd
X-Gm-Gg: AZuq6aIcUQnpY6Kk5KTIkRTQXEVWKeXn0UAgdQzm1E4PJ/FslwkG4JjFlOnMx0yspjj
	EfOOkaiY6U7Tkw4D/8VkmdnTfNia/1YRRykJwp3T10qjPYRcOTD1wfXNZIRmfCeW+RpeldWbN0a
	MG4cSKMmAjKbS4Av4l0VPfh8Iu1eja1OkDygREDn1GYMY/Y4ybhqAc96xWVC9B1La/a59UoU1e3
	ic3djdgKCnWFAPlkx8opsSiZ96G/HuBVunDNflh7eUdY673p0C9n8soofu09k6mMFh0H42fpQL9
	qwK/j6ibbOigCfDsj4tpowL3+e8wSVQfJoIa5HYEF8/xFAoiBgnrmOpYAtYNomrrypaY/riye4L
	xFAw4+L+av2naQ6fhz4RdOdMS+aFiSXvpoilbj07S4mmjBOiBDOWpww==
X-Received: by 2002:a17:903:3204:b0:2aa:ecec:a43d with SMTP id d9443c01a7336-2ab399a6779mr28425265ad.21.1770901524655;
        Thu, 12 Feb 2026 05:05:24 -0800 (PST)
X-Received: by 2002:a17:903:3204:b0:2aa:ecec:a43d with SMTP id d9443c01a7336-2ab399a6779mr28424825ad.21.1770901524119;
        Thu, 12 Feb 2026 05:05:24 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2997b6d0sm53628715ad.73.2026.02.12.05.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 05:05:23 -0800 (PST)
Message-ID: <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 18:35:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
 <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cd7fb3DM c=1 sm=1 tr=0 ts=698dd015 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=VDDfqcjMpRzOalc4LhIaOQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=zkfBPpEoM8Yg5YbrLrkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA5NyBTYWx0ZWRfX/QpNBH22pxFS
 6GJSIz3UmttqMnBoV5wg4j22KQZj/DzqzJ0pDAVCpNWNdEp4joZDERzZMzHEca0ZoMYqFUVyJQ7
 rBpQh93atyyz3JLyJaY3P0N7oaRRvz72WVCEtSZyvBHDFAWVe0Z1dmaiqrF9P+b5CId5kmYVvnC
 81nb/uB8XOK59HStideks8Mz9DFK5WKReLGakkDcbuGNdRHcc0UVvnP2I9cprGLkJ/OAlyeofOA
 aZbLk2OKFzRq63VuYoy1MVAfjijVzEzlOXZEJqqiAxUOThBQD8Cle/LCxwsVmugPBAYl/4lEZK4
 hOKKE8af1J3u+d1M1R+iFDM6Ca3thj9IUXUMBi/ZI16KhlI1vsVtGsJYOLm9tw3H+IJgpVStCsX
 OAv9unG0F1m2kx0CWIbJ/WKm9D4VE9fPUx8COAyIor/og08UIe4MnvfsgvXwu1jKTTTrbOZ1ihs
 iE55DZT1Ju7mSIToHnA==
X-Proofpoint-GUID: 6yRM3QevI1GNUOl3j-9ZMWCVtTNHowOS
X-Proofpoint-ORIG-GUID: 6yRM3QevI1GNUOl3j-9ZMWCVtTNHowOS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92698-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6457C12DB66
X-Rspamd-Action: no action



On 2/12/2026 5:13 PM, Konrad Dybcio wrote:
> On 2/12/26 12:16 PM, Dikshita Agarwal wrote:
>>
>>
>> On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
>>> On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
>>>>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
>>>>>> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
>>>>>> use Gen1 by default, but boards that intend to use Gen2 firmware can
>>>>>> opt‑in by specifying a Gen2 image through the Device Tree
>>>>>> 'firmware-name' property.
>>>>>>
>>>>>> Based on this property and the availability of the referenced
>>>>>> firmware binary, the driver selects the appropriate HFI generation and
>>>>>> updates its platform data accordingly. Boards that do not
>>>>>> specify a Gen2 firmware, or where the firmware is not present,
>>>>>> automatically fall back to Gen1.
>>>>>>
>>>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>>>> ---
> 
> [...]
> 
>>>> To avoid accidental matches, I can switch to an exact filename match
>>>> instead. That way, only the specific Gen2 image (for example
>>>> "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
>>>
>>> How do you detect that for the OEM-signed firmware, which can have
>>> random name?
>>>
>>>> want to use Gen2 can opt in by naming the firmware accordingly.
>>
>> I Explored on suggested alternative approaches and seeing some limitation
>> with the both of them:
>>
>> 1. Detecting Gen1/Gen2 by scanning the firmware blob (fw->data)
>> It is possible to parse QC_IMAGE_VERSION_STRING from the .mbn and  extract
>> the version string. The issues with this approach :
>>
>> - the version string has no explicit marker that identifies Gen1 vs Gen2.
>>
>> - This prefix is not a formal ABI, and it is not consistent across SoCs.
>> Each SoC family uses different naming patterns in the version string.
>>
>> Example : For SC7280 Gen1 we currently see:
>> QC_IMAGE_VERSION_STRING=video-firmware.1.0-<hash> while SM8250 has
>> QC_IMAGE_VERSION_STRING=VIDEO.VPU.1.0-00119-<>
>>
>> So the driver would need SoC‑specific string‑matching rules, which is hard
>> to maintain if we are looking for a design to address all available SOCs.
> 
> The only SoC with such distinction today is kodiak. So we can simply check:
> 
> if (kodiak && strstr(fw->data, "VIDEO.VPU.1.0.")
> 	hfi = gen2;

Agree, this works for Kodiak. However, Dmitry was also referring to other
SoCs that may support both Gen1 and Gen2, and at the moment there isn’t a
generic way to handle that check.

Also, please note that the Kodiak Gen1 firmware uses the string
video-firmware.1.0, whereas Gen2 uses VIDEO.VPU.3.4.

> 
> 
> Can we agree that VIDEO.VPU.x firmwares are hfigen2? If so, problem also
> solved for <=8450
> 

Nope. that's not true for all, SM8250 uses VIDEO.VPU.1.0 which is gen1.

Thanks,
Dikshita

> Konrad

