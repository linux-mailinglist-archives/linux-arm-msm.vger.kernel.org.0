Return-Path: <linux-arm-msm+bounces-20455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B377D8CF09B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 19:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4A9B1C20E59
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 17:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EB1126F11;
	Sat, 25 May 2024 17:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IP8x7qGG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EBC58ABC;
	Sat, 25 May 2024 17:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659491; cv=none; b=KVwP8QrHjI+FPJQq96f5ejOmnCdPpOAhGXhZLjjhb9Z/u0aWTpywoVcQZjQSTyZkz0+Caka825Xm/qAGzTUoMb5yWLD0esd2vTDHn3+JTRpoDrFqupl6CRXg1gZKvHD1OcvuzYBsGdOFuUD/3Ra/f+HLDUj0dsCGh/GdLNXdPX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659491; c=relaxed/simple;
	bh=k1CrmebpQvUmjDNwM3zGg5dkDYDDnVyvxBSW376g+uQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hy1gQIqrGhBvJIhG7u35iM0zIL29iWcz4MKKzyWlK8EoRM3ilmz7GBmA8Cvkjk2ZQvBiQM/pi9J4fpzjL+tiGpyG3M6YDkXFqyaVBQZcJ4upa/OmlrmVqyvPEp1hEyhRPrt+yKD2qLIoOYqDpmJIf/7K3mKpWkDKClLY1rwr1D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IP8x7qGG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E0AC2BD11;
	Sat, 25 May 2024 17:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716659491;
	bh=k1CrmebpQvUmjDNwM3zGg5dkDYDDnVyvxBSW376g+uQ=;
	h=From:Date:Subject:To:Cc:From;
	b=IP8x7qGGOEbwZsi3rksmAyg0OcovqQ6LjidMRXQ8fZINs8DjJRby7DKY2CjVUzwkG
	 C7TuYHq4nAQJy4dr71lPtAmxfIs5KwBe84eg3xPEro090eMGuiwEFdjp/NEofalP1H
	 3eBrsmB83obfZJxC/e0FZNqDN9Auj2pqrAiot1Ns63D7IBvYoP+stDzrm5i3R1Iuy7
	 rmHhCMOIQo8WRbz4T0wya0d0F2ANuySVF6lFJAhmFDQx1FuZLmhdSl0+pcbez4uTjF
	 UWD0GF800QLsZNxfVt7jyEes09+I2dnCtQi2ncby21y7jCnvtxvEPLIkFdgcQGfm4P
	 +Umq6MNKxAB6w==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sat, 25 May 2024 10:56:20 -0700
Subject: [PATCH] arm64: dts: qcom: sc8180x: Correct PCIe slave ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-sc8180x-pcie-interconnect-port-fix-v1-1-f86affa02392@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEMmUmYC/x2NQQrDMAwEvxJ0rsA2CXH7ldJDkZVGF9nIpgRC/
 l7R4+zAzgmdTbjDYzrB+CtdqjrE2wS0v/XDKMUZUkhzWNKCnXLM4cBG4k4HG1VVpoGt2sBNDiz
 3ksuc1y0mAj9qxj7/I8/Xdf0ASsI3DXQAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2018;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=W5v+PaKdjt5yT2XBNSLkLrFoNSRfyyj3tCE4hy1JENA=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmUiZEM/6IludXyGvoLCKtChYSFmfSwO5MDtuB+
 /7Eu91Gj/uJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZlImRBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUHahAA3GwSQV2Jd0lSptw1rag8oqqLA3H/KyFQe04hL02
 CU9oLKds48y44f/a/tdikGr4pXrDQl3+eYCnTMlH84z/MR6AMbOuZFtThYl6NfzFvuoiKNRnmPh
 YFienV6CioQHvM8vi4Vj8wTs17L6mTocvIFWaNegGoHJBMJ3MLjgoXMW92NyNchSSXeTL2i+Yrj
 Z7ZTZNBp/MQez6Mfc7vWr12piInBRKCTFx1Fg+bPCYrDAHdL7lo98fSZTiZmN4F2GzmbFpoz+ig
 SkW4OVa7SaNhn1ejUq9RRVuMWmkKbvTQSOqBKCQKc4S2zUgBBFNJKTMezu6xpvmXWe9hrYbI+Xl
 fsItf1npESpfPWUI93LfZ7nx91BF18bFH+JwmF6LRm+CA6cZqFgqULsDhBWq83yPxbF1EI7Lb9Z
 fbahNv49kXyATnKQwwWVURg+0DIhh5q2qEjhzUx5vPSfwXn4FbuKrhAVDJU9S2MRJMS2BwKhHVe
 LrudvN2U+mlmaZefadV04jexIFf74f+GwgkkpQTME4HN/s546dGOSgAMLmK6o3Qde7GPgjP0Jxz
 roJA67goGlDuBZK5/XyVbrwVzLUcnLEiQ3wG7dPreFAqW9ljWcDWGPTWBZUvieQhZ6l7P9bbMEu
 RUfxuyiKhUkGwgGQXIBzi+R3VMPuidl9opGxs55bOUSQ=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The interconnects property was clearly copy-pasted between the 4 PCIe
controllers, giving all four the cpu-pcie path destination of SLAVE_0.

The four ports are all associated with CN0, but update the property for
correctness sake.

Fixes: d20b6c84f56a ("arm64: dts: qcom: sc8180x: Add PCIe instances")
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 067712310560..61ce17e602c5 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -1890,7 +1890,7 @@ pcie3: pcie@1c08000 {
 			power-domains = <&gcc PCIE_3_GDSC>;
 
 			interconnects = <&aggre2_noc MASTER_PCIE_3 0 &mc_virt SLAVE_EBI_CH0 0>,
-					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_0 0>;
+					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_3 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			phys = <&pcie3_phy>;
@@ -2012,7 +2012,7 @@ pcie1: pcie@1c10000 {
 			power-domains = <&gcc PCIE_1_GDSC>;
 
 			interconnects = <&aggre2_noc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI_CH0 0>,
-					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_0 0>;
+					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_1 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			phys = <&pcie1_phy>;
@@ -2134,7 +2134,7 @@ pcie2: pcie@1c18000 {
 			power-domains = <&gcc PCIE_2_GDSC>;
 
 			interconnects = <&aggre2_noc MASTER_PCIE_2 0 &mc_virt SLAVE_EBI_CH0 0>,
-					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_0 0>;
+					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_2 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			phys = <&pcie2_phy>;

---
base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
change-id: 20240525-sc8180x-pcie-interconnect-port-fix-d9d8d487f12c

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>


