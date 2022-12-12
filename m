Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 040AA64A7F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 20:08:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232478AbiLLTIR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 14:08:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233108AbiLLTIJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 14:08:09 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA9D300
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 11:08:08 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id a19so929852ljk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 11:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJN82b8bktOx0a8DTPKHxMde3NN7Qmos2/Ud76lI/Mk=;
        b=eNrokzRpY770lF1/H5EPxMBocaP68zLBnkyzYhGwmPU6ZwCpbGBcQA0ok+g3QgNZ4i
         iJACDaACJM3RpZIX990SPj4uyWW5mNL21L7x9HumfOPkFd54c7UL/ufi3mbxD+0vG+X2
         KFeg1a5qCCYxPg8SdMd9HRctx8aNc8lZ0+dZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJN82b8bktOx0a8DTPKHxMde3NN7Qmos2/Ud76lI/Mk=;
        b=TC58SOgVp7g9F0MGDDlx1ub/dDOa1XjJCqr8vZCmlnGmBwn+b5yyXNzdATTtUKSlDw
         zVedfiN2IcOHgx7d0qicQEBwoBcWLjH5Wd7iMPXK+Bq+iZSTZbZZAby59AzNAAIm3xGV
         D6z8Tq0Ddz3VHc/qpfaY86zu7voqY9/SlqC9+VaDodzX+oJxZftu3TGTHp5AcAglS5KO
         F0dUY5LVliWEQtIFB0Dg10IWvGpVer0rqsVWqDFe1OmiXVFRzHsm+ccqmXY6W73xxfNu
         3d0V0bCV9dpwMpa0haQZDAzJuSPmdjMNh5eriDn/dMk0C+V8RnLIfBqNlS0oJn9VBDpM
         61RA==
X-Gm-Message-State: ANoB5pmSr8a7R1u6X484pMZQktILCj5rn8IKD06/vehOM05/8pRhNNq5
        o0yVMq9xq0/p1A3jst3JkA8e38ZTuDJaMRqz5Jr39A==
X-Google-Smtp-Source: AA0mqf4YOK6yBWUY3bKZaKEq6knHNfN2esegYkqPdhjOh6Ur1CmVEHd8DylV3U/7+5ItWJ+F+Nu5M0SjRi4fIZfSVAg=
X-Received: by 2002:a05:651c:221e:b0:277:6231:5a7 with SMTP id
 y30-20020a05651c221e00b00277623105a7mr23024892ljq.300.1670872086425; Mon, 12
 Dec 2022 11:08:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Dec 2022 14:08:05 -0500
MIME-Version: 1.0
In-Reply-To: <20221212133303.39610-4-krzysztof.kozlowski@linaro.org>
References: <20221212133303.39610-1-krzysztof.kozlowski@linaro.org> <20221212133303.39610-4-krzysztof.kozlowski@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 12 Dec 2022 14:08:05 -0500
Message-ID: <CAE-0n50y4N76Y-EEQ1sjT3Q_HnOLfFTw=qmus1X0CbD9Nt0v8w@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: rename AOSS QMP node to pmu
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

Quoting Krzysztof Kozlowski (2022-12-12 05:33:02)
> The Always On Subsystem (AOSS) QMP is not a power domain controller
> since commit 135780456218 ("arm64: dts: qcom: sc7180: Use QMP property
> to control load state") and few others.  In fact, it was never a power
> domain controller but rather control of power state of remote
> processors.  This power state control is know handled differently, thus
> the AOSS QMP nodes do not have power-domain-cells:
>
>   sc7280-idp.dtb: power-controller@c300000: '#power-domain-cells' is a required property
>   From schema: Documentation/devicetree/bindings/power/power-domain.yaml
>
> AOSS QMP is an interface to the actuall AOSS subsystem responsible for
> some of power management functions, thus let's call the nodes as "pmu" -
> Power Management Unit.

Isn't 'pmu' a performance monitoring unit?
