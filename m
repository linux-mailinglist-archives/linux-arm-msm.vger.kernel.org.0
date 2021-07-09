Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2C93C2B3F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 00:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbhGIWSV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 18:18:21 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:30902 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229542AbhGIWSV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 18:18:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625868937; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Szm39ZLXgBdXqbP+1PHVoG0FY1AFYig1h9D64F0bEwk=;
 b=lbeBCqGRGV4nTJC5CEHTRsk7S5RhrRBvCVLCk1bDolWsBygUvwfr4mC2VVCzbVFuwXo/MpVA
 tty0kam8iCdVsIupA6ZWLRjC7ifETRQoKJNPgD0rDt1/lGlPySihayVFnvYeaMkbaQ4lLbDU
 w/FJDK/vrJF3DsP1xu1sPuJG0hw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60e8ca75c4cc5436026864cc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Jul 2021 22:15:17
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 883DEC43460; Fri,  9 Jul 2021 22:15:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 47EEBC433F1;
        Fri,  9 Jul 2021 22:15:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 09 Jul 2021 15:15:16 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v1 4/7] drm/msm/mdp5: move
 mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
In-Reply-To: <20210708122833.363451-5-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
 <20210708122833.363451-5-dmitry.baryshkov@linaro.org>
Message-ID: <8440bad60c08e94af4407798eac385bb@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-08 05:28, Dmitry Baryshkov wrote:
> Move a call to mdp5_encoder_set_intf_mode() after
> msm_dsi_modeset_init(), removing set_encoder_mode callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 15aed45022bc..b3b42672b2d4 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -209,13 +209,6 @@ static int mdp5_set_split_display(struct msm_kms 
> *kms,
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
> @@ -448,6 +440,9 @@ static int modeset_init_intf(struct mdp5_kms 
> *mdp5_kms,
>  		}
> 
>  		ret = msm_dsi_modeset_init(priv->dsi[dsi_id], dev, encoder);
> +		if (!ret)
> +			mdp5_encoder_set_intf_mode(encoder, 
> msm_dsi_is_cmd_mode(priv->dsi[dsi_id]));
> +
>  		break;
>  	}
>  	default:
