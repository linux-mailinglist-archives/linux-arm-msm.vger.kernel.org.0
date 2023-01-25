Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4EBC67BF44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 22:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235264AbjAYVxG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 16:53:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235426AbjAYVxB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 16:53:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699E6303EF;
        Wed, 25 Jan 2023 13:53:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0421561637;
        Wed, 25 Jan 2023 21:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B65C433D2;
        Wed, 25 Jan 2023 21:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674683579;
        bh=wUjtr+V2TuEnm/Ca5P/4pz8VkGEV2RfOl5N3c/o8Dg4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BQu2Yr0rWjvt4vFer7wSHwq6AQKphUq1sNLRhtmHnpdBx7Kav63oivXBZMyvk+RCa
         2VyYyqSsdgyO6JiDPuFqDnVj4PlVNvQKtTcAT8ZHa1fdPL9ofC9yNT3uOurReE89n+
         twk4rcQrqFefhMY88OQWNWb84TMcphA/+a/qQoyS7N/8qFg7QnFTUmQrv8c9EmTtsx
         tfNuEZ9Wv2BKefgIh2EROX3aqYHYzRfIhgznFlZjjjpOeeR3O1b7IB032HMYTeBp/x
         w+ufK7U9ZlsPWjSC7H13v8ql+I8kNjdn3Ji2shpBJbzJnqsRgHS0U3kzZkkXscrGP8
         ut9p4VaqRcN3A==
Message-ID: <2a576f3a4495800e9e9681fbf1e6b948.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230111060402.1168726-13-dmitry.baryshkov@linaro.org>
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org> <20230111060402.1168726-13-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 12/12] ARM: dts: qcom: apq8084: add clocks and clock-names to gcc device
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Wed, 25 Jan 2023 13:52:57 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-01-10 22:04:02)
> diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom=
-apq8084.dtsi
> index 4b0d2b4f4b6a..4d01f0f2292e 100644
> --- a/arch/arm/boot/dts/qcom-apq8084.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
> @@ -388,6 +388,24 @@ gcc: clock-controller@fc400000 {
>                         #reset-cells =3D <1>;
>                         #power-domain-cells =3D <1>;
>                         reg =3D <0xfc400000 0x4000>;
> +                       clocks =3D <&xo_board>,
> +                                <&sleep_clk>,
> +                                <0>, /* ufs */
> +                                <0>,
> +                                <0>,
> +                                <0>,
> +                                <0>, /* sata */
> +                                <0>,
> +                                <0>; /* pcie */
> +                       clock-names =3D "xo",

It just uses xo_board again though, so it's a no-op until someone
decides to change this to the RPM provided XO clk.
