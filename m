Return-Path: <linux-arm-msm+bounces-45019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26220A109B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 15:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BF1E16A0DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 14:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B10614EC55;
	Tue, 14 Jan 2025 14:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hMZ+ZR+d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EF513C67E;
	Tue, 14 Jan 2025 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736866014; cv=none; b=ECfevN7L/BwXwF+NMR0u3zsqKIn0tWQar8njZ1LOMPymE23yUraxTkPB1/MdqwoF0sCETrR0Po8CVucO4Fg9w0igdwJw94JXBsq3vIgK9vry3mKRU3RaD8xBKTYfdO76SlkpI95+rgdrOmEPSx2hFrXNKNk61LdXu2tptKtiBgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736866014; c=relaxed/simple;
	bh=vcyeBmSbSgree/fFE1hvcj9N4VexLe+jdjZA0V6hTBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kliiFV+m+uUm45b2Xl/TNRe3jPzRDaMjJ/fSvZBvUDNyaPWZ0fOFPPXd+LAAsBs7p5QjTgUz+1ieovzIwX7RuRC9FLhmishUWE51Z3Ogzp+r0dmKNzPORfH5aixifovNpAOhBCp2k7fxlTPSsnKMi09q4gZStoiCOUosvyWARSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hMZ+ZR+d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 784CEC4CEE3;
	Tue, 14 Jan 2025 14:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736866014;
	bh=vcyeBmSbSgree/fFE1hvcj9N4VexLe+jdjZA0V6hTBg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hMZ+ZR+dxP0K3WkRP4AEeXwa8iYiUwRieZrAdKgYm+yPwMhZeGdu8oYxvtBgKt6my
	 KIimZxAAnJFoMX21Kv7ZEaEQsQVW5r2QkeA3g0QGvzbekc/mWy0rqGzsGovsRpwuGy
	 YIBaLDrg7HGriYlfRmgMixe30pyAMRF3ke3z7ei0tIsJx0N95438BYiLifoT+Vm2lF
	 7LO1iP2ZTg559lqzPoXK1wOe6xIM61hmifgsWvcN/VbZz5ASSHdSDMGSXnJD0Qdmx/
	 JvuIwUJXLmUb7zNNFh7b3B/calDNdzXp4SL7g1RPioGUhxpIheCNzycA71G6UI2An9
	 WTYAIDz8NpIpw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C5FE77188;
	Tue, 14 Jan 2025 14:46:54 +0000 (UTC)
From: Ricky Cheung via B4 Relay <devnull+rcheung844.gmail.com@kernel.org>
Date: Tue, 14 Jan 2025 22:46:48 +0800
Subject: [PATCH RESEND v2 1/3] dt-bindings: vendor-prefixes: Add XiaoXun
 BiCheng Technology
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-xiaoxun-jz0145-v33-v2-1-495e986579ce@gmail.com>
References: <20250114-xiaoxun-jz0145-v33-v2-0-495e986579ce@gmail.com>
In-Reply-To: <20250114-xiaoxun-jz0145-v33-v2-0-495e986579ce@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricky Cheung <rcheung844@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736866013; l=1085;
 i=rcheung844@gmail.com; s=20250114; h=from:subject:message-id;
 bh=YLItZhmnioQz+msagvBTQwosqfJj9133Wi6WbhZanLw=;
 b=fJNoy1b5kdpf8rL9yaDYqmv29qVRpaC8WcRbZGq8n2Q+ryINaqE3QrHcGkMxw/oHnbLeBvwPd
 t1WqfGHrmLlBJZMOr+0fCM9UTqraFqVIEKLzoRWKtLbKf4cGrL6Bqad
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



