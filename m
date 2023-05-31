Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F108571796E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 10:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234873AbjEaICh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 04:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235068AbjEaICX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 04:02:23 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EFF9E7C;
        Wed, 31 May 2023 01:02:10 -0700 (PDT)
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 980BD6605840;
        Wed, 31 May 2023 09:02:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1685520128;
        bh=AUgmp4uHtrPVbg+VOwRc6ifmtXREBu7e0Y6wlWAnSr0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=eLW3Xfmmt4Ri4pJ7KJCHSfcuvjrQMC44UhKMt6X2i1wJT9ecIAHO033v1swOdEOye
         R9gDswxF/pBPL1jp67uwOSDq0JcltrOauhfqT+H4B34ov9QcU48HdEw8rRDL2iTooJ
         r63ie3iDRtARF03aNXQKu3bkyFojYolt4wL06A1SbbHeNDgXfzpF/xOiB4OV+/UVAY
         7wnOSwCrJw8pxjUOkrzgR+W7CFSQg925qjZ/Se9Dfv8zkUo2A02iLH7NuioEq45iFh
         MJxr5tdxtZ7w8Wmt6JQMnwhvoK1Fiuspqm1+7zPXXvoVQcDXg5LC6Tumu2GUwlpDG+
         0m0hsQQVbgtGw==
Message-ID: <491055de-93f5-952e-4e37-9b00299a1d2d@collabora.com>
Date:   Wed, 31 May 2023 10:02:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: RFC: DSI host capabilities (was: [PATCH RFC 03/10] drm/panel: Add
 LGD panel driver for Sony Xperia XZ3)
