Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD6FE6F0BAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Apr 2023 20:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244420AbjD0SAm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Apr 2023 14:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244315AbjD0SAj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Apr 2023 14:00:39 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381563C15
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 11:00:37 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2a7af0cb2e6so86450991fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Apr 2023 11:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682618435; x=1685210435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T2GIu/+OnkLafZqySOKrzD8ciYv3HmQaDFMtQHfu3W8=;
        b=GNl7C2x83eoYeZnyG+bDI9/h8i2odgcHYWafi46kOk7JzJjF5axhRmi0NAnbCRGi9c
         kPNaOydGl8zElv98sZkCKsYhuEo6q3b4bxdyYZthrpRKavVJ/zocapR0Q9VCKUJ1qZ+R
         GDFw8svv0wExYnBphIq+5AZWTMab0jYAR6uy/TDwFyp/zjREqiEQhEbFNYDewIUwc+IR
         7v4At6FjAiTehnl41XcBRdoxVNivrzejLzKAKEAUaxzcdognTnQNsidMVg5FZqko57HK
         Vbz2B0VzM74DEmaQAkHl7h/ujsemRRkbnsVpD3f5S2QXJesPf5iQ2madGTTzXbN2stcb
         6ukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682618435; x=1685210435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T2GIu/+OnkLafZqySOKrzD8ciYv3HmQaDFMtQHfu3W8=;
        b=a26FDwWRR9Zd340p/4pmLxBH+9wxa/W6quWLi2vz3YBnApnuD3wqCK3YZWIpW8w7HZ
         apwiExXI5p+xF6dQace9uSYkPeE5B8Oo37A9M6i8R0nj+YSv3dTUC4jZvVWoblw3HnQY
         UFJkl1bGuG11Q+Z0aHu9ea8VxMSmEwbdED0MSZNugL85NqqT+7wA1oIRL6ZCOEy42UIR
         0EpirU0sajVFJHDtxdGyoTBSat/PPXEWf5hADdzynleIaX7woh0gFOe/7ujpZfl8TYWd
         1lGrvD0y8UYgFBLkwRFNnA2EGxPv4LDJW87Eq0qYqNyafbfRfNMfYiT0kCpj1jo3nUWc
         svgg==
X-Gm-Message-State: AC+VfDzefln6ziqRIfX0YIyCNGhFX4c4UsnW5Vt7cBbrerLdWT+Ojo8y
        qz4EYz5z6V7bGpeAmKf4omRFq7blGVrIRFeFE9miNQ==
X-Google-Smtp-Source: ACHHUZ5CcVXxlMWC43mQzxQDgoafzAlqyemf34S/dtcAHVQXQpFbKrBmB2oqIPlr6oiuy0adBms73g==
X-Received: by 2002:a2e:90c2:0:b0:2a8:ea22:28a6 with SMTP id o2-20020a2e90c2000000b002a8ea2228a6mr946880ljg.9.1682618435356;
        Thu, 27 Apr 2023 11:00:35 -0700 (PDT)
Received: from [172.23.2.5] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id f14-20020a2ea0ce000000b002ab1536377fsm1443232ljm.105.2023.04.27.11.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 11:00:34 -0700 (PDT)
Message-ID: <faada5fc-3dda-2d69-508a-15dbf5ddbbcc@linaro.org>
Date:   Thu, 27 Apr 2023 21:00:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 5/7] phy: qcom-qmp-combo: Introduce drm_bridge
Content-Language: en-GB
To:     neil.armstrong@linaro.org,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230425034010.3789376-1-quic_bjorande@quicinc.com>
 <20230425034010.3789376-6-quic_bjorande@quicinc.com>
 <CAJB8c04ah3YfK2VGxDhHMHK4KVJ7kZQv0b5JfPBu7jOk3mFQRA@mail.gmail.com>
 <d1850d73-9d92-c0aa-7cf8-bae4c0e4144b@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d1850d73-9d92-c0aa-7cf8-bae4c0e4144b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/04/2023 16:11, Neil Armstrong wrote:
