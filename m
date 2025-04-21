Return-Path: <linux-arm-msm+bounces-54841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E42A94DED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 10:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9190B18885B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 08:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5F5202C44;
	Mon, 21 Apr 2025 08:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3Iz+LpB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C15B194080
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 08:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223376; cv=none; b=clZTsvCWNgSgOZqWhnP1GElVZiWfb0pqzfuGN58QwQOXR+Z14iXlFgBNXxYALP7KyX+YWnYah0RzoT5/ovDKUaIehkcCMG1fieCz3ueVoTanorysNAWpr/pRcP/SYk81l4OuWVORdLrwCxkgsvXb179wyknaqVAoNLrIaQbdnQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223376; c=relaxed/simple;
	bh=6HD1n8xs7n5w8LD46uLZq9L7Kk07vE8rM1+aHeJvTPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frLzppPPlWZbtq+hJHAWVFgNW7Jo2oF37Uf/UVNBc+fE6Xdr+eT8yfPql+kVG/aBnDzE0eUEo66z1P3yT4od/rbW2yGsOEpiPFTCJsZi8DY6TePdgofIV79lEIhpKC6hClsD33CkJlhreyr0HgtYZ0OMsa5mu+iWjsOSJYM14mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3Iz+LpB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L0kIKn011539
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 08:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qARCO4unAM6dJGj6oIu6kaF+8Quq5ZnXo3x6/YySZCc=; b=j3Iz+LpB8LorWG4/
	1CRgb50Hdr7BG4LFJAXQcqfgg1+Uj9+RXqkWfEfMwjm6Apr+D8X6NSY0xWaIuiPb
	/8b4y4IATVJqv5A4W1NFSukAznl4+FtXIAf29CGI6SUP8+15uI+PgyGQ/vJlGzTc
	OJC/P7bHBUgYXsXmTkC2GpGB/vr5ToGLBauB5n6BbdB3Fw2TqPrV7e/ha9ILEL1n
	zai/mocynsO2NurF4QT4Cn0FxuUSuYd3QNDdlXDj+Bkzhx+1gn/wTaoigp8VD9EZ
	bkn2lu58n0V5tc2ASxUlKGGAUnFYjV7lMu5pulZzGR+MYYZPmuNf1VZjQpDQ51By
	NTUDIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jbgs0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 08:16:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5b9333642so455286885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 01:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223373; x=1745828173;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qARCO4unAM6dJGj6oIu6kaF+8Quq5ZnXo3x6/YySZCc=;
        b=rN4qwy3K853urqypB5i8vPUA0XpzD4K1GJV4uHgVXhzw7yhW/EDZ3nOBWmSVnbbbHL
         i0azbnWKK49HGaOiGH6uAPDopu/wGhNb/mowVWkNp44tg59PDY9p0Y1C6JdLKaEgdqIs
         UH6Ztz2UxuswBWfmi8G7TjdfX4ZZJDk8NtwPk/5/+8zAvsL/NDhdRo6925y84jQjzHQ0
         1GrawswTjJTy5nmq57alOmyIQtgilSYmzY4KvsMFz6wxIkdOy2ZFGG45e5FX0U5yUm+E
         RU+CwAiadnN1rhg7OUc0yLrdALBY+/ZG+qyGam07a16RK1Gq/6yd03/eM+wpqCR/tyBU
         pNWA==
X-Forwarded-Encrypted: i=1; AJvYcCVq/TY8isD581jCsaIWR36OAtBC3IxaeQZlSixnVlejlJMykm5gr1hpm1Y6n1M7oUYB7Pct+APnZRHp6FYe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy10Aw6CcX8N9GsnOSycIEUfZODdgnaChJmiwFcYXhsO4Y5v7aG
	ZwBgurDHod2/QRqgUH6O1wYhKLK6+WeMC7zidpp96RygKgNTsR8vVNs7svT5MiToeV2EObPdSy+
	6++H5X3CR5fsBJUhoM72xMeNQDBAdyCUcmDOX12mY+gsSJ1ivGz8tRg3B0YazCwvH
