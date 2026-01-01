Return-Path: <linux-arm-msm+bounces-87144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6D0CECF8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 12:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE42B3007CBC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 11:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8802D2C1788;
	Thu,  1 Jan 2026 11:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="itKf3+wZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8D82C1595;
	Thu,  1 Jan 2026 11:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767265715; cv=none; b=We4Krhoh6v0yrmnt3J+hJ6ZIAsRB4rKD290fPOe0NOs4LufPap1Tb4WYuJi8+E1wXPl1d5YJMQ9Z138sUVO7/n17yEvx7fDf5H1BRQcCrTVm8o9ZGMqWx9YTFnNkO6npc9dacE78/maaICD1tExocAe2XH2K4qBCYXcJP5K1Icw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767265715; c=relaxed/simple;
	bh=uym4i3wRVVpuxWkdrqU3bgwZsTdQ5VxDIcBIqb/kR/A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i34aTYXC1uVd4GdyvjGtbrWVmRkJReXoaBKFqB8kzeL22l22fyDjAdK+bp00bOo6J5dQiZsEiJjJXkJJZMaoIxg4eZp7ngn5lB8SMeJN9ucjZkU6zdzDPlWOG01TYTV8b490BVmbMKKHfbcrgimQN/tgRCcIZgLjeEECIp7YvEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itKf3+wZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98FEC4CEF7;
	Thu,  1 Jan 2026 11:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767265715;
	bh=uym4i3wRVVpuxWkdrqU3bgwZsTdQ5VxDIcBIqb/kR/A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=itKf3+wZjHXkCXHLZC6Fl7f1qtRG4toxqoKD7bk8NKiYMaYflWYly1us5GAzn+JQQ
	 iLNJhwPpEDCrlfOtvFUd8zu4+qVyuRHrsqRFPVki3soMkpMvAtce1c2g4ks3EmnwKK
	 n452YREKjyS4+HGqqytcoYtKm62g+hy5cz5K1QtjzH7iQUAQfq8yGWIddsXH6FaG8X
	 b58JLxrSoLTVfGgxIi1E0liGoFrkrq4wBCq9fyOU341oT9MqeTv1/ZsWoQdIGYTcWt
	 Q8gXee3Eby+A5zqLYWj2G51FSGXMc4269u4pEoRPBbzC6ntv5V2+iirJ5qzhC6wXH6
	 RYtcaBq+oeBww==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251224-phy-qcom-edp-add-glymur-support-v6-0-4fcba75a6fa9@oss.qualcomm.com>
References: <20251224-phy-qcom-edp-add-glymur-support-v6-0-4fcba75a6fa9@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v6 0/4] phy: qcom: edp: Add support for Glymur
 platform
Message-Id: <176726571052.201416.15965935591275974441.b4-ty@kernel.org>
Date: Thu, 01 Jan 2026 16:38:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 24 Dec 2025 13:10:43 +0200, Abel Vesa wrote:
> The Glymur platform implements the eDP/DP PHY version 8.
> Add the necessary registers, rework the driver to accommodate
> this new version and add the Glymur specific configuration data.
> 
> This patchset depends on:
> https://lore.kernel.org/r/20251224-phy-qcom-edp-add-missing-refclk-v5-0-3f45d349b5ac@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: Add DP PHY compatible for Glymur
      commit: 8f97b9b34f0d26339e8b0d26c2f466eeb188939b
[2/4] phy: qcom: edp: Fix the DP_PHY_AUX_CFG registers count
      commit: 2d472a675ced00397440caed78168db5fdecf3a3
[3/4] phy: qcom-qmp: qserdes-com: Add v8 DP-specific qserdes register offsets
      commit: 212cdedcac11c411d0e7c277e1cdcac5f1a20ba2
[4/4] phy: qcom: edp: Add Glymur platform support
      commit: add66a6673bc4aacd0ef0f3c4a51271501770b17

Best regards,
-- 
~Vinod



