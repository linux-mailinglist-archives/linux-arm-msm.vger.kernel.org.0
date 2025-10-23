Return-Path: <linux-arm-msm+bounces-78579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA29C00E01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 80B954FDBA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF7030E835;
	Thu, 23 Oct 2025 11:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6p4C73S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B27230ACE1
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761220130; cv=none; b=uqnQFyAAYjKGp+IlzPPTixAd5rl9OWSRqws6w2e1V9DZ2vOgUs8+LW9vi+YbNgznOIY5Y6lUhM1dcmRsvVPwfcsQgaFepHZTQg8c5sHQuBz5G9Q8f9d56OX6s3OwtONvXIqmFIe9aDYp48SCIC76pXMjDwlZTwfv8PLOmSDIWFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761220130; c=relaxed/simple;
	bh=1SdNvE1cuwEq0NOTggB8fDJC6aA076G4wX9dvNePykk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cpnNTkMafUgr6LEZqhlvqh7q3gW48GhTl3C9uiAN26KSaDmmt0KbII9jCerMsiQYLG6kTWNI3zpw0rutIL/8EaQ6vAdylZtNu1JB2VIQrkIWAN5DARSGmSQONl1VjEdLayw9WvaTn5U5DGiSmGQuSLfAyGBOmjlf44qciWn5pyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6p4C73S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6mdUb030315
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8JacSqvTb8Izp/E+9oHQMd6Y
	7RxdSS+i4X6P9XWgoUo=; b=J6p4C73SrKh6N6ouWigYKFKpO8AKvdx39XOUokle
	b4AKubnJm3NGQAIRVA1wDV5zT6LXck6tRUJJdZ5JhbPIy2gLf/lLH2IZkqkhtD12
	X7k7kOUYNys6Z2MFYnuI1eAYZIBeyFSwO37BGdW6fcO/6qj9YCcYZDnNEJE2koI+
	4PHNvwRxnjMKFtHdpkBe/ZKhR2mb4k6sKhAekJEZSH7JTGzq/12KzE8/omOjLfQ6
	bMhknSOhXK6t1gPCIsICY+lBZ8TYZ5mDsDtU5vrD7GYYtxtQ7EProzeagE5OwNuR
	d/g2htTeoPKg258Pqooz/Q05su16xWZYTVoPxI9pGbQAFQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge87y9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:48:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8a3d0fb09so9798171cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761220127; x=1761824927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JacSqvTb8Izp/E+9oHQMd6Y7RxdSS+i4X6P9XWgoUo=;
        b=HMgCzTS5MsRg0pcEOgZrdrl/9z5gMqJ9Z4jBdOh+A7qbvCpb7qe25yPLx5NPTc4ZyW
         RdLZW3utY5SAt02OxL3P+gk77vedWS9WT9+/aUMPdapQcLNJpB378Y2UOLPVa24xsfer
         ONPEkbgw/iMP+ikOKfRPrMmvGWrdbB69NfTdy7KdfK8XuRnp4fuSCSbnWTPXiQMir9TZ
         /EXbVfuoIBRJTUc/Zr03iDCPouDHzt0pjAqnFSy2HNDtvhQZMjpI1kuvOaDkcYudgsZV
         R/JyYvJbTBJ4552EL1kDZ2X0Z4g2R899DalCZB7VNHNY53i6W9BXe8eIsFfKU7Bm2J2H
         kliw==
X-Forwarded-Encrypted: i=1; AJvYcCWB5Xbe5wSOAaTW75JL4MkezQPqJrv2gdK9Cuu/lS6wXg6vk8WKI+dfdWsC0js+XSHl4rKmTRAgLaNG8oar@vger.kernel.org
X-Gm-Message-State: AOJu0YxzweJIHoa1CYmVSdtU83Dsx79QwNdOL7ZAka7zG1PlQeST6H5h
	uPMCVvRDzIfPUciPlb+61rBaWbRSXF3PsckyvsmxOF/XEmKVSKf/xkEOCbgYI3LQZZ8pN60oYoI
	NV5l3EOVk5F3JGsy5dgNL0SkyuIZAnj+OZPc9qrFit6Dja1hN31x2O4TC9n4k5Gao480C
