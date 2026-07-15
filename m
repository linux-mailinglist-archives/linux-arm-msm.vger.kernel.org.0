Return-Path: <linux-arm-msm+bounces-119189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AL35L8FSV2olJQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:28:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F1C75C7D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:28:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ls5F5+xQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j6IW4RFT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119189-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119189-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C50723001474
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C535429023;
	Wed, 15 Jul 2026 09:28:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8886442901F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:28:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107711; cv=none; b=Knd2xf6pj0m0sgTSUBj0WFSpXOawkdpjUtVoLz+sKO6qcxDBxnWyW6duNxPysB1/TpVV90GIVUXiniKyTLsQ+mUmBOCglSeIYp56VB4MReiIW4qk7gVUcoqeVppLn4xMzjzQcZA2pMSlfSqVGbC71qLGArdLncJfI6cwB3LTdFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107711; c=relaxed/simple;
	bh=L6ej++8UpylgEjQY/DX/hMRSU46kfmdMNZsHvr8wlHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPjb77C7t8a0+ckkiI85u776JyjLxiv5LLaoOg2LOZiHUagtNOqZ+FpMYo8ywAvSViaOL+E2WP0ar6bScf9JY4++e5lfv1oyh01lpeiSb1AKkkF+JE7ie5EmJZXYuBqQcecIyk7bgBWFjjVCN0Q0Pbb9IFnVbVhBWiVNj2f50Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ls5F5+xQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6IW4RFT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9Rdrf3144719
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AP8nMGePrwJBuZJet7pj5q90N1nit7OreF2IYhy7kTk=; b=ls5F5+xQYYJvWcQ/
	0O66Ivkk1FBj2m6Bh89lt9n5OGFuosp9buKJNfGsL2jBeu9+uARtOi5ugMKLqc/u
	G4yBvkrGJOWKuTLvgggwUYt1tnXJC68mqIfq0X6/z/J5CsfdS4R7Sy52RBzJRnrL
	iljUtzmTZJiayZdICLboolI+T7RmC9HUlnRkQxSJUQFzXDoHeZ+LTSL+fwj4PY9D
	28FwJkY/B3cjumHM5eXYNAzW2Y1Mo4rin9Ho4a2b4AmJ+P2dKvKhLm/UziFt/MC+
	rg3vmmK/sy6TVoyB5iEpRsRH5m+sg1rl41klNSNfwnRN24M0m/BYKb5zrupiqeWa
	9qYHLA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7ka805k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:28:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ca37ce4c3so9668301cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784107706; x=1784712506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AP8nMGePrwJBuZJet7pj5q90N1nit7OreF2IYhy7kTk=;
        b=j6IW4RFTgpet5kR4nSwyk32x+9oxcDk7D+t4dgUUHghl2XVA8iXhlCRuhyHywVb8TV
         jRvhlzij2ucIGiOrN7ePBg+ioMR8p3UTN/3jmk6hy8etierVJ9VCf+++crwZ3p0cCCE/
         Stqrau2VgJqXDILKbf6H8ixVF2g14MsCLUe/Qivvk7bQLhyJEHX25fBpuBP1fPgNMA4/
         4I4I63Y7VACpy9zWv6npRYssmBoRJFonInjoCf3+kOF3LjGpm2QcHfTD/YTIQBdtOXN6
         wO7nnDZVZ4y2MEFVWJn6zXodxWy0Qwng/kIk4e1/zQf2NCYQbjGfrGmXOmc0iFghruOU
         1TKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784107706; x=1784712506;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AP8nMGePrwJBuZJet7pj5q90N1nit7OreF2IYhy7kTk=;
        b=iBLq3KbkB/r7orDQMcLqxEaILy93tuQOB5vRlsJcSSRIPElNmEpZ090BSscHypLPdY
         ZGIiA1X7WOeOLRxMFYtNYbyHhQXTMqCg3vGWTDxg6YFoZaaSleSCo/yulTiHTD1N3kXT
         mWrzrpXasRKXsfbV3DYxnhO5q9V96ZW2dl/2hfyP83NbE1wqFT73lvSn0gq1SE/Phs51
         A4DzfDXzHVhywMFFw6vlyulIIykfK3W6FrNYmfNE/1XQ9l1xnKPp95PZ67QHx/V62W3b
         ndWmuirpD+0kcsQ8D/ArxMgQNTClolvFkYWkTkEBaN4NYlAtinJYjeJym2Sfb0oClImO
         e+fQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJugOx/3JAzjJr2yddXqNEWNfn2xeBxodDHfs3jccFf0OvuwERyyv4Ouhs2of3SyXUVniF4jITquuubnVF@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy9ROQlhNQ/wVlWw2jy89Z4pxOdH5I34FC97OH1WzATAaoLmOj
	L4fJCKO0B/5muBix/Un6PJeYbb4SRvZ1GaNqlpShHxt6ztkfMIKrF1y3gyhE5HEVg1BDAOxBWOw
	2nzNVo5NtLHEgwgK0XSfiaeEZdt6Rt4jfMKIi91cDUat3bBlwJPoID1Sm9jhmkOC4bufH
