Return-Path: <linux-arm-msm+bounces-17348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5BC8A339C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 18:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02BAE280D97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 16:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578961494CD;
	Fri, 12 Apr 2024 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UyaiGzOU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D624D149C53
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 16:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712938784; cv=none; b=LElQ/i/PLxAM2xG8inktYfPZVB0nvsJ+kYE+w5L425doiRISB/dmUrnARCBaIOI2715i7bQCPcaXbwIpH51r3l7PGL4d59cI7xsqQom96bUQvR69qqJUsuozp5TFnot/5zkEN9qKOO9G/VoIczVeCDfedqQ/uzL2VLeBuRokP/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712938784; c=relaxed/simple;
	bh=Mhd+lipG2wg14Iot819rdCbjbtbMzxIscA0tmJM15Qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f4Wd7rG1LlG45smrymt7Xb6toCpsJsqo7H0VN34PwIfWp6H2zefdVkeH1mfalQCeH2gWr2cx7l5T39OG97hNu29ymmyc5Yw6pdZ2/8yjfn3lbtN8jLBHN/9QZ6kND7JeNmrQAV2fHoN6xFusvvjFZMV5hoESjGd8JiGbcg/1RqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UyaiGzOU; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso1100019276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 09:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712938780; x=1713543580; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sXWmd/wW6yAOCZNpTbTji8xLWInbQYVnfn18RNMYZIU=;
        b=UyaiGzOUUivjhbhk0ETd0ZwihRuHIG6JMbMWnkwQXbAc7/XKL+2OBWELu/PEcBoy0O
         VL8iNXGIpfzxBY/PJ4q8Olv/s7j/7+roPUiP6Gf70KT+D8mPzoOjApIrHvGrhtITGZnr
         Bk1VAGdHRk7ZHMq44J59RGrYgtQES1b0dho6P7xOh7HL3kUCsznRO/amF+FLn+8o1Mre
         kGmuRTPtIVNORp6E6uJI7cSfMjPqEaP/UFLa1stjLNcrnD493hwr0Cj6kcYi8/hUWYXM
         4Fgip5F7qves3NjUoww67m4CEp34wgwTyffjQ+W6eUF9EIl8V6ZMk1jVM0aA3ucAIJFX
         NZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712938780; x=1713543580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sXWmd/wW6yAOCZNpTbTji8xLWInbQYVnfn18RNMYZIU=;
        b=pdXQpEMzmBWDWR2nxomJ8IHjcJtkTJIHzAfbEvo2oIw+PWhPFNxuiL8cH+4FMyTEmj
         6uRrJnzBr/sG3LcPGkm72cV2vEVAFDPChkeje9WJudiaP1zYAQijkovgVugnFmJpHw2v
         buf36FPKawxUHJqPVmpjktGNt57vHliZvdlRSbYsUgibr3K4yJA+EubicGXZoXVtR10G
         OI23HJdSlb++OieFkCm4slIEOxzb+uIgXCWz0rbyppygiu1D3/yqWn33XXD7c+xTmL3p
         aTc/m+Jum4rDX2ZxWSV4OW/pDrY4TSrqcOHM/vPrWsFRGYtWRHSuwfQC0OIdF3OYUZcZ
         pSXw==
X-Forwarded-Encrypted: i=1; AJvYcCVAfrW5ARXKTyuOuus4qFdkbxzJKE9pPHs7cmvEYWbL8O3owBodmeFZEriU4nrPc8tBZFaiQSo3Aa7O4q8GPYKnG19K0wZnwiCZAxmjGg==
X-Gm-Message-State: AOJu0YwgoR0tKmmTwUsT1yaCilpv/VbDrShutZ0bAgJ5vpXBoRR/ep6b
	L903/cJgIJqwckSEtCx/fiWIkrtE55zyJsfIJu+42IId+4oGv4XVemsouTvjAg4a61TCZHv0TD7
	sZylrF4tQIzX1xnzjyunF3Uhc+K/QLxB2RKG7oA==
X-Google-Smtp-Source: AGHT+IEqNVrU1E7+mCyG84cbO8h59i2bINsxyaP0WfD9IexHFJ+pdY6S2lQDTnhR6UCiSqnuNOZ12kESOxdIrB1xdko=
X-Received: by 2002:a25:b941:0:b0:dd1:491e:bf0 with SMTP id
 s1-20020a25b941000000b00dd1491e0bf0mr2579657ybm.60.1712938779740; Fri, 12 Apr
 2024 09:19:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
 <20240401-fd-xml-shipped-v5-11-4bdb277a85a1@linaro.org> <05d99785-f8b7-4aae-85e2-db74a4e3017a@nvidia.com>
