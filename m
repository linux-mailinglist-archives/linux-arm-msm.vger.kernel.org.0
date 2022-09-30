Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C10095F132B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 22:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232286AbiI3UGA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 16:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232302AbiI3UF4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 16:05:56 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C4F3163B63
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 13:05:49 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id sd10so11283308ejc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 13:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=FSnWEFqvu0sKIXdGnUiQR7VfRWkAet9cenDbxULwh2w=;
        b=Ul5ze0+/2m4BXfb95pG+apPjLW7jTgNgFl7FFgLeM9QESeTVv3x521/Dujq22sTS8p
         br6ks7PSUfFdwzc07cRO5UMPNGuzaWe7CWDOE/YE1+22sI58Y5wyGnDngS8SOBNK/lI/
         fakh9nc3+22GwofHyn9IXl4zXFhHsJw3yKq3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=FSnWEFqvu0sKIXdGnUiQR7VfRWkAet9cenDbxULwh2w=;
        b=1sXujMLyjsZI/BJILBRlvQC+3IE6Xpoltx97EtFDi/ECx2J2Yo6IEP1YfIeQ/tnyb4
         fFAGoqG/7dCmqQC6V9C89AuqHsN2eTysfSHKYWuqxbAdxvcTFtPbApeHcK13mUjTEfoO
         zYuwtefbJwt57W98aXsOkmdMVvruEJIxMtTIcddmOSnLLr2COw0pKOC4+kPdeKDI7Lwm
         H9xPE3IIZeyw8yHCNVIIVFIucSfCmdaDOX2uFqXVaYXXaNbBjYXN75BwFEyur3aITpLu
         NRZJKxxAU4U9m3+P9bdo0OJAnLX5RUrG3HeA3DkbUWvJi2eMhLfoo+gl5/6TCkiIDXpg
         /wbw==
X-Gm-Message-State: ACrzQf1n8PXYzPNB3qvGgZ5JqczQZ8lPHDvGS/rPH/hhSM9M5tIsDzCL
        znFeRm1xuDKSOifhq/U/UgIwnwBYMo6PUzEg
X-Google-Smtp-Source: AMsMyM4xMePVEhh/b4qO4uc2qHS4uLUe/GQL7CKR1zN+Uc9w2nNy1djOb5q5P8AqSmh+4gVI0HImNQ==
X-Received: by 2002:a17:907:8a15:b0:782:e6da:f13d with SMTP id sc21-20020a1709078a1500b00782e6daf13dmr7733788ejc.152.1664568347259;
        Fri, 30 Sep 2022 13:05:47 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id bm15-20020a170906c04f00b0073c80d008d5sm1604341ejb.122.2022.09.30.13.05.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 13:05:45 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id n10so8378999wrw.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 13:05:45 -0700 (PDT)
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id
 o8-20020a5d6488000000b0022b3b0b5e72mr7002267wri.138.1664568344847; Fri, 30
 Sep 2022 13:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220930182212.209804-1-krzysztof.kozlowski@linaro.org> <20220930182212.209804-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220930182212.209804-3-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 30 Sep 2022 13:05:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UZBL7SbLkkjYs0dSAxjLPnVW3dd_UfoPB8L_Hf0MhvLw@mail.gmail.com>
Message-ID: <CAD=FV=UZBL7SbLkkjYs0dSAxjLPnVW3dd_UfoPB8L_Hf0MhvLw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-cheza: fix AP suspend pin bias
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        "# 4.0+" <stable@vger.kernel.org>,
        Fritz Koenig <frkoenig@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Sep 30, 2022 at 11:22 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> There is no "bias-no-pull" property.  Assume intentions were disabling
> bias.
>
> Fixes: 79e7739f7b87 ("arm64: dts: qcom: sdm845-cheza: add initial cheza dt")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Not tested on hardware.
> ---
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