To:     neil.armstrong@linaro.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 <83c36957-cc85-c7e3-3fe5-f86562e003ee@linaro.org>
Content-Language: en-US
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <83c36957-cc85-c7e3-3fe5-f86562e003ee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 30/05/23 17:44, Neil Armstrong ha scritto:
> On 30/05/2023 14:36, Dmitry Baryshkov wrote:
>> On 30/05/2023 15:15, AngeloGioacchino Del Regno wrote:
>>> Il 30/05/23 13:44, Dmitry Baryshkov ha scritto:
>>>> On Tue, 30 May 2023 at 10:24, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>>>
>>>>> Hi Marijn, Dmitry, Caleb, Jessica,
>>>>>
>>>>> On 29/05/2023 23:11, Marijn Suijten wrote:
>>>>>> On 2023-05-22 04:16:20, Dmitry Baryshkov wrote:
>>>>>> <snip>
>>>>>>>> +   if (ctx->dsi->dsc) {
>>>>>>>
>>>>>>> dsi->dsc is always set, thus this condition can be dropped.
>>>>>>
>>>>>> I want to leave room for possibly running the panel without DSC (at a
>>>>>> lower resolution/refresh rate, or at higher power consumption if there
>>>>>> is enough BW) by not assigning the pointer, if we get access to panel
>>>>>> documentation: probably one of the magic commands sent in this driver
>>>>>> controls it but we don't know which.
>>>>>
>>>>> I'd like to investigate if DSC should perhaps only be enabled if we
>>>>> run non certain platforms/socs ?
>>>>>
>>>>> I mean, we don't know if the controller supports DSC and those particular
>>>>> DSC parameters so we should probably start adding something like :
>>>>>
>>>>> static drm_dsc_config dsc_params_qcom = {}
>>>>>
>>>>> static const struct of_device_id panel_of_dsc_params[] = {
>>>>>          { .compatible = "qcom,sm8150", , .data = &dsc_params_qcom },
>>>>>          { .compatible = "qcom,sm8250", , .data = &dsc_params_qcom },
>>>>>          { .compatible = "qcom,sm8350", , .data = &dsc_params_qcom },
>>>>>          { .compatible = "qcom,sm8450", , .data = &dsc_params_qcom },
>>>>> };
>>>>
>>>> I think this would damage the reusability of the drivers. The panel
>>>> driver does not actually care if the SoC is SM8350, sunxi-something or
>>>> RCar.
>>>> Instead it cares about host capabilities.
>>>>
>>>> I think instead we should extend mipi_dsi_host:
>>>>
>>>> #define MIPI_DSI_HOST_MODE_VIDEO BIT(0)
> 
> I assume all DSI controller supports Video mode, so it should be a negative here
> if for a reason it's not the case.

Either all positive or all negative... and yes I agree that all DSI controllers
support video mode nowadays, but:
  - Will that be true for future controllers? (likely yes, but you never know)
  - Is there any controller driver not implementing video mode?
    - Will there be one in the future?

> 
> There should also be a flag to tell if sending LP commands sending while
> in HS Video mode is supported.
> 

+1. This is the case for both qcom and mtk.

>>>> #define MIPI_DSI_HOST_MODE_CMD  BIT(1)
>>>> #define MIPI_DSI_HOST_VIDEO_SUPPORTS_COMMANDS BIT(2)
>>>> // FIXME: do we need to provide additional caps here ?
>>>>
>>>> #define MIPI_DSI_DSC_1_1 BIT(0)
>>>> #define MIPI_DSI_DSC_1_2 BIT(1)
>>>> #define MIPI_DSI_DSC_NATIVE_422 BIT(2)
>>>> #define MIPI_DSI_DSC_NATIVE_420 BIT(3)
>>>> #define MIPI_DSI_DSC_FRAC_BPP BIT(4)
>>>> // etc.
>>>>
>>>> struct mipi_dsi_host {
>>>>   // new fields only
>>>>    unsigned long mode_flags;
>>>>    unsigned long dsc_flags;
>>>> };
>>>>
>>>> Then the panel driver can adapt itself to the host capabilities and
>>>> (possibly) select one of the internally supported DSC profiles.
>>>>
>>>
>>> I completely agree about extending mipi_dsi_host, other SoCs could reuse that and
>>> support for DSC panels would become a lot cleaner.
>>
>> Sounds good. I will wait for one or two more days (to get the possible feedback 
>> on fields/flags/etc) and post an RFC patch to dri-devel.
> 
> Good, I was waiting until a DSC panel appears on the list (and I failed to be the 
> first), it's now the case.
> 
> For VTRD6130, the panel is capable of the 4 modes:
> - video mode
> - command mode
> - video mode & DSC
> - command mode & DSC
> 
> So it would need such info to enable one of the mode in some order to determine.
> 

Dynamically determining is not trivial, as that depends on multiple variables:
  - Availability of the modes (obviously)
  - Available lanes
    - Available bandwidth per lane
      - Available total bandwidth
  - Power consumption considerations (DSC IP may be using more or less power
    depending on the actual SoC//controller)
    - Thermal management: DSC may make no thermal sense as in, more heat output
      vs thermal envelope (laptop vs embedded vs handset)
  - Others

Hence, the implementation should also provide a way of choosing a preferred mode
on a per-controller basis (DSC or no compression).

Just a few considerations that came to mind with a good sleep.

Cheers!

> Thanks,
> Neil
>>
>>>
>>> For example, on MediaTek DRM there's some support for DSC, more or less the same
>>> for SPRD DRM and some DSI bridge drivers... having a clean infrastructure would
>>> definitely help.
>>>
>>> I'm sad I cannot offer testing in that case because despite being sure that there
>>> are MTK smartphones around with DSI panels using DSC, I have none... and all of the
>>> Chromebooks are not using DSC anyway (but using DisplayPort compression, which is
>>> obviously an entirely different beast).
>>>
>>>>>
>>>>> ...
>>>>> static int sony_akatsuki_lgd_probe(struct mipi_dsi_device *dsi)
>>>>> ...
>>>>>          const struct of_device_id *match;
>>>>>
>>>>> ...
>>>>>          match = of_match_node(panel_of_dsc_params, of_root);
>>>>>          if (match && match->data) {
>>>>>                  dsi->dsc = devm_kzalloc(&dsi->dev, sizeof(*dsc), GFP_KERNEL);
>>>>>                  memcpy(dsi->dsc, match->data, sizeof(*dsc));
>>>>>          } else {
>>>>>                  dev_warn(&dsi->dev, "DSI controller is not marked as 
>>>>> supporting DSC\n");
>>>>>          }
>>>>> ...
>>>>> }
>>>>>
>>>>> and probably bail out if it's a DSC only panel.
>>>>>
>>>
>>> Usually DDICs support both DSC and non-DSC modes, depending on the initial
>>> programming (read: init commands)... but the usual issue is that many DDICs
>>> are not publicly documented for reasons, so yes, bailing out if DSC is not
>>> supported would be the only option, and would be fine at this point.
>>>
>>> Cheers,
>>> Angelo
>>>
>>>>> We could alternatively match on the DSI controller's dsi->host->dev instead of 
>>>>> the SoC root compatible.
>>>>>
>>>>> Neil
>>>>
>>>
>>
> 

