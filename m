Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D09237877C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 20:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232705AbjHXSZg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 14:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242856AbjHXSZG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 14:25:06 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7D451BE3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 11:25:04 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2bcb0b973a5so1099281fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 11:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692901501; x=1693506301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/Mw3uUaqPoZdHXDrYU5kYEb/nl7KslWn6Q8+skWzGw=;
        b=MAPXpC3XXJuutTIGA8JXHAZRaCzMPURSVzm7XDE3igzC5fvNMXANXVZhSeFEgx1tXB
         /ZHEr5yNi74wkiQ9frzrfRfjBW65C7+MXV1wWiXfRDvfGyXGm/tna6t1ucLsKwG9HpMD
         ULnxg6S/fo6waN3HGOZqDqM4WuIvfGS2NqYz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692901501; x=1693506301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/Mw3uUaqPoZdHXDrYU5kYEb/nl7KslWn6Q8+skWzGw=;
        b=RJwgm8tKyUyAfqMrCLaeXGVhHbP0ycfLTAawAtNErkTHdGgxVYaE8iSAq4y8gwJBp5
         eGp0KzuNEloRfWk2o1QjFWVM86TyWwoE7i+r5qNc2jlpag3xYbLrNiW1hpbLkP0m7mdr
         Q6SSDMUxFfIDgIsC54tjYwcQ12yhxAxzLVbTzdS4tlW17Q33qeL8eaIWLLQ8WIMAa9pD
         dCIJjC2Lhi0Ya4wLukKl9xQju9hF6CFDqD+CMfd9Yl5a7pboFbaUsIk2ind/QjtxOjPR
         Mkq0cmgmiTCHR2mWZx1VFzVxOe2QJHZLdjI6hPwriCclh8qgy2DJXld/MjEKfim+MKM2
         avgg==
X-Gm-Message-State: AOJu0YySzNoYQ6po6O5gV52Dh1Apq5IsECE34mPxvxRgsXZ4JpV4mWWS
        4MEGPq6i2rGna2oNX+mh0YKANN73iVbPjy1iUmr2QTei
X-Google-Smtp-Source: AGHT+IFhXvd9KUVubeFfJAhKh0oZahFRYW1GbNTTEOVS7EDEVgIGCpBpueh+d99wuJ5o1/387SrXmw==
X-Received: by 2002:a2e:b16a:0:b0:2b9:daa4:f4b6 with SMTP id a10-20020a2eb16a000000b002b9daa4f4b6mr11559370ljm.45.1692901501284;
        Thu, 24 Aug 2023 11:25:01 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id rp6-20020a170906d96600b0098e2eaec395sm11275612ejb.130.2023.08.24.11.25.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 11:25:00 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4009fdc224dso12875e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 11:25:00 -0700 (PDT)
X-Received: by 2002:a05:600c:1d0b:b0:3fe:cd3a:ef92 with SMTP id
 l11-20020a05600c1d0b00b003fecd3aef92mr18742wms.6.1692901500113; Thu, 24 Aug
 2023 11:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230823222741.89584-1-david@ixit.cz> <20230823222741.89584-2-david@ixit.cz>
In-Reply-To: <20230823222741.89584-2-david@ixit.cz>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 24 Aug 2023 11:24:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WaW5jKwXDTvyXjy45PSWu8LoT0LxYKM_mZAH3LxZPwrQ@mail.gmail.com>
Message-ID: <CAD=FV=WaW5jKwXDTvyXjy45PSWu8LoT0LxYKM_mZAH3LxZPwrQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845: cheza doesn't support LMh node
To:     David Heidelberg <david@ixit.cz>
Cc:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 23, 2023 at 3:28=E2=80=AFPM David Heidelberg <david@ixit.cz> wr=
ote:
>
> Cheza firmware doesn't allow controlling LMh from the operating system.
>
> Fixes: 36c6581214c4 ("arm64: dts: qcom: sdm845: Add support for LMh node"=
)
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot=
/dts/qcom/sdm845-cheza.dtsi
> index d86b0d112110..8cc8fc290fd3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -143,6 +143,10 @@ panel_in_edp: endpoint {
>         };
>  };
>
> +&cpufreq_hw {
> +       /delete-property/ interrupts-extended; /* reference to lmh_cluste=
r[01] */
> +};
> +
>  &psci {
>         /delete-node/ power-domain-cpu0;
>         /delete-node/ power-domain-cpu1;
> @@ -275,6 +279,14 @@ &BIG_CPU_SLEEP_1
>                            &CLUSTER_SLEEP_0>;
>  };
>
> +&lmh_cluster0 {
> +       status =3D "disabled";
> +};
> +
> +&lmh_cluster1 {
> +       status =3D "disabled";
> +};

It's not a huge deal to me, but as I understand it usually you'd put
the "disabled" in sdm845.dtsi and then it would be up to all the other
sdm845 boards to mark this as "okay".


>  /*
>   * Reserved memory changes
>   *
> @@ -338,6 +350,8 @@ flash@0 {
>
>
>  &apps_rsc {
> +       /delete-property/ power-domains;
> +

Is the deletion of the "power-domains" here related to LMh? That seems
like it was added to sdm845.dtsi in a separate commit that doesn't
talk about LMh at all...

-Doug
