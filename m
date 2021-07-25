Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 048983D4B5B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jul 2021 06:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhGYD1Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 23:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbhGYD1P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 23:27:15 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66D3C061757
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:07:45 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id t14so6929156oiw.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qPcNovK3Jzv6MtpyivEjOb1iOtKi6VllcBgW2npDIL4=;
        b=OAm2GVtDtg6CScF2A4zXsPXLM+2JKdKs1pxzF6fFyt1dJ97jQVWjIsxU5oajipFb69
         qdnbXOJzsJ6fn5Ud9acHbo+Eef3gDSniSJU7UDnl0SOBK+xfD8ulvDjS1LbXVNHmuMdg
         Mg4AJXGMcIHn+NqtSZqHjTLnAtAw4LSpkRGFjnTLwsgn52mdiRrSR5ShoR5bcTWNQJYP
         Ui8cSqAVxvlFn9L0pVll7l/oOqDYN1RKKLZTdfjd7gdwue3vX1p0dbZYl3SJckqYGUnx
         jFrAkzalrRSyWiLZUoRTofSEyGsXCLNYh8rjakhFVlCQg7kfFeWj8xJnqKSQB/HkdKsy
         4jNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qPcNovK3Jzv6MtpyivEjOb1iOtKi6VllcBgW2npDIL4=;
        b=UDEnrk9vOzOqXxa7iVt7V4mve1Bk0xeC3Wrvagbp+nbuHrpTpGmDv/BfxO/6I5Lhso
         YCd77D2WafWhH2xq0T6gmf8GLBgxNUg2xwBTFzeDwlhSrsAAMUjEz7gmPhNF6Zo9+Fue
         kbyteH05sXC0KBTRoVFah6bEDs4189+O9Dio0nOkkv977yDBLab9ZNlyS5V5V413eA0p
         stV744G4Kfe34ZfA79REmhLJEWJt2ffIXbGX6KXmtXm8LrtH43Kx75S9gr+dT08Cgqxr
         P2e+Irvks7ghua6P3lb5plHjkg0Ar7wNcFgSR2BHwp3isor9nsZmFQzVfmTBaGBKcAJf
         DEkw==
X-Gm-Message-State: AOAM532T+4BxHgS7Ci5H0QeY37N03vbjY9RxwqXzbvJH1jnmw1YjvoWH
        hPXVXPb6gVb3G6NYyWlpQabtRQ==
X-Google-Smtp-Source: ABdhPJwkPlnCB+1QqkdkHxGlKCOfc40Jrh5YdNvYb30Pc3if3sEKq8nTavHZ0IXJG7z9aIQmeFg5Pw==
X-Received: by 2002:aca:a8cf:: with SMTP id r198mr7266642oie.143.1627186065231;
        Sat, 24 Jul 2021 21:07:45 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w75sm1564575oiw.12.2021.07.24.21.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:07:44 -0700 (PDT)
Date:   Sat, 24 Jul 2021 23:07:42 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 4/7] drm/msm/mdp5: move mdp5_encoder_set_intf_mode
 after msm_dsi_modeset_init
Message-ID: <YPzjjkXv2orcG739@yoga>
References: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
 <20210717124016.316020-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210717124016.316020-5-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 17 Jul 07:40 CDT 2021, Dmitry Baryshkov wrote:

> Move a call to mdp5_encoder_set_intf_mode() after
> msm_dsi_modeset_init(), removing set_encoder_mode callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 15aed45022bc..b3b42672b2d4 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -209,13 +209,6 @@ static int mdp5_set_split_display(struct msm_kms *kms,
>  							  slave_encoder);
>  }
>  
> -static void mdp5_set_encoder_mode(struct msm_kms *kms,
> -				  struct drm_encoder *encoder,
> -				  bool cmd_mode)
> -{
> -	mdp5_encoder_set_intf_mode(encoder, cmd_mode);
> -}
> -
>  static void mdp5_kms_destroy(struct msm_kms *kms)
>  {
>  	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
> @@ -287,7 +280,6 @@ static const struct mdp_kms_funcs kms_funcs = {
>  		.get_format      = mdp_get_format,
>  		.round_pixclk    = mdp5_round_pixclk,
>  		.set_split_display = mdp5_set_split_display,
> -		.set_encoder_mode = mdp5_set_encoder_mode,
>  		.destroy         = mdp5_kms_destroy,
>  #ifdef CONFIG_DEBUG_FS
>  		.debugfs_init    = mdp5_kms_debugfs_init,
> @@ -448,6 +440,9 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
>  		}
>  
>  		ret = msm_dsi_modeset_init(priv->dsi[dsi_id], dev, encoder);
> +		if (!ret)
> +			mdp5_encoder_set_intf_mode(encoder, msm_dsi_is_cmd_mode(priv->dsi[dsi_id]));
> +
>  		break;
>  	}
>  	default:
> -- 
> 2.30.2
> 
