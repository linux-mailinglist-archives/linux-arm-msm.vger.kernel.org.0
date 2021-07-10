Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D39F3C36A3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 21:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbhGJUAH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Jul 2021 16:00:07 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:14746 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229515AbhGJUAH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Jul 2021 16:00:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625947041; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=C8EhAiZVOaYNWtH0HvkyMd4HktxSNPQK2ryTMqqWJK8=;
 b=BpNbco1o9WOeOjavoww5uPrWOrJ69shLbdEOh4mbCnpsydoCb9vDW83UrADQ4bAmGMCy9XiB
 c+4/FUie8nyvVMCV9p72UnqKuRFaBmLUoLQcAVajs3890U4Yn+rgm3AXuL04pU8Rxuuhwj+a
 +XLSL/kLIE7eTokrfCZc2DAsUs4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60e9fba07b2963a282258358 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 10 Jul 2021 19:57:20
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2BD3C4360C; Sat, 10 Jul 2021 19:57:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BC256C433D3;
        Sat, 10 Jul 2021 19:57:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Sat, 10 Jul 2021 12:57:17 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     freedreno@lists.freedesktop.org,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH v2 3/7] drm/msm/dpu: support setting up two
 independent DSI connectors
In-Reply-To: <7833a24b-f5e3-1bb4-e180-225fd3d94f20@linaro.org>
References: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
 <20210709235024.1077888-4-dmitry.baryshkov@linaro.org>
 <0a19346363a524e071b12610d9c08647@codeaurora.org>
 <7833a24b-f5e3-1bb4-e180-225fd3d94f20@linaro.org>
