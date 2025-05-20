Return-Path: <linux-arm-msm+bounces-58790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B090DABE48A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 22:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02B5D189B384
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 20:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F32288C05;
	Tue, 20 May 2025 20:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jp7YlTW4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303E6288CA9
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771917; cv=none; b=RzyRZifMfMFhquzxSq8XWe9zUueQP3zWY7WqHDlD7I4bMX1PwC6P+pzVMwdKtSE7qIbe/PUt64ChnkuDPpjRUHuCxhUCNCHrml2y99X9QH5DWneRJVRsrAo+pmZCes865zAUEmNNLS6sFtOh7ZtDV48SKz23shOlMbXGQiLRAHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771917; c=relaxed/simple;
	bh=lf5r2wM+gWSyxkofv+4fH4wCygy/kakxH7guIFLmfd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LplYsLqsS0t9uX6699PpV/4Ti49eDHbDHFUb/Xg4AH2KKhmPQvo8dkAXnt5/sLRnkw0uTpEk+2qYaeckLof/qA+Wt7RtAiXMmZZae0+MTG1gN4tOM8zX5f7l5RJzqKwxR0LWTzWKJDbkIn85KnI8HXgGNZ23BhmrlcTIHG37RBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jp7YlTW4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdmF3027933
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JmLDKTMzuwuVTtW266uV4nw5LyID1iKNvQ6npmle/Ic=; b=jp7YlTW450nG0WeQ
	486jxcu18YFc8o9HTFsecUO7ZLeqgFE2z/uTbIBQdFyePrXRO8CchSNMa3W6uTRz
	Ej5yOfr/1zkR+8m17bXYLkH0icu1FoBmJUwq9eHsy7XlLkLMYVtr+V7XNHH3n8eh
	nGWoQbGSn9VxA4Zx9FFmK6uEiHJoCncCJt6XhUSH167Pft80xdZdHSqceOwft8S+
	Q/EBiU+T/5qE3CBhwBMtdVpEcAmG2JCgmxgGAgxfVY0SvTLAsoTxOy/OS4jkOrNp
	MrGf4M5edF6Vv9t5EtNszLs4HE4Dn+oAJzr/WGxaJ+LFP/UOFExDkM4N2viDZWUD
	OCcD6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf40hrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:11:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c53d5f85c9so158071785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 13:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747771914; x=1748376714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JmLDKTMzuwuVTtW266uV4nw5LyID1iKNvQ6npmle/Ic=;
        b=m6W5R641gZ2K62d/IZx4st1QJOG8b5lLeBjupgHHnXvHla+Gs2EBrPiMtc7bwv7mJ+
         urNvwPB/S2QsxB8krxLpJQIkHVICwn9S2iCi3MfrHKYcxBZJGlICK/4ViQyKVmh/JuEK
         D00SPLQii0m4XCwvcfT83zay3a95ssYtAHtJgmrCgXHAHZhVuSPa2ATZrnHZ7K+3GKec
         gKWvrz/8Prh/+nzKXchrvo5kr/OGcfklyhQKbHc//IwMZE3WFvHySCBv4McyDcn5VRGQ
         9wc+KwQqu7EdGxKwaQB4RgRCAoexhzusV8KBBopqCMmc+YXuX1CXGVNI9WhUyERw0ejx
         +vrg==
X-Forwarded-Encrypted: i=1; AJvYcCUDaIUSm0wo7CuLVhEV16tBt8wJI6tn6+GYc222EplVqJVr5zrd3zTtuIUJSI8gxD/L+kT2CErgdveXq6PJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx03w9UUxDCo6U9h0nCRR2/wRsDr7xvjwZntGpBY7bVZQ63YBIj
	nuk64CtkC866b2W60Aw6Yrwc+uwiUP8Fir/xeZj9/FxIBDX3oYj906NbWN3tV6Hqut7DYZ+VQPb
	czlV9x90XU908xoompqY3AD927ZxfJ9+RO8YkXMn3RPIDtystDBSLTpPtejtu4h50j2xJ
