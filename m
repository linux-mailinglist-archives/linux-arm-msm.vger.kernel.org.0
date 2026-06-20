Return-Path: <linux-arm-msm+bounces-113879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kkkGH6wdNmrr7gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 06:57:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C38CE6A8577
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 06:57:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="A/alKpST";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113879-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113879-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D77F2302DF5A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 04:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6469C340411;
	Sat, 20 Jun 2026 04:57:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73117270EC1
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 04:57:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781931431; cv=none; b=uYfH6P86muSGq/q7dKWBxJwK/8TK4exMT+FAXIknJG46xvPKcnkpQCIll8ltfM9z8ZWVgZBGUgQW4IsPY6dj8wkUknjjvjoq06yeHDyA2+JefONlcOkjvPbNKNH4DfUNUjog58EPaR3ct1Nt11Ou8ru7Un8UmDm8N340WGx2mGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781931431; c=relaxed/simple;
	bh=hIXL+7zdNS9oh3NGK9e1dh1RAZ6rFnUHSYtYlJpahjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gu+4o/ETETHcUo0fkabdH1kYsbnqoeZj/AuRzt9Rpu4azxhIUEpoE1ZdbzX03Eux7wJ93Rr+8h1eC8rOcLmYKbaOhZU2Qw+oZsW/yTvm3X/PXypSkEzxNzvh9/VvM/g0GIswIs46+msEf2GMm638BuaxL2PgPskbJWknTHYdVGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/alKpST; arc=none smtp.client-ip=209.85.210.178
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8423610ec93so2449275b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 21:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781931429; x=1782536229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TAk+4QDI4jdh7tin51npXPOxqv16LUgVCNzAQTOEJDA=;
        b=A/alKpSTpJvzKkr/E7WAmQI5mujS3gihXN+u3FaMVCXSruxYMCk5W0wAWrZn0fSUcN
         OwYEs0PFN/E0FGoGDl1pJmtmxhZVEfWhpXmTeE4pQjO7aqp3xWaqkfNoYBEKzu0eUpGr
         w93QDfMR9x9G7okMgWZ2kGdWZBvJAdMwhk+PK3s9lVSDQy8cuTIthgglTaocAIR9eCdi
         wiYRkZ0dDjHUvs+4BNrJzbsDD1aq1GErbj7KJtR40yUKyodGofiFQfeo0/t23shVeYpW
         DVfsxkPWF8oKBuA2X/qy3jHL7yeH0iw+RqRSkEDbvm442D3pXJU8kY3QMyiJum3V4h2p
         17Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781931429; x=1782536229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TAk+4QDI4jdh7tin51npXPOxqv16LUgVCNzAQTOEJDA=;
        b=SRSARr1WyLdkVdBLIADpn/5F3E9w67uSiFVkJvZlN59K0rj06ERLeKZmnmPWzX+euT
         yt9B0RjAcDg7ONpJYL3rx25g7E9yi8VlCUgoyEOOtnhtEAfHtIKhb1XnAWucAJai0HY7
         VNI1Nb9Sxv9KORGnuYkmcLlQ9YpfJyod7LqRgWBJaBrPIlu4E04WfWdYMmgw9u7Bh1Xo
         KuazuoUE7vZWOdgsRzAuNM+o8QbCd/cGTfFURo6zJ/tkezOS5zytC23wEPh3Td7Fjtnj
         mBKLpnWuIUGpfL5G7ddlUgyz+ILJdtadDuosP6Bx/GSqVulx3ugbvE/UokIo29IRqp7T
         u/jw==
X-Forwarded-Encrypted: i=1; AFNElJ9raPYxcnMAJOcArBLH24QMb9ECBC8khHGXMYyhjE/wRHYnoeAu5HwXPZd0NtG7B8N+zzWCcAUzfnjjjS2b@vger.kernel.org
X-Gm-Message-State: AOJu0YxWxWMUfF8WQJOuXyIMg3JvUD1H/4y++OVx8rEVh9pZoJK0m734
	gzHYmWCAzRAKaMwNBsE8tf7sHGzaiYDLL7WBG+WIKJ72mljvrQ/vXCzMllAoWA==
