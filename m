Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5577938AB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 11:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbjIFJog (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 05:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231536AbjIFJoe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 05:44:34 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1890E1994
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 02:44:09 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99c1c66876aso506886766b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 02:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693993446; x=1694598246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kceo6UNyVAWBxiYbjByhIfn5Dymn9L1sOTGNJrZDBbU=;
        b=wHPV+cSyrQ1rFl96ksu6Ao48hdKsoGwUVX2qTkHI+JsLwAitwrH2RwOD+rJViCTxuG
         6lrQytsIVb3ePcShxbk8q59ek6zrWraYyct4dXq1uCKgMuLq9lDvV/95SAW0AfbxYzF8
         ClURWGLwtIypDYN/hEX5Zl1xxWW8GIfor+q8/yXzjsboP2eXSYGlT22tsVTiPIo1B1U7
         VLnSgwm0NAxdMUUphEwzgot1H41OhOvJQHUMVYSI8jeL6v2+8nLqn58Nnh9PVK4zTgVR
         IfelkINBCB6mejJ7bfxJYxgZG0cWDa7RiJi+S9wFjMQjtWH1EO02FtyQFQm/+LV8z+8V
         y/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693993446; x=1694598246;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kceo6UNyVAWBxiYbjByhIfn5Dymn9L1sOTGNJrZDBbU=;
        b=IjFMd2uM6Ikg75TLtwe7tKerVH0evRIQf40sSEOQmbmWCepnafAV2cWl3t8dv4a7I/
         MNy+aaFiAdTJwsFYn+J9tm4uBzK16L6JY/E3fX45ET5J76PI1wLXMgDOtcxyX8Kn+BjV
         d60lMPQUR3Sw8kzIe/7oCOthq4PKTLmWCUXuwJO+r6pwuc1ILpCIQH2/DH1fUvSeAm3n
         X1uqzjKO3H4/fQgtoHj6UcHI5OnI608FaBBPJ3ktCIhMY76ZKGDjItM4ToLWsNDPK9yn
         AT7HzcqPP86ckTO9k+kceqgAm0oBGVC3OfJho6PPtY/hVFyXOahvTWeJ9mryYowyBr5W
         Hhgw==
X-Gm-Message-State: AOJu0YzyzK7bZy+etiK8PelDNfgEDhox4iKwfIs2SGklomPUwLlPnMVW
        QpWyt1m+f9eupT5fVXzF94WGjg==
X-Google-Smtp-Source: AGHT+IHdbD13vyY3Bbo5QL/ARKNb9adwZ/uciSFugU4EC1cogFxmDgysTg02CVael3AFCcAE3PIB7g==
X-Received: by 2002:a17:906:295:b0:9a1:c4ba:c04c with SMTP id 21-20020a170906029500b009a1c4bac04cmr1923392ejf.31.1693993446249;
        Wed, 06 Sep 2023 02:44:06 -0700 (PDT)
Received: from [192.168.37.154] (178235177204.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.204])
        by smtp.gmail.com with ESMTPSA id xo9-20020a170907bb8900b0099cbe71f3b5sm8674419ejc.0.2023.09.06.02.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 02:44:05 -0700 (PDT)
Message-ID: <045858e7-457a-4b29-a984-53209b2f38a9@linaro.org>
Date:   Wed, 6 Sep 2023 11:44:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] arm64: dts: qcom: msm8998-mtp: correct UFS pad
 supply
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230905161920.252013-1-krzysztof.kozlowski@linaro.org>
 <20230905161920.252013-10-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230905161920.252013-10-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5.09.2023 18:19, Krzysztof Kozlowski wrote:
> The Qualcomm UFS phy switched from dedicated driver to QMP phy driver.
> Eventually the old driver was removed in commit 02dca8c981b5 ("phy:
> qcom: remove ufs qmp phy driver").  The original driver and its binding
> used vddp-ref-clk regulator supply, but the new one did not and left the
> supply unused.
> 
> The Qualcomm UFS phy bindings were also migrated to newer ones and
> dropped support for vddp-ref-clk regulator in commit dc5cb63592bd
> ("dt-bindings: phy: migrate QMP UFS PHY bindings to
> qcom,sc8280xp-qmp-ufs-phy.yaml").
> 
> It turns out that this regulator, although with inaccurate name
> vddp-ref-clk, is actually needed to provide supply for VDD_PX10 (or
> similar, depending on the SoC) used by UFS controller.
> 
> Bring back handling of this supply by using more appropriate regulator -
> UFS controller host supply.  This also fixes dtbs_check warning:
> 
>   msm8998-mtp.dtb: phy@1da7000: 'vddp-ref-clk-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
