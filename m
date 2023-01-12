Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA15D666E4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 10:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235770AbjALJcS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 04:32:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240236AbjALJbZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 04:31:25 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3131A807
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:27:08 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id h16so17433426wrz.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QSEIhlWHvAZaW6UKLsgzkNyGZuKx+U0pt2A72T4kA0U=;
        b=Afz0Kqjc5bY8KuKWMkSI9opBOiopFMcls0+32vim85vpVHHTLweyrp/qRPadFTQWZW
         JpcgKbds88VyEQ+LDEGCT2KiNbfSteQj80WQvmVistaRE7XaiLtPtvmWAKNz245x4JLo
         X0qUiNlMc6bFkowFojklC4+y1+2QupLYXierO4yTq4hA2v0KVFRhGWqlXD4/p75I6gd3
         GK0IQcO205Ea3sT+xAWE0xuqCeje2vogRQ0GcC5pMI1CBkEdckxbXoV73KhwJavuqgfN
         4oo+b3V6mpsjdVExhoFAhfQZTFqrzRGIxvBK+Cr3UkV2i/XkVGxqehGShKV3eoim1qAA
         Iysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSEIhlWHvAZaW6UKLsgzkNyGZuKx+U0pt2A72T4kA0U=;
        b=H+CfiSLqUIjLxOVGwtqywNuG5QNapcBg50+1gQASULTIbMLuYtY7zQFjgBS+ZMM1hk
         LCo7xCwABBK1zn3ny4ITUlF4DrSNTG0aC6yDWeYOAcZ4rubj6r1DxJbm3awE8D7CnR2P
         YsVlIw9rswYKW0NHzehj0+gl4b9UBG1fE9gOa66f8ahrotdTN1/Wa212ryTRA9bsU/0A
         BX51sT3/XhBEnAzBprpy08znX1J7oKguqTzWOhXH2IAXB9Er561jVo1nUJuQspg1YpBH
         xIf9R3esY1L1ZnHAHIuzBiCgd8w9iQtpiN47EopUWlD3ie74PpFhSPS87ASEqBo37DAW
         GpkQ==
X-Gm-Message-State: AFqh2kpY0YwRFUyzfTaCtZNbHNUZDX6zcptj3XmE4KWskN9xq5nK9hwG
        YZyaqY3D3xkCyHWNBpoeI7rwlg==
X-Google-Smtp-Source: AMrXdXuNRsIItkqMfwS//Sj29c/EC9qU8GAYdV+ryEweIF8taUsEbKBh+wtFM3S10VRLabmbl1dO3Q==
X-Received: by 2002:a05:6000:80b:b0:29a:c631:e3ff with SMTP id bt11-20020a056000080b00b0029ac631e3ffmr25588539wrb.53.1673515626801;
        Thu, 12 Jan 2023 01:27:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59? ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d4bc6000000b0027323b19ecesm15852287wrt.16.2023.01.12.01.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 01:27:06 -0800 (PST)
Message-ID: <2e3a1a03-f1b6-e3d2-8565-04cf8c9136c4@linaro.org>
Date:   Thu, 12 Jan 2023 10:27:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 04/13] drm/bridge: lt9611: fix programming of video
 modes
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
 <20230108165656.136871-5-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-5-dmitry.baryshkov@linaro.org>
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
> Program the upper part of the hfront_porch into the proper register.
> 
> Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index deb503ca956a..f377052a45a4 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -187,7 +187,8 @@ static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
>   
>   	regmap_write(lt9611->regmap, 0x8319, (u8)(hfront_porch % 256));
>   
> -	regmap_write(lt9611->regmap, 0x831a, (u8)(hsync_porch / 256));
> +	regmap_write(lt9611->regmap, 0x831a, (u8)(hsync_porch / 256) |
> +						((hfront_porch / 256) << 4));
>   	regmap_write(lt9611->regmap, 0x831b, (u8)(hsync_porch % 256));
>   }
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
