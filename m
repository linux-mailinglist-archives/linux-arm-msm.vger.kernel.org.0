Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E29CD76BEAF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Aug 2023 22:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjHAUqa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Aug 2023 16:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjHAUq3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Aug 2023 16:46:29 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E6A1722
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Aug 2023 13:46:28 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fe0d5f719dso10122176e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Aug 2023 13:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690922786; x=1691527586;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hwIy2GnOc/2LywPDL8btrPrYSZ8PryGAqC0unyof2Co=;
        b=lgQhnR0HKAYH7B0ZRy9qk44mmuL5MEmuWDdAdH9zuX+xoKh2LvIeWKz4sO9CVsy6F3
         adxjEsZgxuXcUkRdjAXTb54Dvc/GWeoYbPoL5ELnCkwL1szvgAiwepu06suYbfDRzDwT
         37k4YgOTikAtUkIZuQ1uRytlxvcRl4+/CbKgwRL2turSGUhR0eshVygMRlFRcJWSYomS
         jr4ZnY9ItZxYquVTxiGcRexkdfaF38fyeySXVbARHOVezSIZf35P9Zjrbf34HRXeuJaz
         q7DCFrNxpcUcLyhBzvuUgZnuuzPqfcGeYF6uwxoh7BgaB2ue5+QCcmpa6GWfd7yQUFcf
         zSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690922786; x=1691527586;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hwIy2GnOc/2LywPDL8btrPrYSZ8PryGAqC0unyof2Co=;
        b=b6sxi0oCUl7517TXxoZD+av0R9YnBlLwR4Mw8ASFE9e30FP41MiPYQ9/1PFxbDka0i
         cKUU1Vs9ZFH3UOZzmfPNz2cN/awTNxDZXNnxtHpJ/9T7VYiYfI0SfwiQaMIkDg9M96fx
         fHXID9E3enSENQW6hdGpBKBwYtD2zHtHu1A4sbX5AKp1y3GxgIPJCvUD8doa+2usCJp4
         bxyhwXwxTEScZA3A+VJEPTG/eQIb7IMdBh71RziwkBDdlrhUkhecLBrCmbcfAUwVBKTQ
         3ClYlNskLtjksdPrKC0Qwacm6mpPTcj8vtZLR1YKymuCoKT/H7IMrhw3O+cBBHRSdRj5
         FFUg==
X-Gm-Message-State: ABy/qLYx4Mqnf568QujxJ07NZ4yWG/opo+gjnBRpm3EMleNkiMrnWgIA
        xkbpXzEF1v1+IStetMbvypXEkA==
X-Google-Smtp-Source: APBJJlHUr6o6xTA66AzoLTOVlko3cCP+4Dxng4ed93pGnGUVYkrOuXrrdN/RqSIuJbsNCm7dmpyQCg==
X-Received: by 2002:a05:6512:3711:b0:4fb:bef0:948e with SMTP id z17-20020a056512371100b004fbbef0948emr2785690lfr.5.1690922786202;
        Tue, 01 Aug 2023 13:46:26 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id e6-20020ac25466000000b004fe1f37035csm2272147lfn.224.2023.08.01.13.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 13:46:25 -0700 (PDT)
Message-ID: <45a04ff6-9536-f532-1275-89de07ea6efb@linaro.org>
Date:   Tue, 1 Aug 2023 23:46:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/panel: Enable DSC and CMD mode for Visionox
 VTDR6130 panel
Content-Language: en-GB
To:     Paloma Arellano <quic_parellan@quicinc.com>,
        neil.armstrong@linaro.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     sam@ravnborg.org, airlied@gmail.com, daniel@ffwll.ch,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, marijn.suijten@somainline.org
References: <20230728012623.22991-1-quic_parellan@quicinc.com>
 <CAA8EJpqPgzd4ZSP948MQW=f4EVBHxajj4nwYq5s-OConBP7Vvg@mail.gmail.com>
 <a03e4ec2-0516-7d4c-180f-e0916c83373b@quicinc.com>
 <70875c10-9f9d-a084-d0f0-aaf80f56cb1e@linaro.org>
 <f987a4e2-b461-7dad-c435-3cd10b341c2f@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f987a4e2-b461-7dad-c435-3cd10b341c2f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/08/2023 23:43, Paloma Arellano wrote:
