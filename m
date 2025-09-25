Return-Path: <linux-arm-msm+bounces-75167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A525BA0E7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C35F84A182B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 17:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA503112C4;
	Thu, 25 Sep 2025 17:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jehT06DN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D2F30FC29
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 17:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758821489; cv=none; b=MFNX0Trygp8rwJyIw0BnRMLWuRZ7/WMz2QAMAx2c5n/9z0hH9OA6qNwZnqiRhEj4FTIyFH3pClbp9DOdxbn2PkhfpMHL7EFafDSKfxSlir60bjeQf9h5mp/TO3t8eUXKcYFcOhqgZu+nHaNTc06cZfC1HV5Nz96I/B2fedagQHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758821489; c=relaxed/simple;
	bh=pRTuQaQ5en7xRjzPn1i8iKKqSfcyIsaYI0MlEMrRtnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PE4c0DhY4GPd5FFqa5TnKE+lyC7KOuyo+terAKLMNulO5vH4K7mztxqHYQvXi2z1mNg+kOoRUACbCb1ectNHFjwoIB4S2QKEoRkXHvuFywLugjR4LhEyEOp4I5++eCeFeZqZRrb87N1RagSk74iPVlwsS8//1xbB5HLs2+8awjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jehT06DN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9WHrx024045
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 17:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XcofA0/e9bp5+FqjFDfqB18S
	Cd6t6q5WsiniwBz90Bg=; b=jehT06DNHpLwwAIG4mLJAES1aY1nxYUcC8f8/ncv
	jJa9a+D3h7EOpBRzdPA9Q4ZZ5fNJYEnPEWNKkPVFvV8+Fvl33Nz5qUtbFzGcxLZf
	tF3jUpp9vK23zqzGiiD7lVNq9u3YseE4YH6E/2zd3zcizehzdOJCASr4TQ/Dk/gN
	ONtnbUCrEaaDJ4wV+IrelMs0KD3sVEMwM6fQ8lUKjEGV90zhHjCAVBqce4egEIEi
	Lmhat6NefDppD7Dscq/Y39xr5m9YKARjALmgo6SLlOSzs8LplDBVYyfbZw/Hw9HG
	QQbWxJOv71BzC0dygv2AjtE09kIWrA+th4BCENY28Ov0Tg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0g1de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 17:31:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8574e8993cbso191919285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758821486; x=1759426286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcofA0/e9bp5+FqjFDfqB18SCd6t6q5WsiniwBz90Bg=;
        b=jseP4vsXDgkxsDhtK0yq9dXQas5mp8AsjwFpgbdkjkRhsCb6tSu5tiXMN2xxi6o+Oa
         QFJdaF0RxKSBluGg/YWi71n31v95AAcamBU0I9w5RvJkFgnvIW+Y86ssn3C2/JnmK54q
         5Drsb/lAY0Jx7fCRRn1jb/tj8HrfqY6vm2VMOL0WMO6aJjo692Z4KaQeCIc6K6h0CMk5
         fqlezYJ60qvvjbiC9x2mZn7XRDJccLHQDzPsze04O5jCKdn7eYC9yrj/1OvE6TzfdKSP
         RvOdtJr9zazRYGoKaEBsJj2MueKg+X/rPL41ZJLBLBvkOnnuQtSte7Cjl2XhEnvud0M3
         bWwg==
X-Forwarded-Encrypted: i=1; AJvYcCX+iG8hnGCed4hjIG+dA0ieSKKFI46uDDyN4THTO8F/43at3mgOe/ZXvo6k7fmAj6gONT+2i/kIzKNTz3mO@vger.kernel.org
X-Gm-Message-State: AOJu0YyC+6fu6V5wvrKE3BWk43mMPgCZd/59HGDUzlKDvVXCK4snnmxx
	I5+r3wsD6YaMoTVwC6PTUGGeq2+UVry49wEJWJaAuODEOMnUCtvtZoXiwV5Ls6hgpORdXQ0FpcY
	i1LfefL7UjvZas2YnetPXXW4Lnh6hpdgkZRObx0ITninEjo9zfWR22ZEQDRBlQm5mIMTq
X-Gm-Gg: ASbGncvoET8OeLS6oyCgTfG3dnUL/dde/+Njk3udWL1Tx+u6rxoF3p3swP98gJDVuvD
	n1A1PfDR5y4CSjufp1krI74pdohLZZwM4DIiiWVsCgkjQshGhiHOY6ncfp9k8ndrRmiQ/N7T/gs
	9zPPhOSMJCj1CT5lDgI2rMQ/Zw2MgseRGHU8L5KP6UWWGrtpdYPIg5Yibdr+F+IkrPbOkOHk8lH
	pKpED4J0iP3cL07RrPTNUtgZ0ZXzkwKsowvkLusG/aC160q+PFKPQME9I3YWdNvoNmayo1PpIzo
	7qKQnorXuTi/XKELMVZwfggICc2SgMQJUV2o63AcsMh3r4YHYdb4EvmbTTkreXs+o9FHAHaYsf7
	1huJ/vwV+T0hx8aBfb7dAohCgyjAYO5XB3d2QQyxie5zRfjruxtQ7
