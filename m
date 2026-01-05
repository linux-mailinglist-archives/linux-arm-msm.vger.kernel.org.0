Return-Path: <linux-arm-msm+bounces-87554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EECCF55BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 20:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD531315AA79
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 19:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA22346ADF;
	Mon,  5 Jan 2026 19:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWvtzw7r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FB1346ADB;
	Mon,  5 Jan 2026 19:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767640609; cv=none; b=qw/yO5sRIIH71BEIY5KHW0OqbKgIC35ocmZ/SNwZ8yGlcm0InIKRf6YUx2s7wM09EbV9ZHmGYDttzqgLN2Ui0zSdfgxmt17cqTdrkDA+6TTBN0x7IxxpJ+f1ihxdPlTX+kU5WTGSpNlEmwHoBA+JyGhIqXpeHZiPNnrI8sltl3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767640609; c=relaxed/simple;
	bh=j3JQsr+IzTapTq9nSXM9TJ05udhSvq4tJWm40ID1q3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FdAezpOuRV3+MQg+qLfjCBPM3dImde0ThZVRlomXoInOt4heWAbJIkRbTWlupM49Uwi34PyZChQar02Ffy65PFos1iEAJb176YR+ZETSZuQMkusVmFX03kCc2+YdVGxj6WL9WA6dBGcwGGXOT+djALA2VIvlj4cHTvKNdbzmxXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWvtzw7r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E63C19425;
	Mon,  5 Jan 2026 19:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767640609;
	bh=j3JQsr+IzTapTq9nSXM9TJ05udhSvq4tJWm40ID1q3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CWvtzw7rI1vPdD7R3kKZAgGN+Y9RnOt97zRSXiP48gQ4NSTxkvuTIitwnMY79I5He
	 vlql6RJNJ/3WVKQ6cQGApglxmwV2w5SSemOEU9encvBvKKbLGneyEVewEz67IqrbzG
	 DFpqPLSbz3xH7OCvOFf2Mzi7NqQeKk0kpDCDNN5m8TDqmfWlOY3m/ibvbEPVJUs5fM
	 bI4YA1MWX2TTwcP+/QiDEaNeFKWOBfuyw+D1PdN6wzGEeboQ7ebn93y1hKUI5os+Vx
	 KBXGhUVA8i/2+WZudE0tkTORU2QsEVwB51hGsJZuEk98/OjAcAN9QHfSDp+OrWCDMr
	 wFTmcjFZnQJrQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gustave Monce <gustave.monce@outlook.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8994-octagon: Fix Analog Devices vendor prefix of AD7147
Date: Mon,  5 Jan 2026 13:16:28 -0600
Message-ID: <176764058414.2961867.10358157414204203861.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251226003923.3341904-1-vladimir.zapolskiy@linaro.org>
References: <20251226003923.3341904-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 26 Dec 2025 02:39:23 +0200, Vladimir Zapolskiy wrote:
> Trivial change, Analog Devices vendor prefix is "adi", but there is
> a valid "ad" vendor prefix of another company, this may explain why
> the issue hasn't been discovered by the automatic tests.
> 
> A problem of not described compatible value is out of this change scope.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: msm8994-octagon: Fix Analog Devices vendor prefix of AD7147
      commit: 7db5fbe508deedec6c183d5056cf3c504c027f40

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

