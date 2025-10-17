Return-Path: <linux-arm-msm+bounces-77773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FC9BE8AA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 14:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4506D4E940E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 12:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07825330318;
	Fri, 17 Oct 2025 12:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBMBaESG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B93232D0FA
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 12:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760705544; cv=none; b=udeDczM2kl17lRj/1hVu47nFrXSabOqVwFyGw0MzruwwZi11aB5mQ3qAO8rTkBSRuhrhBV3OCoh2CsSh0pon0+Y9R/0aBDCP7bAPT9UpdBGcD2FMmN5U0wYVCb9vThH/fgGKuF1R5IoPvJKRF8xDN1SIsEniEmF+CER/Q5zP+bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760705544; c=relaxed/simple;
	bh=sPKwdu6wTdyJOHtexVwlNZ505QFzH6aQ8UPHu+doLzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g06fWAiEbbgEMbxKO/SiPvy7m9PswbylFr9T/wUqya0ZvJSzHB8/XZR1JGi9cgPPYfNR8SV65PC0pxf3tKb7zS9boeIe2rB3nun9pnCi6pdg4Pt2wS6Th/aUxhIXMvVDM0WMFLLFN7HXPtufdU9HjovH618sYr8vO65cOjcjRpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBMBaESG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8IPTg002098
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 12:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8C509Fpt0f10gMNx7IiCvD7Oj3qVzkgtXi3AN6KeSx0=; b=SBMBaESGPB+nte5q
	eD4xjfOsBvxBujOjvCaJoNJv5qVe7aHq8zcqVWqNBPQPAyAnRKFjRoOK2ymwzGFS
	F9GCUxFnEqlzHXi6SyWVz7Xd0uUu4n5c+EUkBtiN2+w1Ezah9oDqZEVHX7HA5CvA
	S59fotfUaSo9xOe+ynWegZOBX8drRHBLntY145EAO+QSmoAsvCukoDCtn19eFbKj
	5rfv8HNFNZo0tOivMlkbgSFiuXQ0x+RNB+Nzg4+1O3HlcoYyHLjWO9ATf3Bni5Uk
	tpSVkVKRZUXYUhoRMQaIaGiZRdAOoPTcm3EGEBxyo64bJzSrWJN+komWzy7JDW7O
	FiMGbg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8m848-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 12:52:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-818bf399f8aso89745996d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760705541; x=1761310341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8C509Fpt0f10gMNx7IiCvD7Oj3qVzkgtXi3AN6KeSx0=;
        b=vgrlzRj+Uvn8vIlQI05fmKL/iASuJo2Cow42po5PNdVAnxG+xI+GEGSGwo9/94VtgH
         lD5YF5zWN8i5q2NdZIsDlROySxgL84jMl7rCotkAAICfHop1aceQfb9FX7GU9lrKc9ir
         Wg1U4yTGgJ+zAygd5Pf/iscDJjs742nNj/TWaJgW61o979m+FCGShNndviqqnW1Lrp+x
         5DYSV5XPWymx0JjiBt+RvpRY6v42INe+7DxyhgO301ubSJ0+dHaIHfKcUzZHLk1Us6Pl
         IvRa0n26YAXpuXZNIgmK9egPbeklLMLXuFhxZvfPWhyAUJuMTwBM9x7k0MLBeisQIGEv
         2b+A==
X-Forwarded-Encrypted: i=1; AJvYcCWJztC2RVNT6PzJt8faiHEOjKABQA7RM5AM4IKV2KwKk0C0aSMzdNUxWAM3VuzMdhxMDLLRKunO6d5qKDBq@vger.kernel.org
X-Gm-Message-State: AOJu0YzgouH/iZCHdPgV0eZuI9XLSNWx/V9DNnoFpE7SqBlmLAbc8cp4
	JY6bvxz5aJf8MXjeScSy8s+H4m+0fxNP48uYRnljTXb6i651R+WnYeEy5N4BU02XjOYmcdQhXsY
	0P8d72RqqXM/PhwYdMp5tWkGNbMtA9B3Yi8xuXwzhIXE18eQc+ooJrN7o2Qni+d6ov3DT
X-Gm-Gg: ASbGnct1eIUFdTG67XqYSyCcXa4aNZCB+FhkvJdfbL8d+b/sxkKBvNHSTwb7gOlaxa0
	KymHdkZNEpfrznOH9lZAHoTom+Kun3cSSmYRX9SfF5r03zWEkOtD49eTJp2nEwftIVwElUKD7Jl
	2D6q11AHdGDxHVhGWilZOLX9DxNxor/+s8urAcPQfH1wqOGCwAVonoQRwK3SpHbC/y8sgPU84PX
	wmBFkTtFiEXJ7fDtj2wo/jXs5KGUUHyb8ybhIgGaSdB0nSDllnDAv1L9CuxG7c/O1vIqXzWmfSX
	zEj0oFT2L9lX4/BgcDbiyDTncObdJ8zPVqVetYM08DiRKxmmG+YVDEy6rDPvMD1873VnT+KS/mw
	zBKmeoKbvZxDoed/DJxZ2RroNc1CZ5jwkrl3TSyX4gpvKugb6VC4d/DwjUDQp2zDQJNryasBcxg
	AxmlLD+F+IZKc=
