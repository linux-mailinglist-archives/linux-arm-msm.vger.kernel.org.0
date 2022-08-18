Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D166598FA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Aug 2022 23:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239324AbiHRVeG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Aug 2022 17:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232083AbiHRVeF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Aug 2022 17:34:05 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABDC986729
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 14:34:04 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id kb8so5579338ejc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 14:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=qErRFIQ0nHVnmKdsLBSakvXDlQR0goAZInCyznmckxY=;
        b=hn7koqt0JXqitWaXAGRzTAAniDctUWCyarxNwwp0EBoRHiVHG2Z8guogWJs3qdpLxM
         sLC4QzABjP6CVSwvyA2aTXNBT3wYYecTtJy3D2wo/pb8fEjaHShM3tJj1Pj1pW70lTL9
         diCnHQTdiwzzzyzVdV2SmaYpPJuGyKUjY310Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=qErRFIQ0nHVnmKdsLBSakvXDlQR0goAZInCyznmckxY=;
        b=SdRqb5Zfie+SGbSVPPH+BwWhr8s1tZFofkVaWYbLhQSG3C6qoxsKCc6YeP9HtOgtg5
         W33qf56pAPHahzS8dJXILSqpgVl+BIi1SIi98eCukS5500Xku8+6O+b9KX/G0WxZQIX9
         dNH5EAITJp6OWSSUERvoQXvD/18JybWd91JBKyu8Kt9V9bPW4J0yQbh/PG4zEFDhuUye
         emwGjyO0+U+lcIwptej1pwmJQ9MLxjMWopPO8at33fmFgZFZ6upvdgWaCwLX6Q5h2Rui
         +ca9mPXZMj5T9WDgjF8SRKvBa1OC5shPFOFrSnspowJaEAs5guiHaygy2AB6hvsXES/j
         IzuQ==
X-Gm-Message-State: ACgBeo2TZT3uA9CnFI8AzIXqV3ADsmjcySK7ifkBDqZg2jGbr7qcGPY8
        5UIcJKcZOrWxmnoOKe8N9RMgqMHPbfXGwiW/
X-Google-Smtp-Source: AA6agR4nEIyy5YWN3CAJyNlMJTqf0wo15SBotaPuyxR74YLFnYc+zGSqHN/Uvsd7yOcFLFpool9Nug==
X-Received: by 2002:a17:907:7205:b0:739:1735:8b9a with SMTP id dr5-20020a170907720500b0073917358b9amr2923912ejc.244.1660858443050;
        Thu, 18 Aug 2022 14:34:03 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id h17-20020a056402095100b0044629b54b00sm724615edz.46.2022.08.18.14.34.01
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 14:34:01 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id bd26-20020a05600c1f1a00b003a5e82a6474so1589040wmb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 14:34:01 -0700 (PDT)
X-Received: by 2002:a05:600c:5114:b0:3a6:1ab9:5b3d with SMTP id
 o20-20020a05600c511400b003a61ab95b3dmr2859717wms.93.1660858441222; Thu, 18
 Aug 2022 14:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220816093644.764259-1-judyhsiao@chromium.org>
In-Reply-To: <20220816093644.764259-1-judyhsiao@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Aug 2022 14:33:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XLsBcbrjb0DwG+Yhia_hk4kcKT2S0_vMT=k3cWxh=NRg@mail.gmail.com>
Message-ID: <CAD=FV=XLsBcbrjb0DwG+Yhia_hk4kcKT2S0_vMT=k3cWxh=NRg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Use "PP1800_L2C" as the DMIC
 power source.
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Judy Hsiao <judyhsiao@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 16, 2022 at 2:36 AM Judy Hsiao <judyhsiao@chromium.org> wrote:
>
> Use "PP1800_L2C" as the DMIC power source to match the hardware
> schematic.
> It fixes the DMIC no sound issue of villager-r1.
>
>
> Co-developed-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
> Changes since V1:
>     -- Update the commit message.
>
>
> This patch depends on:
> arm64: dts: qcom: sc7280: Add herobrine-villager-r1. [1]
>
> [1]
> https://patchwork.kernel.org/patch/12926099/
>
>
>  .../dts/qcom/sc7280-herobrine-villager-r1.dts | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
> index c03b3ae4de50..983defa7c76d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
> @@ -12,3 +12,31 @@ / {
>         model = "Google Villager (rev1+)";
>         compatible = "google,villager", "qcom,sc7280";
>  };
> +
> +&lpass_va_macro {
> +       vdd-micb-supply = <&pp1800_l2c>;
> +};
> +
> +&sound {
> +       audio-routing =
> +                       "IN1_HPHL", "HPHL_OUT",
> +                       "IN2_HPHR", "HPHR_OUT",
> +                       "AMIC1", "MIC BIAS1",
> +                       "AMIC2", "MIC BIAS2",
> +                       "VA DMIC0", "vdd-micb",
> +                       "VA DMIC1", "vdd-micb",
> +                       "VA DMIC2", "vdd-micb",
> +                       "VA DMIC3", "vdd-micb",
> +                       "TX SWR_ADC0", "ADC1_OUTPUT",
> +                       "TX SWR_ADC1", "ADC2_OUTPUT",
> +                       "TX SWR_ADC2", "ADC3_OUTPUT",
> +                       "TX SWR_DMIC0", "DMIC1_OUTPUT",
> +                       "TX SWR_DMIC1", "DMIC2_OUTPUT",
> +                       "TX SWR_DMIC2", "DMIC3_OUTPUT",
> +                       "TX SWR_DMIC3", "DMIC4_OUTPUT",
> +                       "TX SWR_DMIC4", "DMIC5_OUTPUT",
> +                       "TX SWR_DMIC5", "DMIC6_OUTPUT",
> +                       "TX SWR_DMIC6", "DMIC7_OUTPUT",
> +                       "TX SWR_DMIC7", "DMIC8_OUTPUT";

In v1, Stephen pointed out that the subject and description of your
patch talk about adjusting the supply. However, your patch _also_
adjusts the audio routing.

It feels like the audio routing should be done in a separate patch and
that patch.

-Doug
