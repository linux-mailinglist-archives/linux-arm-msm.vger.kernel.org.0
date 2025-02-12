Return-Path: <linux-arm-msm+bounces-47823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD09A3325A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 23:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 359811656F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 22:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A35A202F99;
	Wed, 12 Feb 2025 22:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="SF0lQLgm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44014202C50;
	Wed, 12 Feb 2025 22:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739398917; cv=none; b=ZVIEL8f2EFGbV3C59fLXBF7vV8bBUibm+PF8lbKUgNwmEXx9s6QLXWyH0hkfmk8Esz9oQnJo1o0oYts3LMFP1L8jeYybbhb+jS6g08QNFW3yt4YCdtz18AWpcP7/NEmaCKrkCLRyneNdoCoHEBEYTixdgo2uyAUlqcuhVEQsv/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739398917; c=relaxed/simple;
	bh=i2OGihpJamb5Ze1A2KCCF0RU0wjYweR5igk8QqL5ePs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f9+/BFoVzUCFl7MV3FWUMnZPQmjRD2llfsVG4lgixfwWpVQO8loj7QYVzGdST4bFdApefVaBY4/d/bWqp4y3KuOyjDzMmlMEzEi+as2YviEaJmnK3hEum46eoT+OxN6ZGshU2sXwn9hFPSzRdcTssHJBfC3r0Hh95bt3lTQztEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=SF0lQLgm; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.244.162] (254C23D7.nat.pool.telekom.hu [37.76.35.215])
	by mail.mainlining.org (Postfix) with ESMTPSA id C077FBB835;
	Wed, 12 Feb 2025 22:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739398913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VWSemqDUSfRTZ8V+V+t/16NhqpZznUveAlCCe6GEahc=;
	b=SF0lQLgmjVuB130rl+g0X1hKTto+vj7GY5vuochEFXJ5abb/Q46s1UnVVqqnIK1dfaQH9O
	AsK4sJb26gS8LiIWs55E7GOOYuOG4KKtsOqmGKGJfOu3pIB30T+La6rlnzhq6W/P8Mnyqw
	bXnjAh6S4F0HQaOKLLDlAWL40UzQgsDtSvQj4fPmP5zwNOgO+eJcnpcnUhbRxeJL0LBZ08
	XeivGKG1DSHInbBsFzYXriD93h36+6PjUTKheiVgrlDktQT0x+W8UTk9fnFDym5VT0DbWr
	NSgjl7r0cQP4Depp0UXPkG2Ym1RSO9zPwjQ/CHtRwSDdWHFSrQgpT5OrMjXM8w==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/2] Add PM8937 PWM and display backlight for Redmi 5A
Date: Wed, 12 Feb 2025 23:21:49 +0100
Message-Id: <20250212-pm8937-pwm-v1-0-a900a779b4ad@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAP4erWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0Mj3YJcC0tjc92C8lxdgzTjpMRUk+QUIwNzJaCGgqLUtMwKsGHRsbW
 1AOTbVLBcAAAA
X-Change-ID: 20250212-pm8937-pwm-0f3bae4cd207
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739398912; l=689;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=i2OGihpJamb5Ze1A2KCCF0RU0wjYweR5igk8QqL5ePs=;
 b=JN7dfQEOjiOBy1Uu+F5bbRKg+OQySw8iFOALYjKnUKopzkN0exYdyhglQurvd5oSTUH4D0EuM
 xszmPjKyZFLDbHPEIF5Lf9kal7z23X7T1NJ3RmMM2V3citveKlwLCZ9
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

This patch series add pwm node for pm8937 and enables
pwm backlight for Redmi 5A.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Barnabás Czémán (1):
      arm64: dts: qcom: msm8917-xiaomi-riva: Add display backlight

Daniil Titov (1):
      arm64: dts: qcom: pm8937: Add LPG PWM driver

 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 25 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8937.dtsi             |  8 ++++++++
 2 files changed, 33 insertions(+)
---
base-commit: c674aa7c289e51659e40dda0f954886ef7f80042
change-id: 20250212-pm8937-pwm-0f3bae4cd207

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


