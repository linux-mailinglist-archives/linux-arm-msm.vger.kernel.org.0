Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46B6B716768
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 17:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232270AbjE3PpO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 11:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbjE3PpJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 11:45:09 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703E4E5
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 08:45:07 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2af2e908163so50770671fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685461506; x=1688053506;
        h=content-transfer-encoding:in-reply-to:subject:organization
         :content-language:references:cc:to:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9ns/8J/rWCan5lG4MLwoH9QwjwN6lxcG7uthnw+Hwg=;
        b=qI2Pn59B9aggdJFEQ830aBMnsgAnQ8nPkYUwVEOhqv3lTWsfBU4qZ9u7KczG97zm7y
         +xB86kbxHJGTU2WM9Ywx1Dyt64fG9kxm4KuOjjSUYXBn5UdWKvCkFYPBk897tz1elRL6
         dLbmLrq7nAwZMpakneVaGlieQdugnYZ63AqDe09eqq7KTiWq5819RrwKmQK2CsBcpniV
         rqS4Dlx8cKZ4DGN1pCHDLiHn7lJTRFpOpR2GTEXPTZHEL56Bz5ZmMtQcjx/1iJeRGX4K
         hMLf6P0+52sQZVOobOtliXTAPeWtZ0Mr6v0pgGS5t2cwysI0ZzVIDyPD63yGpFMmyUbL
         nADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685461506; x=1688053506;
        h=content-transfer-encoding:in-reply-to:subject:organization
         :content-language:references:cc:to:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q9ns/8J/rWCan5lG4MLwoH9QwjwN6lxcG7uthnw+Hwg=;
        b=N6vNIjoo2dk+svBcxPi2mTRYlSeXwod7KM/1Pzt66yp4som5V90aR+R/h9kFqx3D5V
         YsLT5GkEydTbzGjVOyDLVn0GcM29hAz8eSfE98w7ar7LeWSweOqrbUfwRaqTrq+UAwQA
         NrJewH0xuBC0X2SnPZsbQZ2tQrBXip1MIEr0jdbUWbvbXHGaD35gqZYcwZ5grLryeZU8
         FZN3pVhxKfZEVUnn9LUoDqHXCuPoav5uF1ns/E60amYRq7SFJRgitDaJJmvDeg2uj979
         eC8ojD/xsh2gxJqMFMZSc+SlC1VZP+grdxWMhV8S41Cb2zpcsOrvGFHUFBzn6f6/JNnd
         dlXg==
X-Gm-Message-State: AC+VfDx9fw8hxXaCX27bGaOPIwmbU1nFFf7qTEMWUVp+QAmHb8fFDbGh
        dn3wPlKrJ5Ei26oJJXcsXDLBvtfQCmoWDpKc2ZKi4A==
X-Google-Smtp-Source: ACHHUZ7eiupdgJ1Mi9YMw6yA4k5ZCdHTxj4CmnkWQYRDh9gLsNFd0MEqtBJ99JjkkOQ0+T8WbHolwg==
X-Received: by 2002:a05:651c:cc:b0:2af:2fb0:9226 with SMTP id 12-20020a05651c00cc00b002af2fb09226mr1205001ljr.41.1685461505277;
        Tue, 30 May 2023 08:45:05 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c24cd00b003f4dde07956sm21348772wmu.42.2023.05.30.08.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 08:45:04 -0700 (PDT)
Message-ID: <83c36957-cc85-c7e3-3fe5-f86562e003ee@linaro.org>
Date:   Tue, 30 May 2023 17:44:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Caleb Connolly <caleb@connolly.tech>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-3-541c341d6bee@somainline.org>
 <ccc97880-8e74-b85b-9679-9c12c44c4b99@linaro.org>
 <brmrqeajbq3oyp3jjwmc6tuhiftz764u6az444xw6g7pwf5fr3@5tlp375qwhed>
 <617c8f8a-1fc7-c6a0-eaa5-ce75ff2adc1b@linaro.org>
 <CAA8EJppG=MAVpK1J_8bNnkJ23y9NtgY7a2GVResXJvhEKyNsrw@mail.gmail.com>
 <739a8bd9-9ff0-5072-fdae-b64efdf86842@collabora.com>
 <e927cfcd-bf34-5daf-0e24-4dd828106968@linaro.org>
Content-Language: en-US
Organization: Linaro Developer Services
Subject: Re: RFC: DSI host capabilities (was: [PATCH RFC 03/10] drm/panel: Add
 LGD panel driver for Sony Xperia XZ3)
In-Reply-To: <e927cfcd-bf34-5daf-0e24-4dd828106968@linaro.org>
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

