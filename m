Return-Path: <linux-arm-msm+bounces-30067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 794C7964D04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 19:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 225671F2152C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 17:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31F61B655A;
	Thu, 29 Aug 2024 17:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBbvHJyo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761AD1B1D61;
	Thu, 29 Aug 2024 17:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724953326; cv=none; b=CQWynha4Su3uVhPGjDNvH891Gmxj9N1BeLNBq7f+vdmZ4x4RFT64B1yDfoxuDwRtO4arX51EKfE21xpXPZ6FHkzvTBPWfbQbWWO96BaA7qBPv05dl41mka+2pRrEoQ5Giwco5WIY/bvll/MhnhbkYRdiU7Emb/NMEKtMUSE5feE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724953326; c=relaxed/simple;
	bh=UeUH/xJyaeipGngeVsitl0ECOemo6bE9v1hOQ8mfero=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=kCtHX/zGnXAbgGhPBH48CzWM7Vw5Hi8JgnWWe/9RTlokU67Jc8QBQL5PGcoAJyPUOpQx+M0MU42c52LH7ZVNyzmy02cutjDIi89Uo2oIwfgnqqYxZCmM0yqp3uilPxRphHE5WDTyo82Gq+pnrwFlaiwzCxMAFJkXW9tFTuenGJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBbvHJyo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDCDC4CEC1;
	Thu, 29 Aug 2024 17:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724953326;
	bh=UeUH/xJyaeipGngeVsitl0ECOemo6bE9v1hOQ8mfero=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NBbvHJyon8IBavOSITC789XzlefNeT/QmznRGtLIHdYECHB7UaYf/VV4+Zd3yFo5q
	 T4V6vFDLeJkZ8y3MIbiKp59udjNnu31ZCCFWLoxltY+kSutUItkYxADYq4YF6J/6yC
	 5XhmWbK15nMnedQCymWo+9gCMnILSs5JqqDqTPCivTiRoiDT6vg2UnWxLB0gZJ8YxB
	 ciid1/osx2hYDpAHtLzR9s8hx3/qXqzhbAau5sP+zPZK2QOoyClNgiz0rNZ6yt5qAX
	 o+yfbG8NH6hQxRNcGSIbuA95TWigfx3R7TyQUX8ZPREXEUYLcM24f/mXcSFH3sz9IQ
	 /S/ovCSo0pQDg==
Message-ID: <79403fa37a491749b9fcbbffb17ddc8e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <alrspfbadwth4v3f5q4nstjm5phd7ttqxyxx24lyye6lpqclws@v5dfuc2fsp54>
References: <20240827025252.3512746-1-yanzhen@vivo.com> <9ce5d7b09b5358c9190d8a999d79de23.sboyd@kernel.org> <alrspfbadwth4v3f5q4nstjm5phd7ttqxyxx24lyye6lpqclws@v5dfuc2fsp54>
Subject: Re: [PATCH v3] clk: qcom: Fix error checking for devm_clk_hw_get_clk()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Yan Zhen <yanzhen@vivo.com>, andersson@kernel.org, mturquette@baylibre.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 10:42:03 -0700
User-Agent: alot/0.10

Quoting Dmitry Baryshkov (2024-08-29 02:06:51)
> On Tue, Aug 27, 2024 at 11:18:10AM GMT, Stephen Boyd wrote:
> > Quoting Yan Zhen (2024-08-26 19:52:52)
> > > The devm_clk_hw_get_clk() function returns error pointers.
> > > It never returns NULL.  Update the check accordingly.
> >=20
> > It can return NULL if the 'hw' pointer passed in is NULL.
>=20
> No, it will crash:
>=20
>         WARN_ON_ONCE(dev !=3D hw->core->dev);
>=20
> Furthermore, clk_hw_get_clk() also doesn't have NULL checks and will
> crash if NULL is passed as hw.

Ah, thanks. I misread it as clk_hw_create_clk().

