Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFC727678E2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 01:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235540AbjG1XV2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 19:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbjG1XV2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 19:21:28 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F65030CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 16:21:26 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9936b3d0286so374541166b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 16:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690586485; x=1691191285;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VU71FgufItpAe9P79uaTKO9H7QH05QlgbBDklotULzo=;
        b=vemgNTR6NtNoy9u+J7GEAdpNdpIFDV05joXBhwXHc/YZ4ADJTx/rf/0i5MgpMjtYFu
         mBmNd5q+tsTdhbNHKpjezbYYP2HEOFRC3W6gYkqhlq4Ww+LnX6Ir2HSnCD/KmSNcxg3U
         ZB2pVlyqpuqoUlHIiegyiXMEfg8N2OpN4SDZiXM+rXDdXI3XPHP9lABGUGMePYEgSH+V
         kE2BDPEvt+QIHduWdXEbmOX5sg7SrcKGJURJFnqyYl7Fp+8j3TdaFUHSlTKIZNE0EHBP
         XZ2dLZY4BZag0pAIOW2/GQ9bqKpt8iKZjCG7j8R+xG9dLPFBEb5t4KswQ+41h+9Dr/Wg
         WzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690586485; x=1691191285;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VU71FgufItpAe9P79uaTKO9H7QH05QlgbBDklotULzo=;
        b=P2kG2Xmj32KlbTiGpnPCQkBURtsi4TVVQY5tenDwuvaGN5cza0IyFKD8KD7QDo7ZNS
         o2Na5UItQVC3OIOWZ5cZBwL4jD7uakQvRnWKQvcmlB1f5xvXKcXDP7P2wje74a7r6/Cj
         DIJFTULfBqv72dzUCyQzr8WaWckOR4U3pBpHb2a0ImBqwHYMuDfiMKA742imoEkPfMlM
         Ps/8FA3XQDcD6cqAWNaT19Y9ZKxBcdhuotGgZJ/zwQhaZpwI/IUCPvsVzvKDaNwHYrj7
         LvMswoR9TCPZQm2LLpBoNAIKZzFrAiwSg0azxmefcStxcK2VvFugWWpJOlLodgNuJH3f
         R7oA==
X-Gm-Message-State: ABy/qLZU97aZuOA8cBAGhetCILXyopOL3fD4F2ADH7+N+wio+gSIJpqq
        46GRQl+kCcueMB2dcsAUgAJnWg==
X-Google-Smtp-Source: APBJJlGZqsd2mYBLFuMjvJCA2YQtko2DmjgMB55M8W3KCCvUboBJ7oPuw3San47k9EUkpJyK44dHCQ==
X-Received: by 2002:a17:906:844b:b0:99b:415f:2e4f with SMTP id e11-20020a170906844b00b0099b415f2e4fmr539179ejy.57.1690586484553;
        Fri, 28 Jul 2023 16:21:24 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm2570119ejc.75.2023.07.28.16.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 16:21:24 -0700 (PDT)
Message-ID: <32b995e7-e418-f442-f976-8247dd66c578@linaro.org>
Date:   Sat, 29 Jul 2023 02:21:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/panel: Enable DSC and CMD mode for Visionox
 VTDR6130 panel
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        Paloma Arellano <quic_parellan@quicinc.com>
Cc:     neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
        daniel@ffwll.ch, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, marijn.suijten@somainline.org
References: <20230728012623.22991-1-quic_parellan@quicinc.com>
 <CAA8EJpqPgzd4ZSP948MQW=f4EVBHxajj4nwYq5s-OConBP7Vvg@mail.gmail.com>
 <a03e4ec2-0516-7d4c-180f-e0916c83373b@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a03e4ec2-0516-7d4c-180f-e0916c83373b@quicinc.com>
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

