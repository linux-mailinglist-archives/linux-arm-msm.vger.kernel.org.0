Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABECA7ACCCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 00:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbjIXWxh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Sep 2023 18:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbjIXWxg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Sep 2023 18:53:36 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8510FC
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 15:53:29 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-59f4bc88f9fso34948187b3.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Sep 2023 15:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695596009; x=1696200809; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CECDzOBd7Sw1IlQRsWeZrGBWQioYp0atlrjefXDJZl0=;
        b=LARfm5KHooVaVg2agIIYZ4fxZQiX/l5ffNUVyDsp8894dvaapiAnGgB1pRvAJwGFak
         UESO+tSobe6UU1HNs63YhODKIjqD6HWF1teRamOtYnfYGIYWtMtECTTFbu6jMFzFrXwa
         OdOcGBiVV7xA08VqVzaoJzW++X+4FdE0gImIMX6d5x2Wph1guBc6ABDUNwjZo63Q0qZq
         5RgQ0FtXkuZVPVqeeC/sqMMF8QoUnxwocoEwl4JCwS/tOeUNj6tDSg6BPqq8wQAuKSR0
         pXI3nVzw8QKk6TIxDSTsR9ZaZ1gYhAbwmovQEYNh9Q6b/nlQ7K9TWaTdlqNfQLaOHF7E
         4wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695596009; x=1696200809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CECDzOBd7Sw1IlQRsWeZrGBWQioYp0atlrjefXDJZl0=;
        b=pu95JtxpR2zCtk3YuEXFAlFGjGoNd28s45FzAlcbrIn0WkAiAfaKbnr4dL/Oa3NC6B
         5eEMu+4lNwkG7wQlTsmdvOvrQBOpL/6E0Ho89Esa9KRoBeyhGJ3hpapRG8WnRTyCNQba
         2mcnn6tskkBLNgajSi60S5ynsqvFEyphrf72+fz7DxX6DuQgmrRTASXkXa38ly8smpsQ
         P5u4AquFRL4Y7AB8HGt6yhnuPHpR8r2CyCiAy6JsY0vmSqBDQ2M2pz2X7E5WCK1vkJ5D
         7L62ATOPotjh2b1qVQ91Zxvms58j+JQs2UGMqBuNqsZD/8h08KzNHYB1cmkXlieAEKdW
         Dp1w==
X-Gm-Message-State: AOJu0YyVAgI2OXsoG7mDdHtV9eYE5vox+4UgXv9OWwhKPnu7dEtaDYSs
        wzyyhxXemWqKkEKEXw4PAXNHXxH8hWsGYEECIvZtRg==
X-Google-Smtp-Source: AGHT+IEHwe921wPx5HEyg4aw/9FkxxX4B9PkvHunECmoUSzNQP5VzJpsZSNQJ5aAR7fCZ7mRZ89yo0k1I7fPFegmNqg=
X-Received: by 2002:a0d:c101:0:b0:58d:7599:676a with SMTP id
 c1-20020a0dc101000000b0058d7599676amr4816556ywd.37.1695596009057; Sun, 24 Sep
 2023 15:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230924183914.51414-1-krzysztof.kozlowski@linaro.org> <20230924183914.51414-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230924183914.51414-3-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 25 Sep 2023 01:53:18 +0300
Message-ID: <CAA8EJpoyFsYNycq3SMqP4fdAU06w4aMdOQ3515NjjgyR0X6RUw@mail.gmail.com>
Subject: Re: [RESEND PATCH 3/4] ARM: dts: qcom: mdm9615: populate vsdcc fixed regulator
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 24 Sept 2023 at 21:39, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Fixed regulator put under "regulators" node will not be populated,
> unless simple-bus or something similar is used.  Drop the "regulators"
> wrapper node to fix this.
>
> Fixes: 2c5e596524e7 ("ARM: dts: Add MDM9615 dtsi")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
