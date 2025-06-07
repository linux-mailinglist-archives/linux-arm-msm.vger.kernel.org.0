Return-Path: <linux-arm-msm+bounces-60533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C54F9AD0FB2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 22:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8E863AF739
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 20:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19311F1527;
	Sat,  7 Jun 2025 20:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmqkSygF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F511CFBA
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jun 2025 20:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749327466; cv=none; b=dGIyIsZTKJEz+2ifGGAOsJZD4cOneuQuh2vF3uHjiqiLtA3lTiLF4xj1Q1PFhZuJGNUwOO9sH8S5FJIRX/yh9cVvVWYqmJEMOgU/NME/pKNAEG6faJ97ZgmUVUccJ0xt7BL55ETP4OelMDG+JweZIz4gITxhQUCO3aTVpspsg1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749327466; c=relaxed/simple;
	bh=LBl7czgvQa8G/k94B+8FwqZV4J+Gz4mRhHThbVzu2og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbt1aDDnJDWb85rSIi8cduCEAc9BX1pebI+bGcCgDxIAefyHeH5hdGUH0f1KEkZb2i+DbsdOYIywawqV50sP62NIzIPBE2i1QU/bbuJyIF+PLnAEXtgwXNS5S+KgmJm8v9XmncdJpVjpNBHW5jsBocnIXXRPnPBodJaZE5lA+A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SmqkSygF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557JmWG8021791
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Jun 2025 20:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3qmPnw84nsjJYSerO2qslMAX
	4/52384vseCZfcQGqxQ=; b=SmqkSygFjoITTti8NDVWiGXB87TBwoXsGzz0jB29
	B1v099QQlLZbr2/Rzz3bV7j7dZXfXg+OYv0Zgv/kzBlKy2yntIpoRR+KQxSQ0Uj8
	7gREUCR+hhRytxVXgVUdYFNRAl9MgexhdE83DI6K+AKmshR59fTRrhtfNV7q/X4A
	DuJ4fPbjS9XdmMY87lBwqXupnw5fqOU0zcseQigo93IcpanRfMm5CwaRkmHgd9YM
	AZ6IP4RiSIqm0y3mBhg093q+tIJ5leZXehJq6QE3b9tn2+qEagzM3cNp4Srhj8ju
	fV7QohUY7UCUYxvGqW1xA7cMRpkXAleY6tq9IBoeZ0V3Fw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6j8ygs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 20:17:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c7c30d8986so954459485a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 13:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749327462; x=1749932262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qmPnw84nsjJYSerO2qslMAX4/52384vseCZfcQGqxQ=;
        b=nhKPgVeU/rGYif7bRRKNnYlThYtw9gkN/7ZZmEkoZPx8CgHx7kmM2xLUOYy9gadOpk
         kUrgGg8dA0gycj35SWkr6iilHf/w3SMdOiasFsGfS32debsMQ6VmT0QxyTOyYsg35r5C
         BxlsAQYm9c+DkRCd5kW0QEYD+36R/8OvR4WakLh//VTHmvOLaniZs1d2RiF7s3ImHV7J
         O5EitNqOfTe6Qcjh8pCRHaccNVnoYYpAMBgwIjITPdggbheApms+eohsxAexsDw4KL6i
         SHZRBOQoSEC2em/ZWdQog+Y6cjqiMaRa9vLApM+sVbDj3WcfDMp3Yr0Pg9qTA4uhmUqX
         3vng==
X-Forwarded-Encrypted: i=1; AJvYcCX97OMoxjfIFOwScjJtEA8DkdMpzBjS1bVkmmmE5nhPFNFYLtJunxq/ni/jEj2xmEMnnxPIYbicefETwi1E@vger.kernel.org
X-Gm-Message-State: AOJu0YzSrTxXkI3TtNVyRYN4+S1sAJ5H8VgzCbVyjkXAtIrQ6TtpzjUy
	UGozW1+MR3o39Fv6Nv4iibF7OQfgyWhYxYbX7kkW4CKwHkOwvUurl8uorYHcSmze73kCMzA1Xku
	MxpvJM2FET3yYZ5h3WOrQpO8gJ38bfXqYFTuRjrr+0RPKylZpoCP7S/e+l/W8AJn6efUA