X-Received: by 2002:a05:622a:995:b0:4b5:fc2a:f37c with SMTP id d75a77b69052e-4da4c77c867mr59738981cf.74.1758821486028;
        Thu, 25 Sep 2025 10:31:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs34jOTuU/q9ApiNico/KaHV2NeRqlRXEj+YF6SNVDCulahwsTp214FKxT+pGvyE4hKawF7g==
X-Received: by 2002:a05:622a:995:b0:4b5:fc2a:f37c with SMTP id d75a77b69052e-4da4c77c867mr59738011cf.74.1758821485285;
        Thu, 25 Sep 2025 10:31:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb4773b19sm6900451fa.13.2025.09.25.10.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 10:31:23 -0700 (PDT)
Date: Thu, 25 Sep 2025 20:31:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/24] arm64: defconfig: Enable Glymur configs for boot
 to shell
Message-ID: <wzhfv4v5urehjjlldsdznrnv244pdzpuolofalvj3cerscipch@7gkb5dvjwl4i>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-2-24b601bbecc0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-v3_glymur_introduction-v1-2-24b601bbecc0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d57c6e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=h_zAmc7I_mnZi0L7CD4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: WHzwcf5-N4VM0IAuF5oho16pipuFRneI
X-Proofpoint-ORIG-GUID: WHzwcf5-N4VM0IAuF5oho16pipuFRneI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX7pHoP76dllOn
 0HctfRv45BUGye0ywdVp3XVtYOdgOYK9FC8Vta59oW8XcuTX2aiV+UYvvls2RrFZVd2qt3MHXUu
 E/YbV6NOkuLgOd+mNCz222eZLJ4NmcmyGSliXGEyHZ71tzepHCJFfSKUXYEhAMpLpTdwZukYfPQ
 kk5iEQJThAsgllUjrq6t/LOTLOI4E1GlT2bBZUdGB4RtFZV5kZFQBak+qnPXjhvB31YwaRYex8H
 xlHGZGyJ6r+iau7o5hM0clqdNLRlCU351gi389X+831uRCjvOSt49hI4WGQhKL92YzlNAS09864
 pol8dooVaXcC3I5jGhWeawj6vfpTfU2wgRc98v0ubq+IjZjU44BrAUD9LQvNWkd0G7UZS3FQLw/
 EfWyNdaL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

On Thu, Sep 25, 2025 at 12:02:10PM +0530, Pankaj Patil wrote:
> The serial engine must be properly setup before kernel reaches
> "init",so UART driver and its dependencies needs to be built in.
> Enable its dependency clocks,interconnect and pinctrl as built-in
> to boot Glymur CRD board to UART console with full USB support.
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..9dfec01d347b57b4eae1621a69dc06bb8ecbdff1 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -616,6 +616,7 @@ CONFIG_PINCTRL_IMX8ULP=y
>  CONFIG_PINCTRL_IMX91=y
>  CONFIG_PINCTRL_IMX93=y
>  CONFIG_PINCTRL_MSM=y
> +CONFIG_PINCTRL_GLYMUR=y
>  CONFIG_PINCTRL_IPQ5018=y
>  CONFIG_PINCTRL_IPQ5332=y
>  CONFIG_PINCTRL_IPQ5424=y
> @@ -1363,6 +1364,9 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
>  CONFIG_COMMON_CLK_MT8192_VDECSYS=y
>  CONFIG_COMMON_CLK_MT8192_VENCSYS=y
>  CONFIG_COMMON_CLK_QCOM=y
> +CONFIG_CLK_GLYMUR_DISPCC=y

DISPCC should not be required for the UART, it can go to =m

> +CONFIG_CLK_GLYMUR_GCC=y
> +CONFIG_CLK_GLYMUR_TCSRCC=y
>  CONFIG_CLK_X1E80100_CAMCC=m
>  CONFIG_CLK_X1E80100_DISPCC=m
>  CONFIG_CLK_X1E80100_GCC=y
> @@ -1641,6 +1645,7 @@ CONFIG_PHY_QCOM_QMP=m
>  CONFIG_PHY_QCOM_QUSB2=m
>  CONFIG_PHY_QCOM_EUSB2_REPEATER=m
>  CONFIG_PHY_QCOM_M31_USB=m
> +CONFIG_PHY_QCOM_M31_EUSB=m

Is this also a dependency for UART?

>  CONFIG_PHY_QCOM_USB_HS=m
>  CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
>  CONFIG_PHY_QCOM_USB_HS_28NM=m
> @@ -1718,6 +1723,7 @@ CONFIG_INTERCONNECT_IMX8MN=m
>  CONFIG_INTERCONNECT_IMX8MQ=m
>  CONFIG_INTERCONNECT_IMX8MP=y
>  CONFIG_INTERCONNECT_QCOM=y
> +CONFIG_INTERCONNECT_QCOM_GLYMUR=y
>  CONFIG_INTERCONNECT_QCOM_MSM8916=m
>  CONFIG_INTERCONNECT_QCOM_MSM8996=y
>  CONFIG_INTERCONNECT_QCOM_OSM_L3=m
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

