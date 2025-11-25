Return-Path: <linux-arm-msm+bounces-83196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C3EC83EAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 380724E2B4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029CE2FBDF5;
	Tue, 25 Nov 2025 08:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Gy690AJ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0CE2F99AA
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764058407; cv=none; b=V5fLAO3s8hnbdSTnmNb3dY/7fxGh4xzoq1lPS4aAU+X8ix4J4eUC1RL8eSxpo9al+b0TYN/UGB7e3Ewb7SCSviiGo5jIRKSJX906OpCpyt/7RI3BnSatoWKP+ps4PQpuTK5uvZxMdVHEp1G1xFTlKWkOPGmIoJYKmeUojSxduoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764058407; c=relaxed/simple;
	bh=w9wAmXNQBoFL+R5i19c+vkdpO3F1VlOpIMjdaeoCUQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jnDhZTIydbchTqmYjfEvt7u6t/SE+3GDHgw/90s55OkQzWAx/A0OHeB9bj9mEwFmwE+1KPSC+it53dVHSJppR3A0pAdjf0bigUibBeOS/r/AbGndP6ACV/ipPSVAK7daqp9o45rO4Qp0UquRv3Kq4ACuPiX/Pft/sG3kvg9D+DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Gy690AJ8; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764058404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yf+HMlo/PPR6xRo0J6aM6RXFkNHmNADNXzzOlE0Rqfs=;
	b=Gy690AJ8+//a51VDdLVsotrENxnw/hIrRHTteRGVkNT8xw4KlMxRMtmsPktJAf1WI3hjyS
	Bh51ra2Md0iCvAkRiI1RkDMGKeiAbcqR5r5EB61fLrRC4XxVT32r2gjxHOBr8gucZ2zW9u
	sBaiTgxtp4dyLthc5vbmXjW3rzi+nZyjYQPjaDWDfeJp0d1rKeB+MfYxk7/vzbqrcIagX5
	XIzgENXKcR6eyFULfINKkmpNaSgkg50VXFdQBf8WicBemM2n938VUbUpr1U8V8u0kGnKPi
	g4/CmxqFuKq1gVNonRh8ZImFeWvM4p/adGz/PSAC2cPnLywTcEicbBQr0SDNLA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 25 Nov 2025 00:12:38 -0800
Subject: [PATCH v4 08/12] arm64: dts: qcom: sdm845-lg-common: Add
 chassis-type
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-judyln-dts-v4-8-a5a60500b267@postmarketos.org>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
In-Reply-To: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764058372; l=770;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=w9wAmXNQBoFL+R5i19c+vkdpO3F1VlOpIMjdaeoCUQ0=;
 b=OdxJb/ykFKPxeb4Mila/YxDWXFPeZrdQSOc37Sa6mJTZmOlXaIqawSmwnxh71a7JOrsUFIdx8
 TTCZGLsbNA/CnmX8deJebbWQ3Gl80u1MTwKmK9KY+ksuyBAmAE7yi6c
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

The sdm845-lg devices are all phones, therefore handset chassis

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index f12e785db893..93b9a0246510 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -28,6 +28,8 @@
 /delete-node/ &wlan_msa_mem;
 
 / {
+	chassis-type = "handset";
+
 	aliases {
 		serial0 = &uart9;
 		serial1 = &uart6;

-- 
2.52.0


