Return-Path: <linux-arm-msm+bounces-115410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2MXpDQe1Q2opfgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:22:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC636E41F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:22:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="n/sIy784";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GOQOMsk5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115410-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115410-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81CEE300D156
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6660E2D5436;
	Tue, 30 Jun 2026 12:22:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297163CD8B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:22:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822142; cv=none; b=qCtEfkIXZ9+6ur8VQrLe6T8JwOVEEaJbS01QPeXKmv/qvKhFNWr0VZSojqBEDw4WPcpGRNsHKOR61ECr7qTa7tGCBr5NVU+x6YY2SRnad3wTBzmMainrHtLoI/yavr1u8OQ8go9EDh6NhcyycVwPVUmxC4MF0T2g1vd9aVhbXLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822142; c=relaxed/simple;
	bh=DvkHhs+kSoGR3lSdy4OUVLfzUrK2cmqUf6/O/VNnXvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=inzEWBhGf0Mn0kUkq8vkVci/hhuaSznHnry5Osqmt4lcFnqk2MyRn9tZJ2x6tvuV1uOB+UkZ+Qx8LA8ilh6iWEwm0hJOFLP3ESwzW1Jkeyp2Xer6iJMZh0Kqxo5r5zQZZpnuF52fuDSAP5U3xt9IGAZxCqU5cmz9UBThdwx1IAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/sIy784; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GOQOMsk5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mqcN1611606
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pgvqm2rFfWBgXUpd5Zjx1gkPEQkXSfAbfJSw5KWo2JM=; b=n/sIy784etah8Th5
	lga4/w9nHvYJltOFEJ0BFRS3w0lGXR3Yxu6p46KD/c3wfjOQJE0778fD3Qb93SQ4
	PtvQvsg7ifA1Z6Ml922tbkfH5qi5MLUv3JYvHZpsEgqL9yb8APMTpy8NHDGj7C/K
	Uz0Ml8zq3KImPsOSUArZQYOyKLMDo2X+nlkws3NJrPv13e7iOfdT6ivw1Xc05Sr4
	FuyYprCUyJB3Chll17m5PI6qtRGQx61TngpheAtL2pdxLyJzXIHxmTh9CXww7laW
	xaug/94N7HPYbmh70A9i+Cx0cj00sF5NKDXbDSxybnlFa74gjvm/ttO75eFS/hqk
	opKmKw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gtjk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:22:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37e16f658abso2484973a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782822140; x=1783426940; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pgvqm2rFfWBgXUpd5Zjx1gkPEQkXSfAbfJSw5KWo2JM=;
        b=GOQOMsk5Q3XyZ5OyS7rOOBNIWzADtxZ8tIdq6t3Mb1PHF3z+74Hw5M7/LK41i8n++n
         KLM0ph9rCct437oHmbkSYrl542dfKcmv536PnpJ/Cv0WHm8vLXuxfB0QvV11ikLT+Vr2
         bAEhy8qfiWplr/grFP9g6lucP7ZE51YI4YSJPlaW4jV528uKsSqlgmHgjksjgHgQ7Uem
         XRpRUQY1OULeKF0cbmIAG8ymeiMrPYwaJsHExAykkOOSXJtttZKiPtvRoGeRjK7jE2i5
         42nhdaf8TIE2I8iMXYYhFUBcn5gntbG2Kx58xgSTaPAcYZ1aOxTIP00jNDFSfgGdTLJP
         L12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822140; x=1783426940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgvqm2rFfWBgXUpd5Zjx1gkPEQkXSfAbfJSw5KWo2JM=;
        b=AIs99hzSuiSdNhdag3zpVbDOsavnyT+OQj41WXPaa/PYJKC8aC7v0FBYSV3v6/5pxq
         nOT8iCWdvM3ZuLT453cLam/9T33fdTivKVoz+i6tqbaXaREwnsECd0wyoDFYiWe6x1KE
         WTZtcwYVgbWkLp9qzE7kgsvEujlySHZUnB1naHwjlYevA6gkYEsFzDdSl0z5YneQwanl
         bWlOsBd2Umo9Sf0vyLLgFySnQB88X2muOUTsaHsJkg9Ee0Xl/H4w8+QvrLU8Fe+MsxB9
         VssrBa3IMKCV7XXstQ2ExVuhGekzdgai1xduzXgx+lvM0T1XJ+WE24+2gNSc5m8SiT3H
         oUUg==
