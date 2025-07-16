Return-Path: <linux-arm-msm+bounces-65112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BD5B06A8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 02:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BA1B3B2BEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 00:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F64414A62B;
	Wed, 16 Jul 2025 00:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="f/m5KqRl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBF3145348
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 00:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752625934; cv=none; b=Tkwml9wfRe1LNN8hbGb3JL1F/tv9rwKajUzWytFG1S+CMzasRYPR/oFArdmdv8MxnzPoSVdIWoT1WoUiARvR1CVWLbgWUfJ6mDFUezV1FnPWyGxoS4PRW2IQIsDiUZTGxSHAQ0R3lH6gcOAJ1VyEcJYfanEaQqXKZiY4gDF5GqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752625934; c=relaxed/simple;
	bh=7QjxsbZJhljxeSf5GiJFdUrHUEXq7V7V3cEi/7O1oqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iY1SZtbuL7y2nKV81rrS0tYgUSePAMI/KLr16KQXi0RNB1csj7oAJUQbqI63IU14ldDzv7li2LqLL1F8uULBAEocRNkxxomLpwGT5PF2pDGn06AG8lMm6u7Iy91b3E9ViRdalvnQRUtvXtUiIiexHmQQgY4M0kXugn5+YTD9aKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=f/m5KqRl; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1752625930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3W+VZ5jQJODRaFkXhdpndWDkHvkm3krbfMS0oQAdXCA=;
	b=f/m5KqRlcDUMJr0EaVJLiH2d+DtlZqH5yILfnSW0i1ilanBCC8vA1UDLFJ70TkPu5oJ3+q
	6WMGhVHVIQmFf6qi8Y7ChU+QDljZOv+CqUZe+31IIFJ7IZxwdx7UV66IFgpJATBPfxE6H/
	c5L7AZcIL5xUMUyT3/7FV7/FkMA6W74NB90o6gqWyFapD+qPQFCwnqCGbYC/3KJfAKvGB9
	y7f2802ZiIyKCmeesgkU8+zf3s1351gvTOvy9IUauTtslqiaZd9V2tMXvzqGGPuzFBFjnY
	oSzHFwbcJ1jr0oN4YncxsnXGnIfi52ghbFEsuc7RKZXhBTB6uuVpNnyFPJ4knA==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Laurentiu Tudor <laurentiu.tudor1@dell.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] dt-bindings: arm: qcom: Add Dell Latitude 7455
Date: Tue, 15 Jul 2025 21:26:58 -0300
Message-ID: <20250716003139.18543-3-val@packett.cool>
In-Reply-To: <20250716003139.18543-1-val@packett.cool>
References: <20250716003139.18543-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Document the X1E80100-based Dell Latitude 7455 laptop, codename Thena
(the codename is shared with the near-identical Inspiron 14 Plus 7441).

Signed-off-by: Val Packett <val@packett.cool>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Laurentiu Tudor <laurentiu.tudor1@dell.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 8e3b804864fa..162f80123cf6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1147,6 +1147,7 @@ properties:
               - asus,vivobook-s15
               - asus,zenbook-a14-ux3407ra
               - dell,inspiron-14-plus-7441
+              - dell,latitude-7455
               - dell,xps13-9345
               - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
-- 
2.49.0


