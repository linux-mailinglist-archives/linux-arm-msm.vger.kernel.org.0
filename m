Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4BF62F31F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 12:01:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235171AbiKRLBZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 06:01:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234664AbiKRLBX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 06:01:23 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD0F9151E
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 03:01:22 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-39451671bdfso20793027b3.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 03:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ovobe2fmhyuPYDoklkU2etCcFH2NxQp5RSdNIJe8b60=;
        b=raJdBwpGpiE+WuVHI+SLApMrpyXB/zkijj4DZV+Yc4lCCvMmxDhF19eVHQR+Jt9Abj
         nFtdPjd4HPDBIPoHN/QHaZ7g70gPEyrL9OjoVW7nJBPtAQF0/05idVala0tCsDvZtwq6
         mn9wn5TApuPWvDNAc3qb4xx6t5fFWt7QCO8UqOvP3z/hvTRJVJe2RfpQIc4IdOrtCKk1
         NpBz0t55cfja3K6wcUpDI87MW9Jhsz8kU7dboIWfGmoZmAndw3cuOajSKy4+hRm9nrGm
         0fIzjHB0nbzG0nSx9fI4VdbSKuzVNA98fsWidV3gLpMDYdPhikkbbo/7OTXQ6sL5p3jk
         Y+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ovobe2fmhyuPYDoklkU2etCcFH2NxQp5RSdNIJe8b60=;
        b=UsrHNTFhtLZyxTpcCBTUVSABZaGKOo6Ye8JYEcTO3FLkLUO7c/hKGEg4gpZIp1lXQc
         P7RS019vaHNWW/Adxs9AfNHGhI9UkO6bPcq5S8YZFFS+fqRqJmOTUzPLXubC2bYOYxcx
         caBjAD1n0sAZsC99B6aiIrHzxGdRmiuJs3P5XcE7UyPDL6iGRE0nGrUIVAAlzXHGtIZW
         vOlsN6Dd6caHUGyPKPik/oEq4bb/Vo3mnYsQGABoddT5MJCj3nKeD5YPsjnQM32PQ2VS
         rdt8W1ATImdM8ePsEm7g6/AC2mmzvIHDhhcBFm8cZJbYY5rnpdaFaUum1lts7/OLZfoI
         dfhw==
X-Gm-Message-State: ANoB5pkib1UqKYuMJWJJijPeRJOVHQ/3UjJArCio7huAcJng5NR/Fdmw
        9LQ0gTEuRZSEb1uyogEOBzBXkSfC1nMQDS6CvulF7w==
X-Google-Smtp-Source: AA0mqf5JTyZRxJWSp9nZNeFD4B5joGQXfKxY0vIOKubrYnUYC6PwJW0ADwQKqfVPCvXfPacDmoHvfB03MLfTPf0+K8k=
X-Received: by 2002:a0d:f846:0:b0:37b:e3ae:decc with SMTP id
 i67-20020a0df846000000b0037be3aedeccmr6063826ywf.418.1668769281590; Fri, 18
 Nov 2022 03:01:21 -0800 (PST)
MIME-Version: 1.0
References: <1668725369-6331-1-git-send-email-quic_khsieh@quicinc.com> <1668725369-6331-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1668725369-6331-2-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 18 Nov 2022 13:01:10 +0200
Message-ID: <CAA8EJppjMK=SNbnir4QGgVJ5we1UGjrrvG6KJFgcSfRVZZm8sw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: add data-lanes and
 link-freuencies into dp_out endpoint
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org,
        quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 18 Nov 2022 at 00:50, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Add both data-lanes and link-frequencies property to dp_out endpoint.

Bindings update?
Deprecate the old data-lanes property?

> Also set link-frequencies to 810000 khz at herobrine platform to have
> max link rate limited at 810000 khz (HBR3).

No. As  I stated before, the link-frequencies should list all
supported frequencies (min/max in case the frequencies are
continuous).
Stating just maximum is against the property description.

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   |  9 ++++++++-
>  arch/arm64/boot/dts/qcom/sc7180.dtsi           |  5 -----
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 10 +++++++++-
>  arch/arm64/boot/dts/qcom/sc7280.dtsi           |  5 -----
>  4 files changed, 17 insertions(+), 12 deletions(-)
>

[skipped the sc7180 here. All comments noted against sc7280 apply to
sc7180 too].

> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index 93e39fc..e8fca18 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -440,7 +440,15 @@ ap_i2c_tpm: &i2c14 {
>         status = "okay";
>         pinctrl-names = "default";
>         pinctrl-0 = <&dp_hot_plug_det>;
> -       data-lanes = <0 1>;
> +       ports {
> +               port@1 {
> +                       reg = <1>;
> +                       dp_out: endpoint {
> +                               data-lanes = <0 1>;
> +                               link-frequencies=<810000>;

Following the existing examples is nice. Not following them is frowned upon.

> +                       };
> +               };
> +       };

Just:

&dp_out {
    data-lanes = <0  1>;
    link-frequencies = /bits/ 64 <160000000 270000000 540000000 810000000>;
};

>  };
>
>  &mdss_mdp {
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index a646405..4afe53b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3899,11 +3899,6 @@
>                                                         remote-endpoint = <&dpu_intf0_out>;
>                                                 };
>                                         };
> -
> -                                       port@1 {
> -                                               reg = <1>;
> -                                               dp_out: endpoint { };
> -                                       };

Please leave it here. It is a part of the SoC, so it should be in SoC dtsi.

>                                 };
>
>                                 dp_opp_table: opp-table {

-- 
With best wishes
Dmitry
