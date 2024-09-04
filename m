Return-Path: <linux-arm-msm+bounces-30642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A9796B3A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 09:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F1462878F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 07:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FBBD1527AC;
	Wed,  4 Sep 2024 07:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPRU3Awy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40400126C0A;
	Wed,  4 Sep 2024 07:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725436528; cv=none; b=cxSJp74UJTuWd6h6y3XEgMv+hksN7UcBksmfnfiiRYdlnN1GvdOtRlDu9vWX608y8fLmNCSgOKuxCY9trXKd7loKXTX3umJXjqgCj4VQc5KqK+FBxUbldYp0hQZk/rXuiaNBH7nA+RVj0A/JeFvUOa4amQrITNvEuiI2AHcmObc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725436528; c=relaxed/simple;
	bh=bBBwtVwe1xDeoUqtcuZoZCWqOiF+XrXlVt8ywrYYpHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gB4tsVgUPWbFVJHafSP2C5h37ctvD1ELq7JL8zBApilGWCASr3pWe9G96cojJa5+ooXfzERp458HYHEhJ2gW6S5Arbf+gTGdnj3i5Z6YtxGegskGPOcnCniqYrex3XcxXdOFEyxJkx8+dk96o7wglB28ShbGHP4JZvwU7vm5LVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPRU3Awy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A25C4CEC2;
	Wed,  4 Sep 2024 07:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725436527;
	bh=bBBwtVwe1xDeoUqtcuZoZCWqOiF+XrXlVt8ywrYYpHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPRU3Awyp/wurFG0oK44/WiYXqmDykl9KgeI83voQm43TkWjdTE6X8F+auCkaREok
	 D7K+S3Z8KcBNVEU4MivSVITAee3qrBMhs7cAQNrvat4KogBDpjm1I9qqGOFltDI8H1
	 7W/fy4T3a0aWHz4rGYK/Jby1Xf4XGeKQWESOu6IdO5MGpaMAf9CwLHn8pOitiDwFFn
	 pAsLs9vJkeIBa4m1Ox3U7H6lA3S2uZmpe3mP0XpX/SdQRtiA7CKTrQMcabkWVVAfyN
	 vGhDL0OPHEITn3SumEXbdHtQMuBKFGc8AbBCljUZuutsE7RQ5B5urqfVA2hgQ4lA2v
	 emPYaRdxm4p9Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1slkrg-000000002Yr-2O35;
	Wed, 04 Sep 2024 09:55:44 +0200
Date: Wed, 4 Sep 2024 09:55:44 +0200
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
Message-ID: <ZtgSgDq2_y-7NpHm@hovoldconsulting.com>
References: <20240903224252.6207-1-jerome.debretagne@gmail.com>
 <20240903224252.6207-5-jerome.debretagne@gmail.com>
 <9a2b9e55-2bbb-4b91-8d81-1f1f82347125@kernel.org>
 <ZtgSMlgKyQ6nKu4U@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtgSMlgKyQ6nKu4U@hovoldconsulting.com>

On Wed, Sep 04, 2024 at 09:54:26AM +0200, Johan Hovold wrote:
> On Wed, Sep 04, 2024 at 09:46:09AM +0200, Krzysztof Kozlowski wrote:
> > On 04/09/2024 00:42, Jérôme de Bretagne wrote:
> > > Add an initial devicetree for the Microsoft Surface Pro 9 5G, based
> > > on SC8280XP.
> 
> > Rest looks good, except ordering of nodes/overrides/phandles. They
> > should go alphabetically, AFAIR, so your &tlmm is placed in wrong spot.
> 
> For the other sc8280xp machines (and I believe at least some other
> SoCs), we placed the pinctrl section, which tends to be quite long, last
> on purpose with a separating header (e.g. so that it is easy to find):
> 
> 	/* PINCTRL */
> 
> 	&pmr735a_gpios {
> 	...
> 
> 	&tlmm {
> 
> 
> Looks like the header comment is missing here if you want to follow that
> style, though.

No, the header is already there, sorry.

Johan

