Return-Path: <linux-arm-msm+bounces-40847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3BA9E7B55
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 23:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 780DA160272
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 22:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF7B1AAA24;
	Fri,  6 Dec 2024 22:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="h3BYADFy";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="vNJ/Nw21";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="h3BYADFy";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="vNJ/Nw21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E5722C6F4;
	Fri,  6 Dec 2024 22:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733522580; cv=none; b=nNwFSsnFcsLXBjsKEwaWeQ//0xvPWroqAx5MTzmb67NMBc13NnK5fhBUjn3XsPHsGu1xeM6etu76MqJ+9uWr4P8skXjfWOgpOH+P7bkOu4JPhjHCO3Xwz1c94TWl712FUBZdRte8GBKpMHYInzPOftfKWCBDHrBNOrAIYdfIczs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733522580; c=relaxed/simple;
	bh=hqG/8AfkucCrxer8P3uRIrkeW0+aE/pp3YUuoahCgxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTAJT4BTE9Pg8gNxbxF4TE6yYUeqUif7PgSgYNV4nwsIR+hiY4g+CbHI9Zs6ia/Z1I53XlpL45zFaYLDtDx4idpreuVMOzMfs/d+kydv3D8/lGH34lIhcRbS/5KTPlzBGrJHJi1oEBndCORlguj2TnagbyS18F9XPtt2SfKX5ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=h3BYADFy; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=vNJ/Nw21; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=h3BYADFy; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=vNJ/Nw21; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 114BE1F381;
	Fri,  6 Dec 2024 22:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733522576;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TRsn1BchjmOhokJgfVzCQkyd8e3Sysm6z1gUOGD9C/M=;
	b=h3BYADFyyk+bD8jh9zvVNQK6JM09MIrH3O6AaOL5NPZu6qXN/8ZbkYYr15YmnovDMtiMkZ
	NjcgvZG/G0GsHphSAS/QLQiju3Oqc9PKRfnFakbPzHq2yIPZVTCJWhbB6Lr2vM/UluPHSC
	E5YYb3x5yB8bYOwWUo2KWDwBNdERNuo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733522576;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TRsn1BchjmOhokJgfVzCQkyd8e3Sysm6z1gUOGD9C/M=;
	b=vNJ/Nw21WeZTLCZdqpA43Go3CWwEJhkbvAp+K//0/+pBi04Zc/gpt3ap7TQ8AP6sdCL6R5
	lD65JSiC6eJXzKBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733522576;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TRsn1BchjmOhokJgfVzCQkyd8e3Sysm6z1gUOGD9C/M=;
	b=h3BYADFyyk+bD8jh9zvVNQK6JM09MIrH3O6AaOL5NPZu6qXN/8ZbkYYr15YmnovDMtiMkZ
	NjcgvZG/G0GsHphSAS/QLQiju3Oqc9PKRfnFakbPzHq2yIPZVTCJWhbB6Lr2vM/UluPHSC
	E5YYb3x5yB8bYOwWUo2KWDwBNdERNuo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733522576;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TRsn1BchjmOhokJgfVzCQkyd8e3Sysm6z1gUOGD9C/M=;
	b=vNJ/Nw21WeZTLCZdqpA43Go3CWwEJhkbvAp+K//0/+pBi04Zc/gpt3ap7TQ8AP6sdCL6R5
	lD65JSiC6eJXzKBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 75C4C138A7;
	Fri,  6 Dec 2024 22:02:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ph9aGo50U2d2ZAAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Fri, 06 Dec 2024 22:02:54 +0000
Date: Fri, 6 Dec 2024 23:02:52 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@gmail.com>,
	=?iso-8859-2?Q?Kry=B9tof_=C8ern=FD?= <cleverline1mc@gmail.com>,
	Alexander Reimelt <alexander.reimelt@posteo.de>,
	Dominik Kobinski <dominikkobinski314@gmail.com>,
	Harry Austen <hpausten@protonmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT 4/4] arm64: dts: qcom: msm8994: Describe USB
 interrupts
Message-ID: <20241206220252.GA138783@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20241129-topic-qcom_usb_dtb_fixup-v1-0-cba24120c058@oss.qualcomm.com>
 <20241129-topic-qcom_usb_dtb_fixup-v1-4-cba24120c058@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129-topic-qcom_usb_dtb_fixup-v1-4-cba24120c058@oss.qualcomm.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-2.00 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,protonmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,quicinc.com,protonmail.com,somainline.org,vger.kernel.org,gmail.com,posteo.de,oss.qualcomm.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_EQ_FROM(0.00)[]
X-Spam-Score: -2.00
X-Spam-Flag: NO

Hi Konrad, all,

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

> Previously the interrupt lanes were not described, fix that.

