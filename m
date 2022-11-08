Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3C896219B1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 17:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234373AbiKHQmD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 11:42:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234460AbiKHQmA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 11:42:00 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCB15801B
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 08:41:59 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id z18so23356995edb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 08:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JAuu4hWloYmftBKHb/d+/mSKClNOAP3hfPN38eMhM00=;
        b=ZMIJpDBTGymi73YrPFNDvi2rGWDySW0Kd9h0+KHCimcFqASahQoW5nTZcBF508L018
         8xtPVYDlnFYpkmLiVpZWmtDMxNdUntN3QiwlBsfgfIm0O4AYoci8I+aHOEXKlWKnaeig
         zT3nFZD+5XTHmnIaoPUtapkA4RHxF/xAEH4NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAuu4hWloYmftBKHb/d+/mSKClNOAP3hfPN38eMhM00=;
        b=dKCTrOxiA3r2M3vxX2+NwDj7Bva5kAZx43rjqY/Z0XAhnzVeyMmzKdmd88dLabPlHX
         NRGP44pxKjYn1NMz1RF4BvZQQWk3Pk1Sjq/XLo6G/miix25/B1+V62Pfypuyqv2iOFvQ
         9lWaVTCkjJo46k/tXF9u3pEvVza2TjdihfuE+yuF7V3bkueLSt72DovYyJRhqi5jwdgv
         Q931SfcwqP0PqmQkx76eCKPgtBN0m2TJPZTZ2MMhBUcsN+FY90xoqCYu4GcugZ7p5FGY
         HeDnqsWw8Na52MqKWNQjyeZwLHGb7KluAJ2eQq96w+WBD3aA81t34DKHsNTW362WvZEV
         0lQQ==
X-Gm-Message-State: ACrzQf0y0wajRE4qH4tU3PLuxiPfYOVI3PCZnIQ1PcSiAPFosCnQScqL
        KpA32uZqu+Km8VE4U9mc9q3Ggunn9UH2XX8m
X-Google-Smtp-Source: AMsMyM7DQ+hkQJoVjSH7qveau40nKuHIR4oFXhUb5JgKmVOp/ySbLr1OatzEQDBejaj64ZiZrwizwA==
X-Received: by 2002:a05:6402:187:b0:464:163b:36b8 with SMTP id r7-20020a056402018700b00464163b36b8mr33067614edv.213.1667925718224;
        Tue, 08 Nov 2022 08:41:58 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id kz5-20020a17090777c500b0077b523d309asm4817754ejc.185.2022.11.08.08.41.49
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 08:41:52 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id g12so21818864wrs.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 08:41:49 -0800 (PST)
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id
 o8-20020a5d6488000000b0022b3b0b5e72mr36416288wri.138.1667925709225; Tue, 08
 Nov 2022 08:41:49 -0800 (PST)
MIME-Version: 1.0
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org> <20221107235654.1769462-15-bryan.odonoghue@linaro.org>
In-Reply-To: <20221107235654.1769462-15-bryan.odonoghue@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 8 Nov 2022 08:41:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XToQPNKwvY0K3kr0c+zAdTSsR2fvzHZJxa8ryJtC8xFQ@mail.gmail.com>
Message-ID: <CAD=FV=XToQPNKwvY0K3kr0c+zAdTSsR2fvzHZJxa8ryJtC8xFQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/18] arm64: dts: qcom: sc7280: Add compat qcom,mdss-dsi-ctrl-sc7280
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, quic_mkrishn@quicinc.com,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Nov 7, 2022 at 3:57 PM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Add silicon specific compatible qcom,mdss-dsi-ctrl-sc7280 to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for sc7280 against the yaml documentation.
>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Sibi Sankar <sibis@codeaurora.org>
> Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
