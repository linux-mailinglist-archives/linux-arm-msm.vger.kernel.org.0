Return-Path: <linux-arm-msm+bounces-81103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DB802C4897C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 19:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 598444F46EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 18:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810FE32AAC6;
	Mon, 10 Nov 2025 18:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="AQStTjyH";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="xI5YIK9R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D655531B10D;
	Mon, 10 Nov 2025 18:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762799428; cv=none; b=V9NfTScafGMdNjDarq8oB/xe4QLmQ6GE3OYgQqhXjjyXOVEP0i12c3kiTEz1mjPW/u/5uf3tgB3T0wETuwJkQt34vDTHqdMMWgI4l6BFWuIBaCRlwL/VtNVEXftuCGGrqoTQM2fYbTWTaAJLi/T8tM2X7dOw1UmsYKoJap1jEZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762799428; c=relaxed/simple;
	bh=blLXmh6mgp8wVupgJBJQQTmrDdfrAn654OEASO+Jhw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jxHOo9105CtnK67bv4uaMfSNZrYcT5206eRS/oV2oIRN8ZGO40FYJ9jgJZzOWL/UYxJJAar7oUCj1GubNpRDfbtzjzXoSLS3X3S/k0+jeE3lYq7Qx2tOl8rspbJuUKy/ncMZo0ilwBi9PDPuSQbxLEEAZ7jt14aBNohJoL9tCyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=AQStTjyH; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=xI5YIK9R; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1762799390; bh=suSdNyHgQqyDWnyASa0/NQw
	MtXO1cSqpNiVQs6/7NyA=; b=AQStTjyHeNHjwCaGotSsJdRJPlMFytalRrF9Keh7waS+I33Nk3
	Ty75HNX+RVfSMxVdec8LL+3/+/GcrRtHK4UhhyaXAqhwoveBVJKZZYgDxgY0jH/FbZss9A11owB
	qPFN4JO9v1H+ZlwVQbDJ8Pzdz1l3mN9MWd7VoYCl49jsGvIJMscejZn9R+cYKxuv2Ux8aLtFuml
	EHGd8ca5vmlPuw+UyBJZu3LyaVNaHliFcBzF6+tmi2ZLAq9kBdaQY4dp4N1efVwKGEfg4uFKHMe
	zUV+90T9p9ELKj38HFdxKhjiSmhBj6BRdeVPHvA4hGcPv0/j11N4u9LDHwzdT3t6FNA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1762799390; bh=suSdNyHgQqyDWnyASa0/NQw
	MtXO1cSqpNiVQs6/7NyA=; b=xI5YIK9RV+vbenSLFD0IMzykMgCbk6EcQEwDamzLHuOrmW+KSu
	+e0GpFDrwDRKunUSgld0oZxnB07H4X4TjSDg==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Mon, 10 Nov 2025 21:29:43 +0300
Subject: [PATCH v3 1/3] dt-bindings: remoteproc: qcom: adsp: Add missing
 constrains for SDM660 ADSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-qcom-sdm660-cdsp-v3-1-cc3c37287e72@mainlining.org>
References: <20251110-qcom-sdm660-cdsp-v3-0-cc3c37287e72@mainlining.org>
In-Reply-To: <20251110-qcom-sdm660-cdsp-v3-0-cc3c37287e72@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
 Nickolay Goppen <setotau@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762799388; l=1543;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=blLXmh6mgp8wVupgJBJQQTmrDdfrAn654OEASO+Jhw4=;
 b=ABhf3yt7V+FdxBkE/HZtGK+n3ETsLb4bqBU1W8hl8wqqMIfDmwDMb4ICYQauCXogHm1jyvwD1
 86F9UxdEwmaDLZPJpReal3VYK/5NUX7lLlWf/HLMxYBw4HsA6DaXOFx
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Since SDM660 ADSP node uses "xo" clock, interrupts and "cx" power domain
properties add corresponding constrains for SDM660 ADSP.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 661c2b425da3..c48561aae3a6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -69,6 +69,7 @@ allOf:
               - qcom,msm8996-slpi-pil
               - qcom,msm8998-adsp-pas
               - qcom,msm8998-slpi-pas
+              - qcom,sdm660-adsp-pas
               - qcom,sdm845-adsp-pas
               - qcom,sdm845-cdsp-pas
               - qcom,sdm845-slpi-pas
@@ -93,6 +94,7 @@ allOf:
               - qcom,msm8996-slpi-pil
               - qcom,msm8998-adsp-pas
               - qcom,msm8998-slpi-pas
+              - qcom,sdm660-adsp-pas
               - qcom,sdm845-adsp-pas
               - qcom,sdm845-cdsp-pas
               - qcom,sdm845-slpi-pas
@@ -122,6 +124,7 @@ allOf:
               - qcom,msm8953-adsp-pil
               - qcom,msm8996-adsp-pil
               - qcom,msm8998-adsp-pas
+              - qcom,sdm660-adsp-pas
     then:
       properties:
         power-domains:

-- 
2.51.2


