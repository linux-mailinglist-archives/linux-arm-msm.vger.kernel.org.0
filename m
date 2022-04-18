Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8808504C55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 07:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbiDRFfB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 01:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233708AbiDRFfA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 01:35:00 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E3413E12
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Apr 2022 22:32:22 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id z11-20020a4a9c8b000000b00328fdb15e4aso2349521ooj.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Apr 2022 22:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2n1IYTlj53blplS6LFG3VZvmnjl4fg6dH+NSs+G8dQ4=;
        b=OSAdQ8/lBvHefkLQ0BiIWsC5mxjiT+LCEK5Yo7cdMdJtFg4BoOjtnyhoaeZhU/REnj
         GfirY72Q5DzgthlCFrEv6D6jXRlntZnM/bw8Toxe5qWrqzKYmvZPWFzCFxKxZp7vJ+nh
         4BoLg5k7JC2ZL0f0L3ah2daskEuIaYLK8l0zlBD4eUU9yGNv7s8Y753alJbeuaoP1ap8
         /mW84BnxIerx+DfY3lyEVIxGBOaFBNytAjj+l+J6RzmY/zYiv7UAMLZ0P/pVPpkbSObT
         9gW0BbbCKlgGFhQr6hjjSkF98vvFQsMkEh+SsMdnIZ/qL1JH/0Uehi+hZ5VdoMsEY1M9
         aqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2n1IYTlj53blplS6LFG3VZvmnjl4fg6dH+NSs+G8dQ4=;
        b=dPe0R0JB4g5QIBiIELc1ZI2yjw+aYat7I5pY/1w0YR+ZCAT838vm8bAqualZ+Q1MMe
         +Jrta0EqNCeo2webx3rBCp65A5rrQiQ5t+cAK6Oa6K7K6toVM9siHQ4j31xatmg7lYhl
         XJ49xRb9rbCV/txdRyGBzFwGKP1x2HdvvoLV2OCP+DmkEyqu7Q0B90sG+VqMz89Ea513
         HjV/FZM44vsfDsjMW9zOLHfm6wr24gnFpAzMEkrYGtVZdPe9rrSPeY62PGWrYXCHaOTD
         KGgHLvWNR5CqFUQZAoqLmDHdg9Qnz8xG7KdMZsNwQ4NgffSGOfVLTmBMHLcn75pHQHIj
         nQzg==
X-Gm-Message-State: AOAM533Pf5EcEFlER6d/0F9FrLde/LXNmbk8b5sRO8Wikht4zI8/AEXE
        r2QI0cnAuwS+FIqEW+Gb1ppMacTrYTOvdhTnoXWD9A==
X-Google-Smtp-Source: ABdhPJz477nHi0AARqt5yRs8j661CLlpDBupUxnPd4HHI4R1NeB+O8RICaTBFKTAq7pLH2SrAGIAUHn+ypMURZ5l0uM=
X-Received: by 2002:a4a:d74a:0:b0:33a:2e4d:1b85 with SMTP id
 h10-20020a4ad74a000000b0033a2e4d1b85mr2305470oot.7.1650259941947; Sun, 17 Apr
 2022 22:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220417210436.6203-1-singh.kuldeep87k@gmail.com> <20220417210436.6203-4-singh.kuldeep87k@gmail.com>
In-Reply-To: <20220417210436.6203-4-singh.kuldeep87k@gmail.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 18 Apr 2022 11:02:11 +0530
Message-ID: <CAH=2Nty6gTX-u1LZZ_g3FZfpkX2CaV3Gh+R8DJODuh4489nCyw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: msm8996: User generic node name
 for DMA
To:     Kuldeep Singh <singh.kuldeep87k@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Kuldeep,

On Mon, 18 Apr 2022 at 02:34, Kuldeep Singh <singh.kuldeep87k@gmail.com> wrote:
>
> Qcom BAM DT spec expects generic DMA controller node name as
> "dma-controller" to enable validations.

This is already fixed with in-flight patch
<https://lore.kernel.org/lkml/20220211214941.f55q5yksittut3ep@amazon.com/T/#mb84230b9b8e06544859ccf5e16a7651fac79c933>

Thanks,
Bhupesh

> Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> v3: Add Krzysztof R-b tag
> ---
> v2: No change
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index b9a48cfd760f..c4cfab92a44e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -707,7 +707,7 @@ tsens1: thermal-sensor@4ad000 {
>                         #thermal-sensor-cells = <1>;
>                 };
>
> -               cryptobam: dma@644000 {
> +               cryptobam: dma-controller@644000 {
>                         compatible = "qcom,bam-v1.7.0";
>                         reg = <0x00644000 0x24000>;
>                         interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
> --
> 2.25.1
>
