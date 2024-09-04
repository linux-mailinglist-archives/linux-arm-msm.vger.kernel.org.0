Return-Path: <linux-arm-msm+bounces-30641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A51F296B396
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 09:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6105A2834B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 07:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA722155A4F;
	Wed,  4 Sep 2024 07:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3BrWzj5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD151527AC;
	Wed,  4 Sep 2024 07:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725436450; cv=none; b=YnYM1/kOAhYcRuKldbtfA3iZpmj/G1UoXjvn0CNEkSksO1D/SiJxX/6uYRCNE+Yo4G5BCcgCuPiljLynmwAsLymrSGjkBALlt/X8vMxmNtqPyox0cWWaVMVtSUExZysjldA69j7tfc/WE/r6LoPHrINVHdcHPmO30gP6JuITf1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725436450; c=relaxed/simple;
	bh=tYtrEDc7EZsTjo/5ig+4fdGj4uBHOZMkYPvyjZdx0ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gfLkh8Kzd8JBGpaebeXEXnzBKZaCxhDXjDUqDsy9PzmZaLrVKbScAkyPLhEU83JuycOzfU7WuKG7DEx+sfDt0tmGrsllVeUunXxRD/0xaLRtP2J5A2SYowcCILSIqZlPvgMqnumHX2h6b1LQjqML7XbszMnJekbZkPvSWAa3vLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3BrWzj5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44455C4CEC2;
	Wed,  4 Sep 2024 07:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725436450;
	bh=tYtrEDc7EZsTjo/5ig+4fdGj4uBHOZMkYPvyjZdx0ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K3BrWzj5Q/cI6MLryFyFrDV3vlEV+n3mwK9gHQH4f0iHw8++ZKuk+whdWkiomUum1
	 vxZI4P/VDgAAlm1Bc4qsRr5VjWmFW9ksm5N5Rqlqw5Fq0jrr80fdLsmowdtJbi99T8
	 5q9zropvuX1LcVYkzeWrW/2jLEAWDcvHhvq1vkcZPPizCKDtEoucwRKaGIrhmdoZZU
	 RtB0f2prBA5pM7RBJfBD1lNl6niKHKdu42y/4Sl8C6dmhyqhyVg6JZ7S9LHajQh+88
	 iSYlvVLLpkR5PN1oz3bSSibo4ujwTgKGVZLwIKeQVDCqE+ELpCd1MeShfiYT/RyfWX
	 4FkSJ5rH9PtGA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1slkqQ-000000002X3-1cIo;
	Wed, 04 Sep 2024 09:54:27 +0200
Date: Wed, 4 Sep 2024 09:54:26 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8280xp: Add Microsoft Surface
 Pro 9 5G
Message-ID: <ZtgSMlgKyQ6nKu4U@hovoldconsulting.com>
References: <20240903224252.6207-1-jerome.debretagne@gmail.com>
 <20240903224252.6207-5-jerome.debretagne@gmail.com>
 <9a2b9e55-2bbb-4b91-8d81-1f1f82347125@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a2b9e55-2bbb-4b91-8d81-1f1f82347125@kernel.org>

On Wed, Sep 04, 2024 at 09:46:09AM +0200, Krzysztof Kozlowski wrote:
> On 04/09/2024 00:42, Jérôme de Bretagne wrote:
> > Add an initial devicetree for the Microsoft Surface Pro 9 5G, based
> > on SC8280XP.

> Rest looks good, except ordering of nodes/overrides/phandles. They
> should go alphabetically, AFAIR, so your &tlmm is placed in wrong spot.

For the other sc8280xp machines (and I believe at least some other
SoCs), we placed the pinctrl section, which tends to be quite long, last
on purpose with a separating header (e.g. so that it is easy to find):

	/* PINCTRL */

	&pmr735a_gpios {
	...

	&tlmm {


Looks like the header comment is missing here if you want to follow that
style, though.

Johan

