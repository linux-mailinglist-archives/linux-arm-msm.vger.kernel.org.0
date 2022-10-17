Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89F2D6018D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 22:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiJQUKN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 16:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbiJQUJs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 16:09:48 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D1F7A77E
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:09:12 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id z18so8078306qvn.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrAgKN86mV1Ge3b0jU0JjqS0Ve+xJvsGQNcddZ2kI3I=;
        b=QOPmqESC9bWLeb/3hermJV/enfAoD0bjJqXTVm7/am+8xLDl2EkB8lCouVJU8aRM2+
         WmKb83xZYfLIPfI/zwxKIdN8Z0q6izDICx9qGgMW6G5dhallc56wLj1H+AV05FXT/miL
         XpfH4mnjqneZQYRH9z2L9l94cSsQdbhGnfamy15XlwHKQL6BH8Ut8ZEZScXcHT9JObq9
         wR3MMwuhBH/teUC+1126xz0mZCH1HIp1Htoibc4lVBu9dffiCEMg2MAnw5dMAuz4A5Kf
         YRwV1IFd+VWulYDctFCIzGx3o+i9J4DkMYjRSct/+qL9wnBYgtS1IMBavn2TEx7v4tyA
         g6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrAgKN86mV1Ge3b0jU0JjqS0Ve+xJvsGQNcddZ2kI3I=;
        b=Sd8eDZv9zBF1KzVszuSqR2CChTcDWBafdK2MhpS3xqYEuAvk3jXIbQW3wXMQZ7VaA7
         j/G1iL+E9YfUGK23PSxSRERUEARg+TD5rSH7TKemYRMPy4Vc0W/jBZPGGW3SsDZiUPAQ
         L8WBUTGCqT3KA613ymB44NuY6UAETNN5R7HQyD6pgyNnHKQyyTDfLRGq0YnUgkda72P6
         cx4Hn2gdZPLEWES7DFfy3qNxndJQmlv4hPtTjzYtWT9kUKKAt2Jfj5JsUNxFuoMm6PGP
         4ATaF2vcEYo1fDHKbReSOw2SEYpZ9WWfHq/JddFpyTr8/zeYm6Gkm0zERYsYe/34uhSv
         AHZA==
X-Gm-Message-State: ACrzQf3ffJhn5NR5V6IjSSGlZ7Bj/hcDpaCd12IvvcQpwh9p0GR9ycNH
        B6WDs3d9tYFBuEbav4V9z1umUA==
X-Google-Smtp-Source: AMsMyM7l8W1pdoVw6qt7/R00rgN7ub6t1/KJFGubo/D0EmZRwh+Zn98Pjf54z91nn9ylLEN0mRl7HA==
X-Received: by 2002:ad4:5be1:0:b0:498:79dc:d3ff with SMTP id k1-20020ad45be1000000b0049879dcd3ffmr9481949qvc.87.1666037352175;
        Mon, 17 Oct 2022 13:09:12 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:09:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v5 22/34] dt-bindings: pinctrl: qcom,msm8953: use common TLMM schema
Date:   Mon, 17 Oct 2022 16:08:03 -0400
Message-Id: <166603728602.4991.836424868974889922.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-23-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-23-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 16 Oct 2022 13:00:23 -0400, Krzysztof Kozlowski wrote:
> Reference common Qualcomm TLMM pin controller schema, to bring common
> properties, other pinctrl schemas and additional checks, like function
> required only for GPIOs.
> 
> 

Applied, thanks!

[22/34] dt-bindings: pinctrl: qcom,msm8953: use common TLMM schema
        https://git.kernel.org/krzk/linux-dt/c/f695e8d8c8e45ed8d8b563dcd656df326d44707e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
