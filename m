Return-Path: <linux-arm-msm+bounces-45017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D479FA108FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 15:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F2A83A138D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 14:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6E2145A09;
	Tue, 14 Jan 2025 14:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2dlSPKV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB7713A3F7;
	Tue, 14 Jan 2025 14:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736864338; cv=none; b=XW7JXODfbKhWzFu+JXf8oN1ARz+QL638NVa+QeXbTpTsgyrL/vA5rIyfEJytjkIT9DAZNfOnvon81QiW3ho46m1Ek81kH7urzdnY0VVasLYybtauxV4gzTmRsghsIhIH2qSn9z4Aw1RMQ7U/+7yzQkdW/4UdoMdw0TLZ5cL7Lys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736864338; c=relaxed/simple;
	bh=vcyeBmSbSgree/fFE1hvcj9N4VexLe+jdjZA0V6hTBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HbxuPF+AvLdqakFCCt0ySmIKER+8dkYJ012/aFZ3OSu+xb07/2hKt1Rpr1fRA8KzXkOra1Zw5dG4Eo+LV1Q/2EWruRizjwr5i4gmSoXHQ/WdTUfkmmp/GbNdsFskGpB1zTdPhoUugIohkGRCZmsOub+2EGSWZN1hKU4Fko8ggZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2dlSPKV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDE23C4CEE7;
	Tue, 14 Jan 2025 14:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736864337;
	bh=vcyeBmSbSgree/fFE1hvcj9N4VexLe+jdjZA0V6hTBg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=E2dlSPKVC6ZEjzGcRXSi8Sd8SlNQFdy+UWmJHkxlynWlc9q+MzdBxS8/E4nSl0f2K
	 SUfQuVoz4AHH2nNVbNXDI7sdDCf/Qf9Lf+iahccFQ0mJ0lgs7O7vTcDsEaEAa9WNge
	 GsB6b1qj4nQ6qz2wFp6wYN8ITf0VBUxxoIwCqqpkEA2tqohWm3FzzUOcL4/fDB/JJF
	 XRmUPoE1CIKAGBhh8PnXd4394FL0MfBe/g5E/ou/xRylQzodkRM91SjRAywJbFlb85
	 7B2OUi8eGff9rolT+NpSjBhbid9NCXNWBOIPaGP8slEoG4y2C2BiWIZNbb/ohaSrZQ
	 Cdby9aA33BAlQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CFFC02183;
	Tue, 14 Jan 2025 14:18:57 +0000 (UTC)
From: Ricky Cheung via B4 Relay <devnull+rcheung844.gmail.com@kernel.org>
Date: Tue, 14 Jan 2025 22:18:55 +0800
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add XiaoXun BiCheng
 Technology
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-xiaoxun-jz0145-v33-v2-1-8b42f77badfa@gmail.com>
References: <20250114-xiaoxun-jz0145-v33-v2-0-8b42f77badfa@gmail.com>
In-Reply-To: <20250114-xiaoxun-jz0145-v33-v2-0-8b42f77badfa@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricky Cheung <rcheung844@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736864336; l=1085;
 i=rcheung844@gmail.com; s=20250114; h=from:subject:message-id;
 bh=YLItZhmnioQz+msagvBTQwosqfJj9133Wi6WbhZanLw=;
 b=JG54DA3vK6ssV+27pPJLKGmBrIHn2deyI642+5k5tfAEgbZ4s9k8MvOiBB+RRYkEIbbmtefvg
 +0s5lA3mRHGDYfItHYiWo5ZtaFclcc76r2Ed2suckpLPb7dv42fV3uQ
X-Developer-Key: i=rcheung844@gmail.com; a=ed25519;
 pk=JjZsSnuDD1xuR4EXY4XGKELgToA++HxxheDlHU/41yI=
X-Endpoint-Received: by B4 Relay for rcheung844@gmail.com/20250114 with
 auth_id=323
X-Original-From: Ricky Cheung <rcheung844@gmail.com>
Reply-To: rcheung844@gmail.com

From: Ricky Cheung <rcheung844@gmail.com>

Add a vendor prefix for XiaoXun BiCheng Technology, which was an online
store on TaoBao selling 4G LTE WiFi modems.

TaoBao mostly require stores to be operated by companies, so they are
a valid vendor. However, this company has ended operations recently.

Signed-off-by: Ricky Cheung <rcheung844@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b320a39de7fe40ce4d97ed3ea264a5971a3428dd..9bbd21b47201d866ae68e6ae406189266871617f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1673,6 +1673,8 @@ patternProperties:
     description: Extreme Engineering Solutions (X-ES)
   "^xiaomi,.*":
     description: Xiaomi Technology Co., Ltd.
+  "^xiaoxun,.*":
+    description: XiaoXun BiCheng Technology
   "^xillybus,.*":
     description: Xillybus Ltd.
   "^xingbangda,.*":

-- 
2.47.1



