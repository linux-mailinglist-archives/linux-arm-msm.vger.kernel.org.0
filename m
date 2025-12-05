Return-Path: <linux-arm-msm+bounces-84460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7517CA79DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 13:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D99D530F69CF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 12:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0362B330D58;
	Fri,  5 Dec 2025 12:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GElIl3fD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE1B31282B;
	Fri,  5 Dec 2025 12:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764938859; cv=none; b=kAe0T0Uv/LuVTPlL6hFG0ybDmhldjkDjIzubI9Rl9XPpTT0fZC0IhmGY7V3P4TW/a69xQFi6b7s6+Iy3HTgQZl9IDXE+PZ5uMFmGN4UXYiHXmVyHy+TZVSZ1EkxtuVACE72y1vRCL4izNHAStCPj7sHDwST0D3rwZLvk5b5S3e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764938859; c=relaxed/simple;
	bh=2jbN+6GJXNZU/3gcqy4JtjMyfMTRIKkiw5axAaNksjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N/2EpUN+FLTlDvLLrg5tmya/K4T7sJ7OGAFmDYq+HZSOBuXrE85ZCt4R0PW0u14ix+yOXR2NTI4rWmLAHcpKEffT6uUI2mNbL7WFzVRUnSi9o001oc0Xsn18yS271ZD/82Wr3UGfa4CSTwxMjHIcNFId8R99i+Q2u5S/XVv4dAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GElIl3fD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8611CC113D0;
	Fri,  5 Dec 2025 12:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764938859;
	bh=2jbN+6GJXNZU/3gcqy4JtjMyfMTRIKkiw5axAaNksjE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GElIl3fDpCPt+XYPRG9yW0kNQAHXSLnWSwYeaeYI6qYOc045ym/u8vB9KkHxNTk4z
	 w8mFXW7pB5ciZQ52PEDAOCR/E+kXe3I2ZZm3XteuU0n7PKfYzaW6fWSNhHSfeizrLs
	 AHkPNTP4CuKXHg2pGptv4tyX5UtozBx66sW7JItxDZogcOvtdTq2IJ+qNjH340wCzf
	 YcQlyAAnbjKvaYxjsrqQrsz9Jx27qKMjRjQ7el/M1gEynT4EPPsorI8wgI5eWVW1YA
	 X1CLCBPTtvL/cLzbuxYAyzrluVsfUQ3TVHb11k0/GZdjQi9iYzJNmfDycW+Wzpu/ia
	 fJWNidAs0TIpw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 05 Dec 2025 13:47:20 +0100
Subject: [PATCH 01/10] dt-bindings: net: bluetooth: qualcomm: Fix WCN6855
 regulator names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-topic-wcn6855_pmu_dtbdings-v1-1-165611f687c8@oss.qualcomm.com>
References: <20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com>
In-Reply-To: <20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764938851; l=1903;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=bar3GRw/2deMjPKDhQEedFQqLn9KPAi0w6jE6JjKVgc=;
 b=aMv08xqXJPuzRZqVopvkvd8L5amN5HVNmUHspwNaahHHiPh1tTHqy47nFXt+xaakGOI44SDMh
 fHWobAsoNhOBMW3KfeSjyZ3DzRYT422v6Za0MPimOul+jOxGOXkhhTb
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Commit 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description
closer to reality for wcn6855") changed the vddrfa1p7-supply to 1p8
for whatever reason.

The schematics footprint for this chip definitely says 7 on the input
leg and the driver still expects 1p7. Bring it back.

Fixes: 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description closer to reality for wcn6855")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml         | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
index 45630067d3c8..0beda26ae8bb 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
@@ -50,9 +50,6 @@ properties:
     description: VDD_RFA_1P7 supply regulator handle
     deprecated: true
 
-  vddrfa1p8-supply:
-    description: VDD_RFA_1P8 supply regulator handle
-
   vddrfacmn-supply:
     description: VDD_RFA_CMN supply regulator handle
 
@@ -68,7 +65,7 @@ required:
   - vddbtcmx-supply
   - vddrfa0p8-supply
   - vddrfa1p2-supply
-  - vddrfa1p8-supply
+  - vddrfa1p7-supply
   - vddrfacmn-supply
   - vddwlcx-supply
   - vddwlmx-supply
@@ -91,7 +88,7 @@ examples:
             vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
             vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
             vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-            vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+            vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
             vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
             vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
             vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;

-- 
2.52.0


