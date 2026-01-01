Return-Path: <linux-arm-msm+bounces-87143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E98C6CECF9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 12:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C18C1303ADF9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 11:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E352C21EF;
	Thu,  1 Jan 2026 11:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rykbwn84"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67B82C17A1;
	Thu,  1 Jan 2026 11:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767265710; cv=none; b=KlNqrAuWayJdluC8/MGe0Z7urgmOh8l8gtnA9rt2B1PUxs9O8aQI7SVUA+dnIbbekFk58ZH0uPs3EHp+iVzAWpZQL+nCYU/FXr482jhq+oQwULfp8nhvZ1GuV9QE4vWo24kDI5WX1EyVU+7AuWTPwNSirV7+nx+POURGgtHvC0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767265710; c=relaxed/simple;
	bh=AwUWD4Rn8NzTv29fdPoapfUgAdsV501ocTuKY/9obFU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GrqhwrSxtD97nm19Wpgq/6NCyjQUsEb5mWHzeMdiwqpNee87clDqYpcgtAOH87ftQ7Sjdg22jArysn5G7eLhtzG2vSNTrVuWXrGaze69H/qXgv6OYRTMIKIlTGrmzRk4f1Lv2bY6YDsbCadRiQHrpNs/Nj2H6AdCROJg9TXzzdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rykbwn84; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78621C116B1;
	Thu,  1 Jan 2026 11:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767265710;
	bh=AwUWD4Rn8NzTv29fdPoapfUgAdsV501ocTuKY/9obFU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rykbwn84k6Tb2fb8RKaRl1g52xEoLiN3nlg+0JzHYqdvwTOum/kdBo5ehe6S2ZAY6
	 icof7B3X+4hRD3cXU0EqgunxX0DCw1T999Rg9w+BJjJCd3UqzKYuKoKcjZQoxE155S
	 mueuKh5Fsmpkz6vLxGRLpaNhW2AlFdmS9DJ+vYlIHvl2C69afLXO+f1gGiuCSngn6Q
	 XqIWEnEKPj0RJa349Xipr+wtLA0KmfGiP+8lm37bd4rmhx1PYs6iAujSc8DwAFBblW
	 Huozxo3c/R3AdPkfN5pGeSesUH2ZRHYlBB4eByMcFYRE1BCwlEbj9MCWe/QwHnfE17
	 kV0WDaaABcUdQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 stable@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251224-phy-qcom-edp-add-missing-refclk-v5-0-3f45d349b5ac@oss.qualcomm.com>
References: <20251224-phy-qcom-edp-add-missing-refclk-v5-0-3f45d349b5ac@oss.qualcomm.com>
Subject: Re: (subset) [PATCH RESEND v5 0/3] phy: qcom: edp: Add missing ref
 clock to x1e80100
Message-Id: <176726570512.201416.549500083715461409.b4-ty@kernel.org>
Date: Thu, 01 Jan 2026 16:38:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 24 Dec 2025 12:53:26 +0200, Abel Vesa wrote:
> According to documentation, the DP PHY on x1e80100 has another clock
> called ref.
> 
> The current X Elite devices supported upstream work fine without this
> clock, because the boot firmware leaves this clock enabled. But we should
> not rely on that. Also, when it comes to power management, this clock
> needs to be also disabled on suspend. So even though this change breaks
> the ABI, it is needed in order to make we disable this clock on runtime
> PM, when that is going to be enabled in the driver.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: phy: qcom-edp: Add missing clock for X Elite
      commit: 6b99eeacf6abb1ff2d6463c84e490343f39cf11a
[2/3] phy: qcom: edp: Make the number of clocks flexible
      commit: 7d51b709262c5aa31d2b9cd31444112c1b2dae03

Best regards,
-- 
~Vinod



