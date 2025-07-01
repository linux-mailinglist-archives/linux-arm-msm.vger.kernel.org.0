Return-Path: <linux-arm-msm+bounces-63299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9703DAF06DF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 01:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E672483FC5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 23:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B53E302CB2;
	Tue,  1 Jul 2025 23:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="lcsUy4dr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EE3302CB4
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 23:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751411868; cv=none; b=h8gt1fErQZJUiFPVRMgYhBav+1yjS0TnTKTFJuFeQwKmBmY+GP+tJbMVGbAWikKIFVi+RMnLWNjq62CbU6vDSe/ifd6Go+kI8ESCvD5Jzacu54bC04p3POM96CuHzGX/wVe8OFYRzp5pJ21mx/7o7Jm6TZPa2epEU9ytPlFyT5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751411868; c=relaxed/simple;
	bh=ho2rwTSdEsBwxt3Tg5cPYOoKqzB5TlXOnmxJt71JOnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nqu5JxYvmzgea6VncVN5Ig3seN+BGb7XdMdFpVdoOZZNIWfLsuiuPshVrFtqy8blbxr20h2gnBPA/q+M72sRnMBYSpTZ7GpYgXQoUD2HbZoqeKnEzvsSxUZD6umrHzgrW/CfctK+3p5Pkf38uLB9PA8Z99PLslT6UoyyVu3WTZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=lcsUy4dr; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1751411863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OpPPvZlTf161qo41zEM/rvDpNb0+czAede4+ebWXEe0=;
	b=lcsUy4dr9SPObjwDQnpMF80mcGBqIuTW8634A2S83q6AGoB3AYGBko2PLXTyT5Mr2W1yET
	2MslxRIa8JEAHMeviu+i4Y64c3VhPy8xcjaaiSgAQE9qHfgMy56yd85gxAQJ3JsJq9oheW
	JpRA0DR1jLiEy2gTePz/+c3b+ECY5e9V3BL7YiSvbUxBjDqD8PykaXYYtrnif3tO0wq7Sw
	n93cNYpvpOSDQWvfRB/UB2GoPMJsFMALOvRyeESWOSUXI+JoiR40f+afgLWZYIXoMqr60P
	D5EBkfRj+yTN31NRYx/E8GEHgtdj8zPlBx3UbluJKi+iEN4B5wGX5SseZgj2jw==
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
Subject: [PATCH v2 2/5] dt-bindings: arm: qcom: Add Dell Latitude 7455
Date: Tue,  1 Jul 2025 19:53:25 -0300
Message-ID: <20250701231643.568854-3-val@packett.cool>
In-Reply-To: <20250701231643.568854-1-val@packett.cool>
References: <20250701231643.568854-1-val@packett.cool>
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


