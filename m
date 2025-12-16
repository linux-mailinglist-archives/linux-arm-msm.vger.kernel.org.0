Return-Path: <linux-arm-msm+bounces-85407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15376CC51AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 21:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4006303D30E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 20:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB629273D66;
	Tue, 16 Dec 2025 20:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejwgbbhE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98291A3172;
	Tue, 16 Dec 2025 20:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765917253; cv=none; b=WMaBN4bsCSh7JftNQi0RV17/Jkhitx2OYM8E/fOz1sGihW7wyBen99zrxRMgR4iPHTfFbGZ36Frun+TDCJCiEXwiGygiaDHLXnJWdTk68aSNvXsbnrBRjt6RPq33m1Ogy8hMrl+sQ+0+oap2C4SeaUKg/vASZXpQ7saJz/dzeKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765917253; c=relaxed/simple;
	bh=gbs4MTBB/3mazzLZycEOEMLJRyBSAc2efhxppbIrQME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EKBv8saEwBCOzi0VAn6S4EZkyynJ5U5YRUvDMDwqRxQR5rvxt7Z9okDc/YhSFWLsWYwbgeoFABh4KKwy7S0RowGc78oqfReTSHw+H5rCBEZJXQybCXMhcYAAuM8O0rVfTzjIH8Ejjn4aQdZ4wH1ZtZBMz3nv4HIrDpVHM+iqfQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejwgbbhE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32F58C4CEF1;
	Tue, 16 Dec 2025 20:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765917253;
	bh=gbs4MTBB/3mazzLZycEOEMLJRyBSAc2efhxppbIrQME=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ejwgbbhE1VKoPElXQTJdSzP0MqnWz2PUxWlRnBZb4N9Cp6cKn0n+zf6U4nK22RVkQ
	 f1pwGdvbm6Rj703objVU0wimqgNh29ln88OTwU79OyjhM4XZEBu5tagGfG4sA4Ksbg
	 KgV0jfx6y2Jx69JwuwhzIysbRRpTkJwn+Cwfcqv3/VV4sCEbaPErg6V2+/bIXbgH7T
	 ND8CABNcqREln/WpjnsnoVF+nnLZEBclj+aRKlBaah8m+lJ4e6QRnA9o7Geyzn8QEd
	 ODJt7pLqS+6lzaJmbTwNdH7sMG8RCrSdEk6nuGkYekmvOIQOvArB9KRTXLaHlJ167K
	 v1MmsH+LGx6IA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288B4D5E127;
	Tue, 16 Dec 2025 20:34:13 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 16 Dec 2025 21:34:08 +0100
Subject: [PATCH] arm64: dts: qcom: sdm845-oneplus: Enable known blocks and
 add placeholders
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-placeholders-v1-1-d7d544200e7c@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAD/CQWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyNj3YKcxOTUjPyclNSiYl3zFDPTVCNLMxOLRBMloJaCotS0zAqwcdG
 xtbUAMTGuOl4AAAA=
X-Change-ID: 20251123-placeholders-7d65e29648a4
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=+JZK2ZbxfA/IlfNdhYsiDNwaA0HXucqfuw6KNa0TyXk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQcJEA5Crw2AD4nFHdNFPek/RbVbA9LTtw78Hh
 4W6BMB9wcyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUHCRAAKCRBgAj/E00kg
 coQ4D/wIOrl3U2EPI6EA35fBqsUoauCdeaHMeDEaVT/zFWMxpY4NvPo7wQPEKxGptTrhvi0DS10
 yCn/4/HjDwEb9vmbsnj6dJ7UDoqbW6+PzRYphlSoND/IoHRT0Bh373xKXOmuWAWJtEhA6Cmb7A0
 9tpUKrJ1jhmNo1iGhUZkqUnigNWKXjAUioHYtXmqoycC/fkuWdS6spHKlciENo0ehlPp0+0q/72
 m1nfuBi+auZdkt7yqiliJ3efTApM4s0kodS0PQZe1PD/oq4CPn52esVEAJFBjO0GCu1EJN3es/x
 rL575oZ/+LuNzQSb0UJcN+PyZo8AN2CAFynPOs/QWA9ielUgjpgJtBM8+MiozHLzWEDvGwhZiyV
 i/pkCbUOfDZubU1DWGg/swawcp529r5fnZcK0uCgZfa+fPVir40FrPDhp8lRRHiUi0KbeJ+nFki
 KeC3+VXUktrf4BrRsAn2wmGxpjYrMBAZTM9Tc0aiEmOnyMPK+OB6Vvy1zpMp/nU7aN5HaItZPVb
 oN5wBPoKfBwmoors9qnzIKdbKGaoarYUt5nRtdOTy/jY9IU6kPyspRou7uCOd5fycjJTzvFm0Ka
 NuY3uesS0hK5H6cz8O44mN2S3vYGvHHBw6Swaw1DqWjBnvdh/6KvD6qI1CCTt1JNK3Ae5OwuwnU
 UGyUMm1NE8YVc7g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

We know these devices are present; most of them are supported by
downstream and are close to the mainline kernels.

This adds placeholders for:
 - front camera (imx371)
 - rear cameras (imx519, imx376k)
 - actuators
 - NFC node on i2c3

This is very handy when rebasing the integration tree with
support for multiple different blocks at the same time.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index db6dd04c51bb5..3e60565d54c08 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -352,6 +352,26 @@ vreg_s3c_0p6: smps3 {
 	};
 };
 
+&cci {
+	status = "okay";
+};
+
+&cci_i2c0 {
+	/* front sony,imx371 @10 */
+
+	/* rear sony,imx519 @1a */
+
+	/* rear onnn,lc898217xc @72 */
+};
+
+&cci_i2c1 {
+	/* sa,sa3103 @0d */
+
+	/* rear sony,imx376k @10 */
+
+	/* onnn,lc898217xc @74 */
+};
+
 &cdsp_pas {
 	status = "okay";
 	firmware-name = "qcom/sdm845/oneplus6/cdsp.mbn";
@@ -373,6 +393,14 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sdm845/oneplus6/a630_zap.mbn";
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* nxp,nxp-nci-i2c @28 */
+};
+
 &i2c10 {
 	status = "okay";
 	clock-frequency = <100000>;

---
base-commit: 563c8dd425b59e44470e28519107b1efc99f4c7b
change-id: 20251123-placeholders-7d65e29648a4

Best regards,
-- 
David Heidelberg <david@ixit.cz>



