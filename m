Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1B8A76C7C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 10:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbjHBIBO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 04:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbjHBIBO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 04:01:14 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF2B1FCB
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 01:00:59 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31763b2c5a4so6539474f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 01:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690963257; x=1691568057;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IRWrqMoPbC5Gq9IPJmmVqJmMYnpJa8qQKC08DMTsdOE=;
        b=DUR/wfbDVi9M+sD4om4DGrIHwfrsrlniGIy24ayzDZpr5z+Xq0TAI1ALsq3qisxOZ8
         XvL2OewxktNd7lmZGWs/ceF4ihLLRP1gH+3f0Nktst73BuhXY7dFNJkgeeIWc60earFZ
         UBsCrbGFttdsCeHGUffVI4CMerBV9YqZTLD8RzinqGeSFoPLUtKRYDE/kYKkdSN0+05L
         Tj353p8PUfZ9bLczdPVINqYUog104HaCWRV7vz3hsLdawNonOs/E1BSWZ3XFW2KNNMNf
         8YJ7cSsqyA0a6AU2XvTK11T9/eH2aURC9CGFAuhp6DyztfZ9IZYRneJR+97a6/D6GQ0R
         ZBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690963257; x=1691568057;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRWrqMoPbC5Gq9IPJmmVqJmMYnpJa8qQKC08DMTsdOE=;
        b=kDTBzu2VaJ7rLOq2w2DsLiPHJZnLK6WBRLUj+tOedL13OlnliOq1TUtHmO7ePw/6Ov
         WTZofuuNPjT4jcEYBoX01s4gkTzhkSn/uUGQ3NZSLE4J1reCFB35uCXohwLiTdAQubqv
         QsXIKtqBTNCUGyRMriEmAzsZLuwmmHupyfq8gQKXndHJsTlMiVBQIjQN7bXmB2PFkpOJ
         WhhDbEtyceEjZWbeExZN+vdRKKp1Mp0AChPrvz1jIwID4ecyvEoNIKARf52MXX/mVHqp
         +EbQXCFb6AP+UjDamg5naOuGIcuYylJfBI0lkTrU7JMp+Ws5SPzTwRidun3XAF8C7WDa
         Ca0w==
X-Gm-Message-State: ABy/qLZjUURNGd4rfaF8V4rV00SOySgqsGlf0A9ZpewXcRHHyXSNVpUn
        g8DlECKXnXj3Re05Pw9w80GA1w==
X-Google-Smtp-Source: APBJJlFs64o6rzhfDD3phIHAep3jIAbOtkkSS5Akc1mDRUKaO5vmp9lQw9nbjM/oAL7ZzewRvpQz2w==
X-Received: by 2002:a5d:6a82:0:b0:317:5ba8:ac6 with SMTP id s2-20020a5d6a82000000b003175ba80ac6mr4038804wru.8.1690963257050;
        Wed, 02 Aug 2023 01:00:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196? ([2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196])
        by smtp.gmail.com with ESMTPSA id u6-20020a05600c210600b003fbbe41fd78sm997487wml.10.2023.08.02.01.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 01:00:56 -0700 (PDT)
Message-ID: <6fb85a06-4abc-2433-4d61-2102f279e635@linaro.org>
Date:   Wed, 2 Aug 2023 10:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/panel: Enable DSC and CMD mode for Visionox
 VTDR6130 panel
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Paloma Arellano <quic_parellan@quicinc.com>,
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
 <45a04ff6-9536-f532-1275-89de07ea6efb@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <45a04ff6-9536-f532-1275-89de07ea6efb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/08/2023 22:46, Dmitry Baryshkov wrote:
