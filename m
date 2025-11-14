Return-Path: <linux-arm-msm+bounces-81905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C85C5E525
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 17:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 80EEA4EB96B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 16:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A94334690;
	Fri, 14 Nov 2025 16:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="UjXG24gg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m12888.netease.com (mail-m12888.netease.com [103.209.128.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4899C33439B;
	Fri, 14 Nov 2025 16:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.209.128.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763138079; cv=none; b=m5Ho0BpegDDUovXCtPrvL5D+qVBFwskhCW4h/75mUKCQ7MVWYRGiI72rn3TzOjDrbppcaLyBM0+35zQ87jdbOG8D9tprFK1K/BMIlgcNFrO+d83MBelMJq2Y2HIBu5Js1jiq2kqYK3hDjMG6DJxFofDNeuPHUymDlUhiGpa4g3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763138079; c=relaxed/simple;
	bh=YYj/n0arlw78uSfajMg1OJLtNX2BlBtjaxNrNVFM62k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0F6eHXmRFXto14kjf8NPQq5P0t5jpZxAbg1eoxr0+oMKD5hOw9CU5tvTxywZtLOJ4dhUXlTOrHW8QeUjO+b5mBzqPM48W59edF6YYdOAeFOgX5ao75UqaY5zrC5Krs3J19b8IZlPSbOLMmq0paYhrtgqJ4RECOEr/sTdUla5xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=UjXG24gg; arc=none smtp.client-ip=103.209.128.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [116.3.204.103])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29a2e3206;
	Sat, 15 Nov 2025 00:34:25 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Sat, 15 Nov 2025 00:34:16 +0800
Subject: [PATCH 2/2] dt-bindings: arm: qcom: rubikpi3: document rubikpi3
 board binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251115-rubikpi-next-20251114-v1-2-fc630dc5bb5d@thundersoft.com>
References: <20251115-rubikpi-next-20251114-v1-0-fc630dc5bb5d@thundersoft.com>
In-Reply-To: <20251115-rubikpi-next-20251114-v1-0-fc630dc5bb5d@thundersoft.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 Roger Shimizu <rosh@debian.org>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763138062; l=886;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=YYj/n0arlw78uSfajMg1OJLtNX2BlBtjaxNrNVFM62k=;
 b=lG4mkVAuJdv5KXUelXG1/hy46oVEV9lGuDEi6Iuv6Bz1IpXfzeUkBHgyumICrzm+bJyoXqOmk
 WXvnu5shezpBORR9bifTf3wrRxO06Zp+NgXtD68jGIEF5r/25i4q6Kq
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9a8337d3c609d5kunm846241b3342e8c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTkhIVh0aH0tJGB1CTB0ZSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSk1VSFVJS09VSktIWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=UjXG24gg/QTsVRRGv781KcKvXFwm3q672kDvyvFyQv76QSEIg0aH4btkgne3HNn6B3xbXRh2MRYfmDI3cCjdAfE0nFJdSRxiJylei9yPDnXHzA6AlwFiqJjLpqyuAQLnBob70wbut+IS9qSLwpKk/HoljPX9SlThiZ+NBFdQO0I=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=9fhGlhM/E9smgHkVH8Tdj12RXzNX/lnussg+31t05dU=;
	h=date:mime-version:subject:message-id:from;

Add binding for the Thundercomm RUBIK Pi 3 board,
which is based on the Qualcomm Dragonwing QCS6490 SoC.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Reviewed-by: Roger Shimizu <rosh@debian.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..8c7dbf764ec2 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -348,6 +348,7 @@ properties:
               - qcom,qcs6490-rb3gen2
               - radxa,dragon-q6a
               - shift,otter
+              - thundercomm,rubikpi3
           - const: qcom,qcm6490
 
       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform

-- 
2.43.0