X-Received: by 2002:a05:622a:1a24:b0:4b3:475a:e2fc with SMTP id d75a77b69052e-4e89d21c2damr47124331cf.3.1760705541073;
        Fri, 17 Oct 2025 05:52:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkkcMwANI4/mggRoeEmmkf306hMXWngKk7K3LeUGsEk4h1EdafxAao2gsUVAtk1cr9ZpNmFQ==
X-Received: by 2002:a05:622a:1a24:b0:4b3:475a:e2fc with SMTP id d75a77b69052e-4e89d21c2damr47123921cf.3.1760705540599;
        Fri, 17 Oct 2025 05:52:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088563812sm7829409e87.61.2025.10.17.05.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:52:19 -0700 (PDT)
Date: Fri, 17 Oct 2025 15:52:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tessolve Upstream <tessolveupstream@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: talos-evk: Add ADV7535 DSI-to-HDMI
 bridge
Message-ID: <vcjsz3x3bbzf6lbgbumutfymuz7hbfpr6myg2hiyqbr5o245sb@ydr7bunig5bi>
References: <20251015122808.1986627-1-tessolveupstream@gmail.com>
 <53ef53b423uespn7xspqfxnnvqvhzb5b22a4oaimf6g2qy7ruo@273oegazxbaz>
 <b3390184-a3ef-49f6-8b68-dbf94564ab43@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3390184-a3ef-49f6-8b68-dbf94564ab43@gmail.com>
X-Proofpoint-GUID: SrQCnE3ZFqDwn1z8kU1VZLyyjaeiUpq7
X-Proofpoint-ORIG-GUID: SrQCnE3ZFqDwn1z8kU1VZLyyjaeiUpq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX4Ag3TQ+cawgc
 PEZUDmmQvjcuPNuzGpip2rR+AIEcit45/gjq6shI/ndsgNvUu/5zdex63wy2WAlTV8F7DwRM3hl
 ROj0THeks0wXcpRIc7Yog9RyqqL5/DgVOQh1xMYWji63oz3SkAGSnvJB4vd2Bm3oEQU6rfojQ1f
 H6H1AHwGCpAG5OQmIHJMvBYVOn9WGH8CmtwgIHCvvlj3AKJdgrrZJHw2zRWsspw0ES5PaWXAWtn
 aAbAF5NQYWz0t+opEcT/KjwKv7gNSENAH0joSjKhX+wqf/X82EuNxLz6RYif3GtXZK/zYdw6h+z
 DgsCWz9BIoF9wsgCkxXtqE5HkbgpXdGL/8LvTAfv/kiXKMsuXiEKW9yom4rwXPddMyfH/fac32W
 AiRlO0HdVHSqc+BASpR+dkVy3voWEw==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68f23c06 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8
 a=gQYefWIe0O1SA09g9L0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On Thu, Oct 16, 2025 at 02:24:40PM +0530, Tessolve Upstream wrote:
