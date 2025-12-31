Return-Path: <linux-arm-msm+bounces-87133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DECCEC44B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 17:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CCDB30E273A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 16:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9629E296BD4;
	Wed, 31 Dec 2025 16:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ejO3s0SR";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rsiMOIVg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40CC1E1DE5;
	Wed, 31 Dec 2025 16:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767198633; cv=none; b=RXHkd5NyOzJuIn4nstwKVeiVBOwyRGCExWXDovPh9cKY7GVdpiBxS9kUOYREDW+ucXPkXK4IEMubs/9GGpITCC7cz3mG614/JVV/uA02VkByw7KqrTy/XoL0/S2K28LB+9Bv1Bt8x5bj9TwEZAdEK8HpG0SvPGY0aD1fHEosW2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767198633; c=relaxed/simple;
	bh=ZGJL8ieQ+dAntpYwsMwaA/f5kgC+FT3c5sWvnrJ8RfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZPheH3bu0cniprjWq4lDXhanBFhsBGpm8/hGYXfmd83gkn+h9xQXMnU2Vx2k0Jjvc7MNWZoBu6uJ5N22Qx7KdGs6lz0h2N6XuXuwwQgxry8DmgV8FHFp11US7spWMWUA/KiAElIzD9t5fJAHtoqTajbzztrbNwaT1bTEftfBHgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ejO3s0SR; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rsiMOIVg; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767198618; bh=T3E+R96u++LFCayDHWU1Haq
	hLqGQ37Y/f4joD9JSG5k=; b=ejO3s0SRJijSsp+crbVw/JHdsZyEPlz/cFmhkAuVGcWrW7/WWt
	0OZDW2wWNO41cR7QWkc88x6BnfaL7YdNdU3G/B4FtKidm+7EdL7NzPk8BYs8KPTVuuCb8ZQjVie
	G0wPuH9+TOVYeCXYfaKxV6/6joeWrfdeRD6aXiF9qVEYt8iO/yQcla5NUoiohEvjPWalYqXtRvX
	gWyD615HLPk8x0FUZJPZpIWbEFKPnKVnIwnqSFbAep7v9iwNzDRlFa99RelMdHbXmow3rueHD5U
	+oAQSkWrZTXg47LCm0WUg+udXplbkAcPzuDdPjOgjr57UH0eiLga0nCCKq5SCH2HeTg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767198618; bh=T3E+R96u++LFCayDHWU1Haq
	hLqGQ37Y/f4joD9JSG5k=; b=rsiMOIVgiU+vE9fp7j1DGbLKVbvTQATuHUjHhlQB3kFNmk+pip
	NSbYgiu9eOVr02LEIbtcF+ZSBCUD+zXQrgCw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 31 Dec 2025 17:30:18 +0100
Subject: [PATCH v3 8/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MSM8940
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-mss-v3-8-f80e8fade9ec@mainlining.org>
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
In-Reply-To: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767198613; l=1362;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=ZGJL8ieQ+dAntpYwsMwaA/f5kgC+FT3c5sWvnrJ8RfY=;
 b=DjqKbnOqXq1GV7ALrH11L3QWBioWX69hPF3+mTCtzxy+IIRnHTH1hHij83xGPhKoLGb1+AezQ
 hMKDmJM6VdpCutmzqN0wCx7p0jAywZJwUycrJgmlpsOoo+j0wW7tItG
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add the compatible for MSS as found on the MSM8940 platform.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index b4a1b5852896..8c0ff4dfad10 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,msm8917-mss-pil
           - qcom,msm8926-mss-pil
           - qcom,msm8937-mss-pil
+          - qcom,msm8940-mss-pil
           - qcom,msm8953-mss-pil
           - qcom,msm8974-mss-pil
 
@@ -234,6 +235,7 @@ allOf:
               - qcom,msm8916-mss-pil
               - qcom,msm8917-mss-pil
               - qcom,msm8937-mss-pil
+              - qcom,msm8940-mss-pil
     then:
       properties:
         power-domains:
@@ -279,6 +281,7 @@ allOf:
               - qcom,msm8926-mss-pil
               - qcom,msm8917-mss-pil
               - qcom,msm8937-mss-pil
+              - qcom,msm8940-mss-pil
               - qcom,msm8974-mss-pil
     then:
       required:

-- 
2.52.0


