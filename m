Return-Path: <linux-arm-msm+bounces-87526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 634B3CF4AA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 17:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2BE5A3008F23
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 16:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E454A30FC11;
	Mon,  5 Jan 2026 16:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBe4ZNpA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE362F60B2;
	Mon,  5 Jan 2026 16:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767629389; cv=none; b=BFCUA8Fzt2hcVaE6MOgm8CBffpOfGJ7eNNQdM4w2L7fe/ogTPhVYzTjtm2AVqpYyOUMkh61XqLsM6+eLTOVT+AqeV31fuqcAKF9c8eDhPC0+LkXjz1b8j1atxsOPxs5WaZVCggE1bkQqlZor1HdNi1bJqpltyuxGKZfpcoScamY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767629389; c=relaxed/simple;
	bh=VWWUrrH+OQf3QvL9DKQpVDZbhfypK2cHFZItJBpOO40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=picGMUSD6Q1e4hcEDf/taUThxCQhtZXk2Yb7mBHTReHyLF9PrGfnOu99y3DrmSZu1hx9nAoKdFm+HKxy18KotzcXb47t6zC/hTGq+i7zPYt8qoFh39NIAp8AZqmi/eSx1J6a19gnrDNgAynS7zT5x9p7UAoe5cYjVyj4o5U2O9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBe4ZNpA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42437C116D0;
	Mon,  5 Jan 2026 16:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767629389;
	bh=VWWUrrH+OQf3QvL9DKQpVDZbhfypK2cHFZItJBpOO40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EBe4ZNpAC2AXx+2ZRcUpbvi51ubso4gizJky3YAG+uaEKlR6o/dxcMtj/wHlaaCo6
	 UWhOkvAOpcNUQSbhTlrAjVxcnoUKFGK7COB125IqpbZ8sss3Uq+vpfBTNzuaKnkgQk
	 hbQRjH6TeRPeZdBvDigZZRIRd2vQG0tA2huNjAbp6Kn4hipyZSUQroNpbytGEhw4gR
	 SV60aKxlMDA5rwxq+apv0A1Tvt8dyBhgbNE2HWV3zzkXiXxCQPQxJKznh/R6PisFoP
	 7NzmTvq0jtRVukzBP9nZAf7QQA+cmUo/d1ZdpnQe2FR+727ww1LSZHN4zxxULgsA0r
	 kHW3UfoJHLDyg==
Date: Mon, 5 Jan 2026 10:09:46 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sm8650: Enable S5KJN1 image sensor
Message-ID: <ppak5acapxe2ih4cy6gjfqfftagpukcbtezeetljuf3ocaen7q@gnxdalhu2ndv>
References: <20251023025913.2421822-1-vladimir.zapolskiy@linaro.org>
 <176745617446.2631416.7464905538168539576.b4-ty@kernel.org>
 <v2ju7tu2cuedk6rnpidjrgkj7viz3dznwrlsu73w3ayon4mnx7@yacrjyyizhro>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <v2ju7tu2cuedk6rnpidjrgkj7viz3dznwrlsu73w3ayon4mnx7@yacrjyyizhro>

On Mon, Jan 05, 2026 at 09:58:33AM -0600, Bjorn Andersson wrote:
> On Sat, Jan 03, 2026 at 10:02:59AM -0600, Bjorn Andersson wrote:
> > 
> > On Thu, 23 Oct 2025 05:59:10 +0300, Vladimir Zapolskiy wrote:
> > > Enable Samsung S5KJN1 image sensor on SM8650-QRD and SM8650-HDK/RCC boards.
> > > 
> > > The changeset is based and tested on v6.18-rc2 and it has two dependencies:
> > > 1) added Qualcomm SM8650 CAMSS support:
> > > - https://lore.kernel.org/linux-media/20251017031131.2232687-1-vladimir.zapolskiy@linaro.org
> > > 
> > > 2) a new Samsung S5KJN1 camera sensor driver:
> > > - https://lore.kernel.org/linux-media/20251023025356.2421327-1-vladimir.zapolskiy@linaro.org
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/3] arm64: dts: qcom: sm8650: Add description of MCLK pins
> >       commit: 0ddb0d63453f320806727604702b6f6636a645c3
> > [2/3] arm64: dts: qcom: sm8650-qrd: Enable CAMSS and Samsung S5KJN1 camera sensor
> >       commit: 328407ba89ae6656c143967ba65465c50150aaf8
> > [3/3] arm64: dts: qcom: sm8650-hdk: Add support for the Rear Camera Card overlay
> >       commit: 1c20a021de58a23bdc264b91d75e944d19e49ba2
> > 
> 
> Not sure how I missed Konrad's requests for the additional adjustments.
> @Vladimir, please send follow up patches to correct the content that was
> merged into linux-next.
> 

Sorry, it seems rather that b4 produced a thank-you letter for both v1
and v2, as I applied v2.

Please help me double check the content of the branch, I'll try to
figure out how to use b4.

Regards,
Bjorn

> Regards,
> Bjorn
> 
> > Best regards,
> > -- 
> > Bjorn Andersson <andersson@kernel.org>

