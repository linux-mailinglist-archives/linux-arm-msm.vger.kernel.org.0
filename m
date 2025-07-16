Return-Path: <linux-arm-msm+bounces-65326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5AAB080F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 01:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F7F57A837F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 23:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFA12EF29F;
	Wed, 16 Jul 2025 23:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atl.tools header.i=@atl.tools header.b="RLPY2JEr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.atl.tools (mail.atl.tools [49.12.87.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623519460;
	Wed, 16 Jul 2025 23:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.87.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752708320; cv=none; b=aq4GCba7ZIsTi1FMO5eHjXFTO/A/AikNjXI0r+mop08rlgavlbVCOoaMAzTyHS+lunsEy4kwANMzouCeVyx4TVr9YOx49p/gmBZFjpHG+kFAwK7wsK1krN949zboHbXjfReBTpJAh9RED+ihpE4Jj34v+uemoh2UU8YakyOaHZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752708320; c=relaxed/simple;
	bh=X+Di86CMbUpfZ6hyZL4JTaTzHBAeYYk1Ox0Ax2QoYnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KodIaNmEN8KrUIZ/JCf8LmKYJ82D76UT4jcOHXZKbrjOb0b2+Mo2ue4eU2Fkc7GovLB9goRUJsnHqwiBlcs+jsxeOBR8YmbT00YBKpYoTM0QJWYAyGP5jevXvX/PNeykJKsW3dQ1rNjIbkQV5lDSW/OD78Ar1GGky+hQUFPnA00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=atl.tools; spf=pass smtp.mailfrom=atl.tools; dkim=pass (2048-bit key) header.d=atl.tools header.i=@atl.tools header.b=RLPY2JEr; arc=none smtp.client-ip=49.12.87.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=atl.tools
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atl.tools
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81C6B2AB2A;
	Wed, 16 Jul 2025 23:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atl.tools; s=dkim;
	t=1752707848; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EbFBbsFUdP/+1pc9iPlU3StnDkdSfYHxnd4glBLXgjA=;
	b=RLPY2JErEbJ925joQTjGuT0Qy6V4LyRUdvzbrFPL7LJurNbadXOAA3FDQ0ypQYH5U4uoLE
	Ugau9YSfuREtfCEcgCKygo5p+zPY2h/75qAjb7K7cn/TB5M0OV8qscjcX7jWc7O534jjO/
	e4sVsOdbZDJNs5YtWIZg5ftCL45AWj/NiTYMsbhs+caz44SlHXm8T4AhvsDmZ6aVQaLS/o
	XYDO6szQqvEGUXMU5q5ALdCgg0yi9xGZMQtuS5RUR/d1B79Bt+9vDUUynyCaC6MdHnvNt+
	x6diHFvaYAowQv6sl1tnVvu6plTFML6F3JgyjPDno4E7rd9AxRLnH/vW2TfR1g==
From: Violet <violet@atl.tools>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: arm: qcom: document r0q board binding
Date: Wed, 16 Jul 2025 23:17:09 +0000
Message-ID: <20250716231710.99983-2-violet@atl.tools>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716231710.99983-1-violet@atl.tools>
References: <20250716231710.99983-1-violet@atl.tools>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add binding for the Samsung Galaxy S22 (SM-S901E) board, codenamed R0Q,
which is based on the Qualcomm Snapdragon 8 Gen 1 SoC.

Signed-off-by: Violet <violet@atl.tools>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ae43b3556580..64455af6c44a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1095,6 +1095,7 @@ properties:
           - enum:
               - qcom,sm8450-hdk
               - qcom,sm8450-qrd
+              - samsung,r0q
               - sony,pdx223
               - sony,pdx224
           - const: qcom,sm8450
-- 
2.50.1


