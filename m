Return-Path: <linux-arm-msm+bounces-54794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFAEA9426D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 11:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCBE18A632F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 09:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F561C84C7;
	Sat, 19 Apr 2025 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="oHT6XIUW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE541BFE00;
	Sat, 19 Apr 2025 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745053262; cv=none; b=nLAjwmXZ3JAsX8jX7bIaqJ3fTWpfUkLNAuSj3H2khXDUh06OC4eXvnWtFIrOxXr+n4tdoAS7V4Ztqzk3HjqfqN3xeUjlJRXFOfrtywE4fFbxfGuFAj/eEfvEjGWopzM1KPkY7jCYllYYkZUJBDvcnRD+dZ2NEjUecqd4SeZdAGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745053262; c=relaxed/simple;
	bh=rmgJm/JsERPy/3TdFszDhxywwL/IurERnhLfOReUByg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iWRXBRpihH/jeJymKJFzdG37EoPOK33oI26ZF9qz+lmchUc4d17B75ZVu/iU2ry7eaOwMhya8oHoCwGhp8Dqf3NNMgKAbkYoMgnbFxkOo7h9Ni+8TEr52rot3vJHJjbPqN642Gpkttt0adG6Sg9/ZKOBOrl02w8dXftfVja2xyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=oHT6XIUW; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1745053253; bh=rmgJm/JsERPy/3TdFszDhxywwL/IurERnhLfOReUByg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oHT6XIUWQPUff9UekeFFLnLa/LhBGTyDt4SsKctpv715qw4yd1kFkrPe7bHAwKR0m
	 fw9PrVpl4c1giqRIsURPGaAqNHg52G0u8yJD0raFXdWNWIT1EmlOnsN0Vu+fEdxvnk
	 RCxyA0Guc7hoV3g2sNCXiheTSXhH8tXoJrBwQ24I=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 19 Apr 2025 11:00:40 +0200
Subject: [PATCH 3/4] dt-bindings: arm: qcom: Add Sony Xperia Z Ultra
 (togari)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250419-togari-v1-3-45840c677364@lucaweiss.eu>
References: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
In-Reply-To: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Widjaja <kevin.widjaja21@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=788; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=3pYZLD6BRjR4THekXqYU3cNCBio85/oAmVd32raWyRk=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBoA2Y9S3lMNBjMXo7l4VQLIDso5rLhDFnSFqojD
 aUhOwYuRIuJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaANmPQAKCRBy2EO4nU3X
 VqOQEACUawpzrjJkF8ReMQr19bwfeatd2JZ9VYiRWBVhHarh40sU3p4uBgffY9K/9I0UfDb/qWu
 5jesz9JHUBAVy144lgwcNUbeOy0xsgryWg4OHLB6buQlFj+dJw0PSQadYE8Mcd39t2B/LfTFpId
 LVT6ihVIYvo4ScWLgR2FZb+LO5UaJaOPCJoinP9gacsNWo3Peuu6ul2kuJMCIpwuuGmnOHvrNfE
 xLlmZjAnu1OJE4Y0KJcb+92Hn1lxkkglYMH0C5Zjtjp66qS3PFLLIcN5EQGfJy2q/jYb7vq0p1Q
 DvLOIF2PnF6M/C00ULR+GyPNwAgB2iLR50S6R+vonZdGLUKb0kn8NjPPghl6chz1YDmvScSujP/
 /ictp+srLbZVv4zwI3ri5NrRWUHOWG0rRu0Ho5WcF0dBH9Ey5rM4FcfQGysbT7BxNNiN/Wpaey1
 cGFP7OcrxsZxwFYsk3Q/KSGc3eg4RLmkj0xHTCiuBkmN4osXizE1fs/cZ+tb45tIAmJyGMIjVy6
 RpIofsDjpGPCzNa29xYgAGD2ChopQ6f04z1k/6qdAAAW4fRVHb/RTof8uBWbTyLdCmHxLzAuwMz
 OjP9QcaVdGkm11WPhyrku1ZxWfi+3YAnYJqsQeoEPGzCSHeuZGHZ+FgptFc/HNEryRM5GB699nj
 34S85uH1j12Q78Q==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Kevin Widjaja <kevin.widjaja21@gmail.com>

Based on the msm8974.

Signed-off-by: Kevin Widjaja <kevin.widjaja21@gmail.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 618a87693ac1dc32b40a2201bc219a4f12e9f3e8..8b355fdc56ea3581540e60c5b9b7a9687439da55 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -208,6 +208,7 @@ properties:
               - samsung,hlte
               - sony,xperia-amami
               - sony,xperia-honami
+              - sony,xperia-togari
           - const: qcom,msm8974
 
       - items:

-- 
2.49.0


