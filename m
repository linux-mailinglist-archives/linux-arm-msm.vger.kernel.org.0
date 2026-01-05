Return-Path: <linux-arm-msm+bounces-87399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE1ECF2F05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 11:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 661A13033734
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 10:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECB22F4A1E;
	Mon,  5 Jan 2026 10:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZRC7QM+G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614FA2F5A3E;
	Mon,  5 Jan 2026 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767607989; cv=none; b=slf3NjjVh7L9e5IHw+Sxh7a2VSDspQp9h+Tzz8J2hl6LrsMzINPPLBWccXlcQWbajzdQrBPtVqmpXLOlIUiOtZTZK8+L7K4Uph7t9nYe8flkdmSFLAqKwdTU7wwvhyCdRQh5wdyU9cxielxWGLNGUphLMi5ZQYE/ASQjKnLZp/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767607989; c=relaxed/simple;
	bh=qEOGF9krXly7wz4IijZTWPtin9C9fLBEnuUVKhC8AZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=saW18213q9qunllIJvBJ09pKi7foTn5qrnYOoHfBaZqRdEh0rU8LERiyalzJNb9sDg53beVNliY092wPiM6X9uFcTxrgFlYqEf6ITsxbb2OZ5XdaCk2UwcGnZFJOxfjuOs856jzD5EVKq0LR8s9FXclq4jyZmBBIPiAKjl4l85k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZRC7QM+G; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=6m
	55zAPRDuYOXw6NFTsS/r9GalogCmnzd3tixCdEjMY=; b=ZRC7QM+Gdj8jGTOXat
	SgJomvk+XCAzf79H4PZ2dX7YR/cyv9QmQw6S193Kih/5jzBQTFraP3vrCRcEYAzN
	zNbnK5r6+mFlsBr0Xg+ENsvHOnNCjsH75lEx2iOCzf95n2JG7iIY9U/Q5MPnIsaY
	AEJENOlRXJAMbDqG/UvTK+uvY=
Received: from dev.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3n_2ZjltpZDCvEw--.23440S3;
	Mon, 05 Jan 2026 18:12:44 +0800 (CST)
From: weifu wu <wwfu06@163.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	weifu wu <wwfu06@163.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: add Acer Swift SFA14-11
Date: Mon,  5 Jan 2026 18:12:37 +0800
Message-ID: <20260105101239.2591419-2-wwfu06@163.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260105101239.2591419-1-wwfu06@163.com>
References: <20260105101239.2591419-1-wwfu06@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n_2ZjltpZDCvEw--.23440S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrury8Wr4DZr48Jry3AF4fZrb_yoWfWFbE9w
	s7Ca1ktF4rJFWFvr4YyF4rGF15Ja1xtrs7C3ZFqF1kA34vvFZ8KFWkt3s2yFy7ur43ur1f
	CFs5XryDKrs7XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_VyIUUUUUU==
X-CM-SenderInfo: pzzi3iqw6rljoofrz/xtbC2xz71mlbjpwurgAA3K

Add DT binding documentation for Acer Swift SFA14-11 laptop based on Qualcomm X1E78100 SoC.

This introduces a new compatible string for the Acer Swift SFA14-11 board.

Signed-off-by: weifu wu <wwfu06@163.com>
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


