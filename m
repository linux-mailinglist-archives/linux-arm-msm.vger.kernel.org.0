Return-Path: <linux-arm-msm+bounces-46784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34804A25D80
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD3593AF659
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910B620E32A;
	Mon,  3 Feb 2025 14:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMhEfYxx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E66A208976;
	Mon,  3 Feb 2025 14:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593819; cv=none; b=kLI/1R1wp8iMuqr2FTfF1tg3A4CBztUrkFRYmEf1HkLo0OmoALNHi0WKRBLxfCnMQnqAHknPueYsJP9QkijPKGdMWccg69EGCgE8dEUkTdoKVudLMML+jO++MT26t1b1Hl33A9x4yyOZyTzgwv5Lxfe9TJfpow2PrIUjWGmgP7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593819; c=relaxed/simple;
	bh=ovC/pNlFJhJNZ9mLmXlgbIQb2sT+OsVjD6exklu5nZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UHFaduxahriX2chzzpnSQAQsOlsFHU2/mz09ZzseCrMIRtV1kjmpddowfpzzz4Qg2kXHGU4rb9H1ZsGjJsuaCYOv8Q5k/RLIk0X+U0GOLEo6wQedxSwYTRo+FsQ+9l4aLkOxuO3x7RQbbflZ/ds4LMLURAJcVqKL1znZDCXe8pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMhEfYxx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FEC4C4CEE3;
	Mon,  3 Feb 2025 14:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738593818;
	bh=ovC/pNlFJhJNZ9mLmXlgbIQb2sT+OsVjD6exklu5nZI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kMhEfYxx275MqpnfXzEc7/XRswknOBqN1HHKm8uAKVh6vT5OoE9oFRKk2lTgCD+h4
	 Q9LQdH0/Z418AUc1u3bpU9ZwnCY5KLMLkI9i8jaWn5KZRA0WCHlmq6h0mToJScpPLF
	 dRCKE+4ZOHUWfv5uEwpb0ZGu07upM/hELsG6e2F8caTDCJNZmoPhciM8W3Phz+0ie9
	 keKy0nMHiq/oszkX+I3IQtUDf5mlLuR2Du/xoXJ/0Jlw/k76J63SqanorGq+kbDMcp
	 4RlrWjVDBvPJ4XogPTrqfo12GdCc1hHfnyu5+jOiyYJHhvsNB+RPKf28Z8DlmyFi3A
	 Swj68oTxf2yKg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 03 Feb 2025 15:43:21 +0100
Subject: [PATCH v2 2/6] dt-bindings: phy: qcom,qmp-pcie: Drop reset number
 constraints
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-topic-x1p4_dts-v2-2-72cd4cdc767b@oss.qualcomm.com>
References: <20250203-topic-x1p4_dts-v2-0-72cd4cdc767b@oss.qualcomm.com>
In-Reply-To: <20250203-topic-x1p4_dts-v2-0-72cd4cdc767b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738593805; l=1221;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=tqucmL9W9MPsOEYBPDPh31xGn+/wmyQO4TWRIKO68wU=;
 b=wmSe4nyYnFddeuz6j8rcHJn8BaUTW+qiXPXz8Zy16R8BGFJRwViHaoo/FeYlfOqryDCWTDwq5
 hJw+24ljmVrA6j5kYjb7PllxmC0R1/oNO/vGAoJBm/4djBGE4rhAqns
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

(Almost?) all QMP PHYs come with both a "full reset" ("phy") and a
"retain certain registers" one ("phy_nocsr").

Drop the maxItems=1 constraint for resets and reset_names as we go
ahead and straighten out the DT usage. After that's done (which
will involve modifying some clock drivers etc.), we may set
*min*Items to 2, bar some possible exceptions.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 51eaffa45c18df15f93f7a3c7382415a59982793..af8c4aa4f43dfb8268c31d64ccdd5c4be7a4def5 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -220,12 +220,6 @@ allOf:
           minItems: 2
         reset-names:
           minItems: 2
-    else:
-      properties:
-        resets:
-          maxItems: 1
-        reset-names:
-          maxItems: 1
 
   - if:
       properties:

-- 
2.48.1


