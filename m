Return-Path: <linux-arm-msm+bounces-87410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD84ACF330A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 12:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 602E230390E4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 11:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F92032AAC4;
	Mon,  5 Jan 2026 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ThFJVlM+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB50326936;
	Mon,  5 Jan 2026 11:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767611094; cv=none; b=RmIfhT9yy00EUVsuwFnPJITE+lAK/dJWFckIxz4eZ0nTT3Bp95md/FCakL/Sk/kAjuLp6ft7tMVgZ9cdwBwgNWGWq2VC7cuKJtSYQTGLBSKY0wY/qnTa2kkFsPL5HGqxqkAm3yO9kE7uwGidwoP7l/KfO0+dqUZjd87gCyxsI5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767611094; c=relaxed/simple;
	bh=CSsFugzd2txAHYY7SUpEYd2AwIhQFwqQ7PHW/HMUfYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kcl3IljEB5eBnT2afXp3etiv9V/M8cdJwOJWtOjlb/+EhDFthpwOnbGCrKXDBeDF57asvZZrxVNqcnlYYylhdLriGHI+orgmQtJcjWXwl5sS/IIfMqm4DVyBnXoUrkbf4JI7kmpwycPun+JZDUKkbzCz8ZYDh//kaQ3WwSHejxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ThFJVlM+; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=0K
	uXEBhDgU06yTMOhR4rXOANJrdlp81ssEXTh62rKzQ=; b=ThFJVlM+skY9zwfIRa
	w0z04TMQA9fqv/JioyLuau9RD300SLE6hIGHbyYgwC75ng1GFTcVaboTLUbTxm5I
	DW8+rrRGN8oi6DpUtnHfPqHn0T2DQoyVA1FVaw7yLLxdoCBtFb3TNAnOLx3jObiW
	ZzrSyue2NWhSfZl4e0+m5RIQs=
Received: from dev.. (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgA3NNDAmltpWvyCJg--.1020S4;
	Mon, 05 Jan 2026 19:04:37 +0800 (CST)
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
Subject: [PATCH v2 2/2] dt-bindings: arm: qcom: add Acer Swift SFA14-11
Date: Mon,  5 Jan 2026 19:04:31 +0800
Message-ID: <20260105110431.2596253-3-wwfu06@163.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260105110431.2596253-1-wwfu06@163.com>
References: <20260105110431.2596253-1-wwfu06@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgA3NNDAmltpWvyCJg--.1020S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrury8Wr43CrWkGr4UAw45GFg_yoWDJFX_ua
	yxCa1DtF4rAFyFvrs8tr4rGr15Jw4ayrs7C3ZIqF1kA34vv3s8KFZ7tr9xAFy5ur47ur1f
	CF1rJryqyFsrJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_na9DUUUUU==
X-CM-SenderInfo: pzzi3iqw6rljoofrz/xtbC3AUJ42lbmsXiOgAA3G

Add DT binding documentation for Acer Swift SFA14-11 laptop based on Qualcomm X1E78100 SoC.

This introduces a new compatible string for the Acer Swift SFA14-11 board.

Eliminate duplicate data and add the device model to the compatible entry.

Signed-off-by: weifu wu <wwfu06@163.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 55d4afa9a70e..09c488973961 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1068,12 +1068,6 @@ properties:
       - items:
           - enum:
               - acer,swift-sfa14-11
-          - const: acer,swift-sfa14-11
-          - const: qcom,x1e78100
-          - const: qcom,x1e80100
-
-      - items:
-          - enum:
               - lenovo,thinkpad-t14s-lcd
               - lenovo,thinkpad-t14s-oled
           - const: lenovo,thinkpad-t14s
-- 
2.48.1


