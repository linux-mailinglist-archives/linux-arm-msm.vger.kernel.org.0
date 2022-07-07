Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6906756A57E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 16:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235765AbiGGOd7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 10:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235640AbiGGOd6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 10:33:58 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763B12B61F
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 07:33:55 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id r6so11974858edd.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 07:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Qaml/77EQfjVhTCPwJZGqOZHtYBkRsro8IPW1LDth0=;
        b=nGfPTVAksZnzIOYm3NKGz8gMMXNR8VQHECNNmE3N0p4ZtbshAnhr3JQ4+Fisy6PmVw
         DRHRkgubLyYcUlKfxZq/e8nSnXjAtIKNR3YM3AT3ODuVedDkx5EZ0mPt9QtVzWFQFaSO
         y1eXzyiTvypdbAAfNwawa+5t2TnhAqO0Z6WLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Qaml/77EQfjVhTCPwJZGqOZHtYBkRsro8IPW1LDth0=;
        b=gYikoOa9W3V+RC0VcQc2U+ZajDJBIihaWKsK+LQprq/lErsBl5hqVaJD0zTaoDcSer
         BRHTxW4C4bFOiixtkwm3g4G2MtqKu3Hq0jIQoDf1KWpR3zgpKKX0tDO1S58XA2bm8ppg
         soAbSKXehR2hWKDw44n1ss8SZTPCpJtZF94h0nEA1bOZTqsddER/uH41jEYx7yHOHsRP
         tavs3vbdmPVRYxwUR+3zA4AdvJLcTBaBsrhppW8UdfpVnZAxaOZIM+GDypZrUmmG/5MC
         /kdbT4FB4KXbbQ5syKn2Ur9SQFKtvCkCLRT2umFB+fbIcxSctHGFyr7Vm5IUJeVqpsgN
         PH7A==
X-Gm-Message-State: AJIora9PDfDonNx7Sm0xQrWTDivdwWIhW+VtBUw1f5O04kAMfZ1vwgW2
        H5u7G2vOSnoQUEip9uLVfdlTOTQpODkKgeKBakg=
X-Google-Smtp-Source: AGRyM1uNQtEHDIuoeMj2BluvEKKibFYGeCjr0p8uWI8S365CQHnTxJRSGWeTSz+BCMKYIPNv4gjBzg==
X-Received: by 2002:a05:6402:26d5:b0:435:aba2:9495 with SMTP id x21-20020a05640226d500b00435aba29495mr62791031edd.133.1657204433487;
        Thu, 07 Jul 2022 07:33:53 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id h16-20020a056402095000b0043a56c0ededsm9516379edz.74.2022.07.07.07.33.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 07:33:52 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id n185so10760492wmn.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 07:33:52 -0700 (PDT)
X-Received: by 2002:a05:600c:2049:b0:3a0:536b:c01b with SMTP id
 p9-20020a05600c204900b003a0536bc01bmr4978327wmg.151.1657204431600; Thu, 07
 Jul 2022 07:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220707075151.67335-1-krzysztof.kozlowski@linaro.org> <20220707075151.67335-5-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707075151.67335-5-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 7 Jul 2022 07:33:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W2d_TCqr+YHV0ep=4o9eqLY7YvF8Khxm2Vsi3uG11nPg@mail.gmail.com>
Message-ID: <CAD=FV=W2d_TCqr+YHV0ep=4o9eqLY7YvF8Khxm2Vsi3uG11nPg@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: align SDHCI reg-names with DT schema
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
> DT schema requires SDHCI reg names to be hc/core without "_mem" suffix,
> just like TXT bindings were expecting before the conversion.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++--
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 4 ++--
>  arch/arm64/boot/dts/qcom/msm8994.dtsi | 4 ++--
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
>  6 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
