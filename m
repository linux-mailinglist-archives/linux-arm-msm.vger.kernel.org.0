Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D12A14C0D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 20:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgA1TUa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 14:20:30 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42953 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgA1TU3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 14:20:29 -0500
Received: by mail-pl1-f193.google.com with SMTP id p9so5490225plk.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2020 11:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LYew2jkDUlCfpmqi8UqP0MWvgK08mQLJ5QipcXk94Nw=;
        b=glPmxTzfm4zSXwo1RsCFH9zx4U29Qc+s6KSPIHJMi2jbjXSMEVSOjw0/UqU4VnHzPM
         eohNZW//0zQfzufKpO9a95QWtX13bd8YVoMKRF0gJwmWRB051bfN23hlNI0paEW/h/AG
         eOHU3WiH0S/gbabgW+QPPE8OkyF1OiL7OokTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LYew2jkDUlCfpmqi8UqP0MWvgK08mQLJ5QipcXk94Nw=;
        b=mv7mgJ1lRcxnxf4MHZWVIDv2aY29vhvh5qYk/sAx3NZ3Qh5FV6GyN+POweSIGGH4tt
         cOa3rvsis6Wr1JxZfujRYJifxNE+G29618hqA8JZ/hCBCjco3TLZNWlSkzsBkqd9A2lu
         G1vGQnVtz2ltUIR2/xJ2nQitmgDymUeUAjc35DYlBtJYfLCT3gaoeIZe9H+7447ciVt8
         K8Rh19IIhOieG+6FlMpZ85d7DyHclmXIn7puf84iIyEPcUc0TIrY2kayAZsi5grmgKgA
         n0g/So/9y6hQs8mJN/m8OPZBvxaPtx+ip9NFe1KCVP5ghOo832tIceA2/cp9iZukfORr
         rZfg==
X-Gm-Message-State: APjAAAVaA3rIPiuhLo1PWQDTsC8GHT1Ydq/oKW27+nI//6mwyLqq4Iel
        UcB80S6+BqsKD3jXlCyO4PyxNQ==
X-Google-Smtp-Source: APXvYqxkt5ByEhDoG7VUZvlRrj1lUICrxMnGZlHApMda1UlKyNQiei8yE1/b5ej/6G+z0l1bn2aQzA==
X-Received: by 2002:a17:90a:191:: with SMTP id 17mr6579887pjc.88.1580239229274;
        Tue, 28 Jan 2020 11:20:29 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id l37sm3886086pjb.15.2020.01.28.11.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 11:20:28 -0800 (PST)
Date:   Tue, 28 Jan 2020 11:20:27 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
 device node
Message-ID: <20200128192027.GB46072@google.com>
References: <1580207617-818-1-git-send-email-pillair@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1580207617-818-1-git-send-email-pillair@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rakesh,

On Tue, Jan 28, 2020 at 04:03:37PM +0530, Rakesh Pillai wrote:
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
> index 189254f..151b489 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -248,6 +248,11 @@
>  	status = "okay";
>  };
>  
> +&wifi {
> +	status = "okay";
> +	qcom,msa-fixed-perm;
> +};
> +
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>  
>  &qup_i2c2_default {
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 666e9b9..7efb97f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -42,6 +42,12 @@
>  			compatible = "qcom,cmd-db";
>  			no-map;
>  		};
> +
> +		wlan_fw_mem: memory@93900000 {
> +			compatible = "removed-dma-pool";
> +			no-map;
> +			reg = <0 0x93900000 0 0x200000>;
> +		};
>  	};

This part doesn't apply cleanly on qcom/for-next, looks like you have to
rebase.

>  	cpus {
> @@ -1119,6 +1125,28 @@
>  				#clock-cells = <1>;
>  			};
>  		};
> +
> +		wifi: wifi@18800000 {

You added this node at the end of the file, outside of the 'soc' node.
It should be inside the 'soc' node, the sub-nodes are ordered by address,
so (currently) this node should be inserted after 'cpufreq@18323000'.

> +			compatible = "qcom,wcn3990-wifi";
> +			reg = <0 0x18800000 0 0x800000>;
> +			reg-names = "membase";
> +			iommus = <&apps_smmu 0xC0 0x1>;

nit: the convention is to use lowercase characters for hex adresses.

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

not sure these 'CEx' comments after each interrupt add much value. What does
'CE' stand for in the first place?

Thanks

Matthias
