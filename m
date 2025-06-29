Return-Path: <linux-arm-msm+bounces-62925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 943C0AECB44
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 06:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8ED57A62B2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 04:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAC01AF0CE;
	Sun, 29 Jun 2025 04:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qpMEj0cM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C4F175D53;
	Sun, 29 Jun 2025 04:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751172311; cv=none; b=tmbpfbI8VyRn8GRm/mRgIPMuRCqM44dXVNgkU+7LVoMqO9X8XYMtL0Db/XgqFwEVHkUEUBaiuZF43NG78kthTa9nENYYnBg9WE9WIjP/VUPzuz7tZHWgiqI0l2hBjSkcSHhi7bZ/EzLNgoqearNcYq0xs1LZB1SJMmHGd7xxaz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751172311; c=relaxed/simple;
	bh=IT9CfwXtx+8CDN35iEzS9Tir4HmMJGHSAmGC+WIZImU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZJToYwepEY1F7W7UuUMDU3Af6Q5UrFyI4GCyFoGzJtW+97aGZHlji1oKlM5m64EkztsVms1EMECvCXUG2hR1m/wHaXJFsATOtMot1cL9wn/vh0c8n9mpTaj8AMzA04rArGSzcaR/7FtH74sASqadiBUvcj+e8yHV91dYaTibYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qpMEj0cM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90564C4CEF1;
	Sun, 29 Jun 2025 04:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751172310;
	bh=IT9CfwXtx+8CDN35iEzS9Tir4HmMJGHSAmGC+WIZImU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qpMEj0cME3vE540/OPcnYBIAxkc9unVUl/aY9HjPSbD2+FQS6A60CY0aCVkSIXTcd
	 u+KdPnQkP0I+pKExFCpQP2vPXgTkzZ5GA3vP4U4m/FZBGc0lZ4/9NYN3SLuPaLGWri
	 KrijPZyyNVaUsatNsA23x9kRCATi97P3VgIogHaedhHVPPk5mmsLKUrwO7dcXNrDwC
	 fDSPuc4vgNdi73frYZfoYJPwxxDXM1T/dagkgVjlV4+u9zEZmXhWigg+sm4C4g4PYD
	 a7jYoPAwghDjsHNMY1OA9A7/wL9bx4Z9iNhGkeKhS1CIYetTlthSIP6Z0Wdqyl1Zkl
	 X61fn5IlmWNDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A2EC83028;
	Sun, 29 Jun 2025 04:45:10 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Sun, 29 Jun 2025 08:44:38 +0200
Subject: [PATCH v4 2/3] dt-bindings: arm: qcom: Add Billion Capture+
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250629-rimob-initial-devicetree-v4-2-7cf84fa142af@protonmail.com>
References: <20250629-rimob-initial-devicetree-v4-0-7cf84fa142af@protonmail.com>
In-Reply-To: <20250629-rimob-initial-devicetree-v4-0-7cf84fa142af@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751179514; l=840;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=K11gJ9Fb8+1ali2kCYD7nje9AvLP+FV8erJhSLF+Ad4=;
 b=6RE72DMhlFNyCnvQRvcqEh0x02rETYonXlxIFdXAiMpdNljZJ9dz9R+0jZj9OnlpmukwhkKet
 oEekHizEV3JCAdyXJ4UF7iCPdxB0DT7Oa1s13AHLk5b2jqNT+4rG0Mk
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Billion Capture+ (flipkart,rimob) is a smartphone based on Qualcomm
Snapdragon 625 (MSM8953).

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 618a87693ac1dc32b40a2201bc219a4f12e9f3e8..dbe605557af82c2382702011276e920ea18d3bb8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -274,6 +274,7 @@ properties:
 
       - items:
           - enum:
+              - flipkart,rimob
               - motorola,potter
               - xiaomi,daisy
               - xiaomi,mido

-- 
2.49.0



