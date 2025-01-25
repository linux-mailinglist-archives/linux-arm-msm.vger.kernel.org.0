Return-Path: <linux-arm-msm+bounces-46120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AF4A1C0B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 04:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D880167E03
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 03:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B76155C96;
	Sat, 25 Jan 2025 03:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7AkTryK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3DE3595E;
	Sat, 25 Jan 2025 03:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737775895; cv=none; b=awauIJzXVfaQ9c4kOtLiwQk0fMdSoUwY40ST2YOoYDMWsgZ1cOQd0N4mekx3dwl2k520GSrvxeDa9lDPZFZ7W2WiAiX+aOZaKpMjRPVhsCIimH1LtRPTfyWiG9KGsuoBF6VSviSnvoGUNEexF5UywRVuovdJm+k3G4Xla6MBLO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737775895; c=relaxed/simple;
	bh=yQ4WZAL+HjPTJalu92xDn4gcmnU/eJvKNpSHwXuCHcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rTOMrxbpjp+JDXufFAS0UufxSRVBI2Pcpl1OYbPwxhwOZ8MNlu3nGufn08fbAPR/+j6uMzrNiAP8tssoTwr23ZIcNnlyz/aZM8rbxbwyYi5aAeQ1/U6RnNj6x1c32DEKHocm4ZYp1Xg+aqnQSXBZY/JxgZ9hqQ6marbkCA0QkXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7AkTryK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A73C4CED6;
	Sat, 25 Jan 2025 03:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737775894;
	bh=yQ4WZAL+HjPTJalu92xDn4gcmnU/eJvKNpSHwXuCHcE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V7AkTryKVx8hTgqLFyX6Igbv9FxtIV4wWZbgRDVoo1EwOhLg+USluawNNEYo8nW+d
	 kTU3Qk4j2jR7YcyPXoIaR3U4mf53uTADsqTOl1TFr2jQuQh8QHmBDuz9TcCJ+HW56R
	 uWXknQNtcGMaEF5zmH1K0f+KL1iooZom5Aj6mGINztyGOU0neSshWhJ4EVVFsEgdRm
	 zQtBXlgqHP0yJTLqbBs7NZtNiF/Tpxvb9Y1UdzgnO2Iqlchch83IMOJ8bCp7Bd+YaL
	 OimKpkyP7Ogb8S/YxNMQRvE/F8UgtFzk1CtqtMkCxPd14JQuHwPO+qdXFUjmwWjUg4
	 1ulTDGld4ckvQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 25 Jan 2025 04:31:18 +0100
Subject: [PATCH 2/6] dt-bindings: phy: qcom,qmp-pcie: Drop reset number
 constraints
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250125-topic-x1p4_dts-v1-2-02659a08b044@oss.qualcomm.com>
References: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
In-Reply-To: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737775883; l=1746;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=nIktw7MgGIgFnnkILzM1v07X3q5bcgjMMy7JANg0KiM=;
 b=en9NgYiXNZOek7cdDDhnfeAx+QO/5xZ7gwvv6mZtCP0QPIO+jM34GdWMAS53xSezFDrH/3IJs
 KogOTKPXYwSA3ls2HXzlDquuNbgUGHrL7vlAcfzF1ULiCyBzEruYMMh
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
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 24 ----------------------
 1 file changed, 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index f1ffc3d5cae44b8a9c96cdcd749a6e54533c94f6..c42143bd139e30d1beabc9099d0dde17128413bf 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -204,30 +204,6 @@ allOf:
         clock-names:
           minItems: 7
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sm8550-qmp-gen4x2-pcie-phy
-              - qcom,sm8650-qmp-gen4x2-pcie-phy
-              - qcom,x1e80100-qmp-gen4x2-pcie-phy
-              - qcom,x1e80100-qmp-gen4x4-pcie-phy
-              - qcom,x1e80100-qmp-gen4x8-pcie-phy
-              - qcom,x1p42100-qmp-gen4x4-pcie-phy
-    then:
-      properties:
-        resets:
-          minItems: 2
-        reset-names:
-          minItems: 2
-    else:
-      properties:
-        resets:
-          maxItems: 1
-        reset-names:
-          maxItems: 1
-
   - if:
       properties:
         compatible:

-- 
2.48.1


