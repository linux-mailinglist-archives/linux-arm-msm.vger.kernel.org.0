Return-Path: <linux-arm-msm+bounces-62978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9819AECE33
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E38A1886F98
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9EE1E412A;
	Sun, 29 Jun 2025 14:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqUZDdku"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38CA19F11F
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751209055; cv=none; b=kbEK69OdwvkplIWDZjHgd/oY/B0PDib9ucmyi714S5570KblbnjSFIn1naUUwQbQgEvS1ujAWEaY/e9x0iFlH8EYZ3vBc573p7uWQBYSfjtheG1Hm9yrUjb0odxj5j7YF63kJ2hJF0EHexd5f6LLeGJ/V1gpin/YICdJ8zLmnDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751209055; c=relaxed/simple;
	bh=t5wx6Ei2jEUF8ns6hoi+QHcGp3+kgilSqsIp7SpRn24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkSVJl7PitRTkpL6rIKirQ9Llx7Varh1F0KxWI8BJhc38+ZYkMYEAYx5KfksrHjZPUckcImtVW5Q6GAfVAXN7UY/VgLQx8s/Pbih+Qb2iyhpEWDZV85daI1Ayhq9fdiSmVd2+S4mtaKHkqh5+wuJI2x3Raihz+eprV3YZgmwHaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqUZDdku; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TEgxaw019955
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BnNP8cn0DdRJVcWbq039s4LC
	zuhSwZOV9bHFI2pcs5E=; b=AqUZDdku8x3XynYWngXvdlJl9bDn5DJaE5MQfDAv
	LYM0dXF3sb4u2QpZZQrnAQdBRZ6+9vf4KcbOxEddJdA/MAQUIYEIEdQGyLjLpQGQ
	8uuDkfqu4Whw52MmcPfpChohqfH7Iv7YhvMQfNZyib6PaYh/wheOcb8Rw1bO1hRd
	ZyNKgAl3i+uhcK+SRNSXmJtfojyG7otcEY7z64b8tguUFjjzwo52viQ4ZLzag9zH
	ml3B0oHnAxDD/h9qqU1S6sMlAsFIfzK1jMbA/elu4X+lOXUBMSQdkJvULdZeKL7S
	gjvB7eRJeJmfz4cP3oVxYRIjOmaNT58k4u9LRHEw0YOU5w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95ht8a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:57:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3e90c3a81so128215085a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751209051; x=1751813851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnNP8cn0DdRJVcWbq039s4LCzuhSwZOV9bHFI2pcs5E=;
        b=D/bwFtJe/eE0f+B6B5kWrqvjFW412vlNjIC4pEkU+ueo2lITgAy3uPNQ/KJoqQF4AR
         wnj08kZiGYAyh2JxQ0cUlhgP+KTxap5l3DHAGB0qVSOqIXz/U8abhjMOCKKOwFtsErau
         qPty1BqQETf4NfG4jEYQAlFE8yjQ33cuDT4E9xS8EGXVh12VnepBYrYw8MOPbGoZWgwe
         EWoROzbE6vvlIuCjXnxAATISyv5iTGgEsOJwh6ydzjxWru6p6Lq/LqFZpZwnM34rrNYS
         2hpb2e0DPIjgS60e9UG6FxMFDqSFDLx9mfV/jSD6OoI3/2VcXYC3+koNI3qSC27gIS/E
         CbsA==
X-Forwarded-Encrypted: i=1; AJvYcCUSwKl5sIuv7tOMCrhNfsKYuw6cgw/q4Fefsu031pfuZwvb+tDYWOt2BKhwUqBIeU2xyej/m2SbF89l9CIg@vger.kernel.org
X-Gm-Message-State: AOJu0YyEGCNFjg7JOdjEJ9Ck3j7e3h/bGMC1meXZhOxn5VeSZoh36QUu
	nyGR4Jlh6KV8JbCG6E2SkMSsG3yqjIy8Ti6JP+azEPDhniHOs2Pe4cPsN1TwP4Y+0jHRGuYj3CG
	RHbhAqa5gEMu8cCs0+F92l+v261C+g58D9PAtbxDLsAL9464yRMcwEvqa3VbXdk9ss0R9
X-Gm-Gg: ASbGncuG9u1TOsU2MINyniBL2BlncJsdWIRPfH9Un/uyygW0ndwQb7z7n32YLC/g26M
	aUM8OFu+0uBfAn4tDbmZU3cV2G1RQusVY+/60t9ferVdiBrGRbytDt+K7bsRQXaAwR07mEZpvJc
	Uj0r6fzof5HlY7aOIXFb0miYVnK4JicHkgiDZfPFTxd+H70JhcpjhuvWeku6wXjri7Ow1ee7twx
	ZXdetTqubB0xwlbdIogtNWoYJYe7Em2/6ew/eXm2z0TcyEEILIJVSiVvnQp6DAJsO03joQSsWu9
	fdYbSPFoRxgSAkNvZTwE2LfO34bR86vkA8hRbvpnXJTuFeNuYV1ZP/N40E6Ltiyrso31pDnA4Te
	nY8xL/kbkQTeacUYamti4xfr6sGGyGi2sEpA=
