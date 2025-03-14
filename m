Return-Path: <linux-arm-msm+bounces-51435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E57CFA61543
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 16:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 378DF3B7A09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63938201025;
	Fri, 14 Mar 2025 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="py5QLb+C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C82B1FF7DB;
	Fri, 14 Mar 2025 15:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741967360; cv=none; b=Xe3x2mEoP7Im6xrxC7i3tQct0ur1YKAJQbaAge1ioXnnPcuBQ6Ipj5sj6d6pcTgbVqMuft8pASwpOLBq9F0mfHfcUf7Xw4nxNqZuVauFjxTAFL2jFMAfWccoxm/H9GvQm7SHD2DR+V7hCB2JErki8JRm1lWJcUBL9P1/UG+2hlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741967360; c=relaxed/simple;
	bh=e64LI0/mup3NBwa2RJNj7g9YaxvNeqQ+qUtFG2l3n3w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vB834stTyXufSHTwfLxyLrPAlzjB6lpAZebOD8e3GZpmglfNBZhzH9IPdRVS4izkUe1C4VOHftnNzYd54w2or0eIojEiZQfX/DX8+YGIiHp7P0SjBnemnyK0AUBotK5Co85ej7jcWQPlySu71x8z+i+0b7xL+rh0UVLfWIPYuO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=py5QLb+C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6487C4CEE3;
	Fri, 14 Mar 2025 15:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741967359;
	bh=e64LI0/mup3NBwa2RJNj7g9YaxvNeqQ+qUtFG2l3n3w=;
	h=From:To:Cc:Subject:Date:From;
	b=py5QLb+CLk4medUOo+JzWJJ2YV3/unJHmckso8pvdUlOw6vdcuUeabSb3hV4GK/+2
	 0jcgt/aLVyFiYue0yvkG10/2gdWKn3/NnkLfHq/aiVrFgJpSZFnTXYf3wTHkgzMrTF
	 4z0DvHUXUgI3rsJWkwp9Hh1+db3Ff+/wwzyFPDR98oV7BHmT/vFuhyDr/nE7gSK7Iu
	 RBk8yjgMiOSnPUgvUf1doURvdYzzRe/yYsaE5cygge2fwvJxdgKWtOR5zMD8JjIotB
	 ItKAGuNMFlBBtKUffJJGdW8kY2AZlqN62a0gJidcDkgpPaUMBQ/4uPmZsUVcm+v9rk
	 s/rDG0LSEz5bw==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Nitheesh Sekar <quic_nsekar@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: qcom: uniphy-28lp: add COMMON_CLK dependency
Date: Fri, 14 Mar 2025 16:49:10 +0100
Message-Id: <20250314154915.4074980-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

In configurations without CONFIG_COMMON_CLK, the driver fails to build:

aarch64-linux-ld: drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.o: in function `qcom_uniphy_pcie_probe':
phy-qcom-uniphy-pcie-28lp.c:(.text+0x200): undefined reference to `__clk_hw_register_fixed_rate'
aarch64-linux-ld: phy-qcom-uniphy-pcie-28lp.c:(.text+0x238): undefined reference to `of_clk_hw_simple_get'
phy-qcom-uniphy-pcie-28lp.c:(.text+0x238): dangerous relocation: unsupported relocation
aarch64-linux-ld: phy-qcom-uniphy-pcie-28lp.c:(.text+0x240): undefined reference to `of_clk_hw_simple_get'
aarch64-linux-ld: phy-qcom-uniphy-pcie-28lp.c:(.text+0x248): undefined reference to `devm_of_clk_add_hw_provider'

Add that as a Kconfig dependencies.

Fixes: 74badb8b0b14 ("phy: qcom: Introduce PCIe UNIPHY 28LP driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/phy/qualcomm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index a6b71fda1b9c..c1e0a11ddd76 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -157,6 +157,7 @@ config PHY_QCOM_M31_USB
 config PHY_QCOM_UNIPHY_PCIE_28LP
 	bool "PCIE UNIPHY 28LP PHY driver"
 	depends on ARCH_QCOM
+	depends on COMMON_CLK
 	depends on HAS_IOMEM
 	depends on OF
 	select GENERIC_PHY
-- 
2.39.5


