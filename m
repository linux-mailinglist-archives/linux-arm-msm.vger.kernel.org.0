Return-Path: <linux-arm-msm+bounces-87349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD1ECF1131
	for <lists+linux-arm-msm@lfdr.de>; Sun, 04 Jan 2026 15:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30EB930065B5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jan 2026 14:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A67247291;
	Sun,  4 Jan 2026 14:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="z2Dq8xqQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2560D2405FD;
	Sun,  4 Jan 2026 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767537423; cv=none; b=YxRgre3DVH8zWjXY1vY8kDKeWLGFIRNINh0M0OuMO4d/AeMarAmwZ2OATZfOshgQa/JXADGSOpzk80LJCB7gGxA78/gldeR/uqe4Zpfl10ZA9p1naPW8DhAfK+NZgGfAe+VoJAWea8+7tjTUV0qwvOKhKnwtCDXzarYNJx0vsqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767537423; c=relaxed/simple;
	bh=yT98RUpQOFvnA0SkR+v5tAlc2Y1618pACslRS8s0dWU=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=ZeDS5c7OJNIIv+8BXUUO/4E6/3Ldi7TuZIzJsaTTs/IWW1r62jmPuFBce6/s05+w2/UOJHgajATIzRRHdof0apTiranPqkAKFrv3+pJTe+mHhQW93sY6rMoFPhv/osZPlU8uEqeOjBH00/v+sehv1a5yCFD4EYnQeI8bOT1MasA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oi-io.cc; spf=none smtp.mailfrom=oi-io.cc; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=z2Dq8xqQ; arc=none smtp.client-ip=43.163.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oi-io.cc
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=oi-io.cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1767537409; bh=f+VnMtKY29uryI1bAD33eBhgMBuRwAfXoi9rJr1H1z8=;
	h=From:To:Cc:Subject:Date;
	b=z2Dq8xqQ0lCnqVQF4lOp0qt19cCGUTQWmvkZHjbEaoKVxup/A2oUhLIhascb3aVZc
	 lW4J+WU+/1ny2/QLKI3wnZInib1uH4Ru6d0LlQw9LVdYGEIsevR/+rZwxheufr0e7N
	 gqkrCFS9GYnBvIaZ7oaPnpkNXw0/rYUYw21qvMgI=
Received: from dev.. ([43.247.133.240])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 92E918A0; Sun, 04 Jan 2026 22:36:46 +0800
X-QQ-mid: xmsmtpt1767537406to2xzesuj
Message-ID: <tencent_C83F441A1B9128E38B200E3D75C304B25706@qq.com>
X-QQ-XMAILINFO: NO9hXE9ZNTc4Ie+VdopXbr3LlCp45FQl5Gtj8lVrbWnBPH+FqtWi+Z0UrKECUZ
	 iOaTH4v0ATZPqI8uJgTl7MdYHvdLfSbXWi007rZTm7JU9YeIeRJ+Mf0WHHAbVxYKC84I8KiKL3no
	 yZOPDFGtvPcAPo2AnTSI8leL0LFcH2LUuFqWFPo3M1GICesnA/JuaktjF/+eIaohGqGMZJ41hyGG
	 qAcO/hY3PL2CF9C8QK8t+6eHibqU0L2PvXwIAqb/a5SAqjk6ZUD0bc+kMtYxmuMhKTXtfnUlrMey
	 qchibHUq1/Vw5Z0yhWqBp20Fnheu+yyoIawU9EYTAujKXlS5U45HHYibjHXUZfLynYV4z8029AJQ
	 6zxYXtC4nErIKc5LcS+TrWAxGZFuHf43QvHAeaVRLv3Dm7rG1Z+91WYQ/SU4ck2/FYLaybwhEeaY
	 s3XkmyTbl0MuoQOORDMscQDXAkIkOUhZNv8yhOz+U7yOj0YBTGNCfYkOJImnFqStTZIuVo9zU3ML
	 O/LcNohXRMdy6+jfsEkv3msC8bh0amDUAb8GsGzKt2AXu0Y+GAFsDHkmwKOWKQtI7Q/vJddd4EsK
	 uDNQ51GbjYTZUifx3eHVx2c1EglV9wfHIC/EaR7u3EFq30vlW8KPvk2ZRky6IHiWs3/QeBhpiYNx
	 UHcOVfaDhoXoKrxVbvDev2/sGqoL8MAdPeJxyT+KKggbGEskWdYOrjP3igUc1G+pF0FxmI+2QeZG
	 NYrmABbz0K55CqX2OBXVjuz6CgZzKLE+UY2tsV7y5AohR8ojXRFPw/H9nXt/tQ9n2UEiFonTg75T
	 X8T7sPmcDv9eTrlT5jFtv2IqjHK+ceOf2XZ/wz8OHOxsLIw2GuqDNGhFmcTBEuB0iZoAafIqYQcR
	 TmrWi6hWm6lM80xBGx0VS7ot0jYtEMwaEk4FuvcTaPJ2U9NlqtCObTi8MlFypXdyGnRAaAe+mbAr
	 pCkTvUGVbhWfD4vl9M8goCW+EPiXlFGiVNHD9c+iyuOmzR799R/2PGbBDkrpYic28cZIiPKnA1EJ
	 nIM3TOsvjfAn3DbQ0lQ3jgk5rrCr17zMaCTUHRnOZG/RfJJZDaNs6VWmnh8KviBCpGl/a9ZSQzaE
	 isi+Ix6FBsw+Q8I1o=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: weifu wu <boss@oi-io.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	weifu wu <boss@oi-io.cc>
Subject: [PATCH 1/2] [PATCH v1 1/2] dt-bindings: arm: qcom: add Acer Swift SFA14-11
Date: Sun,  4 Jan 2026 22:36:44 +0800
X-OQ-MSGID: <20260104143644.2479232-1-boss@oi-io.cc>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT binding documentation for Acer Swift SFA14-11 laptop based on
Qualcomm X1E78100 SoC.

Signed-off-by: weifu wu <boss@oi-io.cc>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 4eb0a7a9ee4a..55d4afa9a70e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1065,6 +1065,13 @@ properties:
           - const: qcom,x1e001de
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - acer,swift-sfa14-11
+          - const: acer,swift-sfa14-11
+          - const: qcom,x1e78100
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - lenovo,thinkpad-t14s-lcd
-- 
2.48.1