X-Gm-Gg: AfdE7cnd5FbjjxBlgHVroU5Or/JgwyIoLxbbgj/GyizxHTmeK8EPu/z5X5SgQJIRSEx
	mOzDMgmhHQrLSD84zQ2xjR7MEip3F6JLJvd7fA3zX1DYKiKq3/DZG3y0PcybhjyIyP7N3378uFa
	gEsnfqt12H+283n+jM298NQXeZyNuRa/An9T7dwITwPMbYblsNcGy5dPaLqzMlg5Cn5HSsH2gz7
	9eQKIl5NT8MQYEfK7Sky0QByf/MPZZAie+nmfqRNqVPmoD5uxSAPbVqFpyI8BxmceFk65rCuXaQ
	iUpvk84IBPEfxNSdW8yUz9RNQwxpbMdzSSRz8C9G8LqBtP7muYuNNGjxEszhpCuaZ6AQJxV8JMb
	ebhlIiu87hZU3CpR2zhLDMYThSWNpALHZJ157YkBfa6fR58xeHh4D6ccmI8Y5IS6O1deDdukOzk
	f7AhrfvcmApDpVOz1XQ66m6CSWtWy++eU2
X-Received: by 2002:a05:6a00:1995:b0:842:688f:308d with SMTP id d2e1a72fcca58-845508a1496mr6337770b3a.30.1781931428739;
        Fri, 19 Jun 2026 21:57:08 -0700 (PDT)
