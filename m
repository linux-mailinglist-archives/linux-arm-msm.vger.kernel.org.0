Return-Path: <linux-arm-msm+bounces-33123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9B8990479
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 15:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2343B21DC3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 13:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0BFF2141DB;
	Fri,  4 Oct 2024 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="l2FhARoH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF772139D1;
	Fri,  4 Oct 2024 13:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048722; cv=none; b=toEG0Dhv1RAnvPSK2W6NLBYdF1a6ir7aagt9nsQ0A4e+3G46dz3p6w8DDMwVGGXaq0v9B3MCopt98W7znFRaTGZBupIRtRdxocEiBvZOidw1EKiku4sK+PPReGhAQTV6pSOGF2nSgIQ9pv2KIc2lqEk3AzXOZg+4H6yW/2iXfPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048722; c=relaxed/simple;
	bh=4ZcG6HApmxFgnmkhEQ0/UXTPCxyU/LuPOCdIeoOi5+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtWYSGx6qYF8IZQl+myJiDd7dc26uTQ6BBw8V9gQ7lTxCEwqpFJwKPj1FFR9vrMoAyocUJG5JVu5ssby2vUwfirqBPUr3e6zRDxkY3Z+TyhvrmI0VEk1DB179WqtLcf9rclbCY3tvkqmtJ37qv9Qwb56xdYGY8Lb9TF7hlFH3Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=l2FhARoH; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YEzeoPK+5DMNMwCTBYHijBFYiufFU95QnUnFGGXLTB8=; b=l2FhARoHXz0xzvTYN3Jio9mbZi
	GZY/sY4heG0arqH2J/2cRaEWJqcMEVuJZ8mV1O6Lbx54b4sac9NLP3c88vqAXb5X979bugvbcdlpA
	pDkLwBPxkWOwe33GIVRQVl4I/PZU4DlLcFfXWfKoSWnTdOkJ9UQ3+CCgXj9sMrruuhis=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1swiPJ-00931j-QA; Fri, 04 Oct 2024 15:31:45 +0200
Date: Fri, 4 Oct 2024 15:31:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Kiran Kumar C.S.K" <quic_kkumarcs@quicinc.com>
Cc: netdev@vger.kernel.org, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, vsmuthu@qti.qualcomm.com,
	arastogi@qti.qualcomm.com, linchen@qti.qualcomm.com,
	john@phrozen.org, Luo Jie <quic_luoj@quicinc.com>,
	Pavithra R <quic_pavir@quicinc.com>,
	"Suruchi Agarwal (QUIC)" <quic_suruchia@quicinc.com>,
	"Lei Wei (QUIC)" <quic_leiwei@quicinc.com>
Subject: Re: RFC: Advice on adding support for Qualcomm IPQ9574 SoC Ethernet
Message-ID: <54102e54-59b6-4881-8fbe-23954ea4d297@lunn.ch>
References: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
 <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>
 <817a0d2d-e3a6-422c-86d2-4e4216468fe6@lunn.ch>
 <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>
 <febe6776-53dc-454d-83b0-601540e45f78@lunn.ch>
 <6c0118b9-f883-4fb5-9e69-a9095869d37f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c0118b9-f883-4fb5-9e69-a9095869d37f@quicinc.com>

On Fri, Oct 04, 2024 at 06:36:59PM +0530, Kiran Kumar C.S.K wrote:
> 
> 
> On 10/4/2024 12:12 AM, Andrew Lunn wrote:
> >> Agree that switchdev is the right model for this device. We were
> >> planning to enable base Ethernet functionality using regular
> >> (non-switchdev) netdevice representation for the ports initially,
> >> without offload support. As the next step, L2/VLAN offload support using
> >> switchdev will be enabled on top. Hope this phased approach is fine.
> > 
> > Since it is not a DSA switch, yes, a phased approach should be O.K.
> > 
> 
> Ok.
> 
> >>>> 3) PCS driver patch series:
> >>>>         Driver for the PCS block in IPQ9574. New IPQ PCS driver will
> >>>>         be enabled in drivers/net/pcs/
> >>>> 	Dependent on NSS CC patch series (2).
> >>>
> >>> I assume this dependency is pure at runtime? So the code will build
> >>> without the NSS CC patch series?
> >>
> >> The MII Rx/Tx clocks are supplied from the NSS clock controller to the
> >> PCS's MII channels. To represent this in the DTS, the PCS node in the
> >> DTS is configured with the MII Rx/Tx clock that it consumes, using
> >> macros for clocks which are exported from the NSS CC driver in a header
> >> file. So, there will be a compile-time dependency for the dtbindings/DTS
> >> on the NSS CC patch series. We will clearly call out this dependency in
> >> the cover letter of the PCS driver. Hope that this approach is ok.
> > 
> > Since there is a compile time dependency, you might want to ask for
> > the clock patches to be put into a stable branch which can be merged
> > into netdev.
> > 
> 
> Sure. We will request for such a stable branch merge once the NSS CC
> patches are accepted by the reviewers. Could the 'net' tree be one such
> stable branch option to merge the NSS CC driver?

Given Bjorn reply, maybe you should explain in detail why you have a
build dependency.

A stable branch has some overhead. We should not create it just to
find out you have your architecture wrong when we start reviewing the
code, and it is not actually needed when you fix your architecture.

So, details please.

	Andrew


