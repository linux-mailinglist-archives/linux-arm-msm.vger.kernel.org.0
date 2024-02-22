Return-Path: <linux-arm-msm+bounces-12251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4143860540
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 22:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42FB71F25B29
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 21:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829D914B81E;
	Thu, 22 Feb 2024 21:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y2e41wba"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECDB12D1F4
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 21:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708639014; cv=none; b=DmDZ+ELb998+yRhTokXgwTFEmwEGan0/9E3URauoBXvfRuPZbk5taFrUJzK2oBB516okwli7I1SDwy3eu9tNlc2o4ThMepWSPArxH0rlhculYQZ1C4CoVpQ5E/mJ8khmnXOBlJJEQYBSyHRuCP/hxbXHQv1Zh1W7XOA/SiJAHw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708639014; c=relaxed/simple;
	bh=d5wBJVqNVTcWUmkTgZzRTgxTfk4flo7IBd+MGZCJ7lE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hEytUiEY3aJ4T+9pPE7OyvdxW7W3Nmwt6QRlvdDNRxydSSCq8XlGvbWnR64GEmA577IKxyOtH0P2I4NBD41FNGyjuqlGukEF+rv9lBrOViww/qnut5zpyC4xbCQ9kcesf3MlUcVUXF+1osWUDj3cM2recJu2GMLBblD/LJWEwAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y2e41wba; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6083befe2a7so2874557b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 13:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708639011; x=1709243811; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sSdctV6uztZto/HhQD+m/dgJhP6TImtfrukBnCA5Cl8=;
        b=y2e41wbaAa9TFCJvPrSFVHeDnOQ9BCW5+37Z2YHUVvssnNkjoBB9+eXx8SpWE5jT5m
         Il2r1itmhvA7n+M/6Y8UTPlWeC+cnYbonVKzYLdS4oXFiVMTXwAcJ+TqFxghrxPaMK5S
         Jzm+nVh2hD03MUfee6KDFSctEwJovpo+M49jkiUj6n4y5GnWZTn8guCAtHT5Cpj/dPtS
         D2oLz7s8gKYq01LdlENAPvU+jjMmNtoT8+WXu4e6tN641opjiuIhfJl2EQhenh4LYCRz
         6HLz8M5SRAyvRg3nA7rryIchq1+vBdRYuRkP7KjP4biuzQjHiaQBCpi0MghzYW4qVp/U
         cePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708639011; x=1709243811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSdctV6uztZto/HhQD+m/dgJhP6TImtfrukBnCA5Cl8=;
        b=vtRSN/Vduq8SGxHbKBBFnHcWHijRdGkWTSHfJ9QVNFgIylQpBLhsdnC7YklJ2A2z3p
         gE4MVVC4bRzrDNbDaFaCqh1lQfB3hMomeVl0oHFrvSWu/72QarmioNx8gefLhpfim0DH
         hqW/x6bvGdUy0hWcRs/8wNyN7k5E4NsLYk9NpjCj7PS734c+ojSpxlXQCeNxxT9B/K+3
         B85MwaLy52YERZSAtOohno6bqY8o6rJPBTP5OYygXiJsoJ2FundAKWG/NVhemAUdmL8S
         EDbbvEFDW2pFtSZvstkB2R1H0xkaV/F12VvTMmyLAsgvDL2wmX74Pl8+3zSfsTMyPUNr
         gnIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLsyxVVSMxiQiCnDCAs3QGSr2KKiSTb2vBPWxE2+f0FqCBzipsaeVazDAN4en2NsLRwMqn/SDBRtOJ4RvCz5hTzCAXkqkH/mWTa742XA==
X-Gm-Message-State: AOJu0YxrJlkds8ObasdflxyFkXD8bK8XLhgym294mTZe93r1uAF2DtyN
	JYrhmC6mlu4lhPl/hO90G9OOEHj4WipzBYTJINmRn4DGOLqf1jtYtdLutfAkwoIb5v5mB4h/CFN
	xdESX88ydInSj0/R/KlQFZPggZRs+zgAGmkNSog==
