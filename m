Return-Path: <linux-arm-msm+bounces-113165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id euyFAn/pL2q1IwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:01:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 388BD685EDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:01:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eJVGbbY7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="B/gXOI/4";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113165-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113165-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BFCDA300CE8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DA63E5A08;
	Mon, 15 Jun 2026 12:00:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B6B3612EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:00:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524849; cv=none; b=TPP+gQtfRkW2DAYNbZRpc1aWno5q9/sETGQfNaxoPJtajiTlc+EkG5tsKrA0ZxKmxZ3d3LQshIpdTS/3kUj1sDxLsvE5fkdbzEt7SPga2dFVBMA78HZeKQV2KElWzKAwzr27KtS/gLQLuiiiyGm/Xa0BQVoGdK/y+tryMTjAurM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524849; c=relaxed/simple;
	bh=iNmIvlZ/mcJarand0aXfw4/Zfs15L5lBq3iRXAX/dbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PwiCo49iVYYfF2y/Yjy7VJrOL0qzdrTvuaNHNrbX82XAo07gOrhaKt9LSKwohug05NjtdPuuOx0SPgEIs5J5Lrj2/alyGxH9FoXoQCV5URTJIHiC98UYEhQcLWPPDbegTZHmWZ8vdK7UbB7aJiHTPkjNHt7/CH2qq2JKNsbOCrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eJVGbbY7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/gXOI/4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAqbuT270402
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/t3nYX2FjsvGv7wJFQitp38xpYZONGghVelaQH9NBq8=; b=eJVGbbY7ZfIqt0kg
	1De74m+/NqhstTYBH9LKMxFP7qoFl4O+tKuhe6alJQ/eKc6K7JObj+ZgD5sA4NPK
	STal55+puYnPBG7KWa8x719AIvBdWLjjItvDPtTQ8m1eLzPv3Jrd66YShsiT2Wdr
	OC+bMGOxLJZzXNMNSQtBpl1Hd4FVKCoAqsv6QvcPXCXMTelnqjT6Ktk8CkmomfJ4
	yv6qChapaUXqHq8/j0uo3w8IeEMFJEBDLtPFm2vakRkn+5RvUvJlHx+2z1zPkKar
	/mbehEbAeMWJIHENBKuYB9nRQUsVb6YJhkMjm6nHx3a1m6dpdBTP/4hZFbBrAL7k
	cf71eA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etegurme0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:00:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51968526a68so3159781cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781524845; x=1782129645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/t3nYX2FjsvGv7wJFQitp38xpYZONGghVelaQH9NBq8=;
        b=B/gXOI/4GMwMKzBjkwbJRGcvhZXore1lI3QvPa6HabR3daYXaKZhUzi0C8LFPmvnIW
         xUy+fk8fdb79QPZFUNsBmQdqZos74wQ+hI+1ZKIx6oJmg9ISPJwSF/rwhCarWEDW+2Zs
         reP8DJcZAby3wmXt5+5M6a3VrMn7Daxp1nNJ7PS1SNF0kg+pij1FfWzf9rL9eQ/iNxAg
         mnuTkbXvTKr6AoGbIZfia3GlSsCUEdgZ3AU9+SeZCOjnAz0tba4Tcdj99ABE1beQYVAl
         CLwzbChDZcCgwauXaQ+LxOnhRu4NPYD2wdPLh2nmF+xOLfEMCiVvQWofWypYwwNeh82U
         12qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524845; x=1782129645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/t3nYX2FjsvGv7wJFQitp38xpYZONGghVelaQH9NBq8=;
        b=i7m5rrbQXb8U+I6EHDwZs1U+h0eWWOa6DGwX5my991IslQljRkwWdlTdKN8/cMwSwx
         puv/1YWKriYchqmEW5mbGgHiDU53acJ9cnfJfyXDzOt2vinlbYf0B8Y0d+zUitXnkw/N
         DGapReudU4h2vFK2OABvaQmY9CO4eQlYQpP071sF59SEMGAQMi4qXh6ETc3Mes3ZC4DU
         48E9nXsRUNLk15R9gXr7jMO6pHyEtZw/CNQ4qnakpWBc+HuZSvml/6SPOkxaBML6vnbc
         7nvPXWiJPmLuaF9Gev6Mld+pzmJ0jLiiP8ntjTVQH8TLV+98xM+9rKH10+eBid6dA8+x
         GBxA==
X-Gm-Message-State: AOJu0YxIXpxDuUc1BPhxsDaa6ZRkqPlsjzD0cVygbhIC5F+sytT0xi07
	X5PaAIvZPMdfjNpjBKmGN12G5uH26AMuM7iuBZ1CmX7HRVYkZz8slN4Xf4XyDbFFYqJBcKQWRfV
	X32x2FAYsJQD+jJ4643CfZ/CC+q3w6NEPXL5iU+iSQiI6wnM6EpnZEuFbcZY9T7ztAQaG+HwTCM
	bK
X-Gm-Gg: Acq92OGW8ulgpQ74YU4Z1TO/T9Rw74vU+bTVzrfzrGi/klzKJiwr5Lm4PAKBJDf9hJY
	HHbNVbmAG7HqB2u0Wu8GNMmddbVb+TCxwGsEYsgc9Raie/ihLpiiaxAv7aEFAtN947uGwkRy+7M
	NPii6PJOw6yoJIbyao7JQVUADYoQsNpS/SomCFa52yAC7UaMHJiNWG5d5XfbgNgCh9J3hur/BQP
	iOaf+jzmRiWfZ5fuRmlV3Y7SSiGPrg/xJ8oLgFAD3CFK+jp/qOBfmGGOj1IFpiXiZk02kYdp9tu
	udRnFfjQAVCRkkfUGDXd/IE3HzRMEOrZEQ4vMOTzaF4db/5ABUXZxyqSjHtsGng7EG55c8g2Ke/
	ATRlAXHmmNwXRFa9PHwJDomv3Kn59N6SPX+zcaFFJ5JnKWQ==
