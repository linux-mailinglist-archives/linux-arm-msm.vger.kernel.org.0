Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B820F150EA9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 18:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgBCRfE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 12:35:04 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37549 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727930AbgBCRfE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 12:35:04 -0500
Received: by mail-pf1-f193.google.com with SMTP id p14so7936050pfn.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 09:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/2GnHgYEod44KNh5O907qr0Dr3tZt31Xm1Pio0+BUtU=;
        b=T3/dlEbss69QCdMNMPoph/AGjrLOJywnCDQUDC2crHYwLXIj8gbLjE1Mhh/0AS4Q5i
         1AN7ohRk8xc5mWmOgUpM/XP9ETNjwFHjATcQYoN/y6IcTcbeIIKbLoOOtplCNuIlIw6C
         lt1Al/0QHs4pwiYD+e5S5S6DGygimX8cRV8E3qtmVn0c98qAteldebnd1oAOpSZWRLfg
         X4hvg2OAdCgQIqlJrR5SZ3IxW3t0aZSQGeM7PWTCFvoCLYqq0Cq4KzyCL5katLBoLA+4
         hc+utViSzEbgLYkXa9iZmRJ+ZawjFNhlcJ0L48IDNx6YU3dp1OVy3uPvyrzXLMKfamqU
         h+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/2GnHgYEod44KNh5O907qr0Dr3tZt31Xm1Pio0+BUtU=;
        b=WK3BSO6LJQw2TR33IQyzL3yhueRD/u0ALM9QxP0AAbZ8Txnkn5yHqnyRUuPjHh4wXM
         JXn8/THSWEWxhQwAyn1QPWU4X2NnKapZl8LiAzM39ptutG8EJdK3PwcKaeD6dsP0ypTj
         4LoRz+bESzcllpLC57oRYco463BinbsRC5pwJgXNkMIvvHEASPg/OWkJx5cP3nifbQiZ
         JvwxnUeGPWDTW4Pxd/dy/IDeI4hPwoXgJEeW4rg8hwbqLBMMGQFNoFGkzLAX/4Zz4Sc6
         JLM5nx4ct8JFNHVdHQLSPW0uShegeFpYZ+xi3vRRj4TvsdHfUow3XUgTZnKawv1vgvOc
         LX+w==
X-Gm-Message-State: APjAAAUYG65WCi5GL15xtTEP3mFQ97PdsCOVXN6Jy/eyIERfLQUq1gRX
        5XTZ0xle6Sa7TR3kzZRE0vWczQ==
X-Google-Smtp-Source: APXvYqwHjAZO5+aiba+vTO0oc2CApTMEtmAA4xfo4oGHCw/dpaiKyNl42GAFhoYlHtXUvoagPsmxZg==
X-Received: by 2002:a63:7e58:: with SMTP id o24mr25705879pgn.214.1580751302915;
        Mon, 03 Feb 2020 09:35:02 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s18sm700055pgn.34.2020.02.03.09.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 09:35:02 -0800 (PST)
Date:   Mon, 3 Feb 2020 09:35:00 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
 device node
Message-ID: <20200203173500.GB3948@builder>
References: <1580281223-2759-1-git-send-email-pillair@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1580281223-2759-1-git-send-email-pillair@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 28 Jan 23:00 PST 2020, Rakesh Pillai wrote:

> Add device node for the ath10k SNOC platform driver probe
> and add resources required for WCN3990 on sc7180 soc.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  5 +++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 28 ++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 388f50a..167f68ac 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -287,6 +287,11 @@
>  	vdda-pll-supply = <&vreg_l4a_0p8>;
>  };
>  
> +&wifi {
> +	status = "okay";
> +	qcom,msa-fixed-perm;
> +};
> +
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>  
>  &qspi_clk {
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 8011c5f..0a00c94 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -75,6 +75,12 @@
>  			reg = <0x0 0x80900000 0x0 0x200000>;
>  			no-map;
>  		};
> +
> +		wlan_fw_mem: memory@93900000 {
> +			compatible = "removed-dma-pool";

Sorry for not spotting this earlier, the "removed-dma-pool" compatible
is a downstream thing and isn't defined upstream.

> +                     no-map;
> +                     reg = <0 0x93900000 0 0x200000>;

If you swap the order of no-map and reg in this node it will look like
all the others.


Apart from that the patch looks good.

Regards,
Bjorn

> +		};
>  	};
>  
>  	cpus {
> @@ -1490,6 +1496,28 @@
>  
>  			#freq-domain-cells = <1>;
>  		};
> +
> +		wifi: wifi@18800000 {
> +			compatible = "qcom,wcn3990-wifi";
> +			reg = <0 0x18800000 0 0x800000>;
> +			reg-names = "membase";
> +			iommus = <&apps_smmu 0xc0 0x1>;
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
> +			status = "disabled";
> +		};
>  	};
>  
>  	thermal-zones {
> -- 
> 2.7.4
> 
