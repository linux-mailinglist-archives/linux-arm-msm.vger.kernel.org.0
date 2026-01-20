Return-Path: <linux-arm-msm+bounces-89846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBtrGglbcWnLGAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 00:02:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C68E15F35E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 00:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9666776C62B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 14:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54CE441051;
	Tue, 20 Jan 2026 14:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqSZX06w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HzoCPsYi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C3835C1A2
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768918380; cv=none; b=TzunH/D7XwoIgSLGnYnCxelzXu5nOM7uz0Sg6VZUoSM+i/A58a9TXrFDPsIy9zdW4c1p8SqIhzA5vmzJRozFnz5w0qwqgXFfVoO0AoqrH7aUegzYoMztIc0DFoB6OKSmKliMt4ZONUyQc77VpD4wuIb6VaSmR8QXaqU0FFvrx/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768918380; c=relaxed/simple;
	bh=YisKAKLmsEzq7as9dr6tbJOdgMgNjkPbMldhfyvZeIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sqQRAyZF7YIZnFClSj4zu/cCpAoKvKxZxOJvY8FBeF1YZYCxcqW1PT9frL9o5qGcgZYE89u+OankHzD2kQ1xvhTQcZbloN404xP9qG/ydcXuvhrAO2CRkSJLOkxQoS0kLRCYPqM9MpsbOxF36mkvyqvpXWC2HDrervu6SHOgj40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqSZX06w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HzoCPsYi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KCrcEO877854
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EHBfsKrItXne6uZzgw/96JIwvuMEC+kFda/9wO1JJ/Q=; b=LqSZX06w8/zufVqy
	Pmb5AdcwYg9oKFdBNypfjr8ReB5v7hZJGnZ7yNT6e0s5AVtPzL8e3tfVQjhDgiqh
	uIfgCI1xM1nn9fxNgK37M0TzoUKtmNCdmmkx0FfBHLq+IGrLv/pyHJaeXQMCBfly
	BbNv3j0YLtXdpu5SPuWZhqbQ0pnpaFsrZaVUS0PV6UmVFMF6ADidMHRTYY58rrK4
	5Mx26jiklWOr87QA1Qns2Pf3G9+yPrBEEJvB5pHPir1MTZs26ITWfvy4lakrB7qw
	G0vO0iT1J+ecLAKkQLpd8HqxyBMINPxn17ch/vGCQuuISNbrlVleAvhHM4u+fl5H
	SJ2OWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta42g7ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:12:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c532029e50so181057185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768918377; x=1769523177; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EHBfsKrItXne6uZzgw/96JIwvuMEC+kFda/9wO1JJ/Q=;
        b=HzoCPsYiUd0eKek8c0pQWRdy8fI8P8bzDj6QcuDPrmDHYZobfSsj8iTdLs9u6cQcmF
         elmrk5QJjiXKfLatQ+RzyK3D24UAvv2j99qPCASkmNN4FvzM76jpcTzmpbcsZ8IWLu9t
         ZfoBiFXYlN6FguWynNfj/ORoA0ikdZ0qboeEgw/vUYB2baJqz6SG71rRLVriR7Qbs2DS
         OO+Q4fMcxp5+6LRfxGicmBQ0YyoGG8mPOq2ySXHd87Idly3xcQ5daphogNgMCxPhLX7V
         43UcD227g2cdlz/4vWDWCrYnSqWd8MVh7aHVs+Oh9QptOV2Yc6t5xXpl9zoESPRINehR
         d2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768918377; x=1769523177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHBfsKrItXne6uZzgw/96JIwvuMEC+kFda/9wO1JJ/Q=;
        b=v4BAYatlS4mBPaC2m3oe18UXmdY95AKIjhrkdQQppq9I4rMiYnhD3DpwxUpiskqcz6
         HO6f/++4xlhPlPuPKkb3Csh730ujTuqOVo+YBh+kpt4WGw4zb7VcGKjIyR7SxFAc//qf
         1k89OFLSPyQWprnOu5O7tmw2usuDYEazVFdbkftQKrcwOpNXoFV7aoH6YV3tduxfVXwn
         12molQcpOdWIxWPFKF+zCabJQ0IIzi7uXArLwYALvJLo69cJ7bLU7KNwe2YTnC2EQyVj
         1+i65ANKfMkOvUT4sl+D6+hhKoxGYdVM+NU9qmOWjuRZbLKxTmo5fUh15n4Cq01+ijjU
         ppvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhvR0SWFiBzCSIt084iiS7yakaMEqnhIe6t6j45ZPG2nIcYYWIftaKoYgF3dNotv8HCyIfngfOdW4/FkTO@vger.kernel.org
X-Gm-Message-State: AOJu0YwIS15WRFSF6SnsQv+fnKvsc8v9chk4K5/AMpNiVYTZS3ZBmroa
	vq37zULLEMkanlPkaCwQ3rs66PGFn6RaxSXYADWe1j6NsHTOTxowWhxXt9AschSCU5rl9OmOv05
	g8D3bOokiV0I8ezsvUJUMOXFwBkVaajZiw4mFk29aDHCwGE3jqfstmgvo7v0by6xT7i4B
