Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD53B6DBA72
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Apr 2023 13:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbjDHLgb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Apr 2023 07:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbjDHLga (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Apr 2023 07:36:30 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 490B1B443
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Apr 2023 04:36:28 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id g17so2579922ejt.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Apr 2023 04:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680953787;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6KMCVN4L9ldklrxsAVU+YsdQxCGvFHVbNDAEiVGPna8=;
        b=bM8PxqxodCpdHWxRqzqVx0Cgn3TYN3yuyV7ntN6AyozvP5C6fZxPV//yW/PQZGufix
         3bQ3dAkqukP444e1E1NvWps5tw8nZM35cW0mZCcRnT/eTOamXjchwMWIxbJdUVd1TSzp
         WCHojVUaIZd5Moav5opWP6rDgbROlmEKDPRByOEk9joJFq2m/NMzyL4xsSrMqbIi3KNS
         rVJ+qLuZJL+Xh5lIRsF0yhYpQG3OGvtjTQpeUPkBvOIgLl5KWsFwrBfrCn3Fnb24sw24
         r7zdvV87LMmkpOq1XpW/CpoFHoylIONBitJbZFY1CCjOF5wD3eNTXtUP0UMAGZ2/Bniw
         PqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680953787;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6KMCVN4L9ldklrxsAVU+YsdQxCGvFHVbNDAEiVGPna8=;
        b=1Vod2VEzORVHLHNzLaZr7R2+DmrGwNKVD/2+CAtXKacXumLYuIocCBAoDRHzAkfT0c
         wRdqiCFeGwS8XSEJeJWNgGw70enaA0AeHyWxk5S+DY6J3vZ5xqQjOxTUI+2lIfpcl8G5
         GfT8qxE7qAipiOXUpkEjfM9v/FiZas3nKDn/YR3jAPwa7OKW7egOsU8JcBp/+R0Gu4Tk
         dArrUaX1ZE54SfCmi3nsbmm+OSkMAnQzamhdXuADQFTYCENtGUJnsbAZJ2mayRsdxp06
         jqtI2vliNeXf+qTGrdE4Xmg+j1JBinJvLoeT2wdfzXL4bTgmTp8hCs2Yf+BebWuja0lz
         XPgw==
X-Gm-Message-State: AAQBX9edl8YM60RLu6ntt7Cj0LmuQ8lkflgfFr3c6RGMoXjrVGRHRnYY
        0dvW89g4RU1TE2KjgMajbluZCQ==
X-Google-Smtp-Source: AKy350ZjUl26qCzn/b2R5qoeTLSeScfNvPyM4mr4GcK4curXt7xM05OURsWwQqKojqOFAxaux0orWw==
X-Received: by 2002:a17:907:2157:b0:914:4277:f3e1 with SMTP id rk23-20020a170907215700b009144277f3e1mr2016161ejb.53.1680953786790;
        Sat, 08 Apr 2023 04:36:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:4c06:aac9:100f:9d7f? ([2a02:810d:15c0:828:4c06:aac9:100f:9d7f])
        by smtp.gmail.com with ESMTPSA id y11-20020a17090629cb00b00949173c1dcfsm3090237eje.18.2023.04.08.04.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Apr 2023 04:36:26 -0700 (PDT)
Message-ID: <70dd6449-06d2-7182-9922-ddc3476ba472@linaro.org>
Date:   Sat, 8 Apr 2023 13:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 0/8] Add multiport support for DWC3 controllers
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "quic_pkondeti@quicinc.com" <quic_pkondeti@quicinc.com>,
        "quic_ppratap@quicinc.com" <quic_ppratap@quicinc.com>,
        "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
        "quic_jackp@quicinc.com" <quic_jackp@quicinc.com>,
        "quic_harshq@quicinc.com" <quic_harshq@quicinc.com>,
        "ahalaney@redhat.com" <ahalaney@redhat.com>,
        "quic_shazhuss@quicinc.com" <quic_shazhuss@quicinc.com>
References: <20230405125759.4201-1-quic_kriskura@quicinc.com>
 <20230408014251.6cyjwuvsgu7dmz53@synopsys.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230408014251.6cyjwuvsgu7dmz53@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/04/2023 03:42, Thinh Nguyen wrote:
>> Krishna Kurapati (8):
>>   dt-bindings: usb: Add bindings for multiport properties on DWC3
>>     controller
>>   usb: dwc3: core: Access XHCI address space temporarily to read port
>>     info
>>   usb: dwc3: core: Skip setting event buffers for host only controllers
>>   usb: dwc3: core: Refactor PHY logic to support Multiport Controller
>>   usb: dwc3: qcom: Add multiport controller support for qcom wrapper
>>   arm64: dts: qcom: sc8280xp: Add multiport controller node for SC8280
>>   arm64: dts: qcom: sa8295p: Enable tertiary controller and its 4 USB
>>     ports
>>   arm64: dts: qcom: sa8540-ride: Enable first port of tertiary usb
>>     controller
>>
>>  .../devicetree/bindings/usb/snps,dwc3.yaml    |  13 +-
>>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts      |  47 +++
>>  arch/arm64/boot/dts/qcom/sa8540p-ride.dts     |  22 ++
>>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |  58 +++
>>  drivers/usb/dwc3/core.c                       | 373 ++++++++++++++----
>>  drivers/usb/dwc3/core.h                       |  71 +++-
>>  drivers/usb/dwc3/drd.c                        |  13 +-
>>  drivers/usb/dwc3/dwc3-qcom.c                  |  28 +-
>>  8 files changed, 523 insertions(+), 102 deletions(-)
>>
>> -- 
>> 2.40.0
>>
> 
> Please check if your patches and mailing client. Looks like they are
> corrupted.

All patches look from patch-syntax and apply fine. What is exactly
corrupted?

Best regards,
Krzysztof

