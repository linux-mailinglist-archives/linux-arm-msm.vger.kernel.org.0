Return-Path: <linux-arm-msm+bounces-114050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yjzkHwhuOWqjsgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 19:16:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F456B16BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 19:16:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Os2trBkI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="F1/YuRLV";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114050-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114050-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22FD83036CC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444A6341AC7;
	Mon, 22 Jun 2026 17:16:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA39C2E7F39
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 17:16:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782148568; cv=none; b=KL8Ncg9peHcocNQH2dPTbBGkO3jJssHlPyMV6j2XSGQh8pw+JMf0q/t/dKzTfAJNb75PrmnHFX9GtngNG833xl/Qm67eQURxThHvacCQ38eI7jeedSzaPYHCCRi08iNpDqLIWYnQ7TGO6pJpYimAIwpqGPeW/KyBFjoahbhC7uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782148568; c=relaxed/simple;
	bh=72L/mPDdlWA4TZSfpT2xRG8P8v2mi58khmTS2oj76q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MC54/eqXIgb9WSkB3Kb/9EkhbzaFQbcwnlPnoWJbD/2ekKLA3wKOqybW+S68Sigs1KAc4q5pKv0JKyS7NprFgLax704V/ySYRkdjD2Il19hlJAX1QQY7Fnv+aWJDJhov/9dcjlhRlL6shnbWNFbSSgNXqS3fe5WsB/TOJRwbmr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Os2trBkI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F1/YuRLV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MFXJPS1675348
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 17:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ReRUa+UsU9G9mReMcV2Z7heBlBD3bMPzdoBkYCqwmeA=; b=Os2trBkIs+z/uag3
	mytEcE292w5b0C2HTOJnEjOsksZCj1ecs1EyE7ltvvYK+vLaeNASPWxtzMtl1z+B
	EgBkKsT0nNjL0CR78my3q+TSsDV2oLiIe+DVUd3Mp3qavq9O/7Ki4wikFXCnwADY
	vLZT7VnRMRPqIfToHmxlUDb7UJRK9Xo3Y3aM5JC+hNvF70e8vQiSQ5i3n3gmJwco
	sOIbgUkG9qGpIu73p+Vjad9XAQ8gCjh67UxlW4CX8jFArApDKDgAe7XJIv6AFIsE
	fGXOh7NPuu7RzIyAit2VS18fQciIkfGmk72jriXdmQ45rpOPPFu46ybW2lvJ64CC
	yuHrGw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey6tmrpwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 17:16:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6bf305403so42348725ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 10:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782148564; x=1782753364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ReRUa+UsU9G9mReMcV2Z7heBlBD3bMPzdoBkYCqwmeA=;
        b=F1/YuRLVxA2HcwqryUik/LPopglbU8v3uidq/qW/I8258Hc6zHPQN/Ogamolw4qIpB
         9+y14nvQmEAVu/uQfaI86oUdGu/oDvUkQEenWCFueg0gdMg8CMpH6C+MNcE/zuJLAHER
         FdW8D/i2zH69nHtjIV2BI3bN5rQPP25ANuEPfztPgD/2Xh7ANKxFPIHRw9/tnq9JdLfj
         DGgP/BWAuY2rw47k3PgT5i0B0ZH/Mk5zMSCwGOO9jL0eVt9nyKsqAwBcJSfknaOOuFAe
         kNbIHHt1UC9CGxp66RlRQmSrCh6Q5CXZPUEOs2wtJGrhGa2ZlfoNUfSYBnV0nsX/zh6R
         sL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782148564; x=1782753364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReRUa+UsU9G9mReMcV2Z7heBlBD3bMPzdoBkYCqwmeA=;
        b=VXNNPWVtkV05nCUepQgnQ/R+JBj6+McR0VQeRl+RZFuQzLH6PpeBaRH+qdgutN8IFW
         xHQukpcAbcDlwqNoAkPVhfGTyxRBmyEjJQYMZU8xXG7LNBZtcx8fsael1ILjhMAKaHTI
         b+Z+HJnYGCOAOd3n8dxzNzRD4ZWPxf3FaZeCtSm4u3OdH5VDLx0o/2XksQzAddad+kPx
         k4YGHATLumGOu5dzFRoDgnUzGooHaZJ6ccfLWs5PqcoYEoe8YEFfuF+p2nLFyWPrxslD
         e8czcvTA1FgxAg6MIzSaygyTve6XTQ1njsm3q17mr7KNRyLVXZYuyKd2TQNpYD9nCTZs
         OBzA==
X-Gm-Message-State: AOJu0Yx+cmYdS22Q5d2nCPUZnITp2c8BbKq9EqJwJp6xggODV343vT9b
	6XBtaWGUgApLPafp/LoDLLaeQcyIYQACTmTAD/2IQ5QBwbu5+QTcltBsKZm7rQZxw8JIEhGBll5
	inPiu737z3p52KT1+PTZVuWBglE6JZVtitGNsdEVAwh3w8Ka/g3SH5u0LTSCVEOmnIJ2Oy8sv5D
	5T
X-Gm-Gg: AfdE7cl8R7YTJ7IxEZQ9pkZmELRD9qMnnrk1oLpE8qwENPp1t+AiZKrZw1W9wBChuif
	yhS8TrmLc4YQmPXkJ6gkt/2SJANn6d9IY8va6YkTCfUjrMSOUoIJcJHmohGrzw/12qY27rcZCZ/
	PsMPVsXFb5G3mMdIKNcb/v2fabSAiiN9PzwBRjC97af9m9Po5hcB4D18czlrf14pVzE7zvL0muk
	1pZxD4ICEmZM5JJwxC6ergb1wYKh0CW+Xk2YlmUZXOMt4JdhLHhrJDNQm+ThceMe1blqhIxpkb5
	V4fOwKPRge1v/j+2cen9XF1XgMQgQwJ8udOAcAzuHomKL4P0HfT0mQoBJREkOqMqC4D9PP/9QTk
	AqikahrQfqJhpeZYOssYIuNCjnmVOC5AnrkKCm6sQ5uX9N4M=
