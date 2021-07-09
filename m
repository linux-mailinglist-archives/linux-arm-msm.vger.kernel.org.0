Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7419B3C2B35
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 00:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbhGIWQW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 18:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhGIWQV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 18:16:21 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AADB1C0613DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 15:13:37 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id v14so26173145lfb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 15:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cyu46Nc7pDH2wC0w7fNEd1R3CotJ59G89/FxqesF7Cc=;
        b=fpKEGEt7b7OfdEodD2X7/mx8U9zb9I+rQCUXwrWMpDxSvsS8UlEu+4lR6v8cdCQPl5
         oeXQZWk/ICbHqLvdE0SdJdoaSsEOl5NEJVNt2KG9kfIRgCnsFAYL7dJ7ZAwpMKo3fG/X
         /ZQGkWV1bP0cZh+fs+ROK8TA+idP0J91YdYkpGpiyDbhjJKpCMUxLItCZ5NYUlnIfOKA
         ax8hI1+/eGdX8j/SCTQrgNGc342n5LxZfRHjn/N7yU7miq8AOcQcNtTJkJ8tdzitYalB
         WLP9NtJvw1LHmBwZdga8+WDaUUEiqW4Gm1bTQozdBST2kjjVSRhqH4Op9q6liYse7S2j
         1FUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cyu46Nc7pDH2wC0w7fNEd1R3CotJ59G89/FxqesF7Cc=;
        b=U6jyuOb7RiXDayZq5lPLkP1KJZm9hyxZQizlJNadjbNc0oc6WfWmGoLjUP9zSI5/Ee
         0bVtvxBfvvN5kbdiLxrTHLWyPNR2kn+bL6IAPcQGEvyhm1lCOrizZA9cZNbEoKWNgL/M
         BUXL9CgiMsLwtnk7FLsDzgGGvFNzfNhlf2n3LFxaoFFchXwOgIC2aUKUhat6pUbvPGrM
         0Gnxy1JWu49UWTUbFdWBTFYYYFboo2XtGM0mG3m/mpMZpTvZh2JAsAfuv7Z+onCshbam
         jApKm0DyLInW3mlPLYgn/4KKAypu/OcnETDPYZBcckaSI1/A1y9J0olt2twWq7Gb+hOx
         sXtA==
X-Gm-Message-State: AOAM530KJTk5PGCJWs2o3qySDufm+WtoJyCtouPf2objodIJzCiBmXdR
        2CDFjEw2NVNqPaMrsKVWu/AJYQ==
X-Google-Smtp-Source: ABdhPJzk1Vjp1SlXY6p3zNbVzy8OiJM48XqE1AF07rKVGeyL+mYX8CZ38OvicPzCZ8/Sw5c9vMYuLQ==
X-Received: by 2002:a05:6512:1393:: with SMTP id p19mr29684837lfa.570.1625868815881;
        Fri, 09 Jul 2021 15:13:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a18sm556400lfj.308.2021.07.09.15.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jul 2021 15:13:35 -0700 (PDT)
Subject: Re: [Freedreno] [PATCH v1 3/7] drm/msm/dpu: support setting up two
 independent DSI connectors
To:     abhinavk@codeaurora.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
 <20210708122833.363451-4-dmitry.baryshkov@linaro.org>
 <72d95728559ef617a3dc29621cc5a2b5@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <99575650-837b-7f2d-eb73-7f51f32a6623@linaro.org>
Date:   Sat, 10 Jul 2021 01:13:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <72d95728559ef617a3dc29621cc5a2b5@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/07/2021 01:09, abhinavk@codeaurora.org wrote:
> On 2021-07-08 05:28, Dmitry Baryshkov wrote:
>> Move setting up encoders from set_encoder_mode to
>> _dpu_kms_initialize_dsi() / _dpu_kms_initialize_displayport(). This
>> allows us to support not only "single DSI" and "bonded DSI" but also "two
>> independent DSI" configurations. In future this would also help adding
>> support for multiple DP connectors.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 102 +++++++++++++-----------
>>  1 file changed, 57 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 1d3a4f395e74..8459da36174e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -471,30 +471,68 @@ static int _dpu_kms_initialize_dsi(struct 
>> drm_device *dev,
>>                      struct dpu_kms *dpu_kms)
>>  {
>>      struct drm_encoder *encoder = NULL;
>> +    struct msm_display_info info;
>>      int i, rc = 0;
>>
>>      if (!(priv->dsi[0] || priv->dsi[1]))
>>          return rc;
>>
>> -    /*TODO: Support two independent DSI connectors */
>> -    encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
>> -    if (IS_ERR(encoder)) {
>> -        DPU_ERROR("encoder init failed for dsi display\n");
>> -        return PTR_ERR(encoder);
>> -    }
>> -
>> -    priv->encoders[priv->num_encoders++] = encoder;
>> -
>> +    /*
>> +     * We support following confiurations:
>> +     * - Single DSI host (dsi0 or dsi1)
>> +     * - Two independent DSI hosts
>> +     * - Bonded DSI0 and DSI1 hosts
>> +     *
>> +     *   TODO: Support swapping DSI0 and DSI1 in the bonded setup.
>> +     */
>>      for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>>          if (!priv->dsi[i])
>>              continue;
>>
>> +        if (!encoder) {
>> +            encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
>> +            if (IS_ERR(encoder)) {
>> +                DPU_ERROR("encoder init failed for dsi display\n");
>> +                return PTR_ERR(encoder);
>> +            }
>> +
>> +            priv->encoders[priv->num_encoders++] = encoder;
>> +
>> +            memset(&info, 0, sizeof(info));
>> +            info.intf_type = encoder->encoder_type;
>> +            info.capabilities = msm_dsi_is_cmd_mode(priv->dsi[i]) ?
>> +                MSM_DISPLAY_CAP_CMD_MODE :
>> +                MSM_DISPLAY_CAP_VID_MODE;
>> +        }
>> +
>>          rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
>>          if (rc) {
>>              DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
>>                  i, rc);
>>              break;
>>          }
>> +
>> +        info.h_tile_instance[info.num_of_h_tiles++] = i;
>> +
>> +        /* Register non-bonded encoder here. If the encoder is bonded,
>> +         * it will be registered later, when both DSI hosts are
>> +         * initialized.
>> +         */
>> +        if (!msm_dsi_is_bonded_dsi(priv->dsi[i])) {
>> +            rc = dpu_encoder_setup(dev, encoder, &info);
>> +            if (rc)
>> +                DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>> +                      encoder->base.id, rc);
>> +            encoder = NULL;
> Seems like you are using encoder = NULL as a check to distinguish 
> whether this is bonded mode or not.

