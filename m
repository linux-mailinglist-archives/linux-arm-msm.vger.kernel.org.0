Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 779EA70F381
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 11:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbjEXJwj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 05:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbjEXJwX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 05:52:23 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671C3BF
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 02:52:17 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f601c57d8dso6847905e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 02:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684921936; x=1687513936;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MYWJI39pTjS7ZUegpIAhYV9tJl4SIGoDgK+iNrhBUwc=;
        b=em0Z5smbGfsWESG6zOqAshPtqS4fCaOEnVn+rYPd+E51k/11wemVqbdez0Q/6+wCpb
         KUb+UyVWKlpp9/O6Nu3Kjr/C15wzMHp/mTicijrdvrXCEKRmvK7B7XlzWqtpqylGc235
         ETZsVErvamGUQh/B+5cqLXDTUsncEDu4OTKDs9Qho9KfIj6x/ODCoygRsWWJQz3pKL+e
         Ku4rlYTW6Y8MYO1bLTzMkCxflF9eRQiJfSAQEjcmlioVcZiEFb9CDeDA+ciZbB4bzD2W
         BmaDXAr2d1hrkJwP1RjAnI4lCAV/Lv5ZAZzkQiTns8BavWU+BzPDxoqUlvB0PW7DYxxe
         KRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684921936; x=1687513936;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYWJI39pTjS7ZUegpIAhYV9tJl4SIGoDgK+iNrhBUwc=;
        b=X/2lqwET0Gppz8q0eIHY+2Ddf+FT+cHZymmMox38Qx0GOP0cNKimGONvu6FHaRvI4K
         Wlb0PY0TO1CeByheppXvoyviTLVDNA6uLRSkr/Oy7MgmKKyPA7K15gMhPZ0xizTwH7LS
         UP/r0gecYonHsWImwR0Z8lBkopk9veL6i7WgjRXHWeVUEOZso5b45BZTsEXjLM8KIidC
         NtztJdud8hkqDoOA3T/Fe1ZmoEXY3tgyovP3fWjSe12/+32oDAJm8CNgqjrAfkspzakP
         KinuzSf/zmKR+BlULsgOHaFM+VfpdYUxTynVUqoSsU5QGI2tNHp2CfKRHfO1SIBT2fer
         7JIg==
X-Gm-Message-State: AC+VfDzIPTcTtpv2BQ+Fyu/CV26uwqcDOUj8Linr4ySUN5p0IXgg5Akj
        1HyyKZjmphGpp4mfgTymWn74Ig==
X-Google-Smtp-Source: ACHHUZ7hfM7EluPRwedE8qVQj7KRqNrHXZ9UkYoR+bwvQ9L31uV7I31buJgLk8ygvE+SGaSOrN7dJw==
X-Received: by 2002:a05:600c:2942:b0:3f4:2158:28a0 with SMTP id n2-20020a05600c294200b003f4215828a0mr12608553wmd.12.1684921935793;
        Wed, 24 May 2023 02:52:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:39c7:394c:5a3:4047? ([2a01:e0a:982:cbb0:39c7:394c:5a3:4047])
        by smtp.gmail.com with ESMTPSA id g12-20020adff40c000000b00307c46f4f08sm14075325wro.79.2023.05.24.02.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 02:52:15 -0700 (PDT)
Message-ID: <21041738-e23f-45bc-580b-4139c0cb87d9@linaro.org>
Date:   Wed, 24 May 2023 11:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/9] drm/panel: Check for already prepared/enabled in
 drm_panel
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>, hsinyi@google.com,
        devicetree@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, cros-qcom-dts-watchers@chromium.org
References: <20230523193017.4109557-1-dianders@chromium.org>
 <20230523122802.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid>
