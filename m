Return-Path: <linux-arm-msm+bounces-10501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF52E8503CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 11:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B93942851C7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 10:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B90364B7;
	Sat, 10 Feb 2024 10:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p5wtPxdI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC1136132
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 10:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707559756; cv=none; b=LkEvKNkxQeUP/D0tiscYr8DcQWeUKLQ8yFZILcHWcfHMza8W+Yt9oUsJSKVZF0XUSvIjQE4FXUHXvaxIB0nWEzD6az2zglh6oAQkCv16CDvMYFxzuuFr2z4VsVue+EL6HzI9FlJAM0nBTH/XeFs/+mevB9FrrVq8+HnvxlGDCEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707559756; c=relaxed/simple;
	bh=X4ppJsQmywNqcDCXs/3ZodtQVm/oaZ8jF/8T7z9Bk18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=er0bia7QO5z2X61yJXehjjCzbjFcUCfWGPTn55LHS6AH4b4kyT0LNbOlNFrVHd2xFlc6KeegQzw5SjD+qRTHXsGnWthRDpMHY2Af0wvjZZRYQ0jorM8qSI1x0bW2ZHFREAN2TTg1rSq1MfffzPQxVLIeKaYJf0uJbYRPQsEBJnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p5wtPxdI; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so1419072276.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 02:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707559753; x=1708164553; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TxO5BiYRGOuy75fWcWylHiAjLt/s7fE9vQDIXBPoWjM=;
        b=p5wtPxdIdASq1ScSvh+YDi85jdip8vQ9X1HIqXjXXxuejakAWE0f7HPFBDy6fq3o6w
         SDbvEvuDZ+Mio79r5HRjIxzfcwxv90cOzoS0H2ljWyGKIiYPYveFm8KXQr77hj/KjJz/
         phEdzq8x0E0ouum/bvVQ8GZxmTFW86R04HX6bOp1xtHHsdNy+n0z9ssR0HXxSUjM5Rfw
         NiMPm4zwNmPokE+6J78bsS2Fq/zIk1xJP83VYYuCAYc9CWZDPTXNTrNLixFMaZoNUBC2
         Rh/BnI0fiJ/4ZlLgvXRLsgJ+E2QdYoFmIPaXDrJwPu306WJDYqM7CthPdJRoYT2Uphoz
         NKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707559753; x=1708164553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxO5BiYRGOuy75fWcWylHiAjLt/s7fE9vQDIXBPoWjM=;
        b=wh1a1k0ygro2CxOtDgcsVkh6svlSMQ+qhyhIVabIq4j3Zk71g+HVz1zPmmh4yfjf4Z
         OCM1Rad/N3QWmrIudc7B61DGYAzM9rG2jIGPYhuVgGu/JOx3JhjUV7LPVC/8WuP7n/4u
         nej46HL97lqHwdkGnnKwj0HlngNGgKuUuS+H06UWcVGQ9zlDM7EEH3RsqL1phxD4ikS7
         l65MXV4Ya1LAaMRzpvlbpv6CwgMbe7kVzCiXct/SDtFfC8dhv4qNbSZqzhO9g29FbLmI
         7Hg7zlrP5nPQ7n+U1LCfsZVoJaxbLQ9+3k87fi7wOr4Te9DUR3S9mW7z6kOf/gEOrJe3
         3aHQ==
X-Gm-Message-State: AOJu0YzoZ0DWCb73QAVqIKOagCXXRhuU1UBl7mhHmCNpAKdVMTK2zpxq
	pjfe97Gvrssvtx3wQhIqUQbLkWHNrLM/VDNTP+KcSgpJWepP0a5iRW7fzOv3ugLcw8icqCqZsqZ
	KU1bUFvnl65vCzCCImtSLA6eUd4Ae828rp8CZ7g==
X-Google-Smtp-Source: AGHT+IEvgdzAG09Y3fZGE69U7oAhxoqzx0p8MXyAwP5Tx14EbCo9qYcCVAJ3Vn5ru4X75ZKVltbADALV0ST1NZgyiFg=
X-Received: by 2002:a25:db8d:0:b0:dc7:4988:6c77 with SMTP id
 g135-20020a25db8d000000b00dc749886c77mr1144388ybf.21.1707559752989; Sat, 10
 Feb 2024 02:09:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com> <20240210015223.24670-14-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-14-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 12:09:01 +0200
