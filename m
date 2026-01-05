Return-Path: <linux-arm-msm+bounces-87449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB37CF3E2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6997C3039286
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3952641C6;
	Mon,  5 Jan 2026 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5SKziVX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DD5254AFF;
	Mon,  5 Jan 2026 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619964; cv=none; b=ILO4cb4RMKmlKCNrYpEeccaXi9Y2vBLTeJl7xpm3b4quNJgD72SV92M5KPY5aXq4gih1AHVD+khOZYeZcCSsJiaLRbuNxCJuCWYtMSMwTkYYwdn6SNAUX4F/zdUeR6h/zTKkJVo0s/8Pk+MnNS4dw5eJjALR7SDscmvCG0R5O7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619964; c=relaxed/simple;
	bh=KCJo9bzAW0Wc/a7Id3cOuHsee7B+TqvmoXMRYMyk6uA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pSE4ou9H3BCfG78uUP7QgINlWAOZZsOIhgeJO/XVQdv+wycPqYSvh4aiPzynu9xG56tpQGzPcThUTB5xLX1eWiNzeKO8/pI84nj4VIQ4nU82Z9QPj/HwXB5zudu0APUhj6t7SlbOF7Ll4jqj9t3Nbwerf+Gfj4X0AdrRQkDxcOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5SKziVX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33D91C16AAE;
	Mon,  5 Jan 2026 13:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767619964;
	bh=KCJo9bzAW0Wc/a7Id3cOuHsee7B+TqvmoXMRYMyk6uA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V5SKziVXXd3go7P+IbgszQr2K5i6YKiI2PvZTKeLWlQamyHQcxO8DUUA2TPvn702U
	 bUqf7IVUruSvD+yKuL9cExVhrpCCU4R04x0PLeebLPlScbDWP3IYXOV6qRwlqbOl0q
	 f7JqI/99MFYcICc6QjGrl9ersThfoL9J/6vvQkBVYz6oKxJHeUTpgfNbqFGBwMerbU
	 yVa/bEj/h2u4sOEkpHRKUnFLhUIepi75XD3qMF6IodSajHFWA0lXu/QaLKxDOd4VP2
	 dYkU+fIqYa5Y5xsZPn+Kzznk2DWVKZTx3Y44CRjgblBVkNMAoJO1vuo7Qv2NazZVTS
	 f9577T59MWSzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DE2C79F8C;
	Mon,  5 Jan 2026 13:32:44 +0000 (UTC)
From: Robert Eckelmann via B4 Relay <devnull+longnoserob.gmail.com@kernel.org>
Date: Mon, 05 Jan 2026 22:31:51 +0900
Subject: [PATCH v4 1/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 SLPI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-slpi-v4-1-e6e0abfad3a4@gmail.com>
References: <20260105-slpi-v4-0-e6e0abfad3a4@gmail.com>
In-Reply-To: <20260105-slpi-v4-0-e6e0abfad3a4@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, david@ixit.cz, 
 Robert Eckelmann <longnoserob@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=989;
 i=longnoserob@gmail.com; h=from:subject:message-id;
 bh=43kKQJ2mrMLWelYKXy1f8QwGrRrSkq/JoF9T1aflu3c=;
 b=owGbwMvMwCVmcOAq9/vk/SGMp9WSGDKj91Y5ndp0SXKNZJ/MmmOLeCXOlTEZVhl58+xdu4Dr4
 nrNnEuRHaUsDGJcDLJiiiw73I7pZLoujdi4e38ZzBxWJpAhDFycAjCR/7MYGfY9i3LR6lB6pJHZ
 9m9Bqfm7mzH+Wnny4ktZIs48u7NM6xwjwy3pxPSNMjHTN0WnGO9b2tFr+ibw6seJm7V9BG8EMs5
 uZwcA
X-Developer-Key: i=longnoserob@gmail.com; a=openpgp;
 fpr=B846C62C6945A558B1BBBF7630C0D50BEF63BF54
X-Endpoint-Received: by B4 Relay for longnoserob@gmail.com/default with
 auth_id=569
X-Original-From: Robert Eckelmann <longnoserob@gmail.com>
Reply-To: longnoserob@gmail.com

From: Robert Eckelmann <longnoserob@gmail.com>

Enable the SLPI dsp on the Xiaomi Pocophone F1 with Qualcom SDM845 SoC.

Signed-off-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 785006a15e97..57af560e35ce 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -425,6 +425,12 @@ &sdhc_2 {
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_HIGH>;
 };
 
+&slpi_pas {
+	firmware-name = "qcom/sdm845/Xiaomi/beryllium/slpi.mbn";
+
+	status = "okay";
+};
+
 &sound {
 	compatible = "qcom,db845c-sndcard", "qcom,sdm845-sndcard";
 	pinctrl-0 = <&quat_mi2s_active

-- 
2.52.0



