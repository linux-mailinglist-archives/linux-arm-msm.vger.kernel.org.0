Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 966C4666E51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 10:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbjALJeI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 04:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234198AbjALJdX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 04:33:23 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E038D7D
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:28:21 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id ay40so12742434wmb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JRZRjEu1pE5Y/wwtc5wTOz4itfr1PkmaVv37jbh6BkY=;
        b=x9N/ee53MHq6HHAiVpzchn4/TqinDg5+T+T5vfMNYYMuYocrNk7ADcRb0epnDH9VF2
         irz0MK6PE24lSUCYAYQAgVAVzlmukR/ZyFLwV/Vk6Cgd8nEAH0RDRkJ5ArbKS9tedzB8
         mDa1r2EWZXR7ItoWpxk7X+7/F/GPR7Xz3+ar5VMrm4pNmwpRJoh54qAJWwss66BR5TxE
         eSuZKGW3Mr7cAgC5GNS7AOJY8msXc5vDt+1H7u+1YhpGCiv+aVvNg6ap2p8+CpapBVl4
         QhhOq//izWA5HE7N76vHxbFzgqefl2il7EI2nSPzOIm29RTuujZM0xBHQEZDoGxE75eB
         1sPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRZRjEu1pE5Y/wwtc5wTOz4itfr1PkmaVv37jbh6BkY=;
        b=QJQGaPr6uD/1Pn1X9EamHHf5SRc56ZJUxQ6WuQZV/9dUzAEpMjR3bLWWIjzLJe3qtc
         qyxxcG+tiKbtbc04Mu9OeSEVaxcAEPW5M2KsS2hcE+5whRgsI9P7SZoiGVKhKy1B/r7T
         WQ/ibU6u5hKkt6GI21aBDjY8q/kkrwxe+8ZyMmHjg1Ot/a7pDjlT39z+x7jYcpMyv9LY
         V7FUTXYI1VGryQwu1c9FCd3Gr8BNB5L1gUxb/BLjFNUBdBQZiXTuXdkK/2PImIulhJPI
         rPL7enfCXenFWx1GTyx+G1qGyXpzcC+5EHZCcfKc3PO8mlymqi1MNJhaMgH9MwpA4TYl
         7F8Q==
X-Gm-Message-State: AFqh2kqBhfx57fj2ZbtW9N0HmN9DXW7cSY9moYk1ixGsFJHkSwy8JsRJ
        /Dk7BXwwns/BFAaLmK7C8k5dnA==
X-Google-Smtp-Source: AMrXdXs8uCORT1YVfkne28kP/fvij2VS4nzKgHDu8KNp0oXuc/UH9+8oJfbMwtBqJOpn3lS/ZO8T3g==
X-Received: by 2002:a05:600c:8507:b0:3d9:6c7d:c9ee with SMTP id gw7-20020a05600c850700b003d96c7dc9eemr50235886wmb.25.1673515700279;
        Thu, 12 Jan 2023 01:28:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59? ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
        by smtp.gmail.com with ESMTPSA id l14-20020a05600c4f0e00b003d96c811d6dsm28002826wmq.30.2023.01.12.01.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 01:28:19 -0800 (PST)
Message-ID: <e86d7583-a6f7-7dbb-b6d4-091fc55ee599@linaro.org>
Date:   Thu, 12 Jan 2023 10:28:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 06/13] drm/bridge: lt9611: pass a pointer to the of
 node
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
 <20230108165656.136871-7-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-7-dmitry.baryshkov@linaro.org>
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
> Pass a pointer to the OF node while registering lt9611 MIPI device.
> 
> Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index e2799a0df8f8..3b77238ca4af 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -769,7 +769,7 @@ static const struct drm_connector_funcs lt9611_bridge_connector_funcs = {
>   static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
>   						 struct device_node *dsi_node)
>   {
> -	const struct mipi_dsi_device_info info = { "lt9611", 0, NULL };
> +	const struct mipi_dsi_device_info info = { "lt9611", 0, lt9611->dev->of_node};
>   	struct mipi_dsi_device *dsi;
>   	struct mipi_dsi_host *host;
>   	struct device *dev = lt9611->dev;


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
