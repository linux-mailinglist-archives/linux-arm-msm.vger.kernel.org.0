Return-Path: <linux-arm-msm+bounces-11046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F31FE85513C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 19:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEB4B28B77E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 18:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB3C1292D7;
	Wed, 14 Feb 2024 17:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMJ3bSz0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D0612FB25;
	Wed, 14 Feb 2024 17:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707933493; cv=none; b=keCeBHNCHVyhAy2wByKPNuYIFSJ7nr9BxY+3wWRZjl+N1Enh1DQPz8iefvPVQmNkbD0mO9nopo02wP6Qz/iXRLmD0q1CMbPN+WrFgEo3U5PSG7cVBjV9dapc5HWp8MuMM4XIWeGB9U1MLA8B9NbxyB46ull42KBcdbLVa4/a0o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707933493; c=relaxed/simple;
	bh=wztF8XzxdbVB9Jk+ZtbZZ2oEzTpOr4x4BBNA8Lz2aIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UAklT1wYNX64SaA7vk1dR4KaOeHQHhREPWiI0Nlfu2Ac/+LDNyFvAXjx0lhyUn9huXXpBygyDJPdi3BDvDZiBh9chLz119aLkKkDVjKLciTfIXWlHa8Yylu8osFZCmloG3FovUQgyr53+/w79cnnJ7YShE5+yzuvhsjqbbhxXXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMJ3bSz0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9A9C43390;
	Wed, 14 Feb 2024 17:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707933493;
	bh=wztF8XzxdbVB9Jk+ZtbZZ2oEzTpOr4x4BBNA8Lz2aIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gMJ3bSz0UubYUwNhzZrP3ZTeEE476eQttaoMMgO8tGZpIgBkeVh8AHt5LetCUltQP
	 6RaMpNj4NnXxutc+Vdi3r4XGTY7KphLugB8kaHlddHMpRdQig04Y0dB9Gp+cTGLmv5
	 xjvasuxw7pYWAgiQn0nec8IAkQgcrYI4iD1gtRp/VD4jQQQRI6ZuP7mR7D4q+VU4vl
	 om1+Y919Y1rKOPYmuvTXaXSIWe4tXlv64vhuslpfMTjGLZm02BtDSlNs411bn3BSjD
	 ZBFb2LPpXGKpiP7/tF9jFZU0FBUryO7oriSR4Du0Xe+/BSZXgCp54gmEopugIaPVoE
	 IWE1SpDoOQgYg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Raymond Hackley <raymondhackley@protonmail.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Walter Broemeling <wallebroem@gmail.com>,
	Joe Mason <buddyjojo06@outlook.com>,
	Siddharth Manthan <siddharth.manthan@gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: msm8916-samsung-fortuna/rossa: Add initial device trees
Date: Wed, 14 Feb 2024 11:57:41 -0600
Message-ID: <170793345832.27225.12573915129416662258.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129143147.5058-1-raymondhackley@protonmail.com>
References: <20240129143147.5058-1-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Jan 2024 14:32:02 +0000, Raymond Hackley wrote:
> Samsung Galaxy Core Prime and Grand Prime are phones based on MSM8916.
> They are similar to the other Samsung devices based on MSM8916 with only a
> few minor differences.
> 
> This initial commit adds support for:
>  - fortuna3g (SM-G530H)
>  - gprimeltecan (SM-G530W)
>  - grandprimelte (SM-G530FZ)
>  - rossa (SM-G360G)
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916-samsung-fortuna/rossa: Add initial device trees
      commit: e1839f78e4699005cfd4f5f59107c33b174fa706

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

