Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED89D666E3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 10:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239209AbjALJaP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 04:30:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240070AbjALJ3I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 04:29:08 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 426A465C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:24:09 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so14497683wms.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Inj/3PggdMPYPA24KawCfZfU7CmEHAqtZxRLX2hdoWI=;
        b=yi4dkWk/iAVpCRfAkllAvewefjlYU+JlQediFjEF8+Kw5VXjyYWDnDj1dri9dwjhXA
         DE69X1eoObMk+X9AHhKd6zRgCgupS4atLus+mQ1ADHQU4pESg9Aenzo1g39F8PBCTiH3
         yI/OBwTlIYyGsUj6GlXuZjjWE7+wJem/afFrYpKvhba840ylsbIwbKvG2n2MvIJTtq21
         qMlLYQRhXcKBcwTSpZDnljNwhrKs+FZBV5CqGVxn2qUGDnQkNU8VPLGGtmdAE6sX/4Ux
         hBplV2XMVaxikRg/SaoUKbWve+KccxPUgSo5vNegYtEHBW7y8q2l80RH0JUfJ9mU9/T9
         8BJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Inj/3PggdMPYPA24KawCfZfU7CmEHAqtZxRLX2hdoWI=;
        b=7CfYUF7wcP2g5xk0TbXYwfnnluEoTopuCe0SSxcEnfnN/2n2y0q8jyVvkXQrE6btMo
         kKxml45h49iPfnQNSdglR/2qjrAJP5xg/L6RFfl56+5VdgLbTM7Qnreqg2SK/9UH+UCM
         lC/T/ILAZtC0JubNa+qnXmC+p8k8BKatoxn9LrCtaQFe/98wKkSzp66mPUGxUiLrgJjQ
         jID045BgRrOmeaLQo2TS53u79GY2s4k1PwmePYyc97CcSgCybUa9dcJsEx9yabfM1B43
         yViA8ZnUB4bFLhEqBCx7fGubv+wKRu0by1uhgR/WxhVbDGnZGXO4lONgcfqDqJZYZICs
         EPzA==
X-Gm-Message-State: AFqh2kqCcSrFzXI9G416mWHoLV5qZUB4GmhorSbQT72wwDAP+KwBxE+8
        xrXwg4L8Pin30QFAj8yHJyqFDA==
X-Google-Smtp-Source: AMrXdXu4Cn2SfMYp75y3XbTCBX5viFqdISRSjsdfTQoV36ZSgWzi0CXykjz590HbUZMKW0YVNEZAqQ==
X-Received: by 2002:a05:600c:4a9b:b0:3d1:dc6f:b1a4 with SMTP id b27-20020a05600c4a9b00b003d1dc6fb1a4mr65376450wmp.5.1673515447761;
        Thu, 12 Jan 2023 01:24:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59? ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c458700b003d974076f13sm22549818wmo.3.2023.01.12.01.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 01:24:07 -0800 (PST)
Message-ID: <5e58a091-525b-7678-a0e8-1a7ab39d0d18@linaro.org>
Date:   Thu, 12 Jan 2023 10:24:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 01/13] drm/bridge: lt9611: fix sleep mode setup
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
 <20230108165656.136871-2-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-2-dmitry.baryshkov@linaro.org>
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
> On atomic_post_disable the bridge goes to the low power state. However
> the code disables too much of the chip, so the HPD event is not being
> detected and delivered to the host. Reduce the power saving in order to
> get the HPD event.
> 
> Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 7c0a99173b39..2714184cc53f 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -448,12 +448,11 @@ static void lt9611_sleep_setup(struct lt9611 *lt9611)
>   		{ 0x8023, 0x01 },
>   		{ 0x8157, 0x03 }, /* set addr pin as output */
>   		{ 0x8149, 0x0b },
> -		{ 0x8151, 0x30 }, /* disable IRQ */
> +
>   		{ 0x8102, 0x48 }, /* MIPI Rx power down */
>   		{ 0x8123, 0x80 },
>   		{ 0x8130, 0x00 },
> -		{ 0x8100, 0x01 }, /* bandgap power down */
> -		{ 0x8101, 0x00 }, /* system clk power down */
> +		{ 0x8011, 0x0a },
>   	};
>   
>   	regmap_multi_reg_write(lt9611->regmap,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