Message-ID: <CAA8EJpq6EFn6xix2GLej=bB2JCP7btuQ+zugeJTeLBH+mVKdSg@mail.gmail.com>
Subject: Re: [PATCH v2 13/19] drm/msm/dp: add VSC SDP support for YUV420 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>, Helge Deller <deller@gmx.de>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Add support to pack and send the VSC SDP packet for DP. This therefore
> allows the transmision of format information to the sinks which is
> needed for YUV420 support over DP.
>
> Changes in v2:
>         - Rename GENERIC0_SDPSIZE macro to GENERIC0_SDPSIZE_VALID
>         - Remove dp_sdp from the dp_catalog struct since this data is
>           being allocated at the point used
>         - Create a new function in dp_utils to pack the VSC SDP data
>           into a buffer
>         - Create a new function that packs the SDP header bytes into a
>           buffer. This function is made generic so that it can be
>           utilized by dp_audio
>           header bytes into a buffer
>         - Create a new function in dp_utils that takes the packed buffer
>           and writes to the DP_GENERIC0_* registers
>         - Split the dp_catalog_panel_config_vsc_sdp() function into two
>           to disable/enable sending VSC SDP packets
>         - Check the DP HW version using the original useage of
>           dp_catalog_hw_revision() and correct the version checking
>           logic
>         - Rename dp_panel_setup_vsc_sdp() to
>           dp_panel_setup_vsc_sdp_yuv_420() to explicitly state that
>           currently VSC SDP is only being set up to support YUV420 modes
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 105 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |   6 ++
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  59 ++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
>  drivers/gpu/drm/msm/dp/dp_utils.c   |  80 +++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_utils.h   |   3 +
>  7 files changed, 260 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 5d84c089e520a..0f28a4897b7b7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -901,6 +901,111 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
>         return 0;
>  }
>
> +static void dp_catalog_panel_send_vsc_sdp(struct dp_catalog *dp_catalog, u32 *buffer)
> +{
> +       struct dp_catalog_private *catalog;
> +
> +       if (!dp_catalog) {
> +               DRM_ERROR("invalid input\n");
> +               return;
> +       }
> +
> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> +
> +       dp_write_link(catalog, MMSS_DP_GENERIC0_0, buffer[0]);
> +       dp_write_link(catalog, MMSS_DP_GENERIC0_1, buffer[1]);
> +       dp_write_link(catalog, MMSS_DP_GENERIC0_2, buffer[2]);
> +       dp_write_link(catalog, MMSS_DP_GENERIC0_3, buffer[3]);
> +       dp_write_link(catalog, MMSS_DP_GENERIC0_4, buffer[4]);
> +       dp_write_link(catalog, MMSS_DP_GENERIC0_5, buffer[5]);
> +       dp_write_link(catalog, MMSS_DP_GENERIC0_6, buffer[6]);
> +       dp_write_link(catalog, MMSS_DP_GENERIC0_7, buffer[7]);
> +       dp_write_link(catalog, MMSS_DP_GENERIC0_8, buffer[8]);
> +       dp_write_link(catalog, MMSS_DP_GENERIC0_9, buffer[9]);
> +}
> +
> +static void dp_catalog_panel_update_sdp(struct dp_catalog *dp_catalog)
> +{
> +       struct dp_catalog_private *catalog;
> +       u32 hw_revision;
> +
> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> +
> +       hw_revision = dp_catalog_hw_revision(dp_catalog);
> +       if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
> +               dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
> +               dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
> +       }
> +}
> +
> +void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog, u32 *gen_buffer)
> +{
> +       struct dp_catalog_private *catalog;
> +       u32 cfg, cfg2, misc;
> +
> +       if (!dp_catalog) {
> +               DRM_ERROR("invalid input\n");
> +               return;
> +       }
> +
> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> +
> +       cfg = dp_read_link(catalog, MMSS_DP_SDP_CFG);
> +       cfg2 = dp_read_link(catalog, MMSS_DP_SDP_CFG2);
> +       misc = dp_read_link(catalog, REG_DP_MISC1_MISC0);
> +
> +       cfg |= GEN0_SDP_EN;
> +       dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
> +
> +       cfg2 |= GENERIC0_SDPSIZE_VALID;
> +       dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
> +
> +       dp_catalog_panel_send_vsc_sdp(dp_catalog, gen_buffer);
> +
> +       /* indicates presence of VSC (BIT(6) of MISC1) */
> +       misc |= DP_MISC1_VSC_SDP;
> +
> +       drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=1\n");
> +
> +       pr_debug("misc settings = 0x%x\n", misc);
> +       dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
> +
> +       dp_catalog_panel_update_sdp(dp_catalog);
> +}
> +
> +void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog)
> +{
> +       struct dp_catalog_private *catalog;
> +       u32 cfg, cfg2, misc;
> +
> +       if (!dp_catalog) {
> +               DRM_ERROR("invalid input\n");
> +               return;
> +       }
> +
> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> +
> +       cfg = dp_read_link(catalog, MMSS_DP_SDP_CFG);
> +       cfg2 = dp_read_link(catalog, MMSS_DP_SDP_CFG2);
> +       misc = dp_read_link(catalog, REG_DP_MISC1_MISC0);
> +
> +       cfg &= ~GEN0_SDP_EN;
> +       dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
> +
> +       cfg2 &= ~GENERIC0_SDPSIZE_VALID;
> +       dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
> +
> +       /* switch back to MSA */
> +       misc &= ~DP_MISC1_VSC_SDP;
> +
> +       drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=0\n");
> +
> +       pr_debug("misc settings = 0x%x\n", misc);
> +       dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
> +
> +       dp_catalog_panel_update_sdp(dp_catalog);
> +}
> +
>  void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
>                                 struct drm_display_mode *drm_mode)
>  {
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 6cb5e2a243de2..5b3a7ba40d55f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -7,6 +7,7 @@
>  #define _DP_CATALOG_H_
>
>  #include <drm/drm_modes.h>
> +#include <drm/display/drm_dp_helper.h>
>
>  #include "dp_parser.h"
>  #include "disp/msm_disp_snapshot.h"
> @@ -30,6 +31,9 @@
>
>  #define DP_AUX_CFG_MAX_VALUE_CNT 3
>
> +#define DP_HW_VERSION_1_0      0x10000000
> +#define DP_HW_VERSION_1_2      0x10020000
> +
>  /* PHY AUX config registers */
>  enum dp_phy_aux_config_type {
>         PHY_AUX_CFG0,
> @@ -124,6 +128,8 @@ u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog);
>
>  /* DP Panel APIs */
>  int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog);
> +void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog, u32 *gen_buffer);
> +void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog);
>  void dp_catalog_dump_regs(struct dp_catalog *dp_catalog);
>  void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
>                                 struct drm_display_mode *drm_mode);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 209cf2a35642f..beef86b1aaf81 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1952,6 +1952,8 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>         dp_io = &ctrl->parser->io;
>         phy = dp_io->phy;
>
> +       dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
> +
>         /* set dongle to D3 (power off) mode */
>         dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
>
> @@ -2026,6 +2028,8 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>         dp_io = &ctrl->parser->io;
>         phy = dp_io->phy;
>
> +       dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
> +
>         dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>
>         dp_catalog_ctrl_reset(ctrl->catalog);
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index db1942794f1a4..82897edf25e0f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -4,6 +4,7 @@
>   */
>
>  #include "dp_panel.h"
> +#include "dp_utils.h"
>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_edid.h>
> @@ -281,6 +282,60 @@ void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable)
>         dp_catalog_panel_tpg_enable(catalog, &panel->dp_panel.dp_mode.drm_mode);
>  }
>
> +static int dp_panel_setup_vsc_sdp_yuv_420(struct dp_panel *dp_panel)
> +{
> +       struct dp_catalog *catalog;
> +       struct dp_panel_private *panel;
> +       struct dp_display_mode *dp_mode;
> +       struct dp_sdp_header sdp_header;
> +       struct drm_dp_vsc_sdp vsc_sdp_data;
> +       size_t buff_size;
> +       u32 gen_buffer[10];
> +       int rc = 0;
> +
> +       if (!dp_panel) {
> +               DRM_ERROR("invalid input\n");
> +               rc = -EINVAL;
> +               return rc;
> +       }
> +
> +       panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> +       catalog = panel->catalog;
> +       dp_mode = &dp_panel->dp_mode;
> +       buff_size = sizeof(gen_buffer);
> +
> +       memset(&sdp_header, 0, sizeof(sdp_header));
> +       memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
> +
> +       /* VSC SDP header as per table 2-118 of DP 1.4 specification */
> +       sdp_header.HB0 = 0x00;
> +       sdp_header.HB1 = 0x07;
> +       sdp_header.HB2 = 0x05;
> +       sdp_header.HB3 = 0x13;

This should go to the packing function.

> +
> +       /* VSC SDP Payload for DB16 */

Comments are useless more or less. The code fills generic information
structure which might or might not be packed to the data buffer.

> +       vsc_sdp_data.pixelformat = DP_PIXELFORMAT_YUV420;
> +       vsc_sdp_data.colorimetry = DP_COLORIMETRY_DEFAULT;
> +
> +       /* VSC SDP Payload for DB17 */
> +       vsc_sdp_data.dynamic_range = DP_DYNAMIC_RANGE_CTA;
> +
> +       /* VSC SDP Payload for DB18 */
> +       vsc_sdp_data.content_type = DP_CONTENT_TYPE_GRAPHICS;
> +
> +       vsc_sdp_data.bpc = dp_mode->bpp / 3;

Consider extracting intel_dp_compute_vsc_colorimetry() and using it.

> +
> +       rc = dp_utils_pack_vsc_sdp(&vsc_sdp_data, &sdp_header, gen_buffer, buff_size);
> +       if (rc) {
> +               DRM_ERROR("unable to pack vsc sdp\n");
> +               return rc;
> +       }
> +
> +       dp_catalog_panel_enable_vsc_sdp(catalog, gen_buffer);
> +
> +       return rc;
> +}
> +
>  void dp_panel_dump_regs(struct dp_panel *dp_panel)
>  {
>         struct dp_catalog *catalog;
> @@ -344,6 +399,10 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
>         catalog->dp_active = data;
>
>         dp_catalog_panel_timing_cfg(catalog);
> +
> +       if (dp_panel->dp_mode.out_fmt_is_yuv_420)
> +               dp_panel_setup_vsc_sdp_yuv_420(dp_panel);
> +
>         panel->panel_on = true;
>
>         return 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index ea85a691e72b5..2983756c125cd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -142,6 +142,7 @@
>  #define DP_MISC0_SYNCHRONOUS_CLK               (0x00000001)
>  #define DP_MISC0_COLORIMETRY_CFG_SHIFT         (0x00000001)
>  #define DP_MISC0_TEST_BITS_DEPTH_SHIFT         (0x00000005)
> +#define DP_MISC1_VSC_SDP                       (0x00004000)
>
>  #define REG_DP_VALID_BOUNDARY                  (0x00000030)
>  #define REG_DP_VALID_BOUNDARY_2                        (0x00000034)
> @@ -201,9 +202,11 @@
>  #define MMSS_DP_AUDIO_CTRL_RESET               (0x00000214)
>
>  #define MMSS_DP_SDP_CFG                                (0x00000228)
> +#define GEN0_SDP_EN                            (0x00020000)
>  #define MMSS_DP_SDP_CFG2                       (0x0000022C)
>  #define MMSS_DP_AUDIO_TIMESTAMP_0              (0x00000230)
>  #define MMSS_DP_AUDIO_TIMESTAMP_1              (0x00000234)
> +#define GENERIC0_SDPSIZE_VALID                 (0x00010000)
>
>  #define MMSS_DP_AUDIO_STREAM_0                 (0x00000240)
>  #define MMSS_DP_AUDIO_STREAM_1                 (0x00000244)
> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c b/drivers/gpu/drm/msm/dp/dp_utils.c
> index 176d839906cec..05e0133eb50f3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_utils.c
> +++ b/drivers/gpu/drm/msm/dp/dp_utils.c
> @@ -4,6 +4,16 @@
>   */
>
>  #include <linux/types.h>
> +#include <drm/display/drm_dp_helper.h>
> +#include <drm/drm_print.h>
> +
> +#include "dp_utils.h"
> +
> +#define DP_GENERIC0_6_YUV_8_BPC                BIT(0)
> +#define DP_GENERIC0_6_YUV_10_BPC       BIT(1)
> +
> +#define DP_SDP_HEADER_SIZE             8
> +#define DP_VSC_SDP_BUFFER_SIZE         40
>
>  u8 dp_utils_get_g0_value(u8 data)
>  {
> @@ -69,3 +79,73 @@ u8 dp_utils_calculate_parity(u32 data)
>
>         return parity_byte;
>  }
> +
> +int dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *buffer, size_t buff_size)
> +{
> +       u32 header, parity;
> +
> +       if (buff_size < DP_SDP_HEADER_SIZE)
> +               return -ENOSPC;
> +
> +       memset(buffer, 0, sizeof(buffer));
> +
> +       /* HEADER BYTE 0 */
> +       header = sdp_header->HB0;
> +       parity = dp_utils_calculate_parity(header);
> +       buffer[0]   = ((header << HEADER_BYTE_0_BIT) | (parity << PARITY_BYTE_0_BIT));
> +
> +       /* HEADER BYTE 1 */
> +       header = sdp_header->HB1;
> +       parity = dp_utils_calculate_parity(header);
> +       buffer[0]  |= ((header << HEADER_BYTE_1_BIT) | (parity << PARITY_BYTE_1_BIT));
> +
> +       /* HEADER BYTE 2 */
> +       header = sdp_header->HB2;
> +       parity = dp_utils_calculate_parity(header);
> +       buffer[1]   = ((header << HEADER_BYTE_2_BIT) | (parity << PARITY_BYTE_2_BIT));
> +
> +       /* HEADER BYTE 3 */
> +       header = sdp_header->HB3;
> +       parity = dp_utils_calculate_parity(header);
> +       buffer[1]  |= ((header << HEADER_BYTE_3_BIT) | (parity << PARITY_BYTE_3_BIT));
> +
> +       return 0;
> +}
> +
> +int dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc_sdp_data, struct dp_sdp_header *sdp_header,
> +                         u32 *buffer, size_t buff_size)
> +{

No. This function should pack data into struct dp_sdp and it should go
to drivers/video/hdmi.c

> +       u8 bpc;
> +       int ret = 0;
> +
> +       if (buff_size < DP_VSC_SDP_BUFFER_SIZE)
> +               return -ENOSPC;
> +
> +       ret = dp_utils_pack_sdp_header(sdp_header, buffer, buff_size);
> +       if (ret) {
> +               DRM_ERROR("unable to pack sdp header\n");
> +               return ret;
> +       }
> +
> +       switch (vsc_sdp_data->bpc) {
> +       case 10:
> +               bpc = DP_GENERIC0_6_YUV_10_BPC;
> +               break;
> +       case 8:
> +       default:
> +               bpc = DP_GENERIC0_6_YUV_8_BPC;
> +               break;
> +       }
> +
> +       /* VSC SDP payload as per table 2-117 of DP 1.4 specification */
> +       buffer[6] = (vsc_sdp_data->colorimetry & 0xF) |
> +              ((vsc_sdp_data->pixelformat & 0xF) << 4) |
> +              (bpc << 8) |
> +              ((vsc_sdp_data->dynamic_range & 0x1) << 15) |
> +              ((vsc_sdp_data->content_type & 0x7) << 16);
> +
> +       print_hex_dump(KERN_DEBUG, "[drm-dp] VSC: ", DUMP_PREFIX_NONE, 16, 4, buffer,
> +                      sizeof(buffer), false);
> +
> +       return ret;
> +}
> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
> index c062e29d07898..7fd775de553c9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_utils.h
> +++ b/drivers/gpu/drm/msm/dp/dp_utils.h
> @@ -18,5 +18,8 @@
>  u8 dp_utils_get_g0_value(u8 data);
>  u8 dp_utils_get_g1_value(u8 data);
>  u8 dp_utils_calculate_parity(u32 data);
> +int dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *buffer, size_t buff_size);
> +int dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc_sdp_data, struct dp_sdp_header *sdp_header,
> +                         u32 *buffer, size_t buff_size);
>
>  #endif /* _DP_UTILS_H_ */
> --
> 2.39.2
>


-- 
With best wishes
Dmitry

