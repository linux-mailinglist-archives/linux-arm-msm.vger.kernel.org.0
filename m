Return-Path: <linux-arm-msm+bounces-33045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF15A98F65E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 20:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7D29282C00
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 18:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DFA1AB524;
	Thu,  3 Oct 2024 18:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="0OKKxt81"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A840319F134;
	Thu,  3 Oct 2024 18:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727980959; cv=none; b=GoD97RnhDqXI/KV7hG6jwbsDlqEr/73j3nUGhuQZ15ieI7hO7ekq0q4k91iDy/mc3AxUZKP6Xn799YW9btkjCrWDxgAWxCG1ckSAaQAx0aOrx15a7iuxWOvPcFqwPZ2o3MXRWb9Tr+gnVWil3jOH6mxEQlJRW3m7I6nOdQrNhQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727980959; c=relaxed/simple;
	bh=0q5SSCaXUaMZqbCx0JIierHaddgdHVXpOzVy1vt9hIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWe4hVXxKa1AGyAtKEUzGRgaSAB10GgS7N9SQOnFVAMWmmb54+eATx5CjcJYR3x6gnPaTFtG3/4R0QKIcdKqTJRZA9Sfv9tU5ogdkoJ1BTSYEYVjyNx8/njKjze75phOkVsCub36wnVZLrI2ocRhZ4pPs25zZ6ijbwoXZOW3344=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=0OKKxt81; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2RDjJwzjseFZ2RBERk4BN7b4d/RJVlrbdFG7geetqgs=; b=0OKKxt81bC8V4FGa2ByITtAODv
	FxcvNjNTGZd1DTFR5x+XXPzIV8mpoS6kZW1lGcL6HpOkd31SBgarDSet5Ew+deEPrGgO80gE4Ie6J
	FIBjrpKVepAKWyx1b+YrZ+WNxHrJsgL2T4D2NFU2Y9+Dwli4pJ8OvoBCQqm15Jce9OH8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1swQmP-008yMk-5X; Thu, 03 Oct 2024 20:42:25 +0200
Date: Thu, 3 Oct 2024 20:42:25 +0200
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
Message-ID: <febe6776-53dc-454d-83b0-601540e45f78@lunn.ch>
References: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
 <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>
 <817a0d2d-e3a6-422c-86d2-4e4216468fe6@lunn.ch>
 <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>

> Agree that switchdev is the right model for this device. We were
> planning to enable base Ethernet functionality using regular
> (non-switchdev) netdevice representation for the ports initially,
> without offload support. As the next step, L2/VLAN offload support using
> switchdev will be enabled on top. Hope this phased approach is fine.

Since it is not a DSA switch, yes, a phased approach should be O.K.

> >> 3) PCS driver patch series:
> >>         Driver for the PCS block in IPQ9574. New IPQ PCS driver will
> >>         be enabled in drivers/net/pcs/
> >> 	Dependent on NSS CC patch series (2).
> > 
> > I assume this dependency is pure at runtime? So the code will build
> > without the NSS CC patch series?
> 
> The MII Rx/Tx clocks are supplied from the NSS clock controller to the
> PCS's MII channels. To represent this in the DTS, the PCS node in the
> DTS is configured with the MII Rx/Tx clock that it consumes, using
> macros for clocks which are exported from the NSS CC driver in a header
> file. So, there will be a compile-time dependency for the dtbindings/DTS
> on the NSS CC patch series. We will clearly call out this dependency in
> the cover letter of the PCS driver. Hope that this approach is ok.

Since there is a compile time dependency, you might want to ask for
the clock patches to be put into a stable branch which can be merged
into netdev.

Or you need to wait a kernel cycle.

   Andrew

