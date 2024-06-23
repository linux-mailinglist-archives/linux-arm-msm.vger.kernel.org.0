Return-Path: <linux-arm-msm+bounces-23749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 795D8913953
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 11:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC3BB1C20C51
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 09:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0858B84DF1;
	Sun, 23 Jun 2024 09:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="NU8HclyY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28C541C62;
	Sun, 23 Jun 2024 09:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719135754; cv=none; b=XANzG/mZPjcYNsV0y2hiJkHT98U8JrCHQJQnqWFZJCiS+m6n6ouk6OyXAfaW3u9FRXqDsCKKm+tcdt8/vnzu03ukKoRYdv9k3wNPqiXELPyiHQeEwiu/GxF4/lyHfuCv1R0pVox0y/knUDU4jbf3T8lp5aXnX1JVrOb2sztuLLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719135754; c=relaxed/simple;
	bh=kMHAFNzZqZh9Q1clq8/o2HRccHAemi297IQK5rUjGRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kWbI2Rqoqfng6AnL719lFiQhddAow78wefH77rTWb2Zr5xXH5glwsbePwXpPdujF4r8vS/omqKwNIn+qK12EiaGYsMrYgdle0YTP29r5gl7oxKDhWUiykFdHrDdgHR7MVVAyBKwyZJTfwggkEQiWYCWg/BHSTgVUJDdEOgDShD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=NU8HclyY; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 132F441D69;
	Sun, 23 Jun 2024 14:27:09 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1719134829; bh=kMHAFNzZqZh9Q1clq8/o2HRccHAemi297IQK5rUjGRc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NU8HclyY1Un6jLj9W0NFivXOb5qpnxvC+Wa5nMmWpT4bT+HFzaaTxp2cc8j8A7dLu
	 rtLJn2D2Zk47SdQUuJSDbAY/YsFzanws+Ar+8P51wisCzQXPDohjUhKJiOyCO1oH/1
	 oxJdGxMsRfj6MLJqo3lvVjZnb5E+1RKQCo5gy/euxZE0LTHYv4OE2WmHYuHdYrzR7G
	 8O7tTL7J6MCS+9u0C3OE1nPvEG2cbyDiLAh2DG2dlhAoxMUXIvkXHSIORiNqFRpM2I
	 RkTfE4ZeYTazYp1eOZYkF/Le7eeO8klfwEFf++SKM5irlwQOO11USbQEmOhyW4KbHz
	 r+jUdL3HgMAAw==
From: Nikita Travkin <nikita@trvn.ru>
Date: Sun, 23 Jun 2024 14:26:30 +0500
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add msm8916 based LG devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-msm8916-lg-initial-v1-1-6fbcf714d69b@trvn.ru>
References: <20240623-msm8916-lg-initial-v1-0-6fbcf714d69b@trvn.ru>
In-Reply-To: <20240623-msm8916-lg-initial-v1-0-6fbcf714d69b@trvn.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=761; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=kMHAFNzZqZh9Q1clq8/o2HRccHAemi297IQK5rUjGRc=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBmd+pp72WXnpJ0CjGeCTIQifwhW4wkbAjDVzZd0
 O/ixggS7KKJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZnfqaQAKCRBDHOzuKBm/
 ddHoEACip0ZHZZoBNOcwgpb6XkTpaWedqCiUISNZU8d254G5DNZjYl8/fLKRzBhsZI2ebiNlijx
 zvFgQHIWg+mZNDXyUzwkITIPX6XSZsIE0Z033VzKioN1sZAuJoC4IGvSccYmg33tIWq4cUoUlts
 D2q6bj2OL28u2yv9dgE7Y0Es0l4jT9llVhGCnWprmlrLTcjZgjCvJjdw45QfX6KtOcygulGzTZV
 JRtKAUu6KXLADGJkV9Ti3C3SEx/Q+7rqJb3dtodUrf8y34O58rvNk0hIZIlCzcU/VLq94YV+IDA
 wT4QvZy71yPVFlR9Z6XmPqywvsYKxWYVGrskls1OTtQgYi3Vquz8x9B+aFOe1EWOJFIztUyWrAx
 cGfigN2ZwL4ODYaAdMTL9BIKhF7qZll8zJw2XBxYmSVHjVBT54g7ZVHRr73EpIYlkclvWONu2xR
 +RkLDWJW30qgQ2eD1IBzn41GJq6aYW0eciBuSFrPrAuXwgJtScF//h8y4wTvIupRy3LYmPAHcL9
 gc0iWCsncnj/PFVkoopgA+gfgNjozK4eyNjD2AdfoN185brXgyj06vCFZk10VcOcdLOZGiDIFaG
 2z1P0oz6iudowhIMBzYLHCoNnjnzUZfiIgti19B9Sr2m8eSuJ7A2muyBcb5PCnaXUoWvUBxntvR
 xumk9nN+THbeZBA==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

Add compatible values for the msm8916 based LG smartphones.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d839691a900c..09edce29ff3a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -208,6 +208,8 @@ properties:
               - asus,z00l
               - gplus,fl8005a
               - huawei,g7
+              - lg,c50
+              - lg,m216
               - longcheer,l8910
               - longcheer,l8150
               - motorola,harpia

-- 
2.45.2