X-Gm-Gg: AY/fxX5rbewuFc39Q2YCmOJSC9bdCABqMV3QHp9ONuW5qAJlxYmD1zmvd8CMybZIfL1
	2ILbSx8yQap8lTeRILoUSwgEPsBd1l9K8G/uqir5ZWNOtOQI4y2UpTkC2JEVPHBBsyxMO4owb4A
	ZY2qOwX7uCJUnY4BfQeh2oxtThuhI/6Ytfyip7H5ABPqYEbpWL3kGSuCv3X1LrrBhbyHJ3IoRae
	TJS7LKFLm4z7amsSgGwcBMVM9egCnt4bINtfolISTd0jOj0RrMneIzQEtbX23qSOUFkPQ0pIN7A
	E2tVcR/nhwistdyIG9Bu+nY5JkrhUdznxp9srwHmZ6ZcFbGmrCXXeNNppsR7vuJueN4TF6yRIQL
	7mh4cXFlaTE7nMm1QMUacrIpCnV6vC/rPXYpuE4cC9CcltOuJy1URUj1nMGBcRWhGBQ0=
X-Received: by 2002:a05:620a:711c:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c6ca3a8fcdmr320035485a.1.1768918377240;
        Tue, 20 Jan 2026 06:12:57 -0800 (PST)
X-Received: by 2002:a05:620a:711c:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c6ca3a8fcdmr320020385a.1.1768918375214;
        Tue, 20 Jan 2026 06:12:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452ddfb76sm13260091a12.15.2026.01.20.06.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 06:12:54 -0800 (PST)
Message-ID: <41840083-0cf9-493f-a9be-d671b4d59a0d@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 15:12:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: milos: Split up uart11 pinctrl
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-2-27b4fbb77e9c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-2-27b4fbb77e9c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDExOCBTYWx0ZWRfXwwIMkVFbQkNh
 wS2yYmxD+kCWGWBZFsi3izXSS2WWcM5hIGEb8E7SgDwTuCHVn0P47u+wTrvSsCjoLkKGfJskF/z
 AiPWlY0KPSuiAeGl3QCY/1qPKqDbVgI4/zqpeaHjbWReYhyQA2qllTSp9hFnhAQL0ksQQR/0Wnl
 YfD+FwprHdSuAYuI8pHGtNC26yQVahAhG6cZwdjGrZtZxE+Yc9ieWnKPJhHtKsaXp9+SKVf2ZgR
 5V6cVicutxTPgiI+7p2rpzgZifuQUgCOZdj4ESc2POteJOBpualfgu+OcCMfiucoJ1aCrwzTyr/
 iG/Y17+19Fjh1yhfKUo3kTbu/SPueMVEUFz6/y30T94WC7U3nm5hWtMNvUjngHVkkLFT6Ugp/p2
 BwDyYkFy0lvuHIV6fRecWJPaKvVD90AxDGCIAOfuh8ymvUYSimL42F0ppnziBsD+zSEF7QiHUt1
 k4oprta227tCVrKLBgg==
X-Proofpoint-GUID: vwFvUif9yAm0Abt-eXCaCfgO7vly5Q94
X-Proofpoint-ORIG-GUID: vwFvUif9yAm0Abt-eXCaCfgO7vly5Q94
X-Authority-Analysis: v=2.4 cv=JeSxbEKV c=1 sm=1 tr=0 ts=696f8d6a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=yynwHhEk3PJQGNIDankA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200118
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DATE_IN_PAST(1.00)[32];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89846-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C68E15F35E
X-Rspamd-Action: no action

On 1/16/26 3:50 PM, Luca Weiss wrote:
> In order to set the pinctrl for the individual CTS, RTS, TX and RX pins,
> split up the pinctrl configuration into 4 nodes so that boards can set
> some properties separately.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index 0f69deabb60c..024e1c9992fe 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -915,7 +915,7 @@ &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
>  				interconnect-names = "qup-core",
>  						     "qup-config";
>  
> -				pinctrl-0 = <&qup_uart11_default>, <&qup_uart11_cts_rts>;
> +				pinctrl-0 = <&qup_uart11_cts>, <&qup_uart11_rts>, <&qup_uart11_tx>, <&qup_uart11_rx>;
>  				pinctrl-names = "default";
>  
>  				status = "disabled";
> @@ -1835,20 +1835,24 @@ qup_uart5_default: qup-uart5-default-state {
>  				bias-disable;
>  			};
>  
> -			qup_uart11_default: qup-uart11-default-state {
> -				/* TX, RX */
> -				pins = "gpio50", "gpio51";
> +			qup_uart11_cts: qup-uart11-cts-state {
> +				pins = "gpio48";
>  				function = "qup1_se4";
> -				drive-strength = <2>;
> -				bias-pull-up;
>  			};

I think the best setup is

qup_uart11_default: foo-state {
	qup_uart11_tx: bar-pins {
		...
	};
};

qup_uart11_cts_rts: foo-state {
	qup_uart11_rts: bar-pins {
		...
	};
};

Since  there's a lower amount of references at the user (default vs
cts/rts still makes sense as that's a wiring difference) but we still
keep a label for customizing the properties

Konrad

