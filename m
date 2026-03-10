Return-Path: <linux-arm-msm+bounces-96741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB7FLflTsGmBiAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 18:25:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A84625582F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 18:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1057C3092D43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760DA3D3484;
	Tue, 10 Mar 2026 17:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="O2i9t/Hb";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="+BvpFZBQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960BA3D47B3;
	Tue, 10 Mar 2026 17:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773163319; cv=none; b=nJxPhHb0ODwEuV5nAzMyauSRKKF1cSIwExTKc92RzlKdvhLRruCDGQadoO/+acuf5RHbd6+BnrGX7Erb5rMFWbO9edJlDY5XYI0LFHRX8vkbiydPEdXglJZjbvJIWQ38NIj+w4glzJmd2ZlIyqM3l/twot39iAneHIlPmPILuwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773163319; c=relaxed/simple;
	bh=TzsVHGlSCoBbKSOPs+fFU0nWBXCQdGT/XXZxOtpruB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=livp3lL5tBxFhkLJ6/hWqYbdfacH1Pz2M9J+SeKkPjJommiO0glojFQxTD7WRUt7m3CQGJrIL6e84ua2ouO49mka1RG/eIuHhq30grgC9kuaVM7xO9iQs5r1C66KwHIa5zKP0yRWrs4LAXxzwVu2nz4qfz1q+/14yFHRzwWcPsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=O2i9t/Hb; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=+BvpFZBQ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773163299; bh=pruZLXeRhOoythzHmsrVYzI
	deJBxXFqU4MKRcDB+P0s=; b=O2i9t/Hbq/GHeIinR+14DdJ2GNh8AFaf6q+zicHIthWBIedBNE
	0IzB7xsu/G2QzULnQ7lhG0sNsTnGtdx2b+Iy1iS9ye3q3lFkE87qHI3m3HZr0iVC1KobwBNArSc
	hzmR2CyE0qfV9w3w6qravInAyp/Pu3tmH8FsIVoNJtGChsAi6t6qpW73vf2TYzXpmN+M3sQtWWB
	+X+7hc7aERQa8UVfmt1vJSc3GOhrjZyMgPlIbI+OCa3QVhukY3HF2BZFNgX6KKPwdboWGbafUnQ
	rr8Xc5m8Ib4p5rsRl32mLR+oFh2xJudnGYy+FnqpRKxXSF7nEOIB6LUohFW2iHjOOkw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773163299; bh=pruZLXeRhOoythzHmsrVYzI
	deJBxXFqU4MKRcDB+P0s=; b=+BvpFZBQRK5/lvTKk59GHJwMyNgxz+qOIeZSiEmRgi6iaL4bKI
	YgIN8zUGeEUWVCVLyOC0f7ULNRjUy326ZRBQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Tue, 10 Mar 2026 18:21:35 +0100
Subject: [PATCH v2 5/7] dt-bindings: arm: qcom: Add Redmi 4A and Go
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260310-riva-common-v2-5-3bfc23996857@mainlining.org>
References: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
In-Reply-To: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773163296; l=776;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=TzsVHGlSCoBbKSOPs+fFU0nWBXCQdGT/XXZxOtpruB8=;
 b=BUJavoJl3wJVIAOti/If/CXHaKt3rQEf7UpJOz1wb9y3Um4wrr+CXUAuLuta+5Z2d+Px4SS/l
 A4Fwmb/Ho/mDFR/gRfXb5I3wEyFOHp9HuypQQ6yhWeSRnzhTgKQXMDF
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Rspamd-Queue-Id: 3A84625582F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.28 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.94)[subject];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96741-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:dkim,mainlining.org:email,mainlining.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

Add Redmi 4A (rolex) and Redmi Go (tiare).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 153664da91d9..1bdf2d8c9b47 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -200,6 +200,8 @@ properties:
       - items:
           - enum:
               - xiaomi,riva
+              - xiaomi,rolex
+              - xiaomi,tiare
           - const: qcom,msm8917
 
       - items:

-- 
2.53.0