> 
> On 8/1/2023 1:26 AM, neil.armstrong@linaro.org wrote:
>> On 28/07/2023 23:44, Jessica Zhang wrote:
>>>
>>>
>>> On 7/28/2023 2:37 AM, Dmitry Baryshkov wrote:
>>>> On Fri, 28 Jul 2023 at 04:26, Paloma Arellano 
>>>> <quic_parellan@quicinc.com> wrote:
>>>>>
>>>>> Enable display compression (DSC v1.2) and CMD mode for 1080x2400 
>>>>> Visionox
>>>>> VTDR6130 AMOLED DSI panel. In addition, this patch will set the 
>>>>> default
>>>>> to command mode with DSC enabled.
>>>>>
>>>>> Note: This patch has only been validated DSC over command mode as 
>>>>> DSC over
>>>>> video mode has never been validated for the MSM driver before.
>>>>>
>>>>> Depends on: "Add prepare_prev_first flag to Visionox VTDR6130" [1]
>>>>>
>>>>> Changes since v1:
>>>>>   - Changed from email address
>>>>>
>>>>> [1] https://patchwork.freedesktop.org/series/121337/
>>>>>
>>>>> Suggested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>>> ---
>>>>>   .../gpu/drm/panel/panel-visionox-vtdr6130.c   | 77 
>>>>> ++++++++++++++++++-
>>>>>   1 file changed, 73 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c 
>>>>> b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>>>> index e1363e128e7e..5658d39a3a6b 100644
>>>>> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>>>> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>>>> @@ -9,6 +9,7 @@
>>>>>   #include <linux/of.h>
>>>>>
>>>>>   #include <drm/display/drm_dsc.h>
>>>>> +#include <drm/display/drm_dsc_helper.h>
>>>>>   #include <drm/drm_mipi_dsi.h>
>>>>>   #include <drm/drm_modes.h>
>>>>>   #include <drm/drm_panel.h>
>>>>> @@ -20,7 +21,8 @@ struct visionox_vtdr6130 {
>>>>>          struct mipi_dsi_device *dsi;
>>>>>          struct gpio_desc *reset_gpio;
>>>>>          struct regulator_bulk_data supplies[3];
>>>>> -       bool prepared;
>>>>> +       bool prepared, enabled;
>>>>> +       bool video_mode;
>>>>>   };
>>>>>
>>>>>   static inline struct visionox_vtdr6130 
>>>>> *to_visionox_vtdr6130(struct drm_panel *panel)
>>>>> @@ -50,12 +52,18 @@ static int visionox_vtdr6130_on(struct 
>>>>> visionox_vtdr6130 *ctx)
>>>>>          if (ret)
>>>>>                  return ret;
>>>>>
>>>>> +       mipi_dsi_dcs_write_seq(dsi, 0x03, 0x01);
>>>>>          mipi_dsi_dcs_write_seq(dsi, 
>>>>> MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
>>>>>          mipi_dsi_dcs_write_seq(dsi, 
>>>>> MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0x00, 0x00);
>>>>>          mipi_dsi_dcs_write_seq(dsi, 0x59, 0x09);
>>>>>          mipi_dsi_dcs_write_seq(dsi, 0x6c, 0x01);
>>>>>          mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x00);
>>>>> -       mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
>>>>> +
>>>>> +       if (ctx->video_mode)
>>>>> +               mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
>>>>> +       else
>>>>> +               mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x02);
>>>>> +
>>>>>          mipi_dsi_dcs_write_seq(dsi, 0x70,
>>>>>                                 0x12, 0x00, 0x00, 0xab, 0x30, 0x80, 
>>>>> 0x09, 0x60, 0x04,
>>>>>                                 0x38, 0x00, 0x28, 0x02, 0x1c, 0x02, 
>>>>> 0x1c, 0x02, 0x00,
>>>>> @@ -214,6 +222,42 @@ static const struct drm_display_mode 
>>>>> visionox_vtdr6130_mode = {
>>>>>          .height_mm = 157,
>>>>>   };
>>>>>
>>>>> +static int visionox_vtdr6130_enable(struct drm_panel *panel)
>>>>> +{
>>>>> +       struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
>>>>> +       struct mipi_dsi_device *dsi = ctx->dsi;
>>>>> +       struct drm_dsc_picture_parameter_set pps;
>>>>> +       int ret;
>>>>> +
>>>>> +       if (ctx->enabled)
>>>>> +               return 0;
>>>>> +
>>>>> +       if (!dsi->dsc) {
>>>>> +               dev_err(&dsi->dev, "DSC not attached to DSI\n");
>>>>> +               return -ENODEV;
>>>>> +       }
>>>>
>>>> The error message is misleading. Also, if you don't want to enable DSC
>>>> for the video mode, this will break.
>>>>
>>>>> +
>>>>> +       drm_dsc_pps_payload_pack(&pps, dsi->dsc);
>>>>> +       ret = mipi_dsi_picture_parameter_set(dsi, &pps);
>>>>> +       if (ret) {
>>>>> +               dev_err(&dsi->dev, "Failed to set PPS\n");
>>>>> +               return ret;
>>>>> +       }
>>>>> +
>>>>> +       ctx->enabled = true;
>>>>
>>>> Do we need this refcount just for PPS upload? What will happen if PPS
>>>> is uploaded several times?
>>>>
>>>>> +
>>>>> +       return 0;
>>>>> +}
>>>>> +
>>>>> +static int visionox_vtdr6130_disable(struct drm_panel *panel)
>>>>> +{
>>>>> +       struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
>>>>> +
>>>>> +       ctx->enabled = false;
>>>>> +
>>>>> +       return 0;
>>>>> +}
>>>>> +
>>>>>   static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
>>>>>                                         struct drm_connector 
>>>>> *connector)
>>>>>   {
>>>>> @@ -237,6 +281,8 @@ static const struct drm_panel_funcs 
>>>>> visionox_vtdr6130_panel_funcs = {
>>>>>          .prepare = visionox_vtdr6130_prepare,
>>>>>          .unprepare = visionox_vtdr6130_unprepare,
>>>>>          .get_modes = visionox_vtdr6130_get_modes,
>>>>> +       .enable = visionox_vtdr6130_enable,
>>>>> +       .disable = visionox_vtdr6130_disable,
>>>>>   };
>>>>>
>>>>>   static int visionox_vtdr6130_bl_update_status(struct 
>>>>> backlight_device *bl)
>>>>> @@ -269,11 +315,31 @@ static int visionox_vtdr6130_probe(struct 
>>>>> mipi_dsi_device *dsi)
>>>>>   {
>>>>>          struct device *dev = &dsi->dev;
>>>>>          struct visionox_vtdr6130 *ctx;
>>>>> +       struct drm_dsc_config *dsc;
>>>>>          int ret;
>>>>>
>>>>>          ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>>>>          if (!ctx)
>>>>>                  return -ENOMEM;
>>>>> +
>>>>> +       ctx->video_mode = of_property_read_bool(dev->of_node, 
>>>>> "enforce-video-mode");
>>>>
>>>> Please also add a DT bindings patch.
>>>>
>>>>> +
>>>>> +       dsc = devm_kzalloc(dev, sizeof(*dsc), GFP_KERNEL);
>>>>> +       if (!dsc)
>>>>> +               return -ENOMEM;
>>>>
>>>> You can add struct drm_dsc_config to struct visionox_vtdr6130 instead
>>>> of allocating it.
>>>>
>>>>> +
>>>>> +       /* Set DSC params */
>>>>> +       dsc->dsc_version_major = 0x1;
>>>>> +       dsc->dsc_version_minor = 0x2;
>>>>> +
>>>>> +       dsc->slice_height = 40;
>>>>> +       dsc->slice_width = 540;
>>>>> +       dsc->slice_count = 2;
>>>>> +       dsc->bits_per_component = 8;
>>>>> +       dsc->bits_per_pixel = 8 << 4;
>>>>> +       dsc->block_pred_enable = true;
>>>>> +
>>>>> +       dsi->dsc = dsc;
>>>>
>>>> Only in command mode?
>>>
>>> Hi Dmitry,
>>>
>>> The intention of the patch wasn't to enable DSC for only command mode.
>>>
>>> We didn't want to limit DSC to only command mode because, while the 
>>> MSM DPU driver isn't able to validate DSC on video mode, other 
>>> vendors might have already validated DSC on video mode and would 
>>> benefit from this patch.
>>>
>>> FWIW, inital driver commit [1] notes that the panel is meant to work 
>>> with compressed streams in general and DSC support was tob be added 
>>> later on.
>>
>> The panel supports Video, Video+DSC, CMD, CMD+DSC, so it would be 
>> great to be able to
>> select any of the supported modes, including the non-compressed ones.
>>
>> So enforce-video-mode is great, but an enforce-uncompressed-mode would 
>> be necessary
>> aswell.
>>
>> Neil
> 
> Hi Neil,
> 
> Are you suggesting to add a new binding to handle the 
> 'enforce-uncompressed-mode'?

In my opinion: please add new property next to the existing one.

> 
> -Paloma
> 
>>
>>>
>>> Thanks,
>>>
>>> Jessica Zhang
>>>
>>> [1] https://patchwork.freedesktop.org/patch/517483/?series=112369&rev=2
>>>
>>>>
>>>>>
>>>>>          ctx->supplies[0].supply = "vddio";
>>>>>          ctx->supplies[1].supply = "vci";
>>>>> @@ -294,8 +360,11 @@ static int visionox_vtdr6130_probe(struct 
>>>>> mipi_dsi_device *dsi)
>>>>>
>>>>>          dsi->lanes = 4;
>>>>>          dsi->format = MIPI_DSI_FMT_RGB888;
>>>>> -       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | 
>>>>> MIPI_DSI_MODE_NO_EOT_PACKET |
>>>>> -                         MIPI_DSI_CLOCK_NON_CONTINUOUS;
>>>>> +
>>>>> +       dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET | 
>>>>> MIPI_DSI_CLOCK_NON_CONTINUOUS;
>>>>
>>>> Keep the line split please.
>>>>
>>>>> +       if (ctx->video_mode)
>>>>> +               dsi->mode_flags |= MIPI_DSI_MODE_VIDEO;
>>>>> +
>>>>>          ctx->panel.prepare_prev_first = true;
>>>>>
>>>>>          drm_panel_init(&ctx->panel, dev, 
>>>>> &visionox_vtdr6130_panel_funcs,
>>>>> -- 
>>>>> 2.41.0
>>>>>
>>>>
>>>>
>>>> -- 
>>>> With best wishes
>>>> Dmitry
>>

-- 
With best wishes
Dmitry