> On 01/08/2023 23:43, Paloma Arellano wrote:
>>
>> On 8/1/2023 1:26 AM, neil.armstrong@linaro.org wrote:
>>> On 28/07/2023 23:44, Jessica Zhang wrote:
>>>>
>>>>
>>>> On 7/28/2023 2:37 AM, Dmitry Baryshkov wrote:
>>>>> On Fri, 28 Jul 2023 at 04:26, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>>>>>
>>>>>> Enable display compression (DSC v1.2) and CMD mode for 1080x2400 Visionox
>>>>>> VTDR6130 AMOLED DSI panel. In addition, this patch will set the default
>>>>>> to command mode with DSC enabled.
>>>>>>
>>>>>> Note: This patch has only been validated DSC over command mode as DSC over
>>>>>> video mode has never been validated for the MSM driver before.
>>>>>>
>>>>>> Depends on: "Add prepare_prev_first flag to Visionox VTDR6130" [1]
>>>>>>
>>>>>> Changes since v1:
>>>>>>   - Changed from email address
>>>>>>
>>>>>> [1] https://patchwork.freedesktop.org/series/121337/
>>>>>>
>>>>>> Suggested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>>>> ---
>>>>>>   .../gpu/drm/panel/panel-visionox-vtdr6130.c   | 77 ++++++++++++++++++-
>>>>>>   1 file changed, 73 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>>>>> index e1363e128e7e..5658d39a3a6b 100644
>>>>>> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>>>>> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>>>>> @@ -9,6 +9,7 @@
>>>>>>   #include <linux/of.h>
>>>>>>
>>>>>>   #include <drm/display/drm_dsc.h>
>>>>>> +#include <drm/display/drm_dsc_helper.h>
>>>>>>   #include <drm/drm_mipi_dsi.h>
>>>>>>   #include <drm/drm_modes.h>
>>>>>>   #include <drm/drm_panel.h>
>>>>>> @@ -20,7 +21,8 @@ struct visionox_vtdr6130 {
>>>>>>          struct mipi_dsi_device *dsi;
>>>>>>          struct gpio_desc *reset_gpio;
>>>>>>          struct regulator_bulk_data supplies[3];
>>>>>> -       bool prepared;
>>>>>> +       bool prepared, enabled;
>>>>>> +       bool video_mode;
>>>>>>   };
>>>>>>
>>>>>>   static inline struct visionox_vtdr6130 *to_visionox_vtdr6130(struct drm_panel *panel)
>>>>>> @@ -50,12 +52,18 @@ static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
>>>>>>          if (ret)
>>>>>>                  return ret;
>>>>>>
>>>>>> +       mipi_dsi_dcs_write_seq(dsi, 0x03, 0x01);
>>>>>>          mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
>>>>>>          mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0x00, 0x00);
>>>>>>          mipi_dsi_dcs_write_seq(dsi, 0x59, 0x09);
>>>>>>          mipi_dsi_dcs_write_seq(dsi, 0x6c, 0x01);
>>>>>>          mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x00);
>>>>>> -       mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
>>>>>> +
>>>>>> +       if (ctx->video_mode)
>>>>>> +               mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
>>>>>> +       else
>>>>>> +               mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x02);
>>>>>> +
>>>>>>          mipi_dsi_dcs_write_seq(dsi, 0x70,
>>>>>>                                 0x12, 0x00, 0x00, 0xab, 0x30, 0x80, 0x09, 0x60, 0x04,
>>>>>>                                 0x38, 0x00, 0x28, 0x02, 0x1c, 0x02, 0x1c, 0x02, 0x00,
>>>>>> @@ -214,6 +222,42 @@ static const struct drm_display_mode visionox_vtdr6130_mode = {
>>>>>>          .height_mm = 157,
>>>>>>   };
>>>>>>
>>>>>> +static int visionox_vtdr6130_enable(struct drm_panel *panel)
>>>>>> +{
>>>>>> +       struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
>>>>>> +       struct mipi_dsi_device *dsi = ctx->dsi;
>>>>>> +       struct drm_dsc_picture_parameter_set pps;
>>>>>> +       int ret;
>>>>>> +
>>>>>> +       if (ctx->enabled)
>>>>>> +               return 0;
>>>>>> +
>>>>>> +       if (!dsi->dsc) {
>>>>>> +               dev_err(&dsi->dev, "DSC not attached to DSI\n");
>>>>>> +               return -ENODEV;
>>>>>> +       }
>>>>>
>>>>> The error message is misleading. Also, if you don't want to enable DSC
>>>>> for the video mode, this will break.
>>>>>
>>>>>> +
>>>>>> +       drm_dsc_pps_payload_pack(&pps, dsi->dsc);
>>>>>> +       ret = mipi_dsi_picture_parameter_set(dsi, &pps);
>>>>>> +       if (ret) {
>>>>>> +               dev_err(&dsi->dev, "Failed to set PPS\n");
>>>>>> +               return ret;
>>>>>> +       }
>>>>>> +
>>>>>> +       ctx->enabled = true;
>>>>>
>>>>> Do we need this refcount just for PPS upload? What will happen if PPS
>>>>> is uploaded several times?
>>>>>
>>>>>> +
>>>>>> +       return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int visionox_vtdr6130_disable(struct drm_panel *panel)
>>>>>> +{
>>>>>> +       struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
>>>>>> +
>>>>>> +       ctx->enabled = false;
>>>>>> +
>>>>>> +       return 0;
>>>>>> +}
>>>>>> +
>>>>>>   static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
>>>>>>                                         struct drm_connector *connector)
>>>>>>   {
>>>>>> @@ -237,6 +281,8 @@ static const struct drm_panel_funcs visionox_vtdr6130_panel_funcs = {
>>>>>>          .prepare = visionox_vtdr6130_prepare,
>>>>>>          .unprepare = visionox_vtdr6130_unprepare,
>>>>>>          .get_modes = visionox_vtdr6130_get_modes,
>>>>>> +       .enable = visionox_vtdr6130_enable,
>>>>>> +       .disable = visionox_vtdr6130_disable,
>>>>>>   };
>>>>>>
>>>>>>   static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
>>>>>> @@ -269,11 +315,31 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>>>>>>   {
>>>>>>          struct device *dev = &dsi->dev;
>>>>>>          struct visionox_vtdr6130 *ctx;
>>>>>> +       struct drm_dsc_config *dsc;
>>>>>>          int ret;
>>>>>>
>>>>>>          ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>>>>>          if (!ctx)
>>>>>>                  return -ENOMEM;
>>>>>> +
>>>>>> +       ctx->video_mode = of_property_read_bool(dev->of_node, "enforce-video-mode");
>>>>>
>>>>> Please also add a DT bindings patch.
>>>>>
>>>>>> +
>>>>>> +       dsc = devm_kzalloc(dev, sizeof(*dsc), GFP_KERNEL);
>>>>>> +       if (!dsc)
>>>>>> +               return -ENOMEM;
>>>>>
>>>>> You can add struct drm_dsc_config to struct visionox_vtdr6130 instead
>>>>> of allocating it.
>>>>>
>>>>>> +
>>>>>> +       /* Set DSC params */
>>>>>> +       dsc->dsc_version_major = 0x1;
>>>>>> +       dsc->dsc_version_minor = 0x2;
>>>>>> +
>>>>>> +       dsc->slice_height = 40;
>>>>>> +       dsc->slice_width = 540;
>>>>>> +       dsc->slice_count = 2;
>>>>>> +       dsc->bits_per_component = 8;
>>>>>> +       dsc->bits_per_pixel = 8 << 4;
>>>>>> +       dsc->block_pred_enable = true;
>>>>>> +
>>>>>> +       dsi->dsc = dsc;
>>>>>
>>>>> Only in command mode?
>>>>
>>>> Hi Dmitry,
>>>>
>>>> The intention of the patch wasn't to enable DSC for only command mode.
>>>>
>>>> We didn't want to limit DSC to only command mode because, while the MSM DPU driver isn't able to validate DSC on video mode, other vendors might have already validated DSC on video mode and would benefit from this patch.
>>>>
>>>> FWIW, inital driver commit [1] notes that the panel is meant to work with compressed streams in general and DSC support was tob be added later on.
>>>
>>> The panel supports Video, Video+DSC, CMD, CMD+DSC, so it would be great to be able to
>>> select any of the supported modes, including the non-compressed ones.
>>>
>>> So enforce-video-mode is great, but an enforce-uncompressed-mode would be necessary
>>> aswell.
>>>
>>> Neil
>>
>> Hi Neil,
>>
>> Are you suggesting to add a new binding to handle the 'enforce-uncompressed-mode'?
> 
> In my opinion: please add new property next to the existing one.

Yes please

Thanks,
Neil

> 
>>
>> -Paloma
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>> Jessica Zhang
>>>>
>>>> [1] https://patchwork.freedesktop.org/patch/517483/?series=112369&rev=2
>>>>
>>>>>
>>>>>>
>>>>>>          ctx->supplies[0].supply = "vddio";
>>>>>>          ctx->supplies[1].supply = "vci";
>>>>>> @@ -294,8 +360,11 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>>>>>>
>>>>>>          dsi->lanes = 4;
>>>>>>          dsi->format = MIPI_DSI_FMT_RGB888;
>>>>>> -       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
>>>>>> -                         MIPI_DSI_CLOCK_NON_CONTINUOUS;
>>>>>> +
>>>>>> +       dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_CLOCK_NON_CONTINUOUS;
>>>>>
>>>>> Keep the line split please.
>>>>>
>>>>>> +       if (ctx->video_mode)
>>>>>> +               dsi->mode_flags |= MIPI_DSI_MODE_VIDEO;
>>>>>> +
>>>>>>          ctx->panel.prepare_prev_first = true;
>>>>>>
>>>>>>          drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,
>>>>>> -- 
>>>>>> 2.41.0
>>>>>>
>>>>>
>>>>>
>>>>> -- 
>>>>> With best wishes
>>>>> Dmitry
>>>
> 

