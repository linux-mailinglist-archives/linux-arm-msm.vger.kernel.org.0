Return-Path: <linux-arm-msm+bounces-71041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D184FB38A98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 22:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 880C436278E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 20:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB0E2D0C64;
	Wed, 27 Aug 2025 20:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCQmge2z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1436205E2F
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 20:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756324914; cv=none; b=Iq5pvJxdNpFXCe3ixHwixhLCck100QvA+tpWqakp95MNrZhUQY2N5E4h5kgN/6eQP7rq5YHsTLOMWUpdWyfq8LWzf7s/o/YPTNPdojc+Ml8qyImDGmkfYs4KgnwzQvYGI6QzVOmx/Ko3k7xtYIsKRxdgtgXz6BlS4+y7XsHbQFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756324914; c=relaxed/simple;
	bh=D+yMe14Tpf3c/xVv+fARYf5ETFaAbJnlz/bfCvrAoVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CWt9hpNBB3B9pXlyxQtgBGdzc94dWlhnPiUTx5kBPW0vm8BzOsv9dshofhhnI+vwSU4QdKX6zzycs8TNUnFABtyXGFvuMJmCBYQdbR/axtI/+hBhTR3kqhBzaGvhgKT29fkRA5LrW3KgCKCG6cONR3vf94kiTMhRavroGTVmvvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCQmge2z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGcswl018241
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 20:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mj5+squga8BNTuWWdxANYVJo
	JH996l1kauWfdJepZFE=; b=dCQmge2zI+S/miJfNaWjec7m+SYfczGuPw35ICh3
	g/av9RED+72TSbUVoDv9D5/bufDvdPuqfhOqyMBptFUoxkZ+yYhroz0G2SjyAe5y
	76uJ7FPxHKg/jOkrxZodmFHak2wnraXWdZANqDG94ovrxRIR6InX9wCF9L5EJAo9
	I51HS4QkzvggMhnulO18zBU0UJJujb9GGMXzan0AyCSi7FDrKiW98k8nQiXcGZTq
	WwNPmVQ2ALbXM0Wu7lP9fhfdTYNUXq/Fn8P58bVWv36E8SV1s7mSHKF5HU+nPqor
	7xI19j3BpyWesKhie+i+dvk0wW2AS8jZIu5BJLoQM0QIUQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfnss8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 20:01:51 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-892df014a77so1065829241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 13:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756324911; x=1756929711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mj5+squga8BNTuWWdxANYVJoJH996l1kauWfdJepZFE=;
        b=V4y1jmcynF6mIY6rG30V1xYny9gdc6QfiR1mB2RpELww8TcXPBG+eH31s/dOWNZvG+
         yk8YSAi1q3vvkA70mS1VVWRH8KUEavoXTU2g05Hcrl1lT3te+d02jSBxH5CeF0VLXro0
         XTcrwMI6gNVnveYy+Qs6L7sl4N7bOdN2OuoVQJsiT3eGQg7tAfwG6fQGjJFG8V17fAH5
         fFuaVcbpZkYaAUrNLYl/zIrFsf5uhWZFI5PGfyx8lcTv30Ttckwp1LarGrsFQyuADzID
         FK2fOdhxTJSxE5TqamFfcXagzeFgV4dATpl9iZeKT2xKhyClkCDbHQ/hewcnUAV3DlLb
         m4Tg==
X-Forwarded-Encrypted: i=1; AJvYcCU1pQy4X7iD6+PiRwD88TvQ+GNeD6gmy1Ac/fcm8ohunfZjHHUuECgGgNv858pR4cHMbg7CFolR/8Kl0JPp@vger.kernel.org
X-Gm-Message-State: AOJu0YyyeygW20Czp7zE9TGqE+4nsALf8sJw0EJdvnCzld0S/laenAqI
	AtsSyonIXBu191km4eabquJ7ZGfOIeah4g8ujvgeBnPEjsIMbN0HNzJ2o4V+1uSz/+wP6Lu0QMc
	YpTuPMQVY74otYKwWGuQHjksEMZuVb4+6F4JmpGP7JyCshfMu3MHvVzJk1lsidwi5sQLD
X-Gm-Gg: ASbGnctV2A3B83LV0By4RHdndfD0a150xd1C/2qZMvFB4YV6yVf0e/BKPc0xuf3zF+q
	xIAm+LYmPg+A5cNVoyk07Nxr6N4XQFiP1D3PIzA9XhcP+T9bJfn6KQjYZoUiu/Xg3u+5trEM/zA
	wMGXizAHLTUe5r3dz8blfzcNc7GcEvsqO41bfnre9yZB7hQY3qazV1etWwxc1qOcce/1aCiuqgb
	yuhw9fxEh2j9jMvHP1t1MGZHHCnbwPLxN0lP0fOMpNJ4lP/sNLUM/97Ruz+UbiGmruRyVKJSOtw
	qXxFngw8ZP5F6uqagQUewd62sOyHxWH5wA837IkMZcp/H/+Vuh7llaRdNgUSKciT7MVlfZ7Rjag
	GpeVOcb1kSeh0+WBt/BR54nHRcFYc/1zkS7zZTc7OqROe4H+fTaVV
