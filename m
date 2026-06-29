Return-Path: <linux-arm-msm+bounces-114976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qq8AFiRIQmpC3wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:25:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0766D8E0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:25:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=imd-tec.com header.s=google header.b=T7hSHqD5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114976-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114976-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=imd-tec.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57D553013ED1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BA235DA63;
	Mon, 29 Jun 2026 10:25:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E11A3FD131
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:25:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728736; cv=none; b=dtGypTyTVKda9pSFod2xThWNUODoGUxI6/3kW3d6ppJlabofds2WWT4f9hfVMU3SZJXyz1ABm4YFXPIfIxM1yYyDKJe8F1wK236Nojaixihdyc87kosRraMbXnOogQoSsUgOAr72udcb43iGx9Z0C2Tx61Nuivh/hq1jFuFPsI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728736; c=relaxed/simple;
	bh=Dzzx93/IFh2/c56FIW3I+V6rlzl/nGfXG59JSo7h57s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHaPRfATaVr1Os47rxlXK/l4ajrTFd/FU+HWVnaZvOfkyQM0sPDIrRW5QGShXlZLHJbc6h4FHVtQclzAs2LSB0r9BfH0AO7c1UN5dK8i9PhwmCj4qjoA1W8SkyHmNIaMWHc6Yt9XHiIN7hBM3/Wnl7j1keT+yOLIXFxDnWg/9EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=T7hSHqD5; arc=none smtp.client-ip=209.85.218.41
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c12629c937eso116454866b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1782728733; x=1783333533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/GNsGQ15GEBbFE2xBi6yoUDs4BN46tBZEEzbNLpxMas=;
        b=T7hSHqD50SI3xnxHkpG+7NN+6ArMhpg1x7+Zeapx337J5gcUHyH8vvFVOQcO1lCmMm
         6WopMoHi/qnbDLEIz2lLBtO0jtawEyRF29KFqTnLhpQMaksJSvzHlhPADyV/Kdp4fQqH
         6zraDm3FgsGOCtbpn+cFA9cgtdXckd21lyz5kDTK9QzZIrkZjPvT7ndgx1W4w2bqz0cL
         ey65+Zf6cLSxaGC+a62wtS0imw0knHc121l9ZeXWIuMXZlncf87Hx1J8frvt+Alnii61
         ziC0YUg1AU11x+IWfIOO4kxcNZVNHUVCB1EqNM2k4YEZgBYzKz69rszyde+k4uEJDwIA
         oykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782728733; x=1783333533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GNsGQ15GEBbFE2xBi6yoUDs4BN46tBZEEzbNLpxMas=;
        b=UJug9uTpoa4uY2odQKA+qD1mYoRpB71lf8/6CKmIIK5LyqPrX9HIIHtUjAFAJ+LDDH
         oOa8buXLiNC6g6QfywXqUt7PDKTXXT+YS3+54XXbx3VaoYwO+5K3oyTbYM6JGSF+mmd3
         T17FCujx46q/rf/e89pxIe7mOwyuKkh0+VbNE6JLiJRmI6DSFYpyi505ikoMN7obwNo0
         6w0tzc/7Ulo3RnlAgEzMy1sWqr744z283Satae0a0gNrOXfkBVA5av6oYbHI/mODDATV
         iaK9vFH8h9+PMQowltkwBIrcRUXho+Du8RJNwQSBs9lTT1Flzd4q11MRhZO5mN1hpkJk
         jvFQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZFH+zFQXgBhrTJRkQYQ8mx1ZB4i65eOgOY3erbDlYE007R+3gnFLsfdOzCH256imryjsazBxpshAgH9Ot@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg8msH5jcNxYb4HSzKS5gOHVNlC2A0jp/dd+/WaTdr3pYkbN9e
	irTTfpPwx7S3Aw4HzuQlzVZYXYuStKHei+r46rgwamAYzWXF6AEmO9Xt87zz3Z+rjTwjIsFng9a
	IHk9vtU4=
X-Gm-Gg: AfdE7cnZCrfSHpC2mXs5Vs7A05NElcR8n30XjDUm1bkRlCOeW+bAWkQG2W3FZomXPOW
	Me3seshIoNWkQEkt3E1l+bCe9iul09hEnp4CYpEk7SQjietgA+t5jicOyWXuCzvXfdVbedLPTCk
	KMgDDFWrMCGATTmKNRo6PWTPbk1HWKuI0nars3JJEMnsYUOsdjECjNmVitiPCwB7KDx8t6BiNpt
	+rUjyti4QLzDw0bcH9hgqONhCj8pyuwt1W3QmfC8uQvKrniJwWRh0iKXADBqyL5Oird9vazQi8D
	bt+f2RXJFtNYZ89UL/s4+yzB1o5h69qsORq9CP4lw6fl5P1vxxQHCoLQ17yftaRB81jMu/fKbBa
	mMX3Z4zoCn+Do9XzA8CnJh23berRpDP3QJvoSswtktlwcM3smXa2cPXATkz9wyz7SOuGdn4M8/U
	98NtxTerZjp/GAo7KOIFEB+DGD4QaK93Bd8dJmAQdatcVvpr9N+1+LJTrajZZdOH+WvbgTIfC1o
	pV2TSq3GU9zeGotR5rOhRprXzfLJeWbSnfUhg==