Message-ID: <e1fd47d2ee0fcfb1ab4fc6ecee2b134d@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-10 12:38, Dmitry Baryshkov wrote:
> On 10/07/2021 03:30, abhinavk@codeaurora.org wrote:
>> On 2021-07-09 16:50, Dmitry Baryshkov wrote:
>>> Move setting up encoders from set_encoder_mode to
>>> _dpu_kms_initialize_dsi() / _dpu_kms_initialize_displayport(). This
>>> allows us to support not only "single DSI" and "bonded DSI" but also 
>>> "two
>>> independent DSI" configurations. In future this would also help 
>>> adding
>>> support for multiple DP connectors.
>>> 
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 130 
>>> ++++++++++++++----------
>>>  1 file changed, 79 insertions(+), 51 deletions(-)
>>> 
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 1d3a4f395e74..e14eb8f94cd7 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -466,17 +466,16 @@ static void dpu_kms_wait_flush(struct msm_kms
>>> *kms, unsigned crtc_mask)
>>>          dpu_kms_wait_for_commit_done(kms, crtc);
>>>  }
>>> 
>>> -static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>>> -                    struct msm_drm_private *priv,
>>> -                    struct dpu_kms *dpu_kms)
>>> +static int _dpu_kms_initialize_dsi_encoder(struct drm_device *dev,
>>> +                       struct msm_drm_private *priv,
>>> +                       struct dpu_kms *dpu_kms,
>>> +                       int dsi_id, int dsi_id1)
>>>  {
>>> +    struct msm_dsi *dsi = priv->dsi[dsi_id];
>>>      struct drm_encoder *encoder = NULL;
>>> -    int i, rc = 0;
>>> -
>>> -    if (!(priv->dsi[0] || priv->dsi[1]))
>>> -        return rc;
>>> +    struct msm_display_info info;
>>> +    int rc = 0;
>>> 
>>> -    /*TODO: Support two independent DSI connectors */
>>>      encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
>>>      if (IS_ERR(encoder)) {
>>>          DPU_ERROR("encoder init failed for dsi display\n");
>>> @@ -485,19 +484,74 @@ static int _dpu_kms_initialize_dsi(struct 
>>> drm_device *dev,
>>> 
>>>      priv->encoders[priv->num_encoders++] = encoder;
>>> 
>>> -    for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>>> -        if (!priv->dsi[i])
>>> -            continue;
>>> +    rc = msm_dsi_modeset_init(dsi, dev, encoder);
>>> +    if (rc) {
>>> +        DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
>>> +              dsi_id, rc);
>>> +        return rc;
>>> +    }
>>> +
>>> +    memset(&info, 0, sizeof(info));
>>> +    info.intf_type = encoder->encoder_type;
>>> +    info.capabilities = msm_dsi_is_cmd_mode(dsi) ?
>>> +        MSM_DISPLAY_CAP_CMD_MODE :
>>> +        MSM_DISPLAY_CAP_VID_MODE;
>>> +    info.h_tile_instance[info.num_of_h_tiles++] = dsi_id;
>>> 
>>> -        rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
>>> +    /* For the bonded DSI setup we have second DSI host */
>>> +    if (dsi_id1 >= 0) {
>>> +        struct msm_dsi *dsi1 = priv->dsi[dsi_id1];
>>> +
>>> +        rc = msm_dsi_modeset_init(dsi1, dev, encoder);
>>>          if (rc) {
>>>              DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
>>> -                i, rc);
>>> -            break;
>>> +                  dsi_id1, rc);
>>> +            return rc;
>>>          }
>>> +
>>> +        info.h_tile_instance[info.num_of_h_tiles++] = dsi_id1;
>>>      }
>>> 
>>> -    return rc;
>>> +    rc = dpu_encoder_setup(dev, encoder, &info);
>>> +    if (rc) {
>>> +        DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>>> +              encoder->base.id, rc);
>>> +        return rc;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>>> +                    struct msm_drm_private *priv,
>>> +                    struct dpu_kms *dpu_kms)
>>> +{
>>> +    int i, rc = 0;
>>> +
>>> +    if (!(priv->dsi[0] || priv->dsi[1]))
>>> +        return rc;
>>> +
>>> +    /*
>>> +     * We support following confiurations:
>>> +     * - Single DSI host (dsi0 or dsi1)
>>> +     * - Two independent DSI hosts
>>> +     * - Bonded DSI0 and DSI1 hosts
>>> +     *
>>> +     *   TODO: Support swapping DSI0 and DSI1 in the bonded setup.
>>> +     */
>>> +    if (priv->dsi[0] && priv->dsi[1] && 
>>> msm_dsi_is_bonded_dsi(priv->dsi[0]))
>>> +        return _dpu_kms_initialize_dsi_encoder(dev, priv, dpu_kms, 
>>> 0, 1);
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>>> +        if (!priv->dsi[i])
>>> +            continue;
>>> +
>>> +        rc = _dpu_kms_initialize_dsi_encoder(dev, priv, dpu_kms, i, 
>>> -1);
>>> +        if (rc)
>>> +            return rc;
>>> +    }
>>> +
>>> +    return 0;
>>>  }
>> 
>> Can we simplify this a bit like below?
>> 
>> static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>>                      struct msm_drm_private *priv,
>>                      struct dpu_kms *dpu_kms)
>> {
>>      int i, rc = 0;
>> 
>>      if (!(priv->dsi[0] || priv->dsi[1]))
>>          return rc;
>> 
>>      /*
>>           * We support following confiurations:
>>       * - Single DSI host (dsi0 or dsi1)
>>       * - Two independent DSI hosts
>>       * - Bonded DSI0 and DSI1 hosts
>>       *
>>       *   TODO: Support swapping DSI0 and DSI1 in the bonded setup.
>>           for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>>          if (!priv->dsi[i])
>>              continue;
>> 
>>          rc = _dpu_kms_initialize_dsi(dev, priv, dpu_kms); // this API 
>> does everything except encoder setup
>>          if (rc)
>>              return rc;
>>                  if (!is_bonded_dsi)
>>                       _dpu_kms_initialize_dsi_encoder(...);
>>                  else if (dsi_0) // only one encoder setup for dsi_0
>>                      _dpu_kms_initialize_dsi_encoder(...);
>> 
>>      }
>> }
>> 
>> Let me know if you think this is a little less complicated.
> 
> I don't think this will work out of the box, currently we pass encoder
> to DSI initialization (modeset_init). Adding extra cases in the middle
> of the loop also doesn't seem like a clear solution.

In that case the previous attempt was actually a little better with the 
change I suggested
of using the msm_dsi_is_bonded_dsi() API instead of hard-coding the 
encoder to NULL.

This one has some additional changes like passing 1 and/or -1 of the 
dsi1. Just felt a bit of an
overkill. The previous one was better than this one.

> 
>> 
>>> 
>>>  static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>>> @@ -505,6 +559,7 @@ static int _dpu_kms_initialize_displayport(struct
>>> drm_device *dev,
>>>                          struct dpu_kms *dpu_kms)
>>>  {
>>>      struct drm_encoder *encoder = NULL;
>>> +    struct msm_display_info info;
>>>      int rc = 0;
>>> 
>>>      if (!priv->dp)
>>> @@ -516,6 +571,7 @@ static int _dpu_kms_initialize_displayport(struct
>>> drm_device *dev,
>>>          return PTR_ERR(encoder);
>>>      }
>>> 
>>> +    memset(&info, 0, sizeof(info));
>>>      rc = msm_dp_modeset_init(priv->dp, dev, encoder);
>>>      if (rc) {
>>>          DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>>> @@ -524,6 +580,14 @@ static int 
>>> _dpu_kms_initialize_displayport(struct
>>> drm_device *dev,
>>>      }
>>> 
>>>      priv->encoders[priv->num_encoders++] = encoder;
>>> +
>>> +    info.num_of_h_tiles = 1;
>>> +    info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
>>> +    info.intf_type = encoder->encoder_type;
>>> +    rc = dpu_encoder_setup(dev, encoder, &info);
>>> +    if (rc)
>>> +        DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>>> +              encoder->base.id, rc);
>>>      return rc;
>>>  }
>>> 
>>> @@ -726,41 +790,6 @@ static void dpu_kms_destroy(struct msm_kms *kms)
>>>      msm_kms_destroy(&dpu_kms->base);
>>>  }
>>> 
>>> -static void _dpu_kms_set_encoder_mode(struct msm_kms *kms,
>>> -                 struct drm_encoder *encoder,
>>> -                 bool cmd_mode)
>>> -{
>>> -    struct msm_display_info info;
>>> -    struct msm_drm_private *priv = encoder->dev->dev_private;
>>> -    int i, rc = 0;
>>> -
>>> -    memset(&info, 0, sizeof(info));
>>> -
>>> -    info.intf_type = encoder->encoder_type;
>>> -    info.capabilities = cmd_mode ? MSM_DISPLAY_CAP_CMD_MODE :
>>> -            MSM_DISPLAY_CAP_VID_MODE;
>>> -
>>> -    switch (info.intf_type) {
>>> -    case DRM_MODE_ENCODER_DSI:
>>> -        /* TODO: No support for DSI swap */
>>> -        for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>>> -            if (priv->dsi[i]) {
>>> -                info.h_tile_instance[info.num_of_h_tiles] = i;
>>> -                info.num_of_h_tiles++;
>>> -            }
>>> -        }
>>> -        break;
>>> -    case DRM_MODE_ENCODER_TMDS:
>>> -        info.num_of_h_tiles = 1;
>>> -        break;
>>> -    }
>>> -
>>> -    rc = dpu_encoder_setup(encoder->dev, encoder, &info);
>>> -    if (rc)
>>> -        DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>>> -            encoder->base.id, rc);
>>> -}
>>> -
>>>  static irqreturn_t dpu_irq(struct msm_kms *kms)
>>>  {
>>>      struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>>> @@ -863,7 +892,6 @@ static const struct msm_kms_funcs kms_funcs = {
>>>      .get_format      = dpu_get_msm_format,
>>>      .round_pixclk    = dpu_kms_round_pixclk,
>>>      .destroy         = dpu_kms_destroy,
>>> -    .set_encoder_mode = _dpu_kms_set_encoder_mode,
>>>      .snapshot        = dpu_kms_mdp_snapshot,
>>>  #ifdef CONFIG_DEBUG_FS
>>>      .debugfs_init    = dpu_kms_debugfs_init,
