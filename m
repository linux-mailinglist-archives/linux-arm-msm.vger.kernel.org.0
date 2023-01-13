Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5050669F0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 18:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjAMRKY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 12:10:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjAMRKW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 12:10:22 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 295A9559D9
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 09:10:21 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id r2so21670473wrv.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 09:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vazWzgcQHorHqt/43WrkMc2t081lWzcdhOcSKYE7GTo=;
        b=vq8McZG8ps+E0ie7TKEPaWfVpJDwfMTXkAOY0kC/ExAkUUO3xBWLhLskEt34KCyUWa
         4eXFcW6FBtWpfOyptjWTatUjYUkZHLM+bLDXtd3/kx5hnNgAfk6gjPxigErO2LNdREUR
         EkmalnVjz49NXBuH7ozmr3u1d18E8VKUpUyhDisNVznE5rDV3VbfVgwecC4qen3Ybn9G
         cqKeGpjNGrqXZ6JiONFeIVXcEZKDlH89uljOEHsF23BVUaINh9ONw52FgZrv//Pme6gI
         nHE7ZysTBeL8RRaKxqjtYE3u5R4vFEVP+qx1N8t1CfD/fGK+c++D5wVDMX4akHy0Sf9W
         90JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vazWzgcQHorHqt/43WrkMc2t081lWzcdhOcSKYE7GTo=;
        b=L6KFl/4MxKU62QpQcjCo6V4T5Uwx9S8IVSD7BM/cdWP2brbMmMW5HsZoOFKxyeCLU5
         rxZTH7+TXJgeGsDtQVPeUlpM3mspX35SBsJqCBB08ohXN2JtUlyXqHW5Iv7BLAzUZ0oP
         d3JrU/TWCauuGtjdc9F5o/9KNzWYX4pdVVqmrncxJ35XxtC9Aru3rKDQ8NAZ9dj0ZipF
         +RgoBrQEmeUw3/jVBK8ZTTaEv7BYJWsRsfJ3S4joRnPoElb1dDPCF+2wbiMgLXt1hKIq
         2XEUTPh1vGD+GpvTAFc+fD+s8zuiz0FctA2iSmKq+caZLSWputBqnZve4OG6UnisqEG4
         GLUg==
X-Gm-Message-State: AFqh2kow9VcAv46Kxz6VSBGOkFsAdeTHhbX0NJIE2N4129J/grYDgMsO
        XD0EMxQjcfVabWq2A+pr9qdU6w==
X-Google-Smtp-Source: AMrXdXs+SbWwU6FVfDwhNYh8eG4DSKugwTztZjJGi5RnSaPxNbFwQHoTLsWfYUaSnOIp05pSp9gKPQ==
X-Received: by 2002:a5d:514b:0:b0:2a2:e87a:b4e1 with SMTP id u11-20020a5d514b000000b002a2e87ab4e1mr280248wrt.36.1673629819690;
        Fri, 13 Jan 2023 09:10:19 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d4bc6000000b0027323b19ecesm19254261wrt.16.2023.01.13.09.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 09:10:19 -0800 (PST)
Message-ID: <9e831252-7198-7983-8a52-0e745688452d@linaro.org>
Date:   Fri, 13 Jan 2023 17:10:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 0/4] soc: qcom: Introduce PMIC GLINK
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Johan Hovold <johan@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230113041132.4189268-1-quic_bjorande@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230113041132.4189268-1-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/01/2023 04:11, Bjorn Andersson wrote:
> This implements the base PMIC GLINK driver, a power_supply driver and a
> driver for the USB Type-C altmode protocol. This has been tested and
> shown to provide battery information, USB Type-C switch and mux requests
> and DisplayPort notifications on SC8180X, SC8280XP and SM8350.
> 
> Bjorn Andersson (4):
>    dt-bindings: soc: qcom: Introduce PMIC GLINK binding
>    soc: qcom: pmic_glink: Introduce base PMIC GLINK driver
>    soc: qcom: pmic_glink: Introduce altmode support
>    power: supply: Introduce Qualcomm PMIC GLINK power supply
> 
>   .../bindings/soc/qcom/qcom,pmic-glink.yaml    |  102 ++
>   drivers/power/supply/Kconfig                  |    9 +
>   drivers/power/supply/Makefile                 |    1 +
>   drivers/power/supply/qcom_battmgr.c           | 1421 +++++++++++++++++
>   drivers/soc/qcom/Kconfig                      |   15 +
>   drivers/soc/qcom/Makefile                     |    2 +
>   drivers/soc/qcom/pmic_glink.c                 |  336 ++++
>   drivers/soc/qcom/pmic_glink_altmode.c         |  477 ++++++
>   include/linux/soc/qcom/pmic_glink.h           |   32 +
>   9 files changed, 2395 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>   create mode 100644 drivers/power/supply/qcom_battmgr.c
>   create mode 100644 drivers/soc/qcom/pmic_glink.c
>   create mode 100644 drivers/soc/qcom/pmic_glink_altmode.c
>   create mode 100644 include/linux/soc/qcom/pmic_glink.h
> 

How does the USB PHY and a USB redriver fit into this ?

Is the host supposed to manage both/neither ? Is the DSP responsible for 
configuring the PHY lanes and the turnaround on orientation switch ?

---
bod
