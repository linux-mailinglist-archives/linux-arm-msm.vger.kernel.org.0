Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 410907B7065
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Oct 2023 19:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240690AbjJCR4Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Oct 2023 13:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbjJCR4P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Oct 2023 13:56:15 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716EDA6
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Oct 2023 10:56:11 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50337b43ee6so1507677e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Oct 2023 10:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696355769; x=1696960569; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1JZhuE5j+iZE4J9mPwY5TV04FryZBb7bk3P/vsKpdYA=;
        b=JqESwYSCRBsKPPFZNXtCG3UikO4hnJ813CauROOXybOgwXt4qhQKyZ/nrlQyaMsVWD
         1sAp7K8OPZoof5+zj4F/kKcug52s3vnksxfiluCSsMwx21Wm5H/Vt5A1Ev5PVdyy73Fg
         ZSKj5XCYlAYJ7GptUJptZ7X9MVnQf2bkm3x62oNCGlJB8y8+rtoDnt1JqFT4gBfSmh5X
         9NY91QRUj3bcFH359mM3RyYuZeygiYznCF0kSwxr3VnHK826ESxTjNewb7D79/Esplwn
         F45s/wCTqe8sQgnazVVZCzyLzbpL6CJKqT8SFMqIw6j/tb/hq0dxS1C9+GC3mpc5txV/
         1Ffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696355769; x=1696960569;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JZhuE5j+iZE4J9mPwY5TV04FryZBb7bk3P/vsKpdYA=;
        b=lf8begIQb2oEw88iiOUve9Gbf/Cz2fbBEn6XHtGGRFGbLS7tLFj6/VTzV/HX/sCgiV
         nrteRqTI98PbNFI5bI8SyPsqdXxUwiKHSfW+IisZ2BjeLRsYQgSnCpxrCbPNdT5YctOu
         d7Idw+yD2JXI6wiMe4XlOpv3rkFNAy+m5CIHDaJH/AbI+kPxUfTocRMKHcQ1tiPYe2jk
         YmW646uJKps12Q2joPzWxmr/V2+jwZrwhZRZ9ElCuKQReOABOi7Ai0/FLYOKQd+Bprc/
         0WfYU1wtdSEuAiw8ODfNot+3aG4LyLISNHEnf8ECFLeR2SWZisaPE+SqmmAgGdPL8Ifl
         BOyg==
X-Gm-Message-State: AOJu0YxCngtlZ6rxfM/FS7L93Zxq8tXKCaVtWSocJ1r7v/XqAyPvgmHm
        UuGU56PtaRfmp07xbrf6eFpTeA==
X-Google-Smtp-Source: AGHT+IFNBTJc3E8wqGittkfs0CjrrMkLQqlQpI0ZdIa1dknPPv1CsHI/nQqXOnxcOdxURhyhB6xk1g==
X-Received: by 2002:a19:9103:0:b0:500:a0a3:80ff with SMTP id t3-20020a199103000000b00500a0a380ffmr11195126lfd.58.1696355769477;
        Tue, 03 Oct 2023 10:56:09 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c14-20020ac2530e000000b005057184ae62sm273632lfh.96.2023.10.03.10.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 10:56:09 -0700 (PDT)
Message-ID: <e7576c3b-82d2-4902-a19c-af2878ef7dbd@linaro.org>
Date:   Tue, 3 Oct 2023 20:56:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] drm/msm/dp: move of_dp_aux_populate_bus() to eDP
 probe()
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org, quic_abhinavk@quicinc.com,
        quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
        marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
 <1695848028-18023-9-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprfjt7w+3YJAieBabuMso=-obRXss7-9Jrif23WmOJw5w@mail.gmail.com>
 <2d8d4354-6dbb-e810-6efb-ca6b31f71b45@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2d8d4354-6dbb-e810-6efb-ca6b31f71b45@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/10/2023 20:25, Kuogee Hsieh wrote:
