Return-Path: <linux-arm-msm+bounces-82862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B748CC7A354
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 15:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 073473666B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C524434D4E4;
	Fri, 21 Nov 2025 14:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="SV+UgcBc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6FA34FF48;
	Fri, 21 Nov 2025 14:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735278; cv=none; b=UpZtzR7Pt8YoTIYUPHQIfBhMsty6ZBFzHe9Rv90HwmygvEgNGhSwLCp1kghvrX3hLiGNVFtdgxqfH0WhylzlJgAgo57WlzJngWoQfy2SSwyOU9UpC8pMY086iT2mZJW6WVryRLl4FTSAd1WK67UXqUhBBE33cjlwX9/F3A+t6po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735278; c=relaxed/simple;
	bh=6xWaPNQSPILMZjh/w01wAU3KefhQ36SMhzkODlDIDLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u1Zazryzbccp5woZD1pCi+OiTGm6RIkQ4PyxJ8XempQOUlgo57oUjQyK5VyEuTcoYttNF02qBEWq70ZUY/hekHsD60ZwoOxgfnfRu5rIIpcxeSWGyKm0vzqfdAkwvK/MtpX7PgMk/lGVaVsJ9yPN13xEmE6kFdMTPXORmH1+E6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=SV+UgcBc; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from ggottleuber-tuxedo.fritz.box (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id CF1FE2FC0057;
	Fri, 21 Nov 2025 15:27:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763735269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sk08et2R7m1ajMBmsdha/ftLdEfI0AUwQQQn7Ci3MWE=;
	b=SV+UgcBcwoLSkxj4w3vuy2Jg6idD3JPvjnB98REmjl2ZnH4KpP/3CSCtQh3rmXD7ldA5Yl
	IV2AKtZIBmpKvIxt3+1qe91NS0pRGaNpbJPDczM695YBn3/2GNf/ck+TKIqFYBXuXz/pjb
	GYqQDPG5waAZyawZym1nBfeCyLuGZtQ=
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
Subject: [PATCH v3 1/7] dt-bindings: vendor-prefixes: Add ASL Xiamen Technology
Date: Fri, 21 Nov 2025 15:26:13 +0100
Message-ID: <20251121142623.251118-2-ggo@tuxedocomputers.com>
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

From: Ettore Chimenti <ettore.chimenti@linaro.org>

ASL Xiamen Technology Co. Ltd. is a Chinese high-speed interface and
display system chip design company. Adding it to the vendor prefixes.

Link: https://www.asl-tek.com/

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d1882009ba..82bb5c25cd0f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -176,6 +176,8 @@ patternProperties:
     description: All Sensors Corporation
   "^asix,.*":
     description: ASIX Electronics Corporation
+  "^asl-tek,.*":
+    description: ASL Xiamen Technology Co., Ltd.
   "^aspeed,.*":
     description: ASPEED Technology Inc.
   "^asrock,.*":
-- 
2.43.0


