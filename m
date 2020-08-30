Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0277256F82
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Aug 2020 19:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgH3Rc1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Aug 2020 13:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgH3RcZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Aug 2020 13:32:25 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45BD9C061573
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2020 10:32:23 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id u3so4205315qkd.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2020 10:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=00JR9ukFetlDnryUhIxM1v6G61MzZP/r+pghfvV9++A=;
        b=BGykhYTyPvB+uD7szX1YEBm6LQZLgg4diOk8Sv6QKeOx9WP+FCTpklmOLR0Ya+2/Wt
         DMtK1c0OZ9uaOwIEAwQXY2o7InrfBSH4Ai5uaNxh+DnSbUAqnQth2gP+Rhw7FeeoM9kJ
         ePnvBauh3KXQpebV0/VFHljmTeCGz+ZOusPPTbrDzyWsgsaBSNXEIYCWha3uR1Ptt2Qq
         ZjoAZdokH8819jhhu9Uy5e9SvV/LqpnCBNduxDiFQEkb05zCsifrWl1fO7JUEQ/Xr7MH
         HNxBzebid9AnG0M/sPXGS+qVfdAGBJ1AOcKlLdvloaQ/gzrhybhgxLgQQUPerinyySAw
         huiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=00JR9ukFetlDnryUhIxM1v6G61MzZP/r+pghfvV9++A=;
        b=QEI3+EehzfapEohgtyfc4IwD/tvZSEEJGUzt3OOEkCfuNkkLI+nV+EcGrvUN7s8gU9
         5D/CQmNHVxiCOTNlrGVRQ+hT4ssZGEh9gKTVKywLG6ZoICZerjU5jwNkSbjH5vWJNHW5
         ISUi/Z41IEDkFqEFc+iCAflDCYjJajY1OWAsgRGjOSIMT/9wwuV9PWfP49nY+DANGo1/
         oyDqnKD18pBv60nuOq6PbQf+RwjjzXsfySrmkD0uR8xHlC9UxMb3J5oxR1+g8L6rSvbU
         xZCCgW/PsGynKMTOFxsS31yNjDcWFB+PEUhOcpWrPIwjjUQX5aVVxFuCbg1qdnK4ptsd
         iIPQ==
X-Gm-Message-State: AOAM531/qr/9CZvDLy+fWk+60SxiF5qUexET5sxGIo0psWtV3Oygrd/h
        AbnJID+ZqyMfCZHLEOHHGqRycQ==
X-Google-Smtp-Source: ABdhPJxU+cKLj6LpEZnI2e1tgB94ZLJbV6TXFyIESt/We+KJUVvZok+vHtBg5KS9GJu+0mRr4Vl6aA==
X-Received: by 2002:a37:96c5:: with SMTP id y188mr7423607qkd.412.1598808742342;
        Sun, 30 Aug 2020 10:32:22 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id u41sm6847991qth.42.2020.08.30.10.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 10:32:21 -0700 (PDT)
Date:   Sun, 30 Aug 2020 17:32:19 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Adrian Schmutzler <freifunk@adrianschmutzler.de>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: replace status value "ok" by "okay"
Message-ID: <20200830173219.GA483@uller>
References: <20200817223214.62179-1-freifunk@adrianschmutzler.de>
 <20200817223214.62179-2-freifunk@adrianschmutzler.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817223214.62179-2-freifunk@adrianschmutzler.de>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 17 Aug 22:32 UTC 2020, Adrian Schmutzler wrote:

> While the DT parser recognizes "ok" as a valid value for the
> "status" property, it is actually mentioned nowhere. Use the
> proper value "okay" instead, as done in the majority of files
> already.
> 
> Signed-off-by: Adrian Schmutzler <freifunk@adrianschmutzler.de>

The content of this looks good Adrian.

But you're lacking most maintainers among the recipients of these
patches and I would expect if applied in the current form we will
have merge issues as the patches travels towards Linus' tree.

So please split it per vendor and ensure that the various maintainers
are copied (use ./scripts/get_maintainer.pl)

Thanks,
Bjorn

