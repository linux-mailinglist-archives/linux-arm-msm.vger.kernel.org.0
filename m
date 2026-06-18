Return-Path: <linux-arm-msm+bounces-113700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ze90B4qrM2qKEwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:25:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDEA69E6FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:25:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iqXj3NZi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jHd14Qbx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113700-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113700-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E34BB30074E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 08:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF35B394471;
	Thu, 18 Jun 2026 08:25:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B513E357CEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 08:25:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771140; cv=none; b=IVsNF98cdfb5VOqzIu2yWTwCjAns/mOvdQf+gToz4orObUlRLfZEqQtY1SyhXt5f698tzul6BQKV9p/Xvl75wHmlUpTXIqNFjsYeemARmku+HnjKvS/ETUttnE7DiNZBgYcsPR57rJOsQc6fX0at4zuHEDWb87v88wPt1FKAz2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771140; c=relaxed/simple;
	bh=pm2VtnvqcvMnJSio6ia4u9khRcw61jB8oisjRb+xz3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJ+deHiRk+6hFqtZplZSB2VxafGQVJuc4k+dM0sxz50+tBmzLmg1Ytta7o5DTRiL9RVlgOi+plE94qv12y24D8Cl0YULOji5qiFgAVg6DVvPah6fBV9bHcb+UJ8Aj7Nn3TJJDdzsvHRwUH/raTNSjd774MlgUmRlsKGTCdZqRLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqXj3NZi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHd14Qbx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8Fa101011239
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 08:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MeDmhxrvASjNeDkV1hsiBNxFRH8Rp1diigHnmLO3HNg=; b=iqXj3NZiFMBRoReQ
	+SkKV0A8A04bmQsPqJqGL1N/ACL2daDUgNmcKQgqVpNraxlQQfhnk5AEMwlPdLCC
	qezhLFZr7gEw6XuGnTXihm60nc7Xk0hPV2E3W9PMtNpBEuJTQj0ILiuDSa1bUCyO
	Q72SOsuD4ankMrubFUkAgfkZxkbrmjJkGMoDF9LOf8S0tOElPOovSnPmi9ja66sn
	iUivhB+ciTxVftZ5tMRg2eXDxf/D3oc3bqKtTT0Kf6xHFgvJ2vriqioAc6cWrUnG
	O7/AVdTqumsWxEoJnu14RzFUSl4bvEKS441ME9TXEUChVK+KnDOkw1n9/pyVTqF+
	V42tUw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1rttcyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 08:25:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915ccc2d4d2so21008685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 01:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781771138; x=1782375938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MeDmhxrvASjNeDkV1hsiBNxFRH8Rp1diigHnmLO3HNg=;
        b=jHd14QbxcEVjbcnJKwM5XDQ2GDRy3YeX+x8CPQ3e5nikXFVVYsfcGI6TPqYQ2kFFgM
         ylyrV5L5gr9BUplxPCpWXLb+ScgxiRxeG91nf16ETiqcLAqA1iz3demvGRBqoe8LuQf5
         0xzpWO8shQQ+TVcTtCV0VXpYxWxEZJLqlOOs7yJzbxYhgNCbdVOHiIWURylANX3Fz8HE
         iCAbzj8VFDGKjhVZ5UnQitbJcmCq3MvYR6NaIAiGtiEJfTdpxM5B9kgqWt0iI7bmjrEL
         jfl1iDh3t4gDrxyXN1gAD/4/25/1GtX0vPzo4SkTfBWR/P/ZfqZGGodtn2OJSu14jPs6
         B6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781771138; x=1782375938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MeDmhxrvASjNeDkV1hsiBNxFRH8Rp1diigHnmLO3HNg=;
        b=Kj1GKBalBy9+jJy7wLPQPrn6+70sLPltMdzYxeaJf22WAB6ue3crSgOMyh8mUJuh2Q
         kOMiT+rt23/Laym9y3FT/4XxSmIcdKMuqQ0hr+GmTLs2KehNsp9bDvPRcMVQ7wzkkChq
         DftN7XBBHxUiXpKXHt1wfdJzrcO+3MoBA47O2hhXIx0cfwyG9qWzBeJmHp8b/ql5yP3g
         Lc9dtdC4NhQid2drgwY5/aOah4SuDoPjS4a4t9jaPFGWI3HPz3kENWWw/wY+GXNFc5jG
         z35bQPNrFWpUYGpcx/uH0s2+TTbSXzGb0YBZymoxbE8OZ7xnc8GOn5hFcdZyS+DpTng6
         L5bg==
X-Gm-Message-State: AOJu0YxeCmceP1toX3YUEKAmDdAQiFLoGSOMeoXVdJ2u65f88mlCSS7j
	zd2QVY2MFnu4IJK02jXeZE0sMJuEBc2h6u6ZWw465LfeZnsuoQPDGgeYgCa/y4rwm52FpzffZqs
	6K4uC8bSb2HWd/oR+DM1HYeH40GXacWqZlcJxASnZG+coBU/kXlaG7K/C2M6Ta2wxBLsf