X-Gm-Gg: ASbGnctxuKqxyUJ4G70YYZPLuuRFhFPPy7l+UmVx51+bAluEm8UUr0/przj7U/FTnvp
	DcxD0Frzz9PPG6Q+vVrTqnKPKz7RcB9iinpLYbrtY6ge81Wt64X1xinqlXcrpbqLjR+128u03xx
	VYnpDki0VjSDp6oMLs5xjxeefu73Gmy32CujyqhxkJEVPUbjPiZw07ozKSNCRO/mYQEM+CBPoOM
	1SxODkFdRGCpA5UzeEZpvLnili8ebuEhXIN43y4srg3Jx1tBPGiLzEiyihYrzNh5EOvD634BTY3
	ghOApwm6cSWYqVvdlvVByblHLWjBQwbRPX29kBvMFTWz7+1NLNzriiMopRX5d/nvpUZvg9Ly23w
	=
X-Received: by 2002:a05:620a:2489:b0:7c5:4cb7:ac97 with SMTP id af79cd13be357-7d229861565mr1147394485a.1.1749327462094;
        Sat, 07 Jun 2025 13:17:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMiOJSDHgZKgzl6P5JWEjv6Hum+DYD4sgyillMmaY0OHg1MeWucp1e6XYNy6taJN/WTT7xyA==
X-Received: by 2002:a05:620a:2489:b0:7c5:4cb7:ac97 with SMTP id af79cd13be357-7d229861565mr1147390185a.1.1749327461662;
        Sat, 07 Jun 2025 13:17:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d00c0sm600890e87.22.2025.06.07.13.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:17:40 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:17:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
Message-ID: <wayrour74vlli27xrtxi2ff2v7q7ye2yknmk2mjpur5ry5gruv@hhh2mdb6lw2i>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=68449e67 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=AdQzqMdWex-Pz1pjKtQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: iPyor-Sv9QKjLb43oT3u0ZrLLlEmF3aJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0NyBTYWx0ZWRfX/OtNVQAS9HDr
 acNg1ozIaT08QYCl9qVQZ2m4y5mtbOot0YLGJwhvADmtEBqfW6I2OtozDeMoBFEtB4LDX2+lLW0
 MJEZYFpH6QgNGVigBKaSc4M+HjTmHJOnw/YtSNwGnXQhlb8t26Owjuft2uiJ6akwL2iRzPHk+Qe
 LI8JW7SglZ884dGri0YzHf8G4r4CB+1mLs3Fcnud8WgZe4uUoVYSjYN3T1qvTNfno29CVMnJxOF
 Z16lkmh9Wb1NX0l/X0hsQ7sDdB0owRTV6Pai0e7gTT8XCBTyidBrh6QOD7p1GCSdCpPtd6VAtyE
 GMLEOAFf9h85uf3FaMIeP5m1SoJz+86V9KdM0vF7s4hO5LXU8b5zhACjD4tCp0YQr3+gi4ARgte
 RQs8NQ5G6qze/iCWdUS3xTW+Se47AusnRrXXTTvNIuz95E6grhnfROiavGOwqQtzGUKH6Mbg
X-Proofpoint-GUID: iPyor-Sv9QKjLb43oT3u0ZrLLlEmF3aJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070147

