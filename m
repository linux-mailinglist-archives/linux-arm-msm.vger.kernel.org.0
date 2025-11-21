Return-Path: <linux-arm-msm+bounces-82868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFA4C7A3DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 15:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1594F4F4528
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9CA355802;
	Fri, 21 Nov 2025 14:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="PASPawK+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8A72E92D6;
	Fri, 21 Nov 2025 14:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735307; cv=none; b=cY/nAM3Hzse4NtSJzzLEg8MPLCd26XI46TBrxN8Cmf62tWRr3/WA/RtJIwwMrT4LdIOvF3BmeC8zVxgpY81sgOf+b9ycRgWx8IPHOwC6zeuZowuQTjmaU7552KTO+mamYPpReA6wEIk4NVF5iHpAE9gQYLr1MOOfHi7Vh8aQul4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735307; c=relaxed/simple;
	bh=SxyBzpHziKzzaUCoiodYuH1q2HNSyzW3Q8Je3LrwSzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kESPlFY2GoE2nyQH96dom+0knsY6kjV4Kniq8ryIba6J5JMH6TSh+lEDUN2B2ye7KtRlgALcyAmYgqNNAE7V40w9DZIUvO87+annxZS+Eqr4nj7GchikK27s6Zhmg9y+rQkf7Pgh04Y+CGainq1BQVouINYGt7EghYMXAiE02bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=PASPawK+; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from ggottleuber-tuxedo.fritz.box (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 5139E2FC0069;
	Fri, 21 Nov 2025 15:28:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763735303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xqVZQjFk1Pnuy7ljRzSMHF6BkI8Coeus+8edCjS1s2s=;
	b=PASPawK+zyn9AIfewpjzc7zQ5ejckF6razYCykJUzDlA0DocJ3UkrFNc1nbiMDO4jJITQk
	O5FZ4sdQDgH/Hxe1wACTX5XAzbH4VRDFOCGCZ4kpodB+woIwFZAlkXGc2rRm3ZCEI+hJcb
	RF4007vj/5hdSj2x/1PAT7CxWccd9v8=
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
Subject: [PATCH v3 4/7] dt-bindings: vendor-prefixes: Add prefix for TUXEDO Computers GmbH
Date: Fri, 21 Nov 2025 15:26:16 +0100
Message-ID: <20251121142623.251118-5-ggo@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121142623.251118-1-ggo@tuxedocomputers.com>
References: <20251121142623.251118-1-ggo@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TUXEDO Computers GmbH is a German supplier for computers.

Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 82bb5c25cd0f..4e2066007746 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1677,6 +1677,8 @@ patternProperties:
     description: Theobroma Systems Design und Consulting GmbH
   "^turing,.*":
     description: Turing Machines, Inc.
+  "^tuxedo,.*":
+    description: TUXEDO Computers GmbH
   "^tyan,.*":
     description: Tyan Computer Corporation
   "^tyhx,.*":
-- 
2.43.0