Organization: Linaro Developer Services
In-Reply-To: <20230523122802.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 23/05/2023 21:27, Douglas Anderson wrote:
> In a whole pile of panel drivers, we have code to make the
> prepare/unprepare/enable/disable callbacks behave as no-ops if they've
> already been called. It's silly to have this code duplicated
> everywhere. Add it to the core instead so that we can eventually
> delete it from all the drivers. Note: to get some idea of the
> duplicated code, try:
>    git grep 'if.*>prepared' -- drivers/gpu/drm/panel
>    git grep 'if.*>enabled' -- drivers/gpu/drm/panel
> 
> NOTE: arguably, the right thing to do here is actually to skip this
> patch and simply remove all the extra checks from the individual
> drivers. Perhaps the checks were needed at some point in time in the
> past but maybe they no longer are? Certainly as we continue
> transitioning over to "panel_bridge" then we expect there to be much
> less variety in how these calls are made. When we're called as part of
> the bridge chain, things should be pretty simple. In fact, there was
> some discussion in the past about these checks [1], including a
> discussion about whether the checks were needed and whether the calls
> ought to be refcounted. At the time, I decided not to mess with it
> because it felt too risky.
> 
> Looking closer at it now, I'm fairly certain that nothing in the
> existing codebase is expecting these calls to be refcounted. The only
> real question is whether someone is already doing something to ensure
> prepare()/unprepare() match and enabled()/disable() match. I would say
> that, even if there is something else ensuring that things match,
> there's enough complexity that adding an extra bool and an extra
> double-check here is a good idea. Let's add a drm_warn() to let people
> know that it's considered a minor error to take advantage of
> drm_panel's double-checking but we'll still make things work fine.
> 
> [1] https://lore.kernel.org/r/20210416153909.v4.27.I502f2a92ddd36c3d28d014dd75e170c2d405a0a5@changeid
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   drivers/gpu/drm/drm_panel.c | 49 ++++++++++++++++++++++++++++++++-----
>   include/drm/drm_panel.h     | 14 +++++++++++
>   2 files changed, 57 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index f634371c717a..4e1c4e42575b 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -105,11 +105,22 @@ EXPORT_SYMBOL(drm_panel_remove);
>    */
>   int drm_panel_prepare(struct drm_panel *panel)
>   {
> +	int ret;
> +
>   	if (!panel)
>   		return -EINVAL;
>   
> -	if (panel->funcs && panel->funcs->prepare)
> -		return panel->funcs->prepare(panel);
> +	if (panel->prepared) {
> +		dev_warn(panel->dev, "Skipping prepare of already prepared panel\n");
> +		return 0;
> +	}
> +
> +	if (panel->funcs && panel->funcs->prepare) {
> +		ret = panel->funcs->prepare(panel);
> +		if (ret < 0)
> +			return ret;
> +	}
> +	panel->prepared = true;
>   
>   	return 0;
>   }
> @@ -128,11 +139,22 @@ EXPORT_SYMBOL(drm_panel_prepare);
>    */
>   int drm_panel_unprepare(struct drm_panel *panel)
>   {
> +	int ret;
> +
>   	if (!panel)
>   		return -EINVAL;
>   
> -	if (panel->funcs && panel->funcs->unprepare)
> -		return panel->funcs->unprepare(panel);
> +	if (!panel->prepared) {
> +		dev_warn(panel->dev, "Skipping unprepare of already unprepared panel\n");
> +		return 0;
> +	}
> +
> +	if (panel->funcs && panel->funcs->unprepare) {
> +		ret = panel->funcs->unprepare(panel);
> +		if (ret < 0)
> +			return ret;
> +	}
> +	panel->prepared = false;
>   
>   	return 0;
>   }
> @@ -155,11 +177,17 @@ int drm_panel_enable(struct drm_panel *panel)
>   	if (!panel)
>   		return -EINVAL;
>   
> +	if (panel->enabled) {
> +		dev_warn(panel->dev, "Skipping enable of already enabled panel\n");
> +		return 0;
> +	}
> +
>   	if (panel->funcs && panel->funcs->enable) {
>   		ret = panel->funcs->enable(panel);
>   		if (ret < 0)
>   			return ret;
>   	}
> +	panel->enabled = true;
>   
>   	ret = backlight_enable(panel->backlight);
>   	if (ret < 0)
> @@ -187,13 +215,22 @@ int drm_panel_disable(struct drm_panel *panel)
>   	if (!panel)
>   		return -EINVAL;
>   
> +	if (!panel->enabled) {
> +		dev_warn(panel->dev, "Skipping disable of already disabled panel\n");
> +		return 0;
> +	}
> +
>   	ret = backlight_disable(panel->backlight);
>   	if (ret < 0)
>   		DRM_DEV_INFO(panel->dev, "failed to disable backlight: %d\n",
>   			     ret);
>   
> -	if (panel->funcs && panel->funcs->disable)
> -		return panel->funcs->disable(panel);
> +	if (panel->funcs && panel->funcs->disable) {
> +		ret = panel->funcs->disable(panel);
> +		if (ret < 0)
> +			return ret;
> +	}
> +	panel->enabled = false;
>   
>   	return 0;
>   }
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 432fab2347eb..c6cf75909389 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -198,6 +198,20 @@ struct drm_panel {
>   	 * the panel is powered up.
>   	 */
>   	bool prepare_prev_first;
> +
> +	/**
> +	 * @prepared:
> +	 *
> +	 * If true then the panel has been prepared.
> +	 */
> +	bool prepared;
> +
> +	/**
> +	 * @enabled:
> +	 *
> +	 * If true then the panel has been enabled.
> +	 */
> +	bool enabled;
>   };
>   
>   void drm_panel_init(struct drm_panel *panel, struct device *dev,

LGTM and let's cleanup the panel drivers

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

