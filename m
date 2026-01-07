Return-Path: <linux-arm-msm+bounces-87860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4D3CFD7BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A54D330BCABC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B85325488;
	Wed,  7 Jan 2026 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="M2am4h7R";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="OuMlcbfO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CE030CD91;
	Wed,  7 Jan 2026 11:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785667; cv=none; b=sEj+BDdH8MkEXPorvgRMAgMfJOTKEkS4GGXY9R24Hcte8H9frCwjoQWiYGvkBa9TqTjW8BWhrEeqTD63+GL4dtyJRlFGV0jbLf1uryJnA+nzPc6nxfxQjisu8fEKXAsLtFi182r1gQl1ZbIwAUO0HUOp9g6s9m5SFFTIVXvvmtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785667; c=relaxed/simple;
	bh=DSNZMkUnrb9wnRZUJYe4UcUtOHTkre4ois/gD/5WLcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L9MssS42WzUKEWAlTaTLbrmYdi2Bd+KUdLr7FhLwsxmZDDVzxgMIBKWPH1KvYgf1iKyu8VEEZbeOQvEsddRAPtENmKApt87CKfhI4NJk1TCaGBGWtUrPOrdiCwVfFj0DhT5F0NS/n27GrrUGIjNn2sanWMGOPg0xmNCejU7mkiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=M2am4h7R; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=OuMlcbfO; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767785649; bh=Z8RiKVLTp0UcGMuvq8sp0iy
	CwTGnACdpUXGc42xdzD8=; b=M2am4h7RMPe5iG1yn3TSlEgECqf4LBvS+Z7prd1qDacWiAu1vy
	9p+A2UutYvGy1HHeqd3ku+fF1greVVTcEar7Zu4VkiXUT0+uDCzNXLbfwqOVk3WFGydtAbshVju
	jZ6RcKt6bmPbsgXqrOrA2Yt50SISIXA3iz/ZyicEUD9TTYLWNkuFZ3KU0jlEW4M/dwjFXKkXTwP
	BDC/I/UcpV1UKkH+UtDlmuEgP6c6Ohm5wa7tvipuPQGCHFDrdF4d0Hxk72ofp96hd371K3TnGom
	zBvAo3Y9F2G35fCglOE0WDyn9/bOjJWLaR4kF+1A1KLpUezplc/N/nzhUjXNT7/d++A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767785649; bh=Z8RiKVLTp0UcGMuvq8sp0iy
	CwTGnACdpUXGc42xdzD8=; b=OuMlcbfOjcw+Fq56OEcsTOaRT2rxhl1NoNqgmTJFP7Zm2DeN2F
	SyaNpTd246qKwXN2e0ET//6AtPNcjYg8xxAQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 07 Jan 2026 12:34:06 +0100
Subject: [PATCH v4 6/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MSM8937
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260107-mss-v4-6-9f4780345b6f@mainlining.org>
References: <20260107-mss-v4-0-9f4780345b6f@mainlining.org>
In-Reply-To: <20260107-mss-v4-0-9f4780345b6f@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767785644; l=1416;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=DSNZMkUnrb9wnRZUJYe4UcUtOHTkre4ois/gD/5WLcA=;
 b=W1M3DqSAvpW5nmnsJtwfbdQ0cQFSA9NoT/MWqU9D+WtK74mlNmwK1ExgW6ucr/6dPrIn8TLbt
 p5DBiLaOWXNCMQlZ4rWZIMJXy1+7LXZL/nsvDqo87vxwkQvggvloLSy
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add the compatible for MSS as found on the MSM8937 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index 74202dd34703..b4a1b5852896 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -23,6 +23,7 @@ properties:
           - qcom,msm8916-mss-pil
           - qcom,msm8917-mss-pil
           - qcom,msm8926-mss-pil
+          - qcom,msm8937-mss-pil
           - qcom,msm8953-mss-pil
           - qcom,msm8974-mss-pil
 
@@ -232,6 +233,7 @@ allOf:
               - qcom,msm8909-mss-pil
               - qcom,msm8916-mss-pil
               - qcom,msm8917-mss-pil
+              - qcom,msm8937-mss-pil
     then:
       properties:
         power-domains:
@@ -276,6 +278,7 @@ allOf:
             enum:
               - qcom,msm8926-mss-pil
               - qcom,msm8917-mss-pil
+              - qcom,msm8937-mss-pil
               - qcom,msm8974-mss-pil
     then:
       required:

-- 
2.52.0


