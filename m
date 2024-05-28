Return-Path: <linux-arm-msm+bounces-20778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0776B8D1E35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 16:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6732285C0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 14:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9CE16F83D;
	Tue, 28 May 2024 14:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sOGvOnpg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9956E16D327;
	Tue, 28 May 2024 14:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716905620; cv=none; b=KyqGeaFLuuj/8ENUiSFvq/u2j4Xs67Zb3HqKy4wkuRLR2VW3IrVeQjiMZc87lmNAbD9rhXI5C5edW/rNtKcGbJXwWlHSTcdnfsIwVghg0u5EcQHF1hVN3Z2lVH0d23UkUNHurlu3Sxe2GjiBkcEbR2qZi32VAx6h3EUrdLTJ5Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716905620; c=relaxed/simple;
	bh=SpRu7mDR+REXByTUDvFrpvE5U9rl2GVNLLQrHphJKdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uHTIp407J5ibaGJL9iTeUG7mHSaxT/9HtvRM0Jujt3/G/KhJy4E4u9BagRn2Rdx+qELDIWy+pUPpkoETlVJcDscFWgJjAdu3gOWVUFjOwm5hhdxXm4IZ84crbRH74GpBCg0i/BPbEZtgmtK0f6kYcvbn7NQXagSiMFzqvxSRrH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sOGvOnpg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E17DC4AF0D;
	Tue, 28 May 2024 14:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716905620;
	bh=SpRu7mDR+REXByTUDvFrpvE5U9rl2GVNLLQrHphJKdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sOGvOnpgmL5jSJgt+JlNNejhfBsMHaYxCiHunVvhEYU9CUqaJaJMRwKAebDOybQMA
	 Ep+MA1skmOHESaJV/8+ruTDr1gVfKlWLIUkIxaZbpT+G6Gp+B/CAqcmkQrtQ/L5pe/
	 ZG0DLFtQybc9w7k1vNSRP4quQQm7uv1Jw8Unhkl8KRQvYNTTSJusuMFa4+skN8KXsq
	 LwNhvVVDtKlrUSVZjsUGwSDzbJ/fL98um0W1OCgHJZWRBducj4P7VrULGSUOT5RZ2+
	 kpMN1RmvZ1/EkHuUykEQCWXFMjYtV4XpJlSryKFYzojNX2WlG9kRV3OGMPW03R5xlZ
	 fONC6QQ0D5zcQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: (subset) [PATCH 0/3] arm64: qcom: sdm450: add initial support for Lenovo Smart Tab M10
Date: Tue, 28 May 2024 09:13:35 -0500
Message-ID: <171690561220.535711.5063286116199646285.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240523-topic-sdm450-upstream-tbx605f-v1-0-e52b89133226@linaro.org>
References: <20240523-topic-sdm450-upstream-tbx605f-v1-0-e52b89133226@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 May 2024 09:59:32 +0200, Neil Armstrong wrote:
> Add initial support for the WiFi version of the Lenovo Smart Tab M10,
> model TB-X605F with:
> - SDM450 SoC
> - Up to 3GiB of DDR
> - 10.1" LCD Touch Panel
> - eMMC
> - Bluetooth & WiFi
> - SDcard Slot
> - Camera (unsupported)
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Add Lenovo Smart Tab M10 (WiFi)
      commit: 5f2fd4aefac8ac376d1e4979d5237f5e7c53174d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

