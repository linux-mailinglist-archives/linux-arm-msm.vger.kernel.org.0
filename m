Return-Path: <linux-arm-msm+bounces-10503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 365918503D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 11:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83DC4B22B54
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 10:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6647F24214;
	Sat, 10 Feb 2024 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xJl9J41S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7D733CFD
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707560220; cv=none; b=pr3DXUKxq8fkrDxybszTDZNhG6GiiDJ2q6CxQ/IExRPOpDbvqsFEve8fytDHPZyBpFOS1sve4xAZVo+KvsUo8K4x9n1hPeInrqwPCap0qDuqjKKEzZhcgqiAldwUsxLx3npAcNv+tEK1RibOkYpYhu2IFrlpGPa82l0ZMAphCoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707560220; c=relaxed/simple;
	bh=ZRKnSeiySrTWu9DgvuhU2PoItGPXD1cGMsocRIq3oic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=anrftpzh36PPCy4cC6OuiqWY5zzjcV2rg//Xg+0bO23UQT1QhlEwL0rL/8FyytiJVhDpGKZ+rFbOmYlDtXbXU637PKESjW0tsjc9Z+N/doNz1Ty3ku4GQMjumGyGVvZwEdG7GbQF8L/TGodayAZ3WfRn4XVp9eHVTggkvcLJ2XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xJl9J41S; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc755afdecfso1307160276.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 02:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707560217; x=1708165017; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C3MtzCYDqA/NU9qAlKY3Nym0nximObQq5aVuIq2lscI=;
        b=xJl9J41SNfnsqhgne2QNoHkU9+qDijxskQk+9XANVJTSsyhsPD0I45gwJGYV1Uox0z
         No2Hog2QIr4gY8RVtl+3XdQIX2feVqdvcFRQOQJbKMk7R3d6RFlxFJAkx03Jov+sfVaE
         QGNwmZMHLCEPD2PLU5mofxhUMWUFgPlIq/edeQNo2Z6WybA0NKslEPG7vZlF3G0mIfPi
         lXixmP27yz+psm5I0zhScR5I4rikNW69zWIzo1aKAGBcIah6HRCnrkKn8yxR4YPeh5Io
         mRpmRIzLc8I8b5ChzoMx/7GmvwN/9/gRDOHIgP02qIqY3Lame0q4BZFGPzz/X0rgem0z
         btIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707560217; x=1708165017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C3MtzCYDqA/NU9qAlKY3Nym0nximObQq5aVuIq2lscI=;
        b=Rs6P+Cx8OGVq3cNcYy06tSVkmW8nHdNwYKcHBJru2jU0vb0xWS54gVB5j0tSHUwYcF
         icaBgFmzztKKnPSMCU+RFwCTA1/iWYl7hR56F7baThVddMDcbY5nsDIjMIA4h2LSG4kf
         UnLz/3NwnBSxNB/OMYdHf4BWGP3bPVE6YbE5Yo2QCTqoZCnEZSZW3Eh+IJRrBMKMyy/9
         I6oLArJL5n1O1+4ZY24Ez2PvptbpNCLnvKCK/CMb7uZO74YsP41ZyZbqoDKdJ9L0TWzp
         bOMbQWl8NEhMmfMxSuucxHbnIky79PmzDv0lAA8xHla7IHZYvPmOMoKUKW2ytyPkg19h
         PH0w==
X-Forwarded-Encrypted: i=1; AJvYcCV0B75i0FHkwtx6IrHmoavQhHMy5omtfdVMDQ7tv7n4NUu60JkrFUhJzzZ4vnf/87MGnF+tO/+FpwPIhU45yDtN64K1isiwYlWEQkcvLg==
X-Gm-Message-State: AOJu0YyhoVvOt1XN3wWj3Zppvc76v2JrduOR0DnBqu36Xazl/6mDwNyV
	4TXoHHoitOAGK2ujHmpnIM9qSQqXc6zpNXvuE8cjr9zwYbwovF1pJUzmJwJwnZFtnfQfzUi25lg
	E52CJeH+16mesPQb1SsbIgWZ1eAdnOCrUa+7dgA==
X-Google-Smtp-Source: AGHT+IHdeAwmz3vGqp+XhFSJbc9rlyCFILsXvjJJGq4rBxVBKBCiDLH6H086hg5mXLncPgLUg/Kv5DUESDy6lfLssVs=
X-Received: by 2002:a25:fc02:0:b0:dc6:4b66:2636 with SMTP id
 v2-20020a25fc02000000b00dc64b662636mr1324733ybd.19.1707560217563; Sat, 10 Feb
 2024 02:16:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com> <20240210015223.24670-16-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-16-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 12:16:46 +0200
Message-ID: <CAA8EJpqq+H1gdy2pJo0Up=5w0mYTPRu2_1swEBNfyAMXztQanA@mail.gmail.com>
Subject: Re: [PATCH v2 15/19] drm/msm/dp: enable SDP and SDE periph flush update
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> DP controller can be setup to operate in either SDP update flush mode or
> peripheral flush mode based on the DP controller hardware version.
>
> Starting in DP v1.2, the hardware documents require the use of
> peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.
>
> In-line with this guidance, lets program the DP controller to use
> peripheral flush mode starting DP v1.2
>
> Changes in v2:
>         - Use the original dp_catalog_hw_revision() function to
>           correctly check the DP HW version
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>  4 files changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 0f28a4897b7b7..bc64dde5b7459 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -440,6 +440,23 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog,
>         dp_write_link(catalog, REG_DP_MISC1_MISC0, misc_val);
>  }
>
> +void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog)
> +{
> +       u32 mainlink_ctrl, hw_revision;
> +       struct dp_catalog_private *catalog = container_of(dp_catalog,
> +                               struct dp_catalog_private, dp_catalog);
> +
> +       mainlink_ctrl = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
> +
> +       hw_revision = dp_catalog_hw_revision(dp_catalog);
> +       if (hw_revision >= DP_HW_VERSION_1_2)
> +               mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
> +       else
> +               mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
> +
> +       dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
> +}
> +
>  void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>                                         u32 rate, u32 stream_rate_khz,
>                                         bool fixed_nvid, bool is_ycbcr_420)
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 5b3a7ba40d55f..9e2b05544f610 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -98,6 +98,7 @@ void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 config);
>  void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog);
>  void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
>  void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog, bool enable);
> +void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog);
>  void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
>  void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
>                                 u32 stream_rate_khz, bool fixed_nvid, bool is_ycbcr_420);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index beef86b1aaf81..f1e7b0a5ee5d1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -170,6 +170,7 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
>
>         dp_catalog_ctrl_lane_mapping(ctrl->catalog);
>         dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
> +       dp_catalog_setup_peripheral_flush(ctrl->catalog);
>
>         dp_ctrl_config_ctrl(ctrl);
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 2983756c125cd..6ac66532b47a4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -102,6 +102,8 @@
>  #define DP_MAINLINK_CTRL_ENABLE                        (0x00000001)
>  #define DP_MAINLINK_CTRL_RESET                 (0x00000002)
>  #define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER   (0x00000010)
> +#define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP      (0x00800000)
> +#define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE       (0x01800000)

Just one bit here, please.

>  #define DP_MAINLINK_FB_BOUNDARY_SEL            (0x02000000)
>
>  #define REG_DP_STATE_CTRL                      (0x00000004)
> --
> 2.39.2
>


-- 
With best wishes
Dmitry