X-Received: by 2002:a05:620a:4589:b0:7d4:4ba8:2451 with SMTP id af79cd13be357-7d44ba82bc8mr863305185a.37.1751209051354;
        Sun, 29 Jun 2025 07:57:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE9p/qxaJvnoRTnx3v1Vt+pSIF5CcvFIpLgn63B04eSEq4rFdWe659L1ZeWr1qR4M+6naU6w==
X-Received: by 2002:a05:620a:4589:b0:7d4:4ba8:2451 with SMTP id af79cd13be357-7d44ba82bc8mr863301785a.37.1751209050812;
        Sun, 29 Jun 2025 07:57:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2b9382sm1134938e87.131.2025.06.29.07.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:57:29 -0700 (PDT)
Date: Sun, 29 Jun 2025 17:57:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
        simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
        sean@poorly.run, marijn.suijten@somainline.org
Subject: Re: [RESEND PATCH v2] drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue
Message-ID: <yafvivvzvcuyopyisxbkb4cqa3cmv4uzn7df34pwk4kqg2r55n@wx6spgecaw6d>
References: <20250629085036.765397-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629085036.765397-1-loic.poulain@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDEyNiBTYWx0ZWRfXxj/YzawEDYVC
 3HrDWuVv2k1eWUU5SpQTdUrx6VJJvPU0nnQ3dwgH/vAA989iI8nfvyebfMyYiIhBgZrWwZfO3IU
 UBXFCcdCi2/40WQ3qVNxd4UeM36cmXF20zZI2N5ERWUXokXmVRK2UWZYxO08VaInEdw26yi/Hny
 KeOJU8XQyVokQ6OcQg+wAobT7nbdfhYz8+LgY4L3rzLJrvwqMCZgf/4rwo4ueIHZMsNnBftbaj8
 I9+/gLF5QG1j05ZeYc4N8jTIG2kyrKDRYpFFnNrv+NVn8BvEyBbJ2U1CkhKQy8gJvcbRCT5C07d
 lPAe+cXoHZYwFE8I9IIDRJZHTqjvi2eNKlyS7NETprubjAQDo+zVzzQPJYBhoHju9gqDEJWLReh
 /WKPa5GGNnYqzoeSDmm98+UIoL1HUgL1F+a91kQyz+O/qfas2aaxWwxxK9EWoT8az0OXYPmW
X-Proofpoint-ORIG-GUID: sjBtzdp6PNIwBIBLCMeIowZrwiWNmkl_
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=6861545c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=JX5182JzW0ck7cE1vvwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: sjBtzdp6PNIwBIBLCMeIowZrwiWNmkl_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290126

