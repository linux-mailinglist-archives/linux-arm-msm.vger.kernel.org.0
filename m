Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 896325AF23F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 19:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233996AbiIFRRG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 13:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239579AbiIFRQf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 13:16:35 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3801920F4B
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 10:05:39 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id b5so16426375wrr.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 10:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=JZX7McjmoK3qx9FScx/z6DM7W5b/M9IiSBkj8M3ktmU=;
        b=FUVuzMiJqZPu2Zjwz6SlnlI/mwmo/BbzJBF61EQGnbOy+4E5jcN9JSkIWekGXJ7kO/
         AwUoJNi4Oun8NJDoCDQuD4UC75VLUAzk0IY9MuuY5PN6DHKn820C912phpXRQF2VPFxP
         9dESeYZwH9Zs20LUzai9OfVl3DHIB9p2jCKmw4FEiv6gehThsEme9nM2d5E4NHsfHq9M
         PZlE/lja1JnA/zcuy+MFJtYehoH7cHNX+eN7tE2v1QwSr+wec7fZs8APZ67ww2CxIaq5
         cbljBuzRzQZOGS2ebJBi9sam3TOovNFmU15wZWb/U5EHif5zThYP3inVw26GBCSUiXGr
         XSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=JZX7McjmoK3qx9FScx/z6DM7W5b/M9IiSBkj8M3ktmU=;
        b=ynwJiNxWlSwKDvbUIUrlUSE97ZlBWqlKgKg0Tu1N68h0cP2UDp/Phr7O4Mv0nl0hXk
         8lmIYnSwmgf44l6OXNRrPEZ7uPqVXc3cQocBkWzYh/eaq0+lQs9lsZ90lddtpfDTskeb
         gkLWaM3Ff0W1sHli8nkaZcipUoufiCjfcQ3H78pIrD0IHc+IP4chihWo5wXw1u8+zzon
         yKuRrBHiS34ClL/JuU16yPMuwi0/u5+CYSFmuTRu17oRa/o3DRLlpTSWwvGyWiC8OXPT
         iCp2V4moACWh2I6T2+5pv1eY/Alq65ZruG69yCV5L2o2BAjGSo3fhUaKmEChbW3ziDbk
         Fc3g==
X-Gm-Message-State: ACgBeo3VETgYI1bx2habe0cLtWm+0mTaR7/0Jc2p17jWuAG0iHYbeOHY
        eWEcIAHBGOeqiRGC6y1V6C462w==
X-Google-Smtp-Source: AA6agR5rdQc7G4b5dGsTKtJPaNM9/uyuR/oHXT1FzGVq24NJYOUNuMvEu3cPgX2X6QsxX0GmnIMIsg==
X-Received: by 2002:a05:6000:2a8:b0:226:e711:67f5 with SMTP id l8-20020a05600002a800b00226e71167f5mr20952578wry.359.1662483877162;
        Tue, 06 Sep 2022 10:04:37 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id h23-20020a05600c2cb700b003a2f2bb72d5sm27050586wmc.45.2022.09.06.10.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 10:04:36 -0700 (PDT)
Message-ID: <15102069-fd91-eb37-c984-5443cd7eb834@linaro.org>
Date:   Tue, 6 Sep 2022 18:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/12] ASoC/qcom/remoteproc/arm64: Qualcomm ADSP DTS and
 binding fixes
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Krzysztof for tidying this up.

On 06/09/2022 13:16, Krzysztof Kozlowski wrote:
> Hi,
> 
> Dependencies/merging
> ====================
> 1. The DTS patches are independent.
> 2. The binding patches should come together, because of context changes. Could
>     be one of: Qualcomm SoC, ASoC or DT tree.
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (12):
>    arm64: dts: qcom: sdm630: align APR services node names with dtschema
>    arm64: dts: qcom: sdm845: align APR services node names with dtschema
>    arm64: dts: qcom: sm8250: align APR services node names with dtschema
>    arm64: dts: qcom: msm8996: fix APR services nodes
>    arm64: dts: qcom: sdm845: align dai node names with dtschema
>    arm64: dts: qcom: msm8996: align dai node names with dtschema
>    arm64: dts: qcom: qrb5165-rb5: align dai node names with dtschema
>    arm64: dts: qcom: sm8250: use generic name for LPASS clock controller
>    dt-bindings: soc: qcom: apr: correct service children
>    ASoC: dt-bindings: qcom,q6dsp-lpass-ports: cleanup example
>    ASoC: dt-bindings: qcom,q6dsp-lpass-clocks: cleanup example
>    dt-bindings: soc: qcom: apr: add missing properties
> 

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini

>   .../bindings/soc/qcom/qcom,apr.yaml           | 85 ++++++++++++++++---
>   .../sound/qcom,q6dsp-lpass-clocks.yaml        | 30 +++----
>   .../sound/qcom,q6dsp-lpass-ports.yaml         | 30 +++----
>   arch/arm64/boot/dts/qcom/msm8996.dtsi         | 10 +--
>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  4 +-
>   arch/arm64/boot/dts/qcom/sdm630.dtsi          |  8 +-
>   arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  2 +-
>   .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts |  2 +-
>   .../boot/dts/qcom/sdm845-xiaomi-polaris.dts   |  4 +-
>   arch/arm64/boot/dts/qcom/sdm845.dtsi          |  8 +-
>   arch/arm64/boot/dts/qcom/sm8250.dtsi          | 10 +--
>   11 files changed, 124 insertions(+), 69 deletions(-)
> 