On 29/07/2023 00:44, Jessica Zhang wrote:
> 
> 
> On 7/28/2023 2:37 AM, Dmitry Baryshkov wrote:
>> On Fri, 28 Jul 2023 at 04:26, Paloma Arellano 
>> <quic_parellan@quicinc.com> wrote:
>>>
>>> Enable display compression (DSC v1.2) and CMD mode for 1080x2400 
>>> Visionox
>>> VTDR6130 AMOLED DSI panel. In addition, this patch will set the default
>>> to command mode with DSC enabled.
>>>
>>> Note: This patch has only been validated DSC over command mode as DSC 
>>> over
>>> video mode has never been validated for the MSM driver before.
>>>
>>> Depends on: "Add prepare_prev_first flag to Visionox VTDR6130" [1]
>>>
>>> Changes since v1:
>>>   - Changed from email address
>>>
>>> [1] https://patchwork.freedesktop.org/series/121337/
>>>
>>> Suggested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>> ---
>>>   .../gpu/drm/panel/panel-visionox-vtdr6130.c   | 77 ++++++++++++++++++-
>>>   1 file changed, 73 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c 
>>> b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>> index e1363e128e7e..5658d39a3a6b 100644
>>> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>> @@ -9,6 +9,7 @@
>>>   #include <linux/of.h>
>>>
>>>   #include <drm/display/drm_dsc.h>
>>> +#include <drm/display/drm_dsc_helper.h>
>>>   #include <drm/drm_mipi_dsi.h>
>>>   #include <drm/drm_modes.h>
>>>   #include <drm/drm_panel.h>
>>> @@ -20,7 +21,8 @@ struct visionox_vtdr6130 {
>>>          struct mipi_dsi_device *dsi;
>>>          struct gpio_desc *reset_gpio;
>>>          struct regulator_bulk_data supplies[3];
>>> -       bool prepared;
>>> +       bool prepared, enabled;
>>> +       bool video_mode;
>>>   };
>>>
>>>   static inline struct visionox_vtdr6130 *to_visionox_vtdr6130(struct 
>>> drm_panel *panel)
>>> @@ -50,12 +52,18 @@ static int visionox_vtdr6130_on(struct 
>>> visionox_vtdr6130 *ctx)
>>>          if (ret)
>>>                  return ret;
>>>
>>> +       mipi_dsi_dcs_write_seq(dsi, 0x03, 0x01);
>>>          mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 
>>> 0x20);
>>>          mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 
>>> 0x00, 0x00);
>>>          mipi_dsi_dcs_write_seq(dsi, 0x59, 0x09);
>>>          mipi_dsi_dcs_write_seq(dsi, 0x6c, 0x01);
>>>          mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x00);
>>> -       mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
>>> +
>>> +       if (ctx->video_mode)
>>> +               mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
>>> +       else
>>> +               mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x02);
>>> +
>>>          mipi_dsi_dcs_write_seq(dsi, 0x70,
>>>                                 0x12, 0x00, 0x00, 0xab, 0x30, 0x80, 
>>> 0x09, 0x60, 0x04,
>>>                                 0x38, 0x00, 0x28, 0x02, 0x1c, 0x02, 
>>> 0x1c, 0x02, 0x00,
>>> @@ -214,6 +222,42 @@ static const struct drm_display_mode 
>>> visionox_vtdr6130_mode = {
>>>          .height_mm = 157,
>>>   };
>>>
>>> +static int visionox_vtdr6130_enable(struct drm_panel *panel)
>>> +{
>>> +       struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
>>> +       struct mipi_dsi_device *dsi = ctx->dsi;
>>> +       struct drm_dsc_picture_parameter_set pps;
>>> +       int ret;
>>> +
>>> +       if (ctx->enabled)
>>> +               return 0;
>>> +
>>> +       if (!dsi->dsc) {
>>> +               dev_err(&dsi->dev, "DSC not attached to DSI\n");
>>> +               return -ENODEV;
>>> +       }
>>
>> The error message is misleading. Also, if you don't want to enable DSC
>> for the video mode, this will break.
>>
>>> +
>>> +       drm_dsc_pps_payload_pack(&pps, dsi->dsc);
>>> +       ret = mipi_dsi_picture_parameter_set(dsi, &pps);
>>> +       if (ret) {
>>> +               dev_err(&dsi->dev, "Failed to set PPS\n");
>>> +               return ret;
>>> +       }
>>> +
>>> +       ctx->enabled = true;
>>
>> Do we need this refcount just for PPS upload? What will happen if PPS
>> is uploaded several times?
>>
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int visionox_vtdr6130_disable(struct drm_panel *panel)
>>> +{
>>> +       struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
>>> +
>>> +       ctx->enabled = false;
>>> +
>>> +       return 0;
>>> +}
>>> +
>>>   static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
>>>                                         struct drm_connector *connector)
>>>   {
>>> @@ -237,6 +281,8 @@ static const struct drm_panel_funcs 
>>> visionox_vtdr6130_panel_funcs = {
>>>          .prepare = visionox_vtdr6130_prepare,
>>>          .unprepare = visionox_vtdr6130_unprepare,
>>>          .get_modes = visionox_vtdr6130_get_modes,
>>> +       .enable = visionox_vtdr6130_enable,
>>> +       .disable = visionox_vtdr6130_disable,
>>>   };
>>>
>>>   static int visionox_vtdr6130_bl_update_status(struct 
>>> backlight_device *bl)
>>> @@ -269,11 +315,31 @@ static int visionox_vtdr6130_probe(struct 
>>> mipi_dsi_device *dsi)
>>>   {
>>>          struct device *dev = &dsi->dev;
>>>          struct visionox_vtdr6130 *ctx;
>>> +       struct drm_dsc_config *dsc;
>>>          int ret;
>>>
>>>          ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>>          if (!ctx)
>>>                  return -ENOMEM;
>>> +
>>> +       ctx->video_mode = of_property_read_bool(dev->of_node, 
>>> "enforce-video-mode");
>>
>> Please also add a DT bindings patch.
>>
>>> +
>>> +       dsc = devm_kzalloc(dev, sizeof(*dsc), GFP_KERNEL);
>>> +       if (!dsc)
>>> +               return -ENOMEM;
>>
>> You can add struct drm_dsc_config to struct visionox_vtdr6130 instead
>> of allocating it.
>>
>>> +
>>> +       /* Set DSC params */
>>> +       dsc->dsc_version_major = 0x1;
>>> +       dsc->dsc_version_minor = 0x2;
>>> +
>>> +       dsc->slice_height = 40;
>>> +       dsc->slice_width = 540;
>>> +       dsc->slice_count = 2;
>>> +       dsc->bits_per_component = 8;
>>> +       dsc->bits_per_pixel = 8 << 4;
>>> +       dsc->block_pred_enable = true;
>>> +
>>> +       dsi->dsc = dsc;
>>
>> Only in command mode?
> 
> Hi Dmitry,
> 
> The intention of the patch wasn't to enable DSC for only command mode.
> 
> We didn't want to limit DSC to only command mode because, while the MSM 
> DPU driver isn't able to validate DSC on video mode, other vendors might 
> have already validated DSC on video mode and would benefit from this patch.
> 
> FWIW, inital driver commit [1] notes that the panel is meant to work 
> with compressed streams in general and DSC support was tob be added 
> later on.

Ack.

> 
> Thanks,
> 
> Jessica Zhang
> 
> [1] https://patchwork.freedesktop.org/patch/517483/?series=112369&rev=2
> 
>>
>>>
>>>          ctx->supplies[0].supply = "vddio";
>>>          ctx->supplies[1].supply = "vci";
>>> @@ -294,8 +360,11 @@ static int visionox_vtdr6130_probe(struct 
>>> mipi_dsi_device *dsi)
>>>
>>>          dsi->lanes = 4;
>>>          dsi->format = MIPI_DSI_FMT_RGB888;
>>> -       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | 
>>> MIPI_DSI_MODE_NO_EOT_PACKET |
>>> -                         MIPI_DSI_CLOCK_NON_CONTINUOUS;
>>> +
>>> +       dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET | 
>>> MIPI_DSI_CLOCK_NON_CONTINUOUS;
>>
>> Keep the line split please.
>>
>>> +       if (ctx->video_mode)
>>> +               dsi->mode_flags |= MIPI_DSI_MODE_VIDEO;
>>> +
>>>          ctx->panel.prepare_prev_first = true;
>>>
>>>          drm_panel_init(&ctx->panel, dev, 
>>> &visionox_vtdr6130_panel_funcs,
>>> -- 
>>> 2.41.0
>>>
>>
>>
>> -- 
>> With best wishes
>> Dmitry

-- 
With best wishes
Dmitry

