Return-Path: <linux-arm-msm+bounces-94019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDiKMT1vnmkvVQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 04:40:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6C21913EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 04:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CAD913029774
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 03:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04CB29AAFA;
	Wed, 25 Feb 2026 03:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lch/AR3T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E817A2EA;
	Wed, 25 Feb 2026 03:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771990843; cv=none; b=Hoaj1y2P3Fw+RihaaeHd+ioxvhaWw29kbuovK0MvzwXU+JhQSIVlHPnDePGyDf2nJpwyqv3nx8InT9RiPAq3D5XEYnVk3AwBr3GFI68cHceFER0s9ROogmoSmK/djkGzWACdYEQVy5lpVjbbOUfUNRcWZVTq0uDKcYz9nN8rQew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771990843; c=relaxed/simple;
	bh=SH1l2VHXFd2mlhizLCM7eVb2wpOXLRKRe8YOIkeJkv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dC7YIAkTKF1SkCO9CLyb+AST7CtvP2qRIkBVPFv7Hh423OiZUXiufGXeXz6aw4MbdwRnpqj3bpzvWG/LaXPKjMXyIyg8gQHSLAUyBj6PFIdL4g5Vc2ZLFVIt4RCSLhNzP55Hdo0ypoijWQ+53Av8jTGI+CuLNkOlHMIGh1ctw14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lch/AR3T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578DBC116D0;
	Wed, 25 Feb 2026 03:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771990843;
	bh=SH1l2VHXFd2mlhizLCM7eVb2wpOXLRKRe8YOIkeJkv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lch/AR3TzcXQhwRHw3JK9Thp6XVQwEdVIwXe2N+gXNT5PVSoZJ3EUFNKw69Yi+t6X
	 CLdhqC0hSjET5kyeYeiSNK1H7PAY5EtFKQhNUR2cimetDL3jDLSEFthVqN5YE7p5XC
	 VdRXBexpOa2JxttwyzZojCm8b9wN5eIH4h95P1TwGJOsU4O6XMJDJZ1PG/hPA0EyPh
	 fawG5xT1/TvLVqVRc6fP1ZyBZwO6hyJEwga1EY555ZbATU76r4I3wUOjR9H5jHAPxF
	 r9fu7aWlWVw0Hz7LFv08uq5pr62y2asjhxc63sc7D6wotRC8Ku9cuwAYFTuPO6FqWB
	 siO8nsatFCx+w==
Date: Tue, 24 Feb 2026 21:40:40 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201
 and GL3590
Message-ID: <5slnnbku4wap4bpyg5iyme3zmzst3frggdukg4elli3e3pmsow@7oueerydfiq2>
References: <20260212-rb3gen2-upd-gl3590-v1-1-18fb04bb32b0@oss.qualcomm.com>
 <iy3yypj2gcl6znygsyoxja3lh7irrl25snqnbxfmyhyhqgays2@57lyx33bthh6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <iy3yypj2gcl6znygsyoxja3lh7irrl25snqnbxfmyhyhqgays2@57lyx33bthh6>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94019-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C6C21913EB
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 09:52:45AM +0200, Dmitry Baryshkov wrote:
> On Thu, Feb 12, 2026 at 02:43:46PM -0600, Bjorn Andersson wrote:
> > The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
> > the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
> > two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
> > interface.
> > 
> > The Renesas chip is powered by two regulators controlled through PM7250B
> > GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
> > The Genesys chip power is always-on, but the reset pin is controlled
> > through TLMM GPIO 162.
> > 
> > Describe the Renesas chip on the PCIe bus, with supplies and reset, to
> > allow it to be brought out of reset and discovered. Then describe the
> > two peers of the USB hub, with its reset GPIO, to allow this to be
> > brought out of reset.
> > 
> > The USB Type-A connectors are not described, as they are in no regard
> > controlled by the operating system.
> 
> Nevertheless, their presense in DT controls port's connect_type as can
> be seen in sysfs.
> 

Is that information useful enough to be worth describing the connectors
and wire them up, despite being completely passive?

What consumes connect_type?

Regards,
Bjorn

> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> -- 
> With best wishes
> Dmitry

