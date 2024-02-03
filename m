Return-Path: <linux-arm-msm+bounces-9712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0D18487C6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 18:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF3E91C229DB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 17:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA465F87B;
	Sat,  3 Feb 2024 17:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="raUROHnx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A464B5F86F;
	Sat,  3 Feb 2024 17:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706979986; cv=none; b=TlBNT8NI8a6oMjGABv+aO+bGCzle2vuTRmgVJ0mEk7g58OebjhWlSJNe1TN74rbDJ5lWrZOr0KQjRKlsHSEL+oOeqrV8UXqQhBIFJwS0ywxM08eysoiMGZeOTrLxvTpb3C65Bbo+DEX2YuYVjF6YoMKrA8uBdHlgKv5KOsDRO6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706979986; c=relaxed/simple;
	bh=QHdTly9y9QxPjCc93ojKw1PUyC+7Sib20n8ZO7xNGew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bOZSstbsW+kQE7d8ghVYYrsqRcAh3f0kNjY1+2dtMoC/C5DeOcsdkHeHTqo709DOroDoksT2Mvyo4xG7znlvxc1DsDgOXJr6snI65fD7KUtWA3PKYdll2bRU0X99oWpbiEK1qgJ2WMQfoHbOKQJeDAQEJUkfpBY76on7UHUiEik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=raUROHnx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C229C43394;
	Sat,  3 Feb 2024 17:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706979986;
	bh=QHdTly9y9QxPjCc93ojKw1PUyC+7Sib20n8ZO7xNGew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=raUROHnxnnBM200B+TFcGnbfjI6DnEpyAnvrE3u8nmjgUf4FwmQCcJYo29jdh/BNs
	 4fHY30SmbZmKnPWFAgm+4pG5TyfKobRj0UFog5QtZ/BXHXk3W4ZoIjWXqb54lEraYe
	 hCDEL5h54a3cRO/zc0Zc0dBf2eHJU0cuIoopRyKENQMFvCUBhp1IIhSOXJ3+iZO+3u
	 /P0xUhrFo3myfZ4wGRZxUPPKdxk+GWBPiwNuMUNNpJTekFUArgQk7Dm9fGqZd2I42Q
	 F22VfWvrGjd1pDjHBK+YGcVFiHHttAhNOFzcmcB/mgHuuMcHOIzCyuh07DMl/nJ568
	 whdp352HpaQ0g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Use GIC-ITS for PCIe0 and PCIe1
Date: Sat,  3 Feb 2024 11:06:17 -0600
Message-ID: <170697997763.332807.2581003404084047769.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125-topic-sm8650-upstream-pcie-its-v1-1-cb506deeb43e@linaro.org>
References: <20240125-topic-sm8650-upstream-pcie-its-v1-1-cb506deeb43e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Jan 2024 17:55:04 +0100, Neil Armstrong wrote:
> Both PCIe0 and PCIe1 controllers are capable of signalling the MSIs
> received from endpoint devices to the CPU using GIC-ITS MSI controller.
> Add support for it.
> 
> The GIC-ITS MSI implementation provides an advantage over internal MSI
> implementation using Locality-specific Peripheral Interrupts (LPI) that
> would allow MSIs to be targeted for each CPU core.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650: Use GIC-ITS for PCIe0 and PCIe1
      commit: a33a532b3b1ecd6a64f6280d29d19f3ed6e31a92

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