> 
> 
> On 15/10/25 18:34, Dmitry Baryshkov wrote:
> > On Wed, Oct 15, 2025 at 05:58:08PM +0530, Sudarshan Shetty wrote:
> >> Hook up the ADV7535 DSI-to-HDMI bridge on the QCS615 Talos EVK board.
> >> This provides HDMI output through the external DSI-to-HDMI converter.
> >>
> >> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 21 ++++++
> >>  arch/arm64/boot/dts/qcom/talos-evk.dts      | 76 +++++++++++++++++++++
> >>  2 files changed, 97 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> >> index 55ec8034103d..b58cae02c9cb 100644
> >> --- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> >> @@ -244,6 +244,27 @@ eeprom@5f {
> >>  	};
> >>  };
> >>  
> >> +&mdss {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&mdss_dsi0 {
> >> +	vdda-supply = <&vreg_l11a>;
> >> +
> >> +	status = "okay";
> >> +};
> >> +
> >> +&mdss_dsi0_out {
> >> +	remote-endpoint = <&adv7535_in>;
> >> +	data-lanes = <0 1 2 3>;
> >> +};
> >> +
> >> +&mdss_dsi0_phy {
> >> +	vdds-supply = <&vreg_l5a>;
> >> +
> >> +	status = "okay";
> >> +};
> >> +
> >>  &pcie {
> >>  	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
> >>  	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
> >> diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
> >> index 25057f4f6a91..f7e8be3667d1 100644
> >> --- a/arch/arm64/boot/dts/qcom/talos-evk.dts
> >> +++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
> >> @@ -14,6 +14,82 @@ / {
> >>  	aliases {
> >>  		mmc1 = &sdhc_2;
> >>  	};
> >> +
> >> +	hdmi-out {
> >> +		compatible = "hdmi-connector";
> >> +		type = "d";
> >> +
> >> +		port {
> >> +			hdmi_con_out: endpoint {
> >> +				remote-endpoint = <&adv7535_out>;
> >> +			};
> >> +		};
> >> +	};
> >> +
> >> +	vreg_v1p2_out: regulator-v1p2-out {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "vreg-v1p2-out";
> >> +		regulator-min-microvolt = <1200000>;
> >> +		regulator-max-microvolt = <1200000>;
> >> +		regulator-boot-on;
> >> +		regulator-always-on;
> >> +	};
> >> +
> >> +	vreg_v1p8_out: regulator-v1p8-out {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "vreg-v1p8-out";
> >> +		regulator-min-microvolt = <1800000>;
> >> +		regulator-max-microvolt = <1800000>;
> >> +		regulator-boot-on;
> >> +		regulator-always-on;
> >> +	};
> >> +
> >> +	vreg_v3p3_out: regulator-v3p3-out {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "vreg-v3p3-out";
> >> +		regulator-min-microvolt = <3300000>;
> >> +		regulator-max-microvolt = <3300000>;
> >> +		regulator-boot-on;
> >> +		regulator-always-on;
> >> +	};
> > 
> > Please describe the power grid. Are these regulators being fed by
> > nothing and generating energy from the thin air?
> 
> Thanks for the feedback.
> You are right — in the previous patch, the regulators appeared
> to have no source, which was incorrect.
> 
> To clarify the hardware design:
> The 3.3 V and 1.8 V supplies to the HDMI controller are not coming 
> from the PMIC. They are generated on the carrier board as follows:
> 
> 20 V (USBC_VBUS_IN) → 5 V rail (V5P0_OUT)
> → 3.3 V buck regulator (RAA211250) and 1.8 V LDO (TPS7A9101).
> 
> The 5 V rail (V5P0_OUT) acts as the input supply for both regulators.
> Both regulators are always on.
> 
> example:
> v5p0_out: regulator-v5p0-out {
>     compatible = "regulator-fixed";
>     regulator-name = "v5p0_out";
>     regulator-min-microvolt = <5000000>;
>     regulator-max-microvolt = <5000000>;
>     regulator-always-on;
>     regulator-boot-on;
> };
> 
> v3p3_out: regulator-v3p3-out {
>     compatible = "regulator-fixed";
>     regulator-name = "v3p3_out";
>     regulator-min-microvolt = <3300000>;
>     regulator-max-microvolt = <3300000>;
>     vin-supply = <&v5p0_out>;
>     regulator-always-on;
>     regulator-boot-on;
> };
> 
> v1p8_out: regulator-v1p8-out {
>     compatible = "regulator-fixed";
>     regulator-name = "v1p8_out";
>     regulator-min-microvolt = <1800000>;
>     regulator-max-microvolt = <1800000>;
>     vin-supply = <&v5p0_out>;
>     regulator-always-on;
>     regulator-boot-on;
> };
> 
> These reflect the actual power grid of the board.
> The 20 V input is not modeled since it’s a raw external
> supply and not managed by Linux.
> 
> Please let me know if this structure looks acceptable,
> Thanks again for the review and guidance!

I think this is perfectly fine, especially if you add the "powered by
system 20V rail" comment to the 5V regulator.

> > 
> >> +};
> >> +
> >> +&i2c1 {
> >> +	clock-frequency = <400000>;
> >> +
> >> +	status = "okay";
> >> +
> >> +	adv7535: adv7535@3d {
> >> +		compatible = "adi,adv7535";
> >> +		reg = <0x3d>;
> >> +		avdd-supply = <&vreg_v1p8_out>;
> >> +		dvdd-supply = <&vreg_v1p8_out>;
> >> +		pvdd-supply = <&vreg_v1p8_out>;
> >> +		a2vdd-supply = <&vreg_v1p8_out>;
> >> +		v3p3-supply = <&vreg_v3p3_out>;
> >> +		v1p2-supply = <&vreg_v1p2_out>;
> > 
> > I think this is not correct. Please consult your schematics isntead of
> > adding dummy regulators.
> 
> Will take care in v2 patch.
> > 
> > 
> 

-- 
With best wishes
Dmitry

