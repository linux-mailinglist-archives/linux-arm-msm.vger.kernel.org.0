Return-Path: <linux-arm-msm+bounces-52980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3F6A7808C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 18:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58859188473B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 16:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2C020D50C;
	Tue,  1 Apr 2025 16:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="igExcAsn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D39213D8A3
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 16:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525235; cv=none; b=D7wT0DccoKHSE9/JS+zhM0MNi6GkeLAEjzrmot32afSZ42jN1MbmSJCvOFuMya3NIKnvDz1iTwQ2H/CsbNQGNovivzm/GsKZwoZ03lgMidQHXI08XM0wZBvBpXtbWNRZWl6BDi6XYWS3PiRGalq9wvGEZp4k8kIkn4SGDVepY/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525235; c=relaxed/simple;
	bh=M9Pbj3w+PfosHL3d5ziPoL/UrIYCJ5YGd0n78EmfXyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f94q2NAq2U/vb/gsz8sf9+7mumTcT5uuu9JRgyUA0mSP2OLQg3EGwYyM/pG8npijdEhcDQMudGoPh1MoR1kO6wf8VEnKKgmnUb8HQsn5lLYDJEU1idCa6CtzDbHr++hJmpjM4wKQJYlJAiMLy18DH3BkACgBNu6CIqy2Ogq4ELM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igExcAsn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531F3Qcc008461
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Apr 2025 16:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sdH5ImqLsAfzw0rN+DyjtJIQgSEvd6hICuNkLGBItwY=; b=igExcAsnkCz+EENS
	n+r3cHHD7H9QT+jWp06limHSJswkuTXBnJWp45rP2PZWrNJQZZVhhbAYl4kDCEwf
	d32x7tcAVzz+v/7d3bi3PZE2BabUMywXAZJPUOwLqWje7uTy/D/svWats74TMjTz
	Sg5+7Xh+3IS0LmREbfAqLTA8T3jHNWam2Trw6DJ2wqjnArLs4wYFTxsX6Y1PePZR
	BzYutlN87FomnzkxNYcYc53gHpJITQA5ZpnEYleMV1cskF7IkvAzoV3ul9glbFjS
	9SBomIeWxwwW8lD/noKeNNrPnov6YP6pxrkJS/pp07Ju0boUHnMvqpwcRJa3IuXf
	/sAiCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45r1xnk3j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 16:33:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c547ab8273so29602585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 09:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525230; x=1744130030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sdH5ImqLsAfzw0rN+DyjtJIQgSEvd6hICuNkLGBItwY=;
        b=tECN3D4oVaNChEgiErIruJhQ96WMJN57qzNvbPgDVTgvXTjm5u85k2nkK93iRajfjB
         zhzSGkQ4ZjE3O8H3mz2TF29hdlarEitEofWXRFLqv2BaBhWwfwMdWp6iZ/RkA11zR/YH
         gAN1H1eYksnJgXemj2aeAu0MeYaz1iBPYzNmILef/lRW8FpcByIgyajaigLagQQZ4VbY
         pgyLbDpNLfKQACeEog+OSWpi0tEXyklcnvJ6GOV3ix84GA7z97Jvnp36wnrSrcmqABR0
         YLoEri1uDr3+PksAYlW6I00dLZYdAKHwBLnsThCMvbxd/XAIoSisJWba6gEdr3GXCk9M
         O5lw==
X-Forwarded-Encrypted: i=1; AJvYcCUH76vy8/ObL0JEsXrJ7N8xcsq/3utY+o5z+HX5Q4FaR/jSZ3ryyGcd87U7AawM5o6DWrDKoZVbMmHLc/zj@vger.kernel.org
X-Gm-Message-State: AOJu0YxsVQhgksGJlwG3ToKb9LO9eRXfow0VPjApvR7TAd9VPDKdGbff
	il1o9BkJiPLmBA6cwzTcfXYzamwwYMyo6rIvk9XDMYyDm5AFVwb7PUhX1guq0QJ7QLIcLfKPKGc
	GowHg5W6Tz42fDIBErNdviVy5dFLZUWWaCSKFcfsOrd7aC2j1VilTWl6fQJjfPeY7
X-Gm-Gg: ASbGncus3IlfF1/qUBGC/M/byWOustAYAoS7t8FA0zMxz90nn+r+PZEiPsH01TIGgg8
	4SbbYlxYHCHkwtDEoH7aA7w25FkbVULjWHvu+53lrOqIqPNhSnAu6cg0dTZjYC29diaUiy0kZPA
	HLBm815DtuXTo06pZhVUEz2ayPLDUAf8Zhc/9t+XJNVh8qtM++l+sZaMfkG6r2DJqdl3Ela5J8l
	Z8HZGuBfpDarqZ4qHFrSugphHIR5zffBuolHBTWGNRPCvfPN+klzutUfhaYu0/4n40uYlmApmAZ
	rzjIXwyYDZkgZ/sqBvXG2vEOrCn8pcOuzh/6evufDImzqSr06zSViBRlzqFv2kK8Qo3/ag==
X-Received: by 2002:a05:620a:248f:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7c75cbc08bcmr142818785a.11.1743525230569;
        Tue, 01 Apr 2025 09:33:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8gYIudImK0VRmpucB5H3+jOQkQkQDY3SIRjp3Zb82Fo8Z11SPAmLmugt5+xJrqRVHr2iRLA==
X-Received: by 2002:a05:620a:248f:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7c75cbc08bcmr142814885a.11.1743525229514;
        Tue, 01 Apr 2025 09:33:49 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71967fdc6sm779778566b.127.2025.04.01.09.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 09:33:48 -0700 (PDT)
Message-ID: <1c09fee5-9626-4540-83fb-6d90db2ce595@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 18:33:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm6350: Add video clock
 controller
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
 <20250324-sm6350-videocc-v2-4-cc22386433f4@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250324-sm6350-videocc-v2-4-cc22386433f4@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Pmv6s1Qe_VdXM_Mef8gBywz_mU63s42F
X-Proofpoint-ORIG-GUID: Pmv6s1Qe_VdXM_Mef8gBywz_mU63s42F
X-Authority-Analysis: v=2.4 cv=Qv1e3Uyd c=1 sm=1 tr=0 ts=67ec156f cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=6H0WHjuAAAAA:8 a=ESNO-uGJ9VKVP_wUy7oA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_06,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010102

On 3/24/25 9:41 AM, Luca Weiss wrote:
> Add a node for the videocc found on the SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index 42f9d16c2fa6da66a8bb524a33c2687a1e4b40e0..4498d6dfd61a7e30a050a8654d54dae2d06c220c 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -1952,6 +1952,20 @@ usb_1_dwc3_ss_out: endpoint {
>  			};
>  		};
>  
> +		videocc: clock-controller@aaf0000 {
> +			compatible = "qcom,sm6350-videocc";
> +			reg = <0x0 0x0aaf0000 0x0 0x10000>;
> +			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&sleep_clk>;
> +			clock-names = "iface",
> +				      "bi_tcxo",
> +				      "sleep_clk";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};

You'll probably want to hook up some additional power domains here, see

https://lore.kernel.org/linux-arm-msm/20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com/

Konrad

