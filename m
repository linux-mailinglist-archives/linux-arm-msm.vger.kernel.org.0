Return-Path: <linux-arm-msm+bounces-51653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A47A65F11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 21:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 650B2189DDF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 20:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D341F462A;
	Mon, 17 Mar 2025 20:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpm0KBei"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EC41EDA19;
	Mon, 17 Mar 2025 20:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742243167; cv=none; b=pQiSaKnCNCDIqUVHWiEYKvtuUjE2E6SmA/CKdDur1IKMIokCbHO4EWvnsPRi9+7FmyN9Lbb7FY+ilzs/SPoti5BW/V8qj1HHjT0sEAIjODNGimYJmWINlosGE/IqS7+gVEi1vZmxHwhfw2L6kC5teN/DGT9H0bd4anp+eyx/cGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742243167; c=relaxed/simple;
	bh=JiV1Gj9dP5qunVw5aZvk+jHVlEVRhGeoMVCHLphzFk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L9vCK0AokuhLP/ABirTpn8fyEnWfs+kVxXhcRv3S8cgdM1ji/U/icXFtyTm7TMGA1/wrm8i/H+YLhCDBweELt7zAxo+4g2qhhDxWp5QnKHb29CMlDI9c84l4GU8CQqrrnRCm86JvfKkorvvt0Oy0tehm/gEwBezgKZSGaFQKdFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpm0KBei; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B12FFC4CEE3;
	Mon, 17 Mar 2025 20:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742243166;
	bh=JiV1Gj9dP5qunVw5aZvk+jHVlEVRhGeoMVCHLphzFk8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=cpm0KBeidy7zfL+4ytAxeseAHqht2oTPa+o3PTnqa+2OC52FqrMF6+wFoW4e2y+FH
	 1LOFzRvcO86G5bVKW85eUHupkjTwcxHFmY/QKuK5pXDUfShljeSUGx1SywcS1gN8MJ
	 WedFbase2uKg8pqEG4FDY+u5gTYv3edneF7YJx67xDLBKLV+v4bzqoVW3u1BaIFDSr
	 5sjRp1QIkvuKDDR79n5ah7fzbV8Nl1UtRZPyprHOaLvfgI6ABvIan5DtL0dxATCn96
	 2AIJ+5CilzqXlTa+95hVRQ/1cYB66Sf2SfimrqH1eyLh6hYHrAfARc/HhaXjg0EQdo
	 9Rf7d362B1uGg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42B7C282EC;
	Mon, 17 Mar 2025 20:26:06 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 17 Mar 2025 21:26:05 +0100
Subject: [PATCH] dt-bindings: soc: qcom,wcnss: Document local-mac-address
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-wcnss-local-mac-v1-1-c7c60d4427be@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAFyF2GcC/x3MwQpAQBCA4VfRnE1Z2sSryGGMwRRLO4WSd7c5f
 of/f8Akqhi02QNRTjXdQ4LLM+CFwiyoYzKURemLytV4cTDDdWdacSNGX4/kmPwkQwOpOqJMev/
 Hrn/fD9ZVHRlhAAAA
X-Change-ID: 20250317-wcnss-local-mac-57da1ca5feb9
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=64sSQPZfgn37XpxGWu0nVTKzcKK48ydVmCTjtTudBrE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn2IVd63X7hhBruXgk6lgCDh0TKdI/EFrqT8FIJ
 wBZgmsEWEyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ9iFXQAKCRBgAj/E00kg
 ckhEEADPwgDK9arSVnTZrdvJTY5lCzFZt/1hucNsAx6gxPUn4bZLtbKK4N2Lgfu0XGFHSS1PiC2
 41kZo8MqsT/nMTvZyDJYuxKJUJH5VkOytx4d/VT3pyB45Wdcvbpt5C92/odVGEZE6n7YwuEohMj
 QPC+gkWFVUVPhG78/UzhxEmkjFN3qCKmN68AqWdIoEMvaNNkIra9vP6GcljFiUNdHNUMH3H/fpL
 oe48EQCHYIXpUghMtgjj+XGs+Wwgs9znt1Tov//xCpNXGbgCi2IYHJCMRst4BZyaAYL+/jsSKH0
 rWHvaQzuR3tli1JL1BWQf70ZDATJeKjEtiaAcfG9ID8FmD3xmxGv7Kzc7R0aJVx7n38/TQi1mFW
 +AR+gMRTQsbY/Eb/MbHgvFB7pWfNz/VvtAcVmGfekzau7RIkdQl+l+MzUadk+vxTlYFNe+32eKo
 14VBf25L6iRGOaHW7eQDHqWMImjIfzNn1GGKlUIZ2uuZvRWHQgI991GuwNt5yUGzTwKjSGLtrei
 cwyysB+OKhPLEuZcgVaWMITAigBsJpNDrv2DhLnbYOixRQQlZ1z1NgG61yhF31FEIUKkGVr5yXk
 Db6qGXu0Pa+Yld+Mp/jsGO7PXoZg/kFfEe8hmq9rVRr58N5QA0q9ybDLz7oKA2XsBJ8LOO9n84q
 pFEqeAMxpwbxvJQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The device and driver do support setting a custom MAC address.

Fixes: c49e9e95f4d1 ("dt: binding: Add Qualcomm WCNSS control binding")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
index fd6db0ca98eb7e56d7399f55c408844d5e782805..6938dc4ccc2175a65f6f53c6d073fb72cf498b2c 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
@@ -68,6 +68,8 @@ properties:
           - const: tx
           - const: rx
 
+      local-mac-address: true
+
       qcom,smem-states:
         $ref: /schemas/types.yaml#/definitions/phandle-array
         maxItems: 2

---
base-commit: e94bd4ec45ac156616da285a0bf03056cd7430fc
change-id: 20250317-wcnss-local-mac-57da1ca5feb9

Best regards,
-- 
David Heidelberg <david@ixit.cz>