X-Received: by 2002:a05:6102:6495:20b0:519:534a:6c36 with SMTP id ada2fe7eead31-5248bbc70bfmr1665705137.14.1756324910406;
        Wed, 27 Aug 2025 13:01:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ/jsGbo/0+zzG2ju1FyxFl38fR1Yik7DRNOp7bX+dkjfU3yg/w7t7cOerSB8W3MKBRSWD6A==
X-Received: by 2002:a05:6102:6495:20b0:519:534a:6c36 with SMTP id ada2fe7eead31-5248bbc70bfmr1665596137.14.1756324908466;
        Wed, 27 Aug 2025 13:01:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e5a5b79sm30873701fa.34.2025.08.27.13.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 13:01:46 -0700 (PDT)
Date: Wed, 27 Aug 2025 23:01:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fange Zhang <fange.zhang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        xiangxu.yin@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Li Liu <li.liu@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: Add display support for QCS615
 RIDE board
Message-ID: <yutyrfb73wbxlweoq3mc6ezyqr56snzmznw3k6mcbc56fpfayg@3h5jwymlo3ol>
References: <20250827-add-display-support-for-qcs615-platform-v7-0-917c3de8f9ca@oss.qualcomm.com>
 <20250827-add-display-support-for-qcs615-platform-v7-2-917c3de8f9ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-add-display-support-for-qcs615-platform-v7-2-917c3de8f9ca@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX8HtDMq4ZyRXl
 n/vJPkHnfnUYTUHe4zzbgFooAUtm6SPTfLX9s4i+vxJ33id9cHmGAH8MXP45Zzerju53p8pYsEq
 A4zwRqCXyGIaJJxJVZM4XCWQkgBscmqj0wE9tOF00jm3Lz25KrMWihLDHwTRRym+lPsPqTA7O0p
 LgiLm2Y5c52ct3FzrqL3v1YR60qYjPJ7inMgvgz9F1qj3iArkmf76ZBil4RsdDPZEUrjBxSlwiQ
 fmNAEemzP2bY/pz0DGIR83sI4+59fOkUMuUuZGw859y/IP8HvuwxVCqV2yKKXhSNBssh/0o2/3y
 POmcNEvGbs+yKyNMaI57Ncm5HdPRJS+k6eGZ/xie8EVDkCD4Rb+OcqaF/mFMomhW8ra2M+I4QhW
 ZYKWxk+n
X-Proofpoint-GUID: 0ysq_AIxR72dFdLtSz7vleUCQvgU2dJ2
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68af642f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=NCHn67HwCZdYxv9cn_sA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: 0ysq_AIxR72dFdLtSz7vleUCQvgU2dJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On Wed, Aug 27, 2025 at 09:08:39PM +0800, Fange Zhang wrote:
> From: Li Liu <li.liu@oss.qualcomm.com>
> 
> Add display MDSS and DSI configuration for QCS615 RIDE board.
> QCS615 has a DP port, and DP support will be added in a later patch.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Li Liu <li.liu@oss.qualcomm.com>
> Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 150 +++++++++++++++++++++++++++++++
>  1 file changed, 150 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index e663343df75d59481786192cde647017a83c4191..f6e0c82cf85459d8989332497ded8b6ea3670c76 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -39,6 +39,76 @@ xo_board_clk: xo-board-clk {
>  		};
>  	};
>  
> +	dp-dsi0-connector {
> +		compatible = "dp-connector";
> +		label = "DSI0";
> +		type = "mini";
> +
> +		port {
> +			dp_dsi0_connector_in: endpoint {
> +				remote-endpoint = <&dsi2dp_bridge_out>;
> +			};
> +		};
> +	};
> +
> +	vreg_12p0: vreg-12p0-regulator {

I should be more carefull when doing reviews. I thought that it was
pointed out already and didn't some of the obvious things...

First of all, the nodes are sorted. By the name, not by the label.
Second, there are already regulators in this file. Why are the new nodes
not following the existing pattern and why are they not placed at a
proper place?


[.... skipped all defined regulators ...]

> +	};
> +
>  	vreg_conn_1p8: regulator-conn-1p8 {

Tadam! It's even a part of the patch.

>  		compatible = "regulator-fixed";
>  		regulator-name = "vreg_conn_1p8";

-- 
With best wishes
Dmitry

