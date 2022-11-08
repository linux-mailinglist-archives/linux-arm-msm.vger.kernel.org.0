Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A396B6204A6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 01:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232408AbiKHAYY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 19:24:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbiKHAYX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 19:24:23 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA0FF6432
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 16:24:22 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id bj12so34424655ejb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 16:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5MkQztElB6TBdZbZej/oORtZzWsfAyi0xB0CiV9UFEI=;
        b=dVe12lYAU0SpAJWVx0uFcqp08jjA3Nhr9V6bc7LC/oCcDrD3Hh/bCv/34I+pspFOqT
         5mx3a0rT8zyNldmpRxc+zAeUD4LZ0sogf18nIlBYBrqr4HI6kylHMbPhwS5c6RBfGFA4
         k9uW76Jj3u+2jSGqDZlRvdJYbM20B+5TVERtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5MkQztElB6TBdZbZej/oORtZzWsfAyi0xB0CiV9UFEI=;
        b=CKG/KPzrqSd5RqkeM10coZx2U4A/EswOlyHZlR4kloGgIhMyi//4K25RYzCnKP14bt
         /zR+Os+5+Z3muwbUNtNsPsxAjke8T1KHdakSlobmpwxERpF+yBXij4Hp2XOQEiRF8soW
         F+egoN57WwYSFQtgk1VyNgluThgYBo4TTCM/3EOrA5aK66bn26nec6ijoA7vDZyEeIzs
         T3XKOdNfSaQ4xaDP7yUZ7kvYImTusUR6cf9hpHcUKN6hT8GHgModB1pMU1cahVLawYZe
         0OVrVtwoQYXwL9xu9sAaharHIn0a05gdwTPsGzhlq+MVdbQ2l12jfnON/9ydgC6clboB
         p2gg==
X-Gm-Message-State: ACrzQf0oRrj19GnrX5uSdzOcRp4Fsp86YFVwbxqeDlkmc9Aw1tw9IsE5
        QwQPXb98Rvr2WQepoiVawua/gQjLIGrMaSsd
X-Google-Smtp-Source: AMsMyM7Vi8ri8eU196eOQRNSdpkriJSTjR6L/OprbpWntPL9zzInvbtsBEEx/XSsQ2ebC8UncpIh7w==
X-Received: by 2002:a17:907:968d:b0:7a8:3bf6:4bd2 with SMTP id hd13-20020a170907968d00b007a83bf64bd2mr51654744ejc.673.1667867060815;
        Mon, 07 Nov 2022 16:24:20 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id cf20-20020a170906b2d400b007389c5a45f0sm4026760ejb.148.2022.11.07.16.24.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 16:24:19 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id y16so18525800wrt.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 16:24:18 -0800 (PST)
X-Received: by 2002:adf:d1ec:0:b0:236:880f:2adf with SMTP id
 g12-20020adfd1ec000000b00236880f2adfmr33865581wrd.617.1667867058306; Mon, 07
 Nov 2022 16:24:18 -0800 (PST)
MIME-Version: 1.0
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org> <20221107235654.1769462-14-bryan.odonoghue@linaro.org>
In-Reply-To: <20221107235654.1769462-14-bryan.odonoghue@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 7 Nov 2022 16:24:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XZ79JjmCW7wYoc0eEhMsAtqxb+p40x2f4mH+kdb0byow@mail.gmail.com>
Message-ID: <CAD=FV=XZ79JjmCW7wYoc0eEhMsAtqxb+p40x2f4mH+kdb0byow@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] arm64: dts: qcom: sc7180: Add compat qcom,mdss-dsi-ctrl-sc7180
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, quic_mkrishn@quicinc.com,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
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

On Mon, Nov 7, 2022 at 3:57 PM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Add silicon specific compatible qcom,mdss-dsi-ctrl-sc7180 to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for sc7180 against the yaml documentation.
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
> Cc: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index d2c374e9d8c03..07acb7f843d62 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2985,7 +2985,8 @@ opp-460000000 {
>                         };
>
>                         dsi0: dsi@ae94000 {
> -                               compatible = "qcom,mdss-dsi-ctrl";
> +                               compatible = "qcom,mdss-dsi-ctrl-sc7180",
> +                                            "qcom,mdss-dsi-ctrl";

This seems fine, but I don't think it matches your bindings. Your
bindings says you can have one compatible string. It could be
"qcom,mdss-dsi-ctrl-sc7180" or it could be "qcom,mdss-dsi-ctrl".
...but your device tree has two compatible strings: the SoC specific
one and the fallback one. You need to change your bindings to make
this work.

-Doug
