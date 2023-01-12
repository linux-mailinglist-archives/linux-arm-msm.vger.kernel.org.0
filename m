Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4250666E40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 10:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbjALJa0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 04:30:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240154AbjALJ3T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 04:29:19 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C574FB7D1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:24:32 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id k8so2937887wrc.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8y93oKqpxvzE8rWdKpZl4lXsP+t5rguSGLhBVaBJc0g=;
        b=WThEKA9gNJkYP7HmfQRADIQADz/supXgAp8M0Ch0b6QgcTSLJkoTNqCmwTRX5X0SFi
         kWLSC9p7vL1U7COb9FN0upXxHQvW1YaHNZG0Rm/3K39kC1FmfT++a58cAQvSdEXcOz3l
         byKBbuHvDH/zGgVyrfqHwjMAtcMbF8MIWinhnfGRb2gx20+ScqjVIky1aQL1mQvrHKfk
         dFNmAr/uC27SuThkEmoqIE7eIvkZn1E8UBGpko8Y80IroOFuTCCC87rbaRDFOT/BvHoa
         0rZIGLbPgWEAI6r3Uj7Y/KSbN5KKovXNJeU+KSlU6IYGe6Se5dvi9Il2t9xC8MMw+al1
         SFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8y93oKqpxvzE8rWdKpZl4lXsP+t5rguSGLhBVaBJc0g=;
        b=fIAQzIsiCWm9y52JrFs310Qw9j1HJfxfO7MkaJWKsbxryev/sXsUO+/+FHWPmMWOEA
         Jf8Qyaprg4GgRBCkMCGGXfCm1QirANP6KIz6F0D6qavOQ4wZPA+twIyXb8j+P6F0hCsB
         1/wwF90x7fBkbfOU23+rmz53pWX0+TfwxpSKzMLgFRezxS+3vqQLoCWzco49nQCrJ9GF
         vumi7lb2PntBnRoSy77iu1XbMX8a4a+0ypEiUXxS0OhGyEgL7siiFHsXwM3cCxPejGve
         Iy+RlBiReL/DVpSC5TnbDkOab1DXkFvSak6oGfP3JfZPpc8SkzpabL+S6HjrZ3RxUubU
         9cKA==
X-Gm-Message-State: AFqh2krE80GIYoycRjlZIA6XvrxGQQ4uBFeEPLFrDasrCuivWcgNiVIz
        Djps6LlOfSeVwBwM3NRDnnyhZQ==
X-Google-Smtp-Source: AMrXdXuXd7dZBWw2m7FDxQZJt+AcbAClVVx1WZ3nCqqtcl5YstgfIvERZe4/zGu+w87qgXyMfElBYw==
X-Received: by 2002:a05:6000:54a:b0:2bd:6490:8c5f with SMTP id b10-20020a056000054a00b002bd64908c5fmr6062877wrf.23.1673515471297;
        Thu, 12 Jan 2023 01:24:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59? ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
        by smtp.gmail.com with ESMTPSA id x2-20020adff642000000b002a01e64f7a1sm16255730wrp.88.2023.01.12.01.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 01:24:30 -0800 (PST)
Message-ID: <ed9eb076-7a81-8892-a509-9105cbc3c128@linaro.org>
Date:   Thu, 12 Jan 2023 10:24:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 02/13] drm/bridge: lt9611: fix HPD reenablement
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
 <20230108165656.136871-3-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-3-dmitry.baryshkov@linaro.org>
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
> The driver will reset the bridge in the atomic_pre_enable(). However
> this will also drop the HPD interrupt state. Instead of resetting the
> bridge, properly wake it up. This fixes the HPD interrupt delivery after
> the disable/enable cycle.
> 
> Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 2714184cc53f..58f39b279217 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -856,12 +856,18 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
>   static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
>   {
>   	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> +	static const struct reg_sequence reg_cfg[] = {
> +		{ 0x8102, 0x12 },
> +		{ 0x8123, 0x40 },
> +		{ 0x8130, 0xea },
> +		{ 0x8011, 0xfa },
> +	};
>   
>   	if (!lt9611->sleep)
>   		return;
>   
> -	lt9611_reset(lt9611);
> -	regmap_write(lt9611->regmap, 0x80ee, 0x01);
> +	regmap_multi_reg_write(lt9611->regmap,
> +			       reg_cfg, ARRAY_SIZE(reg_cfg));
>   
>   	lt9611->sleep = false;
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
