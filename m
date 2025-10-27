Return-Path: <linux-arm-msm+bounces-78940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FEAC0E5E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9961550205C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9939330DD30;
	Mon, 27 Oct 2025 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZAIdGAs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6640630CDA1;
	Mon, 27 Oct 2025 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573999; cv=none; b=jZ8Lqc/l3l27Hq0PavIGkZmMmnzjXtkrejN2YP8zKOJJ4j0s/Jl4VDhVkbIxc9wNUQzjH8xo3gw8CUZN2wHBYFdQIHLmHNA0/l7YtBypzy6HdYIoTEj8mt8rBl2k0xvndC4QG1sMXnUy2GXEATqRf8Wvq/YbfLFif9oRgrAda18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573999; c=relaxed/simple;
	bh=ajdSt/VN7DwxOuvIAMdaxC/1GZpCtf2LDYR86Bbwwlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K7QN+D0UP7flGp43zzGjsQ9gaH8P0a26UC3a01jSSsed9Xc0hGaNruIor15rqRtYR4ozo8mhDFkumc4jCe+y+ImAQ5DAYKJ4JzWx4Q4kLf8t0HGgXZPjBtc+ObkY+A09YRq8rnhRIzquMCUCPcNab3x0X5CwvofVo5FVEBVdZQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZAIdGAs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214E0C116B1;
	Mon, 27 Oct 2025 14:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761573998;
	bh=ajdSt/VN7DwxOuvIAMdaxC/1GZpCtf2LDYR86Bbwwlo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SZAIdGAsgTu49ocgW+ky7MKsgNXoeHQN/bYDMuB2IfxF8PA/0OmjpGuUltn0xc2FQ
	 NOHyodqDsRZpMSRtb3GvjP9oRDrXotnRMm8iaoY4K+VoRO4kmYNwUax5uBJYmeUUfR
	 AERFD09t8NrOyuKw/IVY9CMAI2cUjoDyaOZa0Aj6m61tB+bRzDi4PsRijocnxAdjir
	 pAaA9NVk7GvF91c9MRzVLoXwxmBedm50+OEcU1JEjHmtnTc5hsdEiP55wOvxtXkbK7
	 Ziy7d0Xjpk+kx+GR7304maFTQXk0gSaAs3wmbuemPqfyFA1kFmIl1qKxHRbYGURoFb
	 MPHVX6mfjn6hg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] Add MDSS_CORE reset for SM6350 MDSS
Date: Mon, 27 Oct 2025 09:09:12 -0500
Message-ID: <176157405444.8818.14943292514319691118.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 19 Sep 2025 11:57:22 +0200, Luca Weiss wrote:
> With v6.17-rc kernel, the display stack needs reference to the
> MDSS_CORE, otherwise display init becomes quite broken.
> 
> Add the resets into the dispcc driver and add a reference to the dts.
> 
> 

Applied, thanks!

[2/3] clk: qcom: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC resets
      commit: 502099e9c832c95b485835ff58a5f735d9d956a1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

