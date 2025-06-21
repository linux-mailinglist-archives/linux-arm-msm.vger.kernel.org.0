Return-Path: <linux-arm-msm+bounces-61935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69054AE2910
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 15:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 205891890F1F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 13:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448EA1FFC7E;
	Sat, 21 Jun 2025 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="V7ZiQaxX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824DF1E50B;
	Sat, 21 Jun 2025 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750512102; cv=none; b=sjEMIpC9ZsPbUbDE69GhwkQngHFX6cuRAWGKCfHzRnajzJzTz2I1JBgkuoEM6NyLH6HdVyafL1yNEZFBqIMH/a/OdDIQ/gSHIJXJ1iDlAgcnTXDtXE6yMTRgDuZZBc4IEzDHinJhb9q0gydNbG8/li/kQFC4pLFfVR9Sr+LAMA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750512102; c=relaxed/simple;
	bh=V2x/R0ucwIeM0YoOvy23vOAkiVTYF1VFbzHFPyrDyZo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=baKyZqf6Ef1aFN88nAwbVIxr/2PIdJjxX+26UdyltGiZcVSYmdE4lMUQmX67H9BBc6VmcrtSYBR1m52093IUZXfZKhefZjwAkzyq5x+8COriOTVEzahjV2vwKpD0S3NRW2GQAxHEfrCGrs4v3fzRydowdn1f9iNaymspBUfel8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=V7ZiQaxX; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1750512098; bh=V2x/R0ucwIeM0YoOvy23vOAkiVTYF1VFbzHFPyrDyZo=;
	h=From:Subject:Date:To:Cc;
	b=V7ZiQaxXO5+LA5e8uJmK3fp6AAU/Lj4WRB7ml5JkMmuA0uCk5aLWiBAbM9BQbro43
	 d4ID3KgUfigakE5psM+CrxHYtFEPmVTmHfJwXmK1x5WxT3bXNlFApncOZb+XUUlwa7
	 8/4E3x1pHV0TeAUwUSeBHwG/Hf0HRnJ0rJn7pv1c=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH 0/4] Start using rpmpd for power domains on MSM8974
Date: Sat, 21 Jun 2025 15:19:55 +0200
Message-Id: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHuxVmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyND3dziXAtLcxPdooLcghTd4vLMkuQM3SRDyyRDM7NkA6OkVCWg1oK
 i1LTMCrCx0bG1tQAz17vZZgAAAA==
X-Change-ID: 20250621-msm8974-rpmpd-switch-b19b166c02be
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1809; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=V2x/R0ucwIeM0YoOvy23vOAkiVTYF1VFbzHFPyrDyZo=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoVrHMXM36xKZBKcuU6bIlBpurDp8qkSuyquYa6
 wj6pojTBIaJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaFaxzAAKCRBy2EO4nU3X
 VntjD/4y5L3n4yByAp9m5xjR4reEEEvn3PVyT5Od4l1sAYNtmfZkVCCxDn1jfxpnmMCwJM+ptLK
 R7snmR+/QE6yjzhlp0Qmmtbh8aiCgdsNcXC5CCXpZZDaDggtfNJn8M/ccddMjZKs87nIvh+E8Xe
 taXMTnrRPUIgBVZT9NgFKJlPZ5+QUu5lVdWsM+Shnb/36+NzmWWQYza5OSjA3xAa/FsBNAQbDoV
 h5suTl847vLYbhjMQD/CgmNq3V3q+f1nvVZZDdaNrFCwjeRNzWaVom3L6urIFUJfOFWvcUsjI2J
 4bqqnihxBxkgEQ4maGyCnJBpOWpTywjx4OzdzATKs+8Dvlv2+/W8PDUk//xKBX8JEx7A6KNWPd4
 scqj6nZiJPZUqJFM5NIR9H2gCuB4sOGaD0G/vVutPscS5cmuL7VMMQfc1/ftiPXvwzCMn5iTRWO
 Tk+mD7+L6NvVbQxfawARJoInQdqkS4Bb5pOGM88XtaRLH+wHWe5FGOuAkWdMF1/BL4W32Vpo69u
 aYtIrHeu/fVGQU8rJH7AQW5RNNgGsm1J2gWlbhJhhwjSEFwkUZ2elfJeesCnn198RyMsSKOqyBa
 KGgbco91zVv29ufBgWr1EytdH4cjAzkoI1RZWy3Hw6SmFJmGz/ToR7yRXajQeTRGbNd3mCLaDtp
 PR7LgFsHdGdeK3A==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Switch over the ADSP PIL to use power-domains instead of a regulator,
and have one commit switching over the MSM8974 SoC plus all the devices
to use power-domains.

Note, that I'm aware that these changes are not backwards compatible and
not really bisectable, but since it only affects the ADSP on these
pretty old boards, I say it's fine to have this. Get all the patches
into the same release (6.17?) and then we're good again.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Luca Weiss (4):
      dt-bindings: remoteproc: qcom,adsp: Make msm8974 use CX as power domain
      remoteproc: qcom_q6v5_pas: Use resource with CX PD for MSM8974
      ARM: dts: qcom: msm8974: Sort header includes alphabetically
      ARM: dts: qcom: msm8974: Start using rpmpd for power domains

 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 18 ++------
 .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 13 ------
 .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    | 12 ------
 .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 12 ------
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi   | 12 ------
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           | 50 ++++++++++++++++++++--
 .../dts/qcom/qcom-msm8974pro-fairphone-fp2.dts     |  8 ----
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts  | 11 -----
 .../dts/qcom/qcom-msm8974pro-oneplus-bacon.dts     |  9 ----
 .../qcom/qcom-msm8974pro-samsung-klte-common.dtsi  | 11 ++---
 ...qcom-msm8974pro-sony-xperia-shinano-common.dtsi | 12 ------
 drivers/remoteproc/qcom_q6v5_pas.c                 |  2 +-
 12 files changed, 56 insertions(+), 114 deletions(-)
---
base-commit: 7fa2fb97cd28e1d9670da538095565b6fba83977
change-id: 20250621-msm8974-rpmpd-switch-b19b166c02be

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


