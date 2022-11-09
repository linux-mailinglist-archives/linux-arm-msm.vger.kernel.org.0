Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6365622659
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 10:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbiKIJLD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 04:11:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbiKIJK0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 04:10:26 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E24721400F
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Nov 2022 01:10:02 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id a67so26204555edf.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Nov 2022 01:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3QUCs5p4x20t+fA3jj3IjRsE5RgZihBpuubDFWuxLPM=;
        b=X7ZFhj2AXJWPd0iI5w+QPDsWjhrYZiOOtrpIQGvjlC67OqTz/9e3ssa7HsSjPKSZpG
         WerkuQ3NkDtMacm7+E4/erNkWbH80BVwwYUGXBmMvFuvLXWMwHs4T/qCjxnsrYgW8YKt
         Bm5rwb6G2jvYUgnQseyrh76DZ0t7ekEfNb4cF/YNcxaBBMfODf6F03oobV3wMGP/ROgO
         G5xKdB79391xsndcIVCWnRibFlPDkUhEesThSf9ggDwQhMbItRBGpDCEr/3wT0HE2iOq
         NMo/JZquZYniCu9Necst+YkX5hu5hUOI0ziXUiTi2AbPwmDOOHgsO65Lgb0muVborwQm
         QAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3QUCs5p4x20t+fA3jj3IjRsE5RgZihBpuubDFWuxLPM=;
        b=CQ86V3L0xVMN6Wlzl9uX5w5q3XeVvD4qwAhSGMaTYoPdnwhJdUtFxhRTpSXsauKstm
         w3l+3Z0230WBloxZwXkjTlDFYm1yzU+sUqLJppAhKXES/LXtY7TctByJCIW/969PVfAl
         /JObP4rcMY5p0NQfgdrW7bLB2NtTyhgGmXFEsQ6jH8v0tnu4U7C/Fb7LChOdTydho+G4
         ytz9F2qbfbMvjbeqLz7bbyDOb275Mbbt79UfNzua1Jq2wVkUmSTQ9zBnKwrDQoWqkkll
         cZ7Hx1l/oXDFh0f6PII8Hfv1Lhb6cE3lt/TrR3Wbpf5Ny7FkzV4TK6ntaksADbAlN9Mv
         eJ0Q==
X-Gm-Message-State: ACrzQf3Bi2L9mtEyqzTdiAOrWdJLx+hQ/e2wAI1BAgThd0zSkRxMkhz1
        mY6xSaaiTzb+eV19a3K6h0SkHb1A1QelS+pz2jBIEzmHx+k=
X-Google-Smtp-Source: AMsMyM5Ms2bgWpyDJeWDMgwaZHZ3U7mXuubQ4gvDoxzd/6h/EDQt+5r7O/Txn907C7Bam5j9KMqfqGhyu2J6efHTrpI=
X-Received: by 2002:aa7:c718:0:b0:462:ff35:95dc with SMTP id
 i24-20020aa7c718000000b00462ff3595dcmr57980811edq.32.1667985001514; Wed, 09
 Nov 2022 01:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20221108142357.67202-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221108142357.67202-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Nov 2022 10:09:50 +0100
Message-ID: <CACRpkdYTyd4c-pZMmz=bZtgsgfHFMbUNDW=71HqxFtXow5bfkg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom,ipq8074: convert to dtschema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 8, 2022 at 3:24 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Convert Qualcomm IPQ8074 pin controller bindings to DT schema.  Keep the
> parsing of pin configuration subnodes consistent with other Qualcomm
> schemas (children named with '-state' suffix, their children with
> '-pins').
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
