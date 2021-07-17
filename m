Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D203CC345
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jul 2021 14:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233680AbhGQMiZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jul 2021 08:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233754AbhGQMiZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jul 2021 08:38:25 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1D4C06175F
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jul 2021 05:35:25 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id bn5so17573635ljb.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jul 2021 05:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ia1xzWT4KhGSv8qCQehEQkQNFLQTfOEQwhMS9rF8Ybg=;
        b=UFoF43Obg/+V0kUhjLntmeybI2F0TeZ+KeVSrqi6nbKk8h2RRA6d7AhFVdYXJ18By7
         7StDDT1kt+XaUJg8Q4ufeCC2gQ0g+IODonCLKgz/jZmtNXsXzlvftwfqCxOlnOLGmP3k
         6b4xdVNEneDY+K3F5AsYnKM2LYYvXnWvULkSkgRVEoTpw9vtLQMJCnOjqWrY4ojBgxCk
         Sr5eLXiKxJLzT63YAOHadXqv+BgowvmzMHngtq5SsVTBIItC+ErLHd8QclFHFu396Mue
         2iZ2LLB82j58Hz4fCBa+Qfv6nFpdJ5tItE4GDNqNzQLZlFFFGulAM7nqgI3FTtmjnm1g
         OjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ia1xzWT4KhGSv8qCQehEQkQNFLQTfOEQwhMS9rF8Ybg=;
        b=YnwKnvHCjGAOFj99tyQ6V1UbSaJmDHJhfnqKecjRGBIR7XUh0QqGF53qwrjwOsaGcY
         LgFq1ym0hBp/8tqDQjKykq57YJ/ixTwbqzDxDFeOPYRkP0ysNt3ITKusiyx2b0mJ/QQL
         2hwVAUKMTMSBZTel38xdI8FBcxychrLGK0LGPN6kNnatQZZQJmTWawh9QM5uGxJ2x4OP
         lYuActpgO0dcGKOkkx9rbVGkKC9uUmtmJe9Ck6Z5VDEdfNoOizoX90fhACLITe9BK5cH
         faUpjS5JT3sHpcTTrP2hjTBBHV07zIzzKhh3WhqbotHJobhO2vsIwlbLf+8bCgeS12lZ
         /qFw==
X-Gm-Message-State: AOAM532hXxotPtC8IHt8SLZBkUxJRcEHeXx9mCifHYubYfSKTu/GPrlj
        QNPU9MnZgQGDBfQvfV1a29JpnQ==
X-Google-Smtp-Source: ABdhPJzVYmn5UUThlgtbQptZUBstx2oGZjaG6P4YYYLporKgItFUqEyHmRXYoJGi0UcRjtGAOKDmig==
X-Received: by 2002:a05:651c:547:: with SMTP id q7mr13307669ljp.509.1626525324181;
        Sat, 17 Jul 2021 05:35:24 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d8sm859027lfi.129.2021.07.17.05.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jul 2021 05:35:23 -0700 (PDT)
Subject: Re: [PATCH v3 3/7] drm/msm/dpu: support setting up two independent
 DSI connectors
To:     abhinavk@codeaurora.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
 <20210710222005.1334734-4-dmitry.baryshkov@linaro.org>
 <2b7677a4acfa1ab8ba5d67a69fea9e07@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <f92eb756-bb34-38fb-9b2b-4669e675730f@linaro.org>
Date:   Sat, 17 Jul 2021 15:35:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2b7677a4acfa1ab8ba5d67a69fea9e07@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/07/2021 00:15, abhinavk@codeaurora.org wrote:
> On 2021-07-10 15:20, Dmitry Baryshkov wrote:
>> Move setting up encoders from set_encoder_mode to
>> _dpu_kms_initialize_dsi() / _dpu_kms_initialize_displayport(). This
>> allows us to support not only "single DSI" and "bonded DSI" but also "two
>> independent DSI" configurations. In future this would also help adding
>> support for multiple DP connectors.
>>
> 
> This looks quite neat now,so i am okay with this version of it:
> 
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> 
> Just a suggestion, since we are only supporting two dsis so far, do we need
> an extra variable to get the other DSI? Can't we just do priv->dsi[DSI_1]?
> as usually DSI_0 is the master

I still hope to fix "swap links in bonded DSI mode" (in other words DSI 
0 being clock master, but driving right half of the screen) one day. 
Thus I don't think we should enforce DSI_0/DSI_1 here.

> 
>> +        int other = (i + 1) % 2;
> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 102 +++++++++++++-----------
>>  1 file changed, 57 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 1d3a4f395e74..3cd2011e18d4 100644
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
>> +     * TODO: Support swapping DSI0 and DSI1 in the bonded setup.
>> +     */
>>      for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>> +        int other = (i + 1) % 2;
>> +
>>          if (!priv->dsi[i])
>>              continue;
>>
>> +        if (msm_dsi_is_bonded_dsi(priv->dsi[i]) &&
>> +            !msm_dsi_is_master_dsi(priv->dsi[i]))
>> +            continue;
>> +
>> +        encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
>> +        if (IS_ERR(encoder)) {
>> +            DPU_ERROR("encoder init failed for dsi display\n");
>> +            return PTR_ERR(encoder);
>> +        }
>> +
>> +        priv->encoders[priv->num_encoders++] = encoder;
>> +
>> +        memset(&info, 0, sizeof(info));
>> +        info.intf_type = encoder->encoder_type;
>> +
>>          rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
>>          if (rc) {
>>              DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
>>                  i, rc);
>>              break;
>>          }
>> +
>> +        info.h_tile_instance[info.num_of_h_tiles++] = i;
>> +        info.capabilities = msm_dsi_is_cmd_mode(priv->dsi[i]) ?
>> +            MSM_DISPLAY_CAP_CMD_MODE :
>> +            MSM_DISPLAY_CAP_VID_MODE;
>> +
>> +        if (msm_dsi_is_bonded_dsi(priv->dsi[i]) && priv->dsi[other]) {
>> +            rc = msm_dsi_modeset_init(priv->dsi[other], dev, encoder);
>> +            if (rc) {
>> +                DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
>> +                    other, rc);
>> +                break;
>> +            }
>> +
>> +            info.h_tile_instance[info.num_of_h_tiles++] = other;
>> +        }
>> +
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
