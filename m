Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C83C25B01F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2019 16:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbfF3OWa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jun 2019 10:22:30 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:42916 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfF3OW3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jun 2019 10:22:29 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 4D8FC80415;
        Sun, 30 Jun 2019 16:22:20 +0200 (CEST)
Date:   Sun, 30 Jun 2019 16:22:19 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        freedreno@lists.freedesktop.org,
        Carsten Behling <carsten.behling@googlemail.com>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Bruce Wang <bzwang@chromium.org>,
        Shayenne Moura <shayenneluzmoura@gmail.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Todor Tomov <todor.tomov@linaro.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v1] drm/msm: drop use of drmP.h
Message-ID: <20190630142218.GB5444@ravnborg.org>
References: <20190630052133.6175-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190630052133.6175-1-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
        a=LpQP-O61AAAA:8 a=QyXUC8HyAAAA:8 a=7gkXJVJtAAAA:8 a=cm27Pg_UAAAA:8
        a=RAbU-raeAAAA:8 a=mK_AVkanAAAA:8 a=P-IC7800AAAA:8 a=KKAkSRfTAAAA:8
        a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=mDV3o1hIAAAA:8 a=vMu0rPO_DUfMDCNS_WUA:9
        a=CjuIK1q_8ugA:10 a=pioyyrs4ZptJ924tMmac:22 a=E9Po1WZjFZOl8hwRPBS3:22
        a=xmb-EsYY8bH0VWELuYED:22 a=JiizpSU_mAIq9zsZDqn2:22
        a=3gWm3jAn84ENXaBijsEo:22 a=d3PnA9EDa4IxuAV0gXij:22
        a=cvBusfyB2V15izCimMoJ:22 a=AjGcO6oz07-iQ99wixmX:22
        a=Vxmtnl_E_bksehYqCbjh:22 a=_FVE-zBwftR9WsbkzFJk:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Strange...
git send-email did not send this to all recipients listed as Cc: ?!?!?

Added the following persons missing in the mail:
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

After sending out 40 mails I am not too happy to discover this.

Added the persons missing.

	Sam

