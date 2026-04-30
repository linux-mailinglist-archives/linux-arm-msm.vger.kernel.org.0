Return-Path: <linux-arm-msm+bounces-105375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OD64NdNi82le2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:10:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B67B4A3DFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 313AB301AF75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 14:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724E1428838;
	Thu, 30 Apr 2026 14:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKjp3bN1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctVrBJE8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2E842B743
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777558218; cv=none; b=Aqu4cogQpTNXLMP8fbcYH4GknqCq3z1AjAhMNaEIuT8nBSbohXE/NgkgygWjb8+aevxGaPnphu1U9rM402F5FgwghHRiing1tSmVcSMyT6ImRlJekheKfFy/l+DbVRyd9c0OhhrzPTJiIabCYHnzvw4DVWxB5SQYPiOAf4xv6U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777558218; c=relaxed/simple;
	bh=9fADcY9rUK71HAnuEZuDmRCIQA3SpQyvl/keIDGR1Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNq2Cb64Qr8QcZHdWrJqCGRQzTxgH8H15R7lqUeZB4GQetejz84uNV70nyBblf+i5xEPofvZzjsouGSUTLQZIINJ5vvqJVs1EbYYIcVpiHrmCbe7zcgC7yFncTHIxIPW507wXqZq/cFF5QAJYTEhevD0xgpE1iHGhw1yPD5zsNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKjp3bN1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctVrBJE8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UAr9oM2907581
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1GKT2qy4wjJi9yQ7DHur1ft3/ZgwzF6cznSCLmmK8hc=; b=WKjp3bN1Ofy4LHPr
	0dW0TZhuIzOJefjYVwItcKhzITqWCfkdyxowo1/hi4cHAczACxuvivvGjuzIJoXF
	uU3zyLJhDzVSQlunp/WOkSt6MuCpN583I4ageT6HdoYx2K7rIYF2kdLAYdD5QLdO
	iqRT3GaKChHTVr+jGvegmRd9LlQidDE5wjDRCQ7Iku6vp/NSiJlX3WClysL6wpJL
	TIILm+WdROf/HsSdn7c88OhpF87kkKuATMqVklDjwRfBsNUuMQnAFHrSG8GhbvPh
	+ru/Qp3VpI9u4Qr6JFShAZrL29p7EsmfMsv+LgboppAkGZpeTD6OgJvca5Qzi1eF
	2CXveA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv0pfaf6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:10:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-611bf61a809so67720137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 07:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777558214; x=1778163014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1GKT2qy4wjJi9yQ7DHur1ft3/ZgwzF6cznSCLmmK8hc=;
        b=ctVrBJE8NQP+Eu+7BEfbzdNNWDHSVhj1nMfOlSGnXOxcAPiijGEdo0QjISofUeMRW3
         4Gb9d9BLJmDLXC1H7W7uJZXSUCa4w2QFTS2MJwgKfCoUoMCWJcFRWi1Cjzdm/v5IATyv
         WHmQgdPHex742WFcRkd1S2gLBatVoJOMxGpUAFMoetP9F9XZ8lkJc8tf9bhiyYf3yk3A
         ahDfNMA8LlhnhsNGOtfiz6CJpxFrJSw4loRpIZdveRWm+rR0qyOp4s8yu38jvnsp+XfW
         DNb90o2Qks34LPGkxHUFnw7U2mN/aIh8A39AZu4RPQq+HNWcRqzEu+efoXVpuW9nbaBa
         rbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777558214; x=1778163014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GKT2qy4wjJi9yQ7DHur1ft3/ZgwzF6cznSCLmmK8hc=;
        b=mPB6xvZsELaP3IZIW8s3UIO+7q1KIfSJfjFlZLMjT06k6GlB2zaJD3oovAy48X7o5F
         xJgLe+8ynmEtU3nBoJWE9mQcRdlHR2LmVNzZWAGj5ytw2HZ0qvZzzCdFLDFteZ5tiW2D
         tyrdGvBxgSmK3qgjPojuSCKCGhyTuQOpFmrfVK9qX8Jq1bFf4GE1UIcx7GbjIfzmJRBk
         +FWiXtk7XMOPG7tElxblb6f9QfZbJ1TjzEl9395z6qloVs/yPX7lzEp3u45YUIZIRRUf
         a7hI9RRCQx08XJ1f8iGZcvyXuNOALVDAXodzQ+m/E7+EO5bDfwmpbZzvsw3TcOhIRDQ1
         UolA==
X-Forwarded-Encrypted: i=1; AFNElJ/h2kaonYPjhtzEAQ8/8jdTN2kHTPO0rz+P7Rg5DCZGgjhFdidfcmDuqpp+MuqMJsGWtM4wys8nMQTT1kHA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+RNn7X5m1MzR8hn639FHQmEZpmZ06nQV5VB3OHzfaFivnvIHA
	tfHpOc4nR4NlkzYIXQIi1mBv38MP5zq15YEwob+xCnZtZXdXCRWZY7gBeutsU5MO7Qlgy/7qk+j
	o9d6h6G/WBKERQQZDUrYbWgS0511DC9JWW9irOplK/7YplaCyhwLL8Wv9OnwGgETAe1RX
