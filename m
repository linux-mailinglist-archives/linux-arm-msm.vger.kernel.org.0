Return-Path: <linux-arm-msm+bounces-33360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC20D992B9C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F1CC285741
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 12:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42F01D2F6D;
	Mon,  7 Oct 2024 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E409GX0H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69FB1D2F64;
	Mon,  7 Oct 2024 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728303862; cv=none; b=DWEIsypDoHY4ydcw3jZR4KheynMixrSklL4QCvAmlT8toQhqzOSznYC4irmm7HUIjYZB6UtY7M5LjxqvEOXvCbTK3pzSuy0hyd/WT+1ccG1bJdyOFBip4SGDDqSWE4FRT//ZY1f5BRJNTVrxxM0ZuqzcouzDCuZChP0i8Oqq6WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728303862; c=relaxed/simple;
	bh=jk4pZRGL3Zjmo2JffXD0fvRZYzW7fgPSuGEaLM2fUuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R65TiyxjMsBwkWDXLmSpcurVUuwh/8t6H3fsml0mg55eVFetN50RXvEpeGt8sSpo9Xk2ZfhfdIfA6UT9c5JnZyKnf0/ST3XGebVs2WLKaLiuIS8mI0Tf6oURJQQjufOzigwv5czPe6DrxLdDgEVi1o+pH5FQdwGI6TiwGqXp994=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E409GX0H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD0CC4CEC6;
	Mon,  7 Oct 2024 12:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728303862;
	bh=jk4pZRGL3Zjmo2JffXD0fvRZYzW7fgPSuGEaLM2fUuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E409GX0H/jaqb6bz9o6eSHvfuvQ8sGAmCCYifU04aV7Wgu4vZuVvnq4VL67ecpakF
	 xfSz730iLIrM4h2Q5yKtZvksXl93LzS47IAsYrY2XXUtGPnz2uhW+9uFvkiYsC0UcZ
	 0eBACoBXoqsjoWh6dGxby1eJEyofkgALLMuQHkGc5h8h77Ss0wxhGm/m/Nd0YWkCRt
	 0gn++AmTq3BqyphEMMuFB1rg7LIMrCLDrJObp/wK5kza9me7anWqNZaDYiPqp7IBga
	 4tffqxlLvqbUUnxr7RobfLlmRUgA/R6rKe+hNO80WQRpKk4Z6H3T8MrOvIOHYX/9gH
	 gsOPqIAW+7LBA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sxmmi-0000000005s-3lyU;
	Mon, 07 Oct 2024 14:24:20 +0200
Date: Mon, 7 Oct 2024 14:24:20 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Switch PCIe 6a to 4 lanes
 mode
Message-ID: <ZwPS9AB27h7KbtqB@hovoldconsulting.com>
References: <20241004-x1e80100-dts-fixes-pcie6a-v2-1-3af9ff7a5a71@linaro.org>
 <ZwPDxd9JJbgDeJTi@hovoldconsulting.com>
 <ZwPNsTL+5f/6Gtte@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwPNsTL+5f/6Gtte@linaro.org>

On Mon, Oct 07, 2024 at 03:01:53PM +0300, Abel Vesa wrote:
> On 24-10-07 13:19:33, Johan Hovold wrote:

> > So you should perhaps rather say that you are fixing the description and
> > compatible of pcie6a, which *is* a 4-lane controller, that can also be
> > used in 2-lane mode. Or similar.
> 
> Agreed. Will reword to say fixing the description as suggested.
> 
> Just to be sure. We still don't want this backported (even with such
> rewording), so no fixes tag, right?

We don't want this one backported (because of the missing deps) but you
can still add a Fixes tag. Just tell Sasha to drop the patch if autosel
picks it up anyway or use the new do-not-backport stable tag to achieve
the same:

	Cc: <stable+noautosel@kernel.org> # reason goes here, and must be present

See Documentation/process/stable-kernel-rules.rst.

Johan

