Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA43B3C23F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 15:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbhGINJm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 09:09:42 -0400
Received: from vps5.brixit.nl ([192.81.221.234]:48258 "EHLO vps5.brixit.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231285AbhGINJl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 09:09:41 -0400
Received: from [192.168.20.2] (unknown [77.239.252.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by vps5.brixit.nl (Postfix) with ESMTPSA id BB70760878;
        Fri,  9 Jul 2021 13:06:55 +0000 (UTC)
Subject: Re: [Freedreno] [PATCH v1 0/7] drm/msm/dpu: add support for
 idependent DSI config
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
From:   Alexey Minnekhanov <alexeymin@postmarketos.org>
Message-ID: <04b7d3f0-5781-e741-7c83-93c1ea71077c@postmarketos.org>
Date:   Fri, 9 Jul 2021 16:06:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

08.07.2021 15:28, Dmitry Baryshkov wrote:
> This patchseries adds support for independent DSI config to DPU1 display
> subdriver. Also drop one of msm_kms_funcs callbacks, made unnecessary
> now.
> 
> Tested on RB5 (dpu, dsi). Previous iteration was tested by Alexey
> Minnekhanov.
> 
> Changes since v1:
>   - renamed dual DSI to bonded DSI as suggsted by Abhinav
>   - added comments to _dpu_kms_initialize_dsi() regarding encoders usage
> 
> The following changes since commit e88bbc91849b2bf57683119c339e52916d34433f:
> 
>    Revert "drm/msm/mdp5: provide dynamic bandwidth management" (2021-06-23 14:06:20 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-drm-drop-set-encoder-mode-1
> 
> for you to fetch changes up to 142f79dfc41271576731a49516d63ad47a56e1ca:
> 
>    drm/msm/kms: drop set_encoder_mode callback (2021-07-08 15:20:52 +0300)
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (7):
>        drm/msm/dsi: rename dual DSI to bonded DSI
>        drm/msm/dsi: add two helper functions
>        drm/msm/dpu: support setting up two independent DSI connectors
>        drm/msm/mdp5: move mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
>        drm/msm/dp: stop calling set_encoder_mode callback
>        drm/msm/dsi: stop calling set_encoder_mode callback
>        drm/msm/kms: drop set_encoder_mode callback
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 102 +++++++++++++++++--------------
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  11 +---
>   drivers/gpu/drm/msm/dp/dp_display.c      |  18 ------
>   drivers/gpu/drm/msm/dsi/dsi.c            |   9 ++-
>   drivers/gpu/drm/msm/dsi/dsi.h            |   9 ++-
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h        |   2 +-
>   drivers/gpu/drm/msm/dsi/dsi_host.c       |  30 ++++-----
>   drivers/gpu/drm/msm/dsi/dsi_manager.c    |  93 ++++++++++++----------------
>   drivers/gpu/drm/msm/msm_drv.h            |  12 +++-
>   drivers/gpu/drm/msm/msm_kms.h            |   3 -
>   10 files changed, 136 insertions(+), 153 deletions(-)
> 

I've tested these patches (again), on msm8974 samsung-klte device with 
MDP5 and nothing is broken.

Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>

-- 
Regards
Alexey Minnekhanov
postmarketOS developer
https://www.postmarketos.org
