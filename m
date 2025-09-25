Return-Path: <linux-arm-msm+bounces-75108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CA6B9F63C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 15:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46EFF4C7392
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B01D189BB6;
	Thu, 25 Sep 2025 13:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="YBVa2eCE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m3284.qiye.163.com (mail-m3284.qiye.163.com [220.197.32.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22684211F
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758805280; cv=none; b=XIIQJhpRfjwuUDzF9tFZIbrInkwCfzOWokTHq8AaJm7+6Ma3kFU5Ed/uR3kecVp60OcL8MpeEvATEliF9A3Ky8Bb4wWc2W0DwZx75INk+85PElcVRBz7iRkY8SZcHP7Yj4KDTZ15zznBqSG/TZ69vlEv+GCr6rgkcIpc/uholZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758805280; c=relaxed/simple;
	bh=gMBg8GKYJJhgn/JRNvxpqYi/mtTgW7aoFmKuFQif2rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WTtnERNQJl/jxZ8x1Pvrrkk35fLLHn9gOjsXKlSPZ0fJKmBf61YnCtL+h87pJwmJH7PkevKmoPYdC5Hs5A6DkvhTGRsOOXxNH5FRdHXILPgtgcAoky/E4ihXhx7YCPx5lGJQDZlKB0pQn4+/cP7+bpBoEgPdX9qRb7QoYCBPfq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=YBVa2eCE; arc=none smtp.client-ip=220.197.32.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from ROG.lan (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 240ef1b15;
	Thu, 25 Sep 2025 21:01:06 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: andersson@kernel.org,
	casey.connolly@linaro.org,
	christopher.obbard@linaro.org,
	hongyang.zhao@thundersoft.com,
	linux-arm-msm@vger.kernel.org,
	loic.minier@oss.qualcomm.com,
	rosh@debian.org
Subject: Re: [PATCH] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board dts
Date: Thu, 25 Sep 2025 21:00:51 +0800
Message-ID: <20250925130051.1139123-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <72igbjqjadms56geag7ftf7lch53e7p5b2g6zhcfjget7zfhvi@mokcb3l4xaxr>
References: <72igbjqjadms56geag7ftf7lch53e7p5b2g6zhcfjget7zfhvi@mokcb3l4xaxr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9980f6910b09d5kunm9c5e36fe53deba
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSUMYVk5ISElKSR8fGhhNH1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=YBVa2eCE6JW9t4/A7SpdP9D1Lw5gGpRPmbiQRlKkZZEOZxU1MTbSl8cKnWvknFa5Df6d+YbMb85yzPLFcNiRPi/rGDS19H6Z9Q3sct/igvsxMSptTz3k1Dyq3yzue+/K3FxZOhiLIRaDlx+1WLNEWmG5QxMoVeQ1miIbzZ75ZRM=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=2CckjttJHNsoWEUfH425TAhscIitDIBp1q8T0Zbc83I=;
	h=date:mime-version:subject:message-id:from;

> On Wed, Sep 24, 2025 at 08:13:30PM +0800, Hongyang Zhao wrote:
> > >On Tue, Sep 23, 2025 at 02:43:30PM +0800, Hongyang Zhao wrote:
> > >> From: hongyang-rp <hongyang.zhao@thundersoft.com>
> > >> 
> > >> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> > >> QCS6490 SoC.
> > >> This will add support for debug uart, usb-typec, wifi,
> > >> bluetooth, fan, m.2, i2c and uart on the 40-pin connector,
> > >> and some voltage regulators to the board.
> > >> 
> > >> Signed-off-by: hongyang-rp <hongyang.zhao@thundersoft.com>
> > >> Reviewed-by: Roger Shimizu <rosh@debian.org>
> > >> Cc: Casey Connolly <casey.connolly@linaro.org>
> > >> Cc: Christopher Obbard <christopher.obbard@linaro.org>
> > >> Cc: Loic Minier <loic.minier@oss.qualcomm.com>
> > >> ---
> > >>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
> > >>  .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1299 +++++++++++++++++
> > >>  2 files changed, 1300 insertions(+)
> > >>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > >> 
> 
> > >> +
> > >> +&mdss_dp_out {
> > >> +	data-lanes = <0 1>;
> > >
> > >Without link-frequencies it's limited to HBR2, is this expected?
> > 
> > This is expected. I refer to qcs6490-rb3gen2.dts for the modifications.
> 
> Why? Is the board / chip limited to HBR2? Don't just c&p rb3gen2, you
> have a different board and different configuration.
> 

Yes, I understand.
I reviewed our hardware design, and it supports up to HBR3.
I made the following changes:
&mdss_dp_out {
	data-lanes = <0 1>;
	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;

	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
};

> > >> +
> > >> +&pcie1 {
> > >> +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> > >
> > >No wake-gpios?
> > 
> > Yes, this part also refers to qcs6490-rb3gen2.dts,
> > and I checked drivers/pci/controller/dwc/pcie-qcom.c
> > and there is no wake gpio related operations.
> 
> DT desribes the hardware. As such, please add wake-gpios if it's rounted
> on the board.
> 

Got it, thanks for your review, I learned a lot.
We have the wake gpio hardware connected, I added it:
&pcie1 {
	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;

	pinctrl-0 = <&pcie1_reset_n>,
		    <&pcie1_wake_n>,
		    <&pcie1_clkreq_n>;
	pinctrl-names = "default";

	status = "okay";
};

> > 
> > >
> > >> +
> > >> +	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
> > >> +	pinctrl-names = "default";
> > >> +
> > >> +	vdda-supply = <&vreg_m2_1p8>;
> > >> +
> > >> +	status = "okay";
> > >> +};
> > >> +
> > >
> > >[...]
> > >
> > >> +
> > >> +&pm8350c_gpios {
> > >> +	fan_pwm_out_default: fan_pwm_out_default {
> > >
> > >You should have gotten a warning here.
> > 
> > Yes, I have fixed it.
> 
> Can I asusme that you've run `make foo.dtb CHECK_DTBS=y` now?

Sorry, I did not run the first commit.
My latest local changes have been run. Here are the results of my run:
(myenv) zhy@ROG:~/QCOM/linux$ make CHECK_DTBS=y qcom/qcs6490-thundercomm-rubikpi3.dtb
  UPD     include/config/kernel.release
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  DTC [C] arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dtb

But I made this modification:
diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18b5ed044f9f..c86352b025cf 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -340,6 +340,7 @@ properties:
               - particle,tachyon
               - qcom,qcm6490-idp
               - qcom,qcs6490-rb3gen2
+              - thundercomm,6490p-rubikpi3
               - shift,otter
           - const: qcom,qcm6490

Should I make similar changes?

> 
> > 
> > >
> > >> +		pins = "gpio8";
> > >> +		function = "func1";
> > >> +		power-source = <1>;
> > >> +		drive-push-pull;
> > >> +		output-high;
> > >> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> > >> +	};
> > >> +};
> > >> +
> > >> +&pmk8350_rtc {
> > >> +	status = "okay";
> > >> +	allow-set-time;
> > >
> > >status should be the last property.
> > 
> > Adjustments have been made in the new patch.
> > 
> > >
> > >> +};
> > >> +
> > >> +&pmk8350_vadc {
> > >> +	channel@3 {
> > >> +		reg = <PMK8350_ADC7_DIE_TEMP>;
> > >> +		label = "pmk8350_die_temp";
> > >> +		qcom,pre-scaling = <1 1>;
> > >> +	};
> > >> +
> > >> +	channel@44 {
> > >> +		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
> > >> +		label = "xo_therm";
> > >> +		qcom,hw-settle-time = <200>;
> > >> +		qcom,pre-scaling = <1 1>;
> > >> +		qcom,ratiometric;
> > >> +	};
> > >> +
> > >> +	channel@103 {
> > >> +		reg = <PM7325_ADC7_DIE_TEMP>;
> > >> +		label = "pm7325_die_temp";
> > >> +		qcom,pre-scaling = <1 1>;
> > >> +	};
> > >> +
> > >> +	channel@144 {
> > >> +		reg = <PM7325_ADC7_AMUX_THM1_100K_PU>;
> > >> +		qcom,ratiometric;
> > >> +		qcom,hw-settle-time = <200>;
> > >> +		qcom,pre-scaling = <1 1>;
> > >> +		label = "pm7325_quiet_therm";
> > >> +	};
> > >> +
> > >> +	channel@146 {
> > >> +		reg = <PM7325_ADC7_AMUX_THM3_100K_PU>;
> > >> +		qcom,ratiometric;
> > >> +		qcom,hw-settle-time = <200>;
> > >> +		qcom,pre-scaling = <1 1>;
> > >> +		label = "pm7325_sdm_skin_therm";
> > >> +	};
> > >> +};
> > >> +
> > >> +&pon_pwrkey {
> > >> +	status = "okay";
> > >> +};
> > >> +
> > >> +&pon_resin {
> > >> +	linux,code = <KEY_VOLUMEDOWN>;
> > >> +
> > >> +	status = "okay";
> > >> +};
> > >> +
> > >> +&qup_uart7_cts {
> > >> +	/*
> > >> +	 * Configure a bias-bus-hold on CTS to lower power
> > >> +	 * usage when Bluetooth is turned off. Bus hold will
> > >> +	 * maintain a low power state regardless of whether
> > >> +	 * the Bluetooth module drives the pin in either
> > >> +	 * direction or leaves the pin fully unpowered.
> > >> +	 */
> > >> +	bias-bus-hold;
> > >> +};
> > >> +
> > >> +&qup_uart7_rts {
> > >> +	/* We'll drive RTS, so no pull */
> > >> +	drive-strength = <2>;
> > >> +	bias-disable;
> > >> +};
> > >> +
> > >> +&qup_uart7_rx {
> > >> +	/*
> > >> +	 * Configure a pull-up on RX. This is needed to avoid
> > >> +	 * garbage data when the TX pin of the Bluetooth module is
> > >> +	 * in tri-state (module powered off or not driving the
> > >> +	 * signal yet).
> > >> +	 */
> > >> +	bias-pull-up;
> > >> +};
> > >> +
> > >> +&qup_uart7_tx {
> > >> +	/* We'll drive TX, so no pull */
> > >> +	drive-strength = <2>;
> > >> +	bias-disable;
> > >> +};
> > >> +
> > >> +&qupv3_id_0 {
> > >> +	status = "okay";
> > >> +};
> > >> +
> > >> +&qupv3_id_1 {
> > >> +	status = "okay";
> > >> +};
> > >> +
> > >> +&remoteproc_adsp {
> > >> +	firmware-name = "qcom/qcs6490/adsp.mbn";
> > >> +	status = "okay";
> > >> +};
> > >> +
> > >> +&remoteproc_cdsp {
> > >> +	firmware-name = "qcom/qcs6490/cdsp.mbn";
> > >> +	status = "okay";
> > >> +};
> > >> +
> > >> +&remoteproc_mpss {
> > >> +	firmware-name = "qcom/qcs6490/modem.mbn";
> > >> +	status = "okay";
> > >> +};
> > >> +
> > >> +&remoteproc_wpss {
> > >> +	firmware-name = "qcom/qcs6490/wpss.mbn";
> > >> +	status = "okay";
> > >> +};
> > >> +
> > >> +&sdhc_2 {
> > >> +	pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>;
> > >> +	pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>;
> > >
> > >What's the difference from the defaults here?
> > 
> > This part is redundant and has been deleted.
> > 
> > >
> > >> +
> > >> +	vmmc-supply = <&vreg_l9c_2p96>;
> > >> +	vqmmc-supply = <&vreg_l6c_2p96>;
> > >> +
> > >> +	non-removable;
> > >> +	keep-power-in-suspend;
> > >> +	/delete-property/ cd-gpios;
> > >> +
> > >> +	status = "okay";
> > >> +};
> > >> +
> > >> +&tlmm {
> > >> +	bt_device_wake: bt_device_wake {
> > >
> > >Please check your DT for schema compliance. Read the documentation for
> > >DT writing. There are two mistakes here.
> > 
> > Sorry, this is my first commit.
> > After running the device tree check, this should be the only issue left,
> > but I checked that the driver vdda-supply was being parsed properly,
> > and I need this node to enable power on the M.2 port, so I didn't delete it.
> > 
> > (qcom,pcie-sc7280): Unevaluated properties are not allowed
> > ('vdda-supply' was unexpected)
> 
> This needs to be fixed.
> 

I have solved it, I used a regulator that turns on startup.

> > 
> > >
> > >> +		pins = "gpio39";
> > >> +		function = "gpio";
> > >> +		drive-strength = <2>;
> > >> +		bias-disable;
> > >> +	};
> > >> +
> > >> +	bt_host_wake: bt_host_wake {
> > >> +		pins = "gpio137";
> > >> +		function = "gpio";
> > >> +		drive-strength = <2>;
> > >> +		bias-disable;
> > >> +	};
> > >> +
> > >> +	bt_reset: bt_reset {
> > >> +		pins = "gpio17";
> > >> +		function = "gpio";
> > >> +		drive-strength = <2>;
> > >> +		bias-disable;
> > >> +	};
> > >> +
> > >> +	qup_uart7_sleep_cts: qup-uart7-sleep-cts-state {
> > >> +		pins = "gpio28";
> > >> +		function = "gpio";
> > >> +		/*
> > >> +		 * Configure a bias-bus-hold on CTS to lower power
> > >> +		 * usage when Bluetooth is turned off. Bus hold will
> > >> +		 * maintain a low power state regardless of whether
> > >> +		 * the Bluetooth module drives the pin in either
> > >> +		 * direction or leaves the pin fully unpowered.
> > >> +		 */
> > >> +		bias-bus-hold;
> > >> +	};
> > >> +
> > >> +	qup_uart7_sleep_rts: qup-uart7-sleep-rts-state {
> > >> +		pins = "gpio29";
> > >> +		function = "gpio";
> > >> +		/*
> > >> +		 * Configure pull-down on RTS. As RTS is active low
> > >> +		 * signal, pull it low to indicate the BT SoC that it
> > >> +		 * can wakeup the system anytime from suspend state by
> > >> +		 * pulling RX low (by sending wakeup bytes).
> > >> +		 */
> > >> +		bias-pull-down;
> > >> +	};
> > >> +
> > >> +	qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
> > >> +		pins = "gpio31";
> > >> +		function = "gpio";
> > >> +		/*
> > >> +		 * Configure a pull-up on RX. This is needed to avoid
> > >> +		 * garbage data when the TX pin of the Bluetooth module
> > >> +		 * is floating which may cause spurious wakeups.
> > >> +		 */
> > >> +		bias-pull-up;
> > >> +	};
> > >> +
> > >> +	qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
> > >> +		pins = "gpio30";
> > >> +		function = "gpio";
> > >> +		/*
> > >> +		 * Configure pull-up on TX when it isn't actively driven
> > >> +		 * to prevent BT SoC from receiving garbage during sleep.
> > >> +		 */
> > >> +		bias-pull-up;
> > >> +	};
> > >> +};
> > >> +
> > >> +&uart2 {
> > >> +	status = "okay";
> > >> +};
> > >> +
> > >> +&uart5 {
> > >> +	status = "okay";
> > >> +};
> > >> +
> > >> +&uart7 {
> > >> +	/delete-property/ interrupts;
> > >> +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
> > >> +			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> > >> +	pinctrl-1 = <&qup_uart7_sleep_cts>,
> > >> +		    <&qup_uart7_sleep_rts>,
> > >> +		    <&qup_uart7_sleep_tx>,
> > >> +		    <&qup_uart7_sleep_rx>;
> > >> +	pinctrl-names = "default",
> > >> +			"sleep";
> > >> +
> > >> +	status = "okay";
> > >> +
> > >> +	bluetooth {
> > >> +		compatible = "brcm,bcm4345c5";
> > >> +		clocks = <&sleep_clk>;
> > >> +		clock-names = "lpo";
> > >> +		device-wakeup-gpios = <&tlmm 39 GPIO_ACTIVE_HIGH>;
> > >> +		host-wakeup-gpios = <&tlmm 137 GPIO_ACTIVE_HIGH>;
> > >> +		shutdown-gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
> > >> +		pinctrl-0 = <&bt_device_wake>, <&bt_host_wake>, <&bt_reset>;
> > >
> > >one per line
> > 
> > Adjustments have been made in the new patch.
> > 
> > >
> > >> +		pinctrl-names = "default";
> > >> +		vbat-supply = <&vreg_sdio_wifi_1p8>;
> > >> +		vddio-supply = <&vreg_sdio_wifi_1p8>;
> > >> +		max-speed = <3000000>;
> > >> +	};
> > >> +};
> > >> +
> > >> +&usb_1 {
> > >> +	status = "okay";
> > >> +};
> > >> +
> > >> +&usb_1_dwc3 {
> > >
> > >Please rebase on top of a resent linux-next.
> > 
> > I re-made the patch at the next-20250923 tag.
> > 
> > >
> > >> +	dr_mode = "otg";
> > >
> > >This is the default
> > 
> > This node has been deleted.
> > 
> > >
> > >> +	usb-role-switch;
> > >
> > >This should be a part of sc7280.dtsi
> > 
> > Sorry, I don't understand here. Should we write usb-role-switch
> > in sc7280.dtsi? I think the changes for RUBIK Pi should be fixed
> > in the current device tree. This part of the changes refers to
> > qcs6490-rb3gen2.dts.
> 
> Yes, the host is supposed to handle USB role-switching, so if the
> property is not there, add it in the sc7280.dtsi (in a separate commit).

I found it has already been added in linux-next.

My local patch has been modified based on your review,
and since the linux-next branch sc7280.dtsi supports pcie0,
my latest revision also adds support for Ethernet and USB-Type-A 3.0.
Since there are more changes, do I need to send a new V2 patch?

--
Thanks,
Hongyang