On Sun, Jun 29, 2025 at 10:50:36AM +0200, Loic Poulain wrote:
> To configure and enable the DSI PHY PLL clocks, the MDSS AHB clock must
> be active for MMIO operations. Typically, this AHB clock is enabled as
> part of the DSI PHY interface enabling (dsi_phy_enable_resource).
> 
> However, since these PLL clocks are registered as clock entities, they
> can be enabled independently of the DSI PHY interface, leading to
> enabling failures and subsequent warnings:
> 
> ```
> msm_dsi_phy 5e94400.phy: [drm:dsi_pll_14nm_vco_prepare] *ERROR* DSI PLL lock failed
> ------------[ cut here ]------------
> dsi0pllbyte already disabled
> WARNING: CPU: 3 PID: 1 at drivers/clk/clk.c:1194 clk_core_disable+0xa4/0xac
> CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted:
> Tainted: [W]=WARN
> Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
> pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [...]
> ```
> 
> This issue is particularly prevalent at boot time during the disabling of
> unused clocks (clk_disable_unused()) which includes enabling the parent
> clock(s) when CLK_OPS_PARENT_ENABLE flag is set (this is the case for the
> 14nm DSI PHY PLL consumers).
> 
> To resolve this issue, we move the AHB clock as a PM dependency of the DSI
> PHY device (via pm_clk). Since the DSI PHY device is the parent of the PLL
> clocks, this resolves the PLL/AHB dependency. Now the AHB clock is enabled
> prior the PLL clk_prepare callback, as part of the runtime-resume chain.
> 
> We also eliminate dsi_phy_[enable|disable]_resource functions, which are
> superseded by runtime PM.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  v2: Move AHB clock into a proper PM dep instead of manually toggling it
>      from the PLL clock driver.
> 
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 65 +++++++++++----------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |  1 -
>  2 files changed, 25 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 5973d7325699..015cb579c669 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -5,6 +5,8 @@
>  
>  #include <linux/clk-provider.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
>  #include <dt-bindings/phy/phy.h>
>  
>  #include "dsi_phy.h"
> @@ -511,30 +513,6 @@ int msm_dsi_cphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
>  	return 0;
>  }
>  
> -static int dsi_phy_enable_resource(struct msm_dsi_phy *phy)
> -{
> -	struct device *dev = &phy->pdev->dev;
> -	int ret;
> -
> -	ret = pm_runtime_resume_and_get(dev);
> -	if (ret)
> -		return ret;
> -
> -	ret = clk_prepare_enable(phy->ahb_clk);
> -	if (ret) {
> -		DRM_DEV_ERROR(dev, "%s: can't enable ahb clk, %d\n", __func__, ret);
> -		pm_runtime_put_sync(dev);
> -	}
> -
> -	return ret;
> -}
> -
> -static void dsi_phy_disable_resource(struct msm_dsi_phy *phy)
> -{
> -	clk_disable_unprepare(phy->ahb_clk);
> -	pm_runtime_put(&phy->pdev->dev);
> -}
> -
>  static const struct of_device_id dsi_phy_dt_match[] = {
>  #ifdef CONFIG_DRM_MSM_DSI_28NM_PHY
>  	{ .compatible = "qcom,dsi-phy-28nm-hpm",
> @@ -696,24 +674,30 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	phy->ahb_clk = msm_clk_get(pdev, "iface");
> -	if (IS_ERR(phy->ahb_clk))
> -		return dev_err_probe(dev, PTR_ERR(phy->ahb_clk),
> -				     "Unable to get ahb clk\n");
> +	platform_set_drvdata(pdev, phy);
>  
> -	ret = devm_pm_runtime_enable(&pdev->dev);
> +	ret = devm_pm_runtime_enable(dev);
>  	if (ret)
>  		return ret;
>  
> -	/* PLL init will call into clk_register which requires
> -	 * register access, so we need to enable power and ahb clock.
> -	 */
> -	ret = dsi_phy_enable_resource(phy);
> +	ret = devm_pm_clk_create(dev);
>  	if (ret)
>  		return ret;
>  
> +	ret = pm_clk_add(dev, "iface");

This will break booting the kernel with some old DTS (before 6.0), where
we had iface_clk as a DSI PHY clock. Please document it in the commit
message.

> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Unable to get iface clk\n");
> +
>  	if (phy->cfg->ops.pll_init) {
> +		/* PLL init will call into clk_register which requires
> +		 * register access, so we need to enable power and ahb clock.
> +		 */

I think with pm_clk this is no longer reuquired. Could you please verify
it and drop extra pm_runtime calls from probe?

> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret)
> +			return ret;
> +
>  		ret = phy->cfg->ops.pll_init(phy);
> +		pm_runtime_put(&pdev->dev);
>  		if (ret)
>  			return dev_err_probe(dev, ret,
>  					     "PLL init failed; need separate clk driver\n");
> @@ -725,18 +709,19 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, ret,
>  				     "Failed to register clk provider\n");
>  
> -	dsi_phy_disable_resource(phy);
> -
> -	platform_set_drvdata(pdev, phy);
> -
>  	return 0;
>  }
>  
> +static const struct dev_pm_ops dsi_phy_pm_ops = {
> +	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> +};
> +
>  static struct platform_driver dsi_phy_platform_driver = {
>  	.probe      = dsi_phy_driver_probe,
>  	.driver     = {
>  		.name   = "msm_dsi_phy",
>  		.of_match_table = dsi_phy_dt_match,
> +		.pm = &dsi_phy_pm_ops,
>  	},
>  };
>  
> @@ -762,7 +747,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
>  
>  	dev = &phy->pdev->dev;
>  
> -	ret = dsi_phy_enable_resource(phy);
> +	ret = pm_runtime_resume_and_get(dev);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "%s: resource enable failed, %d\n",

It would be nice to make error prints to follow the code changes.

>  			__func__, ret);
> @@ -808,7 +793,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
>  phy_en_fail:
>  	regulator_bulk_disable(phy->cfg->num_regulators, phy->supplies);
>  reg_en_fail:
> -	dsi_phy_disable_resource(phy);
> +	pm_runtime_put(dev);
>  res_en_fail:
>  	return ret;
>  }
> @@ -821,7 +806,7 @@ void msm_dsi_phy_disable(struct msm_dsi_phy *phy)
>  	phy->cfg->ops.disable(phy);
>  
>  	regulator_bulk_disable(phy->cfg->num_regulators, phy->supplies);
> -	dsi_phy_disable_resource(phy);
> +	pm_runtime_put(&phy->pdev->dev);
>  }
>  
>  void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 7ea608f620fe..0c65821a3db2 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -103,7 +103,6 @@ struct msm_dsi_phy {
>  	phys_addr_t lane_size;
>  	int id;
>  
> -	struct clk *ahb_clk;
>  	struct regulator_bulk_data *supplies;
>  
>  	struct msm_dsi_dphy_timing timing;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