> ---
>  .../boot/dts/amd/amd-overdrive-rev-b0.dts     | 22 ++++++------
>  .../boot/dts/amd/amd-overdrive-rev-b1.dts     | 24 ++++++-------
>  arch/arm64/boot/dts/amd/amd-overdrive.dts     | 14 ++++----
>  arch/arm64/boot/dts/amd/husky.dts             | 20 +++++------
>  arch/arm64/boot/dts/apm/apm-merlin.dts        | 16 ++++-----
>  arch/arm64/boot/dts/apm/apm-mustang.dts       | 16 ++++-----
>  arch/arm64/boot/dts/apm/apm-storm.dtsi        | 12 +++----
>  .../dts/broadcom/stingray/bcm958742-base.dtsi |  2 +-
>  .../boot/dts/hisilicon/hi3660-hikey960.dts    |  6 ++--
>  .../boot/dts/hisilicon/hi3670-hikey970.dts    |  2 +-
>  .../arm64/boot/dts/hisilicon/hi6220-hikey.dts | 18 +++++-----
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi     |  2 +-
>  arch/arm64/boot/dts/hisilicon/hip05-d02.dts   |  6 ++--
>  arch/arm64/boot/dts/hisilicon/hip06-d03.dts   | 18 +++++-----
>  arch/arm64/boot/dts/hisilicon/hip07-d05.dts   | 20 +++++------
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     |  4 +--
>  arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts  |  6 ++--
>  arch/arm64/boot/dts/qcom/ipq8074-hk01.dts     | 34 +++++++++----------
>  arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts  |  2 +-
>  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi      | 12 +++----
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  2 +-
>  arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi  |  2 +-
>  .../dts/rockchip/rk3368-orion-r68-meta.dts    |  2 +-
>  arch/arm64/boot/dts/rockchip/rk3368-r88.dts   |  4 +--
>  24 files changed, 133 insertions(+), 133 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
> index 8e341be9a399..a77f19ac63cd 100644
> --- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
> +++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
> @@ -25,7 +25,7 @@
>  };
>  
>  &ccp0 {
> -	status = "ok";
> +	status = "okay";
>  	amd,zlib-support = <1>;
>  };
>  
> @@ -33,39 +33,39 @@
>   * NOTE: In Rev.B, gpio0 is reserved.
>   */
>  &gpio1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &gpio2 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &gpio3 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &gpio4 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &i2c0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &i2c1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &pcie0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &spi0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &spi1 {
> -	status = "ok";
> +	status = "okay";
>  	sdcard0: sdcard@0 {
>  		compatible = "mmc-spi-slot";
>  		reg = <0>;
> @@ -80,7 +80,7 @@
>  };
>  
>  &ipmi_kcs {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &smb0 {
> diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
> index 92cef05c6b74..09fc9c3ac60f 100644
> --- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
> +++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
> @@ -25,7 +25,7 @@
>  };
>  
>  &ccp0 {
> -	status = "ok";
> +	status = "okay";
>  	amd,zlib-support = <1>;
>  };
>  
> @@ -33,43 +33,43 @@
>   * NOTE: In Rev.B, gpio0 is reserved.
>   */
>  &gpio1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &gpio2 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &gpio3 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &gpio4 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &i2c0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &i2c1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &pcie0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &sata1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &spi0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &spi1 {
> -	status = "ok";
> +	status = "okay";
>  	sdcard0: sdcard@0 {
>  		compatible = "mmc-spi-slot";
>  		reg = <0>;
> @@ -84,7 +84,7 @@
>  };
>  
>  &ipmi_kcs {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &smb0 {
> diff --git a/arch/arm64/boot/dts/amd/amd-overdrive.dts b/arch/arm64/boot/dts/amd/amd-overdrive.dts
> index 41b3a6c0993d..56f27c71a15b 100644
> --- a/arch/arm64/boot/dts/amd/amd-overdrive.dts
> +++ b/arch/arm64/boot/dts/amd/amd-overdrive.dts
> @@ -19,31 +19,31 @@
>  };
>  
>  &ccp0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &gpio0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &gpio1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &i2c0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &pcie0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &spi0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &spi1 {
> -	status = "ok";
> +	status = "okay";
>  	sdcard0: sdcard@0 {
>  		compatible = "mmc-spi-slot";
>  		reg = <0>;
> diff --git a/arch/arm64/boot/dts/amd/husky.dts b/arch/arm64/boot/dts/amd/husky.dts
> index 7acde34772cb..f68c95fe0e90 100644
> --- a/arch/arm64/boot/dts/amd/husky.dts
> +++ b/arch/arm64/boot/dts/amd/husky.dts
> @@ -25,7 +25,7 @@
>  };
>  
>  &ccp0 {
> -	status = "ok";
> +	status = "okay";
>  	amd,zlib-support = <1>;
>  };
>  
> @@ -33,39 +33,39 @@
>   * NOTE: In Rev.B, gpio0 is reserved.
>   */
>  &gpio1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &gpio2 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &gpio3 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &gpio4 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &i2c0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &i2c1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &pcie0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &spi0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &spi1 {
> -	status = "ok";
> +	status = "okay";
>  	sdcard0: sdcard@0 {
>  		compatible = "mmc-spi-slot";
>  		reg = <0>;
> diff --git a/arch/arm64/boot/dts/apm/apm-merlin.dts b/arch/arm64/boot/dts/apm/apm-merlin.dts
> index 217d7728b63a..a538dd333f1a 100644
> --- a/arch/arm64/boot/dts/apm/apm-merlin.dts
> +++ b/arch/arm64/boot/dts/apm/apm-merlin.dts
> @@ -45,38 +45,38 @@
>  };
>  
>  &serial0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &sata1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &sata2 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &sata3 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &sgenet0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &xgenet1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &mmc0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &i2c4 {
>  	rtc68: rtc@68 {
>  		compatible = "dallas,ds1337";
>  		reg = <0x68>;
> -		status = "ok";
> +		status = "okay";
>  	};
>  };
>  
> diff --git a/arch/arm64/boot/dts/apm/apm-mustang.dts b/arch/arm64/boot/dts/apm/apm-mustang.dts
> index e927811ade28..f8d0f9926a4d 100644
> --- a/arch/arm64/boot/dts/apm/apm-mustang.dts
> +++ b/arch/arm64/boot/dts/apm/apm-mustang.dts
> @@ -45,36 +45,36 @@
>  };
>  
>  &pcie0clk {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &pcie0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &serial0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &menet {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &sgenet0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &sgenet1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &xgenet {
> -	status = "ok";
> +	status = "okay";
>  	rxlos-gpios = <&sbgpio 12 1>;
>  };
>  
>  &mmc0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &mdio {
> diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
> index 8c802d87e751..d8572f683367 100644
> --- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
> +++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
> @@ -270,7 +270,7 @@
>  				reg = <0x0 0x1f22c000 0x0 0x1000>;
>  				reg-names = "csr-reg";
>  				clock-output-names = "sataphy2clk";
> -				status = "ok";
> +				status = "okay";
>  				csr-offset = <0x4>;
>  				csr-mask = <0x3a>;
>  				enable-offset = <0x0>;
> @@ -284,7 +284,7 @@
>  				reg = <0x0 0x1f23c000 0x0 0x1000>;
>  				reg-names = "csr-reg";
>  				clock-output-names = "sataphy3clk";
> -				status = "ok";
> +				status = "okay";
>  				csr-offset = <0x4>;
>  				csr-mask = <0x3a>;
>  				enable-offset = <0x0>;
> @@ -864,7 +864,7 @@
>  			reg = <0x0 0x1f22a000 0x0 0x100>;
>  			#phy-cells = <1>;
>  			clocks = <&sataphy2clk 0>;
> -			status = "ok";
> +			status = "okay";
>  			apm,tx-boost-gain = <30 30 30 30 30 30>;
>  			apm,tx-eye-tuning = <1 10 10 2 10 10>;
>  		};
> @@ -874,7 +874,7 @@
>  			reg = <0x0 0x1f23a000 0x0 0x100>;
>  			#phy-cells = <1>;
>  			clocks = <&sataphy3clk 0>;
> -			status = "ok";
> +			status = "okay";
>  			apm,tx-boost-gain = <31 31 31 31 31 31>;
>  			apm,tx-eye-tuning = <2 10 10 2 10 10>;
>  		};
> @@ -903,7 +903,7 @@
>  			      <0x0 0x1f227000 0x0 0x1000>;
>  			interrupts = <0x0 0x87 0x4>;
>  			dma-coherent;
> -			status = "ok";
> +			status = "okay";
>  			clocks = <&sata23clk 0>;
>  			phys = <&phy2 0>;
>  			phy-names = "sata-phy";
> @@ -917,7 +917,7 @@
>  			      <0x0 0x1f23e000 0x0 0x1000>;
>  			interrupts = <0x0 0x88 0x4>;
>  			dma-coherent;
> -			status = "ok";
> +			status = "okay";
>  			clocks = <&sata45clk 0>;
>  			phys = <&phy3 0>;
>  			phy-names = "sata-phy";
> diff --git a/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi b/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
> index a9b92e52d50e..43aa5e9c0020 100644
> --- a/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
> @@ -151,7 +151,7 @@
>  };
>  
>  &nand {
> -	status = "ok";
> +	status = "okay";
>  	nandcs@0 {
>  		compatible = "brcm,nandcs";
>  		reg = <0>;
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> index c1b614dabb8e..963300eede17 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> @@ -530,7 +530,7 @@
>  	rt1711h: rt1711h@4e {
>  		compatible = "richtek,rt1711h";
>  		reg = <0x4e>;
> -		status = "ok";
> +		status = "okay";
>  		interrupt-parent = <&gpio27>;
>  		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
>  		pinctrl-names = "default";
> @@ -570,7 +570,7 @@
>  	};
>  
>  	adv7533: adv7533@39 {
> -		status = "ok";
> +		status = "okay";
>  		compatible = "adi,adv7533";
>  		reg = <0x39>;
>  		adi,dsi-lanes = <4>;
> @@ -656,7 +656,7 @@
>  		     &sdio_cfg_func>;
>  	/* WL_EN */
>  	vmmc-supply = <&wlan_en>;
> -	status = "ok";
> +	status = "okay";
>  
>  	wlcore: wlcore@2 {
>  		compatible = "ti,wl1837";
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts b/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
> index 7dac33d4fd5c..7f9f9886c349 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
> @@ -418,7 +418,7 @@
>  		     &sdio_cfg_func>;
>  	/* WL_EN */
>  	vmmc-supply = <&wlan_en>;
> -	status = "ok";
> +	status = "okay";
>  
>  	wlcore: wlcore@2 {
>  		compatible = "ti,wl1837";
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> index 533ed523888d..91d08673c02e 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> @@ -267,7 +267,7 @@
>  &uart1 {
>  	assigned-clocks = <&sys_ctrl HI6220_UART1_SRC>;
>  	assigned-clock-rates = <150000000>;
> -	status = "ok";
> +	status = "okay";
>  
>  	bluetooth {
>  		compatible = "ti,wl1835-st";
> @@ -278,21 +278,21 @@
>  };
>  
>  &uart2 {
> -	status = "ok";
> +	status = "okay";
>  	label = "LS-UART0";
>  };
>  
>  &uart3 {
> -	status = "ok";
> +	status = "okay";
>  	label = "LS-UART1";
>  };
>  
>  &ade {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &dsi {
> -	status = "ok";
> +	status = "okay";
>  
>  	ports {
>  		/* 1 for output port */
> @@ -489,17 +489,17 @@
>  
>  
>  &i2c0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &i2c1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &i2c2 {
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> -	status = "ok";
> +	status = "okay";
>  
>  	adv7533: adv7533@39 {
>  		compatible = "adi,adv7533";
> @@ -541,5 +541,5 @@
>  };
>  
>  &spi0 {
> -	status = "ok";
> +	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> index 3d189d9f0d24..3bab4bc6ff99 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> @@ -371,7 +371,7 @@
>  			clocks = <&sys_ctrl HI6220_EDMAC_ACLK>;
>  			dma-no-cci;
>  			dma-type = "hi6220_dma";
> -			status = "ok";
> +			status = "okay";
>  		};
>  
>  		dual_timer0: timer@f8008000 {
> diff --git a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
> index e93c65ede06c..369b69b17b91 100644
> --- a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
> @@ -42,15 +42,15 @@
>  };
>  
>  &uart0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &peri_gpio0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &lbc {
> -	status = "ok";
> +	status = "okay";
>  	#address-cells = <2>;
>  	#size-cells = <1>;
>  	ranges = <0 0 0x0 0x90000000 0x08000000>,
> diff --git a/arch/arm64/boot/dts/hisilicon/hip06-d03.dts b/arch/arm64/boot/dts/hisilicon/hip06-d03.dts
> index 677862beebef..9f4a930e734d 100644
> --- a/arch/arm64/boot/dts/hisilicon/hip06-d03.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hip06-d03.dts
> @@ -22,37 +22,37 @@
>  };
>  
>  &ipmi0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &uart0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &eth0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &eth1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &eth2 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &eth3 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &sas1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &usb_ohci {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &usb_ehci {
> -	status = "ok";
> +	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/hisilicon/hip07-d05.dts b/arch/arm64/boot/dts/hisilicon/hip07-d05.dts
> index fcbdffe0868b..81a2312c8a26 100644
> --- a/arch/arm64/boot/dts/hisilicon/hip07-d05.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hip07-d05.dts
> @@ -50,41 +50,41 @@
>  };
>  
>  &uart0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &ipmi0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &usb_ohci {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &usb_ehci {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &eth0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &eth1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &eth2 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &eth3 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &sas1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &p0_pcie2_a {
> -	status = "ok";
> +	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> index 194343510dcb..8665d3464e9b 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -585,7 +585,7 @@
>  };
>  
>  &camss {
> -	status = "ok";
> +	status = "okay";
>  	ports {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> @@ -602,7 +602,7 @@
>  };
>  
>  &cci {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &cci_i2c0 {
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> index b31117a93995..e8eaa958c199 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> @@ -26,18 +26,18 @@
>  &blsp1_uart3 {
>  	pinctrl-0 = <&serial_3_pins>;
>  	pinctrl-names = "default";
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &i2c_1 {
>  	pinctrl-0 = <&i2c_1_pins>;
>  	pinctrl-names = "default";
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &spi_0 {
>  	cs-select = <0>;
> -	status = "ok";
> +	status = "okay";
>  
>  	m25p80@0 {
>  		#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
> index f4a76162ab5f..e8c37a1693d3 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
> @@ -27,11 +27,11 @@
>  };
>  
>  &blsp1_i2c2 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &blsp1_spi1 {
> -	status = "ok";
> +	status = "okay";
>  
>  	m25p80@0 {
>  		#address-cells = <1>;
> @@ -43,37 +43,37 @@
>  };
>  
>  &blsp1_uart3 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &blsp1_uart5 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &pcie0 {
> -	status = "ok";
> +	status = "okay";
>  	perst-gpio = <&tlmm 61 0x1>;
>  };
>  
>  &pcie1 {
> -	status = "ok";
> +	status = "okay";
>  	perst-gpio = <&tlmm 58 0x1>;
>  };
>  
>  &pcie_phy0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &pcie_phy1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &qpic_bam {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &qpic_nand {
> -	status = "ok";
> +	status = "okay";
>  
>  	nand@0 {
>  		reg = <0>;
> @@ -84,29 +84,29 @@
>  };
>  
>  &sdhc_1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &qusb_phy_0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &qusb_phy_1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &ssphy_0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &ssphy_1 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &usb_0 {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &usb_1 {
> -	status = "ok";
> +	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
> index 479ad3ac6c28..08d5d51221cf 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
> @@ -13,7 +13,7 @@
>  };
>  
>  &ethernet {
> -	status = "ok";
> +	status = "okay";
>  
>  	snps,reset-gpio = <&tlmm 60 GPIO_ACTIVE_LOW>;
>  	snps,reset-active-low;
> diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> index 6422cf9d5855..a80c578484ba 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> @@ -97,7 +97,7 @@
>  };
>  
>  &pcie {
> -	status = "ok";
> +	status = "okay";
>  
>  	perst-gpio = <&tlmm 43 GPIO_ACTIVE_LOW>;
>  
> @@ -106,22 +106,22 @@
>  };
>  
>  &pcie_phy {
> -	status = "ok";
> +	status = "okay";
>  
>  	vdda-vp-supply = <&vreg_l3_1p05>;
>  	vdda-vph-supply = <&vreg_l5_1p8>;
>  };
>  
>  &remoteproc_adsp {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &remoteproc_cdsp {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &remoteproc_wcss {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &rpm_requests {
> @@ -215,7 +215,7 @@
>  };
>  
>  &sdcc1 {
> -	status = "ok";
> +	status = "okay";
>  
>  	supports-cqe;
>  	mmc-ddr-1_8v;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index a2a98680ccf5..8443451ac8cd 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1103,7 +1103,7 @@
>  };
>  
>  &cci {
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &cci_i2c0 {
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi b/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi
> index 1c52f47c43a6..87fabc64cc39 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi
> @@ -134,7 +134,7 @@
>  	pinctrl-0 = <&rmii_pins>;
>  	tx_delay = <0x30>;
>  	rx_delay = <0x10>;
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &i2c0 {
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts b/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
> index b058ce999e3b..ecce16ecc9c3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
> @@ -183,7 +183,7 @@
>  	snps,reset-delays-us = <0 10000 1000000>;
>  	tx_delay = <0x30>;
>  	rx_delay = <0x10>;
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &i2c0 {
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts b/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
> index 236ab0f1b206..2582fa4b90e2 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
> @@ -167,7 +167,7 @@
>  	pinctrl-0 = <&rmii_pins>;
>  	tx_delay = <0x30>;
>  	rx_delay = <0x10>;
> -	status = "ok";
> +	status = "okay";
>  };
>  
>  &i2c0 {
> @@ -198,7 +198,7 @@
>  };
>  
>  &io_domains {
> -	status = "ok";
> +	status = "okay";
>  
>  	audio-supply = <&vcc_io>;
>  	gpio30-supply = <&vcc_io>;
> -- 
> 2.20.1
> 