On 30/05/2023 14:36, Dmitry Baryshkov wrote:
> On 30/05/2023 15:15, AngeloGioacchino Del Regno wrote:
>> Il 30/05/23 13:44, Dmitry Baryshkov ha scritto:
>>> On Tue, 30 May 2023 at 10:24, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>>
>>>> Hi Marijn, Dmitry, Caleb, Jessica,
>>>>
>>>> On 29/05/2023 23:11, Marijn Suijten wrote:
>>>>> On 2023-05-22 04:16:20, Dmitry Baryshkov wrote:
>>>>> <snip>
>>>>>>> +   if (ctx->dsi->dsc) {
>>>>>>
>>>>>> dsi->dsc is always set, thus this condition can be dropped.
>>>>>
>>>>> I want to leave room for possibly running the panel without DSC (at a
>>>>> lower resolution/refresh rate, or at higher power consumption if there
>>>>> is enough BW) by not assigning the pointer, if we get access to panel
>>>>> documentation: probably one of the magic commands sent in this driver
>>>>> controls it but we don't know which.
>>>>
>>>> I'd like to investigate if DSC should perhaps only be enabled if we
>>>> run non certain platforms/socs ?
>>>>
>>>> I mean, we don't know if the controller supports DSC and those particular
>>>> DSC parameters so we should probably start adding something like :
>>>>
>>>> static drm_dsc_config dsc_params_qcom = {}
>>>>
>>>> static const struct of_device_id panel_of_dsc_params[] = {
>>>>          { .compatible = "qcom,sm8150", , .data = &dsc_params_qcom },
>>>>          { .compatible = "qcom,sm8250", , .data = &dsc_params_qcom },
>>>>          { .compatible = "qcom,sm8350", , .data = &dsc_params_qcom },
>>>>          { .compatible = "qcom,sm8450", , .data = &dsc_params_qcom },
>>>> };
>>>
>>> I think this would damage the reusability of the drivers. The panel
>>> driver does not actually care if the SoC is SM8350, sunxi-something or
>>> RCar.
>>> Instead it cares about host capabilities.
>>>
>>> I think instead we should extend mipi_dsi_host:
>>>
>>> #define MIPI_DSI_HOST_MODE_VIDEO BIT(0)

I assume all DSI controller supports Video mode, so it should be a negative here
if for a reason it's not the case.

There should also be a flag to tell if sending LP commands sending while
in HS Video mode is supported.

>>> #define MIPI_DSI_HOST_MODE_CMD  BIT(1)
>>> #define MIPI_DSI_HOST_VIDEO_SUPPORTS_COMMANDS BIT(2)
>>> // FIXME: do we need to provide additional caps here ?
>>>
>>> #define MIPI_DSI_DSC_1_1 BIT(0)
>>> #define MIPI_DSI_DSC_1_2 BIT(1)
>>> #define MIPI_DSI_DSC_NATIVE_422 BIT(2)
>>> #define MIPI_DSI_DSC_NATIVE_420 BIT(3)
>>> #define MIPI_DSI_DSC_FRAC_BPP BIT(4)
>>> // etc.
>>>
>>> struct mipi_dsi_host {
>>>   // new fields only
>>>    unsigned long mode_flags;
>>>    unsigned long dsc_flags;
>>> };
>>>
>>> Then the panel driver can adapt itself to the host capabilities and
>>> (possibly) select one of the internally supported DSC profiles.
>>>
>>
>> I completely agree about extending mipi_dsi_host, other SoCs could reuse that and
>> support for DSC panels would become a lot cleaner.
> 
> Sounds good. I will wait for one or two more days (to get the possible feedback on fields/flags/etc) and post an RFC patch to dri-devel.

Good, I was waiting until a DSC panel appears on the list (and I failed to be the first), it's now the case.

For VTRD6130, the panel is capable of the 4 modes:
- video mode
- command mode
- video mode & DSC
- command mode & DSC

So it would need such info to enable one of the mode in some order to determine.

Thanks,
Neil
> 
>>
>> For example, on MediaTek DRM there's some support for DSC, more or less the same
>> for SPRD DRM and some DSI bridge drivers... having a clean infrastructure would
>> definitely help.
>>
>> I'm sad I cannot offer testing in that case because despite being sure that there
>> are MTK smartphones around with DSI panels using DSC, I have none... and all of the
>> Chromebooks are not using DSC anyway (but using DisplayPort compression, which is
>> obviously an entirely different beast).
>>
>>>>
>>>> ...
>>>> static int sony_akatsuki_lgd_probe(struct mipi_dsi_device *dsi)
>>>> ...
>>>>          const struct of_device_id *match;
>>>>
>>>> ...
>>>>          match = of_match_node(panel_of_dsc_params, of_root);
>>>>          if (match && match->data) {
>>>>                  dsi->dsc = devm_kzalloc(&dsi->dev, sizeof(*dsc), GFP_KERNEL);
>>>>                  memcpy(dsi->dsc, match->data, sizeof(*dsc));
>>>>          } else {
>>>>                  dev_warn(&dsi->dev, "DSI controller is not marked as supporting DSC\n");
>>>>          }
>>>> ...
>>>> }
>>>>
>>>> and probably bail out if it's a DSC only panel.
>>>>
>>
>> Usually DDICs support both DSC and non-DSC modes, depending on the initial
>> programming (read: init commands)... but the usual issue is that many DDICs
>> are not publicly documented for reasons, so yes, bailing out if DSC is not
>> supported would be the only option, and would be fine at this point.
>>
>> Cheers,
>> Angelo
>>
>>>> We could alternatively match on the DSI controller's dsi->host->dev instead of the SoC root compatible.
>>>>
>>>> Neil
>>>
>>
> 

