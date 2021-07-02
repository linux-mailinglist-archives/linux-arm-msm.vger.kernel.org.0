Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89AA03B9E02
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jul 2021 11:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbhGBJWt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jul 2021 05:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbhGBJWt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jul 2021 05:22:49 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D22C061764
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jul 2021 02:20:17 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id u13so16982065lfk.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jul 2021 02:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=m8wLfnq30i8HqaMYUYPOktmvkrFtzBVBFSBsMnOCFA0=;
        b=PXx8VwifMxb5+X7kwwF/CBQWmC+MCNUSwn+sBPhYsLCvLOKKA1idimJw67TmLw4Hmg
         M9nIDQ8AQVm3Jo8zq6ivb38qaAsBok/X38V72NMIB/3M/TCrFPexDRM61yTfkaiMcNl2
         ZMTueIHItTA92Aeqxmdr41p/g96jkJGUyXr8y4/nR7y/XaMebBWgfi22+XGIP1/zOdcM
         tJDqYxzuHzz0kdqN/wTROwEN3DQyaUKPyBx8HrfpOKsoP0vho0rhyZc7ouF0/348CGOQ
         efPKlnQHL2I+qsOOBpk+aT/qJBXEUO985JNMJhMZl0clGfTvTd4odkRZUouCSoZjRQg2
         S+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m8wLfnq30i8HqaMYUYPOktmvkrFtzBVBFSBsMnOCFA0=;
        b=GrGL8kzEEQ7xxSFNnxHBGi8/JvxSwer4oEuQNd3XDvse8EFusELTULqKOGeubiQVby
         izQ+1st4fAHT2GcQYT1/DTsaOXGfQVfBM+OI4rhcxuazuUuWsdvYjcTnqMIqGU12A459
         rVA/L9OLd22tIxF/7JNVaZhVvQRbXGL8pVjCnWbu+k7i1GH0zoHBEg9P+FRRvH6iwW3Q
         PomB93SQO7I+oZf/5XCDJS9POpfMhHq40aVadWj8souVXsSCHyat6gWdkbHQ6UVfLzIb
         TZveyDoTKpiG+W/LCAdJcCJ6tJ90Nb0Svs+zzdT8BeVMz3cC0IHwmeEcVCy+zr6kkwFr
         IcIg==
X-Gm-Message-State: AOAM5326/LXhundhCfqAmt1OXP7osxgtAsqC0MGAwol9UX4g36OQ1E2E
        wR3LKf0VazHaQNbdgsNHySHlXw==
X-Google-Smtp-Source: ABdhPJx+9+g/b7JKmNUZUjpyDVBW2rajxA6H1ZVvWiYyxgfgofTYkU8EvPSHDMlKw5K4wIRT0LKNSA==
X-Received: by 2002:a05:6512:c4:: with SMTP id c4mr3329179lfp.328.1625217615891;
        Fri, 02 Jul 2021 02:20:15 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f25sm294145ljp.95.2021.07.02.02.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jul 2021 02:20:15 -0700 (PDT)
Subject: Re: [Freedreno] [RFC 2/6] drm/msm/dpu: support setting up two
 independent DSI connectors
To:     abhinavk@codeaurora.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
References: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
 <20210609211723.2565105-3-dmitry.baryshkov@linaro.org>
 <73c474d067bd1f63e6d3457b01de4e2c@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <9ead5725-4c2d-5ab8-26db-badd31d3ed58@linaro.org>
Date:   Fri, 2 Jul 2021 12:20:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <73c474d067bd1f63e6d3457b01de4e2c@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/07/2021 00:12, abhinavk@codeaurora.org wrote:
> On 2021-06-09 14:17, Dmitry Baryshkov wrote:
>> Move setting up encoders from set_encoder_mode to
>> _dpu_kms_initialize_dsi() / _dpu_kms_initialize_displayport(). This
>> allows us to support not only "single DSI" and "dual DSI" but also "two
>> independent DSI" configurations. In future this would also help adding
>> support for multiple DP connectors.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> I will have to see Bjorn's changes to check why it was dependent on this 
> cleanup.
> Is the plan to call _dpu_kms_initialize_displayport() twice?

Yes. He needs to initialize several displayport interfaces. With the 
current code he has to map ids in the set_encoder_mode, using encoder 
ids (to fill up the info.h_tile_instance, which is hardcoded to 0 for DP 
in the current code).

> But still I am not able to put together where is the dependency on that 
> series
> with this one. Can you please elaborate on that a little bit?

It is possible to support independent outputs with the current code. I 
did that for DSI, Bjorn did for DP. However it results in quite an ugly 
code to map received encoder in set_encoder_mode back to the DSI (DP) 
instances to fill the h_tiles. If we drop the whole set_encoder_mode 
story and call dpu_encoder_setup right from the 
_dpu_kms_initialize_dsi() (or _dpu_kms_initialize_displayport()), 
supporting multiple outputs becomes an easy task.

