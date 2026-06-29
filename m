Return-Path: <linux-arm-msm+bounces-114812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wZfsD8TNQWqOugkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 03:43:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB316D56D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 03:43:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Itfo6XEG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114812-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114812-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0FD93009F31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 01:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C743837999D;
	Mon, 29 Jun 2026 01:43:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC762246770;
	Mon, 29 Jun 2026 01:43:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782697409; cv=none; b=I/x9SXZeqCk/ZL8VXyqWWxQv0hHw+AG7tMr1G/WWnnXbBB3Mr0GjA+GZbdbaWOC42f2RHCGl8y6Z7/33FCZVlX9O29m6y6fVYL/F1ejzCueswvBWx5gx/xiRav701a/SKpW1D8kLGwNLojKm0DM0SqHJq7u/q3nu/Gpmnp3ktKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782697409; c=relaxed/simple;
	bh=CJEU8jTKhJu0qMOVZ8KJ8qztpi1RoG9A2b6xPvx71c4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsPnDV052iV+0m9qcdUqwjZDSzWJimGBnhlctprmL2QjDFjO9Dbd7ua+jcui5LlFtD52H0uEY5df5lBIvHw5PxpcBp6qlqRXkdql9YtBgkixF/u+LBm1QBCao282CN8TS6qCVi4yaSr85dSyz4hiJs+9LV/Vab/jtItu0hvUabk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Itfo6XEG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11B91F000E9;
	Mon, 29 Jun 2026 01:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782697408;
	bh=aiOHAtTL2EWvj6gPunoFCMBcQAV/X61VwfbqelqdEvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Itfo6XEG7WXZi9KIDHcKZS/nUVLFxT0ChuAfcFSW74EGD5UPTnwBxlBOsC34X2cx4
	 lK4uCp/SU4PMkbxDFODRwE+Iouo4l3jFC/q/iUG0clRkTu51868BfpT2otk91nWsIL
	 +eMI+PStg7u0UYhSdMcwr65Zft9AQbOVpTCVjLH21qoevBIg9l/q9EBhbPrnAl1y9z
	 GhlmM+KPVbEi6HoClQwCHqP35x+RlV3qzAH89UCqICPyJzDMkHQK/isQn+XiKMXxq1
	 pyzjTiYcn9gEvb3DG6f+CKOXocJ2Od6CqL1W1N+lqlvfM5vnaiWMOV+LsHoxQ82ZmC
	 EagnQJmRGIA5g==
Date: Sun, 28 Jun 2026 20:43:07 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [RFC 12/12] arm64: dts: qcom: x1e78100-thinkpad-t14s: Move keyb
 and touchpad to ACPI enumeration
Message-ID: <akHMf0MiXrYydnAg@baldur>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
 <20260623145225.143218-13-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623145225.143218-13-johannes.goede@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:rafael@kernel.org,m:konradybcio@kernel.org,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-114812-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baldur:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AAB316D56D2

On Tue, Jun 23, 2026 at 04:52:25PM +0200, Hans de Goede wrote:
> Add acpi-path properties for DT-ACPI hybrid mode and remove the keyboard
> and touchpad description switching to relying on ACPI to enumerate these.
> 
> Also drop the clock-frequency this is also provided by ACPI now.
> 
> FIXME: Needs DT-bindings patch as pre-req
> 
> Note this depends on these 2 patch-series for working PDC support on Hamoa:
> https://lore.kernel.org/linux-arm-msm/20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com/
> https://lore.kernel.org/linux-arm-msm/20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com/
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 59 +------------------
>  1 file changed, 3 insertions(+), 56 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 2fc01e8e8c04..a73576ec238d 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -1017,57 +1017,8 @@ &gpu_zap_shader {
>  };
>  
>  &i2c0 {
> -	clock-frequency = <400000>;
> -
> -	pinctrl-0 = <&qup_i2c0_data_clk>, <&tpad_default>;
> -	pinctrl-names = "default";
> -
> +	acpi-path = "\\_SB.I2C1";

The +/- are not equivalent, you're removing both pinctrl state and
device power management - relying on the default state (or other
client's votes).

In addition \\_SB.I2C1 is not a stable ABI.

Regards,
Bjorn

>  	status = "okay";
> -
> -	/* ELAN06E2 or ELAN06E3 */
> -	touchpad@15 {
> -		compatible = "hid-over-i2c";
> -		reg = <0x15>;
> -
> -		hid-descr-addr = <0x1>;
> -		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> -
> -		vdd-supply = <&vreg_misc_3p3>;
> -		vddl-supply = <&vreg_l12b_1p2>;
> -
> -		wakeup-source;
> -	};
> -
> -	/* SYNA8022 or SYNA8024 */
> -	touchpad@2c {
> -		compatible = "hid-over-i2c";
> -		reg = <0x2c>;
> -
> -		hid-descr-addr = <0x20>;
> -		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> -
> -		vdd-supply = <&vreg_misc_3p3>;
> -		vddl-supply = <&vreg_l12b_1p2>;
> -
> -		wakeup-source;
> -	};
> -
> -	/* ELAN06F1 or SYNA06F2 */
> -	keyboard@3a {
> -		compatible = "hid-over-i2c";
> -		reg = <0x3a>;
> -
> -		hid-descr-addr = <0x1>;
> -		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> -
> -		vdd-supply = <&vreg_misc_3p3>;
> -		vddl-supply = <&vreg_l15b_1p8>;
> -
> -		pinctrl-0 = <&kybd_default>;
> -		pinctrl-names = "default";
> -
> -		wakeup-source;
> -	};
>  };
>  
>  &i2c3 {
> @@ -1598,6 +1549,8 @@ wcd_tx: codec@0,3 {
>  };
>  
>  &tlmm {
> +	acpi-path = "\\_SB.GIO0";
> +
>  	gpio-reserved-ranges = <34 2>, /* Unused */
>  			       <44 4>, /* SPI (TPM) */
>  			       <72 2>, /* Secure EC I2C connection (?) */
> @@ -1655,12 +1608,6 @@ hdmi_hpd_default: hdmi-hpd-default-state {
>  		bias-disable;
>  	};
>  
> -	tpad_default: tpad-default-state {
> -		pins = "gpio3";
> -		function = "gpio";
> -		bias-pull-up;
> -	};
> -
>  	nvme_reg_en: nvme-reg-en-state {
>  		pins = "gpio18";
>  		function = "gpio";
> -- 
> 2.54.0
> 