Whether the encoder war setup or not.

>> +        }
>> +    }
>> +
>> +    /* Register bonded encoder here, when both DSI hosts are 
>> initialized */
>> +    if (encoder) {
> Why cant we replace this with if (msm_dsi_is_bonded_dsi(priv->dsi[i]) 
> and get rid
> of the encoder = NULL?

I can. Maybe I should rewrite this to clearly handle bonded mode.

>> +        rc = dpu_encoder_setup(dev, encoder, &info);
>> +        if (rc)
>> +            DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>> +                  encoder->base.id, rc);
>>      }
>>
>>      return rc;
>> @@ -505,6 +543,7 @@ static int _dpu_kms_initialize_displayport(struct
>> drm_device *dev,
>>                          struct dpu_kms *dpu_kms)
>>  {
>>      struct drm_encoder *encoder = NULL;
>> +    struct msm_display_info info;
>>      int rc = 0;
>>
>>      if (!priv->dp)
>> @@ -516,6 +555,7 @@ static int _dpu_kms_initialize_displayport(struct
>> drm_device *dev,
>>          return PTR_ERR(encoder);
>>      }
>>
>> +    memset(&info, 0, sizeof(info));
>>      rc = msm_dp_modeset_init(priv->dp, dev, encoder);
>>      if (rc) {
>>          DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>> @@ -524,6 +564,14 @@ static int _dpu_kms_initialize_displayport(struct
>> drm_device *dev,
>>      }
>>
>>      priv->encoders[priv->num_encoders++] = encoder;
>> +
>> +    info.num_of_h_tiles = 1;
>> +    info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
>> +    info.intf_type = encoder->encoder_type;
>> +    rc = dpu_encoder_setup(dev, encoder, &info);
>> +    if (rc)
>> +        DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>> +              encoder->base.id, rc);
>>      return rc;
>>  }
>>
>> @@ -726,41 +774,6 @@ static void dpu_kms_destroy(struct msm_kms *kms)
>>      msm_kms_destroy(&dpu_kms->base);
>>  }
>>
>> -static void _dpu_kms_set_encoder_mode(struct msm_kms *kms,
>> -                 struct drm_encoder *encoder,
>> -                 bool cmd_mode)
>> -{
>> -    struct msm_display_info info;
>> -    struct msm_drm_private *priv = encoder->dev->dev_private;
>> -    int i, rc = 0;
>> -
>> -    memset(&info, 0, sizeof(info));
>> -
>> -    info.intf_type = encoder->encoder_type;
>> -    info.capabilities = cmd_mode ? MSM_DISPLAY_CAP_CMD_MODE :
>> -            MSM_DISPLAY_CAP_VID_MODE;
>> -
>> -    switch (info.intf_type) {
>> -    case DRM_MODE_ENCODER_DSI:
>> -        /* TODO: No support for DSI swap */
>> -        for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>> -            if (priv->dsi[i]) {
>> -                info.h_tile_instance[info.num_of_h_tiles] = i;
>> -                info.num_of_h_tiles++;
>> -            }
>> -        }
>> -        break;
>> -    case DRM_MODE_ENCODER_TMDS:
>> -        info.num_of_h_tiles = 1;
>> -        break;
>> -    }
>> -
>> -    rc = dpu_encoder_setup(encoder->dev, encoder, &info);
>> -    if (rc)
>> -        DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>> -            encoder->base.id, rc);
>> -}
>> -
>>  static irqreturn_t dpu_irq(struct msm_kms *kms)
>>  {
>>      struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>> @@ -863,7 +876,6 @@ static const struct msm_kms_funcs kms_funcs = {
>>      .get_format      = dpu_get_msm_format,
>>      .round_pixclk    = dpu_kms_round_pixclk,
>>      .destroy         = dpu_kms_destroy,
>> -    .set_encoder_mode = _dpu_kms_set_encoder_mode,
>>      .snapshot        = dpu_kms_mdp_snapshot,
>>  #ifdef CONFIG_DEBUG_FS
>>      .debugfs_init    = dpu_kms_debugfs_init,


-- 
With best wishes
Dmitry