On Sun, Jun 30, 2019 at 07:21:33AM +0200, Sam Ravnborg wrote:
> Drop the deprecated drmP.h header file, and trim msm_drv.h
> to the relevant include files.
> 
> This resulted in a suprisingly many edits as many files relied
> on headers included via msm_drv.h.
> But msm_drv.h is not supposed to carry include files it do not need, so
> the individual files have to include what extra they needs.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Cc: Bruce Wang <bzwang@chromium.org>
> Cc: Shayenne Moura <shayenneluzmoura@gmail.com>
> Cc: Mamta Shukla <mamtashukla555@gmail.com>
> Cc: Jonathan Marek <jonathan@marek.ca>
> Cc: Carsten Behling <carsten.behling@googlemail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Cc: Sibi Sankar <sibis@codeaurora.org>
> Cc: Todor Tomov <todor.tomov@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
> The patch is build tested using several configs and
> several architectures (including arm, arm64, x86).
> 
> The patch is based on drm-misc.
> 
> If patch is OK, please apply to your tree
> as this driver is maintained outside drm-misc.
> 
> I am happy to rebase on another tree, just let me know.
> 
>         Sam
> 
>  drivers/gpu/drm/msm/adreno/a5xx_debugfs.c         |  4 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c          |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       |  8 +++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |  6 ++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h           |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c         |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c          |  1 +
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c         |  1 +
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c          |  1 +
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c          |  3 +++
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  2 ++
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c        |  2 ++
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c         |  3 +++
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c          |  1 +
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c          |  6 ++++++
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c        |  2 ++
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c          |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c                |  8 +++++---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c        |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  2 ++
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll.h             |  2 +-
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c            |  2 ++
>  drivers/gpu/drm/msm/hdmi/hdmi_connector.c         |  1 +
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c          |  1 +
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c          |  2 ++
>  drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c          |  2 ++
>  drivers/gpu/drm/msm/msm_atomic.c                  |  1 +
>  drivers/gpu/drm/msm/msm_debugfs.c                 |  5 +++++
>  drivers/gpu/drm/msm/msm_drv.c                     | 10 +++++++++-
>  drivers/gpu/drm/msm/msm_drv.h                     |  1 -
>  drivers/gpu/drm/msm/msm_fb.c                      |  2 ++
>  drivers/gpu/drm/msm/msm_fbdev.c                   |  1 +
>  drivers/gpu/drm/msm/msm_gem.c                     |  2 ++
>  drivers/gpu/drm/msm/msm_gem_prime.c               |  6 ++++--
>  drivers/gpu/drm/msm/msm_gem_submit.c              |  4 ++++
>  drivers/gpu/drm/msm/msm_gpummu.c                  |  2 ++
>  drivers/gpu/drm/msm/msm_perf.c                    |  3 +++
>  drivers/gpu/drm/msm/msm_rd.c                      |  7 +++++--
>  drivers/gpu/drm/msm/msm_submitqueue.c             |  2 ++
>  40 files changed, 98 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
> index 3041c500c5cd..2eafad831226 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
> @@ -2,9 +2,11 @@
>  /* Copyright (c) 2016-2017 The Linux Foundation. All rights reserved.
>   */
>  
> -
>  #include <linux/types.h>
>  #include <linux/debugfs.h>
> +
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_file.h>
>  #include <drm/drm_print.h>
>  
>  #include "a5xx_gpu.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 3772f745589d..053ad94a12c6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -20,11 +20,13 @@
>  #include <linux/sort.h>
>  #include <linux/debugfs.h>
>  #include <linux/ktime.h>
> +
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_flip_work.h>
>  #include <drm/drm_mode.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_rect.h>
> +#include <drm/drm_vblank.h>
>  
>  #include "dpu_kms.h"
>  #include "dpu_hw_lm.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 82bf16d61a45..57c5f9443a4a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -17,14 +17,16 @@
>   */
>  
>  #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
> -#include <linux/kthread.h>
>  #include <linux/debugfs.h>
> +#include <linux/kthread.h>
>  #include <linux/seq_file.h>
>  
> -#include "msm_drv.h"
> -#include "dpu_kms.h"
>  #include <drm/drm_crtc.h>
> +#include <drm/drm_file.h>
>  #include <drm/drm_probe_helper.h>
> +
> +#include "msm_drv.h"
> +#include "dpu_kms.h"
>  #include "dpu_hwio.h"
>  #include "dpu_hw_catalog.h"
>  #include "dpu_hw_intf.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 90f439812088..ec76b8687a98 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -9,7 +9,6 @@
>  #include <linux/bug.h>
>  #include <linux/bitmap.h>
>  #include <linux/err.h>
> -#include <drm/drmP.h>
>  
>  /**
>   * Max hardware block count: For ex: max 12 SSPP pipes or
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 885bf88afa3e..57f33bc26916 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -18,10 +18,12 @@
>  
>  #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
>  
> -#include <drm/drm_crtc.h>
>  #include <linux/debugfs.h>
> -#include <linux/of_irq.h>
>  #include <linux/dma-buf.h>
> +#include <linux/of_irq.h>
> +
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_file.h>
>  
>  #include "msm_drv.h"
>  #include "msm_mmu.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 31e9ef96ca5d..297fbef8e5d7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -19,6 +19,8 @@
>  #ifndef __DPU_KMS_H__
>  #define __DPU_KMS_H__
>  
> +#include <drm/drm_drv.h>
> +
>  #include "msm_drv.h"
>  #include "msm_kms.h"
>  #include "msm_mmu.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index a4d7ab97bb8e..f5f312d41853 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -22,6 +22,7 @@
>  #include <linux/dma-buf.h>
>  
>  #include <drm/drm_atomic_uapi.h>
> +#include <drm/drm_file.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  
>  #include "msm_drv.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> index 3c9236bb291c..0ae820e20b40 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> @@ -5,6 +5,7 @@
>  #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
>  
>  #include <linux/debugfs.h>
> +#include <linux/delay.h>
>  
>  #include "dpu_vbif.h"
>  #include "dpu_hw_vbif.h"
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> index 0cfd4c06b610..a8a58ea826d6 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> @@ -19,6 +19,7 @@
>  #include <drm/drm_flip_work.h>
>  #include <drm/drm_mode.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
>  
>  #include "mdp4_kms.h"
>  
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
> index b764d7f10312..8b284b2d9489 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
> @@ -16,6 +16,7 @@
>   */
>  
>  #include <drm/drm_print.h>
> +#include <drm/drm_vblank.h>
>  
>  #include "msm_drv.h"
>  #include "mdp4_kms.h"
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index e437aa806f7b..7e7c03936af0 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -15,6 +15,9 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <linux/delay.h>
> +
> +#include <drm/drm_vblank.h>
>  
>  #include "msm_drv.h"
>  #include "msm_gem.h"
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> index df6f9803a1d7..f6062fe15bd0 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> @@ -16,6 +16,8 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <linux/delay.h>
> +
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_probe_helper.h>
>  
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
> index 005066f7154d..b202faee2492 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
> @@ -15,6 +15,8 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <drm/drm_fourcc.h>
> +
>  #include "mdp4_kms.h"
>  
>  #define DOWN_SCALE_MAX	8
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> index c3751c95b452..1017246bc3db 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -17,10 +17,13 @@
>   */
>  
>  #include <linux/sort.h>
> +
>  #include <drm/drm_mode.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_flip_work.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
>  
>  #include "mdp5_kms.h"
>  
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
> index 280e368bc9bb..a62f9c06d3c1 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
> @@ -18,6 +18,7 @@
>  #include <linux/irq.h>
>  
>  #include <drm/drm_print.h>
> +#include <drm/drm_vblank.h>
>  
>  #include "msm_drv.h"
>  #include "mdp5_kms.h"
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 97179bec8902..ff000b3d39c3 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -16,8 +16,14 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <linux/delay.h>
>  #include <linux/of_irq.h>
>  
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_vblank.h>
> +
>  #include "msm_drv.h"
>  #include "msm_gem.h"
>  #include "msm_mmu.h"
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index 1105c2433f14..55b0b60893dc 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -16,7 +16,9 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_print.h>
> +
>  #include "mdp5_kms.h"
>  
>  struct mdp5_plane {
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
> index 2834837f4d3e..620413f9367f 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
> @@ -16,6 +16,7 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_util.h>
>  
>  #include "mdp5_kms.h"
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index dbf490176c2c..95b32f167a79 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -5,19 +5,21 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/err.h>
>  #include <linux/gpio.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/interrupt.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/of_device.h>
>  #include <linux/of_gpio.h>
> +#include <linux/of_graph.h>
>  #include <linux/of_irq.h>
>  #include <linux/pinctrl/consumer.h>
> -#include <linux/of_graph.h>
> +#include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spinlock.h>
> -#include <linux/mfd/syscon.h>
> -#include <linux/regmap.h>
> +
>  #include <video/mipi_display.h>
>  
>  #include "dsi.h"
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index c3a61876470f..1594f1422372 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2016, The Linux Foundation. All rights reserved.
>   */
>  
> +#include <linux/delay.h>
> +
>  #include "dsi_phy.h"
>  #include "dsi.xml.h"
>  
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index a198f51d47b4..f22583353957 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2012-2015, The Linux Foundation. All rights reserved.
>   */
>  
> +#include <linux/delay.h>
> +
>  #include "dsi_phy.h"
>  #include "dsi.xml.h"
>  
> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
> index 118bebe53de3..c6a3623f905d 100644
> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
> @@ -6,8 +6,8 @@
>  #ifndef __DSI_PLL_H__
>  #define __DSI_PLL_H__
>  
> -#include <linux/clk.h>
>  #include <linux/clk-provider.h>
> +#include <linux/delay.h>
>  
>  #include "dsi.h"
>  
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index 03197b8959ba..867691ea7900 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -15,6 +15,8 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <linux/delay.h>
> +
>  #include "hdmi.h"
>  
>  struct hdmi_bridge {
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> index a6eeab2c4dc3..e3dc4e781558 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
> @@ -15,6 +15,7 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <linux/delay.h>
>  #include <linux/gpio.h>
>  #include <linux/pinctrl/consumer.h>
>  
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> index fe82ad38aa7a..a8f3b2cbfdc5 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/clk-provider.h>
> +#include <linux/delay.h>
>  
>  #include "hdmi.h"
>  
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
> index a68eea4153fc..e1bd9b357617 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
> @@ -15,6 +15,8 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <linux/delay.h>
> +
>  #include "hdmi.h"
>  
>  static void hdmi_phy_8x60_powerup(struct hdmi_phy *phy,
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
> index c6dae6e437f9..eff970f8ab8c 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
> @@ -17,6 +17,8 @@
>   */
>  
>  #include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +
>  #include "hdmi.h"
>  
>  struct hdmi_pll_8960 {
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 3b13ea0ea92f..c0cb8e7b1a33 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -17,6 +17,7 @@
>  
>  #include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_vblank.h>
>  
>  #include "msm_drv.h"
>  #include "msm_gem.h"
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> index 67ef300559cf..b3ae7b7ab5d8 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -16,7 +16,12 @@
>   */
>  
>  #ifdef CONFIG_DEBUG_FS
> +
>  #include <linux/debugfs.h>
> +
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_file.h>
> +
>  #include "msm_drv.h"
>  #include "msm_gpu.h"
>  #include "msm_kms.h"
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index b2503e8a313b..6857a2a95e92 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -16,9 +16,18 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <linux/dma-mapping.h>
>  #include <linux/kthread.h>
> +#include <linux/uaccess.h>
>  #include <uapi/linux/sched/types.h>
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_ioctl.h>
> +#include <drm/drm_irq.h>
> +#include <drm/drm_prime.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_vblank.h>
>  
>  #include "msm_drv.h"
>  #include "msm_debugfs.h"
> @@ -28,7 +37,6 @@
>  #include "msm_kms.h"
>  #include "adreno/adreno_gpu.h"
>  
> -
>  /*
>   * MSM driver version:
>   * - 1.0.0 - initial interface
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index e20e6b429804..ff008892f777 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -36,7 +36,6 @@
>  #include <linux/sizes.h>
>  #include <linux/kthread.h>
>  
> -#include <drm/drmP.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_plane_helper.h>
> diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
> index 68fa2c8f61e6..88c35206096a 100644
> --- a/drivers/gpu/drm/msm/msm_fb.c
> +++ b/drivers/gpu/drm/msm/msm_fb.c
> @@ -16,6 +16,8 @@
>   */
>  
>  #include <drm/drm_crtc.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_probe_helper.h>
>  
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index d088299babf3..d776512f97cd 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -17,6 +17,7 @@
>  
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_fb_helper.h>
> +#include <drm/drm_fourcc.h>
>  
>  #include "msm_drv.h"
>  #include "msm_kms.h"
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 404b6fea9e35..eb3a9080c75a 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -20,6 +20,8 @@
>  #include <linux/dma-buf.h>
>  #include <linux/pfn_t.h>
>  
> +#include <drm/drm_prime.h>
> +
>  #include "msm_drv.h"
>  #include "msm_fence.h"
>  #include "msm_gem.h"
> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
> index 60bb290700ce..1c957a6e7c23 100644
> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> @@ -15,11 +15,13 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <linux/dma-buf.h>
> +
> +#include <drm/drm_prime.h>
> +
>  #include "msm_drv.h"
>  #include "msm_gem.h"
>  
> -#include <linux/dma-buf.h>
> -
>  struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
>  {
>  	struct msm_gem_object *msm_obj = to_msm_bo(obj);
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 1b681306aca3..ae776448f0e5 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -15,7 +15,11 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <linux/file.h>
>  #include <linux/sync_file.h>
> +#include <linux/uaccess.h>
> +
> +#include <drm/drm_file.h>
>  
>  #include "msm_drv.h"
>  #include "msm_gpu.h"
> diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
> index 27312b553dd8..34f643a0c28a 100644
> --- a/drivers/gpu/drm/msm/msm_gpummu.c
> +++ b/drivers/gpu/drm/msm/msm_gpummu.c
> @@ -1,6 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /* Copyright (c) 2018 The Linux Foundation. All rights reserved. */
>  
> +#include <linux/dma-mapping.h>
> +
>  #include "msm_drv.h"
>  #include "msm_mmu.h"
>  #include "adreno/adreno_gpu.h"
> diff --git a/drivers/gpu/drm/msm/msm_perf.c b/drivers/gpu/drm/msm/msm_perf.c
> index 5ab21bd2decb..655ecc2dbcc8 100644
> --- a/drivers/gpu/drm/msm/msm_perf.c
> +++ b/drivers/gpu/drm/msm/msm_perf.c
> @@ -26,6 +26,9 @@
>  #ifdef CONFIG_DEBUG_FS
>  
>  #include <linux/debugfs.h>
> +#include <linux/uaccess.h>
> +
> +#include <drm/drm_file.h>
>  
>  #include "msm_drv.h"
>  #include "msm_gpu.h"
> diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
> index d21172933d92..283890ac3f66 100644
> --- a/drivers/gpu/drm/msm/msm_rd.c
> +++ b/drivers/gpu/drm/msm/msm_rd.c
> @@ -42,11 +42,14 @@
>  
>  #ifdef CONFIG_DEBUG_FS
>  
> -#include <linux/kfifo.h>
> -#include <linux/debugfs.h>
>  #include <linux/circ_buf.h>
> +#include <linux/debugfs.h>
> +#include <linux/kfifo.h>
> +#include <linux/uaccess.h>
>  #include <linux/wait.h>
>  
> +#include <drm/drm_file.h>
> +
>  #include "msm_drv.h"
>  #include "msm_gpu.h"
>  #include "msm_gem.h"
> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> index c70e00e22c4c..001fbf537440 100644
> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> @@ -3,6 +3,8 @@
>   */
>  
>  #include <linux/kref.h>
> +#include <linux/uaccess.h>
> +
>  #include "msm_gpu.h"
>  
>  void msm_submitqueue_destroy(struct kref *kref)
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
