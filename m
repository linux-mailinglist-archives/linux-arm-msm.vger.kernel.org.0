Return-Path: <linux-arm-msm+bounces-89119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92991D22C51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5E4E31C30FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3EA22A4E1;
	Thu, 15 Jan 2026 07:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2ZHQ9TE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDwRDGbU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B0D326945
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768461185; cv=none; b=L59/9k8kC1h8o4G1FsH2/YM/4mcEPd22VD1N/KP9HaO6UXevDyV9hCYiW+JC9DLqU+FcH5kXtXhCgt+qw2x6xTUmWT86lUwqujzOmEvW0+O/3GX1r5rqIN9N1KAkQ9QFoIwsko2TOL/RAT6NtRqL7s6MwZKwJDmAJW80PyPIjN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768461185; c=relaxed/simple;
	bh=eKfcLk+muH4UEd7pgyogr5oGo/UFPSzGZ/mG/oiaLIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6UiOV8U7da++Ca/SWoC+hLKhV/e2VWX8zydASnUaK509hyOaY8phwn4rQTCwW7qK5R76GnS1JoyEZoc6gvCDgVbhWdSpl7bJbGZkJOsUi45r8UONuQ2yl2iKHJ1CHrFB9tLSuq4+BdZRvNJFGx5rDztYk3qaS/1854Db3vNXuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2ZHQ9TE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDwRDGbU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g56K3419744
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JbB0RIaPvMyGfzlb+5AFhaSW
	3Q4thui7pSP/G/zQhSs=; b=m2ZHQ9TErSrs1p9PMbsCqsF7C1TpzIw+sg6DDT5t
	FNOocLVr5ANO/19wOdJvm2BAZuQ1TzTy+7s/5wfXHY7UK8Ae8Jz0Yriq4PPIAiTm
	5FRugyN87AotLW4TIeEsmTasMbcum1MU+QYeQqe15a5V+ZuFHV38bNt9Yt+LrWnV
	8PhhRlMCma4VzWYjntWZRZYhN+3ZbRog+WMCYf0FkHtdomluHjP9d2c/9V548wxs
	wkmVJQCPDV6fXXAzVG9zO7D9miMcE25SLFln76Tt5xDCPsGqw/jbcQ+aBvE9sehT
	XbLTXwf/L4Z8pM4TBfXnHjI23IMNyY7a2VY57bmCBzjngQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj89ggu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:13:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a3929171bso12401546d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 23:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768461182; x=1769065982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JbB0RIaPvMyGfzlb+5AFhaSW3Q4thui7pSP/G/zQhSs=;
        b=bDwRDGbUCyD+9MIelhMUsJHT1f0Yj8nhn9Pj3aFMUcfAxFw9HdbFhLgicyKdY/twkX
         OSMk+/DDFGPTt/44wuaSi2xuGTso7fscPpDQzbU6LXyexi6rMFZvSAKxUMjOO3w4SFf6
         Vh1Gtj8dHi1WN+4xy36wXG+qP9eIudEgTWWzI49onQKBgQds54H1EyybYO5g3khyOpyl
         1FpZ/AYVv64CQ019BOW4S/RRI1nu1sacYrQhItkLfimkO87JHHWZBOflHijQp22BXYiv
         LXxjv9zXb7hfHD1AyZfWNz9lqCGQUS+295KL6G3JFu++hRTtYppEFqWvnC68bjMqTUgp
         OBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768461182; x=1769065982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbB0RIaPvMyGfzlb+5AFhaSW3Q4thui7pSP/G/zQhSs=;
        b=EsoQpX/d1MJp+Zn+ztiPuttLjzqGJT++K+tKcluSwV+eozWYnX/mbcXGZ7NVXGCtY5
         ZNFuKNnyZTIxBgwfGQklo85v5KSLTM+bfCC5GsoM52B+N1io/6Ql0EBFPgh5sqp1cIaP
         FQBGSNzZ1cLly7r7ovsNZEdu2kR0Bl2y3UyDKC0toWAx30XrnzFl0zYjrRdqPRyZdZA3
         1rLYaIoFupYPr0dS7x++7VEyzHM9in3+/PeNDGZTacfD2ZgIBMOEZC5SU8Xak/4OarTv
         +2edJxw83Dg/0XrNGuC0SqvCRGgW+Oeym2YODgo5zVFssu1OE1tzFk2yKX5a6clXxmVS
         ksTw==
X-Forwarded-Encrypted: i=1; AJvYcCUMtuKtAUShbtW8G6dB4wRSKjJMtUVk+u8A1znXgwmKCq8joN/yxIioGW3KNsAl/qT+0cTVcCoxzN1RNRpN@vger.kernel.org
X-Gm-Message-State: AOJu0YyepsFJHwyiSgO1Vo+YmA7UGP9tdthjZY0QW8nLvtxHY+k38iTb
	eexNoTld6wghkIgI5agKzY1qx2ASi++F4iojrHaoLUw/KI5JSldkjkcyT3qwVvRfpl6+/foGw+X
	27/CMNs6hzAvkXfA3ojyaQk8UaPgsd8TfvLj9aZj1hOWwazJV4MYMk68HlTY2JcRPd/Xg
