Return-Path: <linux-arm-msm+bounces-54832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83667A94B57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 05:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A9697A64B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 03:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4A0256C7B;
	Mon, 21 Apr 2025 03:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ZhqEXXby"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65591BA42;
	Mon, 21 Apr 2025 03:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745204970; cv=none; b=KtTRCj1t3uQdBGNee4a4wzclqtQZiky0m+Hwy8KqlxYGRHJvZFFxqHy5smeoYHiiRYF1vAlvMHDf2ea2irAA5WQd/sdfmz03ndoM6Y0j8sWZ98xanheGiKUppI0aLOQprEbWQrZ453yy2vfZ4T4uzTC1vuHqrtvipe48Rz5/17A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745204970; c=relaxed/simple;
	bh=udvxFOdL1d8Pc5hkXWwwmhNUJU7Z9gB45D344Dqsgnc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kQ2QvI7szoEdlYho1WlzDD04cB9uvtnFZyiJTaCRPYYdYYENgyeCABkCadRzkTBQ/z7m0wLIM8MDwOAXP/DAN5LXiduXXe7H96nitoONEKC5Ag5XNhzom6mxbsziSEUii77qumTT4R6aoFLYzXY61KxsEWzUtj72TMoAuDYMYzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ZhqEXXby; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.183.162] (254C255A.nat.pool.telekom.hu [37.76.37.90])
	by mail.mainlining.org (Postfix) with ESMTPSA id C66E2BBAD3;
	Mon, 21 Apr 2025 03:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1745204966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=upc2Z9fNOesc767S0bVo32jvZMookaLGNX2YH6V7peE=;
	b=ZhqEXXbyiKMc568CgSt9qOAEbmV1gJxaCuiqa9Jk+6EdjHnquXp4+/2XSMjkjRwy33XJ2u
	JcF/0mOp1vM2nVQYlZJS3CfkDYhV5Eaj/xNHeyjjPXGiTRMy9Ht3ZkHBASXiVghJNEkQiG
	3IgqWbtnThvpGNGCJqx7LvAFKMpM6IJbPsk5UL5VCMwh00Ocg3eJCpai6cnLeMULDD1ITc
	btBiPL9Dkc6JJflNiyEUSC1sCxmLaNnGwXS+Ij0DxUVhzxZQKSqHh9q4sXH/lQGYnkiZKd
	GsfBCaL62i12flaTQxEcnMHyzuqfNFObid1HuuW0Oo0Bg6FRUcj7WkSb9NubxA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/3] Document clocks of Adreno 505/506/510
Date: Mon, 21 Apr 2025 05:09:20 +0200
Message-Id: <20250421-a5xx-schema-v1-0-7d96b889322a@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOC2BWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyND3UTTigrd4uSM1NxE3UTLJDMTy6RkixTTVCWgjoKi1LTMCrBp0bG
 1tQDv0iQJXQAAAA==
X-Change-ID: 20250421-a5xx-schema-a9b649bc8d5e
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745204964; l=835;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=udvxFOdL1d8Pc5hkXWwwmhNUJU7Z9gB45D344Dqsgnc=;
 b=XQxscjx86DEwyCIYjFi0UMlJYf0J5p1deNHt1PhSjkWian1grQ0/X8Y+zsx5bySwCVGH+QtFS
 2TaSeA8qtV5A4E47uFPxz2Z8qm7OkXXOYdaQelGORsHYaG5nYMdpz/x
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

This patch set documents Adreno 505/506/510 clocks
with the missing alwayson clock and enforce their order.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Barnabás Czémán (3):
      dt-bindings: display/msm/gpu: Document clocks of Adreno 505/506/510
      arm64: dts: qcom: msm8953: sort adreno clocks
      arm64: dts: qcom: msm8976: sort adreno clocks

 .../devicetree/bindings/display/msm/gpu.yaml       | 83 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/msm8953.dtsi              | 16 ++---
 arch/arm64/boot/dts/qcom/msm8976.dtsi              | 12 ++--
 3 files changed, 96 insertions(+), 15 deletions(-)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250421-a5xx-schema-a9b649bc8d5e

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