> On 26/04/2023 12:33, Bryan O'Donoghue wrote:
>> On Tue, Apr 25, 2023 at 4:40 AM Bjorn Andersson
>> <quic_bjorande@quicinc.com> wrote:
>>>
>>> The QMP combo PHY sits in an of_graph connected between the DisplayPort
>>> controller and a USB Type-C connector (or possibly a redriver).
>>>
>>> The TCPM needs to be able to convey the HPD signal to the DisplayPort
>>> controller, but no directly link is provided by DeviceTree so the signal
>>> needs to "pass through" the QMP combo phy.
>>>
>>> Handle this by introducing a drm_bridge which upon initialization finds
>>> the next bridge (i.e. the usb-c-connector) and chain this together. This
>>> way HPD changes in the connector will propagate to the DisplayPort
>>> driver.
>>>
>>> The connector bridge is resolved lazily, as the TCPM is expected to be
>>> able to resolve the typec mux and switch at probe time, so the QMP combo
>>> phy will probe before the TCPM.
>>>
>>> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>>> ---
>>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 36 +++++++++++++++++++++++
>>>   1 file changed, 36 insertions(+)
>>>
>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c 
>>> b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>>> index 5d6d6ef3944b..84bc08002537 100644
>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>>> @@ -22,6 +22,8 @@
>>>   #include <linux/usb/typec.h>
>>>   #include <linux/usb/typec_mux.h>
>>>
>>> +#include <drm/drm_bridge.h>
>>> +
>>>   #include <dt-bindings/phy/phy-qcom-qmp.h>
>>>
>>>   #include "phy-qcom-qmp.h"
>>> @@ -1332,6 +1334,8 @@ struct qmp_combo {
>>>          struct clk_hw dp_link_hw;
>>>          struct clk_hw dp_pixel_hw;
>>>
>>> +       struct drm_bridge bridge;
>>> +
>>>          struct typec_switch_dev *sw;
>>>          enum typec_orientation orientation;
>>>   };
>>> @@ -3196,6 +3200,34 @@ static int qmp_combo_register_clocks(struct 
>>> qmp_combo *qmp, struct device_node *
>>>          return devm_add_action_or_reset(qmp->dev, 
>>> phy_clk_release_provider, dp_np);
>>>   }
>>>
>>> +static int qmp_combo_bridge_attach(struct drm_bridge *bridge,
>>> +                                  enum drm_bridge_attach_flags flags)
>>> +{
>>> +       struct qmp_combo *qmp = container_of(bridge, struct 
>>> qmp_combo, bridge);
>>> +       struct drm_bridge *next_bridge;
>>> +
>>> +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
>>> +               return -EINVAL;
>>> +
>>> +       next_bridge = devm_drm_of_get_bridge(qmp->dev, 
>>> qmp->dev->of_node, 0, 0);
>>> +       if (IS_ERR(next_bridge))
>>> +               return dev_err_probe(qmp->dev, PTR_ERR(next_bridge), 
>>> "failed to acquire drm_bridge\n");
>>> +
>>> +       return drm_bridge_attach(bridge->encoder, next_bridge, 
>>> bridge, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>> +}
>>> +
>>> +static const struct drm_bridge_funcs qmp_combo_bridge_funcs = {
>>> +       .attach = qmp_combo_bridge_attach,
>>> +};
>>> +
>>> +static int qmp_combo_dp_register_bridge(struct qmp_combo *qmp)
>>> +{
>>> +       qmp->bridge.funcs = &qmp_combo_bridge_funcs;
>>> +       qmp->bridge.of_node = qmp->dev->of_node;
>>> +
>>> +       return devm_drm_bridge_add(qmp->dev, &qmp->bridge);
>>> +}
>>> +
>>>   static int qmp_combo_parse_dt_lecacy_dp(struct qmp_combo *qmp, 
>>> struct device_node *np)
>>>   {
>>>          struct device *dev = qmp->dev;
>>> @@ -3459,6 +3491,10 @@ static int qmp_combo_probe(struct 
>>> platform_device *pdev)
>>>          if (ret)
>>>                  return ret;
>>>
>>> +       ret = qmp_combo_dp_register_bridge(qmp);
>>> +       if (ret)
>>> +               return ret;
> 
> I think the DRM part should be only built if CONFIG_DRM is enabled, I don't
> have a strong opinion on this, I think Vinod could help here.
> 
>>> +
>>>          /* Check for legacy binding with child nodes. */
>>>          usb_np = of_get_child_by_name(dev->of_node, "usb3-phy");
>>>          if (usb_np) {
>>> -- 
>>> 2.39.2
>>>
>>
>> You need to add some or all of these
>>         select DRM_DISPLAY_DP_HELPER
>>         select DRM_DISPLAY_HELPER
>>         select DRM_DP_AUX_BUS
>>         select DRM_KMS_HELPER
>>         select DRM_MIPI_DSI
>>         select DRM_PANEL
>>
>>
>> /opt/linaro/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-ld:
>> Unexpected GOT/PLT entries detected!
>> /opt/linaro/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-ld:
>> Unexpected run-time procedure linkages detected!
>> drivers/phy/qualcomm/phy-qcom-qmp-combo.o: In function
>> `qmp_combo_bridge_attach':
>> phy-qcom-qmp-combo.c:(.text+0xb50): undefined reference to
>> `devm_drm_of_get_bridge'
>> phy-qcom-qmp-combo.c:(.text+0xb6c): undefined reference to 
>> `drm_bridge_attach'
>> drivers/phy/qualcomm/phy-qcom-qmp-combo.o: In function `qmp_combo_probe':
>> phy-qcom-qmp-combo.c:(.text+0x13fc): undefined reference to
>> `devm_drm_bridge_add'
> 
> I think CONFIG_DRM_PANEL_BRIDGE in addition to CONFIG_DRM. should be 
> enough.
> 

I'd say DRM_PANEL_BRIDGE || !DRM_PANEL_BRIDGE in addition to DRM. And we 
probably should fix the  devm_drm_of_get_bridge() stub to use 
drm_of_find_panel_or_bridge() with panel = NULL.

> With this config added and my drm-bridge hat:
> 
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Neil
> 
> 
>>
>> ---
>> bod
> 

-- 
With best wishes
Dmitry

