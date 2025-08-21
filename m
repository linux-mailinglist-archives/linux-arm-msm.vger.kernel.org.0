Return-Path: <linux-arm-msm+bounces-70130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B96DBB2F51B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A7C55E301E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2B42F1FC6;
	Thu, 21 Aug 2025 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLWEMZoB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD512E5406
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755771572; cv=none; b=tQg07uo1W9VIj2p2tpO+Bn9rVE5Dt8jnQLC0J+vq4vOLVQKBa/P1wBMVWRNqFOdj7itGn1YgHUWl2+Vne5JJegZ9EyOi89AAd0PYSFSwvAsz3vAR0gzbGPLRh+rQunbc6AC5kc3uIUYhKqsLuWRlF2fUtAbmOKvMzjM5/J8YC/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755771572; c=relaxed/simple;
	bh=8U+1N8shakGM/vV89T8/5P0L7ugNzq0oe+JNJ1XQQ6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OTgJr3EspWquSPesbmKazXgWoJZTPo3wesAJQwlHM/xyWlGrnjUs60NQzPySHavzFetY2rdnPyBELUY2+KfZQAxnTRLao73fCPs9qNJ5pGKQ7Nb4D7QVF4hGJx4XD3TOPe1WHBY6iHIgBugU+bRrKLUehq3p75iZ1CLUbATrSlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLWEMZoB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bCEt031427
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uoq3hV35IcU7uY4Ov76moRej
	5YDOR8ZK6zl7rWMs9yM=; b=BLWEMZoBa8sTAGbVhorRYwP0QTfGVF7nluuj3RWr
	1ACssFpLK0HoWvU3B5GM+bl0pClPsW6HfuMaTb0ZAB36nj5ovnlbyfZggBtHf/14
	NuILvpl1PqMAIkKozlPnfifIgsAYx/ml1QudZ+LOS+j2yaiGJK7zbmPxC7L+h2sE
	l9NPCVZHhGtT8rfryvh4X8phHH6Yop8DwflMLNpLIIVqeRbH7cFblFA2/XqxL8h4
	K8c1ImBRrhdPkrJ7f/aIaPTN8SBEeAjgaqb6TVh1v3os4nfBFrPiYuMMTbryDp+s
	xDIVP28XwSV8b3PuE/i+FXsrIVfrxqsiBzhn/Ogha1cRBQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52avxna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:19:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70d93f57930so279046d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755771569; x=1756376369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uoq3hV35IcU7uY4Ov76moRej5YDOR8ZK6zl7rWMs9yM=;
        b=J3NtmAJVzSPCOgQzTMaBldIlH5hQfy3YsoD4efTvVrxFfgk6TLWK7nw4yZTcmufcs5
         Gs6t1/9VJzuE9YOMEQvGfIc0j6xtK3L7lpQlb+8wGV0R21M8Vb5YAvg+qJI4qOMJGlRx
         2WgEljlCvE1/gTJq7ZigNYW6o9lhN751o2hKM1vBNRGPVEYOkUFS7K0y38lY8/rCeOM/
         y997UcTOxBdYM+LpnL35zStwKy5o8lnTqcwRFTk27JhbFNHhkcPMZV4J/VDuyOxh8szX
         MhHOiqn/7970meZgbIaksStN34aLn/oB7ic8eMPNVu9Ok5EQQlIRiVG4n1wPPPcRaAIz
         2Ehw==
X-Forwarded-Encrypted: i=1; AJvYcCX9FgqM+gA95/RdDjr/qat53neEqxYoQX2hItpqwX7MaHpjsYNLNYgIOXv4JAUEvGNkVtZV5lS3+9+qGH75@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8vou3HXDYRW+0Q6uAHfv90tWmRSLsnFtAzmRHtbkDzjTuY9m5
	mhQOI/95L/BiGcCNkiNsQD8jyhJrnWCSsp+VKXf/f3nWhkEneyaucQ2QubH7j/3E4Mbr5rvF+En
	uckHn9l+fzWfQJB+ud9Uuy1do3Q54UhDhSiYL2mf60ZFW9ag07Gc+OUt7Lbiy5M32IEwN
