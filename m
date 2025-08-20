Return-Path: <linux-arm-msm+bounces-69999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4288B2E2D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 19:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3D371894BCB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 17:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C522C33439A;
	Wed, 20 Aug 2025 17:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHIHIadG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FB92E8B98;
	Wed, 20 Aug 2025 17:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755709388; cv=none; b=p0BmN8MuptR/Txd/ap0QXqheLw/LDXCv5l2/XXKbOJRxgDycBoIYAkBgu3t2Q0fNGcoNt1DMGTl0OqEwobi1N2h38EOmQ6EXkAZnaepvOJS8Ew7GOVkE8ZN1IHs932OjA4wD8ErQrmtlv6Eoe/en/nYdHd/g4Bv1LVP/AdAuIxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755709388; c=relaxed/simple;
	bh=5ZHmymgOYeWXL2v8PEhC2ET76mFW+CcsvLg+ooMQLO0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hKRcBGJPzl2vrXEjsTavKAcNrmsfFXdqytRcvGNviOzhD2X0zOcgSIQU/a8HtZSMHIeAWXdb6nSEt493w3+dTrGFbtIsq6NQNzRBJT3TaJoCYqBuwiRoqc4a2BbnTo7vOX9dfX7tscf243KUkpi5Y94FxES96wwOg6cgMMf/6Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHIHIadG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC58C113CF;
	Wed, 20 Aug 2025 17:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755709388;
	bh=5ZHmymgOYeWXL2v8PEhC2ET76mFW+CcsvLg+ooMQLO0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RHIHIadGNrUp2md1QHmXNK/JDVWUQ8OxoVvOtyK6h+OiCILwXeuAkMpbBup0R0I7F
	 mCrGfLPcjd89D/Qoa5Eebk7oe+CUw2r6gVZi+UwR08LlkZEuHgYlu3C6f3EmtX/I36
	 4L4SkW5Aq3wTK73soPUZyMHz9MgOuWfl4t1GqMrR2pOhOrk3mlES/Lw8tNhDBSHyQS
	 JRbzBcHoodVvl4gQg4uIRV6/Nva7eSMPasd8TAMsXx5LY7c8ixvmUxrWdBtr+a0nAL
	 f+7D47+SH0v3HoLZKnpXokk3RXgO221DT8cRl3XWPRIgSuEHEtcyrQp1VQUzKMZk9Q
	 NSDiyi3AUVG+A==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
References: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/6] arm64: qcom: allow up to 4 lanes for
 the Type-C DisplayPort Altmode
Message-Id: <175570938300.66459.13600812398405419297.b4-ty@kernel.org>
Date: Wed, 20 Aug 2025 22:33:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 07 Aug 2025 18:33:18 +0200, Konrad Dybcio wrote:
> Register a typec mux in order to change the PHY mode on the Type-C
> mux events depending on the mode and the svid when in Altmode setup.
> 
> The DisplayPort phy should be left enabled if is still powered on
> by the DRM DisplayPort controller, so bail out until the DisplayPort
> PHY is not powered off.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch
      commit: 3bad7fe22796a420c6e16b591c37ed1bd6cc2a30
[2/6] phy: qcom: qmp-combo: Rename 'mode' to 'phy_mode'
      commit: 5daf1bbc73e249075373e030e7221f46c175e04b
[3/6] phy: qcom: qmp-combo: store DP phy power state
      commit: 86390472554b2e8fb4cba16a139cade94be58f72
[4/6] phy: qcom: qmp-combo: introduce QMPPHY_MODE
      commit: dd331112c0adaebbc8fc767fc805da4a641576db
[5/6] phy: qcom: qmp-combo: register a typec mux to change the QMPPHY_MODE
      commit: 896277138c1344cf9f5c415298f048ee29da274d

Best regards,
-- 
~Vinod



