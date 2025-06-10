Return-Path: <linux-arm-msm+bounces-60845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 943A5AD3FF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A88C1BA087B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 17:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC8A244690;
	Tue, 10 Jun 2025 17:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="iKJyP2p3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F7E23504C;
	Tue, 10 Jun 2025 17:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749575047; cv=none; b=JHP3hwkrI8rDTKE/t+IkAu5TYSoFEDfzqitInIJEdqn1MPD2TeLfibtKGXM+pQsTmRYntADJ/BVSZ4u/rYLjb6Wu1QU6UfsgLeL5YF56gTG+DhVxZeTji7mft8Mys+H5TMx5uMAPTdI1/mGuF4hTCkWHocyU5qEp7be+nYECb6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749575047; c=relaxed/simple;
	bh=X23LNEz+995lYaik4bicH+kv4JF6uP+tlT2157/WUBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sr6iLw1mrB/4cV4xAi4Se+6n77nGdGHHZwHyN8rd98UUHwGEzocupbKvKpxq3Gjn+HdQrinUwzqSDMLFQnklllZeOQBuUTd20JoS+lUJq7uhkUuE5nC75jlBfH5t1ZjVmR0x5N+s00MNRQX8QPRVmDyHZH7mLw19QdT4UsHBP20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=iKJyP2p3; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1749575043; bh=X23LNEz+995lYaik4bicH+kv4JF6uP+tlT2157/WUBs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iKJyP2p3s+Fn98iN4oyHX9lBy6wH+YR2J26ZYthwCOzYsXA6fnzG4az5wGGusxgGr
	 JVE17UauppBqfsIqJQ793l5bQ5prFxBvVDkFjYSaqEwvfwkoFGWMY9oFeeZZxUJNmm
	 Hj9XWPvpuftvjtF5IxicCoFh8XC6Fbdo9aNIOhHk=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 10 Jun 2025 19:03:49 +0200
Subject: [PATCH v2 1/3] ARM: dts: qcom: msm8974-oneplus-bacon: Add alias
 for mmc0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-msm8974-mmc-alias-v2-1-1d8808478fba@lucaweiss.eu>
References: <20250610-msm8974-mmc-alias-v2-0-1d8808478fba@lucaweiss.eu>
In-Reply-To: <20250610-msm8974-mmc-alias-v2-0-1d8808478fba@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=852; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=X23LNEz+995lYaik4bicH+kv4JF6uP+tlT2157/WUBs=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSGV/yy2xDcPLV8EZThxhfNZGBaDVFzv0puPXF
 9WPLugwgwWJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEhlfwAKCRBy2EO4nU3X
 VqDRD/wNYQcRF8whM2qI9XwmH0IUKsfzJXA5kvDo6MENpPj+qs1SiOVe59BaPgNv0G5BoDpAMn4
 AVR2YVftK9Qb4GxvjONBZktopQHqK9COGaZ58Kus67bz7ldmSrXj9c3gUy9xQtuyPByG9Li+sge
 4wk7BhEXWXoK81HydKq0bq1rwgy9zHC5XY0zrZy27aMA6XyCweFwwwb29tQf+yOyb5Pf4QT0gwO
 q8p8ikE8KFX5k6Iz/Y4VOTFnvWVdrwJ6i2Jp9kTNOwYB6PdJxGB3mA0H0ZrsN0gJ30KiVMz4JIg
 hbOoZQ/6GJZy6NxmfZvNqIvNUroI04TS844IUSoQ154XthVpmFpM0G5DmrJUmgs/CQO9IfGNUCo
 pqHgvdIGM5VDl/5JssLW9l5IXTgqwSEAqGQpEsKGE066AmnCNsB6ezizuhgZcoBdjLarshr04x1
 4p63yW+yloc380gOHuMZ5aTVevVCtgczYravFXzh61//EY2+3fJqrb/hWxvxcyeT010onsAGleO
 na9a1/bDCfeAZK0y0x0hWN7LNkujcqlsUUgFhvGVvh2LwSVKNdHdHs9VgZ23ia5U9mQ5BOgeuQ7
 87DAURL1qo/T7rH+xuQtpVLzBSwF1QZF0wjcS+4OrS+rOLc/T8k7PUOYzSquC4wex4cXigfinP1
 RzrsBtMaOEY6KmA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add an alias for the internal storage so it always becomes mmcblk0.

This avoids issues with internal storage becoming mmcblk1 unexpectedly
and aligns this board with other boards that use MMC storage.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
index 4c8edadea0ac63db668dbd666fbb8d92e23232b7..88ff6535477bffefe475cc5fe927b3cc5d223084 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
@@ -13,6 +13,7 @@ / {
 	qcom,board-id = <8 0>;
 
 	aliases {
+		mmc0 = &sdhc_1;
 		serial0 = &blsp1_uart2;
 	};
 

-- 
2.49.0


