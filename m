Return-Path: <linux-arm-msm+bounces-50529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5046CA54F2D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 16:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D870F3B47E8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 15:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C386820F062;
	Thu,  6 Mar 2025 15:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="fZezFYM7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD68C20E6F6;
	Thu,  6 Mar 2025 15:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741274977; cv=none; b=IRHIIxnhHTSu4z+FUG1jnPL+DVjQ/+l8hBSPywd9glphIjDkRCWbkQ8G5a+S/7Mk8tJB2b+z6KSWsVnBfiByUe8t1BN4ZvywEhm7IIROE4YZ7K6krfQ1xn1r54Jki0kEDI+5b1GHr6pJL5bNYu9ArHZ94AU4TqorZ9xSrau2TEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741274977; c=relaxed/simple;
	bh=fOOQowHJHtW+gHqQRw+cobzO7tlDBCXQk58mod4OwP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8XHDjItxwBtyNG7qjOXWb9c/m+sKqC1WMdiuoxZio+iEGRqslPGQuiM5HidzP6EP+lLRbnrFegQKg65waUh8yJi+1/zDEAr/52f0ftO8Hwij3R5WDD/0Pcc9evkJAqhsdzkBxaC3fkHzrl5b3RRA3HAtYj9u0HS0J2Wq/8wHsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=fZezFYM7; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+IzmAbgju3FDk0Ryltpo+ejh+hoS4Rf/7x9rJ3Yw0EU=; b=fZezFYM7Q7hsuSZ7fLNC1YsWMD
	DMwJd4MIBQUfPVlx1hne+poqp2G3TNmrhsdZ10bbkAJkvrwOoaKZRJI6Frn1wp/XUr/I4vKrB3sgN
	XPoJWax9YeByq6lz1rUci/uJ0sZ1jzmG+TQ3rdi1O35pli7N37Qp6ofYEqu27pc6pHGs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tqDA0-002pzB-Ms; Thu, 06 Mar 2025 16:29:20 +0100
Date: Thu, 6 Mar 2025 16:29:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jie Luo <quic_luoj@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lei Wei <quic_leiwei@quicinc.com>,
	Suruchi Agarwal <quic_suruchia@quicinc.com>,
	Pavithra R <quic_pavir@quicinc.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
	srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
	john@phrozen.org
Subject: Re: [PATCH net-next v3 04/14] net: ethernet: qualcomm: Initialize
 PPE buffer management for IPQ9574
Message-ID: <74f89e1e-c440-42cb-9d8e-be213a3d83a4@lunn.ch>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-4-453ea18d3271@quicinc.com>
 <a79027ed-012c-4771-982c-b80b55ab0c8a@lunn.ch>
 <c592c262-5928-476f-ac2a-615c44d67277@quicinc.com>
 <33529292-00cd-4a0f-87e4-b8127ca722a4@lunn.ch>
 <cffdd8e8-76bc-4424-8cdb-d48f5010686d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cffdd8e8-76bc-4424-8cdb-d48f5010686d@quicinc.com>

> Thanks for the suggestion. Just to clarify, we preferred
> u32p_replace_bits() over FIELD_PREP() because the former does
> a clear-and-set operation against a given mask, where as with
> FIELD_PREP(), we need to clear the bits first before we use the
> macro and then set it. Due to this, we preferred using
> u32_replace_bits() since it made the macro definitions to modify
> the registers simpler. Given this, would it be acceptable to
> document u32p_replace_bits() better, as it is already being used
> by other drivers as well?

I suggest you submit a patch to those who maintain that file and see
what they say.

But maybe also look at how others are using u32p_replace_bits() and
should it be wrapped up in a macro? FIELD_MOD()? These macros do a lot
of build time checking that you are not overflowing the type. It would
be good to have that to catch bugs at build time, rather than years
later at runtime.

      Andrew

