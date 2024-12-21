Return-Path: <linux-arm-msm+bounces-43038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 981EA9FA087
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 13:24:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B2AE167A98
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 12:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5175B1F3D52;
	Sat, 21 Dec 2024 12:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="swwiCvjJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C10B70818;
	Sat, 21 Dec 2024 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734783877; cv=none; b=aGQ7nsQarwOD747I7EFd6BHBHa2O+Y5LYigvyrieyCY6Im9tToRWVb7hg2FFSajzXY89POwtxkuwuUrT3HklUV6OSgUGM4jVWk4JOC/i50eEZujkStK1FA7CJbLE/ZcZteVOkI658oP1xTxpYS5mbMSj1YwuUI2WWTHPljKKRac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734783877; c=relaxed/simple;
	bh=vZix1t6PSZ7jbSauKLDdUL+/VCGnnL5y+zOPiRgsBYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uQbuPRW5Pd3yuFV7U0TrLaKmCNz65lietddrxrO+kTmCySYVP2DGLnNizxpVdtRQ9GAzIEjx5IoN4qOQXHaYpSPW4AgeNy6El3cSvkLmSMTBlPpH76lkv5deXq53werOBzjXk2EY+JBOt1Zv9TBQSObnwiJqQhFmdqZmHf+ekHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=swwiCvjJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F248C4CED6;
	Sat, 21 Dec 2024 12:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734783876;
	bh=vZix1t6PSZ7jbSauKLDdUL+/VCGnnL5y+zOPiRgsBYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=swwiCvjJ1zCUWx2ybKEVJH5aULk+Crjh/0sJ4FzgRo51gbadZzz3vA+E33xwHIgrE
	 zkwQwrKD/xTsJfHYWFHOJWqCntf5Ba+zWEBOFxW2H5IIZWOhPgsPlmliGjMGNTcbY/
	 GVcClcOn5ZNc6niDNleAx1TENkvSDOvL84brIqVV9G1Kc7FBaaO8d2sMaJ9zt/u5Xt
	 M6//VrIU0q377OucUDJqrCslU+FL39OJeO+qs6ZUqC10VuchpvAkESpXUapYQ0jDt7
	 A+/Pcquvs7c0UrlkPnNTS1C+I+aZvQRYkGBe5wYElcuDAib1QYCtlX/cdLKtzvtpUj
	 Mc/uEBhRh+pwg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 21 Dec 2024 13:24:09 +0100
Subject: [PATCH 1/3] dt-bindings: clock: qcom,x1e80100-gcc: Add X1P42100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241221-topic-x1p4_clk-v1-1-dbaeccb74884@oss.qualcomm.com>
References: <20241221-topic-x1p4_clk-v1-0-dbaeccb74884@oss.qualcomm.com>
In-Reply-To: <20241221-topic-x1p4_clk-v1-0-dbaeccb74884@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734783869; l=1118;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=cnN/fR+QBG2M/i/JRBnseL3JRfIaS6PJCTABMFw73Sw=;
 b=h2xmedvO+ap0HHitsEeQRRe4id62jZl/nITpydqG4fKJ9mxJEyXLx0gxmnG5FyL4K5rqS8xYg
 stead5AU4wQAz/Eosj36utTQ9Ic9WMyV7/hbXuvKWx8vxP+7la+XsjG
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

X1P42100 is based on X1E80100 and largely reuses the X1E80100's GCC
block, adding a couple wires here and there.

Add a compatible for the X1P4 with a fallback to X1E80100. There are
some additions in the smaller one, that will be added in the future.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
index 5951a60ab0815e4f8d7b67f4c17b5e504d65092b..28797d0c5d8db3527db985f324d7288b5175bd53 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
@@ -17,7 +17,11 @@ description: |
 
 properties:
   compatible:
-    const: qcom,x1e80100-gcc
+    oneOf:
+      - items:
+          - const: qcom,x1p42100-gcc
+          - const: qcom,x1e80100-gcc
+      - const: qcom,x1e80100-gcc
 
   clocks:
     items:

-- 
2.47.1


