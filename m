Return-Path: <linux-arm-msm+bounces-64015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E38EAFC875
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F1631778BF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3003269CE1;
	Tue,  8 Jul 2025 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NEkRfZLO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B022322F74D;
	Tue,  8 Jul 2025 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751970533; cv=none; b=GsUTcOUmi9k2SyPougg+5T1igKElvteoot07Kxq2Rdv0w3K5DxaWe4Sts/WwaixZSVpPFAy6yQbcH9KP11yfXBkXeRevvQ3g+BiNy9YkBtywCsht3uEYzQ2x+ojzlcxE0zyjbxyKWFHlAmnYT8Iz9opztGh4+BLGzJFRx1AUBiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751970533; c=relaxed/simple;
	bh=WAjiCvboyp+3JyFm44Np/epMYeJ/HardsZ0LS2Z1FaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jAIbmCIJJW0nPVs2fdMrNdGvh8PEFQrmeZm/FAsU8KnGKLvl4+L0nL8j+leIJFg3dxJqEgJhuSgcRTuDOiL18X0aLa7ZHz4M8uLPg+cPGa5O8aWwGHrKIMnr2ew2KJN1eZn0lzgLr21gC1L8Cw3kl04Xf6AF7w23lI4e2zXTIx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NEkRfZLO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C7CC4CEED;
	Tue,  8 Jul 2025 10:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751970533;
	bh=WAjiCvboyp+3JyFm44Np/epMYeJ/HardsZ0LS2Z1FaY=;
	h=From:Date:Subject:To:Cc:From;
	b=NEkRfZLOPxhCjjMTDs8ZHV3gmcJafeh2WdtkBBvzZEVT4MvSr4I9SAd/h/a+V6g37
	 25hvhcbH4Odt9MxHh+k/vvTBXX+178i9JxYES2bpglRgkujAKoksZJnMxfuhZQ1nWQ
	 gG333jF6dYbqivGAnjEnh/LMWgm+8N3ZpQqXbZHBcC6wwSd3+beMv+9Ba//5d8WKk7
	 4OI/hGyTgvVizz5zkuoTNt8TYca9HkqnO4n05IuvMig5NWBTjbAkJ80wDyIMMlfpJ1
	 RyvKvViZ++FE07Ydg4TgMS5DHb3+3VFEEpOTUXJErNCoEHTLkyKkYRNJ6lIY3pSQ/x
	 K2PgijR6KBjOQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 08 Jul 2025 12:28:42 +0200
Subject: [PATCH] arm64: dts: qcom: qcm2290: Disable USB SS bus instances in
 park mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-topic-2290_usb-v1-1-661e70a63339@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANnybGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwML3ZL8gsxkXSMjS4P40uIkXTMzY6M0Q6NU0+QUMyWgpoKi1LTMCrC
 B0bG1tQDWBXmpYAAAAA==
X-Change-ID: 20250708-topic-2290_usb-6632f12e5cd6
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751970529; l=1791;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=dTNWeKPTeQhzcHl+gyzKi31A+qFWu41fN7Ysr/rjASs=;
 b=2Dz+5LpI5nzETphYdZE0zKLuRf5X9t0/IaCe1hpevfHWf/KuCoSXrTMZAkaaTN+k857naO4TU
 ObpB+5GrOEbA7efJQ/AqckivKm2P/72GQZoMYtKxTkmARqc/NnxvVEO
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

2290 was found in the field to also require this quirk, as long &
high-bandwidth workloads (e.g. USB ethernet) are consistently able to
crash the controller otherwise.

The same change has been made for a number of SoCs in [1], but QCM2290
somehow escaped the list (even though the very closely related SM6115
was there).

Upon a controller crash, the log would read:

xhci-hcd.12.auto: xHCI host not responding to stop endpoint command
xhci-hcd.12.auto: xHCI host controller not responding, assume dead
xhci-hcd.12.auto: HC died; cleaning up

Add snps,parkmode-disable-ss-quirk to the DWC3 instance in order to
prevent the aforementioned breakage.

[1] https://lore.kernel.org/all/20240704152848.3380602-1-quic_kriskura@quicinc.com/

Cc: stable@vger.kernel.org
Reported-by: Rob Clark <robin.clark@oss.qualcomm.com>
Fixes: a64a0192b70c ("arm64: dts: qcom: Add initial QCM2290 device tree")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index fa24b77a31a7504020390522fabb0b783d897366..6b7070dad3df946649660eac1d087c0e8b6fe26d 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1454,6 +1454,7 @@ usb_dwc3: usb@4e00000 {
 				snps,has-lpm-erratum;
 				snps,hird-threshold = /bits/ 8 <0x10>;
 				snps,usb3_lpm_capable;
+				snps,parkmode-disable-ss-quirk;
 				maximum-speed = "super-speed";
 				dr_mode = "otg";
 				usb-role-switch;

---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250708-topic-2290_usb-6632f12e5cd6

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


