Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 709407938B0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 11:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233351AbjIFJor (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 05:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232279AbjIFJop (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 05:44:45 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A661BFC
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 02:44:17 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5007abb15e9so5776023e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 02:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693993453; x=1694598253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GBQXHUH6DtatCcRxzVcXALsRjVBvhgw7/R+Y8UEZ+zo=;
        b=VHHQ/BKpJUT+OzOq/k5+ULkQi+Yr+j4I0RFuctc7TDyUbJ7T7w0EdJSnYYGIq41f9R
         ucbAo2++RbH32/DBYhfxRv/XeJo69fvxuKshwQIY9RDbou6XIv7rLzUyRsvqBX4UCZfd
         5GiPXi9RvUsjDTzDQX370f73nMOGVLGiJ3npoFx7gnTmWc++ttfgQEyec0sEn6mwmhPv
         JE90fKH9fST4gak3QMSXEHmGN4D7jbL/ad44pFrFHy2jyPS87pGfUPVmU6PwTUtpCt4w
         OOY2Ogj/+Eh3wOHzyb8y5FrbOe2rWeL9Ny8qKYmEZVemXgqOQiDCLe8nkriYKybryiiC
         C6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693993453; x=1694598253;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GBQXHUH6DtatCcRxzVcXALsRjVBvhgw7/R+Y8UEZ+zo=;
        b=LnscFKUH3opb3kieKp6fX4P/bMEm25nxZS85yHU/qQyt4YwheuzeB6o33r94J9lNd2
         B+t2VlEkR0TdluUQpTnvFpOMq9Rymk9JWOZdB6pTYlgDmiIM/LCkQyofeywO1eLrgZOx
         UcsQyVor0rkMIsS1uEBXUNK+Hh8bbmn5+5Ar6gD1IRS/WTSW0q1t5ZcKuVy+rSY+FLLe
         eaPigGsBRx6wJiMtkotOnB5oPgKZT2DRFD6pUxn3s94DthEoGLHroty5wfDe/5VVPnbf
         NVyUpzUJ8pyzRSEyFue6Oe7XoSqniZdMOO1M873Qrbz0BAXQIB2pRno6XBSwWfAJdQFy
         a/PQ==
X-Gm-Message-State: AOJu0Ywevfe1xCC92CFDTU64lInh+bjXuVc4yvS0964YXv0pognH4Hs2
        UOceopppGPtbSzBjHv6YCwwQDw==
X-Google-Smtp-Source: AGHT+IE9ztHxaWDYZornzjVYS/n5YjkQ5K5POV23HAchzWNjQ01GU+6SosCWHVDAVjxsE4fWflLGpA==
X-Received: by 2002:a19:c21a:0:b0:4fb:911b:4e19 with SMTP id l26-20020a19c21a000000b004fb911b4e19mr1668017lfc.35.1693993453000;
        Wed, 06 Sep 2023 02:44:13 -0700 (PDT)
Received: from [192.168.37.154] (178235177204.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.204])
        by smtp.gmail.com with ESMTPSA id xo9-20020a170907bb8900b0099cbe71f3b5sm8674419ejc.0.2023.09.06.02.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 02:44:12 -0700 (PDT)
Message-ID: <e430d1a6-374c-41f2-a4dc-ef24f594f558@linaro.org>
Date:   Wed, 6 Sep 2023 11:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] arm64: dts: qcom: msm8998-oneplus: correct UFS pad
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
 <20230905161920.252013-11-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230905161920.252013-11-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
>   msm8998-oneplus-dumpling.dtb: phy@1da7000: 'vddp-ref-clk-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
