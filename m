Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAAAF4B721C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 17:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240928AbiBOPox (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 10:44:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240927AbiBOPol (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 10:44:41 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD668EC5E3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 07:38:56 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id 189-20020a4a03c6000000b003179d7b30d8so23631135ooi.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 07:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EmhmbCMLSvgMI/Yp90rzcqykoF7qOyKTGKjZUXBL3+Y=;
        b=TU+Z3LV0OTJmXTcz5t0PoFnUR7njNtbMnOQXcjnG2dnGd2Bg8aZNe+3GdsUYJCrUN/
         VpWNVZwOyfs/Jq6deASO/LkTWy7ltrhyfBUffXKevYiJseRsfvW15fY8iueeP154lVU+
         ujbSVOlVJEe/DONvxxT5RjK4vLdpr+TrvOe6bimVi5KNvQegpHhr1mSha2oBBwL+nhbR
         /cNVZ5+GJBAHw2A3O1/T1278Tp84hEg+yw+NPlNTtc4STYys+gPVar4xvIPbU4Yj9iuw
         ruuxK/6GQp9btXHgyvwHBNR0ahRcpvS28Y8LdrYFViMK5DhG3EdE66jAOW3yqPjKDdga
         lDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EmhmbCMLSvgMI/Yp90rzcqykoF7qOyKTGKjZUXBL3+Y=;
        b=2212Qj0vUv3Svy3tzJElLFUxfOAmonnDLb4U6O2amEvQnXskzOUCrHskJyxmal/0Mo
         Mnjd6byPh2omdmJ+Aa0ISL6+UFEzdL7v+42l5Eev5WJLwcvV4OS4sl80SY6P1sSS/ZGp
         tLJ17gNSiUAEwE7Ew1A6Ac6z7FNTWsGuIxC3ZNzlwZEHebGmrqaRWX7iCub5QQ5wSflW
         8iZN4t1H4XPuFuCBgzZyuF8viUxOY6t+50O8a4kyA/NHXNix55trlUyzjM88kHnQNKER
         QV9D+U0mfFAo568fVxuSxq3U/DggLCzRZJtueczdlZx9BqEHIKUX3aK9c3qlYCrQy0SA
         GAIg==
X-Gm-Message-State: AOAM5311818j2yyjaRA8mizrz5nvFAnykqZt2SWGaOO1hkTFbWJ9DsWP
        eWfGoNGKFIIPGbLDmEIp1p+SuA==
X-Google-Smtp-Source: ABdhPJwniUUrFyPY+itLrwf9hGIBFcNHVJBm03Um97xeABEfXlO/Cld1YQuGI24h53YLl0d3lJg+mw==
X-Received: by 2002:a4a:4ec6:: with SMTP id r189mr1430542ooa.31.1644939536187;
        Tue, 15 Feb 2022 07:38:56 -0800 (PST)
Received: from yoga ([2600:1700:a0:3dc8:5c39:baff:fe03:898d])
        by smtp.gmail.com with ESMTPSA id z4sm13758586ota.7.2022.02.15.07.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 07:38:55 -0800 (PST)
Date:   Tue, 15 Feb 2022 09:38:53 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 4/8] drm/msm/dpu: drop bus_scaling_client field
Message-ID: <YgvJDVHYfuns03W5@yoga>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215141643.3444941-5-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Feb 08:16 CST 2022, Dmitry Baryshkov wrote:

> We do not use MSM bus client, so drop bus_scaling_client field from
> dpu_encoder_virt.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 401e37f50d54..480d02ccff8c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -127,7 +127,6 @@ enum dpu_enc_rc_states {
>   *	Virtual encoder registers itself with the DRM Framework as the encoder.
>   * @base:		drm_encoder base class for registration with DRM
>   * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
> - * @bus_scaling_client:	Client handle to the bus scaling interface
>   * @enabled:		True if the encoder is active, protected by enc_lock
>   * @num_phys_encs:	Actual number of physical encoders contained.
>   * @phys_encs:		Container of physical encoders managed.
> @@ -172,7 +171,6 @@ enum dpu_enc_rc_states {
>  struct dpu_encoder_virt {
>  	struct drm_encoder base;
>  	spinlock_t enc_spinlock;
> -	uint32_t bus_scaling_client;
>  
>  	bool enabled;
>  
> -- 
> 2.34.1
> 
