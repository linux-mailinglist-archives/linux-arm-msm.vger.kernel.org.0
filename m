Return-Path: <linux-arm-msm+bounces-88374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B5ED0DEC8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 23:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA65B300A6EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 22:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCA8221F12;
	Sat, 10 Jan 2026 22:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwI+P/Gj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5511DDC1D;
	Sat, 10 Jan 2026 22:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768085620; cv=none; b=lGISynfc7N3icFBivnRqM5xYO6ZkAtKUb8FRoG12c5U++sVIPDozZYVpTDhaAM/ZIqtUnYL+OVmteku2SLUb3p34XJuE7VhYAOXNzCx3qEtfPc+wUKBavRia4K3WEjfQBX4nLzrL8rJcXWlEW3QNZgbFUg+HnrOtj3agz6bmLeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768085620; c=relaxed/simple;
	bh=zu8KmA7iTm8o7eYlgcTEtwZ1BTZxDzvpAVPGWphWOGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WzdtkaXKMBaKDvjy0yZUtNU2VCt6X578fznMSmt6ZK0oRAXvYVwsk21ulF1g0DzSETvwdEG+KAepkgwKewiki8s6vyzxh3+DQ5dNKirTEXg9b6AgzYQojFKgx3JMaXs8hD6sCdN/t45AlT1L9yt3MY4xCye/M5jezkZPH5soUy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DwI+P/Gj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450C3C4CEF1;
	Sat, 10 Jan 2026 22:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768085619;
	bh=zu8KmA7iTm8o7eYlgcTEtwZ1BTZxDzvpAVPGWphWOGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DwI+P/GjbEOStW2Kv8CyMlnplVMLKYUuRqeQNcnsbvEEy0Pqd+cNG8ug5jgkZ9Jdt
	 JL0GshbttdeHqq3Wl/JZ12pSzP4k5C2PpkQpyAYcqr7zoAjyAXaOYRBrr6T/sceAxY
	 mEyfxeis4ozICCgPPegs34ZeqK0O3kFd9/N6nOPLzizalGHPC0KjK+soph2tQCCjid
	 8zFxVZvTiY5LhKo+5ahdCF7K0N6faOYf1/LwGuA+wwyW8oPSdLhYmPT42LXIfIpDyX
	 4wEcyBqW3Q8GCuWFKPgqnB9YEOd9IC3KYZjmBCVffCuhmLviTjL/Ldb7wyxCpyuUQB
	 Smpm2TNW4ALHw==
Date: Sat, 10 Jan 2026 15:53:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/msm/dp: Avoid division by zero in
 msm_dp_ctrl_config_msa()
Message-ID: <20260110225334.GA1672363@ax162>
References: <20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org>
 <ca851614-2804-4029-9799-19e71dd73414@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca851614-2804-4029-9799-19e71dd73414@oss.qualcomm.com>

On Fri, Jan 09, 2026 at 10:06:29AM +0100, Konrad Dybcio wrote:
> Dmitry, would it be beneficial to throw an actual error when the rate is
> is mangled? i.e.

This certainly seems more robust if acceptable.

> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index aa2303d0e148..4f710b8e6bc6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2404,9 +2404,9 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
>         return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
>  }
>  
> -static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
> -                              u32 rate, u32 stream_rate_khz,
> -                              bool is_ycbcr_420)
> +static int msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
> +                                 u32 rate, u32 stream_rate_khz,
> +                                 bool is_ycbcr_420)
>  {
>         u32 pixel_m, pixel_n;
>         u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;

This initialization is now unnecessary with this change.

> @@ -2415,14 +2415,21 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>         u32 const link_rate_hbr3 = 810000;
>         unsigned long den, num;
>  
> -       if (rate == link_rate_hbr3)
> +       switch (rate) {
> +       case link_rate_hbr3:
>                 pixel_div = 6;
> -       else if (rate == 162000 || rate == 270000)
> -               pixel_div = 2;
> -       else if (rate == link_rate_hbr2)
> +               break;
> +       case link_rate_hbr2:
>                 pixel_div = 4;
> -       else
> +               break;
> +       case 270000:
> +       case 162000:
> +               pixel_div = 2;
> +               break;
> +       default:
>                 DRM_ERROR("Invalid pixel mux divider\n");
> +               return -EINVAL;
> +       }
>  
>         dispcc_input_rate = (rate * 10) / pixel_div;
>  
> @@ -2458,6 +2465,8 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>         drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
>         msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID, mvid);
>         msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
> +
> +       return 0;
>  }
>  
>  int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
> @@ -2525,10 +2534,11 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
>  
>         msm_dp_ctrl_configure_source_params(ctrl);
>  
> -       msm_dp_ctrl_config_msa(ctrl,
> -               ctrl->link->link_params.rate,
> -               pixel_rate_orig,
> -               ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
> +       ret = msm_dp_ctrl_config_msa(ctrl, ctrl->link->link_params.rate,
> +                                    pixel_rate_orig,
> +                                    ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
> +       if (ret)
> +               return ret;
>  
>         msm_dp_panel_clear_dsc_dto(ctrl->panel);
>  
> 
> 
> Konrad

