Return-Path: <linux-arm-msm+bounces-21598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3428FB225
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 14:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A12DB237FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 12:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB022146A8A;
	Tue,  4 Jun 2024 12:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XnZK0iDh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D96E1465AB;
	Tue,  4 Jun 2024 12:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717504003; cv=none; b=XQ0QR5tTTXEa8X2WSlGewkZs7Z46wRx9Mju6w8OMVjb5+d7yvkkJMM2K/YgJotbtXCkHYwyA8q+H+QWneqHiZ/qF19ZHXT7wGrt2yKgejwaz11pqObaODyWuTFyvigZPnGNF5q0APj5b72nqOCncAV6005OTuibIe/jJ7C1Mazw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717504003; c=relaxed/simple;
	bh=RWEfxkpS0onejmp+ePUKBf89QbF+aPLs1HXvxSHQjGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwcoFjvjBkSrBLjXmjMT+xxTHguXD132fPIiNpTzv6tZW4r4C+TrTbQaUJ3JxON3lQX12yyaOHjTnun7DDWPH3WXPNdmgvGpXCyEBkcXHq7ePMLuzkoDY23LaPMabFeg151PuribuWj4lmz25/HfbP/abGpMeFNHd4Ltu+kbPuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XnZK0iDh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507AFC2BBFC;
	Tue,  4 Jun 2024 12:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717504003;
	bh=RWEfxkpS0onejmp+ePUKBf89QbF+aPLs1HXvxSHQjGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XnZK0iDhRQdr4Wv2eA9VGuAMvBx3w5Ty4OCxEBvTG5AMActM0Emy/Ckvn6TeEvXB4
	 gdZQ8k4vkul5NuyIeBGjHzaqJqgnoBVQAUjcLrWCxWHxoN5zc9yrSjfkXAmEFlIPH1
	 nRvDn65//ODW142sdqJV/sE0Wk+SzdolEL8yGHUlB7aGlFUYgXzQiJLvXDR5KAx7gj
	 NvT4sdkmXQbFFQGrad2EKCOIWNHvGQ/5x0Tx6sReebsfR3knsVknClPRqmr15QJ0Wd
	 6EcH6ZfoaTE8WI23cJtrfwcX4NVW8cO7m0HmJ5EQVpytSgL3kdoPp1k1f1j4U2kRZa
	 qGC70M/TZC0Zg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sETFS-000000004PU-1qC2;
	Tue, 04 Jun 2024 14:26:42 +0200
Date: Tue, 4 Jun 2024 14:26:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document the X1E80100 QMP PCIe PHY Gen4 x4
Message-ID: <Zl8IAqTehDrVUJ4k@hovoldconsulting.com>
References: <20240531-x1e80100-phy-add-gen4x4-v1-0-5c841dae7850@linaro.org>
 <20240531-x1e80100-phy-add-gen4x4-v1-1-5c841dae7850@linaro.org>
 <Zl26Y0VklPmiirem@hovoldconsulting.com>
 <8e5610de-8091-4a08-a3b8-a0eecdc89438@kernel.org>
 <Zl73xRo7JpAZ5ViO@hovoldconsulting.com>
 <2626e3b0-a407-4e05-9c86-6d7cd40b9307@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2626e3b0-a407-4e05-9c86-6d7cd40b9307@kernel.org>

On Tue, Jun 04, 2024 at 01:37:46PM +0200, Krzysztof Kozlowski wrote:
> On 04/06/2024 13:17, Johan Hovold wrote:
> > On Tue, Jun 04, 2024 at 01:00:35PM +0200, Krzysztof Kozlowski wrote:
> >> On 03/06/2024 14:43, Johan Hovold wrote:
> >>> On Fri, May 31, 2024 at 07:06:44PM +0300, Abel Vesa wrote:
> >>>> The PCIe 6th instance from X1E80100 can be used in both 4-lane mode or
> >>>
> >>> nit: s/PCIe 6th/sixth PCIe/
> >>> nit: s/from/on/
> >>> nit: s/both/either/
> >>
> >> That's really nit-picking and not helpful in getting things merged.
> > 
> > Writing proper commit messages with correct grammar is in no way to be
> > asking too much (especially from experienced kernel devs).
> 
> Well, many of us are not native English speakers, so when the commit msg
> is 100% understandable, pointing out grammar mistakes or style
> (6th->sixth) issues is nit-picking and is asking for unnecessary work.

Well I did use a "nit:" prefix for a reason. And I hope people are still
interested in improving their English even if it's not their first
language.

Johan

