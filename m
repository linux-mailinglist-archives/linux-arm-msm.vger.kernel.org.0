Return-Path: <linux-arm-msm+bounces-23003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ACB90CA98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8000E1F21C29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 11:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BCC157470;
	Tue, 18 Jun 2024 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjLYd5iD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E451DDDA;
	Tue, 18 Jun 2024 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718710861; cv=none; b=ei6RzZPsQcsRs4KYkftTvowe0jSaKseXU04UBfrIBYVvlGq0Q9UbMeLC1H4HDtzwVc5ZDaFx7+xu+6x7wmLOC+Z/8NA6Q2OR7hR7FMaj2fuqjGzMDFGOdFThaLAk/hWzXtS71PnXHjSN2Mk0ICRjSEfUfOiuaCRcjDiexf+IXGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718710861; c=relaxed/simple;
	bh=iDIeJMIVE5Xw9gFrWbn28dRlmrubU9PS94cMczEVSQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T30uujz7HyzwLaCht3CuDbdRKXBZYuQdBYSqoIZKvnB/ZjmRnG6OMwwkz2TCozLzY1ZWkaAJyIrryisP4OgnOyb8vKfr2v2muUgHOjZCeB71Fw1G0J8aCObXj1VpStQ40SqkP+f8c6hftfeWzPyFUrUx6HO6MuUat6fjbnV/bho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjLYd5iD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBCEC4AF48;
	Tue, 18 Jun 2024 11:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718710861;
	bh=iDIeJMIVE5Xw9gFrWbn28dRlmrubU9PS94cMczEVSQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LjLYd5iDAn1NGIh98XCh+8Bg6hSIHFwd7vzh9FtKbxNVmyCvHUXtlUGaWXMKktayJ
	 dhuXRXiyaKews/09nf6vCZE0EEqzTHbFdI71n9R7ElOpOExj4x9ReSHxV/YnD10K5x
	 M322JGUzMwo7BTZrL6gZKCCFzCSp4NGhxWZWp5EoZtTpNINID8DuNFRs0Fv869EJSh
	 3zJswoQekIQSYqbLBK9Q+74uJLORkqYmcORrO7zwcLvRywVY3ENoIbxj6H61YcPVXH
	 oD+ztXBd96G5W8b3x3DO8J7VwMdcBHxeQPRtX3s6fIk/taeuJK3cmW8I8H86Ztz/ln
	 pPZxiv3Bg2KAw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sJXCs-000000002oR-30Wa;
	Tue, 18 Jun 2024 13:40:58 +0200
Date: Tue, 18 Jun 2024 13:40:58 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Enable tsens and thermal
 zone nodes
Message-ID: <ZnFySuwi-Hz6DNDM@hovoldconsulting.com>
References: <20240614-x1e80100-dts-thermal-v2-1-4d4f9effacc6@linaro.org>
 <ZnAAxlH6yhlJf6fV@hovoldconsulting.com>
 <ZnFapqOxQBK5YViU@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnFapqOxQBK5YViU@linaro.org>

On Tue, Jun 18, 2024 at 01:00:06PM +0300, Abel Vesa wrote:
> On 24-06-17 11:24:22, Johan Hovold wrote:

> > The CPU bottom thermal zones fail to register with v2:
> > 
> > [    0.146219] thermal_sys: Thermal zone name (cpu0-0-bottom-thermal) too long, should be under 20 chars
> 
> Urgh, did not test after renaming the zones.
> 
> Talking to Daniel Lezcano, he seems to suggest that the size can become
> dynamic at some point. For now will switch back to
> cpu0-0-0-bottom-thermal and cpuss0-0-thermal. So that's O for top and 1
> for bottom.

Did you mean to say 'cpu0-0-0-thermal' and 'cpu0-0-1-thermal'?

Abbreviating 'bottom' (e.g. as 'btm') also works and may be preferred as
it's not very obvious what any of the zeroes in 'cpu0-0-0-thermal' stand
for.

Johan

