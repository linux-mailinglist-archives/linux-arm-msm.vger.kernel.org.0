Return-Path: <linux-arm-msm+bounces-117272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SPlkE4PVTGo7qgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:31:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2826B71A684
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:31:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=illqUTys;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C2txeiaZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117272-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117272-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C3DB630D45C0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7EEC3E1233;
	Tue,  7 Jul 2026 10:25:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B652226FA60
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:25:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419924; cv=none; b=HXGqFTOdGnzir7GhYDlxF184IU+UI13SM6TTj5iTZdibPbHh+9bwXh0xA8a0im7MnhIJlp4vrsM4Re9KWfm9lIV4yk5xJXlPNbpUz+TNctcmwKlQlZFUOYxbtS1g+w5w7MmCoyWwGg2QppWjTsj8KOmIb9BZNg/p3fM3FAAdkSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419924; c=relaxed/simple;
	bh=9FaByEYQ1+f7toZfhp8ANfaJcWrdVoKguDXFfomYHnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KILMAK0+kIWh0QJTzv8ZMPnOzrL2Vuv7lxahG/UExju8i4YaLQM6MKW+eYrRyDJ7qGad/lY9ODcWXVmJq5XIIxju+fZRbgtDeC9jYlSjglJxLpA3tdbhjEqyeNEh2ttYBT7t7rCU8f0JVUK2r+c8uS0fd/saz0q87WfwMQwzA0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=illqUTys; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2txeiaZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DnN23076951
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 10:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XP5y6yGHt3Ajgb88Dol1E8KHAvk0yQ+E6gY+cGfJFsU=; b=illqUTys1FEjtQ2r
	JJiO83qoOAGwu4d2azr51/L4o3C7r8f/xXVuJyNxm+Bdk9qwucmgiqpd8hz7Dzgu
	ozJWczUxVBhw1HlLltKhXOWx2DQEMUCyhO+x7vZ42c5v7nzidw3z4dlgUNCQsYRV
	dLyrz4M5Qdun6buzr/xoMvKPOuzcJQ4HpRXNbOvhRKnxxVV73S+WQtNiy4pUQk9U
	UbbMNHxXorVebnIbf++hcPbluekhyhHQ5E4SH4YQyNtqxpWnQ1XIPbdbCyA1L3yk
	HxwoOo2xVuf+IbRGW+exPm+ZaCm2UVsWFEtwPeT1fbCTbZricKqstwjD4IJ70/gb
	GQrcPA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun0s1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:25:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ca3b314193so9576925ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419921; x=1784024721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XP5y6yGHt3Ajgb88Dol1E8KHAvk0yQ+E6gY+cGfJFsU=;
        b=C2txeiaZgravPS2fywlur9+W7Uh66Ui8SaHcp5R1OM80RHbOgcdG5brheiBGGKaqDY
         Y2glyF8HgrOCBS84zHJRldUmkQ/XagXwGBQ8ZiI6McAIrAa7+KRUJkhbnqj8U6Os9IWS
         B/STy/75rTNd3j11u3nw4Jt1GHGP+CqrsROvoS3RwxLG+1e/zDaQfajUindx6WTRFOfe
         nA+PZNi9GV7GoEEPJsMsL1L8ACs4k2OO/s2O9+EVrraNZ80oPauLYKUFRsEnziK4Zx5O
         w9sMYhxFHpb940CaXu13XEaEocNNQ3jzg4MJJx7OBcrqUQK0RZSFZBZ8AZ5AqlfBjdHS
         zMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419921; x=1784024721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XP5y6yGHt3Ajgb88Dol1E8KHAvk0yQ+E6gY+cGfJFsU=;
        b=SEZn9fGDTdod56W8QJn3mXOuts+7qRmq3y5nnWqlXm/mSd9gEz+hEUJo9kxLFjMv03
         ffJUyibN8tPMTNGlf2JncT/hTdVMVvHN2a3mCZ7KK7/u+rsvqNONetzSe0jGOu/yV3pW
         4hrdc5hVQmCtFSeNeNEoaAAmA3b4KxBtGvVtm1bOmyO+jzIGXOA9yQS4A3HovHNnKU2u
         YvDgHBhXI5PvVZMbed64rP9zCNKd7c2Yfdyxropqk7yJ3VyrOHWguZky2Huo4yrLfKWt
         Muaf6CItet+RTnGbOghEJPsH7NKSmaf2A/KNxrKUlqrTn+Z9xGy/jyaSNDleG8W4l/Y/
         C06w==
