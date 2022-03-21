Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A85CB4E31C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Mar 2022 21:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352255AbiCUUbo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Mar 2022 16:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbiCUUbn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Mar 2022 16:31:43 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4501F7CB05
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 13:30:17 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id b188so17493782oia.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 13:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=SVEe7hUZOZ574KT711GyJJUr8pqUU3sbXrrP/FH6lUQ=;
        b=HgN8E2bzL5A2bOlDz55Mv25/tt/RKwL9jSNjt40u/m04w3/7P+7g9c1HkyBvlAeQfV
         2dhF+CnMi7h+Hj27pLjB7vrt+MzJ33fr0SD0TfhrIdKlbvJbV3XL81l38mZBlmlSDQYN
         U405VmvwgH/ui0st6tSGtygKgfRSLlo87paTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=SVEe7hUZOZ574KT711GyJJUr8pqUU3sbXrrP/FH6lUQ=;
        b=GjefIE2BFJvtxXVPKSZ+Espj9ViOrj8yfElE1kobQsRqugg0ZZKteJRggHym4I6Nwe
         HLmwgslFe4bDi60InMNbeSneHm6j5k1LHDw2pCvGsePw+fX/oQEDp8DeUtcXz3sPZ1dj
         E3CwZUoIUqiwPExt7v74mydeN90ZA+smD5Evx/9uQus0QGh6o/x718DmWtA8Sz3FfyLX
         CRCrOcnLIOazW9bJdzfHmK5nOLXYoMX1D6LkSIX3jL394bkDL3U++4TabmbbLMcSgttx
         +ATaEU+j0M7bcRiIH5Mj0bj9GUxR/HYinATJw5Y7qoEZr+fQD0o+P+Df2t0zFUtS8mpt
         LcoQ==
X-Gm-Message-State: AOAM532Tsy9EsMgPDGJa+SdgLK1wWWb5zVT2amr0UFPRDe72ZDLSVHWm
        pCb0ZRfN41Cjry9JjpY825O8NA3DGbFENMBFKyQ4ttvt+zs=
X-Google-Smtp-Source: ABdhPJy+w/ls2aSZCJrRsAdMrUWPb6dkwdIyuIvulQVig3ErIeGd57xFdDTojd0oyBT5QVRYIJdm9YWYMeqLFjZcwKg=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr428878oie.193.1647894616632; Mon, 21
 Mar 2022 13:30:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Mar 2022 21:30:16 +0100
MIME-Version: 1.0
In-Reply-To: <1647863959-3289-3-git-send-email-quic_srivasam@quicinc.com>
References: <1647863959-3289-1-git-send-email-quic_srivasam@quicinc.com> <1647863959-3289-3-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 21 Mar 2022 21:30:16 +0100
Message-ID: <CAE-0n5131FQaejVVHKwW9ZnoGM+uy6+jjJZMkh5Pa82=r5ojuQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: sc7280: Add pinmux for I2S
 speaker and Headset
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-03-21 04:59:18)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 688fa95..4a7b18a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -462,7 +462,28 @@
>         drive-strength = <10>;
>  };
>
> +&sec_mi2s_data0 {
> +       drive-strength = <6>;
> +       bias-disable;
> +};
> +
> +&sec_mi2s_sclk {
> +       drive-strength = <6>;
> +       bias-disable;
> +};
> +
> +&sec_mi2s_ws {
> +       drive-strength = <6>;
> +};
> +
>  &tlmm {
> +       amp_en: amp-en {
> +               pins = "gpio63";
> +               function = "gpio";

I'm pretty sure 'function = "gpio"' isn't needed. When a gpio is
requested with gpio functions it gets muxed to gpio function
automatically. See commit 1de7ddb3a15c ("pinctrl: msm: Mux out gpio
function with gpio_request()").

> +               bias-pull-down;
> +               drive-strength = <2>;
> +       };
> +
>         bt_en: bt-en {
>                 pins = "gpio85";
>                 function = "gpio";
