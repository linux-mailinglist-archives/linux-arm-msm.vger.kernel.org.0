Return-Path: <linux-arm-msm+bounces-40928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C1B9E86E8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 18:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD2FC2815A5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 17:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B19197A6C;
	Sun,  8 Dec 2024 17:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iTfHEF4Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71EC197556;
	Sun,  8 Dec 2024 17:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733677411; cv=none; b=cKAiohq3VEUbs0OvE23aMSG5j2fHDoFslwCkSx1apg5QoGFwFa6TQI+3o1cA5Rmp0lOufVB77c9eF+QCrwuZ1Itfl6l29NTBYtSav+hWFakZ3ZxLgF5jvsEYomnM0f5OBSeEOBhL90+adKAY300Ij7xWPyIKOMo9lQCQAl8Bm+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733677411; c=relaxed/simple;
	bh=4DLbhNUt1rZLuRTKjHMzvV35gikgvbLvyqJyge1WD1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Nx1JGJt4/37+JakXAPmXKVtHYhB5hodhQ83gUsxcaKSM7DOxM9g0ks/X15rT4YZG1Psutji2og6baEFLDk+N3BlWlHhX33yvwqwQREIM/h1ALsQ0h/9eJVDswLOS4goAduYULONH+HPopFBuB/Do805gb+T5NdSRM3Gx+JYJbxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iTfHEF4Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302A9C4CEDD;
	Sun,  8 Dec 2024 17:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733677411;
	bh=4DLbhNUt1rZLuRTKjHMzvV35gikgvbLvyqJyge1WD1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iTfHEF4Zm0qZbr67p5d3FDX0u772gh+FvZMRy1GrrxHhbCTO5S0HL6z1IyPxZexlM
	 nuWWA2Lfb57QgHCQk5XFv4cSNOKaSwjezH2I81ywE/rdqRsrZnkQ2FZ84kacuFmr+C
	 J+ZuVbfOLO+23hCXvRHnSVknDUBdJMWOPS0rkpzemMbyZlCVS3R3BFDd6P0ZFFRaum
	 hr8LfcQpDGYDnG72VcHU1CBKAlZMu6OizQ+pDy7IKYmUKxxHjW3zyVc3xmQcH2FK9d
	 /g+OSLd4uICsxjC6xONbRDYPuYxY6PYRC4dEWwKhXediQ5spARGjHmRJmnI9+nmfId
	 UogXe71UAlJlQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20241021-sar2130p-phys-v2-0-d883acf170f7@linaro.org>
References: <20241021-sar2130p-phys-v2-0-d883acf170f7@linaro.org>
Subject: Re: [PATCH v2 0/6] phy: qualcomm: add support for USB+DP and PCIe
 PHYs on SAR2130P
Message-Id: <173367740776.1042266.16055715564369091503.b4-ty@kernel.org>
Date: Sun, 08 Dec 2024 22:33:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 21 Oct 2024 13:33:06 +0300, Dmitry Baryshkov wrote:
> Add support for the USB+DP Combo PHY and PCIe PHY on the Qualcomm
> SAR2130P platform.
> 
> The DP part of the combo PHY wasn't yet tested, but it is not possible
> to support just the USB part of the PHY. DP part might require
> additional fixes later.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Add SAR2130P compatible
      commit: d1cfda3b1e4dba015d7cbceb49fb35fdf10b743a
[2/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add SAR2130P compatible
      commit: 5c4bfe3ee5c412379b54ef53f09fceb93f42f619
[3/6] phy: qualcomm: qmp-combo: add support for SAR2130P
      commit: 545069bcf39e9f025e8e3d749505e52423433e37
[4/6] phy: qualcomm: qmp-pcie: split PCS_LANE1 region
      commit: f9d35dd39bf44d01012119b146a27c29e55d8ad8
[5/6] phy: qualcomm: qmp-pcie: define several new registers
      commit: 8114f34dd0baa972085280610ad5be89a41d1414
[6/6] phy: qualcomm: qmp-pcie: add support for SAR2130P
      commit: 0fd0b31965b0d4a2caa9267c7aee43f1f78870e8

Best regards,
-- 
~Vinod



