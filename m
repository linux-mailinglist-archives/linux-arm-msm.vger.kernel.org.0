Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 995016018BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 22:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiJQUJb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 16:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbiJQUJK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 16:09:10 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5257B1D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:08:38 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id b25so7390015qkk.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b34m75C009iIZzJu3wQMuuBZWmzJ1WhgRJhOBshaRuQ=;
        b=SbB14J2PwrjxdWC5ec+SxQSKApLFYnvWwABLOcd5+4LfM3rNYtZ8zEwtlY6tcohmjx
         AoSUcJnABebHaKt4cIa8jeGm/nPz4V6hF9PN70Px9DpsH71+n2wglwNll2r97qPpoJHS
         p9vHgdyTA7XElaGCB7x3JzIpJ0f/05V1PT7eK1+VFINmZ2XPyfs8Tz5z4ffbrk+2Hn69
         SIgbH9bA2jMVV8O1LUeyNBKCHjQ72oqOqoOtu1BaU6VKBNWLJC+a2843+B/k7Nuu7j5I
         vuRrMEaEWxg7DQk7Wt4PdAUsaXII8s5Zt+2221v8qtJbP8afgsTJe3pfOwWCMb2ueIYK
         mPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b34m75C009iIZzJu3wQMuuBZWmzJ1WhgRJhOBshaRuQ=;
        b=mQZjurOEhGw4yYwHKUAGHtbUDGZjTgpuva8hp2ny5UWpVK1jw7XYBgGcqy6YfN5Cj8
         K2cvzrhyNZfVV4qVAGngSqnjB2T4tqi00no27FZ7c4/oiwzXCNumk6xxdtQ6Bc2iSZnG
         Ogvl9yLSGoE4Q1pAFAP+6uFM74DVy36tHe5qROHQksc9YcP2OeZuYpKnGPQFkOzCXCSl
         L5rOwLoEnbldiKgQ8sO+gK0MS+XX966xBpbEm2MUQK5iHN00UunJF8+gYcWtVaaXYtso
         eE7Aigu/WkJfVv/5MBD5NbXUN8GL3JyZJWvKEYWDHlCm15vGcow4pRkW1pMU93Z7DJ2e
         0c4g==
X-Gm-Message-State: ACrzQf2p6/i98kN7DkB+AB6rWcn+akqVvq/Yk0EEoxekChmGEhd5KYto
        5pyZn6oo7NM0jV3LFWpLAKgBGQ==
X-Google-Smtp-Source: AMsMyM4AaZ0dl46d26zlNlfFW7sC/TYI9VC93ez/8+cq9OjlZ76KsVpR6QuzJGB1kdARvmp2nL8VpA==
X-Received: by 2002:ae9:eb45:0:b0:6ee:94aa:7520 with SMTP id b66-20020ae9eb45000000b006ee94aa7520mr9097432qkg.516.1666037316999;
        Mon, 17 Oct 2022 13:08:36 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:08:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v5 09/34] dt-bindings: pinctrl: qcom,ipq6018: correct BLSP6->BLSP0 functions
Date:   Mon, 17 Oct 2022 16:07:50 -0400
Message-Id: <166603728601.4991.10204223048558957862.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-10-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 16 Oct 2022 13:00:10 -0400, Krzysztof Kozlowski wrote:
> The pin controller driver has BLSP functions from 0 to 5, not 1 to 6.
> Add missing blsp0_i2c, blsp0_spi (already used in ipq6018-cp01-c1) and
> blsp0_uart.  Drop blsp6_i2c and blsp6_spi.
> 
> This fixes dtbs_check warning:
> 
>   ipq6018-cp01-c1.dtb: pinctrl@1000000: spi-0-state: 'oneOf' conditional failed, one must be fixed:
>     'bias-pull-down', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
>     'blsp0_spi' is not one of ['adsp_ext', 'alsp_int', .....
> 
> [...]

Applied, thanks!

[09/34] dt-bindings: pinctrl: qcom,ipq6018: correct BLSP6->BLSP0 functions
        https://git.kernel.org/krzk/linux-dt/c/5d6f7ee5f7efc21724250f9c42f74aa8785e682b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
