Return-Path: <linux-arm-msm+bounces-112684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gciaNn2BKmpnrQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:35:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 55477670729
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:35:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ar3clG6q;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112684-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112684-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3299E301484C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C0A3BE15F;
	Thu, 11 Jun 2026 09:35:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E023BE16F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:35:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170552; cv=none; b=PN2/wF9gmQqS5ZGp43D0OE9TsFkKRCRtoTRCfVEbnjkSlH/ANNeUJs2NWPXgBrj/3eDaE4OLQcATLLwYfp52ZyMuySV4t3uWNHkSh8IhJ0fgwXsypHQTEmzm77wizvemd6tVw9K55PBFrDDps+cUCZ7w8jTFkUe4ts623b3KCt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170552; c=relaxed/simple;
	bh=a9lsTRPgrPvriMugNy1IK/2cBwKGI6ZEzPafPe3LMwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4W+fX8EfLVD9kPsT6zeAFdh0sNqzECinC2rjCTsz0LJYVojACBsTMqhim/rId/mo4kMu5pBu8Vank4yaJL+ePkils24lddiMCQJ7gC35RpERglkh88TNwfKDOzMDkR4+PIbD9cwNOpjlbxLptlGQfkcw44ubzup6cB48DtazP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ar3clG6q; arc=none smtp.client-ip=209.85.214.170
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0aa420401so59680575ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781170549; x=1781775349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+TREFnKQMiKfm+gKa4cK2y0yw07iC6grGzwaDgz34/g=;
        b=ar3clG6qN/ktNZ8WT+DMfVHoDpT1otkJNk+dQQh+C83+8Dn01DHlsVt9J56W1w67En
         JXVyxD+0vQ33wNEhhmFJPSybf1AHfwExM024Af7zphHBGuBEKT/wRj8KXsDedwRmyIyc
         pAJzComMwC1XfP5dkEdlk3Y7CxAZn+LPEqEyCEtHXYYSw7fKStDDrBu97zVYRKOCAxoY
         vzQgZ+1hgIVru8kTacifPxFe5bZ5sHAWnn0bHExtNDEHSfpY1ERYxY1VnDPgcv/5MULQ
         RWZdMaOwAohZSM0ZSPanqMon8QWkAv6YkfgQeYT3d7v++0utTpzFB6JgPFtAm24vVwQS
         FpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170549; x=1781775349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TREFnKQMiKfm+gKa4cK2y0yw07iC6grGzwaDgz34/g=;
        b=WaXtomHtk86vPoz6kjyXdsUKk/5mNp8pmE5Tg5xOUWmcd9m56GrEES7YHiohAqk349
         jrbOApdg0xJ5s9e1Gf2RWt1OQuyeVC5SCXDwf6eZLptdaeqabBk2N1q98DuSlNFJK4EP
         HdwUd+1bpjjcZxZkjAb3rU0jR9Z877ZfepDoCCvPiGg+EkvWQS+CUXut5I+nfTAsMgpu
         iXg2Xk3tOAkijh2IaOS4OlDBZSJFGCT1k7QySzDa1phneNtrzFVeCSGZ4lcfQ8LK/H+O
         o1IF3rhFXk6RFA+WsUWHD0/D3hR7tA7WdnRzQa5GLJgh1HC2V9PvRAuXiEutXcmCIJVn
         I70Q==
X-Forwarded-Encrypted: i=1; AFNElJ89XaTVa4AkI0NxrxM8vdKukAqoLdjjSigbzW5f9mF1m8y6zw6NYradT6bFF+ilOKnzwxrj6irJL08IKw2n@vger.kernel.org
X-Gm-Message-State: AOJu0YzchpZ2nkzI+3/XGdyZZUVpNBumEPEcABpnu/+bXkWmxyubTmsM
	BxJmHvAFf4OKPHAZb7ihbxl9why49VrIWPymicSi/Y0h22VnxrueN4YH
