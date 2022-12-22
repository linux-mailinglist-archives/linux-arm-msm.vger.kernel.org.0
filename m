Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71EDB654633
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 19:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235039AbiLVSya (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 13:54:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235519AbiLVSyN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 13:54:13 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34BA827153
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 10:53:30 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id m18so7006889eji.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 10:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcsqGPg6FZAoLHqSnlhY2ZqAO977IJDvTdbEOzXS1SA=;
        b=AamEj6mQ2MbxRL2eTQGNKqmtoyHbk3rHDzkRcFN6JuRLM98nQ/XJwAS2oV1KzfiTG3
         KASKWAosayh8tChJjITyM7qtpCbQmvCZoGsUz6zA82x+iqbXvIjaRSr/hoBQRO7TVY2g
         ahPYr09u+OlpS6QVItdO9QwhJ3xF09lfs9xGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcsqGPg6FZAoLHqSnlhY2ZqAO977IJDvTdbEOzXS1SA=;
        b=fHvfPIGnp8RMOWxLga9D0aaJzXV1PyLFwysiC6XwEBTj3l9seYzGKgWPJhc+crzShV
         ScoEq2rexP1Pe6bT8XkJeoUd2VRqSDWWUTPwk5UqCAoNfTe3tmolyfHfKxWoymJu5CqH
         KAz2+3hiPtO+xJyTXUcUxnELRbceycTRYrQEDM+PLorkbxhFxRetyrJf4smIBdkjRdy2
         QgzFkL0dbpIMdCsgCZZdagL0W41cmzlDi9SG2TDY2hcqmG7N9miIbSDwZEUIsbyoGWUT
         avBIMOx7KU5dR9r0mwmHsG4fMaL6R7pyv3hMYq1xZxO1KMkKMmhZo06ciGURib4XoHS9
         ilpg==
X-Gm-Message-State: AFqh2kr9irHqlIBSkbYGD67y5GUgRSAjlP2U7iAVgR3YNweQye2Otkf8
        cmJOW6KakXw2iXRtSlFaIPttcwVmzJuZJfPTy8g=
X-Google-Smtp-Source: AMrXdXuBWtyQMX8kJq9eRhHyASuTXFx6gLBb4v+zdas/HzyzaBTGXus4nPRPvstzzubA9WLkftL56A==
X-Received: by 2002:a17:907:8dcb:b0:840:c37d:b5e4 with SMTP id tg11-20020a1709078dcb00b00840c37db5e4mr6008388ejc.16.1671735208597;
        Thu, 22 Dec 2022 10:53:28 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id o17-20020a1709062e9100b007bd9e683639sm520045eji.130.2022.12.22.10.53.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 10:53:27 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id ay40so2105416wmb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 10:53:27 -0800 (PST)
X-Received: by 2002:a05:600c:4aa8:b0:3d0:69f4:d3d0 with SMTP id
 b40-20020a05600c4aa800b003d069f4d3d0mr298494wmp.93.1671735207659; Thu, 22 Dec
 2022 10:53:27 -0800 (PST)
MIME-Version: 1.0
References: <20221222151319.122398-1-krzysztof.kozlowski@linaro.org> <20221222151319.122398-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221222151319.122398-3-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 22 Dec 2022 10:53:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WWPe9bBP2z6Q3GOaGr-5U9conGq4d8obwVCxQtZ7rAUw@mail.gmail.com>
Message-ID: <CAD=FV=WWPe9bBP2z6Q3GOaGr-5U9conGq4d8obwVCxQtZ7rAUw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: sdm845: align TLMM pin
 configuration with DT schema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Caleb Connolly <caleb@connolly.tech>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Dec 22, 2022 at 7:13 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> DT schema expects TLMM pin configuration nodes to be named with
> '-state' suffix and their optional children with '-pins' suffix.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Cc: Doug Anderson <dianders@chromium.org>
>
> Tested on Qualcomm RB3. Please kndly test a bit more on other devices.
> This should not have an functional impact.
>
> Changes since v3:
> 1. db845c: drop qup_uart3_default override and use qup_uart3_4pin
>    (Doug).
>
> Changes since v2:
> 1. Bring back UART6 4-pin bias/drive strength to DTSI.
>
> Changes since v1:
> 1. Address comments and implement conclusion with Doug.  Drop
>    default-pins/pinmux/mux/config nodes but instead add subnodes for
>    specific pins for UARTs.  This should match approach used for SC7180.
>
> v1: https://lore.kernel.org/linux-kernel/1b9dcca8-1abd-99a3-da12-a8763bf77f12@linaro.org/
> ---
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    | 397 ++++------
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  93 +--
>  .../arm64/boot/dts/qcom/sdm845-lg-common.dtsi |  60 +-
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts |   2 +-
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |  77 +-
>  .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 101 +--
>  .../boot/dts/qcom/sdm845-shift-axolotl.dts    | 150 ++--
>  .../dts/qcom/sdm845-sony-xperia-tama.dtsi     |   6 +-
>  .../qcom/sdm845-xiaomi-beryllium-common.dtsi  |  12 +-
>  .../boot/dts/qcom/sdm845-xiaomi-polaris.dts   |  21 +-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          | 689 ++++++++----------
>  .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |  53 +-
>  .../boot/dts/qcom/sdm850-samsung-w737.dts     | 121 +--
>  13 files changed, 701 insertions(+), 1081 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
