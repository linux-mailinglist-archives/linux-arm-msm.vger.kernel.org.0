Return-Path: <linux-arm-msm+bounces-84473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C58BCA7B0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 14:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A43DC302F752
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E28F33BBAD;
	Fri,  5 Dec 2025 13:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rJc+uDAN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ED633B6D2;
	Fri,  5 Dec 2025 13:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764939656; cv=none; b=tf1PXN8qjtYvXoxf6UO/bcm6SloycXt0Q6/4B1apDQ2cjqFL6y5myA9244WX1TisAZDR6mgBs/p2flbQl3dXC/kpGWoxIn+gZsDtMEZapjAQyaIVqxkQyhBWnKTZD9ugQH8WEhGKUQIC0vwQb7K7tiZPLAPto8gt+2HxIoQxQWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764939656; c=relaxed/simple;
	bh=jzkpa3d2FIi3jSnxqBzxOYnzejhwzBmVc+sxHIhRxsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NY4Sm+pgq5tVlxWj8xMpeMhyhj6CzakMcSiRVupdlWggGww3msoOoLyHczgrKqVm4Z/Zpfozv9ijyq/m0xbkYURDDnjA3M7zCq59Vs2YS0RvHD2oG/TWKBxnivkNAVX6iULgom8/VLGi/0b1f8INOtt4gUpqZK1zo78htDgOI80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rJc+uDAN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A156C19421;
	Fri,  5 Dec 2025 13:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764939655;
	bh=jzkpa3d2FIi3jSnxqBzxOYnzejhwzBmVc+sxHIhRxsU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rJc+uDANiia/FiDREzDg1PqESFa8iHOLwqQbiNstTMaIwQWG+Y5WXuYwdkRExyIWp
	 RsU7sqqVeUCksurnyJqa0jnptS4oU7fadjhsHOxIGxQIdBPpKBzXk9lvwhMgxDV2oL
	 3a6bEagKI8gNWNcGYV+0lVfSk0QDxvIDpnffDiAGnaH2k3timZUvLb3Foc0Y4XPy93
	 SYbNr4OJ5rvBvgBUBWpBFKvXMgOKDysnV0G7Rs0sfP6uxjPrLFtgCPUnoxid0b6Tkc
	 y7DCGQH00JbsJx8s45BIV+wx19eJ2mqEn8Tx0jOHFf/Yq1jcuvozXqrzF5iw/guU1g
	 kYarKgQUI87CA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74303D2F7E7;
	Fri,  5 Dec 2025 13:00:55 +0000 (UTC)
From: Robert Eckelmann via B4 Relay <devnull+longnoserob.gmail.com@kernel.org>
Date: Fri, 05 Dec 2025 22:00:04 +0900
Subject: [PATCH v2 1/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 SLPI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-slpi-v2-1-dfe0b106cf1a@gmail.com>
References: <20251205-slpi-v2-0-dfe0b106cf1a@gmail.com>
In-Reply-To: <20251205-slpi-v2-0-dfe0b106cf1a@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, david@ixit.cz, 
 Robert Eckelmann <longnoserob@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044;
 i=longnoserob@gmail.com; h=from:subject:message-id;
 bh=AE9KxQiMpmdD1lHdyzsIYuYg+WK329GmEsuY+M4AANc=;
 b=owGbwMvMwCVmcOAq9/vk/SGMp9WSGDKNrrftfxA4x9okg18sc6ngKu71fDPPRGYmsSSlzL4z6
 fazRn7mjlIWBjEuBlkxRZYdbsd0Ml2XRmzcvb8MZg4rE8gQBi5OAZhIZRMjw4fzz5d8E7scbTlh
 17fldw6s+d30o2/93ZeuAQuUpHwmHnJmZHiha8W773moz/WMIzMz7vxJV9TcyhEdXcL9Kmdd/mq
 mDH4A
X-Developer-Key: i=longnoserob@gmail.com; a=openpgp;
 fpr=B846C62C6945A558B1BBBF7630C0D50BEF63BF54
X-Endpoint-Received: by B4 Relay for longnoserob@gmail.com/default with
 auth_id=569
X-Original-From: Robert Eckelmann <longnoserob@gmail.com>
Reply-To: longnoserob@gmail.com

From: Robert Eckelmann <longnoserob@gmail.com>

Enable the SLPI dsp on the Xiaomi Pocophone F1 with Qualcom SDM845 SoC.

Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 785006a15e97..cadddcf63ef6 100644
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
@@ -637,3 +643,4 @@ &wifi {
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
 };
+

-- 
2.52.0



