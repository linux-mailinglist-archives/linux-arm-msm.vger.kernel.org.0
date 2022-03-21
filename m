Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4B2C4E31B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Mar 2022 21:26:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353330AbiCUU17 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Mar 2022 16:27:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353308AbiCUU1z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Mar 2022 16:27:55 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F07165BAA
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 13:26:29 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-d39f741b2bso64952fac.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 13:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=taGGw6FofrDBtg863EraXXBX2AFEQktzuZisXMbt1m4=;
        b=Sjv8nPGkQ9wOO76X9eqZVeXYPv5fgfvaAsJeozgl/xckR0NlSAO3HO9Zys0XN/ZgSr
         wnfaXZnZuDDk8C2PQJxSqeSIPvOflZMi4+pPTT586WrfBLEYLZs0eFOabMkPejm/tMVp
         yBzclX9et8LnF3XdHOKqh/wM9gxa5OlZi7f+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=taGGw6FofrDBtg863EraXXBX2AFEQktzuZisXMbt1m4=;
        b=Grr/I3dDLJyd6Sb958F5UNeBK9GUqkGbsm/xdJ6IN0pNqi7xNUW9cS1V/Dk7E+61qC
         0uhBr9kJhN6ECbork7pqp/+w1ks/L+HAthbfzFA0pNUpaimvnO8ifMKYVCaedC1uTHU0
         X7cBtgobuxf9Xfxn5C+ULCqheCCpPPfV6Yjv2i65WVgxt7Vi79q8vURorS3IvoBqHY+n
         OSRU7O/baRZoGHWVSd+IaFvcZOypf6Jz3cceR01DYPIr6/x7FKEqNOGThA9QoVF4QUYs
         hc/lUK7mMIHf4/zLQonvoS/uRSTs3jvdOMI9eXyBCqN74IGHPrcljhm0CpkXLcdy2sId
         q50A==
X-Gm-Message-State: AOAM531QhQQ2Zwrdb7aMtNfCp5X2GJdjPKNpf1HVOU5L0Tz58+/V2CI1
        qN3juG8tTiDn7q0mgMvepKkulsdzgZ7Kg1d5O1pApQ==
X-Google-Smtp-Source: ABdhPJz8HOZEVrIhWX7eSAQXVQnCmvsiRO0z81j0NHxZfPtMNjOYbIOcA/jpMSwp4ajyvemLspWs71EsYbEprbwEuuI=
X-Received: by 2002:a05:6870:b69c:b0:dd:b74b:4099 with SMTP id
 cy28-20020a056870b69c00b000ddb74b4099mr326223oab.193.1647894389066; Mon, 21
 Mar 2022 13:26:29 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Mar 2022 21:26:28 +0100
MIME-Version: 1.0
In-Reply-To: <1647863959-3289-4-git-send-email-quic_srivasam@quicinc.com>
References: <1647863959-3289-1-git-send-email-quic_srivasam@quicinc.com> <1647863959-3289-4-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 21 Mar 2022 21:26:28 +0100
Message-ID: <CAE-0n50xoWpd8S82W=xjbKBjqD-bgyMM8b539PV83=fHBQC7yw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sc7280: add lpass lpi pin
 controller node
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-03-21 04:59:19)
> Add LPASS LPI pinctrl node required for Audio functionality on sc7280
> based platforms.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 147 +++++++++++++++++++++++++++++++++++
>  1 file changed, 147 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 8d8cec5..499299a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -1987,6 +1987,153 @@
>                         qcom,bcm-voters = <&apps_bcm_voter>;
>                 };
>
> +               lpass_tlmm: pinctrl@33c0000 {
> +                       compatible = "qcom,sc7280-lpass-lpi-pinctrl";
> +                       reg = <0 0x33c0000 0x0 0x20000>,
> +                               <0 0x3550000 0x0 0x10000>;
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&lpass_tlmm 0 0 15>;
> +
> +                       #clock-cells = <1>;
> +
> +                       dmic01_active: dmic01-active {
> +                               clk {
> +                                       pins = "gpio6";
> +                                       function = "dmic1_clk";
> +                                       drive-strength = <8>;
> +                                       output-high;

The rule of thumb is that drive strength, output/input, and bias
properties should be in the board file, because the board layout decides
the drive strength, the output level could be inverted on the board, and
the biasing could be done externally (or not) via pullup/pulldowns on
the net. The gpio driver should be able to make pins into inputs
automatically when the gpio is requested and used so having input or
output is typically wrong and should be handled by the consumer driver.

> +                               };
> +
> +                               data {
> +                                       pins = "gpio7";
> +                                       function = "dmic1_data";

So in the end I'd expect to only see pins and function properties in the
SoC dtsi file.

> +                                       drive-strength = <8>;
> +                               };
> +                       };
> +
> +                       dmic01_sleep: dmic01-sleep {
> +                               clk {
> +                                       pins = "gpio6";
> +                                       function = "dmic1_clk";