X-Forwarded-Encrypted: i=1; AHgh+RopkNnTgbtOBNMsewM0+SzqTJNya44jJw9uB1qMgmTkvarEoj0Q9Do5VctK3qWYcpv0XP22AGql1mvBRYcP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+f9YNL1cKuMpeZyeZVwrRSh4OrVt6O/P5TVUyU+rcPFcPYkAb
	rVhdheQQxpeYGEHMrm/oCMn+qVwLwTiFW8AZDdcQDzzwBRjsIHMnTo+zgJ++C7tPcXMITWcDPM9
	mnM8pIkWY7KUYSJRIpf4lysJYlfreTiCHCPWLf08IP3XNQ5UNLk2lbxLFT7ExN5NDaka6
X-Gm-Gg: AfdE7cl6OP8ke/h8UT4ygpFc/rqtog7GKxDrWClPavQjxpp04Equ0QF0tICaE+5Hn1A
	OOIqUMuR1RFaj84wbaJJDPTQw9OV9jif+c8X2hRkecSKMxgM6s+6GfKmMaQqV9K9c8MExqpDpvu
	H1Ew2kAi2x3WvxA0jNNHTRj/t87xv9FU7URBRbl05Loy6HLQsNyxX3i1uLxvM3ZAK+vmfaHzn7I
	HsQ/EcoQeI/j1gmPwUNNFocCU0fy1/2M5hisp0tGqNEgGZnnCfPzcSwz3gArZlYsnkKKTNmDqyj
	wt+YkCDuqilpR8r/BTKgHigeiHpHX1R0QwQdwi81D0hjkG86y4ia8gCZcLbRIElsivk7SqafSoR
	2PAe2Jn4vH8DdrgL69/5rAiT+OL1Pn2ssv7iHsWTJ0Q==
X-Received: by 2002:a17:902:f60e:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2ccbe4004demr49315155ad.2.1783419921193;
        Tue, 07 Jul 2026 03:25:21 -0700 (PDT)
X-Received: by 2002:a17:902:f60e:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2ccbe4004demr49314885ad.2.1783419920605;
        Tue, 07 Jul 2026 03:25:20 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9bbsm9319265ad.4.2026.07.07.03.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:25:20 -0700 (PDT)
Message-ID: <9dc4b29e-e9fb-421a-b789-eb16a68ff915@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 15:55:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
 <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
 <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
 <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
 <e7eho7ezujbrdzgumshapf2r7hu2jaujib7lvotrqvcj5er5ut@xpd6l2kgipqu>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <e7eho7ezujbrdzgumshapf2r7hu2jaujib7lvotrqvcj5er5ut@xpd6l2kgipqu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwMCBTYWx0ZWRfX7v4Bel8u0tcF
 cXpGGvHu1nQMhWq+GmFMBuosIye8zdYShTxFkTEMl1Zbx8aIReZqoGNd9hO8zx86FbljwTyZghF
 i0zBsIapqHwAdMov8d8IuRnd7GRkR8w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwMCBTYWx0ZWRfX5wZuf+R8OhK7
 NRt8jtQfDytLMmZ5YGcfX7z4joLfPXt/lKhRoxeU3yXOOR3QxN/YMyw3lEhEWRkBs0eQJ8EYH3a
 oIjhgWYgm1Z+XOV3qgXa6VhJVyA8Ks2TAbpI6zjPYZ1im1wLj14QqV64WdoTGjxkPV62EopKcYh
 8FX0JiKhr8QqnJ4z0Yu0gTjhAaLa9FG7CzUx0d2hxQWt7hyYXqT5pymwbgcPbPD9xGHMCYaieBt
 MYiEEwdzS1bKWUMWcLm8DFimgAbAifznCQzWYGtwle+oH5rtTO/OEtyBQAes5N+Em4l1J0pP7dn
 LzVXAh1+74r/LB3F3s05/WGIfslJKt47vegWOQ8XLg6yuVWOKyK1wbYqauXlFtqRptNZU0MExW8
 CsrT/NYe07CbrBZWXtjPogZ84x+FFkt2q/woCzGvVVuJ3UT9kNubwMnrXj+K0A0uP9/kj8xQ1t/
 D/iV1pg6BUp75u/5k/Q==
