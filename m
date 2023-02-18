Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C71069B958
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Feb 2023 11:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjBRKVo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Feb 2023 05:21:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbjBRKVn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Feb 2023 05:21:43 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C8D2196D
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Feb 2023 02:21:41 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id fd2so1769216edb.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Feb 2023 02:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f9nPYTf4xRCXdnbNVRaJ4nSk0KOzNwnc9GmMlpp1q+0=;
        b=VwMp0c8YWa3Pw4FPYHtwPmToRJYo2XeYvx9jrC2Ci65KC7SevvM/9hZBACHv3D/Xyd
         /6LXRXllb+/ydnrSTcYYaQVex3KOHGXZ/BCNYe2pDsizWI28daWtS31kOGBJ3BsypW53
         SPsrYBXH3R7TxtDwZlSvMGULmo8IuzmmXAwvTy+KQQ9zyAOAodQy71huWwVs2TVa28W+
         7kkD/UbHjjwiKcZ4CWCGQbT6OTqEbqrYiGPRShyrYj0UAMC2iumxAo0/BRKq0Jb1p578
         TL8rGTqLklF63qqTiQAuceIhjFwgd4QSPN1RH0nqTHcrvJIfHFUYZzjDkW1xbvgt5U4F
         zBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f9nPYTf4xRCXdnbNVRaJ4nSk0KOzNwnc9GmMlpp1q+0=;
        b=aueXTEebjxZzYDHpLtLjAwDKd191qc2YNDRFTckMjOzbFhLcy39jWBnoOtGLtdjsKS
         L1HFOwAGplrBdUNj0CSQPhLxFV90Od5I7zgIRE0tX+/XnfMqyNo95XWcH/jrkf83aYCk
         CugMn3ZlXTzERukg/caToFyKHonuafCTCVh63CdUBmhOiS0ZFTBTjfM473ByfUHA03yQ
         L+kMzrD7L/4M79pJ05ukhExGNx/TeRaK3q4DWVnNNz1tNwyOJ3RgbfYHMMeeC4JAFKaY
         ZONfO4lTKiXIE7XIUniwdPDUEmTfOmaDnebStm/cpm8C5gGiB4NTcX8eo412InzdBAPA
         1XbA==
X-Gm-Message-State: AO0yUKV4oPmMjSKp1Tc4mqKnBkhzHIy7BJFBNhfiCb0F9OHUIRzSrbg6
        yS+JSjurhtY4OcMviZ9SED3e9w==
X-Google-Smtp-Source: AK7set/RIzIsTarwRaILdKViclKE1gMSFUg2wZ0p3iT5qrMRO1wFZtfjTK8OyHeZeVlbCD5N8b+XPQ==
X-Received: by 2002:a17:906:7488:b0:8b1:7a86:b06f with SMTP id e8-20020a170906748800b008b17a86b06fmr6213428ejl.63.1676715700308;
        Sat, 18 Feb 2023 02:21:40 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v20-20020a170906339400b00887830e535csm3202564eja.159.2023.02.18.02.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 02:21:39 -0800 (PST)
Message-ID: <c1d8397b-a042-d2e3-8446-e4db26c63ec5@linaro.org>
Date:   Sat, 18 Feb 2023 11:21:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2 1/5] dt-bindings: clock: qcom,a53pll: add IPQ9574
 compatible
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        catalin.marinas@arm.com, will@kernel.org,
        dmitry.baryshkov@linaro.org, arnd@arndb.de,
        geert+renesas@glider.be, nfraprado@collabora.com,
        broonie@kernel.org, rafal@milecki.pl,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com
References: <20230217134107.13946-1-quic_devipriy@quicinc.com>
 <20230217134107.13946-2-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230217134107.13946-2-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/02/2023 14:41, Devi Priya wrote:
> IPQ9574 uses A73 PLL of type Huayra.
> Add the IPQ9574 A73 compatible to A53 bindings as the PLL
> properties match with that of A53
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

