Return-Path: <linux-arm-msm+bounces-78779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 95408C09060
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 14:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F31444E68E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 12:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95892FB0AB;
	Sat, 25 Oct 2025 12:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="ZwcXQCZk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m155115.qiye.163.com (mail-m155115.qiye.163.com [101.71.155.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBA22FAC15
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 12:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761395638; cv=none; b=mlgT4OQ7yelIgsgnYkqJzXn1n8wjQZK05QrLNXdVsxOsOBl0f1MhMx/gtlBLK1INw+RFDU//SVUQngMVPXpR7NQB42OmxIwuXjc97otkF2ruBD9hJ9skjdi1f1ZXe6bP7N2WVMBL18B3M2gJFDeqcQZq2jYJ8hyHJnGEAO3hKkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761395638; c=relaxed/simple;
	bh=UBXURaGVPbGzyPoOaxklz+kR8JifDqq631/smYCBbfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kSyK7lqIT5MXg4svlrCdSoBCoIRV8ahQNbwmab1eu6XpjSE0U/WWeytdtt4zQxUztMhYoXCBv8iHpVeacglxty4raugJEu6G4/iZIwKgi9+Cod/a76pzP2JPj0DobP9ThpZHDsaIdP32FfSjgbWMc34q3GZH9WPREqkPGS8L9Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=ZwcXQCZk; arc=none smtp.client-ip=101.71.155.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from ROG.lan (unknown [42.84.42.192])
	by smtp.qiye.163.com (Hmail) with ESMTP id 272925c57;
	Sat, 25 Oct 2025 20:28:39 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: linux-arm-msm@vger.kernel.org
Cc: casey.connolly@linaro.org,
	christopher.obbard@linaro.org,
	loic.minier@oss.qualcomm.com,
	andersson@kernel.org,
	Hongyang Zhao <hongyang.zhao@thundersoft.com>,
	Roger Shimizu <rosh@debian.org>
Subject: [PATCH v5 2/2] dt-bindings: arm: qcom: rubikpi3: document rubikpi3 board binding
Date: Sat, 25 Oct 2025 20:27:23 +0800
Message-ID: <20251025122724.633766-3-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025122724.633766-1-hongyang.zhao@thundersoft.com>
References: <20251025122724.633766-1-hongyang.zhao@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a1b57a1be09d5kunmb045701c5eabf3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSEsZVh9PGk5JGhhNTUMZTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlPSVVDT1VPSVVKQklZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ZwcXQCZkQN+BH8sxaXwUNfKS2ZvxyIl63SyvVxAN14vvRzq5f2t9nrqSBAwOIuCriFdwYo/jcLd77A+5Fj0pYmvKqKKYHcK+z4YKuOsh4XFoWe1tXz3/wER025TOzngXKj4Y3EjNWYb6EndjVuiOVXOE/wvUdrVIdQYwKQkDDuw=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=2MgwKCxgZS+QYZiZZcbDlI91EFn/zR8spOCcpLzLjis=;
	h=date:mime-version:subject:message-id:from;

Add binding for the Thundercomm RUBIK Pi 3 board,
which is based on the Qualcomm Dragonwing QCS6490 SoC.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Reviewed-by: Roger Shimizu <rosh@debian.org>
Cc: Casey Connolly <casey.connolly@linaro.org>
Cc: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Loic Minier <loic.minier@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18b5ed044f9f..0275f81c7cb0 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -341,6 +341,7 @@ properties:
               - qcom,qcm6490-idp
               - qcom,qcs6490-rb3gen2
               - shift,otter
+              - thundercomm,rubikpi3
           - const: qcom,qcm6490
 
       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform
-- 
2.43.0


