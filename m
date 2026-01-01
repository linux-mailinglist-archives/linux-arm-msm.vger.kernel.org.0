Return-Path: <linux-arm-msm+bounces-87141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E03BCECF62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 12:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00CE6300479C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 11:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD832C1786;
	Thu,  1 Jan 2026 11:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/7uM5NC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834712C11E7;
	Thu,  1 Jan 2026 11:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767265679; cv=none; b=da4by8c0DSY66wx42S14xIrh7zpWnrzib8zwILFK7DWnsDqDhvY/xNdym4HIt7kvccYVMFN4LC+BF/Ziy89E8cNH4Jlf9z11JgA9OXjHl16n+cjPEWSrY+oSIe8Nsvn+1eJ1ldW2i3cujrLBFbyRrEBNblxoxOTElgvaw8fSN6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767265679; c=relaxed/simple;
	bh=W+vJxAgBNm+n//Wn2RLew3QSjtXlLO4Nn+RTa2qEUQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iGDmv2PioTPesUgbmaaM4R/rN5F8DWRISdZq+IRmtzePzSOW9zcb0V4CIgR/De9xXlkNzG4WXFflRDfmu3l2CUdo0PQ2hU+Sd8e6Z54oSucs64QqaEEUgcM0kCWqjnDfzzI1QazmKbkGk719r4TVwusv0V8h9yUkFtwDXQ2rjkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/7uM5NC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA0BC4CEF7;
	Thu,  1 Jan 2026 11:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767265679;
	bh=W+vJxAgBNm+n//Wn2RLew3QSjtXlLO4Nn+RTa2qEUQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=L/7uM5NCpXTvhIBUkYeNbAgBPF9OZg4ciSNZ8BL+KE8mqF96fUxLICS5cjmpeClG4
	 4W/s/DugJtCmBSY3aK1JiWHa4y5P0g7Wj9uuct1Xo4cy4Th7YIVntKHy+VNNK6dNTQ
	 g4XYY44nBN7U1s83HC/zlk52+Yv4t+bFUusC4NMIVLer5Lb7JMdW3/R02p322MIu4i
	 1CKoCQLYhqY88aGO6wq9j974Sr9yKmmxmBh2Yauh70WsC3TBv0h/YtZOiFporn1QZh
	 qB7Q/fjjVPxpjuOVKJBAM2+hs6aaVB0xWE/pkZfmF5ggTj4BLhwHh3wXrx5+iPjNq2
	 YW7uJOR5UW9Fw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Wenbin Yao <wenbin.yao@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251216-phy-qcom-pcie-add-glymur-v2-0-566a75672599@oss.qualcomm.com>
References: <20251216-phy-qcom-pcie-add-glymur-v2-0-566a75672599@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] phy: qcom: qmp-pcie: Add support for Glymur
 PCIe Gen4x2 PHY
Message-Id: <176726567533.201416.1560335358869706527.b4-ty@kernel.org>
Date: Thu, 01 Jan 2026 16:37:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 16 Dec 2025 10:25:03 +0200, Abel Vesa wrote:
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



