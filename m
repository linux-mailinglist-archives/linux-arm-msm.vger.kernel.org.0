Return-Path: <linux-arm-msm+bounces-59321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E52B3AC33AE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 11:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 556291896F52
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 09:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E29A1EEA5D;
	Sun, 25 May 2025 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="l5V6Zag1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4621EEA3C
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748166927; cv=none; b=l0ZBWO38Q7Q0QUrMDSOhwt91vt23T2mtQv+eLrJOQ56/7Ym6GXqYAPOxQK5GJql5p/+RhmWz+2tftLztILURKgTfMGsMbE4sIY82JN9UPOcLbGDGjakUiYx+yJK6FpHh+N3sVqYmCkkpbSMlNWPZv/zNZERsFufUD+Q8xApBAdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748166927; c=relaxed/simple;
	bh=Jn7ZYZSwtkLqYRlI80ZaD8sio1+K2DsnKAtwRKmV4r0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+sczGVyDUPfytqyaVqJv2dBkdlTUdCaK+orQIs+pldBywlIJIW8eHt/x3pzzVgp+73rxYE4PbNysYx09nzNEtylOe1tM4tYQ4H6TswEdoPrpCEq+Xsot6lqb9f2kGrbf5RE4iJQZ3sD/dOAFq/+nsb6MtXj3+c/0hFuFSBjhq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=l5V6Zag1; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1748166923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gID2IemeHkJqkz14Cc8CbWa9h6vQqjR8G2Hs1CLsl6s=;
	b=l5V6Zag1X4GF+J02qoPXyzVSgI4yM+HFfnlO0fwDF5tUlvI3yg/+8ole1hbp3gEh/KDbsr
	3bRl/wlzX/eJV03OCepsTYDu1Sarcm5HCTMspVBSfJs6w2X/GpR3GIm1qVkwnTCxnz93N3
	A7h+eFaiZp+GHO9kScPtNQYvldJXrALb5H2qDUpHr4F6Wb5XgNVbbYhajGIwAnRHvoCvel
	ni9D9CfmsBQe0s/ESlsIknWGbF6iONmBVNhlpk4ef43QxyMxEA6aZrh2FYoXUDxKY6Cjcw
	eEl5RI6IPIDw5Oy30C0AwAeEY1MtAzyelkExhd+Mgn9G3UseKIhgwH3aZX0NIg==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: arm: qcom: Add Dell Latitude 7455
Date: Sun, 25 May 2025 06:53:33 -0300
Message-ID: <20250525095341.12462-3-val@packett.cool>
In-Reply-To: <20250525095341.12462-2-val@packett.cool>
References: <20250525095341.12462-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Document the X1E80100-based Dell Latitude 7455 laptop.

Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 56f78f0f3803..e35a05db6558 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1140,6 +1140,7 @@ properties:
           - enum:
               - asus,vivobook-s15
               - asus,zenbook-a14-ux3407ra
+              - dell,latitude-7455
               - dell,xps13-9345
               - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
-- 
2.49.0


