Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E77B65E853
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 10:55:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232184AbjAEJzT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Jan 2023 04:55:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232214AbjAEJzO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Jan 2023 04:55:14 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4845B58F91
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 01:55:10 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id t15so26700439wro.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jan 2023 01:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9IkS9Z7TwR5Xl6aVN2tSVjy6aS3alSYLzk3bV1tO+k=;
        b=eXyfz6gLw1HczVGBVIutjlzzj+KnUsqSAknuSdVl04CMKGu9DkoS0jvugaQyJCen9d
         NEKxckZUGkn5bNpgAsqI5AIIk/BlrKP0Vw7gmg3lERu7tmrOfj3CW140FZZJ5Cyrw933
         MQcadlGjyqAR0kBygjwwoNxLxGmIzVcsBE0ZPX3INchv67X0B8FzlcR/8aNWVlqPzSLL
         Ekr5Qjr7PRgFMmpzHvAooskbu6weTw8PQST08ASUzQJjehfUu7Gl/2u9f7CAV39OYc5u
         dMfWXTouv52tJpB+vGFbSRNz9TgpVJd0oqBC1vH6qKYqiV1FPszBJBIlkRkpjT/VhYLQ
         6Iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9IkS9Z7TwR5Xl6aVN2tSVjy6aS3alSYLzk3bV1tO+k=;
        b=opuXeeytRQJZLofCfaR+X7R0Uz50xX0mWCtkOgaOGDkO74XGabDC+1v+7iqGSwrWvQ
         pJtW3FBuAXsxaNYN1yUaz2lLjVnkEANM4ZE3At0u4YvHt6JG5cag6jnaLw1aLP+5aiEI
         lHeAmQDHp53yzoQ10Ki2m7rZPYorMg5XV3JniPD/PQ21TvXK4LgTyulqAe2qZmJCrj34
         ZQyZ4zNmLTJECDKbdGKpXdORd/tzu9wdF/dTaA+1pE2TRvEEroSmZcWzMPqgxtqga7tB
         jnE87NZRCOc+erhhE8VJJtBcnKrzCLYzUYxu40jsMdwsZJMWcDeNQWCc69p4WGsVbgFe
         Xs9w==
X-Gm-Message-State: AFqh2kr5lTCoPmdIjAFZBN8sKgz8er/8jyrvd/sIWMpYYmZVkY2QOrkO
        xcL99x7QzNbb1j41v/GPBRTYWw==
X-Google-Smtp-Source: AMrXdXv/u7eppdaONjDcReVjqUOgukp2sfRTn5EpcIGtoBCsW1cOUpkHGvtUR8EZprS92zX32nB8Eg==
X-Received: by 2002:adf:fc01:0:b0:297:dd4a:9207 with SMTP id i1-20020adffc01000000b00297dd4a9207mr10640817wrr.10.1672912508710;
        Thu, 05 Jan 2023 01:55:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1e12:c16d:1898:607c? ([2a01:e0a:982:cbb0:1e12:c16d:1898:607c])
        by smtp.gmail.com with ESMTPSA id fc14-20020a05600c524e00b003a3442f1229sm2062350wmb.29.2023.01.05.01.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 01:55:07 -0800 (PST)
Message-ID: <877fc236-5f86-3853-0877-33df32689d8c@linaro.org>
Date:   Thu, 5 Jan 2023 10:55:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: document the Visionox
 VTDR6130 AMOLED DSI Panel bindings
Content-Language: en-US
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-0-9b746b858378@linaro.org>
 <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-1-9b746b858378@linaro.org>
 <Y7RsnBkgnWbF3uMj@ravnborg.org>
Organization: Linaro Developer Services
In-Reply-To: <Y7RsnBkgnWbF3uMj@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/01/2023 18:57, Sam Ravnborg wrote:
> Hi Neil,
> 
> On Tue, Jan 03, 2023 at 03:22:27PM +0100, Neil Armstrong wrote:
>> Document the 1080x2400 Visionox VTDR6130 AMOLED DSI Panel bindings.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../bindings/display/panel/visionox,vtdr6130.yaml  | 53 ++++++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
>> new file mode 100644
>> index 000000000000..49e2fd4b4e99
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
>> @@ -0,0 +1,53 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/visionox,vtdr6130.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Visionox VTDR6130 AMOLED DSI Panel
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: visionox,vtdr6130
>> +
>> +  vddio-supply: true
>> +  vci-supply: true
>> +  vdd-supply: true
> These 3 looks wrong to me, as the above are not documented in panel-common.
> But maybe I miss something and this is OK?

It should be OK, the XXXX-supply properties are standard properties

Neil

> 
> 	Sam
> 
>> +  port: true
>> +  reset-gpios: true
>> +
>> +additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - vddio-supply
>> +  - vci-supply
>> +  - vdd-supply
>> +  - reset-gpios
>> +  - port
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    panel {
>> +        compatible = "visionox,vtdr6130";
>> +
>> +        vddio-supply = <&vreg_l12b_1p8>;
>> +        vci-supply = <&vreg_l13b_3p0>;
>> +        vdd-supply = <&vreg_l11b_1p2>;
>> +
>> +        reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
>> +
>> +        port {
>> +            panel0_in: endpoint {
>> +                remote-endpoint = <&dsi0_out>;
>> +            };
>> +        };
>> +    };
>> +...
>>
>> -- 
>> 2.34.1