Received: from page.local ([2402:a00:163:2ce9:843c:c4d1:e350:dd10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ea22c7sm871944b3a.44.2026.06.19.21.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 21:57:07 -0700 (PDT)
Date: Sat, 20 Jun 2026 10:27:00 +0530
From: Ajit Singh <blfizzyy@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
Message-ID: <ajYcnHPZjkFwGjly@page.local>
References: <20260607113658.25117-1-blfizzyy@gmail.com>
 <20260607113658.25117-4-blfizzyy@gmail.com>
 <39228ace-9404-4ade-bcb1-28e763548b7f@oss.qualcomm.com>
 <aiuGjH4qeOIXXgqq@page.local>
 <5c80c430-8bc7-4d03-be7e-c6dd518705e7@oss.qualcomm.com>
 <ajOO6bx3KmYzhVdy@page.local>
 <c16a2837-4b04-466a-bf4a-3717436c25be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c16a2837-4b04-466a-bf4a-3717436c25be@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113879-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C38CE6A8577

On Fri, Jun 19, 2026 at 05:30:40PM +0530, Konrad Dybcio wrote:
> On 6/18/26 8:29 AM, Ajit Singh wrote:
> > On Tue, Jun 16, 2026 at 02:10:44PM +0530, Konrad Dybcio wrote:
> >> On 6/12/26 6:16 AM, Ajit Singh wrote:
> >>> On Wed, Jun 10, 2026 at 02:58:19PM +0530, Konrad Dybcio wrote:
> >>>> On 6/7/26 1:36 PM, Ajit Singh wrote:
> >>>>> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> >>>>> QCS6490 SoC.
> >>>>>
> >>>>> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
> >>>>> support along with regulators.
> >>>>>
> >>>>> The UFS ICE block is kept disabled because enabling it currently causes
> >>>>> an SError during qcom_ice_create() on this board. UFS works without ICE.
> >>>>>
> >>>>> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> >>>>> ---
> >>>>
> >>>> [...]
> >>>>
> >>>>> +		vreg_l12c_1p8: ldo12 {
> >>>>> +			regulator-name = "vreg_l12c_1p8";
> >>>>> +			regulator-min-microvolt = <1800000>;
> >>>>> +			regulator-max-microvolt = <2000000>;
> >>>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >>>>> +
> >>>>> +			/*
> >>>>> +			 * VREG_L12C_1P8 supplies the Ampak WLAN/BT module
> >>>>> +			 * VDDIO and the external 32.768 kHz oscillator.
> >>>>> +			 */
> >>>>
> >>>> Sorry for the long review timelines on the previous patch, many of us
> >>>> were out for conferences..
> >>>>
> >>>> Is the oscillator used for that WLAN module? Would you ideally like to
> >>>> be able to turn it on/off?
> >>>
> >>> yes, oscillator is used for WLAN modules. Oscillator is powered from the same
> >>> VREG_L12C rail as WLAN VDDIO, so there is no separate regulator control to put
> >>> in pwrseq. So I think this will work fine?
> >>
> >> Probably? My point is that you marked it as always-on, so it will *never*
> >> turn off right now. For e.g. Qualcomm wifi, there's some timing spec that
> >> needs to be met wrt delays between toggling various regulators and GPIOs
> >> going to the module, hence I suggested you may need some pwrseq inbetween
> >> to achieve reliable powering on/off
> >>
> > Right, I checked the module timing requirements.
> > 
> > The module requires VBAT to be present before or at the same time as VDDIO, and
> > WL_REG_ON to be asserted only after VBAT/VDDIO are valid, around 2 sleep-clock
> > cycles later.
> > 
> > On this board, VBAT is the shared VCC_3V3 rail and is enabled by hardware, so
> > it is already present before VDDIO. VREG_L12C supplies WLAN/BT VDDIO and is
> > kept on. The WL_REG_ON timing is handled by the existing mmc-pwrseq-simple
> > reset GPIO/delay before SDIO enumeration.
> > 
> > So I think the current sequencing matches the module timing requirement.
> 
> Since the sequencing is handled, can we drop the always-on property,
> perhaps by describing the SDIO WLAN?
> 
> e.g. in arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts there is:
> 
> /* WLAN SDIO channel */
> mmc@80118000 {
> 	arm,primecell-periphid = <0x10480180>;
> 	max-frequency = <50000000>;
> 	bus-width = <4>;
> 	non-removable;
> 	cap-sd-highspeed;
> 	pinctrl-names = "default", "sleep";
> 	pinctrl-0 = <&mc1_a_2_default>;
> 	pinctrl-1 = <&mc1_a_2_sleep>;
> 	/*
> 		* GPIO-controlled voltage enablement: this drives
> 		* the WL_REG_ON line high when we use this device.
> 		* Represented as regulator to fill OCR mask.
> 		*/
> 	vmmc-supply = <&wl_reg>;
> 
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 	status = "okay";
> 
> 	wifi@1 {
> 		compatible = "brcm,bcm4334-fmac", "brcm,bcm4329-fmac";
> 		reg = <1>;
> 		/* GPIO216 WL_HOST_WAKE */
> 		interrupt-parent = <&gpio6>;
> 		interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
> 		interrupt-names = "host-wake";
> 		pinctrl-names = "default";
> 		pinctrl-0 = <&wlan_default_mode>;
> 	};
> };
> 
> most notably though, it seems that the brcmfmac driver doesn't even use
> the regulator framework, probably because all of the SDIO WLANs that
> Linux supports were wired in a more "embedded" way, where the V(Q)MMC
> supplies were enough.. unless it's the case here too?

It might not be possible to drop regulator-always-on for VREG_L12C here. The
SDHC2 host already has its own vmmc/vqmmc rails:

vqmmc-supply = <&vreg_l2c_1p62>;
vmmc-supply = <&vreg_l6c_2p96>;

VREG_L12C is a separate module-side VDDIO rail for the AP6272S WLAN/BT module.
There is no separate GPIO-controlled enable for this rail;

as you said, since brcmfmac does not appear to consume an extra VDDIO regulator
from the SDIO child node, so unless there is a preferred way to model this
module-side VDDIO rail, I think VREG_L12C still needs to stay always-on.

> 
> Konrad

Ajit

