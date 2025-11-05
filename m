Return-Path: <linux-arm-msm+bounces-80459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB9CC36722
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 16:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BC48134F51E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 15:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEE833F8DD;
	Wed,  5 Nov 2025 15:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="DU/XI/VI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA7033F393;
	Wed,  5 Nov 2025 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357348; cv=none; b=u9nO4LhQMMZ4t77B/j2ijMtYxOHFGnZZWi70VMYSWpdN1Ej45gzCTr8H07Mbhvw1aPc68ERIJ/Q3DdxF7ZmCKp98O95GqunWljZzuXE79N0blbTKv8maZ5CUoTF2vjy+V3UV5xSDLazvPId9Ukqnm2s60NBdwl8T345D8yab3Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357348; c=relaxed/simple;
	bh=Sv+erU4ScoJb4+TBFfEfaQROO6Bk/+r4KUvN6upXugM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQzhzbfwzcNLABCr3iR0JMbPnbXdpa2IdBFpb20AuYYlu79vNcfvYtxgtFj3Vm3YTaT417g6qI/ISXZWCPbn0nPYmLS7M8+5joD9DvoPm9Hp0wJn2l248pDFkPYCEYrTSuKgizPnllkvCZaQSQKzNzfFuFL9jRGLheDXga8lbkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=DU/XI/VI; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from ggottleuber-tuxedo.fritz.box (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 74E862FC005D;
	Wed,  5 Nov 2025 16:42:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1762357344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=joXkwxfXVs6kgQX+EyBFHl5S+77sLW6GuB7gUkkYBys=;
	b=DU/XI/VIThnEUgV6WdtLziEPgf12g6ax+g3WcLn99WSl4lOfOCFJQ3k5LlTj8NmRLYjjR+
	cExNgzLEL1D5tG7Zvb5FFMurOnS2tACb/vL0oQi7F36TpDLTlg/7Bmk7zX3JCj5jdqRbur
	p99JRN8JjEfUFxwM3f9yHXwyGi54iPc=
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
Subject: [PATCH v2 2/7] dt-bindings: display: bridge: simple: document the ASL CS5263 DP-to-HDMI bridge
Date: Wed,  5 Nov 2025 16:41:02 +0100
Message-ID: <20251105154107.148187-3-ggo@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105154107.148187-1-ggo@tuxedocomputers.com>
References: <20251105154107.148187-1-ggo@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ettore Chimenti <ettore.chimenti@linaro.org>

The ASL CS5263 is a high-performance DP1.4 to HDMI2.0b converter,
designed to connect a DP1.4 source to an HDMI2.0b sink. The CS5263AN
integrates a DP1.4 compliant receiver, and a HDMI2.0b compliant
transmitter.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 9ef587d46506..20844f809a87 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -27,6 +27,7 @@ properties:
           - const: adi,adv7123
       - enum:
           - adi,adv7123
+          - asl,cs5263
           - dumb-vga-dac
           - radxa,ra620
           - realtek,rtd2171
-- 
2.43.0


