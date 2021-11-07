Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8EA44761D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Nov 2021 22:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235531AbhKGV7U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 Nov 2021 16:59:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235287AbhKGV7U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 Nov 2021 16:59:20 -0500
X-Greylist: delayed 95861 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 07 Nov 2021 13:56:37 PST
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB0AC061570;
        Sun,  7 Nov 2021 13:56:36 -0800 (PST)
Received: from [192.168.1.222] (adsl-d210.84-47-0.t-com.sk [84.47.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 41D0F3EE1D;
        Sun,  7 Nov 2021 22:56:31 +0100 (CET)
Date:   Sun, 07 Nov 2021 22:56:25 +0100
From:   Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sdm660-xiaomi-lavender: Add volume
 down button
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
        paul.bouchara@somainline.org,
        angelogioacchino.delregno@somainline.org
Message-Id: <1A282R.T7ASQGLHW15A2@somainline.org>
In-Reply-To: <20211107195511.3346734-4-danct12@riseup.net>
References: <20211107195511.3346734-1-danct12@riseup.net>
        <20211107195511.3346734-4-danct12@riseup.net>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Martin Botka <martin.botka@somainline.org>

On Mon, Nov 8 2021 at 02:55:07 AM +0700, Dang Huynh 
<danct12@riseup.net> wrote:
> This enables the volume down key.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>  arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts 
> b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index 365a03b56cde..28408240735b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -51,6 +51,16 @@ &blsp1_uart2 {
>  	status = "okay";
>  };
> 
> +&pon {
> +	voldown {
> +		compatible = "qcom,pm8941-resin";
> +		interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> +		debounce = <15625>;
> +		bias-pull-up;
> +		linux,code = <KEY_VOLUMEDOWN>;
> +	};
> +};
> +
>  &rpm_requests {
>  	pm660l-regulators {
>  		compatible = "qcom,rpm-pm660l-regulators";
> --
> 2.33.1
> 


