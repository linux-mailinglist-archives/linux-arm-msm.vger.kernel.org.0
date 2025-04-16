Return-Path: <linux-arm-msm+bounces-54547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 589F4A90AF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 20:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3DBA3B2FBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 18:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24AA2192FE;
	Wed, 16 Apr 2025 18:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="niwntZGp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA111AF0BC;
	Wed, 16 Apr 2025 18:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744827050; cv=none; b=dS77RwPeU10r7UAgCK1KZB2bDh0YFIFDbyIyITu/0tIYM8msDOffH1DztHYwQr83VOzgueZMsHaZp7bubZsSWj2fiiS7vjoA4V90OCHdaRbQsF6JFxKJMWgejbj7BhXTFvwpE2hrGIgFydFjAX+gR3/kumjGUhfFIfBzfrYvv4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744827050; c=relaxed/simple;
	bh=YYfUfDT8x9EiV2jkzCcfTs+tAFw4ZSX0Rx3a3U9Xj1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CfvT6dYXDgdmvxp4cvBUdSAyAc7d+IJRCN5MMnEZtpQ6sTH6H0jAJU8W44DKOw8ob9kL/7aDVdeLDwZmNAkOYdkrObTctvJzKN0+otEs/zua9icPMB0fxbv/E9ywQjbJujqKRR2jerO1KvGqWg/IxaUtzs7/PMNiUbAZ6xjBeLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niwntZGp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2749C4CEE2;
	Wed, 16 Apr 2025 18:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744827049;
	bh=YYfUfDT8x9EiV2jkzCcfTs+tAFw4ZSX0Rx3a3U9Xj1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=niwntZGpeBkJXasXFvnmSbH6p6WaK55YJLsm3s79gnU2zZu0ayefhPMG/8NT2W0EZ
	 2g7JcXWiZjFpevhzZXjHUFmOY8hK7jRMOpFFcNqJ0NNwZ6Nb7ZzNUbDAH2hxbFwGDe
	 RJPYVLF2/ARs/JG6E5ucSbhUHa/+a1qcsYMRZ6uDyF5DzDjpaVWgwd0FJkCK63GhIN
	 RoaTjqWeTRqJivNX5SV6RTlxakU+LyFOuMBasjXSQFqWE/sIqyLgY/Ol1gV9ZECbaI
	 8vQo87zFh5w7f8yeDLj3adRJ7MTsp9E9OZnGrfafrYgqtp2D5g5D9eviux8GfhDLrW
	 GnAnq1Pw8rD2Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Caleb Connolly <caleb@connolly.tech>,
	Dang Huynh <danct12@riseup.net>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm660-xiaomi-lavender: Add missing SD card detect GPIO
Date: Wed, 16 Apr 2025 13:10:40 -0500
Message-ID: <174482704417.446874.10298682594898685723.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415130101.1429281-1-alexeymin@postmarketos.org>
References: <20250415130101.1429281-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 15 Apr 2025 16:01:01 +0300, Alexey Minnekhanov wrote:
> During initial porting these cd-gpios were missed. Having card detect is
> beneficial because driver does not need to do polling every second and it
> can just use IRQ. SD card detection in U-Boot is also fixed by this.
> 
> Fixes: cf85e9aee210 ("arm64: dts: qcom: sdm660-xiaomi-lavender: Add eMMC and SD")
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm660-xiaomi-lavender: Add missing SD card detect GPIO
      commit: 2eca6af66709de0d1ba14cdf8b6d200a1337a3a2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

