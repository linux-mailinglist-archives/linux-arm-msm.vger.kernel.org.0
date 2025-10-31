Return-Path: <linux-arm-msm+bounces-79836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EB4C24224
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDE13189D73E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 09:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5343314D7;
	Fri, 31 Oct 2025 09:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fr0rdd8D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91523314BB;
	Fri, 31 Oct 2025 09:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761902605; cv=none; b=reUGuT78PBvPIp72MI3iw46/IcG3+T7AfMO1mAZPalv0L5hl6uQiyluG7/8pCyAsR5sqrdbipOfmcVg7GW5hl/twiiQDcOSztNfPi5pWmrxZKCRhfyd8wqd+XphBzpY+2tcHLbe5wqsU2ZprF3mywAhzBf2VdgOJdXq8qbdsUbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761902605; c=relaxed/simple;
	bh=dVRGU8ESodd6rjK5NxMPSnQ+ixQ7fU4JJtNrUUCcPEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqtADFDYgPOsjRaBKdEY3s1cv4ghja5Qs/U/IFN1l8CSOzOHmctMTnYXkNuvEAI0wkXstXBj8EQC3sqVnM1lf+3RY2AUl8/Ft8dP0ydWGuEOdtygnVVhJN/jLZ+E4U8+wrrzPL2cjiR6mubZQl/qpNvcddgwTxpSJywTrsMSS+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fr0rdd8D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685D6C4CEF8;
	Fri, 31 Oct 2025 09:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761902605;
	bh=dVRGU8ESodd6rjK5NxMPSnQ+ixQ7fU4JJtNrUUCcPEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fr0rdd8DQIgVK5Xze9WxbP9u/KTZ6rwN96QZrqrV9IJ87kEvyhjWCzHoScG62wC5Z
	 mQNM25tVI1c68oawdONi7gWx31CvYrYf3y69aufRDps6cGDoRBZsOWeCj0hweHGA2u
	 /ySHjvI1yryTeB5oqMrQo03CBfaoC8pwGYzAn3BSI1q47i+rO7t6TfKYvEFJGzmJco
	 9h+aZvO8+xaM/KyDR6X6yS0W7lwdvLYii1DEM0smXQ6LhniaI4LU3524hpVDISTjNz
	 wbu2DKnAUQof4sMW5HinkhdenIZEx2QfR0gcVWn7VskVLvePEAL/gjBl5UBfAe+ypj
	 9nhbzOqCN55ZA==
Date: Fri, 31 Oct 2025 10:23:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AlexeyMinnekhanov@kuoka.smtp.subspace.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Re: [PATCH 2/3] clk: qcom: mmcc-sdm660: Add missing MDSS reset
Message-ID: <20251031-upbeat-gainful-pudu-aad0de@kuoka>
References: <20251031-sdm660-mdss-reset-v1-0-14cb4e6836f2@postmarketos.org>
 <20251031-sdm660-mdss-reset-v1-2-14cb4e6836f2@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031-sdm660-mdss-reset-v1-2-14cb4e6836f2@postmarketos.org>

On Fri, Oct 31, 2025 at 05:27:44AM +0300, AlexeyMinnekhanov wrote:
> From: Alexey Minnekhanov <alexeymin@postmarketos.org>
> 
> Add offset for display subsystem reset in multimedia clock controller
> block.

... which is necessary to reset display when foo bar happens...

> 
> Cc: <stable@vger.kernel.org> # 6.17

Provide Fixes tag.

> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>

You sent us broken mailing, broken from field. That's why this probably
ends in spam.


Best regards,
Krzysztof


