Return-Path: <linux-arm-msm+bounces-30043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A448796476E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 16:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59E131F22799
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA5A1A00F5;
	Thu, 29 Aug 2024 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUbnmRkY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E13625757;
	Thu, 29 Aug 2024 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724940141; cv=none; b=Jvl712CNm9JV6m3mi6kAnexE/VTwJ5RbrKyNpPfP31ZwPW6iCCARxGpZFnAgml3Sk5BUBlkz9gUR7n3ahF3StaPRjY4hV+PrtnN9/3u6PlxnDhRw7PlxePeijMyiuBl3wsxNEpGMUPWrd+qp7xu/30YBsUva5VHNYxtQhGCm3D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724940141; c=relaxed/simple;
	bh=pLsaHMXqVn/Lh9ea7svwRrX4FnkxXt+eckTAqOzqPgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vv6+oDCUYl1s+Y+8yxYCjJp7KMFKlOI1kBxz/tA114GvIPe4QXqAvSCbFg1o9lfMkYgXtYwNvpH+VALia4XZIXhm85cPWNtaT3p/rOrqeNnNdGIw3uIB+1PdBOydu3E4x/WRd+bXi7EwpeRMii6wP7S9iY9MNMXajvNzcAZ6F3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUbnmRkY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FB3C4CEC3;
	Thu, 29 Aug 2024 14:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724940141;
	bh=pLsaHMXqVn/Lh9ea7svwRrX4FnkxXt+eckTAqOzqPgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUbnmRkYlyfWvqmYkIljq/GcXbxi1SrT1I1DX8iwaS+0xyPjZo6GYk4vOIgGyArI3
	 NQVPYwPaWSSzKkSL6TZWO7vFQzwdIFfGVFNTwtbBu//rNZlT+d8l5Li8ygcQna5VaY
	 slzZn8RiFw36gQ5PPMZiy4Qg36IXK0bm6aSPGPCbGiwoYh4tu28Tmsy3Mqu83tk5D/
	 BzeKE20C1Nb/73qRtdUIgSEu2mNmqFhcUJdQNPH5ia+XXZahSn8F315dgN37xHdueE
	 cf3o9iu9BREANWKFXcR2ur+boW++CQQzcH2eiGcQWjQK4l8qND51fXP2SmggEhAbIp
	 IGk4AfB5vC27g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sjfjP-000000007KO-2IHQ;
	Thu, 29 Aug 2024 16:02:35 +0200
Date: Thu, 29 Aug 2024 16:02:35 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, patches@lists.linux.dev,
	linux-clk@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Amit Pundir <amit.pundir@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH v3 2/2] clk: qcom: gcc-sm8550: Don't use shared clk_ops
 for QUPs
Message-ID: <ZtB_e3EgWUYtdGgV@hovoldconsulting.com>
References: <20240828171722.1251587-1-swboyd@chromium.org>
 <20240828171722.1251587-3-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828171722.1251587-3-swboyd@chromium.org>

On Wed, Aug 28, 2024 at 10:17:08AM -0700, Stephen Boyd wrote:
> The QUPs aren't shared in a way that requires parking the RCG at an
> always on parent in case some other entity turns on the clk. The
> hardware is capable of setting a new frequency itself with the DFS mode,
> so parking is unnecessary. Furthermore, there aren't any GDSCs for these
> devices, so there isn't a possibility of the GDSC turning on the clks
> for housekeeping purposes.
> 
> This wasn't a problem to mark these clks shared until we started parking
> shared RCGs at clk registration time in commit 01a0a6cc8cfd ("clk: qcom:
> Park shared RCGs upon registration"). Parking at init is actually
> harmful to the UART when earlycon is used. If the device is pumping out
> data while the frequency changes you'll see garbage on the serial
> console until the driver can probe and actually set a proper frequency.
> 
> Revert the QUP part of commit 929c75d57566 ("clk: qcom: gcc-sm8550: Mark
> RCGs shared where applicable") so that the QUPs don't get parked during
> clk registration and break UART operations.

So this one doesn't really fix anything after patch 1/2 in v3, so
perhaps you can rephrase and drop "break UART operations" here.
 
> Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")

And drop this.

> Fixes: 929c75d57566 ("clk: qcom: gcc-sm8550: Mark RCGs shared where applicable")
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>

> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Closes: https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com

And possibly these two as well.

> Tested-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Johan

