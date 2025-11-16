Return-Path: <linux-arm-msm+bounces-81995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F41C619ED
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 18:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E4964EB1AB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 17:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E86330FC27;
	Sun, 16 Nov 2025 17:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCcw4Ien";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+Gp5WOe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF5930CD8B
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 17:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763315200; cv=none; b=l+UJ9I7PDOGSc6aKdPdVGU9kSqunLZnSPQYRLnRPJRfJtT6uD38Ke7y1FOXP/DRZwNXKwHyND2Tn6k1dBWh1fvFVE6eUZxO5M/3oW8UV4VnseO3KeMEHzYb8x1KO7MI9nWGEvCRC1GrbGsGqK/AK02kc1Ec0sUizxkv0DHUFHYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763315200; c=relaxed/simple;
	bh=gTVMN5yXdDZx5w0m5cq2yNtZ7OMuuhHWFD9a8A5vTlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzrpsnqXdUTv+a1ibV0gwr6xI3ZzKQItS3E4Yt6WNbMWurVYAXmdNBOTHcNmMqRc2X29yjFeGy8WgyJJsSslCrV0zR0BKDOVeR3aOdVQ7aFW0SHDyeA5oXSl/Cd3PZob/q+vn7J0CKL56HI8I6NVfV5oiPR+9E9VDuZa1B3zbE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCcw4Ien; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+Gp5WOe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AG7lN30269391
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 17:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wy1xISS/Y8XGRmNV/FnEfQIu
	ryMQgrmqIkYoMovA9N8=; b=PCcw4IenSjGScJrltPznT1JxFFJfZR7DEyVOiWsr
	dWAQkzZ8litymlO+1z6q59ysJENF6cR/jztEjfruOTuSVKA02ie1Mn1U0jJTf+st
	SaFf4BPgBOnWapx1wNNsri/LHBlv43n+c8kZ8zafq6mlOuXgoxJheSplmXHzHHCz
	XZAEKb+eH5F53xFDIhVRMnTPzEUzOiyXoJXXkSqh+bblWhBW1QzsZOiHuUCb8r9o
	zgbu/SxJ7U0MxjTDA1uenxQhvhZE8hHEHChsrDAFyPeSwhXotk5KcXS+PyBKofNM
	ezrjbF1RZgVfsav1gDdOdYa+9zj31QQC6mLxxYLIa6+DXw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejkatej5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 17:46:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee19028ae6so7130481cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 09:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763315197; x=1763919997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wy1xISS/Y8XGRmNV/FnEfQIuryMQgrmqIkYoMovA9N8=;
        b=R+Gp5WOezHb1FEBrP7b/82K1QOpnnnVLDldb1JG/uVt1E6UsnBkKMIqhk5kPVjJ4bv
         zZsXZbLa715j0HM56EboRqoeGV5sIB3/gY1e/kqujQRqnqirhKKzFF+ZjkWWMPIDFwV8
         Hoal2UM1DBsHydPqRY2aL2rxqQ2skNcR6cRsHbM5n4ASISrDtYOnZl549eSed24wZpnU
         LoUxvFECIDuzf2WLiTDb0ImcSyKO1gkqUdWkcQGNunbWG3/jTRPpkIjx7UhBwXUvzLez
         mlUo8rhCVaRvS1GHmyKEsrhcdE8iY9RaCdij4WBcYf2QORqIaHDLn3GnhWMi3TaDD2lP
         seCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763315197; x=1763919997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wy1xISS/Y8XGRmNV/FnEfQIuryMQgrmqIkYoMovA9N8=;
        b=BTqA0WmMgyEbw4D3R1CYRyRmWmCbsQ+jvqpK8vuiFo1biEMviggjRQwCUHUnPsrync
         1LbyphGmojBFEK/a/in54yxvAMBUUP61HWq77/5ayTn2zqWVBTQs1UOcq/0ueqalMhIO
         obycc80fZ0CgdRI5T+TOiAH/zOMQsmmvBP7G7GGLwV7oCdmLnaa1afBeXdofR+otJ+lE
         CmgphwqVMXSXZzIX/wnLik9CfLzvhSboyylDqNvGWfsM120V53nfZRoazSZ6GQPp1l6j
         twcVhLJQrtpXYM+SJPoRTERCRbu11tqHpmGvtUMlLsCRoppPSrlHiNLDhDwAv2XUc7or
         NMkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvTxFyu4aqQFfjEh3A8COM9RH6HLb14KngsLYiX6SVexjqp6PBG9NHwnQRtTvjCFMdl9Q+BSIxEN2GYXaQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8jrY6InB9cVO/mlOxlvamK5VTBuARBF8hvFpxmhXlMTbYFIHI
	RlHN7aD3SO3qcXdxk+xFykI3MrSnXPYZttkKC5fHx9GbEXbUJiiBDGmdpiAHwaUoX+ZAji/cC+K
	i2nK002fhsbpR6dTQ/pUjJkNTohuX4tX99YSQpAwELSyEk4qpOywqajfIykd+AvNcz0Zq
