Return-Path: <linux-arm-msm+bounces-21994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7B38FF52E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 21:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 656601C22932
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 19:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996105465B;
	Thu,  6 Jun 2024 19:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="U7gFqaDo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCBC481B1;
	Thu,  6 Jun 2024 19:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717701528; cv=none; b=CaqRgYUqt7Uq4G0L05Vhb1tSOsXf/+DXFnE+BzF5JykYz1alUkGfKF1ZwjdLweertX5c3flJEjhrD+P85F9UI7EoHc+hBWnd2d32G2+bV8QIcYJuDD7z8PsBNYKj9M6qrEMsfDzX3IX0p9OZI4htD4fMHjNUzEEpzYPqXa8SBpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717701528; c=relaxed/simple;
	bh=Ch4DK6xncFLcT1HG3/hmYF1TuJWwNgr23WzvtefNeIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PpwcMXCTy8lCjk1KdBnKo6V3z4hbocYGLyXsi5GrQwxkOSHWODC8JbrogRmJSSt7ajhEPB6+vTUriHb5FoB2tPp00rS7udL0gk587eyW/HA0bL1PiRtd7ybmgWg22mYfX+7FoIShryNHNwdlNHDO7CKSHxW7M4roVmuOhxIB5HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz; spf=pass smtp.mailfrom=z3ntu.xyz; dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b=U7gFqaDo; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=z3ntu.xyz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1717701525; bh=Ch4DK6xncFLcT1HG3/hmYF1TuJWwNgr23WzvtefNeIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=U7gFqaDow/hxEpdi6w+nKz1R6rCA0pGVLbtR27x04xrjyMNFdlx3RPGUC/ofwJ00V
	 uNpyb8IsHfGnVW3LRZKK0+enNNsYMrKShtkPV0jeEoCpJ26L3y74aP8bYJ9BplddvX
	 DY5D3d0BUFuAgOfi8vOVGuSdgxFJqTW3r6Hdcy5Y=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Thu, 06 Jun 2024 21:18:32 +0200
Subject: [PATCH v2 1/2] dt-bindings: soc: qcom,smsm: Allow specifying
 mboxes instead of qcom,ipc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-smsm-mbox-v2-1-8abe6b5f01da@z3ntu.xyz>
References: <20240606-smsm-mbox-v2-0-8abe6b5f01da@z3ntu.xyz>
In-Reply-To: <20240606-smsm-mbox-v2-0-8abe6b5f01da@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2379; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=Ch4DK6xncFLcT1HG3/hmYF1TuJWwNgr23WzvtefNeIA=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmYguTjyQi0GJv03AnC6boUDMIW8ZgZ5PdmpstI
 UDYbwCPCe6JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZmILkwAKCRBy2EO4nU3X
 Vj2aEACmK3i/eYBw2QdKmj3qgIuUAEz2LHlMuOoE9dj7R5sw578bI9cgBT01/qJy/LVI6065Am0
 TnYgbshwwkNCqtimhJdTk4Ap+YMwHkqG5iT06T4oru72UmvKkVJXm3Ct9x8PFtn4rVy4gWDIuDh
 HzdRiaTSaK/aDYCgB1xNLTvriiqTbBXpES3bIF7bItkkWHOTQfWVPaxBSVyY/1nH0LKsZZW2m2R
 /7oIFqeAOSqgKqdD93yfX4Ox7nrIYJ8l0RcQMWjgmw2h6TM7BMRrDGNsaSTuDkZqu6Q3gz9RXY2
 iR0XLgCHQh5FShg4Qa3eWhreZfFZNsxeedRk3Jqv4QcF3YiFRldClF5Ny3UoQFFSxN2Cx4yPO1g
 E1cmoiHNRjh1OKNJBBPymnNzvDHQyi6xRfq0b5mUJ0huc5zNaXk5Bl4l1ELCSMeiyV+70j7ESqm
 uoIPt/+iRp/FekCUTa6U0bVTkhG4GkDyvLMwsZ1dofwTi2jzv9MitAjVuQXlNYwocLUO50DHBeb
 vKi8DPl/COMTPdfz7pN7MpI6SNhv5hGooD9V6r/qtr/Vsk9YdVoCYJUno981TDTx/Qn6t+q3Bmz
 IWGgW88mRGeeXnGRXO7HqisTwC/SNORkgUlPQer3q4CgR4zBHT3BSLIzfO4o3Q1UKJi1UrOAook
 hTsrd5IRrDdtJog==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

The qcom,ipc-N properties are essentially providing a reference to a
mailbox, so allow using the mboxes property to do the same in a more
structured way.

Since multiple SMSM hosts are supported, we need to be able to provide
the correct mailbox for each host. The old qcom,ipc-N properties map to
the mboxes property by index, starting at 0 since that's a valid SMSM
host also.

Mark the older qcom,ipc-N as deprecated and update the example with
mboxes.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 .../devicetree/bindings/soc/qcom/qcom,smsm.yaml    | 30 +++++++++++++++-------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smsm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smsm.yaml
index db67cf043256..4900215f26af 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smsm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smsm.yaml
@@ -33,6 +33,14 @@ properties:
       specifier of the column in the subscription matrix representing the local
       processor.
 
+  mboxes:
+    minItems: 1
+    maxItems: 5
+    description:
+      Reference to the mailbox representing the outgoing doorbell in APCS for
+      this client. Each entry represents the N:th remote processor by index
+      (0-indexed).
+
   '#size-cells':
     const: 0
 
@@ -47,6 +55,7 @@ patternProperties:
     description:
       Three entries specifying the outgoing ipc bit used for signaling the N:th
       remote processor.
+    deprecated: true
 
   "@[0-9a-f]$":
     type: object
@@ -98,15 +107,18 @@ required:
   - '#address-cells'
   - '#size-cells'
 
-anyOf:
+oneOf:
   - required:
-      - qcom,ipc-1
-  - required:
-      - qcom,ipc-2
-  - required:
-      - qcom,ipc-3
-  - required:
-      - qcom,ipc-4
+      - mboxes
+  - anyOf:
+      - required:
+          - qcom,ipc-1
+      - required:
+          - qcom,ipc-2
+      - required:
+          - qcom,ipc-3
+      - required:
+          - qcom,ipc-4
 
 additionalProperties: false
 
@@ -122,7 +134,7 @@ examples:
         compatible = "qcom,smsm";
         #address-cells = <1>;
         #size-cells = <0>;
-        qcom,ipc-3 = <&apcs 8 19>;
+        mboxes = <0>, <0>, <0>, <&apcs 19>;
 
         apps_smsm: apps@0 {
             reg = <0>;

-- 
2.45.2


