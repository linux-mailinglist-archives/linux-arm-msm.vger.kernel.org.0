Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D88F05B4F09
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 15:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbiIKNaU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 09:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbiIKNaT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 09:30:19 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30DE1F637
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 06:30:17 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id z23so7643523ljk.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=hOMzevlGA+ySRg6MqAShDhYxwamFeVoNTxUO70sGCYA=;
        b=MVI1ZwKPIObsIUnUw7rek7ZGDx3WEmnhA97K2A/j76YQKc8pvFV/y5wERHTSvXM7zT
         MK0q2DM/kHevSZ0/dXBbV6J2W3AtG3jRylKnAA2cWqjajuE6oZuQQ9w5TGJ/xOEb0M2Q
         ni5FaoVW2gg/4+rkySSXQvDCXHl9h3J6MBd49SFTduICgPEQy5aWLoA8ItGF1IM+p6s9
         qfwWi8F8kNVkCUrQBcA3KleNegp5DqMkUL8EAUISSf6AtbLIabHS1HFUsftNxEovtb1a
         x+sk77LIPZbbluYIjD9q5WuvMgJB7ooyaQy6SVqECJbLdsF0D0rZHF6qzOwONjMKSSR1
         indg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=hOMzevlGA+ySRg6MqAShDhYxwamFeVoNTxUO70sGCYA=;
        b=H8933JCKb/5dz+rfZCnBrFrLlDKObC1p7rHLitLv2qp/c9wmtYe49chyfnazz8tzur
         4c2st7HaokZ7c/PtKnYn6Zx0EottqngIXStsX2uSODLJSPMAOdVBgnew06HTKnt9YsQM
         O3ZtXNuiAsx7yZssnWw3uKlFwofyJ59AgOaf9PDjhOmZXvz92Ef1PMEkUTvv45H/tMLK
         DCMcNthF/fn8II+eMVWZYcFjEWhqkHEHUxeccKUUAcIbAiE/gj58wPnaOPaYUK4d59ZA
         e0PdyELPL9FvkquhKdiKVMtcx8BVdWBYpeU+QDWepD9PFdUORPeyN0DLoS/JsGHgA3Hx
         6pcw==
X-Gm-Message-State: ACgBeo1tYGcclCcr4M9XC2pS1LIPBFCZWbOaIMDb/d8Z0yuVyJTPLCjx
        ZaAFBvUmJ/lXr6j1aIq8X0pYbg==
X-Google-Smtp-Source: AA6agR6OkDk8P2m/lHizzpthR0Wc5lx+UqfLfVLVzJTg/RaBgrb4y1LuFACP4d2sTy7nfTxUQo3wVw==
X-Received: by 2002:a2e:be05:0:b0:25f:d8fb:afbc with SMTP id z5-20020a2ebe05000000b0025fd8fbafbcmr6964092ljq.369.1662903016185;
        Sun, 11 Sep 2022 06:30:16 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y26-20020a05651c221a00b0026ad1da0dc3sm649853ljq.122.2022.09.11.06.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 06:30:15 -0700 (PDT)
Message-ID: <a2a15c79-64e3-ac03-9ee6-19dc16475cb8@linaro.org>
Date:   Sun, 11 Sep 2022 15:30:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 5/9] dt-bindings: mmc: sdhci-msm: Add pinctrl-1
 property
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220910143213.477261-1-iskren.chernev@gmail.com>
 <20220910143213.477261-6-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220910143213.477261-6-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/09/2022 16:32, Iskren Chernev wrote:
> Most mmc blocks contain two pinctrls, default and sleep. But then
> dt-schema complains about pinctrl-1 not being defined.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
