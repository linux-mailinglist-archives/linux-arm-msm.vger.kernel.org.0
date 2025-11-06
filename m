Return-Path: <linux-arm-msm+bounces-80661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4960BC3D548
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 21:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0243F3AFA81
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 20:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036EF341657;
	Thu,  6 Nov 2025 20:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pyG0DpSz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9CF26A0DD;
	Thu,  6 Nov 2025 20:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762460074; cv=none; b=NxHaU9d2osYQCjSXP4xp8/p239n9+1uvPG5wZqNUHs4XqXKUSUEdJdLSzzLhA4eYKOmwzcpu/VPQ/tM0ovTTHnT1KIDYPrQzLJO0IvBB1c4Q6xlV8zq3url6ZQ1AYZDaktyGQAdAz8VrHl+Tl1fnobomV9NyJqov2iE39LpAtmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762460074; c=relaxed/simple;
	bh=YR8iakOdc2sK6cZPy3aRXQ2Zk9SxR6WzkfclYql+G9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQHfJcqoLH8B79+dMo18w2Thj2eoKGE5nnOgzbi5CKxyNkTl3nPBkaUAAv+Al4uqadtmvzoK6CPS5zQtWVu9qClF3VNlUEtg2VxOw6RFb7l943nGh3VLB/eP5vCf4fx0oseWsGC/ZAoOOR5gJoJFzLThwyflXmHeiIqEQixFyUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pyG0DpSz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC49C4CEF7;
	Thu,  6 Nov 2025 20:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762460074;
	bh=YR8iakOdc2sK6cZPy3aRXQ2Zk9SxR6WzkfclYql+G9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pyG0DpSzwTz6MCxIlgvvL2oEAqLQByuCUuvnf11sHhUX3pK1vgOCLZZedJ/uGNKfX
	 AMPQkvRDlNAm0tL9jtTbqbBwyb4BTplfrHFzqa22tuVUqGpKvyB6C0rhgCsADoPS/e
	 PJeWsXlj9SQ8doeRwkNch+P5IcszrkrJ+yg9L+e4GclLD/3iWwIK0VM7npHgGdJAZn
	 mihJ4daCSYjEM6cG45Q9PLeFz3T//c8f78US/I5w3Et5PH6hjnG8rHqfEboqewC9el
	 SYIN05hLGnAwHKgMg9uZ38RAh+LnxV0HLl4JtGUDXzEWTPd6CRnnnKPD7yrgNHgYiq
	 0mlE7UCP5D/2Q==
Date: Thu, 6 Nov 2025 14:18:20 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: rename dtsi files for qcm2290,
 sc7280 and x1p42100
Message-ID: <okwiwu5ykkwioduou7mxrgmvmnlhcp47kovcfsigeoagdjje5h@rdd4pos7aqik>
References: <20251030-rename-dts-2-v1-0-80c0b81c4d77@oss.qualcomm.com>
 <176210698627.937813.1347882402480558851.b4-ty@kernel.org>
 <DDZYNH5X7EEQ.3TSTRMMMIXUSD@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDZYNH5X7EEQ.3TSTRMMMIXUSD@linaro.org>

On Tue, Nov 04, 2025 at 01:56:05PM +0000, Alexey Klimov wrote:
> On Sun Nov 2, 2025 at 6:09 PM GMT, Bjorn Andersson wrote:
> >
> > On Thu, 30 Oct 2025 20:20:12 +0200, Dmitry Baryshkov wrote:
> >> Follow the earlier example and rename several more base DTSI files for
> >> the platforms where we have (or expect) several SKU ids for a single
> >> platform.
> >> 
> >> 
> >
> > Applied, thanks!
> >
> > [1/3] arm64: dts: qcom: rename qcm2290 to agatti
> >       commit: 021df9dee9cd63eee1cfae1bb2381db11a1a45d7
> > [2/3] arm64: dts: qcom: rename sc7280 to kodiak
> >       commit: dd6edcd7d3e42b143a2f86e8d30ded62106a8972
> > [3/3] arm64: dts: qcom: rename x1p42100 to purwa
> >       commit: ef659a5bd91bed7fae2c2a150f8ecca06599ac03
> 
> FWIW tags/trailers are missing in the commit log:
> https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=021df9dee9cd63eee1cfae1bb2381db11a1a45d7
> 

Many thanks for your review input, Alexey.

I apparently applied the patch prior to the reviews, but didn't push (or
perhaps send the ty-letter) until a after the weekend. Sorry about that.

Regards,
Bjorn

> Thanks,
> Alexey
> 

