Return-Path: <linux-arm-msm+bounces-47824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F603A3325E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 23:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A98D3A5EF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 22:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68402040B9;
	Wed, 12 Feb 2025 22:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="sDq3ugEd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4305A190470;
	Wed, 12 Feb 2025 22:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739398917; cv=none; b=fBlxn+wN1QD/rRlpcXRITg3P0msy9Y5LRltDHNJgrJlcD0040lwRmD681gIOfn0xlIUmcinCCmGinlBnp2bLYqpG2+/IvTEICtv0IEPIi6iHaTBu0tFq6I88QRoW9ZPcr2gas7AkGX5IIgKf1osw0VbMmd/xlnO0DVoyKtF7c/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739398917; c=relaxed/simple;
	bh=j294DqGnhpCI2lxUxMNWYdYKH1DyoEqwiIg/72rqhqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gqIV2voB3P2tc8//o/oFcYroRwEp3b9e3HHxMZLgCDmA7shc6/xFMDaAMqSeLRwOXQluFMnPef3MJtqvKJ+KQwTlXHexXjmaI9lrmVonOMFZkAY51+wYxdrLSS9DGkS1FLTSl7rVW/7nQ5w6tMz0888WozsF79VhzCqjNQKddrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=sDq3ugEd; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.244.162] (254C23D7.nat.pool.telekom.hu [37.76.35.215])
	by mail.mainlining.org (Postfix) with ESMTPSA id 8C39BBB839;
	Wed, 12 Feb 2025 22:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739398914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7t7XBzI8xXeKZPV2DYAX3FFMAq81xem9XsIZceE0/s=;
	b=sDq3ugEdySoljbPby/PsKGj2qIwPvaNsEFym3gSBYGkGxIPVbhFlmujRlXx+FBM+m/TReA
	Atv4s9cHkv4hyHBmWqUFTj3XlI+yR2Ry2b1eGM8DC53hCKsdwfdPieLzFoHTivg+wqtVeH
	Z8XXWnnU1peD9CyzxeVAGHNymqG5DhgWvjHZSgHBUVBZak421Pl8uczhN6hINFthILq0rw
	5FBaQ2a1YBKpljyKk93GiT3Y0k/EisTboe5VJBUTN2VZknigjkEVKeQ9d6yRWh5yYoSXuw
	8HzQNb9X97+Dk4Y25vltqdDJokDeP4lwOyq5inibhwN0zRLihDp2HuP1E8F8gw==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 12 Feb 2025 23:21:50 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: pm8937: Add LPG PWM driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250212-pm8937-pwm-v1-1-a900a779b4ad@mainlining.org>
References: <20250212-pm8937-pwm-v1-0-a900a779b4ad@mainlining.org>
In-Reply-To: <20250212-pm8937-pwm-v1-0-a900a779b4ad@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739398912; l=891;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=JBZJDsXcieZryM7YOgR6NPwdi8HLWAKAuGLhKRf00+c=;
 b=xd9kRVFWT4HKCVzKaZJZtsfnijI3CAOqfzZls+oU1OHZitSYoO5yfv8XY6ub/Lnc134s03suu
 3i81xNHLpRKBAtoktT8xWvWyezuFSWWEs1yX5xs+N0xLxI3vxydE+8q
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Daniil Titov <daniilt971@gmail.com>

Add PWM/LPG node to the PM8937 dtsi so devices
which use this block can enable them.

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/pm8937.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8937.dtsi b/arch/arm64/boot/dts/qcom/pm8937.dtsi
index 42b3575b36ff4d37df11ccb5ed68e965e3716300..d13f39d81386b9493e33411e7fa0fb69e94644f4 100644
--- a/arch/arm64/boot/dts/qcom/pm8937.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8937.dtsi
@@ -143,6 +143,14 @@ pmic@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8937_pwm: pwm {
+			compatible = "qcom,pm8916-pwm";
+
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
+
 		pm8937_spmi_regulators: regulators {
 			compatible = "qcom,pm8937-regulators";
 		};

-- 
2.48.1