X-Received: by 2002:a05:622a:6187:b0:517:6d82:9d7b with SMTP id d75a77b69052e-517fe22789dmr126375711cf.4.1781524844860;
        Mon, 15 Jun 2026 05:00:44 -0700 (PDT)
X-Received: by 2002:a05:622a:6187:b0:517:6d82:9d7b with SMTP id d75a77b69052e-517fe22789dmr126374931cf.4.1781524844267;
        Mon, 15 Jun 2026 05:00:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937919b556sm3319037a12.4.2026.06.15.05.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:00:43 -0700 (PDT)
Message-ID: <9e57f91b-8f80-41d4-b50f-31c900cb0fd0@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:00:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: geni-se: Increase MAX_GENI_CFG_RAMn_CNT to
 1020
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522-qup-se-increase-ram-cnt-v1-1-71854d0b2ef0@oss.qualcomm.com>
 <09fb9e91-2585-4cb5-8bfb-92df304e9d6c@oss.qualcomm.com>
 <a8abd808-7b78-405e-9290-45052ab1fb5f@oss.qualcomm.com>
 <5363525f-9440-49bd-83db-242a7ed4e15d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5363525f-9440-49bd-83db-242a7ed4e15d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNiBTYWx0ZWRfX9dBcp+V5o0bx
 Afm3LKboHoRpSEQHN430gUuxbwlD5vzLgN1l87T2bH+7KcrBfDxThWenBM1mXS2b9TvnIDA17k/
 yOJyibNF+3qD1mymEfKPGWU8XF1pyFyUwZYMNUIQVO272OnHMJgcYbHTsvcVACkyTWkPR0xiqZY
 avG3facKY1mTHMgh1MEbvEGT+n7ljCquxXD16dbG0x+XRx5W2Zva9mVG0Tp9qOMhJtmLrge19U7
 d6x9LCSIt1JfvXhkQr+VqAEUfJuIN4nh2Z2uYzB63EHNO8/xweiuY60RbPHwDv9yKm6TK0nr+nq
 XToFmwb3ji3r70FmeMZnovIbVQhpc/BIMXBl65SfUpnAWL0pJyKDbFC4omnNctxTZ/1WqrXrSaS
 zyfBpTcNwnGwLnt+Qf2G+eNilUbq6ixN2rKLmSOgTVGrD6X+McZgPd8aV7naRQcx12ixULrgFUB
 GiLaTornz8Iqa+pxqEQ==
X-Proofpoint-ORIG-GUID: qaWlcsDAEiIXhF5_dMyKP1I03cokmbq2
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a2fe96d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=lBRG9p681Fm1oGsCukcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNiBTYWx0ZWRfX1dSX4QLzyUgx
 BA0BqV1+85rTHZtmrV6pMw2WgB3VaIvmm+R3eLr6N7dbq4GQYtliZjlDdo+oUC1/dljjJCSepit
 YOtKgEnqJhuSCMbBUkWPRqlYSOLsyHQ=
X-Proofpoint-GUID: qaWlcsDAEiIXhF5_dMyKP1I03cokmbq2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113165-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:viken.dadhaniya@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 388BD685EDD

On 6/15/26 2:00 PM, Konrad Dybcio wrote:
> On 6/15/26 7:28 AM, Viken Dadhaniya wrote:
>>
>>
>> On 6/9/2026 8:40 PM, Konrad Dybcio wrote:
>>> On 5/22/26 9:21 AM, Viken Dadhaniya wrote:
>>>> The current MAX_GENI_CFG_RAMn_CNT value of 455 is insufficient for
>>>> certain Qualcomm SoCs whose GENI firmware requires up to 1020 RAM
>>>> entries, causing incorrect bounds checking and preventing firmware
>>>> loading on those targets.
>>>>
>>>> Increase MAX_GENI_CFG_RAMn_CNT to 1020 to match the hardware-supported
>>>> limit and ensure correct handling of configuration RAM regions across
>>>> GENI-based SE blocks.
>>>>
>>>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>>> ---
>>>>  drivers/soc/qcom/qcom-geni-se.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>>>> index cd1779b6a91a..d0810960f3da 100644
>>>> --- a/drivers/soc/qcom/qcom-geni-se.c
>>>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>>>> @@ -152,7 +152,7 @@ struct se_fw_hdr {
>>>>  /*Magic numbers*/
>>>>  #define SE_MAGIC_NUM			0x57464553
>>>>  
>>>> -#define MAX_GENI_CFG_RAMn_CNT		455
>>>> +#define MAX_GENI_CFG_RAMn_CNT		1020
>>>
>>> Is there any SoC where this could overflow the register space
>>> (you say "certain Qualcomm SoCs")?
>>
>> Yes, on Talos (QCS615), the firmware image needs more than 455 CFG RAM
>> entries, so the previous limit could overflow.
> 
> What I'm asking is whether the size of the RAM on any of the SoCs
> is less than 455 (the previous limit)

*Less than 1020 (the new limit), of course..

Konrad

