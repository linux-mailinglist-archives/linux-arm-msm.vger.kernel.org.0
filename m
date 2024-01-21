Return-Path: <linux-arm-msm+bounces-7704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F6383583E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jan 2024 23:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38CD71F2195D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jan 2024 22:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F396E383A7;
	Sun, 21 Jan 2024 22:33:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6533539843
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jan 2024 22:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705876424; cv=none; b=KUTym9rSvzApFdSpJatRlhHg7JL0CvWyih4I6qGeMFkjxNufyKdJlTU9GE4IbahGmpu+G8qyHwNS4bUoMn0NNk4EYy46ksDt4Um/m/gJiALh5mkt4GF4ZiUqiid97mg8BH8lyJLBP2KQ8advgD6hJD3hQFu31tKhvGDR64W9Sik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705876424; c=relaxed/simple;
	bh=RvaElXuVtRhvPwJGK8Oks7pSDH9b73Y6G9Dj7yXJywI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KtF1l83XLzOL79Aj4eg6f2ZT41VLQbGgCxvLuFTHcgZULujMk4S94HfJ5YiLJnNrfImj2ue3LrzkuP69gE9XSRzbhWu0Q0hcab4ws1F5296e0RsEgEBryOL6D0F75MMaIT8xIuHyReFcScfxF72dXUyHL5WU+xaJdV8Q0gIuGmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from Marijn-Arch-PC.localdomain (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E24AD20375;
	Sun, 21 Jan 2024 23:33:40 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 21 Jan 2024 23:33:39 +0100
Subject: [PATCH v2 2/6] arm64: dts: qcom: msm8956-loire: Add usb vbus and
 id extcons to ci-hdrc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240121-msm8976-dt-v2-2-7b186a02dc72@somainline.org>
References: <20240121-msm8976-dt-v2-0-7b186a02dc72@somainline.org>
In-Reply-To: <20240121-msm8976-dt-v2-0-7b186a02dc72@somainline.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Luca Weiss <luca@z3ntu.xyz>, Adam Skladowski <a39.skl@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
X-Mailer: b4 0.12.4

ci-hdrc does not have the ability to detect voltage presence (5V vbus)
on the USB connector nor the role (via an ID sensing pin), and relies on
the PMIC-side charger to provide such information through an extcon
driver.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
index 085d79542e1b..a82b58cdd99c 100644
--- a/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
@@ -76,6 +76,8 @@ &gcc {
 };
 
 &otg {
+	extcon = <&pmi8950_usb_vbus>, <&pmi8950_usb_id>;
+
 	status = "okay";
 };
 

-- 
2.43.0


