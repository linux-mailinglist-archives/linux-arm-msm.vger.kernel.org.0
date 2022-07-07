Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75CBC56A572
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 16:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235591AbiGGOcK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 10:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235556AbiGGOcK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 10:32:10 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACEEF2F653
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 07:32:08 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id k30so15269002edk.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 07:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+AFexh2zgEl0TUS1BpdjvCEcYJ2S40IdgLkQGQ1nAyg=;
        b=DdMEbA8mazmcWoOmd4X7+rwrMU50Nl2RouFMQWjq5AiJRuD9yqY6W1v6xCMAvP/QpS
         LmGz2dVeW88jXWmqFwOAHUuC17oH51eq2VPRdGjihxZAV2ny33uDXEMAUntg/XZPlJKJ
         BiZG8CUBuOCysVTKexYbDpLXlIvQxYszmSUn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+AFexh2zgEl0TUS1BpdjvCEcYJ2S40IdgLkQGQ1nAyg=;
        b=sY182q9NamsFtJtvbWLfDI3d6Rb9eJslJ2FEZFErZeCs4+ngZpZ/8Rjp6zmBwsPS1o
         567AuglCtvxSJOzsBOFYdEp/9tsgZZe2jiCe2Myq+iS0cE9SNlJCZCZCKGTRmAeru1mH
         0gxSb3foKBtsKpv3rexbzS4Zmr5aEXMdiNVg+Hw5oVHX6X0rcLT+Bou9fG/x2Pa4bv0P
         l2m8P2nczh5+RI+Grvl4kKKdtXCzuI6kuEI79eWmWrqnL3u+7UcEfYIbCLs6o8ZuuW3Y
         3+ycgdPu/1UlY7xcuJb24kKblYTSnLu3ACOycDAZmG4fcelB3aRLbQcD18uo443fvxCV
         +OwA==
X-Gm-Message-State: AJIora+VJUxQ+kAfGFfWySPn5pz+kAmWDOCYi3xXFIYJYu8aFJendqI+
        QTDMZJ5ZjOKX9J5AMzI2JuMRh5M8GVX9ceVBIc4=
X-Google-Smtp-Source: AGRyM1tMNVxT47Nq+5I20A4aADu45Rkfxm7IEgjSnjqHE177F3HbAeNCQdSbZtsfwoVTrNsw0+AHnA==
X-Received: by 2002:a05:6402:4387:b0:435:94c6:716d with SMTP id o7-20020a056402438700b0043594c6716dmr63120040edc.298.1657204326965;
        Thu, 07 Jul 2022 07:32:06 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id k27-20020a17090632db00b0072ab06bc3b5sm7413089ejk.34.2022.07.07.07.32.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 07:32:05 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id v14so26614705wra.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 07:32:05 -0700 (PDT)
X-Received: by 2002:adf:ead2:0:b0:21d:8b49:6138 with SMTP id
 o18-20020adfead2000000b0021d8b496138mr1190056wrn.138.1657204325372; Thu, 07
 Jul 2022 07:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220707075151.67335-1-krzysztof.kozlowski@linaro.org> <20220707075151.67335-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707075151.67335-2-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 7 Jul 2022 07:31:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WcUNLrVST5h0ED9ScpJDiaNoVc2hE-FcOCJGD7zxY-Ww@mail.gmail.com>
Message-ID: <CAD=FV=WcUNLrVST5h0ED9ScpJDiaNoVc2hE-FcOCJGD7zxY-Ww@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: mmc: sdhci-msm: fix reg-names entries
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 7, 2022 at 1:04 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Bindings before conversion to DT schema expected reg-names without
> "_mem" suffix.  This was used by older DTS files and by the MSM SDHCI
> driver.
>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Fixes: edfbf8c307ff ("dt-bindings: mmc: sdhci-msm: Fix issues in yaml bindings")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/mmc/sdhci-msm.yaml    | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
