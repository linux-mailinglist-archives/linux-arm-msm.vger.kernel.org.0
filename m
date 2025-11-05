Return-Path: <linux-arm-msm+bounces-80461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3A7C36933
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 17:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B60DF642B73
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 15:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB53E341ACC;
	Wed,  5 Nov 2025 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="JBe5meR9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5D4331A44;
	Wed,  5 Nov 2025 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357360; cv=none; b=uGTBel/FRzZnQfm+hxZgAHvk/oQInmQJLrU//aZMed2WXa6ikT9rGutgqR/0GEKr/AHB/8bwbAwJn+2rZXgSW6qgL7EljjW3hu7i9i1Lb6MEglGGwFkXupokjCg5BoRiZrLPEDjaXhRzzduGWdR0h10ALN6gAL1RhR5psNKKkPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357360; c=relaxed/simple;
	bh=vC1IXW+Q+R3B8fujpesL23O2Gp2Qcrnr4XmZroBeNQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldKWPKy+vvywoxmEgXDLR5cyDekVVqg1qTpbLBGRZi7lipYsQg/DewIZmOTgnjFkHEFtqpuG0ijNu/rhBswP6simOnkAB2tUkoB9dXe7L6pRw/jsACIXCbz9ng43fCjGnD0ixN466QkZDJkNCRUcutbyyrrtv2xvt+k5Pg3rSPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=JBe5meR9; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from ggottleuber-tuxedo.fritz.box (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id AE15E2FC005B;
	Wed,  5 Nov 2025 16:42:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1762357357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vEgRYmBA72E0nNL7wzXfQ6WN1IE9GIFqVGJKvH23sMU=;
	b=JBe5meR9w7LODo/hJcMlWZeAtsGnC4bzl+8lsa5PlN06c0HIq865UGlgoBthyspMWR0M9g
	jLlwuIbXmFio4SVrWpliLPpy9fUM+0lnnng7x7YYPWYl/bo9UbMIP7c5MivN1jmUT5ucnL
	vZ97yHtpeMf5u0YxzSbWIgRmCFWRZFA=
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
Subject: [PATCH v2 4/7] dt-bindings: vendor-prefixes: Add prefix for TUXEDO Computers GmbH
Date: Wed,  5 Nov 2025 16:41:04 +0100
Message-ID: <20251105154107.148187-5-ggo@tuxedocomputers.com>
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

TUXEDO Computers GmbH is a german supplier for computers.

Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 278cb879781f..a841fe12c9e5 100644
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


