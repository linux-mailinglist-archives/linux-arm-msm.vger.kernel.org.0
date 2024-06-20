Return-Path: <linux-arm-msm+bounces-23458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7C2911496
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 23:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82AA81F2730C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 21:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1986978C8C;
	Thu, 20 Jun 2024 21:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="SE2Vncuj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C34E3A1CD;
	Thu, 20 Jun 2024 21:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718918852; cv=none; b=AafonHN2fcSLjAMqU0a+bkNdkipzQ+jDTQqw3/uE2wxOrxmI6diaYvhdOmRx8p1HMR6a4ZzONQdBoeY1zip7WxIImJVrfa5a+e7yshhoBQg2CUOGLXkH9Uw5kuAXGBPGUVzYUmPX4qciu3uh+Bel4+9NAD99/6MaypCHyxk7s+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718918852; c=relaxed/simple;
	bh=61zbryuOFUJnHWhg2gaQzBn/Hld/DLBBj1BK1R43HI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ceE/UdQPADQDZo34iJZ3bhdd3Z2jtZR+i+XajokS3PB88iVWsEs6E9f+qK2ca+0Bkvg5+afXAYuAL2eNM0jDBHMLoultouRGXDAG9X3ykshDnyAtmgZIuHke8juhWz0UZKJJxabq+OnQ2djj4a4G5azUqWYIaht5j52Nrx1Xc1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=SE2Vncuj; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1718918842; bh=61zbryuOFUJnHWhg2gaQzBn/Hld/DLBBj1BK1R43HI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SE2VncujJu2RXC78orkDj7I8maqdLZAOzUYhIpFw2m6FuCS2cffKHnCtEZSQgLLwU
	 6VtEf2DG+iX+dKDCA2vEjrIMiKwGU1VypS7S9FUMJTZ0z3bKeliF+Pi02+WKW4V6B/
	 Dm5UbBOTW/2/aBuEU9iJRw40q8Frt9+yXqUkPLFI=
From: Luca Weiss <luca@lucaweiss.eu>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject:
 Re: [PATCH 5/7] ARM: dts: qcom: msm8226: Add CPU frequency scaling support
Date: Thu, 20 Jun 2024 23:27:19 +0200
Message-ID: <3116757.mvXUDI8C0e@g550jk>
In-Reply-To: <2dr3dyqu3epnrdpot3iwatkwq4uxgcmkoh7mzru2pet6xllarr@izq6mmyquffk>
References:
 <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
 <20240619-msm8226-cpufreq-v1-5-85143f5291d1@lucaweiss.eu>
 <2dr3dyqu3epnrdpot3iwatkwq4uxgcmkoh7mzru2pet6xllarr@izq6mmyquffk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Donnerstag, 20. Juni 2024 22:54:37 MESZ Dmitry Baryshkov wrote:
> On Wed, Jun 19, 2024 at 11:02:49PM GMT, Luca Weiss wrote:
> > Add a node for the a7pll with its frequencies. With this we can use the
> > apcs-kpss-global driver for the apcs node and use the apcs to scale the
> > CPU frequency according to the opp-table.
> > 
> > At the same time unfortunately we need to provide the gcc node xo_board
> > instead of the XO via rpmcc since otherwise we'll have a circular
> > dependency between apcs, gcc and the rpm.
> 
> But it should be fine, isn't it? Clock controllers can handle orphaned
> clocks.
> 
> The xo_board is really a hack and should eventually be removed.

I can check again what happened but pretty sure there were some issues with
this still being rpmcc.

But there were also some clock issues with apcs-as-syscon usage (that's
the main reason for my influx of patches regarding this topic), so maybe
with the apcs one solved that one's also fine.

I'll check again!

> 
> > 
> > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > ---
> 
> 