X-Gm-Gg: ASbGncviYG2LzTzlqpcWZ2MLXe0/DN+u/Rk2VI1PKOa+yRxJUMNBJ+n79YLuZq6bhme
	w4Rv9VFOaqqvyLFJf32quWFtnm0YwAije/Xpdfckp8IP1nYPfeFGlbX+47nISPhp6wecmiHWarn
	VYD2gRUr6A1YBNhxCIwQkimPVGL6cL+pY3BAqLVM9gH60Thb3LNoNaPRDPFyAnXm4p7EQtZR11N
	eoH7/YRJKhdF00PPG/QhH5jaUnEb4ApRmmX+crD4svKCPdOgTWH2UeQxcgfOvc9cbMUEMbG0ACw
	ANj269R/E2JUZ5p6vcz4PCsu9Q3ic3Se27AlZ1P1mL5ds1i3uvvJQ4EE2IN4Wos329iDReS1mwJ
	RueK2AwshuO3t7Dd7zOxYbYQfhQLgeWD16zXZ2AI3oYCkZPPO/yq0AXbYSscVIbYqZ2jfuXW6IY
	wPQ41XzaMg2aMw
X-Received: by 2002:a05:622a:19a7:b0:4ed:627d:49fe with SMTP id d75a77b69052e-4edf214da7bmr126105531cf.75.1763315197116;
        Sun, 16 Nov 2025 09:46:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9uOaEI0jXEnLXHX7UN/3SBy3llAGJpGHgAjSA8kFWeVEFs2xjYMUrU9oBjkd2XwzdELosKA==
X-Received: by 2002:a05:622a:19a7:b0:4ed:627d:49fe with SMTP id d75a77b69052e-4edf214da7bmr126105221cf.75.1763315196607;
        Sun, 16 Nov 2025 09:46:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b33acsm2586564e87.33.2025.11.16.09.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 09:46:35 -0800 (PST)
Date: Sun, 16 Nov 2025 19:46:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roger Shimizu <rosh@debian.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3
 board dts
Message-ID: <qirvwqob65x34yytw4warziotqfdas5bqjkbwfiighev7czz6f@zpofwqcznfwv>
References: <20251115-rubikpi-next-20251114-v1-0-fc630dc5bb5d@thundersoft.com>
 <20251115-rubikpi-next-20251114-v1-1-fc630dc5bb5d@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115-rubikpi-next-20251114-v1-1-fc630dc5bb5d@thundersoft.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDE0OCBTYWx0ZWRfXwSdqouDeyrHP
 QlulEvFpIXeRqlBZnakUmEWPxTvwH3r7SoMpRjA9W8EE+ad09YOrfBSdUQdMGvhrUky+7o3PdsD
 FiUv/E7gwoxu7GsrfyZFKrAnByMSbHRXEHZz9hrsp3TwR+C/gmCS+qulk6QjI5o2yMHS7WOojyG
 zlz+PDP72sRDR3VO+HoOCbzYn4qsayZTVWIHANjiS3hoykNAZRqVgw4WauyENtthl4T8t1SWssW
 jo/d7Mx7Ir2tvQaKBv4XljZ+kQWgNPbZ5pjuNj0n6k4VZOQMwtXJzF0T++M3s0mCH3pPfHo/nIG
 O7ZpWTaGCLRXQgYO9krE69pIfqDxYcTpqul4otPEvuN0vrUt3MHw9KXTKvC4r+2YBekx7d+Ix21
 QJizx0iwrA9dBtIQD2TO/tYMdcjlVg==
X-Authority-Analysis: v=2.4 cv=UctciaSN c=1 sm=1 tr=0 ts=691a0dfe cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8 a=9RU0YAj3ioh5PmlCrtQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-ORIG-GUID: N6A5dSz48Axtu9ucVcrTtaajqpm-w_NF
X-Proofpoint-GUID: N6A5dSz48Axtu9ucVcrTtaajqpm-w_NF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160148

On Sat, Nov 15, 2025 at 12:34:15AM +0800, Hongyang Zhao wrote:
> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> QCS6490 SoC.
> 
> Works:
> - Bluetooth (AP6256)
> - Wi-Fi (AP6256)
> - Ethernet (AX88179B connected to UPD720201)
> - FAN
> - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
> - M.2 M-Key 2280 PCIe 3.0
> - RTC
> - USB Type-C
> - USB Type-A 2.0 port
> - 40PIN: I2C x1, UART x1
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1415 ++++++++++++++++++++
>  2 files changed, 1416 insertions(+)
> 
> +&pcie1 {
> +	/* Using traditional address mapping */
> +	reg = <0 0x01c08000 0 0x3000>,
> +	      <0 0x40000000 0 0xf1d>,
> +	      <0 0x40000f20 0 0xa8>,
> +	      <0 0x40001000 0 0x1000>,
> +	      <0 0x40100000 0 0x100000>;
> +
> +	ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> +		 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;

No. Don't workaround bugs in kodiak.dtsi in your DT file. Please fix it
in kodiak.dtsi instead.

> +
> +
> +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 = <&pcie1_clkreq_n>,
> +		    <&pcie1_reset_n>,
> +		    <&pcie1_wake_n>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +

-- 
With best wishes
Dmitry