X-Gm-Message-State: AOJu0Yw86dE0VMbuckbCZ1yFH586TM22iaJuDWgZ5BrtPcunJnrXpKd9
	NTQHS6DyLk+7LI3whkLYqBnp2H6tyRhSrY72Q4NzEqJwEXfMqBqUPCZBmMcAuOwb4AYzDsDel9a
	wJNwCIKXX+/IXqOGkMYYaxQ4+tkK1VhNmEdEB75rXmaunwNq1VYN0pXj5YO6+q8ezeimN
X-Gm-Gg: AfdE7cneuv1lZbSaPfqtWIqS3kaNxJVMo7a0kP1JZrZ54RuL22zcNkfqarb4zHP7pLN
	M5e2stsJ0jzfps01fDJRWlUXACgolMoJB6MjF5RyZQeJLSKtqErtcrY18M7ggU25Hc2xyiHbzZ+
	f5hRlONoSb+wWdOY4NX2xXcUtuU+HGalEgUm2nZFXkTLS/zYtdaLorQJffQaJjsC1/OrHww8Uvr
	NeutBrx0Gxj/8C1x9YHzYmDUXUZZ5aGOZGSUV8qdL22asLNSftInPe2L7BhYQIIekVKpDKweN8p
	zVqNLkVF3a9vMq4NhxusG4Eg8BTjEWn3zhcN8gT4hwy94M6Qt/dUmse2b1PJTUtgSIiMA9wGMCf
	geQA6VDp4gZIrwjoollWDLCcIGEMrPX/WA2v9n72KnDYN
X-Received: by 2002:a17:90a:d444:b0:37f:fd1f:d31f with SMTP id 98e67ed59e1d1-38052727020mr2275744a91.22.1782822139574;
        Tue, 30 Jun 2026 05:22:19 -0700 (PDT)
X-Received: by 2002:a17:90a:d444:b0:37f:fd1f:d31f with SMTP id 98e67ed59e1d1-38052727020mr2275726a91.22.1782822139118;
        Tue, 30 Jun 2026 05:22:19 -0700 (PDT)
Received: from [10.217.219.96] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38052737fbesm1689764a91.0.2026.06.30.05.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:22:18 -0700 (PDT)
Message-ID: <dbfbea2a-ee64-490c-944c-623aea2081bf@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 17:52:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: geni-se: Increase MAX_GENI_CFG_RAMn_CNT to
 1020
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522-qup-se-increase-ram-cnt-v1-1-71854d0b2ef0@oss.qualcomm.com>
 <09fb9e91-2585-4cb5-8bfb-92df304e9d6c@oss.qualcomm.com>
 <a8abd808-7b78-405e-9290-45052ab1fb5f@oss.qualcomm.com>
 <5363525f-9440-49bd-83db-242a7ed4e15d@oss.qualcomm.com>
 <9e57f91b-8f80-41d4-b50f-31c900cb0fd0@oss.qualcomm.com>
 <79520895-f584-47e1-8206-3b7c06b759d4@oss.qualcomm.com>
 <d35d0475-89b8-43f5-b91c-4187e9e6c145@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <d35d0475-89b8-43f5-b91c-4187e9e6c145@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNCBTYWx0ZWRfX4YoRqG2w6Om0
 o4quEmXPrRi1JL8CIKQF/Jn9zoVyRuBAZOFucZ1nk/YUCkwHz0Wm7KZ2cKbJGOojc1BiP0eC2M3
 cmnxfeY4bqOAowz28V5kdI7VtkmGx4M=
