Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD2644E5038
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 11:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234945AbiCWKVI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 06:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbiCWKVH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 06:21:07 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BBFE42ED9
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 03:19:36 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id t25so1877036lfg.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 03:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jwtA3pgAKVmewmwW2CEap5jLxzJfz+i4doALRThTG/0=;
        b=Ozm3WAqOjbC0V3L/SexsRDLgqPGbQ+k9Dtlbs+44tZzQAxPVOUmDuiUtozcEUvrsLV
         cWCXozTIQ11E03wMEVVx/hHBc29OhUv9Myl8UkTsmVjav5OI9tOg+E6jvKHKF4dUPUS7
         ungFFhBemjEuyNPXv6RdsSgOluIODx0ZfWwuD0L8GbsnsxeSAkjyZzggbgTu0S2BRXTS
         Ncy8LgG4UUjiiuw20bZ02ZKfNcZTSrLSyFwujCGI9pszouqSAWVh3I5sM7VkNs+vvsPQ
         dyhFWt5J9v8lJx/qvlgFWt0pWcKZcwfGxHBmh2B1c6cDsHXhs/3hFtEZPzPq+bbpxa7/
         +iTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jwtA3pgAKVmewmwW2CEap5jLxzJfz+i4doALRThTG/0=;
        b=RgPx3OFU0nCEYWPXZENLvkS+rw6Ne1mGTBab9sHBvFJH70rV3ldluzzrhN4oJAHoHt
         Zze65o7mTUwgufwYIRxH81hlBac+XBYn1r9hwJM7yqaRyKbfVNW4f+8qXar3M1FM/b8B
         hcEaaV5bzA9cvS97PfAEg2OcDZ8TLqoB53Fxjg4hgvSv3wiLhXykmB7D/sWl/RjPCnih
         UOT8p/WWI8UxyhVMbwUoSK2PSFKcI00gdnQmnGS6NL2SrrYAkJe2ZKfimyLGG7He8IKI
         dvR7Wq+v4Xhynj7doeCCAEKnvdQTC62F5t7aX8RRiApo9CWE2i4S67hEKzcAZ2X2/eyo
         pGUQ==
X-Gm-Message-State: AOAM532b8npWw7nxg+76e9ntoNx70Z3J+ne9J9bYZq2UkCBe0OS7SIJR
        xlmyBBVWb27llTyX2eVIE1h5wuaR5fwwQQ==
X-Google-Smtp-Source: ABdhPJxbtenqDf8ffjjp86dT+ADLbGZK3u3Ely90YnIqBwOcBYrFmxDEgjlPMaX8dGIge+Yb7sJADA==
X-Received: by 2002:a05:6512:3d13:b0:449:fd85:f61d with SMTP id d19-20020a0565123d1300b00449fd85f61dmr20090668lfv.368.1648030775062;
        Wed, 23 Mar 2022 03:19:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c6-20020a19e346000000b00448ac0a351dsm2484589lfk.221.2022.03.23.03.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 03:19:34 -0700 (PDT)
Message-ID: <5b2a478f-9864-8fcd-574d-1527cc9b3333@linaro.org>
Date:   Wed, 23 Mar 2022 13:19:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 10/22] drm/msm: Nuke weird on stack mode copy
Content-Language: en-GB
To:     Ville Syrjala <ville.syrjala@linux.intel.com>,
        dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-11-ville.syrjala@linux.intel.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220218100403.7028-11-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/02/2022 13:03, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> This on stack middle man mode looks entirely pointless.
> Just duplicate the original mode directly.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

I took a glance at the surrounding piece of code.
The dp_connector_get_modes() calls dp_display_get_modes() in attempt to 
fill the dp_mode argument. However the dp_display_get_modes() function 
just calls dp_panel_get_modes(), which does not touch dp_mode argument 
since the commit ab205927592b ("drm/msm/dp: remove mode hard-coding in 
case of DP CTS") dating September 2020. I think we can drop this piece 
of code completely.

> ---
>   drivers/gpu/drm/msm/dp/dp_drm.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index d4d360d19eba..09188d02aa1e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -56,7 +56,7 @@ static int dp_connector_get_modes(struct drm_connector *connector)
>   	int rc = 0;
>   	struct msm_dp *dp;
>   	struct dp_display_mode *dp_mode = NULL;
> -	struct drm_display_mode *m, drm_mode;
> +	struct drm_display_mode *m;
>   
>   	if (!connector)
>   		return 0;
> @@ -82,13 +82,11 @@ static int dp_connector_get_modes(struct drm_connector *connector)
>   			return rc;
>   		}
>   		if (dp_mode->drm_mode.clock) { /* valid DP mode */
> -			memset(&drm_mode, 0x0, sizeof(drm_mode));
> -			drm_mode_copy(&drm_mode, &dp_mode->drm_mode);
> -			m = drm_mode_duplicate(connector->dev, &drm_mode);
> +			m = drm_mode_duplicate(connector->dev, &dp_mode->drm_mode);
>   			if (!m) {
>   				DRM_ERROR("failed to add mode %ux%u\n",
> -				       drm_mode.hdisplay,
> -				       drm_mode.vdisplay);
> +					  dp_mode->drm_mode.hdisplay,
> +					  dp_mode->drm_mode.vdisplay);
>   				kfree(dp_mode);
>   				return 0;
>   			}


-- 
With best wishes
Dmitry
