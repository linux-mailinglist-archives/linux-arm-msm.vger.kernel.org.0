Return-Path: <linux-arm-msm+bounces-84394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A17CA465E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 17:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D54FD308E6E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 16:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F55E2DC33B;
	Thu,  4 Dec 2025 15:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="O9GYDXsX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CE11C5F10;
	Thu,  4 Dec 2025 15:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764863598; cv=none; b=Bfnx7oycdeqh4LhIuxBVXkhPuwCSqnXTvXLwbztshhAEStyNF4+nBQfxp70/PPcqf536Amx9fLwnm68ULXz5KsxgxmwyrpfMv0izDfRxPFvODP+7e9w86pXBh88ykWUV9w9JHOiFaW3z4qgHSwfVlv0WMqKBWyNTrUBnY7BsbmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764863598; c=relaxed/simple;
	bh=FZK6dOqocp/bTonUTAbS8b25ZOm+JBQfnaBUIfzODfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W0S1Pi3hZ9CzUz2A7D5VHbj+3jLHxO3yrI8BgEgLobsh0Em+jwshrkgKy4sV33noyy4fBfjOJSGtny6Z97JaSv0CX5cVMghIaJyD3cZYdqiWeKo085cMbn9mvMjof4mdNoCO7Lu3kyYfb7P21wVyUCJU9+vOro+gTlP2jIgnhOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=O9GYDXsX; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from ggottleuber-tuxedo.gaeste.augsburg.tuxedo.de (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 304ED2FC0093;
	Thu,  4 Dec 2025 16:53:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1764863594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4jssjomrLMjRQRS+wOiKV17wrHiuygQ3k4eDWRADiKE=;
	b=O9GYDXsXqBB+D93Ek6cY2Cz7qM1qRAvmq9iXn6T3oESwAjEXNFCI/oHMod5Ngm8ENcixqo
	zOjEjB9xiK+IfCq7IedjUXsBjFyet1YTnYEiNqea0UObmjjr5WTrVAAG4IukMd97hQie6O
	oHPRiUqhoGUJDbdmtGTmgY4rJgeU7kA=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=ggo@tuxedocomputers.com
From: Georg Gottleuber <ggo@tuxedocomputers.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ettore Chimenti <ettore.chimenti@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	stefan.schmidt@linaro.org,
	stephan.gerhold@linaro.org,
	wse@tuxedocomputers.com,
	cs@tuxedo.de,
	Georg Gottleuber <ggo@tuxedocomputers.com>
Subject: [PATCH v2 3/6] dt-bindings: vendor-prefixes: Add Medion AG
Date: Thu,  4 Dec 2025 16:52:05 +0100
Message-ID: <20251204155212.230058-4-ggo@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204155212.230058-1-ggo@tuxedocomputers.com>
References: <20251204155212.230058-1-ggo@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Medion AG, a German electronics company, to the list of vendor
prefixes.

Link: https://www.medion.com/

Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 07b024dcff90..b7c6c528e018 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -995,6 +995,8 @@ patternProperties:
     description: Mustek Limited
   "^mediatek,.*":
     description: MediaTek Inc.
+  "^medion,.*":
+    description: Medion AG
   "^megachips,.*":
     description: MegaChips
   "^mele,.*":
-- 
2.43.0


