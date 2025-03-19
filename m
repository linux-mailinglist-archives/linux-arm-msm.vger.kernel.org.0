Return-Path: <linux-arm-msm+bounces-51885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC5BA6839E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 04:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C569420C83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 03:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41DA20D4F7;
	Wed, 19 Mar 2025 03:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3PpgaMZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A3E1361;
	Wed, 19 Mar 2025 03:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742354223; cv=none; b=GbLdGMRtIAhvqmQtuyD0xnvpKFAZ+yZaafrU95q7Cm8ktIiNU++0LbJkiXjeusexO2PjCsIr34XbjD/owmj7v091Nfr1Zonle2d7Nbs30TNGRxotraN8YolAuaSYfYeF0hMsxKhJ7EK10ZOBFK5hizIKAjIPPlWrTTVPdfpoRgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742354223; c=relaxed/simple;
	bh=qeLPqAtHiO/H2vc0uRnSGJkjZXaU7bZ10mlpzWHoCPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MFgYGHw2/iX1GRCrd0tdOqinyG+Qo3GWlNuswaH29rn4rc7+FGNi7JEcg5l5wmNvhzzyWF/lQrT8UtUxkc5363WH3t4QVrAWoyf7CyiYNJFRrZjh6A8rdDovNcweaz/5x702GDk1pKpCFWi446Lx4nsNBdgFc2uBw9qTQWFwcro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3PpgaMZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 474A3C4CEEA;
	Wed, 19 Mar 2025 03:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742354223;
	bh=qeLPqAtHiO/H2vc0uRnSGJkjZXaU7bZ10mlpzWHoCPU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=a3PpgaMZwXbzEV9++1k7QBlZW6aHXjQtVN2GephZM6zwhLXs5EJj3MiFTHeNmdh6B
	 ojSELFmsrDRrukEM+2r3tmMzAx/2jCrFxTHV8OusdGjIhczxTbDFrKK/iQ5WFECA61
	 cOCl8KtSdJP3SYDAMecgsJQXypddqQByESrZpLVo8PhnwENcukQ8bjKd8fHOtRvPw0
	 kt98qTbOIqYitj/25D+AZ75NnRj7DK6K71WSBy9EqbmDIaIGF5Vq98tvF4qRYuOncw
	 OmephSGYKDntK+bjBERLQgB9MWHW0Zc9vuex9yQ12Dt8C0dvpSP8E8CTFhO/6J9Jce
	 NZAMYWgdUIrnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2A8C35FF3;
	Wed, 19 Mar 2025 03:17:03 +0000 (UTC)
From: Bjorn Andersson via B4 Relay <devnull+bjorn.andersson.oss.qualcomm.com@kernel.org>
Date: Tue, 18 Mar 2025 22:17:02 -0500
Subject: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: Disable PM8010
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-xps13-no-pm8010-v1-1-c46236d96428@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC032mcC/x3MQQqAIBBA0avErBtwFEG6SrSIGmsWqSiEIN49a
 fkW/zconIULLFODzK8UiWGA5gmOew8Xo5zDoJW2ypDDmgoZDBHT4xQpNE5rstY7TwZGlTJ7qf9
 x3Xr/AGJHGdJhAAAA
X-Change-ID: 20250318-xps13-no-pm8010-3822155f8f13
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742354222; l=1197;
 i=bjorn.andersson@oss.qualcomm.com; s=20250318; h=from:subject:message-id;
 bh=omuUPA+qxmlSNoxLRc5BBaWQ5fn2KKc3XDYkxP1Te+0=;
 b=GMNIY9LC1Le/BwTXdv0ZcMEdOMWI93U25EXAHRSfxusH4YPd7lZH33Brot0eckETV1MO5obb0
 BXvVNBFNbNgAzv478yj1khKqpANpN2RuEDsaTK1HjY+vvnsu7/B2nRp
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=rD3O9C9Erg+mUPBRBNw91AGaIaDVqquHZbnn6N6xh6s=
X-Endpoint-Received: by B4 Relay for
 bjorn.andersson@oss.qualcomm.com/20250318 with auth_id=362
X-Original-From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Reply-To: bjorn.andersson@oss.qualcomm.com

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

The Qualcomm X Elite reference design uses the PM8010 PMIC for camera
use cases, but the Dell XPS13 doesn't. Disable this PMIC to avoid the
error in the kernel log caused by an attempt to access it during boot.

Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 967f6dba0878b51a985fd7c9570b8c4e71afe57d..684441bc3eb39ab2e8fd7dbb641a8ea75309901c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -867,6 +867,10 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pm8010 {
+	status = "disabled";
+};
+
 &pm8550_gpios {
 	rtmr0_default: rtmr0-reset-n-active-state {
 		pins = "gpio10";

---
base-commit: c4d4884b67802c41fd67399747165d65c770621a
change-id: 20250318-xps13-no-pm8010-3822155f8f13

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>



