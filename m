Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEEA1D414E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 15:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbfJKNcQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 09:32:16 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:45599 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727750AbfJKNcQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 09:32:16 -0400
Received: by mail-yw1-f67.google.com with SMTP id x65so3462336ywf.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2019 06:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=02TD0nQdGjq+WTUklEHpJ8GWzd5hRjmXuYS+iQ/J8YM=;
        b=F6VfDSeVVuNdctACGpvawpF78CqRtwXPdB8aEmH9yoS+p3pjgO+/kY4XEIT0BXBz3i
         zLW7OrV1rYg4YyfMfPKMF5D33BmNYUQXa6ZtCyd0myuiwFRXGPtz+mMHZNFIXMg3srZ9
         9zlZKUAvMesssnMZzWyCEMnVUM7T+BEuGqYbMOpK9c2Elog36qFcrQ6VKp6W2nLdgt1O
         cJU+ZAdgyzTweaoicNgo1zfD7IWN0gpiuFk43M69Acx+XUzLUPV8dgMfdk4uK6QbxBDO
         iKXT3RUrHm/qHXIJtJINmHRatUkKqzhvZl1VAIqJMtN3Vw8werTETeVBmNSl3JCRvz8n
         fPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=02TD0nQdGjq+WTUklEHpJ8GWzd5hRjmXuYS+iQ/J8YM=;
        b=eoHCLMff6pS8OcD/BC+zJleFunu2t/QT1LjWflfGzY4SSfbhpaUujpNi8vtaiyDu3R
         D0eiylswhH6rzuYbtZXP5JbWoFYqCgkP3E3Sc0Gn4CeDpQMCZQF3q9NOHgdiwBdrlgo8
         kmEJk8YCBGGRZW04JPE7KkfLj+89IYHo2csii11MFsQrBEjaYWRhvmH8tf/FtEimr9MO
         kQrnBUBmdvTm09Hk6o6gJvVJKCrp9zXXrflSw5okys7GLC/cVsnK1CQElP8sstr9kK1p
         KUZAcDbQT4i0F107U2yAJGZ4LjF8XdRQZSoQmCyh+YFMkRKvBAB/ecuBW2cMbe4SXeFx
         e6+Q==
X-Gm-Message-State: APjAAAVay8sUf885Qz2FcPpMQWorwgJlcHPLvSdtsBK+F1iAfuU54Cau
        d6Z4eBu9YpVLhq/TDAchoC3Kig==
X-Google-Smtp-Source: APXvYqyQcF1QnWCWS2smwFENHBxJsoyAmQQmx3VE5bf6NS7ZLhr5+x/Vh/BawvnF/aZ0g8IDoyzq2w==
X-Received: by 2002:a81:7996:: with SMTP id u144mr2423868ywc.392.1570800734726;
        Fri, 11 Oct 2019 06:32:14 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id l11sm2175988ywh.34.2019.10.11.06.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 06:32:14 -0700 (PDT)
Date:   Fri, 11 Oct 2019 09:32:13 -0400
From:   Sean Paul <sean@poorly.run>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-kernel@lists.codethink.co.uk,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/mdp5: make config variables static
Message-ID: <20191011133213.GQ85762@art_vandelay>
References: <20191009120522.17019-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009120522.17019-1-ben.dooks@codethink.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 09, 2019 at 01:05:22PM +0100, Ben Dooks wrote:
> A number of the config structs are not exported so make
> them static to avoid the following sparse warnings:
> 
> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:17:26: warning: symbol 'msm8x74v1_config' was not declared. Should it be static?
> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:101:26: warning: symbol 'msm8x74v2_config' was not declared. Should it be static?
> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:183:26: warning: symbol 'apq8084_config' was not declared. Should it be static?
> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:278:26: warning: symbol 'msm8x16_config' was not declared. Should it be static?
> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:345:26: warning: symbol 'msm8x94_config' was not declared. Should it be static?
> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:440:26: warning: symbol 'msm8x96_config' was not declared. Should it be static?
> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:548:26: warning: symbol 'msm8917_config' was not declared. Should it be static?
> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:633:26: warning: symbol 'msm8998_config' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Applied to msm-next, thanks for the patch!

Sean

> ---
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> index f6e71ff539ca..7c9c1ddae821 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> @@ -14,7 +14,7 @@ struct mdp5_cfg_handler {
>  /* mdp5_cfg must be exposed (used in mdp5.xml.h) */
>  const struct mdp5_cfg_hw *mdp5_cfg = NULL;
>  
> -const struct mdp5_cfg_hw msm8x74v1_config = {
> +static const struct mdp5_cfg_hw msm8x74v1_config = {
>  	.name = "msm8x74v1",
>  	.mdp = {
>  		.count = 1,
> @@ -98,7 +98,7 @@ const struct mdp5_cfg_hw msm8x74v1_config = {
>  	.max_clk = 200000000,
>  };
>  
> -const struct mdp5_cfg_hw msm8x74v2_config = {
> +static const struct mdp5_cfg_hw msm8x74v2_config = {
>  	.name = "msm8x74",
>  	.mdp = {
>  		.count = 1,
> @@ -180,7 +180,7 @@ const struct mdp5_cfg_hw msm8x74v2_config = {
>  	.max_clk = 200000000,
>  };
>  
> -const struct mdp5_cfg_hw apq8084_config = {
> +static const struct mdp5_cfg_hw apq8084_config = {
>  	.name = "apq8084",
>  	.mdp = {
>  		.count = 1,
> @@ -275,7 +275,7 @@ const struct mdp5_cfg_hw apq8084_config = {
>  	.max_clk = 320000000,
>  };
>  
> -const struct mdp5_cfg_hw msm8x16_config = {
> +static const struct mdp5_cfg_hw msm8x16_config = {
>  	.name = "msm8x16",
>  	.mdp = {
>  		.count = 1,
> @@ -342,7 +342,7 @@ const struct mdp5_cfg_hw msm8x16_config = {
>  	.max_clk = 320000000,
>  };
>  
> -const struct mdp5_cfg_hw msm8x94_config = {
> +static const struct mdp5_cfg_hw msm8x94_config = {
>  	.name = "msm8x94",
>  	.mdp = {
>  		.count = 1,
> @@ -437,7 +437,7 @@ const struct mdp5_cfg_hw msm8x94_config = {
>  	.max_clk = 400000000,
>  };
>  
> -const struct mdp5_cfg_hw msm8x96_config = {
> +static const struct mdp5_cfg_hw msm8x96_config = {
>  	.name = "msm8x96",
>  	.mdp = {
>  		.count = 1,
> @@ -545,7 +545,7 @@ const struct mdp5_cfg_hw msm8x96_config = {
>  	.max_clk = 412500000,
>  };
>  
> -const struct mdp5_cfg_hw msm8917_config = {
> +static const struct mdp5_cfg_hw msm8917_config = {
>  	.name = "msm8917",
>  	.mdp = {
>  		.count = 1,
> @@ -630,7 +630,7 @@ const struct mdp5_cfg_hw msm8917_config = {
>  	.max_clk = 320000000,
>  };
>  
> -const struct mdp5_cfg_hw msm8998_config = {
> +static const struct mdp5_cfg_hw msm8998_config = {
>  	.name = "msm8998",
>  	.mdp = {
>  		.count = 1,
> -- 
> 2.23.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