X-Proofpoint-ORIG-GUID: l6vlde1Q3A4weLLsmLfRb0hF-gtfkipA
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43b4fc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EZYV8KM7Itfb_C3Mc5EA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNCBTYWx0ZWRfX/tl112EYHmQN
 99Eu1lQvwq7b3vBOI57KFqpI/Db6Ekcm4Sz98oiLS77xM3IdB1O+fAn6UTpjkdfwl/ZWEEohZMK
 diiUoenybrn1EiN/N6j++gvkSkaSV6ZKnR+YKQdYre9R8scfBumuUOLsHunQDGksbjkCyNhZ08M
 EJPSVZE+pMvfQudYkQ9/LkiMaiv4b/atsJw4Ct+8hGVXfxDtvtqRJp8q5Sv7O7ssM1z1ji4infp
 CD6NMpJ75BrXu8qNwuWRnqhK7Apc5K96pbE5z7f+IT3kX90Vc/2HtyOn4/2BvWv/a8ftLEAPWJj
 gYhLsswmwiR9Kq2x6BXGx6RyKPYio3Er8AfvjluGrtOKyMZWKj7+OCueYmpK1MJIF+dSfA2oj2u
 6OKi+sjV2K6GiImJywI8AIBS/aCwy25Wq80U5rU4uQYy/3cENAozOJfylzTtzdvwultT5pcqwD/
 d1cpNMvTDm1j9rX2DQA==
X-Proofpoint-GUID: l6vlde1Q3A4weLLsmLfRb0hF-gtfkipA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115410-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AC636E41F9



On 6/23/2026 12:20 PM, Konrad Dybcio wrote:
> On 6/22/26 7:15 PM, Viken Dadhaniya wrote:
>>
>>
>> On 6/15/2026 5:30 PM, Konrad Dybcio wrote:
>>> On 6/15/26 2:00 PM, Konrad Dybcio wrote:
>>>> On 6/15/26 7:28 AM, Viken Dadhaniya wrote:
>>>>>
>>>>>
>>>>> On 6/9/2026 8:40 PM, Konrad Dybcio wrote:
>>>>>> On 5/22/26 9:21 AM, Viken Dadhaniya wrote:
>>>>>>> The current MAX_GENI_CFG_RAMn_CNT value of 455 is insufficient for
>>>>>>> certain Qualcomm SoCs whose GENI firmware requires up to 1020 RAM
>>>>>>> entries, causing incorrect bounds checking and preventing firmware
>>>>>>> loading on those targets.
>>>>>>>
>>>>>>> Increase MAX_GENI_CFG_RAMn_CNT to 1020 to match the hardware-supported
>>>>>>> limit and ensure correct handling of configuration RAM regions across
>>>>>>> GENI-based SE blocks.
>>>>>>>
>>>>>>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  drivers/soc/qcom/qcom-geni-se.c | 2 +-
>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>>>>>>> index cd1779b6a91a..d0810960f3da 100644
>>>>>>> --- a/drivers/soc/qcom/qcom-geni-se.c
>>>>>>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>>>>>>> @@ -152,7 +152,7 @@ struct se_fw_hdr {
>>>>>>>  /*Magic numbers*/
>>>>>>>  #define SE_MAGIC_NUM			0x57464553
>>>>>>>  
>>>>>>> -#define MAX_GENI_CFG_RAMn_CNT		455
>>>>>>> +#define MAX_GENI_CFG_RAMn_CNT		1020
>>>>>>
>>>>>> Is there any SoC where this could overflow the register space
>>>>>> (you say "certain Qualcomm SoCs")?
>>>>>
>>>>> Yes, on Talos (QCS615), the firmware image needs more than 455 CFG RAM
>>>>> entries, so the previous limit could overflow.
>>>>
>>>> What I'm asking is whether the size of the RAM on any of the SoCs
>>>> is less than 455 (the previous limit)
>>>
>>> *Less than 1020 (the new limit), of course..
>>>
>>> Konrad
>>
>> Yes, some SoCs like kodiak, monaco and lemans have CFG RAM smaller than
>> 455. But MAX_GENI_CFG_RAMn_CNT is only a firmware ceiling; the actual
>> programmed size comes from the firmware header. Talos needs ~650 items,
>> so the old 455 limit rejects valid firmware. Raising it to 1020 fixes
>> that without changing programming behavior.
> 
> OK
> 
> I tried to find whether there's a "ram size" register to limit it further
> (i.e. have a different upper bound for different platforms), but there
> doesn't seem to be one.. unless we can deduce it from the version
> register?
> 
> Konrad

Actually, there is: SE_HW_PARAM_2 has a PROG_RAM_DEPTH field that gives the
exact CFG RAM depth for the instance. We can read it at runtime and use it
as the upper bound directly, which makes the check accurate for all SoCs
without hard-coding any constant.

Will address this in v2.

