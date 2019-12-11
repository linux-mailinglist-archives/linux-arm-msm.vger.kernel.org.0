Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40ECD11A4FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 08:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbfLKHU5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 02:20:57 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37530 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbfLKHU5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 02:20:57 -0500
Received: by mail-pf1-f195.google.com with SMTP id p14so1344793pfn.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 23:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Zt7dD+G6CZ7JiW/OTyZRbi+QrgrCgEMr0EtbdbVOEvo=;
        b=iMahdVvUtYzRqHNMafgKcr6aoqiCK7vmp3iXqmihp+FGIvNpLfNq/m2YTqfRe+k0Nq
         kOgT74Udrg0WLXHns+nS0rhaInQiPaL9iouYgxrdAT5bAbwQwwHN7S42aW0rt0G1wpVs
         /PzhtlbQuD9V6KkI5xOMC+fLmXXzxU2ho0S1E2oQPsyEFtfcJcHC/MlIeQGN+c7/OaEP
         j+KfHH8baHU9oSpk3Qwwr3Y2ZIl0C0iSDFuYhCH9ASpnb4HysTH5LLb1HCrL+cuu5s09
         6X8ZfQDg/XjLZW35aWVypgrT6JPBCcSgHQctQRkYClbxNQ21QZSwiFPBs9bCmQwV34g3
         VOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Zt7dD+G6CZ7JiW/OTyZRbi+QrgrCgEMr0EtbdbVOEvo=;
        b=kSJ+CpMPhhcX8gfUJUaQfb8JTiczaOEISocvXtC7tQ54lnmgPJfGgKeXXhxigFfc+W
         UELrwuC9r16Vwg+VKegkKFBmkf68pIGVUIrJ2RMAFOar7lmKNYggacgGkzHoOXAp5iYB
         c758Y8NZqCKMMqZdjwMiEnev+yvpIeLn0C/gAWATu1IbdW8n71eVGvBjJo2TQqCrPDEX
         QaVdEjUYHW/tYZQnD7Uk3oUho/puoVc/PYegrtlacI+xhDuf4imWga4TlIb9BfntXAjg
         A7egAb92ZVLD/I3RjCjTgpOnKIgI5D1Oepg51k810GzIVyqgqJGuRlpB8WQeNaOezrEi
         TPDQ==
X-Gm-Message-State: APjAAAVATLceaZauP2mX+8YNraxx8z16QM4fPmnBVmMj25wHiP5Ea18C
        eomrwSo2FJGfh9QhbGULk6E/9Q==
X-Google-Smtp-Source: APXvYqw4cxozBp2uimntGWWy0jZ4dci8RUXiHQpPyTXnBRm14alWbArUZIe+OL2WJ+qkqlQdnpm8Ug==
X-Received: by 2002:a63:684a:: with SMTP id d71mr2442865pgc.27.1576048856072;
        Tue, 10 Dec 2019 23:20:56 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x4sm1496180pfx.68.2019.12.10.23.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 23:20:55 -0800 (PST)
Date:   Tue, 10 Dec 2019 23:20:53 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module device
 node
Message-ID: <20191211072053.GH3143381@builder>
References: <0101016ed018cde9-da3dc3e0-de6e-4b18-9add-bc6f88511ab2-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016ed018cde9-da3dc3e0-de6e-4b18-9add-bc6f88511ab2-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 04 Dec 00:48 PST 2019, Rakesh Pillai wrote:

> Add device node for the ath10k SNOC platform driver probe
> and add resources required for WCN3990 on sc7180 soc.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
> This change is dependent on the below set of changes
> arm64: dts: sc7180: Add qupv3_0 and qupv3_1 (https://lore.kernel.org/patchwork/patch/1150367/)

Why?

> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  4 ++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 27 +++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 189254f..8a6a760 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -248,6 +248,10 @@
>  	status = "okay";
>  };
>  
> +&wifi {
> +	status = "okay";

Please conclude on the representation of the "skip-hyp-mem-assign" and
add it here, rather than in a subsequent patch - which implies that this
patch doesn't work on its own.

> +};
> +
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>  
>  &qup_i2c2_default {
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 666e9b9..40c9971 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -42,6 +42,12 @@
>  			compatible = "qcom,cmd-db";
>  			no-map;
>  		};
> +
> +		wlan_fw_mem: wlan_fw_region@93900000 {

wlan_fw_mem: memory@93900000 {

> +			compatible = "removed-dma-pool";
> +			no-map;
> +			reg = <0 0x93900000 0 0x200000>;
> +		};
>  	};
>  
>  	cpus {
> @@ -1119,6 +1125,27 @@
>  				#clock-cells = <1>;
>  			};
>  		};
> +
> +		wifi: wifi@18800000 {
> +			status = "disabled";
> +			compatible = "qcom,wcn3990-wifi";
> +			reg = <0 0x18800000 0 0x800000>;
> +			reg-names = "membase";
> +			interrupts =
> +				<GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH /* CE0 */ >,
> +				<GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH /* CE1 */ >,
> +				<GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH /* CE2 */ >,
> +				<GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH /* CE3 */ >,
> +				<GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH /* CE4 */ >,
> +				<GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH /* CE5 */ >,
> +				<GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH /* CE6 */ >,
> +				<GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH /* CE7 */ >,
> +				<GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH /* CE8 */ >,
> +				<GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH /* CE9 */ >,
> +				<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH /* CE10 */>,
> +				<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH /* CE11 */>;
> +			memory-region = <&wlan_fw_mem>;

No iommus in sc7180?

Regards,
Bjorn

> +		};
>  	};
>  
>  	timer {
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