X-Received: by 2002:a17:902:da8a:b0:2bf:77b2:8b2d with SMTP id d9443c01a7336-2c725d70645mr152178655ad.30.1782148563496;
        Mon, 22 Jun 2026 10:16:03 -0700 (PDT)
X-Received: by 2002:a17:902:da8a:b0:2bf:77b2:8b2d with SMTP id d9443c01a7336-2c725d70645mr152178015ad.30.1782148562656;
        Mon, 22 Jun 2026 10:16:02 -0700 (PDT)
Received: from [192.168.1.19] ([106.222.233.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfdc97sm101691915ad.65.2026.06.22.10.16.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 10:16:02 -0700 (PDT)
Message-ID: <79520895-f584-47e1-8206-3b7c06b759d4@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 22:45:58 +0530
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
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <9e57f91b-8f80-41d4-b50f-31c900cb0fd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE2OCBTYWx0ZWRfX5mvMLhs8hm21
 fbyu8SXknC0z4APPvQL34d0bDo5jBty8pZsOyICJsd6JPO6WK07U4jxSSR0SMi0IuZ0CjI0gunq
 EWleAra+sOVTUvx45yYzgc5zgbZaQjc=
X-Proofpoint-GUID: 0thxCjuwBS7PfRfCqn8MEIh2YPX0yV9L
X-Proofpoint-ORIG-GUID: 0thxCjuwBS7PfRfCqn8MEIh2YPX0yV9L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE2OCBTYWx0ZWRfXy3Gr45B5lDwN
 BB3ViXkrKlBxlSFJlNC2/IxS5Cd0Ms3yQAqdSvMhQ17jgSALCEFCaUMW+8R/L44F/Yo0kw0afkA
 C6ddDux0m+5Tus94kUIIEwg2vhPaEiV0jxIOGH+Fzl47IrR8jUzo7sruUBVsK1qRAsfJ0Vpf7w4
 afyzMMBhllCW6Xr+R6Wsm9986qq/1rqJCNmaKXWM5r5P8dYjuIxdsLWBn64gMnPIt5/N3TVol4m
 uwEiYAZKTN1bJGbrajmX7TarLAp4l8idcn1BGoqQp95jvsmPYhfoOkQ90Yl17t1c7FVQp4QKc0o
 5vrnqE9oQ/3JthLnc3C2cdaC0SObZ6KfTGRVhkYwRl14i/fr18XuBADVJlvIzokpYku57QYjT9P
 wBs7h8GFgprBMA/QwBTPJHmE83WXfYdpgwvMqXcpvEi8YFQd1ORHWv/b1aqI/cCO2Ggu7SsR0GC
 G/WU+VHhePNsW9PXCPQ==
X-Authority-Analysis: v=2.4 cv=H4HrBeYi c=1 sm=1 tr=0 ts=6a396dd4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=HXD670HYuRgJgDrgkXnM1A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3Itzvz1JomGL4-STCREA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220168
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114050-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: 38F456B16BB



On 6/15/2026 5:30 PM, Konrad Dybcio wrote:
> On 6/15/26 2:00 PM, Konrad Dybcio wrote:
>> On 6/15/26 7:28 AM, Viken Dadhaniya wrote:
>>>
>>>
>>> On 6/9/2026 8:40 PM, Konrad Dybcio wrote:
>>>> On 5/22/26 9:21 AM, Viken Dadhaniya wrote:
>>>>> The current MAX_GENI_CFG_RAMn_CNT value of 455 is insufficient for
>>>>> certain Qualcomm SoCs whose GENI firmware requires up to 1020 RAM
>>>>> entries, causing incorrect bounds checking and preventing firmware
>>>>> loading on those targets.
>>>>>
>>>>> Increase MAX_GENI_CFG_RAMn_CNT to 1020 to match the hardware-supported
>>>>> limit and ensure correct handling of configuration RAM regions across
>>>>> GENI-based SE blocks.
>>>>>
>>>>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/soc/qcom/qcom-geni-se.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>>>>> index cd1779b6a91a..d0810960f3da 100644
>>>>> --- a/drivers/soc/qcom/qcom-geni-se.c
>>>>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>>>>> @@ -152,7 +152,7 @@ struct se_fw_hdr {
>>>>>  /*Magic numbers*/
>>>>>  #define SE_MAGIC_NUM			0x57464553
>>>>>  
>>>>> -#define MAX_GENI_CFG_RAMn_CNT		455
>>>>> +#define MAX_GENI_CFG_RAMn_CNT		1020
>>>>
>>>> Is there any SoC where this could overflow the register space
>>>> (you say "certain Qualcomm SoCs")?
>>>
>>> Yes, on Talos (QCS615), the firmware image needs more than 455 CFG RAM
>>> entries, so the previous limit could overflow.
>>
>> What I'm asking is whether the size of the RAM on any of the SoCs
>> is less than 455 (the previous limit)
> 
> *Less than 1020 (the new limit), of course..
> 
> Konrad

Yes, some SoCs like kodiak, monaco and lemans have CFG RAM smaller than
455. But MAX_GENI_CFG_RAMn_CNT is only a firmware ceiling; the actual
programmed size comes from the firmware header. Talos needs ~650 items,
so the old 455 limit rejects valid firmware. Raising it to 1020 fixes
that without changing programming behavior.

Regards,
Viken