X-Received: by 2002:a17:907:8692:b0:c05:3c55:ee86 with SMTP id a640c23a62f3a-c120616a8b1mr895255166b.46.1782728733071;
        Mon, 29 Jun 2026 03:25:33 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1248c417desm289000466b.23.2026.06.29.03.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:25:32 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:25:30 +0100
From: William Bright <william.bright@imd-tec.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Message-ID: <akJIGk8BEgHQrt34@will-Legion-Slim-5-16APH8>
References: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
 <20260610-imdt-qcs8550-sbc-rfc-v4-4-358e71d606bc@imd-tec.com>
 <8afbc9f9-15ff-4b60-9a0f-845f903d3c9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8afbc9f9-15ff-4b60-9a0f-845f903d3c9a@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114976-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,will-Legion-Slim-5-16APH8:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA0766D8E0D

On Fri, Jun 26, 2026 at 05:18:20PM +0200, Konrad Dybcio wrote:
> > +&gpu_zap_shader {
> > +   firmware-name = "qcom/sm8550/a740_zap.mbn";
> > +   /* Zap shader doesn't load so is disabled */
>
> If your SoC is production fused, you must provide your own ZAP firmware
> that's signed by you. Conversely, if you have a software stack that
> does not include the Gunyah hypervisor, this is likely not necessary
I solved the zap shader failing to load a couple of days ago. U-boot
wasn't fixing up DT memory node correctly so I will enable the zap
shader in V5.
> > +   status = "disabled";
> > +};
> > +
> > +&i2c_master_hub_0 {
> > +   status = "okay";
> > +};
> > +
> > +&i2c_hub_2 {
> > +   clock-frequency = <400000>;
> > +   status = "okay";
>
> nit: let's keep a \n before status, everywhere
>
> [...]
>
Ack all of your above feedback regarding formatting, new lines and
ordering.
> > +
> > +   sd_vset_default: sd-vset-default-state {
> > +           sd-vset-pins {
> > +                   pins = "gpio4";
> > +                   function = "gpio";
> > +                   drive-strength = <16>;
> > +                   bias-disable;
> > +           };
> > +   };
> > +
> > +   /*
> > +    * Drive LAN743x reset high (de-asserted) when pcie1 probes,
> > +    * so the PHY enumerates on the bus.
> > +    */
> > +   gbe_reset_default: gbe-reset-default-state {
> > +           pins = "gpio138";
> > +           function = "gpio";
> > +           drive-strength = <2>;
> > +           bias-disable;
> > +           output-high;
> > +   };
> > +
> > +   /*
> > +    * We drive this GPIO physically high on the M2 Key-E connector
> > +    * to make sure the module is enabled. An M2 Key-E module could
> > +    * be using this pin as a chip enable.
> > +    */
> > +   m2e_sdio_resetn_default: m2e-sdio-resetn-default-state {
> > +           pins = "gpio41";
> > +           function = "gpio";
> > +           drive-strength = <2>;
> > +           bias-disable;
> > +           output-high;
> > +   };
> > +
> > +   /* Force the on-board PCIe switch to select the GbE upstream
> > +    * port.
> > +    */
> > +   pcie_switch_sel_default: pcie-switch-sel-default-state {
> > +           pins = "gpio16";
> > +           function = "gpio";
> > +           drive-strength = <2>;
> > +           bias-disable;
> > +           output-low;
> > +   };
>
> Normally this would be handled via an actual driver - see e.g.
>
> Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> https://lore.kernel.org/linux-arm-msm/20260605010022.968612-1-elder@riscstar.com/
>
> Konrad
>
The PCIe switch we are using is a NXP CBTU02044HEJ, this is a simple
1->2 switch that is not PCIe enumerable. Given that there isn't support
for this IC already in the kernel and that it will take quite a few
weeks/months for me to cobble something together, I am thinking that it
might make sense to drop PCIe support from this patch-series in V5 and
then submit a seperate patch-series with a driver and bindings for this
IC whenever I get something working. Are you OK with this?
> > +&usb_1 {
> > +   /delete-property/ usb-role-switch;
> > +   dr_mode = "peripheral";
>
> Is it really peripheral-only?
>
> Konrad
On the SBC we have a TUSB321 for role and orientation detection. I will
add this into the DT in V5 so that both roles are supported.

Thanks again for your feedback,

Will

