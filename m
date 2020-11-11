Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D502AEC4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 09:51:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbgKKIvK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 03:51:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:59352 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725859AbgKKIvJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 03:51:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2A83AAC75;
        Wed, 11 Nov 2020 08:51:08 +0000 (UTC)
Subject: Re: [PATCH 0/5] add KERN_LEVEL to printk
To:     Bernard Zhao <bernard@vivo.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Eric Anholt <eric@anholt.net>, Sam Ravnborg <sam@ravnborg.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dave Airlie <airlied@redhat.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20201111083131.39817-1-bernard@vivo.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <f704e453-944e-2da8-4f0c-3c9a5c370691@suse.de>
Date:   Wed, 11 Nov 2020 09:51:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111083131.39817-1-bernard@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

Am 11.11.20 um 09:31 schrieb Bernard Zhao:
> Hi:
> 
> When call printk, set the KERN_LEVEL is suggested by the community.
> This patch sereies add KERN_* level to printk which do not set
> this level.

I have no say on the msm driver, but IMHO a much better change would be
a conversion to drm_dbg(), drm_err(), etc.

Best regards
Thomas

> 
> Bernard Zhao (5):
>   adreno/a2xx_gpu.c: add KERN_LEVEL to printk
>   adreno/a3xx_gpu.c: add KERN_LEVEL to printk
>   adreno/a4xx_gpu.c: add KERN_LEVEL to printk
>   adreno/a5xx_gpu.c: add KERN_LEVEL to printk
>   adreno/adreno_gpu.c: add KERN_LEVEL to printk
> 
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c   |  4 ++--
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c   |  4 ++--
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 +++---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 12 ++++++------
>  5 files changed, 14 insertions(+), 14 deletions(-)
> 

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