> 
> On 9/27/2023 2:57 PM, Dmitry Baryshkov wrote:
>> On Wed, 27 Sept 2023 at 23:54, Kuogee Hsieh <quic_khsieh@quicinc.com> 
>> wrote:
>>> Currently eDP population is done at msm_dp_modeset_init() which happen
>>> at binding time. Move eDP population to be done at display probe time
>>> so that probe deferral cases can be handled effectively.
>>> wait_for_hpd_asserted callback is added during drm_dp_aux_init()
>>> to ensure eDP's HPD is up before proceeding eDP population.
>>>
>>> Changes in v4:
>>> -- delete duplicate initialize code to dp_aux before 
>>> drm_dp_aux_register()
>>> -- delete of_get_child_by_name(dev->of_node, "aux-bus") and inline 
>>> the function
>>> -- not initialize rc = 0
>>>
>>> Changes in v3:
>>> -- add done_probing callback into devm_of_dp_aux_populate_bus()
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_aux.c     | 34 ++++++++++++++----
>>>   drivers/gpu/drm/msm/dp/dp_display.c | 69 
>>> ++++++++++++++++++-------------------
>>>   2 files changed, 60 insertions(+), 43 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c 
>>> b/drivers/gpu/drm/msm/dp/dp_aux.c
>>> index 22eb774..425b5c5 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
>>> @@ -480,7 +480,6 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux)
>>>
>>>   int dp_aux_register(struct drm_dp_aux *dp_aux)
>>>   {
>>> -       struct dp_aux_private *aux;
>>>          int ret;
>>>
>>>          if (!dp_aux) {
>>> @@ -488,12 +487,7 @@ int dp_aux_register(struct drm_dp_aux *dp_aux)
>>>                  return -EINVAL;
>>>          }
>>>
>>> -       aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
>>> -
>>> -       aux->dp_aux.name = "dpu_dp_aux";
>>> -       aux->dp_aux.dev = aux->dev;
>>> -       aux->dp_aux.transfer = dp_aux_transfer;
>>> -       ret = drm_dp_aux_register(&aux->dp_aux);
>>> +       ret = drm_dp_aux_register(dp_aux);
>>>          if (ret) {
>>>                  DRM_ERROR("%s: failed to register drm aux: %d\n", 
>>> __func__,
>>>                                  ret);
>>> @@ -508,6 +502,21 @@ void dp_aux_unregister(struct drm_dp_aux *dp_aux)
>>>          drm_dp_aux_unregister(dp_aux);
>>>   }
>>>
>>> +static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
>>> +                                unsigned long wait_us)
>>> +{
>>> +       int ret;
>>> +       struct dp_aux_private *aux;
>>> +
>>> +       aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
>>> +
>>> +       pm_runtime_get_sync(aux->dev);
>>> +       ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
>>> +       pm_runtime_put_sync(aux->dev);
>> Ok, so here you have used put_sync instead of autosuspend. Can we have
>> some uniformity? (I'd prefer to see put_sync or just put everywhere)
> 
> 
> my point is,
> 
> since display is user interface,
> 
> if there has any inputs before timer expire then there is no reason to 
> execute  pm_runtime_suspend().
> 
> otherwise pm_runtime_suspend() should be executed.
> 
> Therefore I used autosuspend  at aux_transfer() an 
> ddp_bridge_atomic_post_disable().
> 
> here is not related to user interface so that i use put_sysn() directly.
> 
> is my point make sense?
> 
>   or should I drop all autosuspend and replace them with put_sync()?

This was my question from the beginning: what was the reason for using 
autosuspend? Did it bring any sensible improvement in the disable & 
reenable path?

> 
> 
>>
>>> +
>>> +       return ret;
>>> +}
>>> +
>>>   struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog 
>>> *catalog,
>>>                                bool is_edp)
>>>   {
>>> @@ -531,6 +540,17 @@ struct drm_dp_aux *dp_aux_get(struct device 
>>> *dev, struct dp_catalog *catalog,
>>>          aux->catalog = catalog;
>>>          aux->retry_cnt = 0;
>>>
>>> +       /*
>>> +        * Use the drm_dp_aux_init() to use the aux adapter
>>> +        * before registering aux with the DRM device so that
>>> +        * msm edp panel can be detected by generic_dep_panel_probe().
>> eDP, AUX, generic_edp_panel_probe().
>>
>>> +        */
>>> +       aux->dp_aux.name = "dpu_dp_aux";
>>> +       aux->dp_aux.dev = dev;
>>> +       aux->dp_aux.transfer = dp_aux_transfer;
>>> +       aux->dp_aux.wait_hpd_asserted = dp_wait_hpd_asserted;
>>> +       drm_dp_aux_init(&aux->dp_aux);
>>> +
>>>          return &aux->dp_aux;
>>>   }
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>> index 711d262..9a2b403 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>> @@ -1203,6 +1203,28 @@ static const struct msm_dp_desc 
>>> *dp_display_get_desc(struct platform_device *pde
>>>          return NULL;
>>>   }
>>>
>>> +static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
>>> +{
>>> +       int rc;
>>> +
>>> +       rc = component_add(aux->dev, &dp_display_comp_ops);
>>> +       if (rc)
>>> +               DRM_ERROR("eDP component add failed, rc=%d\n", rc);
>> drop.
>>
>>> +
>>> +       return rc;
>>> +}
>>> +
>>> +static inline int dp_display_auxbus_population(struct 
>>> dp_display_private *dp)
>> It's not `population`. It is just `populate`.
>>
>> Also please inline this function.
>>
>>
>>> +{
>>> +       int ret;
>>> +
>>> +       ret = devm_of_dp_aux_populate_bus(dp->aux, 
>>> dp_auxbus_done_probe);
>>> +       if (ret == -ENODEV)
>>> +               DRM_ERROR("aux-bus not found\n");
>>> +
>>> +       return ret;
>>> +}
>>> +
>>>   static int dp_display_probe(struct platform_device *pdev)
>>>   {
>>>          int rc = 0;
>>> @@ -1271,10 +1293,16 @@ static int dp_display_probe(struct 
>>> platform_device *pdev)
>>>          if (rc)
>>>                  return rc;
>>>
>>> -       rc = component_add(&pdev->dev, &dp_display_comp_ops);
>>> -       if (rc) {
>>> -               DRM_ERROR("component add failed, rc=%d\n", rc);
>>> -               dp_display_deinit_sub_modules(dp);
>>> +       if (dp->dp_display.is_edp) {
>>> +               rc = dp_display_auxbus_population(dp);
>>> +               if (rc)
>>> +                       DRM_ERROR("eDP auxbus population failed, 
>>> rc=%d\n", rc);
>>> +       } else {
>>> +               rc = component_add(&pdev->dev, &dp_display_comp_ops);
>>> +               if (rc) {
>>> +                       DRM_ERROR("component add failed, rc=%d\n", rc);
>>> +                       dp_display_deinit_sub_modules(dp);
>>> +               }
>>>          }
>>>
>>>          return rc;
>>> @@ -1285,8 +1313,6 @@ static int dp_display_remove(struct 
>>> platform_device *pdev)
>>>          struct dp_display_private *dp = 
>>> dev_get_dp_display_private(&pdev->dev);
>>>
>>>          component_del(&pdev->dev, &dp_display_comp_ops);
>>> -       dp_display_deinit_sub_modules(dp);
>>> -
>>>          platform_set_drvdata(pdev, NULL);
>>>
>>>          dp_display_deinit_sub_modules(dp);
>>> @@ -1385,29 +1411,8 @@ static int dp_display_get_next_bridge(struct 
>>> msm_dp *dp)
>>>   {
>>>          int rc;
>>>          struct dp_display_private *dp_priv;
>>> -       struct device_node *aux_bus;
>>> -       struct device *dev;
>>>
>>>          dp_priv = container_of(dp, struct dp_display_private, 
>>> dp_display);
>>> -       dev = &dp_priv->pdev->dev;
>>> -       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
>>> -
>>> -       if (aux_bus && dp->is_edp) {
>>> -               /*
>>> -                * The code below assumes that the panel will finish 
>>> probing
>>> -                * by the time devm_of_dp_aux_populate_ep_devices() 
>>> returns.
>>> -                * This isn't a great assumption since it will fail 
>>> if the
>>> -                * panel driver is probed asynchronously but is the 
>>> best we
>>> -                * can do without a bigger driver reorganization.
>>> -                */
>>> -               rc = of_dp_aux_populate_bus(dp_priv->aux, NULL);
>>> -               of_node_put(aux_bus);
>>> -               if (rc)
>>> -                       goto error;
>>> -       } else if (dp->is_edp) {
>>> -               DRM_ERROR("eDP aux_bus not found\n");
>>> -               return -ENODEV;
>>> -       }
>>>
>>>          /*
>>>           * External bridges are mandatory for eDP interfaces: one 
>>> has to
>>> @@ -1420,17 +1425,9 @@ static int dp_display_get_next_bridge(struct 
>>> msm_dp *dp)
>>>          if (!dp->is_edp && rc == -ENODEV)
>>>                  return 0;
>>>
>>> -       if (!rc) {
>>> +       if (!rc)
>>>                  dp->next_bridge = dp_priv->parser->next_bridge;
>>> -               return 0;
>>> -       }
>>>
>>> -error:
>>> -       if (dp->is_edp) {
>>> -               of_dp_aux_depopulate_bus(dp_priv->aux);
>>> -               dp_display_host_phy_exit(dp_priv);
>>> -               dp_display_host_deinit(dp_priv);
>>> -       }
>>>          return rc;
>>>   }
>>>
>>> -- 
>>> 2.7.4
>>>
>>

-- 
With best wishes
Dmitry