X-Gm-Gg: Acq92OHdyD+/DHaFnawa7XJANSW9gUdnYU4O0BuBfnl6MPEwZvUNpuQC23lK+pBawnn
	Uyy7YT8oXQDyG83FgSJMxNKF/w3dUmeIxfavHN+aZGQMBIu4qbkHWJVKiA9OtFstC+uk8e3xbxZ
	SYk0o8qIsp8RZ3CZ4awtyOGMrMW2BH6iCPQLrT+tdr3rBDfWc5mEg8rI5p17cjKjUQwL61jVSGY
	UIJJyJnehlYNUk6Hmz30hwM4bbS9pZOrSPPHtb7jwRW73jlC4B9rBiokfIKCokpZnV6tIpJ/GjV
	owCHuDrdb9ubMYbyKcLRz6TvH4SHpaerP3MxAwYX3bsDG2BnxXzq21ENfX6obgWcNIv/mAszNna
	A48d2oFlUb6Hf13um11WoRekl3ns/RZHUkX1II1JKF5pyhpUDBSghQBn9OUcswNh11zlyBDMsDo
	dkcX5I/RvX+EQf6YlVlMQU7cB44XiA274YUnIzOvsSs9YO0Ikiv3cisg==
X-Received: by 2002:a17:902:fc46:b0:2be:3626:dd42 with SMTP id d9443c01a7336-2c2f0b20e74mr24781095ad.6.1781170548721;
        Thu, 11 Jun 2026 02:35:48 -0700 (PDT)
Received: from page.local ([2402:a00:163:2ce9:c93c:e372:27b8:7e1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d69csm270572795ad.2.2026.06.11.02.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:35:48 -0700 (PDT)
Date: Thu, 11 Jun 2026 15:05:41 +0530
From: Ajit Singh <blfizzyy@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
Message-ID: <aip7U3GXEjDEQLq0@page.local>
References: <20260607113658.25117-1-blfizzyy@gmail.com>
 <20260607113658.25117-4-blfizzyy@gmail.com>
 <cc48189f-421c-4d04-945a-5905fa52357c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cc48189f-421c-4d04-945a-5905fa52357c@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112684-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,page.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55477670729

On Wed, Jun 10, 2026 at 03:01:48PM +0530, Konrad Dybcio wrote:
> On 6/7/26 1:36 PM, Ajit Singh wrote:
Thanks for review, Konrad!
> > Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> > QCS6490 SoC.
> > 
> > This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
> > support along with regulators.
> > 
> > The UFS ICE block is kept disabled because enabling it currently causes
> > an SError during qcom_ice_create() on this board. UFS works without ICE.
> > 
> > Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> > ---
>
> [...]
>
> > +		vreg_l16b_1p1: ldo16 {
> > +			regulator-name = "vreg_l16b_1p1";
> > +			regulator-min-microvolt = <1100000>;
> > +			regulator-max-microvolt = <1300000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +
> > +			regulator-always-on;
> > +			regulator-boot-on;
> > +		};
> > +
> > +		vreg_l17b_1p7: ldo17 {
> > +			regulator-name = "vreg_l17b_1p7";
> > +			regulator-min-microvolt = <1700000>;
> > +			regulator-max-microvolt = <1900000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +
> > +			regulator-always-on;
> > +			regulator-boot-on;
> > +		};
>
> Any reason for these two to be always-on?
vreg_l17b_1p7 supplies VDDD of the ES8388 audio codec, and vreg_l16b_1p1
supplies the CH7218A eDP-to-HDMI bridge. Both consumers are not described in
this initial DTS and will be added in follow-up patches.

So yes, these do not need to be always-on in this patch. I will drop
regulator-always-on and regulator-boot-on for both.

>
> [...]
> 
> > +&usb_2 {
> > +	/* Routed to an onboard USB hub for two USB-A host ports. */
> > +	dr_mode = "host";
> 
> Do they need to be powered/power sequenced in any way?
> see drivers/usb/misc/onboard_usb_dev.c and e.g. qcs6490-rb3gen2.dts
> -> usb5e3,610
Thanks, I checked it. For Axon-mini USB hub is powered from the shared
VCC_3V3 rail, which is enabled by board hardware. There is no hub-specific
reset so I think no power sequencing is required here.

> 
> Konrad

Ajit

