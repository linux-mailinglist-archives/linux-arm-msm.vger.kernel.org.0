Return-Path: <linux-arm-msm+bounces-67306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C68D7B17E25
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 10:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02CDD163D77
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 08:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C59B212F89;
	Fri,  1 Aug 2025 08:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJohK79o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7F319E7D1;
	Fri,  1 Aug 2025 08:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754036500; cv=none; b=rS7gKeNhNvhQvJpB2+7V1UV6E70sUZeyqDpEAcyKqI+vpyZE2JSRvAK7Fli2SZ7vKYTJGQAVg5nuewfLeD8m+ocrC2zh5/Gx62bsdwPVUF2tLt85aDjkqFo+prQoHur85hRIqnUNk/8sK5dBDbqHogCEjt51QgpDJ5l3flw8n6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754036500; c=relaxed/simple;
	bh=7ghTM1abxmx5Z8mxEd/6YOwxzJ/Ipj0q9+LwDz1NLYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VaSYpB5FA9dCkuS4IWB+6yFESkbQYYSaUlF5OoowN1gZp/88DkV/t3e1gK8mTVTD4+atT5OLCrhR6gTqyJlucAPhAoiUaHFG3fyAPwCVGqWTHSYgWhoeCIX9nJzX/iN9LoNTVFp9G0mQgDm67wOXLVoZdtXP7e2GzQkdko3tEHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJohK79o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5148C4CEF4;
	Fri,  1 Aug 2025 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754036500;
	bh=7ghTM1abxmx5Z8mxEd/6YOwxzJ/Ipj0q9+LwDz1NLYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qJohK79odapicHzxkesuKtALUGjvbr+BLy04xXX4NqarWkquUTES2qBOay/DMkMzf
	 4BU7DncLCqRSYm/487iOee6zZwpr1Mu9LtWlEx1MUFYyX7XVHwMHC26u5q1g4KsUTR
	 RFSF+qcFkwpJ3DvK8VS7HuCL4XxZmjcdyYW4n0FrLOGyjOgWT/JySYwcC9D0xC6sAv
	 V6Wo0VBFoIT5Z3Zv+OtwHwL2ag20cmuCsxkbVnoCdmjlmd3G0XGktLtb5LfhsmIFOT
	 d6+Q0q//bqiFJTp4tIThWm5BoXZLl3s4YE26EMP8tmyABJc1rqP6+tN0ZvNkhZBcd4
	 CbwLEy5GfydfA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB12C87FCA;
	Fri,  1 Aug 2025 08:21:39 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 01 Aug 2025 10:21:40 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: sdm845-oneplus: Deduplicate
 shared entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-sdm845-msmid-v2-2-9f44d125ee44@ixit.cz>
References: <20250801-sdm845-msmid-v2-0-9f44d125ee44@ixit.cz>
In-Reply-To: <20250801-sdm845-msmid-v2-0-9f44d125ee44@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2251; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ZJywnoUp3uvB3aKb5+Bvj63no54fBuuORi0qPRukfHI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBojHkS0aszmT0r1lv705M3GHf3q3UeTInv1J0Hj
 7xFX7oWI7SJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaIx5EgAKCRBgAj/E00kg
 cv2rD/9CHE4cDtJn3+z/h05RzJ1b8vmIHMrSj5jE1WuEDCeSh5Vq98jfSd7vzj8dqKP3H9+XFOH
 7L0AULrDXhsb9L9GyKl0ATpPeJs7O0eD4v0eV30eQFtSngbVq9XhPNpWSn2jbhUq30cx7M0v2bw
 zQ4IEL0U8pUFEiL+S29kXgaSquxtxuwSyrA17dDc+O+ve468nbAC3Fd7YAZOH9rdy5elbVN8imh
 6cWshAvCBLxyY7Rr2SbCN+342Z+JSarsJtsJC5uFEZOA/EmwlPA9nwcVSvG0nqAIGkzdGqBxyCE
 /C3r+VuR4112+IoK6gGibeznr6g1EGwDNkYLH+wSduWdshoh+THNyeaGYHEoVgV8bslRu1Sy6KN
 E+GDquRVpjUNhpN9kLmaiDJGjqdyrajSY9WReWgnUQPY7lsoDWd3HhL25GZd2fXO0UbgqvYyjFR
 qxzDffeRwWPfFYiDD3rky1lyJbPNHtap26RCDBK+75Y1mMeRQUpcGdzsAUY0nKflcqdNGAgC7JK
 qtPcRlmgsovbwaGNRzxv7hrYy212SqS4GeIhbcHCS3seugDe7//eWhKFS4g2HGMySBpld3i/vpS
 5vLbUQdbbri1gSKKygCGqS9PS5Uh4tntFWGpEHklLcoO+j9hE70mL8CS+4YkKe7YrlHNWyc3CRM
 M9S3c+II2GLSliQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Use the definition for qcom,msm-id and put them into the common dtsi.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 4 ++++
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 2 --
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    | 2 --
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index b118d666e535a433f44b66c71b36e55df2ce5c80..dcfffb271fcf3146aeabda8fc19e61b456b76887 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -21,6 +22,9 @@
 /delete-node/ &rmtfs_mem;
 
 / {
+	chassis-type = "handset";
+	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;
+
 	aliases {
 		serial0 = &uart9;
 		serial1 = &uart6;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index 4005e04d998a40d25a64d652a526bf93efc20332..cd5546b69d13d8d7f29373aebab1cfda79666900 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -10,8 +10,6 @@
 / {
 	model = "OnePlus 6";
 	compatible = "oneplus,enchilada", "qcom,sdm845";
-	chassis-type = "handset";
-	qcom,msm-id = <0x141 0x20001>;
 	qcom,board-id = <8 0 17819 22>;
 
 	battery: battery {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index 9471ada0d6ad8bd44cc58a6efa07f7eb27921af9..b4212626b42954e10974ec087db2b42b07979f72 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -10,8 +10,6 @@
 / {
 	model = "OnePlus 6T";
 	compatible = "oneplus,fajita", "qcom,sdm845";
-	chassis-type = "handset";
-	qcom,msm-id = <0x141 0x20001>;
 	qcom,board-id = <8 0 18801 41>;
 
 	battery: battery {

-- 
2.50.1



