Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 503EF7237A6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 08:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235415AbjFFG1C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 02:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234330AbjFFG0o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 02:26:44 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974821BD9
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 23:25:34 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9745d99cfccso734766366b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 23:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686032733; x=1688624733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmuejoJeHN8EldA6gQK9in2sBXKsFxRHE2nxemHliVA=;
        b=H2t73c/MUrxYkiy6d/FXdt7ZLMZLAIM5COmSQl9zxydRjd6AepsMfAOtmnHik0Guc+
         rc9lNjHORqxoWdA7OblI2Oh8ysIHBtk/ekXpSqOxhz9AwPM37E/EpwXMc9Rg2PAQ0fWP
         dt8sAQHbxrtWkt5rhaxxi3jikHAuLmpn1aEneZArnesqQ0udnbFF6+87Po4UVUFNEFo8
         JMb8FWrTp3MozQX+jopYovc9bd5nsUv0X2c8cZVL4drEWsc6hMgTRZrMZRQ6xAsdo+eq
         K9rJ66YB4yXOi2TFheMJ2yMNzloMpPx4EduS9AltjqxXW9OuLTeY5I/LqvOyTVl/v6Lh
         TxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686032733; x=1688624733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmuejoJeHN8EldA6gQK9in2sBXKsFxRHE2nxemHliVA=;
        b=S/heNeYw8qwx9/czH7xykIRTZ7pFlI23Qz7X3yR7eCu9CaeSibD1SFNIHOLWIV5hPV
         vU78N7vnPHrciH4TODJbmzmtbBeT8J6QXc6bd7uW1WVVEbG/GX3JNyKzHv1hem5O0cGR
         uOqWJS7eBtfMBu4ae61cYVA7dEKDW2rlOVF3ExzlZc+iY9mjqRueNc6i5XNippxCYv6Z
         k2X1vlHx7oCFxF7uoGq+2/HngpZA0oS0NIySbc7JG7iOSWaBW11+PSuKchPHdhfPnw2h
         sAakDE/WZlp8F1BUeRaVQ4bgFsH8zFEhiCRIdW4QJaS8ODA45QXprB3M5c/VTwgjj0v+
         JqLQ==
X-Gm-Message-State: AC+VfDw1JaMIJyoVLEgrylNoR35V6Z9jJHO8qTXFmWmT8STDPSH9SEDY
        eOpKRH6zkQg/0gW1XJxfz1ByLQ==
X-Google-Smtp-Source: ACHHUZ5L6idkzO3bEQLABFvgweINi4eaoibE5pbJn7hFTY2jsvzdv0qJjx8fzYBbg9thOKHgpDVh3A==
X-Received: by 2002:a17:907:80c:b0:974:218d:c048 with SMTP id wv12-20020a170907080c00b00974218dc048mr1441420ejb.26.1686032732482;
        Mon, 05 Jun 2023 23:25:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id d10-20020a170906640a00b00965e1be3002sm5157877ejm.166.2023.06.05.23.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 23:25:32 -0700 (PDT)
Message-ID: <d2313558-c25d-ed58-c508-dac574183d08@linaro.org>
Date:   Tue, 6 Jun 2023 08:25:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 01/14] dt-bindings soc: qcom: smd-rpm: Fix sort order
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230531-rpm-rproc-v1-0-e0a3b6de1f14@gerhold.net>
 <20230531-rpm-rproc-v1-1-e0a3b6de1f14@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531-rpm-rproc-v1-1-e0a3b6de1f14@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/06/2023 09:08, Stephan Gerhold wrote:
> Some of the enum entries are not properly ordered, fix that.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

