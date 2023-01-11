Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7FDB665996
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 11:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238972AbjAKK7G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 05:59:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjAKK6A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 05:58:00 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC7C261C
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 02:57:59 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id co23so14635893wrb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 02:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1bHu++PriMdWFMcBuBR3aqfXT5glcLQhC+5F2rrNKXs=;
        b=ExfTUFVFtMeIgD93nR+1RM1ijIUZBzFRIQ7fEBR/TX1fEPCktmQxXNRmJEiSenOpEU
         zrwhYHv2i5DapVSIDic1NZ8w7M7vFd1milXS3nX89rk7qg0v3UV6Y7JKlaC0F+Yhy9bO
         /BlBMF03EhV7W043rhY9r75qIq3TQco5AQKYtnulumZ015NIAyKpKRPiUnr/1Nls7+LE
         rYD0HTjG37Z5RkCBf76YOcDa4lGDFnQoXFwX8l0pniTCvcwVB5XeBvaLGDygtGcZthbd
         u6sBJiqdZIFmuyB/gp3mBC6fbfiv9ybtv4+2H4Cuopokqv8gJzSeim2Ro1cpUxGb0jL5
         ayjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bHu++PriMdWFMcBuBR3aqfXT5glcLQhC+5F2rrNKXs=;
        b=o9cHnvU9bIgVu7WkkZTpU66cUS7j+zOQ4iMZk+AXUkDrwfTqtQHtzbXR6Xsm21MfK8
         6lujbSkND++kRDRPE9mp/3OnC2pJBY8z/HMrBOwOWmZHXvfqepW9jLu+Z2OqBFOtawKt
         XkTazaooZHxhm3hAtIC8P5i21I6xU3T+Urr/2KxUDLNWi7EPm/RJQKy+i4LHX2Z3ORtF
         yC/LbWXVYIlyWX61mvcudz5OMYDLzvfVGQX11NuhasR2mLXNOoyT8RzgPPdBXZOyHaue
         AxLvyPrrtDuTeq9b9csKN9tubAS9A7NdiGSzXXj8Zj3e5Nkksno5W26osLiuNO85c+GI
         /Jhg==
X-Gm-Message-State: AFqh2kqLAn9Ks1DAXgQWVJIWts2CsvnnttwBUyRueNL3ZI/fb1arF4u8
        uHhxNh5How8RDAA5dwAwpgku6Q==
X-Google-Smtp-Source: AMrXdXs1958WUuPt60gzIsmonCNLPjacs/x+kg6Hc3oiEV+bdeKqBDJPC+G/Uo6Ty8Svcx6TZojThw==
X-Received: by 2002:a5d:6a4e:0:b0:2bb:6c90:26a0 with SMTP id t14-20020a5d6a4e000000b002bb6c9026a0mr8973467wrw.43.1673434678125;
        Wed, 11 Jan 2023 02:57:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d95d:43b7:d6a9:39a5? ([2a01:e0a:982:cbb0:d95d:43b7:d6a9:39a5])
        by smtp.gmail.com with ESMTPSA id bj7-20020a0560001e0700b002b6667d3adfsm13450910wrb.80.2023.01.11.02.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 02:57:57 -0800 (PST)
Message-ID: <c03235b1-85d1-1e55-b8c2-9a553887145f@linaro.org>
Date:   Wed, 11 Jan 2023 11:57:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 12/13] drm/bridge: lt9611: stop filtering modes via the
 table
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
 <20230108165656.136871-13-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-13-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/01/2023 17:56, Dmitry Baryshkov wrote:
> The lt9611 bridge can support different modes, it makes no sense to list
> them in the table. Drop the table and check the number of interfaces
> using the fixed value.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 41 +++----------------------
>   1 file changed, 4 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 82af1f954cc6..df9f015aa3a0 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -84,24 +84,6 @@ static const struct regmap_config lt9611_regmap_config = {
>   	.num_ranges = ARRAY_SIZE(lt9611_ranges),
>   };
>   
> -struct lt9611_mode {
> -	u16 hdisplay;
> -	u16 vdisplay;
> -	u8 vrefresh;
> -	u8 lanes;
> -	u8 intfs;
> -};
> -
> -static struct lt9611_mode lt9611_modes[] = {
> -	{ 3840, 2160, 30, 4, 2 }, /* 3840x2160 24bit 30Hz 4Lane 2ports */
> -	{ 1920, 1080, 60, 4, 1 }, /* 1080P 24bit 60Hz 4lane 1port */
> -	{ 1920, 1080, 30, 3, 1 }, /* 1080P 24bit 30Hz 3lane 1port */
> -	{ 1920, 1080, 24, 3, 1 },
> -	{ 720, 480, 60, 4, 1 },
> -	{ 720, 576, 50, 2, 1 },
> -	{ 640, 480, 60, 2, 1 },
> -};
> -
>   static struct lt9611 *bridge_to_lt9611(struct drm_bridge *bridge)
>   {
>   	return container_of(bridge, struct lt9611, bridge);
> @@ -603,21 +585,6 @@ static int lt9611_regulator_enable(struct lt9611 *lt9611)
>   	return 0;
>   }
>   
> -static struct lt9611_mode *lt9611_find_mode(const struct drm_display_mode *mode)
> -{
> -	int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(lt9611_modes); i++) {
> -		if (lt9611_modes[i].hdisplay == mode->hdisplay &&
> -		    lt9611_modes[i].vdisplay == mode->vdisplay &&
> -		    lt9611_modes[i].vrefresh == drm_mode_vrefresh(mode)) {
> -			return &lt9611_modes[i];
> -		}
> -	}
> -
> -	return NULL;
> -}
> -
>   static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
>   {
>   	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> @@ -832,12 +799,12 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
>   						     const struct drm_display_info *info,
>   						     const struct drm_display_mode *mode)
>   {
> -	struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
>   	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>   
> -	if (!lt9611_mode)
> -		return MODE_BAD;
> -	else if (lt9611_mode->intfs > 1 && !lt9611->dsi1)
> +	if (mode->hdisplay >= 3840 && drm_mode_vrefresh(mode) >= 31)

Isn't 31 a typo ?

> +		return MODE_CLOCK_HIGH;
> +
> +	if (mode->hdisplay > 2000 && !lt9611->dsi1_node)
>   		return MODE_PANEL;
>   	else
>   		return MODE_OK;

