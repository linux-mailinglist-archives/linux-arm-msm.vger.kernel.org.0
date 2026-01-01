Return-Path: <linux-arm-msm+bounces-87142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFE5CECF6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 12:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B43A3000B03
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 11:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EC92C3278;
	Thu,  1 Jan 2026 11:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="baxmvc6Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451C02C2366;
	Thu,  1 Jan 2026 11:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767265705; cv=none; b=jYpONG/oL5WwsrAXDWcfeP2vbh9j0kjDVfoa2z/pSu0r0UScWBWx4kKr4maOG0BHFGmyKFb1STkfnvTizA9f4r+LbblH0rrPb4LDKP4gvzrmxvjGqR06BwoUkJLPkU3lTf2wtN8eDueP0FQzsVhEQQ/NfiJyjyAWPSh2yefuikY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767265705; c=relaxed/simple;
	bh=ToKlYUMhvoalOWqpF9ZeGMqXOoOysB+sEs8bAsqqLoM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fVFtQ8m/1CatmuUGcO75U1B0udJgBKiVkJexNXNfYKDD9ruUaLnaxCUHPjRDueCnM2IE6MqN3qmEG3aD/czoxlEGGVmxHnAva5Nc42id2uwvr3kcEhaHF8XLa7BfEVnDwJLZU1VLsUTIku5YvajshVOM6aDTGwD5mfEdHywk6m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=baxmvc6Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472BBC19422;
	Thu,  1 Jan 2026 11:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767265704;
	bh=ToKlYUMhvoalOWqpF9ZeGMqXOoOysB+sEs8bAsqqLoM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=baxmvc6Y9ow0RIhmu20ZovU+DjhPRkczRDf65NtWTpLVeTG+DP9Qr0F5xTsmxxlii
	 HA1vVt3EIeX9LLyiiuRtRhVqnuhI5ZJVxeC0jSydB4WTc3AYnlDZ0dA9lC/r+ThJaz
	 zRY8nKlmHm0WiUsAm4yJY5sWNlORW/hRnMholyDOofi89rAJZFWfoe3i2fVXz6SchC
	 9j8mULmxncTeVOQ4AR0m7M8pn0dJ3qbrX55axwRxcyrqV89bPoRcQy5VuUb3ec7wmO
	 +C4opmCCm9zPzsO4qp8u28RZqiLIEgs14SXL/nGKfWLdM/Q9y0/sosR6VLjbbdQvLD
	 XzhKDVRMTCuYQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Wenbin Yao <wenbin.yao@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251224-phy-qcom-pcie-add-glymur-v3-0-57396145bc22@oss.qualcomm.com>
References: <20251224-phy-qcom-pcie-add-glymur-v3-0-57396145bc22@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] phy: qcom: qmp-pcie: Add support for Glymur
 PCIe Gen4x2 PHY
Message-Id: <176726570092.201416.12927506062894433372.b4-ty@kernel.org>
Date: Thu, 01 Jan 2026 16:38:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 24 Dec 2025 12:35:00 +0200, Abel Vesa wrote:
> The Glymur platform comes with two PCIe Gen4 2-lanes controllers.
> 
> Add support for their PHYs and document the compatible.
> 
> 

Applied, thanks!

[1/2] dt-bindings: phy: sc8280xp-qmp-pcie: Document Glymur PCIe Gen4 2-lanes PHY
      commit: 25671c37821006392ff8c66e980475747bee4cde
[2/2] phy: qcom: qmp-pcie: Add support for Glymur PCIe Gen4x2 PHY
      commit: 085ba7c91df34e05366f9fecc9fa7a037598c30e

Best regards,
-- 
~Vinod