On Sat, Jun 07, 2025 at 07:45:01PM +0530, Akhil P Oommen wrote:
> X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> version of Adreno X1-85 GPU. Describe this new GPU and also add
> the secure gpu firmware path that should used for X1P42100 CRD.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
>  arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 +++++++++++++++++++++++++++++-
>  3 files changed, 131 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index a8eb4c5fe99fe6dd49af200a738b6476d87279b2..558d7d387d7710770244fcc901f461384dd9b0d4 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -8245,6 +8245,13 @@ sbsa_watchdog: watchdog@1c840000 {
>  			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		qfprom: efuse@221c8000 {
> +			compatible = "qcom,x1e80100-qfprom", "qcom,qfprom";
> +			reg = <0 0x221c8000 0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
>  		pmu@24091000 {
>  			compatible = "qcom,x1e80100-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
>  			reg = <0 0x24091000 0 0x1000>;
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> index cf07860a63e97c388909fb5721ae7b9729b6c586..cf999c2cf8d4e0af83078253fd39ece3a0c26a49 100644
> --- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> @@ -15,3 +15,7 @@ / {
>  	model = "Qualcomm Technologies, Inc. X1P42100 CRD";
>  	compatible = "qcom,x1p42100-crd", "qcom,x1p42100";
>  };
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> index 27f479010bc330eb6445269a1c46bf78ec6f1bd4..5ed461ed5cca271d43647888aa6eacac3de2ac9d 100644
> --- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> @@ -17,15 +17,134 @@
>  /delete-node/ &cpu_pd9;
>  /delete-node/ &cpu_pd10;
>  /delete-node/ &cpu_pd11;
> +/delete-node/ &gpu_opp_table;
>  /delete-node/ &pcie3_phy;
>  
>  &gcc {
>  	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
>  };
>  
> -/* The GPU is physically different and will be brought up later */
> +&gmu {
> +	/delete-property/ compatible;
> +	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
> +};
> +
> +&qfprom {
> +	gpu_speed_bin: gpu_speed_bin@119 {
> +		reg = <0x119 0x2>;
> +		bits = <7 9>;
> +	};
> +};
> +
>  &gpu {
>  	/delete-property/ compatible;

I think, you can drop this line.

> +
> +	compatible = "qcom,adreno-43030c00", "qcom,adreno";
> +
> +	nvmem-cells = <&gpu_speed_bin>;
> +	nvmem-cell-names = "speed_bin";
> +
> +	gpu_opp_table: opp-table {
> +		compatible = "operating-points-v2-adreno", "operating-points-v2";
> +
> +		opp-1400000000 {
> +			opp-hz = /bits/ 64 <1400000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
> +			opp-peak-kBps = <16500000>;
> +			qcom,opp-acd-level = <0xa8295ffd>;
> +			opp-supported-hw = <0x3>;
> +		};
> +
> +		opp-1250000000 {
> +			opp-hz = /bits/ 64 <1250000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
> +			opp-peak-kBps = <16500000>;
> +			qcom,opp-acd-level = <0x882a5ffd>;
> +			opp-supported-hw = <0x7>;
> +		};
> +
> +		opp-1107000000 {
> +			opp-hz = /bits/ 64 <1107000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +			opp-peak-kBps = <16500000>;
> +			qcom,opp-acd-level = <0x882a5ffd>;
> +			opp-supported-hw = <0xf>;
> +		};
> +
> +		opp-1014000000 {
> +			opp-hz = /bits/ 64 <1014000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +			opp-peak-kBps = <14398438>;
> +			qcom,opp-acd-level = <0xa82a5ffd>;
> +			opp-supported-hw = <0xf>;
> +		};
> +
> +		opp-940000000 {
> +			opp-hz = /bits/ 64 <940000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +			opp-peak-kBps = <14398438>;
> +			qcom,opp-acd-level = <0xa82a5ffd>;
> +			opp-supported-hw = <0xf>;
> +		};
> +
> +		opp-825000000 {
> +			opp-hz = /bits/ 64 <825000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +			opp-peak-kBps = <12449219>;
> +			qcom,opp-acd-level = <0x882b5ffd>;
> +			opp-supported-hw = <0xf>;
> +		};
> +
> +		opp-720000000 {
> +			opp-hz = /bits/ 64 <720000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +			opp-peak-kBps = <10687500>;
> +			qcom,opp-acd-level = <0xa82c5ffd>;
> +			opp-supported-hw = <0xf>;
> +		};
> +
> +		opp-666000000-0 {
> +			opp-hz = /bits/ 64 <666000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +			opp-peak-kBps = <8171875>;
> +			qcom,opp-acd-level = <0xa82d5ffd>;
> +			opp-supported-hw = <0xf>;
> +		};
> +
> +		/* Only applicable for SKUs which has 666Mhz as Fmax */
> +		opp-666000000-1 {
> +			opp-hz = /bits/ 64 <666000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +			opp-peak-kBps = <16500000>;

This looks odd, why is it so high?

> +			qcom,opp-acd-level = <0xa82d5ffd>;
> +			opp-supported-hw = <0x10>;
> +		};
> +
> +		opp-550000000 {
> +			opp-hz = /bits/ 64 <550000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +			opp-peak-kBps = <6074219>;
> +			qcom,opp-acd-level = <0x882e5ffd>;
> +			opp-supported-hw = <0x1f>;
> +		};
> +
> +		opp-380000000 {
> +			opp-hz = /bits/ 64 <380000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +			opp-peak-kBps = <3000000>;
> +			qcom,opp-acd-level = <0xc82f5ffd>;
> +			opp-supported-hw = <0x1f>;
> +		};
> +
> +		opp-280000000 {
> +			opp-hz = /bits/ 64 <280000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> +			opp-peak-kBps = <2136719>;
> +			qcom,opp-acd-level = <0xc82f5ffd>;
> +			opp-supported-hw = <0x1f>;
> +		};
> +	};
> +
>  };
>  
>  &gpucc {
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