X-Gm-Gg: AY/fxX7+UivW6KEexmis6MDkscGgz58+taNlJUxFIshOKWBoWTINj2VTW2PzKuaIuKh
	pq2XPvJtw3DDHPP7smV4/GFronkKL3qfed+qOZu5NE3TacaX3+917vyUSOV49cBdplXRlgLVv3Q
	YDWxYbkYJR4hzWtTU/aI14qb+ULFrNB3gcIRFS9EaQs8GxQfUFTHGZEbecTlXOcNnd2KyI4zkcR
	vMJi/u8PMDv5Rszpop73JFOuNwibFRrOrMJWpnMy8WNpS6QFAz7fiYKEOsFh8rT6FTs/ymJDdCT
	z5UPrFoNWyfSw+hFeXu5iMk95U/piLub6fT8PArIlt3KYdjpi8W0hWTWgyumCudeR818SurqSa8
	BZX94NSrb3Z8oamcALEW5g46YVQKLOtkoSWoWMQVYsYvkjANuQzq2igY9nvyECEGVeEDfI4eMso
	WLDgZa0mhXTgVi64PhjPgCdWk=
X-Received: by 2002:a05:620a:3911:b0:8b1:7c0c:e292 with SMTP id af79cd13be357-8c52fb57d38mr751896185a.38.1768461181735;
        Wed, 14 Jan 2026 23:13:01 -0800 (PST)
X-Received: by 2002:a05:620a:3911:b0:8b1:7c0c:e292 with SMTP id af79cd13be357-8c52fb57d38mr751892185a.38.1768461181150;
        Wed, 14 Jan 2026 23:13:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8ad930sm55968831fa.28.2026.01.14.23.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:13:00 -0800 (PST)
Date: Thu, 15 Jan 2026 09:12:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 05/10] arm64: dts: qcom: kaanapali: Add support for
 audio
Message-ID: <vyvijzse5wb4bhepmo63gfljfhya3oqi52ndl3l47hgtdmch3k@yj3aj6ayrp5g>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
 <20260114-knp-dts-misc-v3-5-a6cc9e45de93@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-knp-dts-misc-v3-5-a6cc9e45de93@oss.qualcomm.com>
X-Proofpoint-GUID: tHOROM4xHM31uOk4aoWDzJVcrSigyIQ1
X-Proofpoint-ORIG-GUID: tHOROM4xHM31uOk4aoWDzJVcrSigyIQ1
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=6968937e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=s6j92GhN1Hy81qRwbs8A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0NiBTYWx0ZWRfX3xT7GyB1scw0
 MfMs51I8bHuH5HWKw2XyB0wIFoapTFyupC+5olZ9/Q/bl8qtmXe+2tGCsF+9bi/XkZkdgSz9NZP
 BZ01dZTWInEwhcnDt0fqFw6WTgEk0lfC0zlvLZ/QROEMGdXO5oMqwe239ot7koPjTAawLRqmJMa
 g1K1KpAOR7TzBpwuWmD2krPwADBiFL8ddtS+GIpbaASjFEquEmHGlq3ciVCSP4pHOVAAFS7ivIT
 73rYNdVt9oYs8hRY4/+RuTIfRVjO/JaAOBSFVKj3DOtHcstzh/pCLii90WQueCouSVPeY/hn0Yp
 ZKoICXSjDuaGWfrqza7WpXb4rzVaLnWJXg1Bbw0k0t1Aip8EFtHcaWGsBX7PdygrdGUxqM2zt4j
 kEeTPxl6HHaWjTQ6Y2bXycn6GSUXPuMwTaLb3BojfMvcz+2EZWZvPeqoDnH2pDWefGOoeXsemhZ
 AkDVcnfq2J3lm3V+6WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150046

On Wed, Jan 14, 2026 at 10:49:07PM -0800, Jingyi Wang wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> Introduce audio support for Kaanapali SoC by adding LPASS macro codecs,
> TLMM pin controller and SoundWire controller with similar hardware
> implementation to SM8750 platform. Also add GPR (Generic Pack Router) node
> along with support for APM (Audio Process Manager) and PRM
> (Proxy Resource Manager) audio services.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 396 ++++++++++++++++++++++++++++++++
>  1 file changed, 396 insertions(+)
> 
> +
> +		swr3: soundwire@6ab0000 {
> +			compatible = "qcom,soundwire-v2.2.0", "qcom,soundwire-v2.0.0";
> +			reg = <0 0x06ab0000 0 0x10000>;
> +			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&lpass_wsa2macro>;
> +			clock-names = "iface";
> +			label = "WSA2";
> +
> +			pinctrl-0 = <&wsa2_swr_active>;
> +			pinctrl-names = "default";
> +
> +			qcom,din-ports = <4>;
> +			qcom,dout-ports = <9>;
> +
> +			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f
> +								 0x18f 0xff 0xff 0x0f 0x0f 0xff

Use a single long line, please.

> +								 0x31f>;
> +			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00

-- 
With best wishes
Dmitry

