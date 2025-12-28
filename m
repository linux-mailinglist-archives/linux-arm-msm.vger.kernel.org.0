Return-Path: <linux-arm-msm+bounces-86719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA83CE5127
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 15:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 564873011F8D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 14:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A882C1586;
	Sun, 28 Dec 2025 14:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="R3vhTifZ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="krxnRLfy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0706B204C36;
	Sun, 28 Dec 2025 14:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766931858; cv=none; b=Tik2pHArw/0O7jxhSy6Iv8OKPbcB0lf8OfNenNtLIq7xDgOhlzJUsp2aYBRN6xIZ889NVd5Mveeu6f9Zw+bH52z1RxbaPoAbiTJHqFDd7sRLpvzXP+sFDEWu/4V1uz1kv7G1IpptlaqvKD1ZGSbba44lo73y6Kt0A/LXuZ1RpCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766931858; c=relaxed/simple;
	bh=Nvtd4i43UKJcFksGr2igfF+1dYNzxJTEwekfTdu84DA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n8nCE2sRnGe7pyPiZNgKzx6YQf0il4TtNng38SgYdZtyWfl80h8fxgw/HSESoEbqChOdidmQ6BTOv8JWk2UIMewCQM2EEwD3LKHzIrpkHBoYw3rTaKbXtYWp71nZbwFlRUd701xSwrbQu4ZokL4MOqhOfKVEEo5bxNv1mBlrm6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=R3vhTifZ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=krxnRLfy; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1766931720; bh=OZNjLjZCj5O21B8Sr/GTecb
	EhWNQ7CNEa+HmymTkREM=; b=R3vhTifZx1Ysf5Hur3u3Q8LdlnqRTKl+NhmfMlIm/b5Nbv3BT5
	jQhi+PXMUQZgj9GWLBHL6txAanmdYxw8bLMJ8Fx4fLcYNXCIcGeRgo7ybRQ70wgISHVWSbNqTkb
	ChG2EXaiwVo1Q0CAfka+6iRlNkC6FNeMbZDhykLHFIAxVgRpGvGbOPe9ovdZDJpsWTgp6fmOeW1
	uAmid+FSu987wDQIfXTtm0dyABrlxH0EKCC1NaQoGCoZwtzPfEoXET+MF7ShgfPqvtUbVzSMa9b
	IxwEvL/VqA+j2mYtSERbobeaMWkss3cGM5SMk1CgIUXr09QpzmEjwx0CT1xIDkcmO/A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1766931720; bh=OZNjLjZCj5O21B8Sr/GTecb
	EhWNQ7CNEa+HmymTkREM=; b=krxnRLfy+bLw19O9lnddMRLW5ZwkcW432Ra+7ENzpsagQSaQLw
	cgbWJwiO0VRURuBw6O67ijcJnVTTRcZkKKBA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 28 Dec 2025 15:21:51 +0100
Subject: [PATCH 1/8] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MDM9607
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251228-mss-v1-1-aeb36b1f7a3f@mainlining.org>
References: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
In-Reply-To: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766931719; l=837;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=Nvtd4i43UKJcFksGr2igfF+1dYNzxJTEwekfTdu84DA=;
 b=xnxYXulxj5GXjnNqNDvqwYzuH4+3f02/Ctwr2eBxG9kC4eKk2J2xyKm8LUbFkAhPkv3fcXKC7
 YMzxMPL6BlYCLSZP+pSMMZGh1LYn2w70/ayARHe0QXi0K3VsB49srLI
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add the compatible for MSS as found on the MDM9607 platform.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index c179b560572b..b59d6fe091a5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,mdm9607-mss-pil
           - qcom,msm8226-mss-pil
           - qcom,msm8909-mss-pil
           - qcom,msm8916-mss-pil

-- 
2.52.0