> 
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 89 ++++++++++++-------------
>>  1 file changed, 44 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 1d3a4f395e74..b63e1c948ff2 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -471,30 +471,55 @@ static int _dpu_kms_initialize_dsi(struct 
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
>> +        if (!msm_dsi_is_dual_dsi(priv->dsi[i])) {
> 
> I would like to clarify the terminology of dual_dsi in the current DSI 
> driver before the rest of the reviews.
> Today IS_DUAL_DSI() means that two DSIs are driving the same display and 
> the two DSIs are operating in master-slave mode
> and are being driven by the same PLL.

Yes

> Usually, dual independent DSI means two DSIs driving two separate panels 
> using two separate PLLs ( DSI0 with PLL0 and DSI1 with PLL1)

Let's stop calling it 'dual'. I'd suggest to continue using what was 
there in the source file: 'two independent DSI'.

> I assume thats happening due to the foll logic and both DSI PHYs are 
> operating in STANDALONE mode:
> 
>      if (!IS_DUAL_DSI()) {
>          ret = msm_dsi_host_register(msm_dsi->host, true);
>          if (ret)
>              return ret;
> 
>          msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
>          ret = msm_dsi_host_set_src_pll(msm_dsi->host, msm_dsi->phy);

Yes. If we have two independent DSI outputs, we'd like them to work in 
STANDALONE mode.


>> +            rc = dpu_encoder_setup(dev, encoder, &info);
>> +            if (rc)
>> +                DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>> +                        encoder->base.id, rc);
>> +            encoder = NULL;
>> +        }
>> +    }
>> +
>> +    if (encoder) {
> 
> We will hit this case only for split-DSI right? ( that is two DSIs 
> driving the same panel ).

Yes, only in this case.

> Even single DSI will be created in the above loop now. So this looks a 
> bit confusing at the moment.

What is so confusing? I can probably add a comment there. If the encoder 
drivers single DSI output, we setup it after creating the DSI. If the 
encoder drives dual DSI outpu, we have to setup it after creating both 
DSI outputs.

I have tried calling dpu_encoder_setup from a separate if/loop 
condition, but it resulted in even uglier code.

> I think we need to be more clear on dual-DSI Vs split-DSI to avoid 
> confusion in the code about which one means what and the one
> which we are currently using. So what about having IS_DUAL_DSI() and 
> IS_SPLIT_DSI() to distinguish the terminologies and chaging
> DSI driver accordingly.

The word 'SPLIT' is already overloaded in my opinion. I'd prefer to keep 
on using 'dual DSI' for the master/slave case and not to use 'dual' for 
just two standalone DSI interfaces.

> 
>> +        rc = dpu_encoder_setup(dev, encoder, &info);
>> +        if (rc)
>> +            DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>> +                    encoder->base.id, rc);
>>      }
>>
>>      return rc;
>> @@ -505,6 +530,7 @@ static int _dpu_kms_initialize_displayport(struct
>> drm_device *dev,
>>                          struct dpu_kms *dpu_kms)
>>  {
>>      struct drm_encoder *encoder = NULL;
>> +    struct msm_display_info info;
>>      int rc = 0;
>>
>>      if (!priv->dp)
>> @@ -516,6 +542,7 @@ static int _dpu_kms_initialize_displayport(struct
>> drm_device *dev,
>>          return PTR_ERR(encoder);
>>      }
>>
>> +    memset(&info, 0, sizeof(info));
>>      rc = msm_dp_modeset_init(priv->dp, dev, encoder);
>>      if (rc) {
>>          DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>> @@ -524,6 +551,14 @@ static int _dpu_kms_initialize_displayport(struct
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
>> +            encoder->base.id, rc);
>>      return rc;
>>  }
>>
>> @@ -726,41 +761,6 @@ static void dpu_kms_destroy(struct msm_kms *kms)
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
> It seems we can get rid of set_encoder_mode for DP because the way we 
> are using it today seems not right.
> Ideally, the purpose was that once we read the EDID, the information we 
> read like the tile group etc
> can be used when we are setting up the encoder. But today, we are just 
> hard-coding the number of tiles.
> But I just think whether looking ahead, we should still have some 
> callback which can be called after
> EDID has been read instead of doing it in 
> _dpu_kms_initialize_displayport. Perhaps that can be a separate patch.

For the MST support? It is definitely a separate patch. For now we want 
to be able to drive a much simpler config: SST on several connected DPs.

> 
>>  static irqreturn_t dpu_irq(struct msm_kms *kms)
>>  {
>>      struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>> @@ -863,7 +863,6 @@ static const struct msm_kms_funcs kms_funcs = {
>>      .get_format      = dpu_get_msm_format,
>>      .round_pixclk    = dpu_kms_round_pixclk,
>>      .destroy         = dpu_kms_destroy,
>> -    .set_encoder_mode = _dpu_kms_set_encoder_mode,
> I would like to get Rob's comment on why we had set_encoder_mode in the 
> first place. Its there even in mdp5.
> 
> in current msm dsi, the dsi bind will happen only after the panel has 
> attached
> and the msm_drv's bind will happen only after that since its the 
> component master
> in that case what was the need for set_encoder_mode  because we will 
> know the panel's video/cmd mode in the dsi_bind call
> am i missing something about why mdp5 had this?
> 
>  From the dpu perspective, since dsi_bind() happens only once panel has 
> attached.
>>      .snapshot        = dpu_kms_mdp_snapshot,
>>  #ifdef CONFIG_DEBUG_FS
>>      .debugfs_init    = dpu_kms_debugfs_init,


-- 
With best wishes
Dmitry
