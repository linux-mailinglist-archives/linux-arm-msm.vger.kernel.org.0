Return-Path: <linux-arm-msm+bounces-35325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD8A9A986F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 07:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0FD5B23745
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 05:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4A413C9C0;
	Tue, 22 Oct 2024 05:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvhe8Sm1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7072285283;
	Tue, 22 Oct 2024 05:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729575123; cv=none; b=OPpUgl6Bgp3N2SztYzBxYO3NwQ5Yp54XwBACE+yadW9eu5KQPRMstj6r9EJs9TCpRChx/sUtcse48mX189mEtaMfHr8gaQpBJhj3lBnVCUboLxKezk9TO0BGmyQVb56LwLdShCENOMXsR2g9+rMPC89fCspZOQHV/dVJ9lVTkKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729575123; c=relaxed/simple;
	bh=IiSrgMLg050BgnYcBYVcxxKUflvU52YA/fWuPFsF5aw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dbEjW1/90Qnxd+De5LqyzyMNYCGrmM6o6C7WepX3pPS3LVfEsP4kLak8G7rgShDABfUo1QCFesXaiFp+N1Dwi/RY6mxMzghGy2xeCW1aTWRqsd7jeo+olxa2SlO35nDcolIUZ0W7Bzy7yF6Fx74yJrbnbihljXvTOtFLZLy81gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvhe8Sm1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A45AC4CEC3;
	Tue, 22 Oct 2024 05:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729575123;
	bh=IiSrgMLg050BgnYcBYVcxxKUflvU52YA/fWuPFsF5aw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mvhe8Sm1HCQ02npd4oZJRI+aELR57CBC9FBF3Mr+mm+YK+xcDetYz9lsN5tUq9Zzf
	 5Q4p/jDoTYlPdtRLMCnOJL9yC5eghXaEQMEpZce4JjlguRqO5x8LSKcgAe9ntfsnBn
	 JUsvOLEYanj/M6Mr8wQxivm0UUlrycWxQTTDfbbOU5s7urM0/jsz99130dxtEI1OVI
	 adrAfp5P0wJrK11KiFp84FPGAkfrQjobspviJfM/7cnJrfzgipEJ1/phvhb0jNiWAH
	 75ByfjZjMWc9QfmtcuWNLsvv6ED3IKLH9ilgI2J4u6qVSW0LTdl+SkfYuqwjdW11cN
	 Bm827xOd+cyQw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241021-phy-qcom-qmp-pcie-fix-x1e80100-gen4x4-resets-v3-1-1918c46fc37c@linaro.org>
References: <20241021-phy-qcom-qmp-pcie-fix-x1e80100-gen4x4-resets-v3-1-1918c46fc37c@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Fix
 X1E80100 resets entries
Message-Id: <172957511945.488725.15179296618283554454.b4-ty@kernel.org>
Date: Tue, 22 Oct 2024 11:01:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 21 Oct 2024 16:53:28 +0300, Abel Vesa wrote:
> The PCIe 6a PHY is actually Gen4 4-lanes capable. So the gen4x4 compatible
> describes it. But according to the schema, currently the gen4x4 compatible
> doesn't require both PHY and PHY-nocsr resets, while the HW does. So fix
> that by adding the gen4x4 compatible alongside the gen4x2 one for the
> resets description.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Fix X1E80100 resets entries
      commit: 16fde3e076775d3b51f48d44d050746fbc9d638e

Best regards,
-- 
~Vinod



