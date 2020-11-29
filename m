Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 618822C7ACB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Nov 2020 19:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgK2SvG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Nov 2020 13:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgK2SvG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Nov 2020 13:51:06 -0500
Received: from the.earth.li (the.earth.li [IPv6:2a00:1098:86:4d:c0ff:ee:15:900d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC66C0613CF;
        Sun, 29 Nov 2020 10:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
         s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject
        :To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=5Jfo3N4CPw5QXSNiPzOE0gemf/JBa8/1Of1Vg9lT5cY=; b=GbcBMWJtVZI9Flj2LhpHAG1tz+
        EiWO6MydSplDvGW/IDrnTRB0MJWUL1IsJu48WcjyIgKvIx1db8upn+bMpboD/qgkcX0NgtuVBSxfo
        n1xJuwLwEWmZfXDU8Jb0dQWoOB1X+PN4MGa1EvVXDU4sjCkyRQ6aPdPMlwfh99s3W2FaOmXAyE8GM
        ebzSnxpGs9zR1D1YjBJxd5ecYeXHYVu3gdDBMifL2JZVprXdmtP5Uis/lA+XjT/XRJq9LnYLpQPwl
        8anFyl+fwTyL+DqjtxFhPWcW1/5fubrOuLAfSp5uRKtEt1+chxNmMD3UFFIU7y0FHquD/eI+TP6Zs
        txHm4C0w==;
Received: from noodles by the.earth.li with local (Exim 4.92)
        (envelope-from <noodles@earth.li>)
        id 1kjRmB-0001uB-15; Sun, 29 Nov 2020 18:50:23 +0000
Date:   Sun, 29 Nov 2020 18:50:23 +0000
From:   Jonathan McDowell <noodles@earth.li>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: add prng definition to ipq806x
Message-ID: <20201129185022.GT32650@earth.li>
References: <20200705142544.GA3389@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200705142544.GA3389@earth.li>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Gentle poke; did this just get missed or is there some reason not to
apply it?

On Sun, Jul 05, 2020 at 03:25:44PM +0100, Jonathan McDowell wrote:
> Add missing prng definition for ipq806x SoC
> 
> Signed-off-by: Jonathan McDowell <noodles@earth.li>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index b912da9a3ff3..22e0669b9133 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -386,6 +386,13 @@ gsbi7_serial: serial@16640000 {
>  			};
>  		};
>  
> +		rng@1a500000 {
> +			compatible = "qcom,prng";
> +			reg = <0x1a500000 0x200>;
> +			clocks = <&gcc PRNG_CLK>;
> +			clock-names = "core";
> +		};
> +
>  		sata_phy: sata-phy@1b400000 {
>  			compatible = "qcom,ipq806x-sata-phy";
>  			reg = <0x1b400000 0x200>;
> -- 
> 2.27.0
> 

J.

-- 
Revd Jonathan McDowell, ULC | Hail Eris. All hail Discordia. Fnord?
