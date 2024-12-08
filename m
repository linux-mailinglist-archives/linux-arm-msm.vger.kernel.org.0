Return-Path: <linux-arm-msm+bounces-40907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4E79E84B8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 12:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04B63281639
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 11:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA4514659D;
	Sun,  8 Dec 2024 11:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z6ngVJuG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08DA145B26
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733658172; cv=none; b=QyBsN2mO5/DSJI4hTOON0tZVvdh88PLTNEMQcwiR08RxO52ax2FC7dQsDDwzDC+4a/uoZ1J4/PGrTbUIQqjpWDN/pRDvaLsFVebrPKDQaOIBiqniO6gUXcnjpA0V8WT9kwPF6Nrw1QmPxfSVEqVLX/CGH+kdw+3y0UFKvFDApIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733658172; c=relaxed/simple;
	bh=Vum42yeG4ePMwdSEBQgMnC472dCjq1yuN/izXZemDW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GaO9fwi2L36V/dEn3sD+g9kvYTeZlPoHP9pKxJGGb1/npiRW7P6JJROEJASpiU+KCjOiUQUmeTDsxgyhm2v97EP86HdVm+Dv2KqfV7szGZoqInRibDnMV/sPQFbsLDfvBWgDpRAi6k//47aw0Uj0lGELcqVEJDt+3gtYWsFb8l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z6ngVJuG; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e384e3481so1542514e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Dec 2024 03:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733658169; x=1734262969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rqdm0M9gFPaLS3SS+kPxyU+HG5ijsXwtikH0q0stVKg=;
        b=Z6ngVJuGncQNsmnRBoDl2RepLilyeUyXCeQ5hN8Q+HnMcsfO82jIb1Hdorupe3AqDd
         qBd2InhytD3WaSc7IYdbFXzQfePG8VmFlR0/l6hfo1pFdv+2rkKrMnhMzIW0RYrMjFw5
         82a9X7y4g+It739yKBxauIVD72mk2hKlrCMA9hdAQw3uFzNzPKPyWRzhB4ZhR/kOXaY1
         6FhsIOTiK70SePquDkuu3zHF/X2pnmjRAgS0f1CH4LCE7f19VSPyMVgSjTFqj0gl1Fzp
         IsXkq36RmVKEiYsZE2Oo1R5kZO57KPsN/96S2njzVy0wFzcR13q0mrRy544b9OJL8Ydy
         kdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733658169; x=1734262969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqdm0M9gFPaLS3SS+kPxyU+HG5ijsXwtikH0q0stVKg=;
        b=t2/eNZztrJcYBU2LsrG0wFAF3EMi5o1xQFL3bzTaU7u4dCoEOxYx0L46buOB4qqTFf
         Dc1XZ0FK5dnImbh09C5F0zJ2bE9u7t+po7Q0D6HO0xOehngnUTVOBQXYANKPTiut+rtO
         sElAgTqD5xfz3WL4ojbFdvGU/WUxmh2guGUODXxNKP7uA22QAdp1iIl85HwyUjDBZDRj
         THBDOZnFxcVGL384gMpZr6fUyA9k/WtSKs8Fdv405Cgw6MOSoChVtJ0lJRFSUwDMZya8
         b7d3YbuT2bDiZx6WMUM8QrfUGPwQCBkFA86lsAXef+3NF7ynalbTTzIdcGknJDvCokD5
         +Y0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9uWin71OSDlkz03pC/04gyrq8fv12qGRVHKM5gdMmVA914QXoC6YqSW1TEmEkOzknd/SNbL306Srsxjd+@vger.kernel.org
X-Gm-Message-State: AOJu0YzGxgsgBR1OL8HJVdE7yaEUGd2LMFpFL6rpAjP2rbk8oeDgoRup
	/0v00ZljNJaKTT41bGUMKHTHnTYGCplCAdVkXOZfYZvAiCBIViXvgcb+XvljBo8=
