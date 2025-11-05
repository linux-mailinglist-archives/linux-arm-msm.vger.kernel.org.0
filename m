Return-Path: <linux-arm-msm+bounces-80458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5559EC3688E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 17:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79D241A24600
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 15:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596CF33E361;
	Wed,  5 Nov 2025 15:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="piDO8D5I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A02633DEE9;
	Wed,  5 Nov 2025 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357345; cv=none; b=k8SZn4FUna92hBEG8N0IZEHS04BUJ4BlTJc6LIfhR6vghIbx/PidnOzEcUkE0tUb0uVI7dTLNlWfgQ0t+Y6+6txegQyzROhAiv/jO7nNaQlOTmdRcN/OaO/OM7x7RxHdxnxVhjlvCvcvgyXGyxLLQEW53wyRMzd8CdLTL5cQ140=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357345; c=relaxed/simple;
	bh=Ar5QIAcExKuSEgWaPBjlPmlXrj+u8Chb/yhZls+Flfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IedLroD7q3Pit1TdIPs3G+UXxJoaoNO1ZAYuFeC2hHeCbaMc45zI6ybYKI5HPEofS3KJt/KHoQQQ9zQUkDbiJtu9a1X82wj0CmqsCU5PL8VDKK+3EnX9EW5of9LI496BWm9M5Ny9bmELEPs/8akoahhpvNJXnhGKKFgBu+3vLr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=piDO8D5I; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from ggottleuber-tuxedo.fritz.box (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 748462FC005B;
	Wed,  5 Nov 2025 16:42:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1762357339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQe0db7+0Ramxg70nvZ4C69Wh5+DUHHqRkOvKB9zfrc=;
	b=piDO8D5IXr0radKiaQI+AQVt0H9ri9qFTt22a6JJZecTfmW92zECdtbRb+jDx9NY5ESxFS
	DbD9Qkkyu2UaHO7A9aaqoci0TUwckJowFnZtQ1pxfZlbtafM0D0NRGhFEHqQx2YXpbTvSJ
	GP/UB2Z7naCpB2rLPyNM6Xhbq4IXklc=
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
Subject: [PATCH v2 1/7] dt-bindings: vendor-prefixes: Add ASL Xiamen Technology
Date: Wed,  5 Nov 2025 16:41:01 +0100
Message-ID: <20251105154107.148187-2-ggo@tuxedocomputers.com>
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

ASL Xiamen Technology Co. Ltd. is a Chinese high-speed interface and
display system chip design company. Adding it to the vendor prefixes.

Link: https://www.asl-tek.com/

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d1882009ba..278cb879781f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -176,6 +176,8 @@ patternProperties:
     description: All Sensors Corporation
   "^asix,.*":
     description: ASIX Electronics Corporation
+  "^asl,.*":
+    description: ASL Xiamen Technology Co., Ltd.
   "^aspeed,.*":
     description: ASPEED Technology Inc.
   "^asrock,.*":
-- 
2.43.0


