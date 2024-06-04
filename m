Return-Path: <linux-arm-msm+bounces-21603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4308FB2BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 14:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70DDCB27619
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 12:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8908D14883E;
	Tue,  4 Jun 2024 12:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cssoYtmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0D714882E;
	Tue,  4 Jun 2024 12:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717505253; cv=none; b=Wg+qptplPh4JNKjfpj/GqI2y/r2PeaVaek+9R+DgucrSwwDh/ADJNdMykcJl6apwrX9lxkAzP5K0AIJZrNF+J5I1CepsbCGk9VC7diuQ+IWiEA478w4f0pYKtARlhQmF+sVTipGpqMKauCvKgjD5Hw6yXTRDZQqjlDRzQzkCw2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717505253; c=relaxed/simple;
	bh=rdj7NjUA2e8kdTVCfbHCdHY3DC1PZ42LL1L5p9ecFaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phHVA6Vv4tcNoe9x1GvOe4DVYIgDISfO/qW58X4hHoxDa/iSASPh6EN3NPZZGjCgLUNpSMOAsjVGWPC/3poXqeq6XCzB6uNvc7K0gHbRXWFL0uaOydUR1/D4XCT+2zcPmr0hA4/fBo0RxfO9KsOOxttlDWEzTvTAxF11vUjjAPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cssoYtmI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCBDC4AF09;
	Tue,  4 Jun 2024 12:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717505251;
	bh=rdj7NjUA2e8kdTVCfbHCdHY3DC1PZ42LL1L5p9ecFaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cssoYtmIOvOjotRBfBJ8ooWx6Q+a/lrXI3INmmSN55NAp8Et+jvl8yaUeqAbexC5o
	 eurd7z6rAtBH7zxOO4XfvWjn0pY0EnNtyOoqJpA7Voq90KclyxV77FhU8xsVSiaIqf
	 sAp/k0ylo48DouSSf9i/PI2RzMihI3Fy/FyRBbvqspMvDZjz3cV0zcKa2qrBMa8wTj
	 oqNEr8ihwsO8Ehz1TuxHIajyKbTdM2pwGoj3m+U1wZCy398532ERBh2EfxYWJ3pu99
	 rvrKDtjwMDt11tm5/izgU1k/daYIL9VRfKdNI+ShrtY42bGpUYTjhu6gcaKEiPndhT
	 /x8NHNhpzBwhA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sETZa-0000000080f-18hx;
	Tue, 04 Jun 2024 14:47:31 +0200
Date: Tue, 4 Jun 2024 14:47:30 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add X1E80100 Gen4 4-lane mode
 support
Message-ID: <Zl8M4mPjSjWxrSkN@hovoldconsulting.com>
References: <20240531-x1e80100-phy-add-gen4x4-v1-0-5c841dae7850@linaro.org>
 <20240531-x1e80100-phy-add-gen4x4-v1-2-5c841dae7850@linaro.org>
 <Zl27FJVU_YHokCiD@hovoldconsulting.com>
 <Zl8H0KOrfuF91kpZ@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zl8H0KOrfuF91kpZ@linaro.org>

On Tue, Jun 04, 2024 at 03:25:52PM +0300, Abel Vesa wrote:
> On 24-06-03 14:46:12, Johan Hovold wrote:

> > I tried this patch along with the DT changes and the link on the CRD
> > still comes up as 2-lane:
> > 
> > 	qcom-pcie 1bf8000.pci: PCIe Gen.4 x2 link up
> > 
> > so something appears to be wrong here. (I noticed the same with your
> > next branch last week.)
> > 
> > How did you test this? Does the link actually come up as 4-lane for you?
> 
> This is the PHY part. The controller needs some changes as well.

Are you sure? It wasn't needed on sc8280xp (except for updating
num-lanes in DT).

> Yes, as of yet, I'm not able to bring the link up in 4-lanes mode.

Thanks for confirming.

> This however doesn't mean the PHY sequence is incorrect.

Not necessarily, but it means it hasn't been fully tested and that it
could potentially be the reason for the failed x4 link up.

Johan

