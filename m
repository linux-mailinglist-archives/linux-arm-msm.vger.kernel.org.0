Return-Path: <linux-arm-msm+bounces-63867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF5AAFA7D4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 22:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC344189623A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 20:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0772BE033;
	Sun,  6 Jul 2025 20:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="YLHExb1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0392BDC38
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 20:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751835543; cv=none; b=KP3uIyJpdKCfRmwYnRsGpH2H8/0eib5LhKAe9AMH7uLp5w43zo7WPjgA3ga+4BRYtr3KIhUDCbqWgeN90V+0Fapss4eUoh0iCvqUzAjOTBT9feVeYfTjQhMQYOEoi8qIKnNftZMEsbi8j7PtzgtqWuAbhWn2+yH/a3W1/GF2iPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751835543; c=relaxed/simple;
	bh=ho2rwTSdEsBwxt3Tg5cPYOoKqzB5TlXOnmxJt71JOnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0G/54yydL5CAGThuKUa6GftVkxjw7tyKHONu2DO6j7lTvTQt+nzl7sUdwfFEwUFwQFiWlKLCCGE+SG6n7OGnhD9hzdJBWZW9ZbL4421/9/ACNFy0ZI1iIvLwuGJfQY4qUez2lvMJXvg7NluqRiqfmL6WVVXqOrNK116uNO2PPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=YLHExb1l; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1751835538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OpPPvZlTf161qo41zEM/rvDpNb0+czAede4+ebWXEe0=;
	b=YLHExb1l8hwWbzRscCHRVhQFL7m6ipWFBWsK39JzxQp/AzdWicAyU+dIswq3Q3wn9F4pc4
	tMimOuMYJu2YgIJg8sUuny5S64yAi3L5CuB8YJ8OA8hgVYY3dAY3mhXeQ/f0S3OrE4Olm2
	NwU/Wexbje/waXXP0xn+KxDn2p+5eox7UAShNgyvKycX8M57o/+e+EMUA9NM+Jo38/sjwh
	AB9PLQUkoRZhNkcvQqaiyH3n6rltDJb88bJNE5FY/6yNPQzxzshZloBIZenEvJnE206WvQ
	VGR9NUPG1z/IS75SvAu5Feco18JubzRo95N8WuFexGkHU1FuySD4rWaJs5fIFg==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] dt-bindings: arm: qcom: Add Dell Latitude 7455
Date: Sun,  6 Jul 2025 17:50:24 -0300
Message-ID: <20250706205723.9790-4-val@packett.cool>
In-Reply-To: <20250706205723.9790-2-val@packett.cool>
References: <20250706205723.9790-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Document the X1E80100-based Dell Latitude 7455 laptop, codename Thena
(the codename is shared with the near-identical Inspiron 14 Plus 7441).

Signed-off-by: Val Packett <val@packett.cool>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 8e3b804864fa..162f80123cf6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1147,6 +1147,7 @@ properties:
               - asus,vivobook-s15
               - asus,zenbook-a14-ux3407ra
               - dell,inspiron-14-plus-7441
+              - dell,latitude-7455
               - dell,xps13-9345
               - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
-- 
2.49.0