X-Gm-Gg: AeBDieti9yjQBCyb7WdeRVzq8EGYHzOvORQUq7c14uKWGCjzkANVleZX1hPnoXg09e9
	ZfAiL1Sj9EiOTuexouJBOwhALc8uXTZnwj+adotpzU2dOd+1Wv0eVF9pNQfSnfExvbd7Gpjzyvf
	LYmkY8qNLA9ft3nl3yx+Ij3wzoQZzSkWhHpH0RtdSOZHYxOThlUAniW1Dku2egYXxDDuoCG1drZ
	Zjkmh/mKsHFxy+Y6JmRI+E04/vKb3VnBChwsyO7uirfLIPpVrLD/UFTVmvjQIX88xjfXme1sC5j
	J4ry7TQXW4XKfkRCQSZ10HPgWTay9rr00eQZiF5Unr0wcCGeku727U7F34FiqXY9sbx5AJAW8XX
	iH7KsRhS0By9e44Qbq1gbBo9R3AdxmLjuIP6r434Dg1KUpBemNFyJE6rcfEfafoJAPSfdD3JRv7
	ZYKRCd/5RP28CNgQ==
X-Received: by 2002:a05:6102:c0a:b0:611:5301:7f35 with SMTP id ada2fe7eead31-62ad263438fmr606898137.1.1777558214064;
        Thu, 30 Apr 2026 07:10:14 -0700 (PDT)
X-Received: by 2002:a05:6102:c0a:b0:611:5301:7f35 with SMTP id ada2fe7eead31-62ad263438fmr606855137.1.1777558213535;
        Thu, 30 Apr 2026 07:10:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b22154e8dsm1878514a12.17.2026.04.30.07.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 07:10:11 -0700 (PDT)
Message-ID: <db701e8b-a405-4105-9b5e-b2add3827d83@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 16:10:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: qcom: imola: Move analogix video/audio output
 to dtso
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, broonie@kernel.org
Cc: linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
        m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com,
        loic.poulain@oss.qualcomm.com, Riccardo Mereu <r.mereu@arduino.cc>
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-3-r.mereu.kernel@arduino.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430132140.30369-3-r.mereu.kernel@arduino.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE0NSBTYWx0ZWRfXwXXN0yONT3cO
 vUzTarXmZg8uW8S17++tsW7P14ZxlowceHGFSBk7SkFpy5a6A+dMdsv1Zaf0/62fbd5FdNEsHeM
 2Q3jCntkBiHkPCqesBJTUPfYqGbLLem9xVBZ5Q+/XCJ3+k8W5xzCRNuRKcDdPQWEElj9UBWlAZJ
 xM3XkOBlTrQgdqICV3SKdgel1SeuPqJ9y0AhGaHc5DGBUjJRAcAm/oZW5/QlukhsxaHygtm4m55
 y+2SoInZRBEdGL8gJSSpMnqphy0K5UClzc4uj6Q9rPFRaani7iNEpq+zwMgMe/ctxSOh9rY2LHF
 lH048Wjkt76Z2Wtb0/wK+An4LuXMRPjmAg5C8Ui3PaxhEvjZiJZS1IumVFP4N6eWcnIcm1QL+kx
 8aSxHtoZZJb0D4pmW2e7d3C4Y6wlZoapgBy72I9UREOMtAuc9mzh8S1mbfG4QaMJl5AsVMZrZuc
 WQmuCa8GI+R8r7+Cm3w==
X-Authority-Analysis: v=2.4 cv=Zrnd7d7G c=1 sm=1 tr=0 ts=69f362c7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=fTA6t2aXeJjKA9saunEA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: AK8_RwiBiIicv3WJ-3ofl4m7S8hihEmc
X-Proofpoint-GUID: AK8_RwiBiIicv3WJ-3ofl4m7S8hihEmc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300145
X-Rspamd-Queue-Id: 2B67B4A3DFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[roeck-us.net,huawei.com,yeah.net,9elements.com,amd.com,analog.com,gmail.com,linux.ibm.com,vger.kernel.org,lists.linux.dev,arduino.cc,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-105375-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,arduino.cc:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/26 3:21 PM, Riccardo Mereu wrote:
> From: Riccardo Mereu <r.mereu@arduino.cc>
> 
> This is done in order to support different video output over DSI.
> Since audio part is linked to Analogix USB-C controller it is moved to
> the same DTSO.
> 
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---

[...]

> +	sound: sound {
> +		compatible = "qcom,qrb2210-sndcard";
> +		model = "Arduino-Imola-HPH-LOUT";
> +		audio-routing =	"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",
> +				"AMIC2", "MIC BIAS2";

The commit message doesn't mention wiring this up, please split adding
new features

[...]

> +		mm3-dai-link {
> +			link-name = "MultiMedia3";
> +
> +			cpu {
> +				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;

some of these have a double-space, please fix them up

[...]

> +		hph-playback-dai-link {
> +			link-name = "HPH Playback";
> +			cpu {

Let's keep a \n between the last property and the following subnode, file-wide

> +				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			platform {

'co'dec < 'cp'u < 'p'latform, please

Konrad

