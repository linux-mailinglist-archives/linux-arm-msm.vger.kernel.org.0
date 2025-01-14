Return-Path: <linux-arm-msm+bounces-45011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D01A108BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 15:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56FBD1884803
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 14:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E792513C67E;
	Tue, 14 Jan 2025 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njmlVfxQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B586F13AA2F;
	Tue, 14 Jan 2025 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736863881; cv=none; b=gK5DG57Jb/5kmXpTU6rPezlZgBn5lkDqq5xEJ8hGdy933q7iiC38JilkLHHnCoZ1To0VWSZ13ClUBBmGUlX0dR1R3KK4d4tGiPYmoAE1umZdMj6skY0xrjoRztD0qG65ko6TnpdqB/9qsKo1ucs9nXYVwB2CkvuiryzBki1m7O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736863881; c=relaxed/simple;
	bh=vcyeBmSbSgree/fFE1hvcj9N4VexLe+jdjZA0V6hTBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O43yV2e/qa+mky+z55O2HdQmQsSOmRiuW/cGK9owM8GFv1uIes7ePQ+UcZp2Xr3NDZEm0hOMFmLjXTcw5NHaD7s39lHL/ba7Aj+T0mBhX5Z2HRJPa6EjhjEtWX9PpioIDHkTIU6JiYI7Rj2lEmQ5JQ7+JVh6STWTa9tdacygHKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njmlVfxQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5ACE7C4CEE1;
	Tue, 14 Jan 2025 14:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736863881;
	bh=vcyeBmSbSgree/fFE1hvcj9N4VexLe+jdjZA0V6hTBg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=njmlVfxQXK443f8AKUs5epVFeTsfgrjeo80WGuXIlMHdCiZW09oZKKRnnGHBXNImO
	 p4k6gyaTbRplHEbhWxdl3sjz1HiRxp0dfecIok/EFxZHH3TTRYB3BJudUz3fzd/et/
	 Ra1/zf1/CksxBV/LGdfyOb4bRTuRyVrXTWF0Yc1oyh9SN/qVe6VksmXrCEDjhTRgvo
	 qWW1Xc9hd0jLkymDeSGvD/SJ7u8DgzvQSqdGxm44szomGw8a9ga8PLbdTtJ48jzesI
	 MBF7KMpZnGGv3O2mLlUzBWoK4XJZ0+6AK6msGB9AMqE3hSxC7SwSL9j0Ow/vH/pKrJ
	 DFmjGR36J8PLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51766C02185;
	Tue, 14 Jan 2025 14:11:21 +0000 (UTC)
From: Ricky Cheung via B4 Relay <devnull+rcheung844.gmail.com@kernel.org>
Date: Tue, 14 Jan 2025 22:11:18 +0800
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add XiaoXun BiCheng
 Technology
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-xiaoxun-jz0145-v33-v1-1-dc51f7ce3bd8@gmail.com>
References: <20250114-xiaoxun-jz0145-v33-v1-0-dc51f7ce3bd8@gmail.com>
In-Reply-To: <20250114-xiaoxun-jz0145-v33-v1-0-dc51f7ce3bd8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricky Cheung <rcheung844@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736863880; l=1085;
 i=rcheung844@gmail.com; s=20250114; h=from:subject:message-id;
 bh=YLItZhmnioQz+msagvBTQwosqfJj9133Wi6WbhZanLw=;
 b=3rDDWsIIf8vdabeI3uKNUkg8MrYNNkST/043MuSOZr2VIPBZXwAzHyUFuQxLzcqAHzZ6uj/rf
 ck5QAZlXxTDBzTv/qwXTdIu0346UdsXTc+mskuRsRndVm+5/j5KaRhS
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



