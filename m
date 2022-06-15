Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7C1454C86F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 14:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237898AbiFOMZI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 08:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242176AbiFOMZG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 08:25:06 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F17F63A19D
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 05:25:05 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 20so18616691lfz.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 05:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/XSr+w94TsWPuJS7OSNV5L/UO5RzkyOGJs0L8Cgm8pI=;
        b=YNIiePeBhBSlCbM+N7NA1Bi5YsljgHEOEPoGq1B7/1SAdkUgXFreGq6PfnzEl3wqxh
         Kkx4FSpmTs/8BB8Wwnq0kVcc3o6VaqLI7o67MuYadcXKNuvuwcYkeQWYO2gtd3jH/iZR
         wvGqksekdrBM71Zj549aNs+3UZ8IqBiPmAtvf7HgY/z16qtYmD8zAkmg900n2QJ8ApzN
         git4StvRknLnDjZ3m8SRW62FJ6OeHR7o5TBfsmpw5bMm6J3QSefIIcQZNmntHKuDEPhG
         gSWl30CICQNJF7YmDgYlYRJ9m0YvNEp90Ymt+SEad6K0gv77FQTTwpxGk8vjvqB2GTwA
         79rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/XSr+w94TsWPuJS7OSNV5L/UO5RzkyOGJs0L8Cgm8pI=;
        b=waLiYwqV7uttScqqO4d2/WsX77JvHWD6I2eIYHNevy+Cz68TvGxnomTOy+b2MXSUiq
         4Vg1hrbAS2J/At8b1WDEAYsNwCROy7EjIayEnhJUh86495kEKWaJgUCZSGK02gpscQkP
         rH3Ba0IkL59SNUzAWFmF86xEb5zWJ3U/lOvu+nMgZ+YX4Rb4aC/E4KDojvQeUbmj7JY+
         DHUn3cSS/joTzhL0F+03kHQlbAYVD2CYbjWQ2ueobZ2vwe8+BrbQnjQYUzPLzx7lF3YE
         1FAC19QrfudNRPBVgtUtJRpofE53NdTCT5eGo+GVJ+ZiNP5XQaJrZz3qIE6YhiQ4QQSu
         Q8ug==
X-Gm-Message-State: AJIora9Kh+0tf8nNrzueWkvLAT293YzxG3V3FvBu4HETbwOGHiX/GlOK
        5/ZJUN9kTQZTgtfMsiqybbMwBQ==
X-Google-Smtp-Source: AGRyM1u9YJURgXPk9UCSobnkOQ/l5kCouy20zHlxbyP4uQrLCno47jfZPehZeU6Bpo+5+Y8qTa/FKA==
X-Received: by 2002:a05:6512:10d3:b0:479:732e:d62a with SMTP id k19-20020a05651210d300b00479732ed62amr6277501lfg.319.1655295904361;
        Wed, 15 Jun 2022 05:25:04 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w3-20020a05651c102300b0024f3d1dae87sm1676074ljm.15.2022.06.15.05.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 05:25:03 -0700 (PDT)
Message-ID: <0030792f-464b-307f-6991-bfc7b0badfd5@linaro.org>
Date:   Wed, 15 Jun 2022 15:25:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] dt-bindings: msm: update maintainers list with proper id
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1654286979-11072-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1654286979-11072-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/06/2022 23:09, Kuogee Hsieh wrote:
> Use quic id instead of codeaurora id in maintainers list
> for display devicetree bindings.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

We can pick it through the msm/ tree, if no one objects.

> ---
>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index cd05cfd..c950710 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   title: MSM Display Port Controller
>   
>   maintainers:
> -  - Kuogee Hsieh <khsieh@codeaurora.org>
> +  - Kuogee Hsieh <quic_khsieh@quicinc.com>
>   
>   description: |
>     Device tree bindings for DisplayPort host controller for MSM targets


-- 
With best wishes
Dmitry
