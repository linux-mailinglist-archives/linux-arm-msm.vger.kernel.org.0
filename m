Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4552849A818
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jan 2022 05:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244110AbiAYCzs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jan 2022 21:55:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348778AbiAXUTX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jan 2022 15:19:23 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F3FEC014F19
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 11:38:57 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id q186so27171995oih.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 11:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=kwkbTwrBzC5jE9f2nafUwAahS6VU0ATjJ7MFCgX616c=;
        b=mWzdzA6qhipKU0Y435He/wNbJHmgEgP9OP8ykZrxXsJZKtUyYKTa7HDaY/sn7/3hw/
         t4JkQkLEWBIXqUzmazVAIkbKn2Pq2GhSbf5eHq211Qwc0uXY8RLYXjjyKX5W2LC+pqQZ
         2QA1rTJe5w1qbfpd9/fp2/IL7+zE8+duxtWtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=kwkbTwrBzC5jE9f2nafUwAahS6VU0ATjJ7MFCgX616c=;
        b=HULwdsYZUes+yy/XrWwtoegQTQ+TL4JNK6eyXn7xyWyOoK+SN+SGW0ZFT1krzS3aws
         uEpqkVjrwwk0MldeGNTDomss//eXH6rZTByCtXDAf53LFOHpVuaBiHXlyb4WGIQE6PVI
         3raqbIj4Whp8QYWWr39vDHDFQnQZrmaXsEYs3h7XNnUw+acUegYKzskdaghQ9ijVfAAK
         thhHNffgSE77K8SpAOyH82RUJ6FieaZg5JD2jMWh2E4iWAaoNNc55Dcob8Z2a8FHFR82
         Y639BJkgpwaCYi0E73pCxis879ms4DaIAiu7ESSEoA8lz4J3eEyQwdBtn/URWbqwSFrg
         IJlQ==
X-Gm-Message-State: AOAM530KqfXNX88UNPUQabiTXktgbHTRoTW74JiI1rSl8lir7RCGY2Vc
        UJK9pawe+4stX6qZb6O8OPinOvsZPElNR4yWTRGJmQ==
X-Google-Smtp-Source: ABdhPJwiCnqu6yM4uv/PV0S4Qz6YlQlrhPVpkOJMdAypGHgIGkKVo6c8u59L5EKFTyd32VvCZwg4u2QBBm+6bRT9OCc=
X-Received: by 2002:aca:f241:: with SMTP id q62mr2885361oih.64.1643053137039;
 Mon, 24 Jan 2022 11:38:57 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Jan 2022 11:38:56 -0800
MIME-Version: 1.0
In-Reply-To: <20220124165745.16277-1-tdas@codeaurora.org>
References: <20220124165745.16277-1-tdas@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 24 Jan 2022 11:38:56 -0800
Message-ID: <CAE-0n53pZG+LG8v35O6untzjn6H9dDOyrTX8Q4joHjcV3GAWSQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: sc7280: Add lpasscore & lpassaudio
 clock controllers
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2022-01-24 08:57:45)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 937c2e0e93eb..0aa834ce6b61 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -1744,6 +1746,47 @@
>                         #clock-cells = <1>;
>                 };
>
> +               lpass_audiocc: clock-controller@3300000 {
> +                       compatible = "qcom,sc7280-lpassaudiocc";
> +                       reg = <0  0x03300000 0 0x30000>;
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>,
> +                              <&lpass_aon LPASS_AON_CC_MAIN_RCG_CLK_SRC>;
> +                       clock-names = "bi_tcxo", "lpass_aon_cc_main_rcg_clk_src";
> +                       power-domains = <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
> +                       #clock-cells = <1>;
> +                       #power-domain-cells = <1>;
> +               };
> +
> +               lpass_aon: clock-controller@3380000 {
> +                       compatible = "qcom,sc7280-lpassaoncc";
> +                       reg = <0  0x03380000 0 0x30000>;
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>,
> +                              <&rpmhcc RPMH_CXO_CLK_A>,
> +                              <&lpasscc LPASS_CORE_CC_CORE_CLK>;
> +                       clock-names = "bi_tcxo", "bi_tcxo_ao", "iface";
> +                       #clock-cells = <1>;
> +                       #power-domain-cells = <1>;
> +               };
> +
> +               lpasscore: clock-controller@3900000 {
> +                       compatible = "qcom,sc7280-lpasscorecc";
> +                       reg = <0  0x03900000 0 0x50000>;

Nitpick: Why the extra space here? ^ Applies to all three above.

> +                       clocks =  <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names = "bi_tcxo";
> +                       power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>;
> +                       #clock-cells = <1>;
> +                       #power-domain-cells = <1>;