X-Proofpoint-GUID: oeMSo6LTnO2Y_hGI4QRsPhakedruTCf3
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4cd411 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fbyXy8itprBkbsvVMWwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: oeMSo6LTnO2Y_hGI4QRsPhakedruTCf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117272-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:daniel.lezcano@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2826B71A684



On 7/7/2026 1:04 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 08:11:35PM +0200, Daniel Lezcano wrote:
>> On 7/6/26 19:47, Dmitry Baryshkov wrote:
>>> On Mon, Jul 06, 2026 at 07:03:18PM +0200, Daniel Lezcano wrote:
>>>> On 7/3/26 17:42, Dmitry Baryshkov wrote:
>>>>> On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
>>>>>>
>>>>>>
>>>>>> On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
>>>>>>> On 7/3/26 7:03 AM, Gaurav Kohli wrote:
>>>>>>>> Add Device Tree binding constants for Qualcomm Thermal Mitigation
>>>>>>>> Device (TMD) types used by remoteproc-backed thermal cooling devices.
>>>>>>>>
>>>>>>>> Qualcomm remote processors expose thermal mitigation endpoints
>>>>>>>> through QMI. These endpoints can be registered with the thermal
>>>>>>>> framework via the `#cooling-cells` property on the remoteproc node.
>>>>>>>>
>>>>>>>> The QMI TMD protocol identifies devices using string names (for example,
>>>>>>>> "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
>>>>>>>> `#cooling-cells = <3>` requires numeric device id in the form:
>>>>>>>>
>>>>>>>>       <&phandle device_id min_state max_state>
>>>>>>>>
>>>>>>>> Define common TMD device index constants shared across currently
>>>>>>>> supported platforms. If a future target requires a different mapping,
>>>>>>>> additional target-specific constants can be introduced while preserving
>>>>>>>> existing DT ABI.
>>>>>>>>
>>>>>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>
>> [ ... ]
>>
>>>>> Why are you using only those TMD devices?
>>>>>
>>>>>> More constants can be added as needed.
>>>>>
>>>>> Kodiak is one of the supported platforms.
>>>>
>>>> What would be the benefit of having more than thirteen cooling devices
>>>> declared in the thermal framework and having only a couple of them mapped in
>>>> a thermal zone ?
>>>>
>>>> I agree there are more TMDs but if they are unused for the moment, why do we
>>>> need to add them ? Can we do that incrementally ?
>>>
>>> That's what I am trying to understand: why the implementation uses only
>>> the selected two devices, if the modem on Kodiak supports others. How
>>> can we find out, which TMDs to use on other devices.
>>
>> My understanding is that is an initial thermal setup. Gaurav will add them
>> step by step while setting up all the thermal zones instead of sending a big
>> patchset. And TBH, that will be much easier to review.
> 
> In such a case it should be noted in the commit message and/or cover
> letter.

Thanks for the review/guidance. Not all TMD endpoints are relevant for 
kernel thermal zone binding — some like BCL and cold temperature are 
handled from userspace when needed. The constants here cover only
what is needed for modem and CDSP thermal zones on the currently posted 
targets.

Will add a note in the cover letter clarifying for current tmd's.
Please let me if this is fine.

> 
> 


