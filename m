Return-Path: <linux-arm-msm+bounces-74904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BCFB9D4E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 05:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6F0B1B2194C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 03:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302A42D73B5;
	Thu, 25 Sep 2025 03:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DNQ7Qxab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913BD14F70
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758770558; cv=none; b=aljoIWxhySeP1WT0RiGxD0rNqjVtBA8OpBaFjmHzITiq0HeRx0mXlhI3R4Neg7s6zwBeYewpTuldJtocb7WlHeFWz8GtHCPZkRWFgNWqLYiF/8NYkAOVop752QR7Ej4hNhoWSqB3ca6bUzLhgCW+IWKte3QAuQASHvoG+7tT3lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758770558; c=relaxed/simple;
	bh=6pmeTUqKLAywnwstwRk80ICI60VTQgJd12zVbpW8u88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgEkZESQeFZbtvmm41OjAWH5LYHpwHeM8jUWH+BTRHBfQHW0GbEoh4JJPTANA28DLwi0KZBFZZhEdZMfZ9sEXE2OoWfHlmiWrq9McBWi9PnLNfBJIlBRTR1T2Mye5c4HxNZGhJ3nUcTMwVPbv6SlYRBDPYT0t8Ga/lXkTtI0tyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DNQ7Qxab; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONqWvu023856
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cpArUBkBwSCGSXirYH+a+MgH
	TCrTiPbzylW7/OuHCvc=; b=DNQ7QxabAyvg9uEPlYgehRAKOktqYaejEjwFOyAZ
	/ac4Rf4Zl2Z63RH3YpptKjE7xpJclHanT2KLfcT+JuyO8quzgoISSaKoT9R+PZDD
	+MRm8cGsyUYz509hI/35e1ivnXQ03+mZGzG126a0xL38cTcBBEQ6vUchsi5P09J3
	hf27GT0up7zM20LK1f3njmN8x5Yxdm5NcLXEMabTztb6hAsGs/3/IqIrtYmeK4JZ
	S3wqEbBLG2lBcyHh4axmPWWgNk0Km/oH08aqWyck7fyxrUnLKBTOoAANNDKfQ+Oz
	k6ZKnI2EijzsbdSQDhVrHCsYmi6Xe2AkwWNIHTtLNKShuQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0dkw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:22:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d91b91b6f8so8483841cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 20:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758770555; x=1759375355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpArUBkBwSCGSXirYH+a+MgHTCrTiPbzylW7/OuHCvc=;
        b=SmB73ucPpZX6Rd8A2XfLZx8IdN5dkYlSG0/KT3n2btK02NpkRQ/1usvyjkfwS1rYZV
         hUTUPCgZla1uKaXLYByrUjbZg5e4aLK2xL6BFpaIiHQejGYdLHMSFjJhadnTeb+Ycl66
         StkTF1W3/guMGsadUdbKqkvFhd0NyHXzq+n/0uv82bvX7MWje9QC7UERS82OhEExohRM
         sDySmkqpG0w7Z7OwA9uduFizOW4HkLr0OBbSMXR+rWR+iiogdIP9MThJ9l8peJtfm6XZ
         t9UeFxE++21OCBa99tMyn6nwgJN1Yhu2K6yWultqqYOY8Cg9AeoNDD2dlbdE8gS/fqLZ
         EqqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV00VY/3ZbrDwvEO8HFJCUYvtMPrf2mvMLF7eK+xjt9V23ilSx86mGh8ek6MKVt2UNjrBDX5qhZOyh5Szug@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2ue19nqlQXuf1raPmyLLtOQ7RxH/dcjz0yq5zOMLmD2bxK8ND
	IJ86oqjJeNnDZ0AZXnge9pKixSPesDGQ/db1cXLnXaRIW6U4nNIU6/pdiqcYnxhskK+kF1BykIu
	0nNb/ppAo2pUIfFHxaVFFLopJneO0+PX8P7iIUuPgvkouEB9n9PyeOEJySiNeFVCphKWj