X-Gm-Gg: ASbGnctWzhWprQazqrAK+LeXOac1zhpM0xocCTeDmFisRm3SGxLdx2AVx0alY4uSB6C
	JbIh/VZ+ejXvHTZrplkqdYkrrhVE0yfYXojUgdOiH964HlnQXqEsFVb+wcgTkQTivIi/Rson0ht
	zg8Zjl79Ls5oxove+jaGMpcpajJmmxBYajcQoQRylumSdF1vJ1z9oA3frNIBgs6EFjQasZANXad
	sWOy81f41QOg5ijSkQYt1YoYDtg5Xl6SDfMQoMZCMM4wmJlucRdOQSTNzihatWEJnDOMQP/9o3D
	Kf7JawZof9WcmZg2KmSvrbflPvzFPd5ZhzRAjfY2/yL5OrwAJ9PgLUpJn3A8MgFwjg==
X-Received: by 2002:a05:620a:6011:b0:7c5:ba85:357e with SMTP id af79cd13be357-7cd4670a6c3mr1189381185a.3.1747771913941;
        Tue, 20 May 2025 13:11:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyzuWFlHh0j0Gw6RSmsJ2bBhmR0N482udldB75GhgJ0zvzi5X83XCYG+N2BLCT3Z7jVlI4Aw==
X-Received: by 2002:a05:620a:6011:b0:7c5:ba85:357e with SMTP id af79cd13be357-7cd4670a6c3mr1189378885a.3.1747771913432;
        Tue, 20 May 2025 13:11:53 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d498d05sm791783566b.149.2025.05.20.13.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 13:11:52 -0700 (PDT)
Message-ID: <121568c3-a6b2-4772-8c28-7453aa0ef3b3@oss.qualcomm.com>
Date: Tue, 20 May 2025 22:11:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8939: Add camss and cci
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2MiBTYWx0ZWRfX4rBgah5Ru/gR
 V+VgsSVLKBReH1och55KkEglJAFsghsWt046zYdEoxDh7wxcmIc8CgozJ1DRp2zy2cH70Iw2d+S
 ZhA9AY6Q2Udc6pViO7YrA8aWOqHSxToMQYXyOdxTKe6+c8OG+XzAtHR6vfQgkoj4XRjtp9SjcHg
 UkPII9Nmpjd6rXP2PitmWkDHApQRUTytqB1c6wc2Vx7W3ApHvn39MNYaavyPxYn/31QTJyr5V8f
 WS5PegrbI03mNQP40ZVQLi0XZEWsCd8SZcoL19WP1tTKOTLbZ9EGHJrak6U5YAW3YOoh/8oWxjP
 S5SgFbTH6Amnu2snMljLSVXcpw+4l9Z0fGRNMISm7HkSHqKliKlQZGapOI+ITjtp3+lsYj2L0+2
 AaaRJymquGktoycdEOhN0Xt220Hy8px5d7NfGDtiGfCMVCWr4ghkKfrp8GLgI7B2/OYUlmHN
X-Proofpoint-GUID: wMCIs-7ma2yzp2tvdUXCH5Pjc1tKtuNY
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682ce20b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=TqukyxIwAAAA:8 a=bmytIewYy0Yx7_8Z9RYA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-ORIG-GUID: wMCIs-7ma2yzp2tvdUXCH5Pjc1tKtuNY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=873 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200162

On 5/20/25 8:39 PM, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 615.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---

[...]

> +			interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "csiphy0",
> +					  "csiphy1",
> +					  "csid0",
> +					  "csid1",
> +					  "csid2",

docs don't mention the interrupt of csid0, but this soc is very old so
something might have gotten lost..

[...]

> +		cci: cci@1b0c000 {
> +			compatible = "qcom,msm8916-cci", "qcom,msm8226-cci";
> +			#address-cells = <1>;
> +			#size-cells = <0>;

please move these two above status

> +			reg = <0x01b0c000 0x1000>;
> +			interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_CCI_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_CCI_CLK>,
> +				 <&gcc GCC_CAMSS_AHB_CLK>;

camss_ahb should be unnecessary, maybe ispif_ahb too

Konrad

