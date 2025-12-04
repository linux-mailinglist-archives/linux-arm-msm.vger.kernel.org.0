Return-Path: <linux-arm-msm+bounces-84392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6246FCA45E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 16:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D09A315EAB0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 15:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AA32ED848;
	Thu,  4 Dec 2025 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="fRJCQng5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B582ED17B;
	Thu,  4 Dec 2025 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764863588; cv=none; b=CAzspS8qzvIJKcSfTYiYyAliV1cRsnLr1VPB/7wZphuIS34MuHCCpno2LeOGWaHUtbYwAB5aXHVmorzb158vKS/RtvgcUG4+KOXHtd0Q820VG6rRKgEHnJEqyZojOicyKqMMq65kZySqmT/k83St79dnvHUJEL3SiWqRlRaT5iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764863588; c=relaxed/simple;
	bh=dd0ZOEjkVVr+TPNHNgX7Qrr/fOAqUjJxivHmkZSBu5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LFij0gebMhQh2FOEOb0j9S1cPGOONq3/XwkqGhMtf7JnNQVpHnNzao1io6ngZWruRW647wC8nTnajYu3WWEM4DW25E3bElhcw1Z0kwj1b53AHEVJmTPLRauXcqaUjfvbmooZ8j43XplndV5E86K6Uxb06wsLtZukarCL3UoQU1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=fRJCQng5; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from ggottleuber-tuxedo.gaeste.augsburg.tuxedo.de (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 474022FC0093;
	Thu,  4 Dec 2025 16:53:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1764863582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4bphxOhi9wx9X7SljRXeRm3kcARxsXaCeygjAGu6ek=;
	b=fRJCQng5CkNB6BhEXUncPismLhEFpqlghqWEKr5HMAXaR7UHYXEqRn70NdHNhS6lSqwVWw
	4pUrrekEJPkh+m0r/uKMd/RpHXd8M3uKj3wusJe0arn+6I550+xnCWfzQKIWZ2R4crXjx1
	hDz1jwyKc1zpucdqJKF2FHY2G9oBahQ=
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
Subject: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add prefix for TUXEDO Computers GmbH
Date: Thu,  4 Dec 2025 16:52:03 +0100
Message-ID: <20251204155212.230058-2-ggo@tuxedocomputers.com>
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

TUXEDO Computers GmbH is a German supplier for computers.

Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..07b024dcff90 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1697,6 +1697,8 @@ patternProperties:
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


