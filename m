Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 985FE78C0F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 11:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234351AbjH2JEP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 05:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234478AbjH2JEA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 05:04:00 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B2BE199
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 02:03:56 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d77b9d574f8so3658770276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 02:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693299835; x=1693904635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p+ZNmjEjxE86+zHr2aM4Qt4cruP7Et/svaJRz0AMbWg=;
        b=rcQ9ECx38rhQokFt2AH2ewTka+Yb5TqXgpJOlw80lj8PtYDQqTjxUd0IgzfQ5t9YCG
         4oHVwhT6OMWblp/VB/vw1YBFxJCoa1yaCPh/FP9NQYwKJYdvCr24qaEmxoY3FZ/bNM+W
         ebHVFGS8qtHc4PAqUbbh8HctLN8z/VSe2vGjM1jL8VGrY6zipcbYXNvK+X2JRrzMI4fv
         JswfN4W3+Df1MsdBaA3EvQfwk11KipKHZkyjKGBYgerarQeE7ybFuakUAoeyrAA4KV62
         qHYbzb6G/M2qxgb8oNe4GqC+gOMNGcscPFF3rwrzalNyOS8DrGbHMEqVP5JwsHJFozn9
         QptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693299835; x=1693904635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+ZNmjEjxE86+zHr2aM4Qt4cruP7Et/svaJRz0AMbWg=;
        b=aCzAwLC5n3a11sXpCDjqIq4rcRKbzh+MNZiNadKQeh30PkxlIQypPvhG0QpGJJZqjV
         Pcba7+8oLI/IvHQeaeBYpcLp4AmbXxWBLTJVZRgRsaTFy4rkyjDPtmjpnULWtqiwGONB
         QUk4DeCU2n+00UV1zThCO5atifzJEsex4D0MXNLHXjhUYnGFwDZrze3J7eAV5PH9z2mn
         qDJaOBeVepSErU/0XfYiG4+vKg0IyTFJx/rfsjjBZKZLC2yukwjdga6ZnJdMeL5D/Z8p
         55JXR3u7Qtl3Cm7s3+rmjespKUk7FhYx/2mp3JGlM1mE/owwEYQoTkCCDBywzts0bPSw
         o+Aw==
X-Gm-Message-State: AOJu0YxgNbtFS8wxvsMxz23uHWyfCMuj9OgXZo7TNRn25p0eAkHqFIYF
        GN+o57LpFxnAIGDz8C9lO5gpf/F+BNUQDaMVvmmoxw==
X-Google-Smtp-Source: AGHT+IG2k6R8W1TqJClx4orl7tBoltRF/SpTbrp3tkWx6Trp8sCccdlZTHq8JN7w+YKrFr3F0zZRlq7sABwHwo6BNTM=
X-Received: by 2002:a25:ac0a:0:b0:d7b:7249:6dc2 with SMTP id
 w10-20020a25ac0a000000b00d7b72496dc2mr638855ybi.30.1693299835215; Tue, 29 Aug
 2023 02:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693296360.git.quic_varada@quicinc.com> <764b497e865a1e23676c9c3913e3a26dbcb0fc22.1693296360.git.quic_varada@quicinc.com>
In-Reply-To: <764b497e865a1e23676c9c3913e3a26dbcb0fc22.1693296360.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 29 Aug 2023 12:03:44 +0300
Message-ID: <CAA8EJpopJJdkxiy1pN3oZqZ4sqTAzyHLyB-1yUTi4TFja6kA-g@mail.gmail.com>
Subject: Re: [PATCH v10 3/4] arm64: dts: qcom: ipq5332: Enable USB
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
        geert+renesas@glider.be, nfraprado@collabora.com, rafal@milecki.pl,
        peng.fan@nxp.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 29 Aug 2023 at 11:39, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Enable USB2 in host mode.
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v10:
>         regulator_s0500 -> regulator-s0500
>         "make W=1 ARCH=arm64 -j 16 CHECK_DTBS=y DT_SCHEMA_FILES=qcom,ipq5332-usb-hsphy.yaml dtbs_check" passed
> v9:
>         regulator_fixed_5p0: s0500 -> regulator_fixed_5p0: regulator_s0500
>         "make ARCH=arm64 -j 16 CHECK_DTBS=y DT_SCHEMA_FILES=qcom,ipq5332-usb-hsphy.yaml dtbs_check" passed
> v6:
>         Add vdd-supply and corresponding regulator
> v1:
>         Enable usb-phy node
> ---
>  arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
> index f96b0c8..1fe2e39 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
> @@ -12,6 +12,15 @@
>  / {
>         model = "Qualcomm Technologies, Inc. IPQ5332 MI01.6";
>         compatible = "qcom,ipq5332-ap-mi01.6", "qcom,ipq5332";
> +
> +       regulator_fixed_5p0: regulator-s0500 {
> +               compatible = "regulator-fixed";
> +               regulator-min-microvolt = <500000>;
> +               regulator-max-microvolt = <500000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +               regulator-name = "fixed_5p0";
> +       };
>  };
>
>  &blsp1_spi0 {
> @@ -79,3 +88,17 @@
>                 bias-pull-up;
>         };
>  };
> +
> +&usbphy0 {
> +       vdd-supply = <&regulator_fixed_5p0>;
> +
> +       status = "okay";
> +};
> +
> +&usb {
> +       status = "okay";
> +};
> +
> +&usb2_0_dwc {
> +       dr_mode = "host";
> +};

This is not sorted properly. If we follow alphanumeric sorting order,
it should be:

- usb
- usb2_0_dwc
- usbphy0

> --
> 2.7.4
>


-- 
With best wishes
Dmitry