In-Reply-To: <05d99785-f8b7-4aae-85e2-db74a4e3017a@nvidia.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 12 Apr 2024 19:19:28 +0300
Message-ID: <CAA8EJpoVb-K_AqDCYTtYJb_aGWO9P2jZ6XCjX7sASxovHr8WUQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/18] drm/msm: generate headers on the fly
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Apr 2024 at 19:15, Jon Hunter <jonathanh@nvidia.com> wrote:
>
> Hi Dmitry,
>
> On 01/04/2024 03:42, Dmitry Baryshkov wrote:
> > Generate DRM/MSM headers on the fly during kernel build. This removes a
> > need to push register changes to Mesa with the following manual
> > synchronization step. Existing headers will be removed in the following
> > commits (split away to ease reviews).
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/.gitignore |  1 +
> >   drivers/gpu/drm/msm/Makefile   | 97 +++++++++++++++++++++++++++++++++---------
> >   2 files changed, 77 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/.gitignore b/drivers/gpu/drm/msm/.gitignore
> > new file mode 100644
> > index 000000000000..9ab870da897d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/.gitignore
> > @@ -0,0 +1 @@
> > +generated/
> > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> > index 26ed4f443149..c861de58286c 100644
> > --- a/drivers/gpu/drm/msm/Makefile
> > +++ b/drivers/gpu/drm/msm/Makefile
> > @@ -1,10 +1,11 @@
> >   # SPDX-License-Identifier: GPL-2.0
> >   ccflags-y := -I $(srctree)/$(src)
> > +ccflags-y += -I $(obj)/generated
> >   ccflags-y += -I $(srctree)/$(src)/disp/dpu1
> >   ccflags-$(CONFIG_DRM_MSM_DSI) += -I $(srctree)/$(src)/dsi
> >   ccflags-$(CONFIG_DRM_MSM_DP) += -I $(srctree)/$(src)/dp
> >
> > -msm-y := \
> > +adreno-y := \
> >       adreno/adreno_device.o \
> >       adreno/adreno_gpu.o \
> >       adreno/a2xx_gpu.o \
> > @@ -18,7 +19,11 @@ msm-y := \
> >       adreno/a6xx_gmu.o \
> >       adreno/a6xx_hfi.o \
> >
> > -msm-$(CONFIG_DRM_MSM_HDMI) += \
> > +adreno-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
> > +
> > +adreno-$(CONFIG_DRM_MSM_GPU_STATE)   += adreno/a6xx_gpu_state.o
> > +
> > +msm-display-$(CONFIG_DRM_MSM_HDMI) += \
> >       hdmi/hdmi.o \
> >       hdmi/hdmi_audio.o \
> >       hdmi/hdmi_bridge.o \
> > @@ -31,7 +36,7 @@ msm-$(CONFIG_DRM_MSM_HDMI) += \
> >       hdmi/hdmi_phy_8x74.o \
> >       hdmi/hdmi_pll_8960.o \
> >
> > -msm-$(CONFIG_DRM_MSM_MDP4) += \
> > +msm-display-$(CONFIG_DRM_MSM_MDP4) += \
> >       disp/mdp4/mdp4_crtc.o \
> >       disp/mdp4/mdp4_dsi_encoder.o \
> >       disp/mdp4/mdp4_dtv_encoder.o \
> > @@ -42,7 +47,7 @@ msm-$(CONFIG_DRM_MSM_MDP4) += \
> >       disp/mdp4/mdp4_kms.o \
> >       disp/mdp4/mdp4_plane.o \
> >
> > -msm-$(CONFIG_DRM_MSM_MDP5) += \
> > +msm-display-$(CONFIG_DRM_MSM_MDP5) += \
> >       disp/mdp5/mdp5_cfg.o \
> >       disp/mdp5/mdp5_cmd_encoder.o \
> >       disp/mdp5/mdp5_ctl.o \
> > @@ -55,7 +60,7 @@ msm-$(CONFIG_DRM_MSM_MDP5) += \
> >       disp/mdp5/mdp5_plane.o \
> >       disp/mdp5/mdp5_smp.o \
> >
> > -msm-$(CONFIG_DRM_MSM_DPU) += \
> > +msm-display-$(CONFIG_DRM_MSM_DPU) += \
> >       disp/dpu1/dpu_core_perf.o \
> >       disp/dpu1/dpu_crtc.o \
> >       disp/dpu1/dpu_encoder.o \
> > @@ -85,14 +90,16 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
> >       disp/dpu1/dpu_vbif.o \
> >       disp/dpu1/dpu_writeback.o
> >
> > -msm-$(CONFIG_DRM_MSM_MDSS) += \
> > +msm-display-$(CONFIG_DRM_MSM_MDSS) += \
> >       msm_mdss.o \
> >
> > -msm-y += \
> > +msm-display-y += \
> >       disp/mdp_format.o \
> >       disp/mdp_kms.o \
> >       disp/msm_disp_snapshot.o \
> >       disp/msm_disp_snapshot_util.o \
> > +
> > +msm-y += \
> >       msm_atomic.o \
> >       msm_atomic_tracepoints.o \
> >       msm_debugfs.o \
> > @@ -115,12 +122,12 @@ msm-y += \
> >       msm_submitqueue.o \
> >       msm_gpu_tracepoints.o \
> >
> > -msm-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
> > -     dp/dp_debug.o
> > +msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
> >
> > -msm-$(CONFIG_DRM_MSM_GPU_STATE)      += adreno/a6xx_gpu_state.o
> > +msm-display-$(CONFIG_DEBUG_FS) += \
> > +     dp/dp_debug.o
> >
> > -msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
> > +msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
> >       dp/dp_catalog.o \
> >       dp/dp_ctrl.o \
> >       dp/dp_display.o \
> > @@ -130,21 +137,69 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
> >       dp/dp_audio.o \
> >       dp/dp_utils.o
> >
> > -msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
> > -
> > -msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
> > +msm-display-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
> >
> > -msm-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
> > +msm-display-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
> >                       dsi/dsi_cfg.o \
> >                       dsi/dsi_host.o \
> >                       dsi/dsi_manager.o \
> >                       dsi/phy/dsi_phy.o
> >
> > -msm-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
> > -msm-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
> > -msm-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
> > -msm-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
> > -msm-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
> > -msm-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
> > +msm-display-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
> > +msm-display-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
> > +msm-display-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
> > +msm-display-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
> > +msm-display-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
> > +msm-display-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
> > +
> > +msm-y += $(adreno-y) $(msm-display-y)
> >
> >   obj-$(CONFIG_DRM_MSM)       += msm.o
> > +
> > +quiet_cmd_headergen = GENHDR  $@
> > +      cmd_headergen = mkdir -p $(obj)/generated && $(PYTHON3) $(srctree)/$(src)/registers/gen_header.py --rnn $(srctree)/$(src)/registers --xml $< c-defines > $@
> > +
> > +$(obj)/generated/%.xml.h: $(src)/registers/adreno/%.xml \
> > +             $(src)/registers/adreno/adreno_common.xml \
> > +             $(src)/registers/adreno/adreno_pm4.xml \
> > +             $(src)/registers/freedreno_copyright.xml \
> > +             $(src)/registers/gen_header.py \
> > +             $(src)/registers/rules-fd.xsd \
> > +             FORCE
> > +     $(call if_changed,headergen)
> > +
> > +$(obj)/generated/%.xml.h: $(src)/registers/display/%.xml \
> > +             $(src)/registers/freedreno_copyright.xml \
> > +             $(src)/registers/gen_header.py \
> > +             $(src)/registers/rules-fd.xsd \
> > +             FORCE
> > +     $(call if_changed,headergen)
> > +
> > +ADRENO_HEADERS = \
> > +     generated/a2xx.xml.h \
> > +     generated/a3xx.xml.h \
> > +     generated/a4xx.xml.h \
> > +     generated/a5xx.xml.h \
> > +     generated/a6xx.xml.h \
> > +     generated/a6xx_gmu.xml.h \
> > +     generated/adreno_common.xml.h \
> > +     generated/adreno_pm4.xml.h \
> > +
> > +DISPLAY_HEADERS = \
> > +     generated/dsi_phy_7nm.xml.h \
> > +     generated/dsi_phy_10nm.xml.h \
> > +     generated/dsi_phy_14nm.xml.h \
> > +     generated/dsi_phy_20nm.xml.h \
> > +     generated/dsi_phy_28nm_8960.xml.h \
> > +     generated/dsi_phy_28nm.xml.h \
> > +     generated/dsi.xml.h \
> > +     generated/hdmi.xml.h \
> > +     generated/mdp4.xml.h \
> > +     generated/mdp5.xml.h \
> > +     generated/mdp_common.xml.h \
> > +     generated/sfpb.xml.h
> > +
> > +$(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
> > +$(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
> > +
> > +targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
>
>
> I noticed that some of our builders were failing to build the latest
> -next and it was after this commit that things broke. The builders
> have an older version of python3 and the gen_headers.py script fails
> in a couple places with syntax errors. The following changes
> resolved the issues for python 3.5 ...

Could you please post them as a proper patch?

>
> diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> index 9b2842d4a354..90d5c2991d05 100644
> --- a/drivers/gpu/drm/msm/registers/gen_header.py
> +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> @@ -323,7 +323,7 @@ class Array(object):
>                          indices = []
>                  if self.length != 1:
>                          if self.fixed_offsets:
> -                               indices.append((self.index_ctype(), None, f"__offset_{self.local_name}"))
> +                               indices.append((self.index_ctype(), None, "__offset_%s" % self.local_name))
>                          else:
>                                  indices.append((self.index_ctype(), self.stride, None))
>                  return indices
> @@ -942,7 +942,8 @@ def main():
>          parser.add_argument('--rnn', type=str, required=True)
>          parser.add_argument('--xml', type=str, required=True)
>
> -       subparsers = parser.add_subparsers(required=True)
> +       subparsers = parser.add_subparsers()
> +       subparsers.required = True
>
>
> I know that anything before python 3.8 is now EOL, but I did see a
> similar thread on dri-devel [0] for supporting python 3.6 and so
> wanted to see if there is any objections to the above?

I don't have any objections from my side.

>
> Thanks!
> Jon
>
> [0] https://lore.kernel.org/dri-devel/20240118123752.bl3qss3qbbxgvpdk@suse.de/
>
> --
> nvpublic



-- 
With best wishes
Dmitry

