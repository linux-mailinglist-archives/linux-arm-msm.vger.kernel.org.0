Return-Path: <linux-arm-msm+bounces-18487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9C88B115C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 19:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7838628960F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 17:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7112B16D4E4;
	Wed, 24 Apr 2024 17:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ansari.sh header.i=@ansari.sh header.b="MwWXAVeG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EA916D4D3
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 17:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713980584; cv=none; b=QSYHwXMT5j1pszgOvQKjO0lkfOcMyT/KjJe62ao7jwY01JGB0ko6UcKIxvkAEmHoe7uBMLcL0ajxIny+4DHGor2tXxAdIPPvtl6O/C8aJ33J4RtiCNeNg/mn8P3pOzXkbhrPpohmi1DRUxumzKZiBSCqrpdYajK8DDOI7/qyziY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713980584; c=relaxed/simple;
	bh=Btuuide6blNMxT4spQm5WVAaE9Pr2p15ET0Ssyg2jss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N/g2022dus1VDpP9L4vWMyxiWvS7VA3cwzAYCR+PDE35o0eQpRQTbChcrFyBjOjSq0N6ccrgPY7B09B/RH0Enbq0Qw3LQdn1Zxvp48xOqg3hu2WFkU8NG/LG4EHzueNuWqTIfbycXIvFzqXIrx/F+f+ajo7A90yPCnBo9nK1FFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ansari.sh; spf=pass smtp.mailfrom=ansari.sh; dkim=pass (1024-bit key) header.d=ansari.sh header.i=@ansari.sh header.b=MwWXAVeG; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ansari.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ansari.sh
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
	t=1713980580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DgIsjlRwFnvhVYiFhATRum6nyhywEjAGmQto8MQKN08=;
	b=MwWXAVeGwIRoCffBFMazY1eTv6TpyRelj1lOLOppLpJ9GnY/DRp9J9r79cXojaQFDw01gD
	P+leG4YeATf8rhP9vM23Wym1G2ZBG7lJmqnLc7mEiZEdVVq6I+4vlHdpPyUUHgVw6dj3/I
	+Z5k0oq3p16rLjkCECzdoaWBCqWdwgc=
From: Rayyan Ansari <rayyan@ansari.sh>
To: linux-arm-msm@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	Rayyan Ansari <rayyan@ansari.sh>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Bryant Mairs <bryant@mai.rs>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: msm8226-microsoft-common: Enable smbb explicitly
Date: Wed, 24 Apr 2024 18:42:06 +0100
Message-ID: <20240424174206.4220-1-rayyan@ansari.sh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Enable the smbb node explicitly for MSM8x26 Lumia devices. These devices
rely on the smbb driver in order to detect USB state.

It seems that this was accidentally missed in the commit that this
fixes.

Fixes: c9c8179d0ccd ("ARM: dts: qcom: Disable pm8941 & pm8226 smbb charger by default")
Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
---
 arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi
index 525d8c608b06..8839b23fc693 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi
@@ -287,6 +287,10 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&smbb {
+	status = "okay";
+};
+
 &usb {
 	extcon = <&smbb>;
 	dr_mode = "peripheral";
-- 
2.44.0


