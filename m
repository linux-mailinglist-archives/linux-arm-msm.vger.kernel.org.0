Return-Path: <linux-arm-msm+bounces-84092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A47C9BCF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 15:38:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 069E8346ABA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 14:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B44221F1F;
	Tue,  2 Dec 2025 14:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="cSaSlAMp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A27221F0C;
	Tue,  2 Dec 2025 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764686335; cv=none; b=ORult/KlPGwUu9cn09PtgQ0kLcu+55h298xP0Zmq+abDwRwHeBy8MGI+wz6VqCpnZmajP8HJe8POz1qukcLoVHSMWFDqOFWyxKAApVsf9bkcOQdftKpEYDyaGF1o5FgwuGIyZvMiCvr0ZM31mH30D+lmiIfqdq7QGWmcpk8vhjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764686335; c=relaxed/simple;
	bh=qAkjgGsxs57P5LPztURhZntGutu5LKCx/HJXFrezsIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=StfIjt6HMPCfUMSpM9N9NtS63daF5MRnKwU2GWl1iIVUNuP5yOjiq/fpVCUQ9rwibBnL/WMIrend/gX9kciQHhjcGWosE73MOaqSmlabsZWj0yeSE+4mx7gKqGuoFLeXoJpi7ChBDeRs+bsFYr2z893jHzW7u5TYH0GcFIIER2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=cSaSlAMp; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from ggottleuber-tuxedo.gaeste.augsburg.tuxedo.de (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 6B9392FC0061;
	Tue,  2 Dec 2025 15:38:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1764686329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=73wj1xaQ+eSx0Hod8fQZS5pVZigDgrz0t1EBEjsnoXc=;
	b=cSaSlAMpmRglcIFtaMnX00KJuHXTWXSJKe1KWpCZm5GNcXOQidBhqF4j919t9fSdHmpgS7
	Y/Cx+DfWrDMingBzgoLkSXiVs7OqKABg6vRNlYtiE8K1Q1ZTZM0PYH/jcG1MSVSzHamuBv
	DOm9F9HNrWGeT1yGjSATjxieNUEYDUg=
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
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Medion AG
Date: Tue,  2 Dec 2025 15:37:51 +0100
Message-ID: <20251202143757.69817-2-ggo@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202143757.69817-1-ggo@tuxedocomputers.com>
References: <20251202143757.69817-1-ggo@tuxedocomputers.com>
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
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4e72882cf90e..e7b72b5d3274 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -993,6 +993,8 @@ patternProperties:
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


