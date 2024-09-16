Return-Path: <linux-arm-msm+bounces-31802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FE1979CB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 10:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C7AA286C60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 08:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D16B13D53D;
	Mon, 16 Sep 2024 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLteK1WY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8EF522A;
	Mon, 16 Sep 2024 08:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726475072; cv=none; b=OZSRvAvgB20+U/1YcBPoGtpiWtK0oqYs/z3ngY/ti8FL+Eh2Tz4sxWACe1HRv7vrpEFHVNAcAPiNyEcCMnqzkR2ol20b7KUvxjG1E4RJWZnws3iFNvUqR0XUZ5nyw11XketMHt+dxkQaaXYXlyN0gwwQFD/xU46PdAWMTpt6KZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726475072; c=relaxed/simple;
	bh=CiFV/yKmkzt1bJ88LxVcPJA+vuPaG33Cxvu/STK3m5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=au5v33uh8GhxNEjZ2b/0QFB6p35e9R5xWQs8I9gVPFprAn++Eg+vvozbgsVIz5qxmNLhLy53mcgK75fiW/A1EznJCbxgd+2KwRML9FWgUymsXyFJXj5A1yiflHwsTb0oPgOd0Qr48f3OBpWVmZim8qzubBFkC5b2e848eiEHMXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLteK1WY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA184C4CECE;
	Mon, 16 Sep 2024 08:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726475071;
	bh=CiFV/yKmkzt1bJ88LxVcPJA+vuPaG33Cxvu/STK3m5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fLteK1WYiEiIJlmrqJwhR4ItTQqr2k7pNG+DVmydUbm/Mlie5h00Yj5f06DNkLQe/
	 71WlUBDRGSmGgO260iy6PryHaYG117qByw7RF4lPigqfaPuZe5LwCeeI0YfkVhvfVq
	 UxKW/Y4siJq0RTMW1mBR+QDYNecq+bisOJTapT9+btDbr6ZCohNVubWnnDZP75mc+z
	 xo/ktFqeeq9NtX5aZhRySE0VE5uENvuHQO2vbvVzBio5O404e6l0OgXO3CetN7tyB4
	 XYf/n2x0mxEB+jCJeNjqD83bFxgXLyLJ/jLactIds/BdBz/5AXxlugFLZoI3JZBPog
	 LNdoiBEpY7sXQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sq72P-000000007hG-2FlS;
	Mon, 16 Sep 2024 10:24:49 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: add missing x1e80100 pipediv2 clocks
Date: Mon, 16 Sep 2024 10:23:05 +0200
Message-ID: <20240916082307.29393-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240916082307.29393-1-johan+linaro@kernel.org>
References: <20240916082307.29393-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The x1e80100 QMP PCIe PHYs all have a pipediv2 clock that needs to be
described.

Fixes: e94b29f2bd73 ("dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the X1E80100 QMP PCIe PHYs")
Cc: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index dcf4fa55fbba..447b379aa83d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -154,8 +154,6 @@ allOf:
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen3x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
-              - qcom,x1e80100-qmp-gen3x2-pcie-phy
-              - qcom,x1e80100-qmp-gen4x2-pcie-phy
     then:
       properties:
         clocks:
@@ -171,6 +169,8 @@ allOf:
               - qcom,sc8280xp-qmp-gen3x1-pcie-phy
               - qcom,sc8280xp-qmp-gen3x2-pcie-phy
               - qcom,sc8280xp-qmp-gen3x4-pcie-phy
+              - qcom,x1e80100-qmp-gen3x2-pcie-phy
+              - qcom,x1e80100-qmp-gen4x2-pcie-phy
               - qcom,x1e80100-qmp-gen4x4-pcie-phy
     then:
       properties:
-- 
2.44.2


