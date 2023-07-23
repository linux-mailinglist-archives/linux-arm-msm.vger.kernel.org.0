Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41C6275E3D9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jul 2023 18:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbjGWQ3Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Jul 2023 12:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjGWQ3K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Jul 2023 12:29:10 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A2DD10D7;
        Sun, 23 Jul 2023 09:28:47 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6B2053EBD9;
        Sun, 23 Jul 2023 18:28:40 +0200 (CEST)
Date:   Sun, 23 Jul 2023 18:28:38 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: msm8976: Fix smsm ipc bit shifts
Message-ID: <x2674ff4qgimlw4swothcvau73oqhphqrap6nmb6atpj2dnhya@ep6co23rj2ez>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>, 
        Adam Skladowski <a39.skl@gmail.com>, phone-devel@vger.kernel.org, 
        ~postmarketos/upstreaming@lists.sr.ht, Bjorn Andersson <andersson@kernel.org>, 
        Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
        Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
        Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
        Conor Dooley <conor+dt@kernel.org>, 
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230723140712.9438-1-a39.skl@gmail.com>
 <20230723140712.9438-8-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230723140712.9438-8-a39.skl@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-07-23 16:06:54, Adam Skladowski wrote:
> Update bits to match downstream irq-bitmask values.
> Fixes: 0484d3ce0902 ("arm64: dts: qcom: Add DTS for MSM8976 and MSM8956 SoCs")
> 

This whitespace should be the other way around.  And Fixes: patches
should typically be at the beginning of the series to show that they do
are independent of the rest of the series.

> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8976.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> index 7385d5edec04..5537ec049451 100644
> --- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> @@ -433,9 +433,9 @@ smsm {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -		qcom,ipc-1 = <&apcs 8 12>;
> +		qcom,ipc-1 = <&apcs 8 13>;

This now overlaps with smp2p-modem which also has 13, but should be 14
according to my downstream 8956 sources:

    qcom,irq-bitmask = <0x4000>;

>  		qcom,ipc-2 = <&apcs 8 9>;
> -		qcom,ipc-3 = <&apcs 8 18>;
> +		qcom,ipc-3 = <&apcs 8 19>;

And for wcnss the smp2p-wcnss node in mainline currently has 17 but that
mask (0x20000) is used downstream for smd-wcnss; smp2p-wcnss downstream
has 0x40000 equalling a shift of 18.  Perhaps more apcs ipc references
need to be fixed before this is complete?

- Marijn

>  
>  		apps_smsm: apps@0 {
>  			reg = <0>;
> -- 
> 2.41.0
> 
