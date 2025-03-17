Return-Path: <linux-arm-msm+bounces-51557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE0DA63C3C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 03:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AD4F7A67F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 02:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1491917F9;
	Mon, 17 Mar 2025 02:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/mrTsNl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85F018DB37;
	Mon, 17 Mar 2025 02:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180171; cv=none; b=Qsn1BkXemScZhSE3bOetgb5zHhcIGtwdsHjXcPJV1jc2wR/sRItndG8Y907h0KkkUzFbEPH/NaeYzltjy0yv6pmBvJXPn28f7ygRjImQVFtBD/TQ5GtSkA1PW5j9atSmwza1EhRMWgLn1INxN/nRf+uwRY3jQEHaJvaV6djcw1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180171; c=relaxed/simple;
	bh=jFw7b900ZkEQ8RdW9FvK9cv1tNqStrsgog4XCObz7qM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O2yahsBqhWA8kszfhEWdXqGj1wiKgXvEIIydmxcn+eqgD0ZLlPDiZD6bwkDmvGc6Bms4hBX/ij4ngGaEly14Eq4jlN1MJ1DSRYuuB0OwgBmFCvDBYWn+DzMUz1iS/Cm0RRnhYaFHHnRNmXokMWRbcOH4J3T4v/v3EPbdMLh0XEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/mrTsNl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD65C4AF0B;
	Mon, 17 Mar 2025 02:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742180171;
	bh=jFw7b900ZkEQ8RdW9FvK9cv1tNqStrsgog4XCObz7qM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R/mrTsNlPu2V6n9PpRsqEn+AApRW479bej6SDx7uZPK420YYbf0AqnApj4HRBkIE/
	 HO0a6IWoPmnvCIziBGShHZihykRw8y3rAOywQ3S6k2z4D6CMSvt6jXUizA2vibt7fg
	 t6NZgkCkE0NBNuOfhz8pxhybp3Jo9z5biNFyYs+KzC0iYVkITfdbpzzahon8N1J/3x
	 aJI884j4HuUgsCiURdn+YugT0AE2d9dok+Ru9GWrGgfFF4Tc5sJfzkU7BusRVHP4Al
	 lNBN9gZAgdyji5ayABbhfCgYdGt1oL+eSFNowszZ8bNJBDr0vQ/xdwdRYXT91h1l4j
	 TmFIHxhipwfFQ==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 00/13] Modem support for MSM8226
Date: Sun, 16 Mar 2025 21:55:51 -0500
Message-ID: <174218015900.1913428.14948939748843427587.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
References: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 17 Feb 2025 23:05:14 +0100, Luca Weiss wrote:
> This series adds support for modem remoteproc found on MSM8226.
> It also adds needed device tree nodes and enables modem used for
> location service on matisse-wifi.
> 
> Also bam-dmux node is added for mobile data which is used on
> 3G/4G-enabled devices.
> 
> [...]

Applied, thanks!

[07/13] ARM: dts: qcom: msm8226: Add node for TCSR halt regs
        commit: 300edf73651b1151b18c0ef4b90cdf71946787f0
[08/13] ARM: dts: qcom: msm8226: Add smsm node
        commit: 184cb65984ca164e4adb3abe3ec1549ed358d1bd
[09/13] ARM: dts: qcom: msm8226: Add modem remoteproc node
        commit: 075555387244b51d9414a35d3b1d9f58a4df0fe3
[10/13] ARM: dts: qcom: msm8226: Add BAM DMUX Ethernet/IP device
        commit: 6b47ce06f22b3ad2921dda442be23abbe93ed251
[11/13] ARM: dts: qcom: Introduce dtsi for LTE-capable MSM8926
        commit: fc532eb25c0aeca1d20e7d3c8d8a24b3ff39e3a9
[12/13] ARM: dts: qcom: msm8926-htc-memul: Enable modem
        commit: 36663812eeb5e57f1d167c33bcb1dc970333bef1
[13/13] ARM: dts: qcom: msm8226-samsung-matisse-common: Enable modem
        commit: 32768db9cfc56554d1570ac71aa204f0751bd12e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