X-Gm-Gg: ASbGncsgZP6UY2Mr6DqI2Cn6+Cx97YkhRlGKC4eDOom/iOed5X+rjZFToqEqSBMrvpM
	ykodPX3lhPtdrjEA8HTFGylFJ07m8F8vXohdy05gfTKZ8d85F+aJY1F5BYiqrj+pv7iLFhMXyrb
	ydnA9VmdEojiEXXbzrzELKMIEYSHMGTF6tkuk5Q5SuW0nZnr0GvLbOhH7ere9xhuXAl9VYRxrNX
	EhSj8u93AWh8uI2tFmDKrmn7Y307AVryUD0QwbaPPSY1eFZaqle3tCqPrjWydo7d8/Ye8yZyi74
	fVQjgH9ibZtv6q3VbsD5gp3JuAjI5SsfuAEKDbwZlZfQC8UgWX21+qiTECOWuFhArQwMdiJV8aA
	=
X-Received: by 2002:a05:620a:28c2:b0:7c5:5670:bd77 with SMTP id af79cd13be357-7c928049ca2mr1716048585a.55.1745223372992;
        Mon, 21 Apr 2025 01:16:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjwyE7MQkTDxkTD4bMTdrQVyq0KgcRLomu9pE/oxDMbBAj8GbWGPITnj/B2mJvuVUIGwaJfg==
X-Received: by 2002:a05:620a:28c2:b0:7c5:5670:bd77 with SMTP id af79cd13be357-7c928049ca2mr1716045985a.55.1745223372683;
        Mon, 21 Apr 2025 01:16:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5424b5sm869330e87.95.2025.04.21.01.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:16:10 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:16:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8953: sort adreno clocks
Message-ID: <nxv2k2ofiao47w7gmqcgfgn57heucs6yp2og3lkzlavjarado7@p5u4663yw3oz>
References: <20250421-a5xx-schema-v1-0-7d96b889322a@mainlining.org>
 <20250421-a5xx-schema-v1-2-7d96b889322a@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-a5xx-schema-v1-2-7d96b889322a@mainlining.org>
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=6805fecd cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=StrfYul8zGH_qiMLSD8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: jKNqnOSur4eTr8WPT69-0Y1oga0QPSe7
X-Proofpoint-ORIG-GUID: jKNqnOSur4eTr8WPT69-0Y1oga0QPSe7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_03,2025-04-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=886 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210063

On Mon, Apr 21, 2025 at 05:09:22AM +0200, Barnabás Czémán wrote:
> Sort adreno clocks in alphabetical order.

Why? The order of the clocks here matches the order in which they should
be brought up.

> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index 4793a60fa946195d3220b6c44dec170d443f56db..8a7e80c959fad09f950fe202eba76d3aae01d1ea 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -1052,18 +1052,18 @@ gpu: gpu@1c00000 {
>  			reg-names = "kgsl_3d0_reg_memory";
>  			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
>  
> -			clocks = <&gcc GCC_OXILI_GFX3D_CLK>,
> +			clocks = <&gcc GCC_BIMC_GPU_CLK>,
> +				 <&gcc GCC_OXILI_AON_CLK>,
> +				 <&gcc GCC_OXILI_GFX3D_CLK>,
>  				 <&gcc GCC_OXILI_AHB_CLK>,
>  				 <&gcc GCC_BIMC_GFX_CLK>,
> -				 <&gcc GCC_BIMC_GPU_CLK>,
> -				 <&gcc GCC_OXILI_TIMER_CLK>,
> -				 <&gcc GCC_OXILI_AON_CLK>;
> -			clock-names = "core",
> +				 <&gcc GCC_OXILI_TIMER_CLK>;
> +			clock-names = "alt_mem_iface",
> +				      "alwayson",
> +				      "core",
>  				      "iface",
>  				      "mem_iface",
> -				      "alt_mem_iface",
> -				      "rbbmtimer",
> -				      "alwayson";
> +				      "rbbmtimer";
>  			power-domains = <&gcc OXILI_GX_GDSC>;
>  
>  			iommus = <&gpu_iommu 0>;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