> Fixes: d9be0bc95f25 ("arm64: dts: qcom: msm8994: Add USB support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8994.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)

> diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> index 1acb0f159511996db07bc7543cf4f194a4ebd0fa..8c0b1e3a99a767e7c28bcaf3b9687501cc15cd58 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> @@ -437,6 +437,15 @@ usb3: usb@f92f8800 {
>  			#size-cells = <1>;
>  			ranges;

> +			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "pwr_event",
> +					  "qusb2_phy",
> +					  "hs_phy_irq",
> +					  "ss_phy_irq";
> +

Tested-by: Petr Vorel <petr.vorel@gmail.com>

Well, I tested this on msm8994 Huawei Nexus 6P. It did not break anything,
but obviously it's not enough for phone to get USB working. IMHO none of
msm899[24] has working USB.

msm8996 has usb3phy, hsusb_phy[12] labels, I suppose USB will not be working
until this is set. Below is a snippet of a downstream device tree. I might
be able to transform it to the mainline tree, but feel free to post a patch
(probably obvious for you).

Kind regards,
Petr

		ssphy@f9b38000 {
			phandle = <0xf1>;
			linux,phandle = <0xf1>;
			clock-names = "aux_clk\0pipe_clk\0cfg_ahb_clk\0phy_reset\0phy_phy_reset\0ldo_clk";
			clocks = <0xaa 0xd9a36e0 0xaa 0xf279aff2 0xaa 0xd1231a0e 0xaa 0x3d559f1 0xaa 0xb1a4f885 0xaa 0x124410f7>;
			qcom,no-pipe-clk-switch;
			qcom,vbus-valid-override;
			qcom,vdd-voltage-level = <0x00 0xf4240 0xf4240>;
			vdda18-supply = <0xf4>;
			vdd-supply = <0x2e>;
			reg-names = "qmp_phy_base\0qmp_ahb2phy_base";
			reg = <0xf9b38000 0x800 0xf9b3e000 0x3ff>;
			status = "ok";
			compatible = "qcom,usb-ssphy-qmp";
		};

		hsphy@f92f8800 {
			phandle = <0xf0>;
			linux,phandle = <0xf0>;
			qcom,hsphy-host-init = <0xd1c9a7>;
			clock-names = "phy_sleep_clk";
			clocks = <0xaa 0x2e4d8839>;
			qcom,vdda-force-on;
			qcom,sleep-clk-reset;
			qcom,set-pllbtune;
			qcom,vbus-valid-override;
			qcom,ext-vbus-id;
			qcom,vdd-voltage-level = <0x01 0x05 0x07>;
			vdda33-supply = <0xed>;
			vdda18-supply = <0xf4>;
			vddcx-supply = <0xf3>;
			vdd-supply = <0xf2>;
			qcom,hsphy-init = <0xd191a4>;
			reg-names = "core\0phy_csr";
			reg = <0xf92f8800 0x3ff 0xf9b3a000 0x110>;
			status = "ok";
			compatible = "qcom,usb-hsphy";
		};

		ssusb@f9200000 {
			phandle = <0xea>;
			linux,phandle = <0xea>;
			clock-names = "core_clk\0iface_clk\0utmi_clk\0sleep_clk\0ref_clk\0xo";
			clocks = <0xaa 0xb3b4e2cb 0xaa 0x94d26800 0xaa 0xa800b65a 0xaa 0xd0b65c92 0x47 0x3ab0b36d 0x47 0xf79c19f6>;
			qcom,por-after-power-collapse;
			qcom,power-collapse-on-cable-disconnect;
			qcom,msm-bus,vectors-KBps = <0x3d 0x200 0x00 0x00 0x3d 0x200 0x3a980 0xea600>;
			qcom,msm-bus,num-paths = <0x01>;
			qcom,msm-bus,num-cases = <0x02>;
			qcom,msm-bus,name = "usb3";
			qcom,usb-dbm = <0xef>;
			qcom,dwc-usb3-msm-qdss-tx-fifo-size = <0x2000>;
			qcom,dwc-usb3-msm-tx-fifo-size = <0x7400>;
			vbus_dwc3-supply = <0xee>;
			vdda33-supply = <0xed>;
			USB3_GDSC-supply = <0xec>;
			interrupt-names = "hs_phy_irq\0pwr_event_irq\0pmic_id_irq";
			interrupt-map = <0x00 0x00 0x01 0x00 0x85 0x00 0x00 0x01 0x01 0x00 0xb4 0x00 0x00 0x01 0xeb 0x00 0x00 0x09 0x00>;
			interrupt-map-mask = <0x00 0xffffffff>;
			#interrupt-cells = <0x01>;
			interrupts = <0x00 0x01>;
			interrupt-parent = <0xea>;
			ranges;
			#size-cells = <0x01>;
			#address-cells = <0x01>;
			reg = <0xf9200000 0xfc000 0xfd4ab000 0x04>;
			status = "ok";
			compatible = "qcom,dwc-usb3-msm";

			dwc3@f9200000 {
				maximum-speed = "high-speed";
				usb-phy = <0xf0 0xf1>;
				snps,usb3-u1u2-disable;
				tx-fifo-resize;
				interrupts = <0x00 0x83 0x00>;
				interrupt-parent = <0x01>;
				reg = <0xf9200000 0xfc000>;
				compatible = "synopsys,dwc3";
			};
		};

>  			clocks = <&gcc GCC_USB30_MASTER_CLK>,
>  				 <&gcc GCC_SYS_NOC_USB3_AXI_CLK>,
>  				 <&gcc GCC_USB30_SLEEP_CLK>,

