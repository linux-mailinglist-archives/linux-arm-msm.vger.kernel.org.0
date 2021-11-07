Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA6E447624
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Nov 2021 22:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235642AbhKGWCZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 Nov 2021 17:02:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235100AbhKGWCY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 Nov 2021 17:02:24 -0500
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7245EC061570;
        Sun,  7 Nov 2021 13:59:41 -0800 (PST)
Received: from [192.168.1.222] (adsl-d210.84-47-0.t-com.sk [84.47.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 42BA53EC75;
        Sun,  7 Nov 2021 22:59:34 +0100 (CET)
Date:   Sun, 07 Nov 2021 22:59:28 +0100
From:   Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sdm660-xiaomi-lavender: Enable
 Simple Framebuffer
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
        paul.bouchara@somainline.org,
        angelogioacchino.delregno@somainline.org
Message-Id: <4F282R.RHJ19SO89IMI3@somainline.org>
In-Reply-To: <20211107195511.3346734-7-danct12@riseup.net>
References: <20211107195511.3346734-1-danct12@riseup.net>
        <20211107195511.3346734-7-danct12@riseup.net>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Martin Botka <martin.botka@somainline.org>

On Mon, Nov 8 2021 at 02:55:10 AM +0700, Dang Huynh 
<danct12@riseup.net> wrote:
> This lets the user sees the framebuffer console.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>  .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 19 
> +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts 
> b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index 30e564927cd7..d6599881f1ac 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -23,7 +23,21 @@ aliases {
>  	};
> 
>  	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
>  		stdout-path = "serial0:115200n8";
> +
> +		framebuffer0: framebuffer@9d400000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0x9d400000 0 (1080 * 2340 * 4)>;
> +			width = <1080>;
> +			height = <2340>;
> +			stride = <(1080 * 4)>;
> +			format = "a8r8g8b8";
> +			status= "okay";
> +		};
>  	};
> 
>  	vph_pwr: vph-pwr-regulator {
> @@ -64,6 +78,11 @@ ramoops@a0000000 {
>  			ftrace-size = <0x0>;
>  			pmsg-size = <0x20000>;
>  		};
> +
> +		cont_splash_mem: cont-splash-region@9d400000 {
> +			reg = <0x0 0x9d400000 0x0 0x23ff000>;
> +			no-map;
> +		};
>  	};
>  };
> 
> --
> 2.33.1
> 


