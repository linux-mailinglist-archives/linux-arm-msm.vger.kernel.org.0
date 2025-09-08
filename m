Return-Path: <linux-arm-msm+bounces-72631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC36B4989B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 20:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C6151778E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 18:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C54931C590;
	Mon,  8 Sep 2025 18:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="eTltx0Oq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748A9315D25
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 18:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757357193; cv=none; b=MzcYsw9B/bhbV3LLiasfz3QiTp6fVOEqTvO/nV4u4m7+hrENhqRlHuop5c1w4tXY+ZI0Vweu3+2hzEuDG7hny7OWGAXSRN75xBvvgM4hLnAlY4D2vU6o+qUbFiBLE+8/PD/onCfSXcIPukKZISHBYIVbH23wuGJj7ZjHerYArRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757357193; c=relaxed/simple;
	bh=P39vg2XAdQ8steucvNdSQvcye0XwMKhs+aAo97jtysQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Esf2M2vQ2SAp3jTcdA8CXyu/TA3xsEW2fMSXEAg2lLBBB30Jh9+Vvddq+7CnO/r6HnRcy8osbX498LXcsPtPdenY3DEOP/MVJFheCPEkxh8+b7Q1N4wjMzvdlLc65Gkqz9G1Go3fWkco9CPM1/FTMxEcW38UpgbHwdZ4osavpFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=eTltx0Oq; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757357189; x=1757616389;
	bh=GY9Sxz62zMnukBkWdZqXs/VySiOKz31Cwyt1ya5PLRU=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=eTltx0OqX1BQ+H4oxbvyk42LX+NzQBt/cvfms6fDWObXU1BbtRcjXDagB2kKx91kT
	 8jXTwleimNftoVnCy4cvKjippQtLvbAj9HF09fnuxaa9Wof5JieHrhmh6vuyo0LQNF
	 xv+XAzm0/simXcbw7Ep6QIih4h2rI/VL2jeJUwA/wQmizpyK4kdAmMMseJg00LrV0e
	 pxvhTeplYOS8Mdg8pjwS6flRYfHxq41ERouSEj+ik5gxDnKUInVE4eZIFkIs7C5480
	 qMa4WLa3j10wRJYMEKeEhYyT2Vte14Q6zoZx8HLazu3DD0K5GIyEkD4SHWu8bDHEh0
	 EZViDTYxAUkyg==
X-Pm-Submission-Id: 4cLGBW4BGZz1DDLC
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Mon, 08 Sep 2025 20:45:45 +0200
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add Asus Zenbook A14 UX3407QA
 LCD/OLED variants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-zenbook-improvements-v1-1-43ecbbf39c60@vinarskis.com>
References: <20250908-zenbook-improvements-v1-0-43ecbbf39c60@vinarskis.com>
In-Reply-To: <20250908-zenbook-improvements-v1-0-43ecbbf39c60@vinarskis.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Aleksandrs Vinarskis <alex@vinarskis.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=P39vg2XAdQ8steucvNdSQvcye0XwMKhs+aAo97jtysQ=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBn7VRrU5iz6JbT1c8kit9lfZssd+yN24vKJmxc4lqjeP
 FQnVCrX31HKwiDGxSArpsjS/edrWteiuWsZrmt8g5nDygQyhIGLUwAmomPHyHD5uPyfpyK2IRPt
 5785lJZj77v6eP7d+ssrgqbNsu688kuA4X+VgmiESMpym23Gqw0i3j8/5/t+8pZddy5b/O05wp0
 oX8AAAA==
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

X1/X1 Plus variant of the said device comes in either FHD+ OLED or FHD+
LCD panel, and shares the same model number UX3407QA. It appears LCD
panel's brightness adjustment is PWM backlight controlled, so a
dedicated device-tree is required. Introduce dedicated compatibles with
fallback to 'asus,zenbook-a14-ux3407qa' as they are otherwise the same.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0110be27c4f6602b25aa4feb742bfe62e4a40d51..06bab89efce6f064882ab6d1f8f441962fe8b7c6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1074,7 +1074,13 @@ properties:
 
       - items:
           - enum:
-              - asus,zenbook-a14-ux3407qa
+              - asus,zenbook-a14-ux3407qa-lcd
+              - asus,zenbook-a14-ux3407qa-oled
+          - const: asus,zenbook-a14-ux3407qa
+          - const: qcom,x1p42100
+
+      - items:
+          - enum:
               - lenovo,thinkbook-16
               - qcom,x1p42100-crd
           - const: qcom,x1p42100

-- 
2.48.1


