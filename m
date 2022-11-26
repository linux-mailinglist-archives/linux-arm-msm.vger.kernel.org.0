Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 544396397D2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Nov 2022 19:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiKZS7g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Nov 2022 13:59:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiKZS73 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Nov 2022 13:59:29 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E751A3B3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 10:59:27 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id c1so11510734lfi.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 10:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCav5Kob/l5LQp5fu9UAEg7SYlJAze6Knt9alnYD50A=;
        b=CsISpwze/NA+ezDBmtIuI8AE4nY8STh+kX9SeoXBsNtUCAWANQpUNRFeozTQp/WFHr
         yrULdLEVKHI94WPlaeo4M3IwRSstEYV8lSaE81o+paTnD8fqxfPvEE6gnVBMdrOkHNUH
         gsp+WMVrm2FACt0d9B1dE/h5NEd1rzTeqoRMD3Q+zORS45ptzVkAyHpwiGD1afzbosph
         ILhw+2zsKlbj+bgMk+vmTPiv5gckVALieiBHx+dCwbElmmm3/uAJXkdkr6/0MHkgi/MY
         rql6kuk4mWYE2HheoBRXEvTpPTUKaw+PIAKUgO+X7/dhVfu/sLNnLARhAEEyULg0z9/Z
         MA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCav5Kob/l5LQp5fu9UAEg7SYlJAze6Knt9alnYD50A=;
        b=EfuHxuMRd9Aen/Wx1VIGXk2a7uNTEBYYtqHftHoZxX4/ZgsgKBPXgaL1yBDoeGLuIg
         B6swU8ngNvfBfHwLOEYmVxOBD1p7PC7gPia0JtRfu1uvRrnpOkuGNKD0VLe4kuXvJcjA
         cvr4A+LbSiALwxONQkrHHxfV9rzM9tcK3elLwov3e0ySLRsdbc+8FRUGYy4YoDzFWYxO
         vdN/6aFgkl+PITaaM+6AtsgCc0oYOO3K22iwpSfcWv+SbCzRLoGcK4KHok4cV3HOy0RB
         L1+jGxbo6lCreY0WRGDr6YPO1bX/JFr5BMiC/xSXPMrlitY8ZPIV8thEAkyVsopU7v5o
         uOIQ==
X-Gm-Message-State: ANoB5pksltQU3hq4OyVRU2EO4CoWn0eQXTWGAd6Vkd4jxhnp7ITSmZ6j
        M+6P29JuQ/zeqTkgbQV7xXgbPw==
X-Google-Smtp-Source: AA0mqf6L8Dp7Yr8aAR8G0BMgMpddYQH/AgN5UUfCJBtzx9TBAFaKSx+2qQmZCkP+yl02tumcsZM/rg==
X-Received: by 2002:a05:6512:3189:b0:4b4:e3bd:6ca0 with SMTP id i9-20020a056512318900b004b4e3bd6ca0mr8236569lfe.278.1669489166313;
        Sat, 26 Nov 2022 10:59:26 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
        by smtp.gmail.com with ESMTPSA id h19-20020a056512055300b0049fbf5facf4sm992956lfl.75.2022.11.26.10.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 10:59:25 -0800 (PST)
Message-ID: <7beb001a-6f29-cb3e-780b-3faaf0669b42@linaro.org>
Date:   Sat, 26 Nov 2022 20:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 12/18] arm64: dts: qcom: msm8996: Add compat
 qcom,msm8996-dsi-ctrl
Content-Language: en-GB
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
        dianders@chromium.org, david@ixit.cz,
        krzysztof.kozlowski+dt@linaro.org, swboyd@chromium.org,
        konrad.dybcio@somainline.org, agross@kernel.org,
        andersson@kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-13-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-13-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/11/2022 14:36, Bryan O'Donoghue wrote:
> Add silicon specific compatible qcom,msm8996-dsi-ctrl to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for msm8996 against the yaml documentation.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