X-Gm-Gg: ASbGncuG3xlirmM+m30jAvWrW/PY/BukFWlZNsvcfA4NZTtN8NXK9L0GTtgNg8IUNgo
	VufYMsXpg4YAOxdYabZtZHWW9wGAEcTjCJlZUaGWYczJF7QjiSjAcSWwytfuLLelWhVnS5vx/Q3
	VgPTbdHj7+qHU4y4YtSDKCzYJOSyQWb2hVJ0RjxlZ24tHdg4JK4fg21DwZYQUwqeEGIAYkKTnuW
	bU3gl8fFBPFgxo+dmFo5TT1Yo2JCZqPliCl71lBkjckUJ+TOFYkgzRDoKP+YNdp2zVG9DEeK7Qd
	womgcPgraVGjhUW8mKKYzhxCL9FGg3IImFzXMQUYAnXN5yJCZhpk6HxgIqsUzBK9GGpu9eNCoT7
	8/8+aFGCh5bRI7DTeuV43v37PBtPh2/8sO6d938tLAsnX1EDM7kiE
X-Received: by 2002:a05:622a:5508:b0:4d6:3a5a:269d with SMTP id d75a77b69052e-4da4c39c529mr25537651cf.67.1758770554799;
        Wed, 24 Sep 2025 20:22:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTUdtmrhyn0t7zzPYoXxLVVNyi0tAdluJQRBBaRFKrF7eL5xwBNXuv++LT/1rjvjlu3hyNzA==
X-Received: by 2002:a05:622a:5508:b0:4d6:3a5a:269d with SMTP id d75a77b69052e-4da4c39c529mr25537391cf.67.1758770554315;
        Wed, 24 Sep 2025 20:22:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831665624esm285483e87.69.2025.09.24.20.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 20:22:33 -0700 (PDT)
Date: Thu, 25 Sep 2025 06:22:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
Subject: Re: [PATCH 02/20] arm64: dts: qcom: Introduce Kaanapali SoC
Message-ID: <oitgxbjkjftsq6an6dbtqrb2vfwrpv7tybmo4zck24hzh7p6gr@4gochzskawnm>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-2-3fdbc4b9e1b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-dts-v1-2-3fdbc4b9e1b1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4b57b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7sPlXishrNHXYsHdOZMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: cMpToj0_IQzPkkfj_dUcCssCaLY73Jzb
X-Proofpoint-ORIG-GUID: cMpToj0_IQzPkkfj_dUcCssCaLY73Jzb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX9+zyA6Qd8Jrb
 txsh61Oul0VR0WULS6NpfaFGLP8bh82coFIpHViRIaYOMFgMXXSfGRy/0xY7NEmUzpoAfsEiwj9
 y5Q/eh9Od1EhK/6n9EYq+UQbaGRvx1RsEjVyiX/fBGRLG4uF4iAwH05S+4MBvHdJJGf/OMXQERK
 zwHvn4BYdRVWSPOl7Javtk3f6L2NLgIDf2mGC6NshRJRI5Vb8sr0xX1jUo5tXi/VsGOAnLOxLKy
 l/7LlLc1degdVmGz3Eu+poCeXGq0FGmXwOOEqivYYmLqcVcABPJvQNnP+U+nwvv4oSX6hAg36ra
 4UZk3b6ll4BUezq3XBT00Ebqh5xDqms2agaIvZU2ayUnj0pS4Knuy2ICS7uRGcbMgicU3hqwLd4
 XUh2J2vY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

On Wed, Sep 24, 2025 at 05:17:19PM -0700, Jingyi Wang wrote:
> Kaanapali is Snapdragon SoC from Qualcomm.
> 
> Features added in this patch:
> - CPUs with PSCI idle states and cpufreq
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - GCC and RPMHCC
> - TLMM
> - Interconnect with CPU BWMONs
> - QuP with uart
> - SMMU
> - RPMHPD
> - UFS with Inline Crypto Engine
> - LLCC
> - Watchdog
> 
> Written with help from Raviteja Laggyshetty(added interconnect nodes),
> Taniya Das(added Clock Controllers and cpufreq), Jishnu Prakash
> (added rpmhpd), Nitin Rawat(added ufs) and Gaurav Kashyap(added ICE).
> 
> Co-developed-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
> Signed-off-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1320 +++++++++++++++++++++++++++++++
>  1 file changed, 1320 insertions(+)
> 
> +
> +	soc: soc@0 {
> +		compatible = "simple-bus";
> +
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		dma-ranges = <0 0 0 0 0x10 0>;
> +		ranges = <0 0 0 0 0x10 0>;
> +
> +		gcc: clock-controller@100000 {
> +			compatible = "qcom,kaanapali-gcc";
> +			reg = <0x0 0x00100000 0x0 0x1f4200>;
> +
> +			clocks = <&bi_tcxo_div2>,
> +				 <0>,
> +				 <&sleep_clk>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>;

You have UFS clocks. Why are they <0> here?

> +
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +

-- 
With best wishes
Dmitry

