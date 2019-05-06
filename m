Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8828A14E1E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2019 16:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbfEFO6w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 May 2019 10:58:52 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:42490 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728674AbfEFOnj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 May 2019 10:43:39 -0400
Received: by mail-ed1-f66.google.com with SMTP id l25so15590594eda.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 May 2019 07:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=vaAPp8PyjYHsdP1CZGhOGZcNrdzUmU4mz1az3gjIEag=;
        b=TeJLtrEe4JxAY6kU+FgDMqxxH774q5OmDnPgF4z1LCxJ0gA2hydu8AIgwxknkumsP+
         w+p3KFDudzEwfTQwrebwzQ8H7AFC6XnqlApAqm6znxrbNtpsSorAwrpuQTF7daJEPSte
         JtoM1vJiuvvMaYngrNIWUOuj8SndGJQPvePfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=vaAPp8PyjYHsdP1CZGhOGZcNrdzUmU4mz1az3gjIEag=;
        b=k0IgmYjku1QviXVbg+XO4OYbZUQgPFp+RL0EGLJWHRqL4AjTl0vQ3N03fohFEE1Rld
         7trxCre1nxy0+0Bj463EASwLEhC1CmjrEGuYz6fRFxkNoVh73Rc8G5+16kUB0tBjx5ew
         ACXDOM7dmiIlOGQd/fONV5vKelhL0+SNI7W3dreqT7/le3O+1qGAu3RAYdhxY/LfNqj9
         txq8Mey/f43xprSrqr6mKEUasYoNgRO3nQvJ1iNyN0Hhuri4KhpLFi6hEfDW5YgCK+2R
         6AyVMMFMI/j4D956AolyxQFVTjmQU93491rxCwen0YBvFY+n8eBpGokeyjBskx0DaH/P
         awYA==
X-Gm-Message-State: APjAAAXpsFMJab4NCoRQZcm25+l3bclIdN0Lpnsp9EODjvH3op/VDsyt
        h836KPypkDEV5rwCBnBAkpcZHw==
X-Google-Smtp-Source: APXvYqwtl5T/MpDTj7LbNirYR1SvYe+WhzHms3LVnX/pzSNP1kZnlocJBCYDhRieEoZXTXVwEMT6xg==
X-Received: by 2002:a50:be42:: with SMTP id b2mr27581867edi.228.1557153817556;
        Mon, 06 May 2019 07:43:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id q18sm1602623ejp.56.2019.05.06.07.43.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 07:43:36 -0700 (PDT)
Date:   Mon, 6 May 2019 16:43:34 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     jagdsh.linux@gmail.com
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, bskeggs@redhat.com, hierry.reding@gmail.com,
        jcrouse@codeaurora.org, jsanka@codeaurora.org,
        skolluku@codeaurora.org, paul.burton@mips.com,
        jrdr.linux@gmail.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH] gpu/drm: Remove duplicate headers
Message-ID: <20190506144334.GH17751@phenom.ffwll.local>
Mail-Followup-To: jagdsh.linux@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, bskeggs@redhat.com,
        hierry.reding@gmail.com, jcrouse@codeaurora.org,
        jsanka@codeaurora.org, skolluku@codeaurora.org,
        paul.burton@mips.com, jrdr.linux@gmail.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        nouveau@lists.freedesktop.org
References: <1556906293-128921-1-git-send-email-jagdsh.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556906293-128921-1-git-send-email-jagdsh.linux@gmail.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 03, 2019 at 11:28:13PM +0530, jagdsh.linux@gmail.com wrote:
> From: Jagadeesh Pagadala <jagdsh.linux@gmail.com>
> 
> Remove duplicate headers which are included twice.
> 
> Signed-off-by: Jagadeesh Pagadala <jagdsh.linux@gmail.com>

I collected some acks for the msm and nouveau parts and pushed this. For
next time around would be great if you split these up along driver/module
boundaries, so that each maintainer can pick this up directly.

Thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c             | 1 -
>  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.c        | 2 --
>  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 1 -
>  3 files changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 018df2c..45a5bc6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -15,7 +15,6 @@
>  #include "dpu_hwio.h"
>  #include "dpu_hw_lm.h"
>  #include "dpu_hw_mdss.h"
> -#include "dpu_kms.h"
>  
>  #define LM_OP_MODE                        0x00
>  #define LM_OUT_SIZE                       0x04
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.c
> index c80b967..2b44ba5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.c
> @@ -26,8 +26,6 @@
>  
>  #include <subdev/gpio.h>
>  
> -#include <subdev/gpio.h>
> -
>  static void
>  nv04_bus_intr(struct nvkm_bus *bus)
>  {
> diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> index 2c9c972..cacf2e0 100644
> --- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> +++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> @@ -53,7 +53,6 @@
>  #include <linux/of_graph.h>
>  #include <linux/pm.h>
>  
> -#include <drm/drm_panel.h>
>  #include <drm/drmP.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_mipi_dsi.h>
> -- 
> 1.8.3.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