X-Google-Smtp-Source: AGHT+IFSVo82M+FNLl1IZ7cssooQpm7V6qcj+rfkppHy5an35PXNF/KU1VtVQHGdHIn/jzq8c8NkBLb9swgXndJlwQ0=
X-Received: by 2002:a81:6d53:0:b0:604:7a4e:c8ff with SMTP id
 i80-20020a816d53000000b006047a4ec8ffmr443619ywc.41.1708639011076; Thu, 22 Feb
 2024 13:56:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222194025.25329-1-quic_parellan@quicinc.com>
 <20240222194025.25329-14-quic_parellan@quicinc.com> <CAA8EJpoYwxzg=tNSYVMATZDTEML72+HHYDDcDyG3i2pFbuwCTg@mail.gmail.com>
 <39824013-0ec5-8198-6cfb-4c23e1136047@quicinc.com>
In-Reply-To: <39824013-0ec5-8198-6cfb-4c23e1136047@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 23:56:39 +0200
Message-ID: <CAA8EJppUNem3CwhrmmBD0DBQfVK6CZOh-QkBXRhW4EBt89+Gyg@mail.gmail.com>
Subject: Re: [PATCH v5 13/19] drm/msm/dp: add VSC SDP support for YUV420 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Feb 2024 at 23:28, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 2/22/2024 1:18 PM, Dmitry Baryshkov wrote:
> > On Thu, 22 Feb 2024 at 21:40, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >> Add support to pack and send the VSC SDP packet for DP. This therefore
> >> allows the transmision of format information to the sinks which is
> >> needed for YUV420 support over DP.
> >>
> >> Changes in v5:
> >>          - Slightly modify use of drm_dp_vsc_sdp_pack()
> >>          - Remove dp_catalog NULL checks
> >>          - Modify dp_utils_pack_sdp_header() to more clearly pack the
> >>            header buffer
> >>          - Move dp_utils_pack_sdp_header() inside of
> >>            dp_catalog_panel_send_vsc_sdp to clearly show the relationship
> >>            between the header buffer and the vsc_sdp struct
> >>          - Due to the last point, remove the dp_utils_pack_vsc_sdp()
> >>            function and only call drm_dp_vsc_sdp_pack() in
> >>            dp_panel_setup_vsc_sdp_yuv_420()
> >>
> >> Changes in v4:
> >>          - Remove struct msm_dp_sdp_with_parity
> >>          - Use dp_utils_pack_sdp_header() to pack the SDP header and
> >>            parity bytes into a buffer
> >>          - Use this buffer when writing the VSC SDP data in
> >>            dp_catalog_panel_send_vsc_sdp()
> >>          - Write to all of the MMSS_DP_GENERIC0 registers instead of just
> >>            the ones with non-zero values
> >>
> >> Changes in v3:
> >>          - Create a new struct, msm_dp_sdp_with_parity, which holds the
> >>            packing information for VSC SDP
> >>          - Use drm_dp_vsc_sdp_pack() to pack the data into the new
> >>            msm_dp_sdp_with_parity struct instead of specifically packing
> >>            for YUV420 format
> >>          - Modify dp_catalog_panel_send_vsc_sdp() to send the VSC SDP
> >>            data using the new msm_dp_sdp_with_parity struct
> >>
> >> Changes in v2:
> >>          - Rename GENERIC0_SDPSIZE macro to GENERIC0_SDPSIZE_VALID
> >>          - Remove dp_sdp from the dp_catalog struct since this data is
> >>            being allocated at the point used
> >>          - Create a new function in dp_utils to pack the VSC SDP data
> >>            into a buffer
> >>          - Create a new function that packs the SDP header bytes into a
> >>            buffer. This function is made generic so that it can be
> >>            utilized by dp_audio
> >>            header bytes into a buffer
> >>          - Create a new function in dp_utils that takes the packed buffer
> >>            and writes to the DP_GENERIC0_* registers
> >>          - Split the dp_catalog_panel_config_vsc_sdp() function into two
> >>            to disable/enable sending VSC SDP packets
> >>          - Check the DP HW version using the original useage of
> >>            dp_catalog_hw_revision() and correct the version checking
> >>            logic
> >>          - Rename dp_panel_setup_vsc_sdp() to
> >>            dp_panel_setup_vsc_sdp_yuv_420() to explicitly state that
> >>            currently VSC SDP is only being set up to support YUV420 modes
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_catalog.c | 93 +++++++++++++++++++++++++++++
> >>   drivers/gpu/drm/msm/dp/dp_catalog.h |  6 ++
> >>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 ++
> >>   drivers/gpu/drm/msm/dp/dp_panel.c   | 52 ++++++++++++++++
> >>   drivers/gpu/drm/msm/dp/dp_reg.h     |  3 +
> >>   drivers/gpu/drm/msm/dp/dp_utils.c   | 25 ++++++++
> >>   drivers/gpu/drm/msm/dp/dp_utils.h   | 14 +++++
> >>   7 files changed, 197 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> index 5d84c089e520a..bfc6f53ae167f 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> @@ -901,6 +901,99 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
> >>          return 0;
> >>   }
> >>
> >> +static void dp_catalog_panel_send_vsc_sdp(struct dp_catalog *dp_catalog, struct dp_sdp *vsc_sdp)
> >> +{
> >> +       struct dp_catalog_private *catalog;
> >> +       u32 header[2];
> >> +       u32 val;
> >> +       int i;
> >> +
> >> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> >> +
> >> +       dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
> >> +
> >> +       dp_write_link(catalog, MMSS_DP_GENERIC0_0, header[0]);
> >> +       dp_write_link(catalog, MMSS_DP_GENERIC0_1, header[1]);
> >> +
> >> +       for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
> >> +               val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
> >> +                      (vsc_sdp->db[i + 3] << 24));
> >> +               dp_write_link(catalog, MMSS_DP_GENERIC0_2 + i, val);
> >> +       }
> >> +}
> >> +
> >> +static void dp_catalog_panel_update_sdp(struct dp_catalog *dp_catalog)
> >> +{
> >> +       struct dp_catalog_private *catalog;
> >> +       u32 hw_revision;
> >> +
> >> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> >> +
> >> +       hw_revision = dp_catalog_hw_revision(dp_catalog);
> >> +       if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
> >> +               dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
> >> +               dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
> >> +       }
> >> +}
> >> +
> >> +void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog, struct dp_sdp *vsc_sdp)
> >> +{
> >> +       struct dp_catalog_private *catalog;
> >> +       u32 cfg, cfg2, misc;
> >> +
> >> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> >> +
> >> +       cfg = dp_read_link(catalog, MMSS_DP_SDP_CFG);
> >> +       cfg2 = dp_read_link(catalog, MMSS_DP_SDP_CFG2);
> >> +       misc = dp_read_link(catalog, REG_DP_MISC1_MISC0);
> >> +
> >> +       cfg |= GEN0_SDP_EN;
> >> +       dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
> >> +
> >> +       cfg2 |= GENERIC0_SDPSIZE_VALID;
> >> +       dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
> >> +
> >> +       dp_catalog_panel_send_vsc_sdp(dp_catalog, vsc_sdp);
> >> +
> >> +       /* indicates presence of VSC (BIT(6) of MISC1) */
> >> +       misc |= DP_MISC1_VSC_SDP;
> >> +
> >> +       drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=1\n");
> >> +
> >> +       pr_debug("misc settings = 0x%x\n", misc);
> >> +       dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
> >> +
> >> +       dp_catalog_panel_update_sdp(dp_catalog);
> >> +}
> >> +
> >> +void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog)
> >> +{
> >> +       struct dp_catalog_private *catalog;
> >> +       u32 cfg, cfg2, misc;
> >> +
> >> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> >> +
> >> +       cfg = dp_read_link(catalog, MMSS_DP_SDP_CFG);
> >> +       cfg2 = dp_read_link(catalog, MMSS_DP_SDP_CFG2);
> >> +       misc = dp_read_link(catalog, REG_DP_MISC1_MISC0);
> >> +
> >> +       cfg &= ~GEN0_SDP_EN;
> >> +       dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
> >> +
> >> +       cfg2 &= ~GENERIC0_SDPSIZE_VALID;
> >> +       dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
> >> +
> >> +       /* switch back to MSA */
> >> +       misc &= ~DP_MISC1_VSC_SDP;
> >> +
> >> +       drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=0\n");
> >> +
> >> +       pr_debug("misc settings = 0x%x\n", misc);
> >> +       dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
> >> +
> >> +       dp_catalog_panel_update_sdp(dp_catalog);
> >> +}
> >> +
> >>   void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
> >>                                  struct drm_display_mode *drm_mode)
> >>   {
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> >> index 6cb5e2a243de2..3605252effb59 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> >> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> >> @@ -9,6 +9,7 @@
> >>   #include <drm/drm_modes.h>
> >>
> >>   #include "dp_parser.h"
> >> +#include "dp_utils.h"
> >>   #include "disp/msm_disp_snapshot.h"
> >>
> >>   /* interrupts */
> >> @@ -30,6 +31,9 @@
> >>
> >>   #define DP_AUX_CFG_MAX_VALUE_CNT 3
> >>
> >> +#define DP_HW_VERSION_1_0      0x10000000
> >> +#define DP_HW_VERSION_1_2      0x10020000
> >> +
> >>   /* PHY AUX config registers */
> >>   enum dp_phy_aux_config_type {
> >>          PHY_AUX_CFG0,
> >> @@ -124,6 +128,8 @@ u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog);
> >>
> >>   /* DP Panel APIs */
> >>   int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog);
> >> +void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog, struct dp_sdp *vsc_sdp);
> >> +void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog);
> >>   void dp_catalog_dump_regs(struct dp_catalog *dp_catalog);
> >>   void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
> >>                                  struct drm_display_mode *drm_mode);
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >> index bffb7bac2c2c8..a42b29f9902c1 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >> @@ -1947,6 +1947,8 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
> >>          dp_io = &ctrl->parser->io;
> >>          phy = dp_io->phy;
> >>
> >> +       dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
> >> +
> >>          /* set dongle to D3 (power off) mode */
> >>          dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
> >>
> >> @@ -2021,6 +2023,8 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
> >>          dp_io = &ctrl->parser->io;
> >>          phy = dp_io->phy;
> >>
> >> +       dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
> >> +
> >>          dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
> >>
> >>          dp_catalog_ctrl_reset(ctrl->catalog);
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> >> index db1942794f1a4..e425a5c86acdc 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> >> @@ -4,6 +4,7 @@
> >>    */
> >>
> >>   #include "dp_panel.h"
> >> +#include "dp_utils.h"
> >>
> >>   #include <drm/drm_connector.h>
> >>   #include <drm/drm_edid.h>
> >> @@ -281,6 +282,53 @@ void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable)
> >>          dp_catalog_panel_tpg_enable(catalog, &panel->dp_panel.dp_mode.drm_mode);
> >>   }
> >>
> >> +static int dp_panel_setup_vsc_sdp_yuv_420(struct dp_panel *dp_panel)
> >> +{
> >> +       struct dp_catalog *catalog;
> >> +       struct dp_panel_private *panel;
> >> +       struct dp_display_mode *dp_mode;
> >> +       struct drm_dp_vsc_sdp vsc_sdp_data;
> >> +       struct dp_sdp vsc_sdp;
> >> +       ssize_t len;
> >> +
> >> +       if (!dp_panel) {
> >> +               DRM_ERROR("invalid input\n");
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> >> +       catalog = panel->catalog;
> >> +       dp_mode = &dp_panel->dp_mode;
> >> +
> >> +       memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
> >> +
> >> +       /* VSC SDP header as per table 2-118 of DP 1.4 specification */
> >> +       vsc_sdp_data.sdp_type = DP_SDP_VSC;
> >> +       vsc_sdp_data.revision = 0x05;
> >> +       vsc_sdp_data.length = 0x13;
> >> +
> >> +       /* VSC SDP Payload for DB16 */
> >> +       vsc_sdp_data.pixelformat = DP_PIXELFORMAT_YUV420;
> >> +       vsc_sdp_data.colorimetry = DP_COLORIMETRY_DEFAULT;
> >> +
> >> +       /* VSC SDP Payload for DB17 */
> >> +       vsc_sdp_data.bpc = dp_mode->bpp / 3;
> >> +       vsc_sdp_data.dynamic_range = DP_DYNAMIC_RANGE_CTA;
> >> +
> >> +       /* VSC SDP Payload for DB18 */
> >> +       vsc_sdp_data.content_type = DP_CONTENT_TYPE_GRAPHICS;
> >> +
> >> +       len = drm_dp_vsc_sdp_pack(&vsc_sdp_data, &vsc_sdp);
> >> +       if (len < 0) {
> >> +               DRM_ERROR("unable to pack vsc sdp\n");
> >> +               return len;
> >> +       }
> >> +
> >> +       dp_catalog_panel_enable_vsc_sdp(catalog, &vsc_sdp);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >>   void dp_panel_dump_regs(struct dp_panel *dp_panel)
> >>   {
> >>          struct dp_catalog *catalog;
> >> @@ -344,6 +392,10 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
> >>          catalog->dp_active = data;
> >>
> >>          dp_catalog_panel_timing_cfg(catalog);
> >> +
> >> +       if (dp_panel->dp_mode.out_fmt_is_yuv_420)
> >> +               dp_panel_setup_vsc_sdp_yuv_420(dp_panel);
> >> +
> >>          panel->panel_on = true;
> >>
> >>          return 0;
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> >> index 78785ed4b40c4..aa9f6c3e4ddeb 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> >> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> >> @@ -142,6 +142,7 @@
> >>   #define DP_MISC0_SYNCHRONOUS_CLK               (0x00000001)
> >>   #define DP_MISC0_COLORIMETRY_CFG_SHIFT         (0x00000001)
> >>   #define DP_MISC0_TEST_BITS_DEPTH_SHIFT         (0x00000005)
> >> +#define DP_MISC1_VSC_SDP                       (0x00004000)
> >>
> >>   #define DP_MISC0_COLORIMERY_CFG_LEGACY_RGB     (0)
> >>   #define DP_MISC0_COLORIMERY_CFG_CEA_RGB                (0x04)
> >> @@ -204,9 +205,11 @@
> >>   #define MMSS_DP_AUDIO_CTRL_RESET               (0x00000214)
> >>
> >>   #define MMSS_DP_SDP_CFG                                (0x00000228)
> >> +#define GEN0_SDP_EN                            (0x00020000)
> >>   #define MMSS_DP_SDP_CFG2                       (0x0000022C)
> >>   #define MMSS_DP_AUDIO_TIMESTAMP_0              (0x00000230)
> >>   #define MMSS_DP_AUDIO_TIMESTAMP_1              (0x00000234)
> >> +#define GENERIC0_SDPSIZE_VALID                 (0x00010000)
> >>
> >>   #define MMSS_DP_AUDIO_STREAM_0                 (0x00000240)
> >>   #define MMSS_DP_AUDIO_STREAM_1                 (0x00000244)
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c b/drivers/gpu/drm/msm/dp/dp_utils.c
> >> index 3a44fe738c004..3c8db0e9adfa6 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_utils.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_utils.c
> >> @@ -7,6 +7,8 @@
> >>
> >>   #include "dp_utils.h"
> >>
> >> +#define DP_SDP_HEADER_SIZE             8
> >> +
> >>   u8 dp_utils_get_g0_value(u8 data)
> >>   {
> >>          u8 c[4];
> >> @@ -71,3 +73,26 @@ u8 dp_utils_calculate_parity(u32 data)
> >>
> >>          return parity_byte;
> >>   }
> >> +
> >> +ssize_t dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff)
> >> +{
> >> +       size_t length;
> >> +
> >> +       length = sizeof(header_buff);
> >> +       if (length < DP_SDP_HEADER_SIZE)
> >> +               return -ENOSPC;
> >> +
> >> +       memset(header_buff, 0, sizeof(header_buff));
> > Just out of curiosity:
> > 1) what is the amount of memory getting zeroed by this call?
> > 2) what's the point in zeroing it if the next two lines will overwrite it?
> >
> > If nobody objects, I'll remove this line while applying.
> >
> > If that's fine,
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>
> Sounds good to me. Just didn't notice the redundancy of this line.

Please note the first question too. Do you understand the issue?

>
> -Paloma
>
>
> >
> >> +
> >> +       header_buff[0] = FIELD_PREP(HEADER_0_MASK, sdp_header->HB0) |
> >> +               FIELD_PREP(PARITY_0_MASK, dp_utils_calculate_parity(sdp_header->HB0)) |
> >> +               FIELD_PREP(HEADER_1_MASK, sdp_header->HB1) |
> >> +               FIELD_PREP(PARITY_1_MASK, dp_utils_calculate_parity(sdp_header->HB1));
> >> +
> >> +       header_buff[1] = FIELD_PREP(HEADER_2_MASK, sdp_header->HB2) |
> >> +               FIELD_PREP(PARITY_2_MASK, dp_utils_calculate_parity(sdp_header->HB2)) |
> >> +               FIELD_PREP(HEADER_3_MASK, sdp_header->HB3) |
> >> +               FIELD_PREP(PARITY_3_MASK, dp_utils_calculate_parity(sdp_header->HB3));
> >> +
> >> +       return length;
> >> +}
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
> >> index 5a505cbf3432b..7c056d9798dc3 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_utils.h
> >> +++ b/drivers/gpu/drm/msm/dp/dp_utils.h
> >> @@ -6,6 +6,10 @@
> >>   #ifndef _DP_UTILS_H_
> >>   #define _DP_UTILS_H_
> >>
> >> +#include <linux/bitfield.h>
> >> +#include <linux/bits.h>
> >> +#include <drm/display/drm_dp_helper.h>
> >> +
> >>   #define HEADER_BYTE_0_BIT       0
> >>   #define PARITY_BYTE_0_BIT       8
> >>   #define HEADER_BYTE_1_BIT      16
> >> @@ -15,8 +19,18 @@
> >>   #define HEADER_BYTE_3_BIT      16
> >>   #define PARITY_BYTE_3_BIT      24
> >>
> >> +#define HEADER_0_MASK      GENMASK(7, 0)
> >> +#define PARITY_0_MASK      GENMASK(15, 8)
> >> +#define HEADER_1_MASK      GENMASK(23, 16)
> >> +#define PARITY_1_MASK      GENMASK(31, 24)
> >> +#define HEADER_2_MASK      GENMASK(7, 0)
> >> +#define PARITY_2_MASK      GENMASK(15, 8)
> >> +#define HEADER_3_MASK      GENMASK(23, 16)
> >> +#define PARITY_3_MASK      GENMASK(31, 24)
> >> +
> >>   u8 dp_utils_get_g0_value(u8 data);
> >>   u8 dp_utils_get_g1_value(u8 data);
> >>   u8 dp_utils_calculate_parity(u32 data);
> >> +ssize_t dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff);
> >>
> >>   #endif /* _DP_UTILS_H_ */
> >> --
> >> 2.39.2
> >>
> >



-- 
With best wishes
Dmitry