X-Gm-Gg: ASbGncucBc943/2WflezC+o3MCoOQLDpcl/uUiFiFcoNkm6L1qYYS3QVGRq0NrbT/69
	xAvA+o6mmm4WqUuKRTz1dAbEi1BuCXSds4t8DLBzri3yJ1iMNfxnhPt4S1xnmq0zc8GO8eXQoz7
	q8PPnHLh1h1Dncf6JJpCG7JkHIxhV+WB5KbsGxcnYmB/VjtMvrlMEpi3AWY255jUAtrTjLo85dB
	yuDDVsaSuSFe6auV4L0vCFDB097FykVT1GypEEhObw2A3DMzJU0lwNO7N1rELE7g4guyzAA7xdc
	6LPKVHAtlQu/wtLAjHhMR0W42cO0oSChu90hlunwZNU7BgfVBR2A9bFJUS3CRymFVoV8+qBG2QS
	HCZu/qLZOsYh+MJTvqQc33MnXkj8lUt1j6tmt1Vu9522wOgUuIouY
X-Received: by 2002:a05:6214:3005:b0:6fa:ab49:4482 with SMTP id 6a1803df08f44-70d88f9b87emr15996686d6.35.1755771569004;
        Thu, 21 Aug 2025 03:19:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHF6WPBsgznhHt+ts7DhqqaGYYvO9aU0zVdhS4+riVCnl7vdR8eHXlreLz13JV2r3MGZN4QFw==
X-Received: by 2002:a05:6214:3005:b0:6fa:ab49:4482 with SMTP id 6a1803df08f44-70d88f9b87emr15996376d6.35.1755771568433;
        Thu, 21 Aug 2025 03:19:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef4425fbsm2950888e87.154.2025.08.21.03.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:19:27 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:19:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
Message-ID: <eaxppztxjggd7kdg3p5actz5rcsiy7czw7lnv5jrvnab26gxdj@pwmwlupaievv>
References: <20250821-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v1-0-a510c72da096@linaro.org>
 <20250821-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v1-5-a510c72da096@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-topic-sm8x50-upstream-pll-multi-pd-voting-dt-v1-5-a510c72da096@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2E0Os+xb4qbe
 9XP0Z5fZBx0CpBji/jYhuPhSaWWBPUGRKtD+t6TWSJ9/wHEcC0hjMBXAof1PTCjGAv70JHAvae5
 oEe3STirYG22jG4ChsMvmDLrevS1GH/aEpihhg+6t4yl1XtBE++/qVAj45ilXqkGv6Ame7IOBVj
 BaLccCmBetK++wlTxMAmKCVTnF7nn0gfFR8vN0a7KnZpOo2weEysMMchvU8qiXYYbwRsosV09vU
 vuOwDPmQvkeQRpvY4GvhUBiYpRMq7A+6TTuiyg/Q8E+LicLyf8Ns8hvD80qgo9W7RVHVwxopqXn
 aYm26iE95bEbSjX6j9NL5QgeglAEn6fBYuI/aPnkwNDyt+LpGUp+IUq30HfG8MwuMHtvPVFKWWt
 ylcfIAUQevU9uunViZf6dzKwTRdnYg==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a6f2b2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=eIWQzYl4t5esjhT04gkA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sKnE9BRaU5TibHFNlpNjIWaYDhgz1Vgs
X-Proofpoint-GUID: sKnE9BRaU5TibHFNlpNjIWaYDhgz1Vgs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Thu, Aug 21, 2025 at 09:16:38AM +0200, Neil Armstrong wrote:
> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8550 platform. Hence add MXC power domain to
> camcc node on SM8550. While at it, update SM8550_MMCX macro to RPMHPD_MMCX
> to align towards common macros.

The last phrase no longer applies.

> 
> Fixes: e271b59e39a6f ("arm64: dts: qcom: sm8550: Add camera clock controller")
> Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index d4bffcc244c98e87464cb2a4075c21f3cd368482..54ea21e1778a7c104cdf6865f84a7f8b5a8691ca 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3625,8 +3625,10 @@ camcc: clock-controller@ade0000 {
>  				 <&bi_tcxo_div2>,
>  				 <&bi_tcxo_ao_div2>,
>  				 <&sleep_clk>;
> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> -			required-opps = <&rpmhpd_opp_low_svs>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