X-Gm-Gg: ASbGncvcMl9n9bbfSB7m4FwS23+di+UgobLdxkYkKwIa6C4i1cO+SRbU0gJqbBayTzf
	VxpOa/QFRsau7WQPpDln4SHHL49yTByhS0EAKbJRlUFWKli5tQ3uojXcDA1TTWLskyE56YArwFN
	Upwfe/+0sOSBUzB65VqmfmxQqpdaQwO7IxJcNKh3fHPKEdpdr4gBNfpoAJ31bPjzfLzd+U3eq7i
	GjIIS/USq4MGQJfRUiFwe2N8uyFP7+pzQBOlbm4dNt4Jq5z+PP6ZwSkIrHWkfjCvJzSYcNBhELO
	V4Sihqpp5EX5UpbwvSFTHjL/nRuWDg==
X-Google-Smtp-Source: AGHT+IH8v5VqGhc3V23ZRaSeetM6jF9bsN4HcuZe4bb0441mma81kPswSik1ZjOvPZIUevWiRzkUZA==
X-Received: by 2002:a05:6512:3b98:b0:53e:16ed:eac2 with SMTP id 2adb3069b0e04-53e2c2efc44mr4026683e87.54.1733658168789;
        Sun, 08 Dec 2024 03:42:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53eaa3bd421sm427671e87.97.2024.12.08.03.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 03:42:47 -0800 (PST)
Date: Sun, 8 Dec 2024 13:42:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 19/45] drm/msm/dp: add support to program mst support in
 mainlink
Message-ID: <kdkbyhljc7dkvbmcrk6jhbtdybx3g5aca3uysw4l2qf4bf34uo@ty6jrhcruo5m>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-19-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-19-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:31:50PM -0800, Abhinav Kumar wrote:
> Add support to program the MST enabled bit in the mainlink
> control when a mst session is active and disabled.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 ++++
>  3 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 88d6262a972ef2d30c467ef5ff5c58ef3299ae7d..bdc66e5cab640c351708ba1a1bc3bca21784df6e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -417,6 +417,23 @@ void msm_dp_catalog_ctrl_psr_mainlink_enable(struct msm_dp_catalog *msm_dp_catal
>  	msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, val);
>  }
>  
> +void msm_dp_catalog_mst_config(struct msm_dp_catalog *msm_dp_catalog, bool enable)

Can this be merged into msm_dp_catalog_ctrl_mainlink_ctrl() ? Or is that
function called too early, when we do not know yet if we need MST or
not?

> +{
> +	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
> +							      struct msm_dp_catalog_private,
> +							      msm_dp_catalog);
> +
> +	u32 mainlink_ctrl;
> +
> +	mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
> +	if (enable)
> +		mainlink_ctrl |= (0x04000100);
> +	else
> +		mainlink_ctrl &= ~(0x04000100);

#define

> +
> +	msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
> +}
> +
>  void msm_dp_catalog_ctrl_mainlink_ctrl(struct msm_dp_catalog *msm_dp_catalog,
>  						bool enable)
>  {
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index c91c52d40209b8bcb63db9c0256f6ef721dace8a..07284f484e2861aeae12b115cd05a94afed1c9cb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -138,5 +138,6 @@ void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *catalog, u32 safe_to_
>  /* DP MST APIs */
>  void msm_dp_catalog_trigger_act(struct msm_dp_catalog *dp_catalog);
>  bool msm_dp_catalog_read_act_complete_sts(struct msm_dp_catalog *dp_catalog);
> +void msm_dp_catalog_mst_config(struct msm_dp_catalog *dp_catalog, bool enable);
>  
>  #endif /* _DP_CATALOG_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 2bfe2aac3c02b02b12713dbd98e79ed4a75b85d0..3839f1e8e1aeb2a14a7f59c546693141a0df6323 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -186,6 +186,9 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
>  	msm_dp_catalog_ctrl_lane_mapping(ctrl->catalog);
>  	msm_dp_catalog_setup_peripheral_flush(ctrl->catalog);
>  
> +	if (ctrl->mst_active)
> +		msm_dp_catalog_mst_config(ctrl->catalog, true);
> +
>  	msm_dp_ctrl_config_ctrl(ctrl, msm_dp_panel);
>  
>  	tb = msm_dp_link_get_test_bits_depth(ctrl->link,
> @@ -2132,6 +2135,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
>  	phy = ctrl->phy;
>  
>  	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
> +	msm_dp_catalog_mst_config(ctrl->catalog, false);
>  
>  	ctrl->mst_active = false;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