X-Gm-Gg: AfdE7cmLs9iFZHnkkuDQh1PaQ5F7v1p8MTRxbUO1oUiTu/L3JLiSQYpDMErnBFKfxkS
	GzECDf3Vse+gwP2m/uOaRoTMZSIsTN4QNexiO05Z8IABQC1AqCz2RhpaVHkHeDmywZXIHWcnFx6
	PYG6BLODblUiG7NOdPPtQOhUeEVKrpijiP7Qnqwgxx9ukuUg19dmA1DBmzhEpmJfplbTr2fQXXe
	MvJWwDH4jXfkjxajMIKgbvY3LR5mByr3a40EVkMyDJAj747SaAFrac65sN+G587loJsGVE7l0PZ
	47OUrrKuz5nERQwZsSzjZ0B2FwqhvgFnF617cEafknWUmj+0BmpN+aH4ZyirxFkaPnCdJkUtXot
	Dv5Wj12bD3sjlFUfhZS4y9rnfBCVCdpK8XK8=
X-Received: by 2002:ac8:5d05:0:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51cbf170c31mr134548121cf.5.1784107706456;
        Wed, 15 Jul 2026 02:28:26 -0700 (PDT)
X-Received: by 2002:ac8:5d05:0:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51cbf170c31mr134547881cf.5.1784107706012;
        Wed, 15 Jul 2026 02:28:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c165a9b7c73sm300603066b.9.2026.07.15.02.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:28:23 -0700 (PDT)
Message-ID: <3f5430ae-7c8b-445a-a980-22c8fa8122ff@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:28:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm2290: Hook up MPM
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
References: <20231215-topic-mpm_dt-v1-0-c6636fc75ce3@linaro.org>
 <CGME20260709114143eucas1p18463122323bdeae8e63b1d13cd626b55@eucas1p1.samsung.com>
 <20231215-topic-mpm_dt-v1-3-c6636fc75ce3@linaro.org>
 <dadff7a9-bf04-49fb-8c55-5605e99be7fc@samsung.com>
 <CAPx+jO9d1qH12mxg-n1rkbp6Xd__sdrSMeoc7CPELE+jgxRYHA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAPx+jO9d1qH12mxg-n1rkbp6Xd__sdrSMeoc7CPELE+jgxRYHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a5752bb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=hD80L64hAAAA:8 a=KKAkSRfTAAAA:8 a=MDPXCrVRUyKAm27fIg4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: X7qLE0ikbO3gZiCJtQL0sHD8Jvafd7J7
X-Proofpoint-ORIG-GUID: X7qLE0ikbO3gZiCJtQL0sHD8Jvafd7J7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5MSBTYWx0ZWRfXzgD4tHggetHQ
 jqTL05OXaqPjD8WeOlHonw76GifaTFIfNc9g/DxtGkrd9gqwlwYyh4G8z8BrbZaDI9TLJSYvGt2
 TqK5HRKIdaUXRwfRCd4u40rwLSysHN8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5MSBTYWx0ZWRfXwjn76g4/0Ezg
 YSVIXS3jX4ZzHu/vjMTCu3oFEWQSGmTamF/o4G8/WfITKmqFF7WHTIfkDpqwbTnFw609npIsXvD
 frB89cv7h7vL+0kd9sxq+pnWe6cbbNhw4GS+014KeUcc0LzmNP+JHhrEhGG2lizMjvwcgsylD23
 baqZNuJKf9G4833jCy6ZBnaNci2WM8sH+l5yKR9LgPzKmIj/5aNEL7sbMP91iP5WOWA7+OPYmfp
 NQjyqK23bYH3nZWkBAlH3V+CGCaj/guMq7dt2d4FqhPBGin9S+dqtabD/Yhjeehcldpz+447q1+
 kpatdVTR2zyU3m86L3IfNVsrAmB3MOplkX1BSs811QvaWHqYTYJELuHGC8IzFOzxhQc/863UGXp
 /zD/ENTD2pwhMePbXZaga0otMPdsFpCyVwowWrgsiaMdFOPwTBk+1t1+rllcc3zYF3Nwubm73Ld
 yapfV9VY2R+ZN63A2tQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119189-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ulf.hansson@oss.qualcomm.com,m:m.szyprowski@samsung.com,m:konradybcio@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:robh+dt@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:konrad.dybcio@somainline.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ulf.hansson@linaro.org,m:linux-pm@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,samsung.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56F1C75C7D3

On 7/14/26 3:04 PM, Ulf Hansson wrote:
> On Thu, Jul 9, 2026 at 1:41 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>>
>> On 15.12.2023 01:01, Konrad Dybcio wrote:
>>> Wire up MPM and the interrupts it provides.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 42 +++++++++++++++++++++++++++++------
>>>  1 file changed, 35 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>> index ce04d0acdede..0911fb08ed63 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>> @@ -199,6 +199,7 @@ CPU_PD3: power-domain-cpu3 {
>>>
>>>               CLUSTER_PD: power-domain-cpu-cluster {
>>>                       #power-domain-cells = <0>;
>>> +                     power-domains = <&mpm>;
>>>                       domain-idle-states = <&CLUSTER_SLEEP>;
>>>               };
>>>       };
>>
>>
>> This patch landed long time ago in mainline as commit e3f6a6994041
>> ("arm64: dts: qcom: qcm2290: Hook up MPM").
> 
> Without detailed HW expertise (still learning about the UnoQ), it
> looks to me that the HW may have been modelled upside down.
> 
> The power-domain-cpu-cluster should probably *not* be the consumer of
> the mpm, but rather the opposite. This is how qcom,rpmh-rsc works, for
> example.

I think that's right - we only need the "CPU_SS going off" notification

Konrad