X-Gm-Gg: Acq92OHGAMvwrTwNtP0PICLDtvv3R8kUbeGCD964sOcJergt0yTThlry+VvyBFKpqJw
	D4ttc4NDYLHivY+uVq823o03dQbsHVKarqR0JCdLeM9ygDVP4LgmG9e1UuhoU9fpO0/AvRrbilG
	JOjzgf3k91olmutBJmLX06SPNkaI4pXjRXMZtj9YFEhK5NX4P7koQNxkcuUuC+llTdFLxtKvA5Y
	pi86dmf/ZG/3X5ujxopqUOJH6JHldCRdjMprFrdNMNVW4wR4czyMRC4kWJlrALrt4EygizaiEOe
	/Q7Bm/8Eksrq4y0BfcEFACEEsaYiuGDUHppDv80wAW7Qt5c9kd3B+GgBZ0lAxcDKIWV97iUY55A
	GcbT7jUUR1hqJudaugzP9/E4rOwgrSSbrVh4=
X-Received: by 2002:a05:620a:17ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91f24ff5a51mr259245685a.0.1781771138028;
        Thu, 18 Jun 2026 01:25:38 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91f24ff5a51mr259243985a.0.1781771137655;
        Thu, 18 Jun 2026 01:25:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6954c2a4450sm1871940a12.16.2026.06.18.01.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 01:25:36 -0700 (PDT)
Message-ID: <c039b31f-fc14-4a0a-bd77-dce00ae36eb2@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 10:25:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: x1e80100: Add deepest idle state
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-8-4d8e1504ea75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-8-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MNpQXsZl c=1 sm=1 tr=0 ts=6a33ab82 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=LGoL8ljZ1bDskmoh4PAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA3NiBTYWx0ZWRfX38N2sLpN8I+T
 7uLxlV9YLgAqtRQLqEGcoa9SEOkCfBf3cJlqDPujtLLYtMhcSSTSmbcY3Xc7k+59LFOhB1dZMNH
 ykhRB8oFNaLN4D3sa/wVeSIphsLT8MLCXO3jHDrjzaNc0xM6S2LuJ2quTSCC1rk6K0c9gJ6idMg
 E4J2Zj+hGPJNjGnIKuBL9gZMSgWukSz3eDcAkHZQ950FoWkTbXs67SHZsmldUPVqO86ogjAsyGy
 HiC92qwKk094lUgSaiflXmkCxppdSAH7svB4hKTNqH0nuWyvnaNoHILAR0hJ8OCWtInUwMYMcSf
 1SHABNRLB1rffq/oXRV2Pvh6UwRk5XdP6rsbJc/aQtOLwbc1SfW1FCvkDqOzLDoJfuz/Aa9hrXW
 brczWiBXlP2zVSCYyqwa3nRjH7aV+cn1AseX3ah/DVTWPMAXVezNlKwSu/hvg9nkTxL1NO2YY/2
 aBWAsPqT6Hhp11GQJ2Q==
X-Proofpoint-ORIG-GUID: P8BK1qBOymMLbHyZL21mF5rcJEInoDP7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA3NiBTYWx0ZWRfX3UwYRJwTszKA
 roIBp9pNGvJh6b/bFAKv0acpkeKjJfnxR8KoamyiWlu812cyzk95oZAx5MdDIuGql+vjcKLggzh
 50t4mblK8s7Y3Y/vno1RKJ3w+xbPCj0=
X-Proofpoint-GUID: P8BK1qBOymMLbHyZL21mF5rcJEInoDP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113700-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CDEA69E6FE

On 6/16/26 11:25 AM, Maulik Shah wrote:
> Add deepest idle state as GPIO IRQs can work as wakeup capable interrupts
> in deepest idle state.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 4ba751a65142..47e425003028 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -302,6 +302,14 @@ cluster_cl5: cluster-sleep-1 {
>  				exit-latency-us = <4000>;
>  				min-residency-us = <7000>;
>  			};
> +
> +			domain_ss3: domain-sleep-0 {
> +				compatible = "domain-idle-state";
> +				arm,psci-suspend-param = <0x0200c354>;
> +				entry-latency-us = <2800>;
> +				exit-latency-us = <4400>;

The DSDT has "wake_latency" (presumably the same as exit latency) set
to 5000 us, should we follow?

FWIW, the 2800/4400 numbers here are the exact same as for sm8650..
which doesn't sound very reassuring


> +				min-residency-us = <9000>;

This number matches the DSDT

Should the entry latency then be 9000 - 5000 = 4000?


On a separate note, the DSDT also defines:

SS1 (0x02000154, total=7500, exit=500)
SS2 (0x02000254, total=8000, exit=3000)

These are obviously shallower states, but perhaps they could still
be useful?

Konrad

