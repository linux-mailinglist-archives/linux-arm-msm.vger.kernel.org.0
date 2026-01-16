Return-Path: <linux-arm-msm+bounces-89309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D51D2C74A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 07:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 10819300F66C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 06:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878D234D903;
	Fri, 16 Jan 2026 06:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9asVBd3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA6D34CFAD;
	Fri, 16 Jan 2026 06:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768544434; cv=none; b=OVAGwOzzkd/CPP08pPjm72IkYsak6TUesbQy5S6Fcc79bkdGB33EQR2dX6EbLo3kIRDQ/3Qzcp0g6VjU7AL1jgWcaJVSuVd2E9aFsteGXjJSfsM6WUc+TLwTZtHjjN5xD0k8XSvdktlwv7B/SDG9pf4y8DgwoSNOjwN4VBj6NQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768544434; c=relaxed/simple;
	bh=Jag6tsEHHgyFgjS80lTSgB0FSZN04+3pIBYrGRXayho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BZMmScu0lbY3wk9GZmlyKh1Z3xNsci1wkzwgrbpYtuN+Dk4GzVlt8U8c4yAf8Bekoc9fVW6XAIpZjb3whITWVK7tbio9WqNwb8XtEJtpm7d2NJekXLuYsa0YFp7r3b31VCTPY06fGqhdt26hgi5SEtTWxo55r3p6GNJbjsXf9z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9asVBd3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD8EC2BC9E;
	Fri, 16 Jan 2026 06:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768544433;
	bh=Jag6tsEHHgyFgjS80lTSgB0FSZN04+3pIBYrGRXayho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A9asVBd37NWQagAjDyp5HdtaYXuV+O6w4Lrptc0QP1UY0h/SCoh0JhxKPmjaAMRo4
	 wObQiJlPxdwJ+KbK5izwW0F/npb4HnCxN2iaF1Yo2FokqL1hM0CAPvut3+mbFnDkmJ
	 6300Foa4NdNrAX28wVIIMKBYc4h+mi+vY980gYPULy49rXaK0Qmyqvz7VoHweMfAUN
	 2XBw9h3LTWoe0zsoLwCzSJx0S7pwwDlk7o+aSqw/0Ffizv5ppkrSunIhX2XDCJ/bC3
	 DqDAPO535tQNEeGepnok2QNOQS4AUg6tACvgwDoxd8LhENY9kEiNiJ1x2Bea3AFiAa
	 Fq0wRYaAg4YRQ==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	loic.poulain@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: display: msm: qcm2290-mdss: Fix iommus property
Date: Fri, 16 Jan 2026 11:50:02 +0530
Message-ID: <20260116062004.237356-2-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260116062004.237356-1-sumit.garg@kernel.org>
References: <20260116062004.237356-1-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

Fix IOMMU DT propety for display via dropping SMMU stream IDs which
relates to secure context bank. Assigning Linux kernel (HLOS) VMID
to secure context bank stream IDs is incorrect.

The min value is added for iommus property to ensure in future when
secure context bank stream IDs are properly supported then the iommus
property is extensible.

These DT bindings changes should be backwards compatible.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index f0cdb5422688..5c888f07bc0b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -33,6 +33,7 @@ properties:
       - const: core
 
   iommus:
+    minItems: 1
     maxItems: 2
 
   interconnects:
@@ -107,9 +108,7 @@ examples:
         interconnect-names = "mdp0-mem",
                              "cpu-cfg";
 
-        iommus = <&apps_smmu 0x420 0x2>,
-                 <&apps_smmu 0x421 0x0>;
-        ranges;
+        iommus = <&apps_smmu 0x420 0x2>;
 
         display-controller@5e01000 {
             compatible = "qcom,qcm2290-dpu";
-- 
2.51.0