X-Gm-Gg: ASbGncujHeihOxa+4A//eV13M3eWXDgg2uwNgYiHW0/Ri0MmYKytQBEkQHHiNVxxR9J
	bNjBiJsjBEFqCkUHgEAargx9JAFYy0JJLdijhLCg839j8chOWTwiC2AVmUBcW+AQz/eeMAUjNyG
	8XrQ1wpDVWu/9zHMf5iQfWjK9AjWPTeIzG1YfwllBIHGeHFH0IDpsPsPXQh0+Y5iqfX2NRd9SIS
	R9+5QpKM2X8YhNbWAPahul1RqTp0wqTByhaKDb/xCBHlAKpszvLSwlud5pij9zBdZCRDHfOTjUx
	wDhu9XIs/fcFAQ4b1OTgukm3ipP/EpgHykrjREyh14MMdnQB7GuuUoQa0FOP9RP0dy89/Apc8e/
	zbsrkbMSoTxTwXgXHs/ClpuaZhyMIAzy++hR+334+5MKou0BcsG626U3r+18tnXLM3P3F5XX95A
	ErtOkO009HjKSJ
X-Received: by 2002:ac8:59d4:0:b0:4e8:91f3:ce80 with SMTP id d75a77b69052e-4e89d35c00dmr276317751cf.40.1761220127361;
        Thu, 23 Oct 2025 04:48:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGslKTOl2FnZpR64N0uFwx++ukkNxW4h01yUb6YToY7alXQDtuES4qDK8dNrLcsuDQNbwzhXQ==
X-Received: by 2002:ac8:59d4:0:b0:4e8:91f3:ce80 with SMTP id d75a77b69052e-4e89d35c00dmr276317331cf.40.1761220126814;
        Thu, 23 Oct 2025 04:48:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4d2070csm678165e87.83.2025.10.23.04.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:48:45 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:48:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX87vtA2c1Z0oU
 Gn4yuspQmH9L8Yne13uNbzXPVY8qutEQAZrtNH3j0ls+Ha+eNEd3QNOPC43DwrumBYWjNsx5HXM
 9/Di+FQNRDNkskSlrzMfcJJuMTkdastmA0z+luCYdcobmGCAtukdsjOcCRvfO2Kl70ma+BS59Tj
 Koz7yg6lc2A3X/uhnWfEe9lVbSJ1KpfydHn3fSF2JIaWQ60OOKGgjJOEJvrk9BpVQxdhDq/s2gj
 weAuUpfD1Fw95slQx8auFuem8wISUJar3Dh09Af/CMYWFJlzXgcEfI4x06U/Jxw6EBQfw8twTZr
 YzBFe+fe80TzXWRpOpP3HPHYxTGZUDoGl5K/ipoMRgyVBGc123UrzWALqBAjEZRf0ZoPnn9aVF8
 mAt7NGlsGM2xoPTVHV/S/ST6wBdY/w==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68fa1620 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=B1tu1MuE3RNTBmX3WhkA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: DZETWoPF7oDbc8KAfMGEVeO_hGqVX0mG
X-Proofpoint-ORIG-GUID: DZETWoPF7oDbc8KAfMGEVeO_hGqVX0mG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add DSI PHY support for the Kaanapali platform.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 4ea681130dba..7937266de1d2 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -577,6 +577,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>  	  .data = &dsi_phy_4nm_8650_cfgs },
>  	{ .compatible = "qcom,sm8750-dsi-phy-3nm",
>  	  .data = &dsi_phy_3nm_8750_cfgs },
> +	{ .compatible = "qcom,kaanapali-dsi-phy-3nm",
> +	  .data = &dsi_phy_3nm_kaanapali_cfgs },
>  #endif
>  	{}
>  };
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index e391505fdaf0..8df37ea50f92 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -64,6 +64,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs;
>  
>  struct msm_dsi_dphy_timing {
>  	u32 clk_zero;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 32f06edd21a9..93e53fb8b4fa 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -1518,3 +1518,26 @@ const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs = {
>  	.num_dsi_phy = 2,
>  	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
>  };
> +
> +const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs = {
> +	.has_phy_lane = true,
> +	.regulator_data = dsi_phy_7nm_98000uA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_98000uA_regulators),
> +	.ops = {
> +		.enable = dsi_7nm_phy_enable,
> +		.disable = dsi_7nm_phy_disable,
> +		.pll_init = dsi_pll_7nm_init,
> +		.save_pll_state = dsi_7nm_pll_save_state,
> +		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
> +	},
> +	.min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
> +	.io_start = { 0x9ac1000, 0xae97000 },

These two addresses are very strange. Would you care to explain? Other
than that there is no difference from SM8750 entry.

> +	.num_dsi_phy = 2,
> +	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

