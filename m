Return-Path: <linux-arm-msm+bounces-73431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E3EB56A6E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 18:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C92F63BDFC3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 15:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C562E06C3;
	Sun, 14 Sep 2025 15:58:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB7F2E03E8;
	Sun, 14 Sep 2025 15:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757865487; cv=none; b=NzPYLEncNJyQj4TjDUBTOd128AtIWFTXtktY59ac7tmz1YAI3qyN+Z1aoP5KZVRs2X/XRAr898CMdaJ6mFJbyq4GVvG1GwPStFx20ai+TwLQLuXMQPByeXaLCUl4RSwdgfD13ibMUsG9CY8TJqcdOIH7mJWgzqlipjiCWfKj/ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757865487; c=relaxed/simple;
	bh=1V85CMmb+/2qUjFLnDfCZdknLQA+oopxoMSIenFyMe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O4UWTTJRsQ2rFp+I/paKGtkXbGKlsca2Q7cPN+Em1E/Nym+MtmnE4r3NtpXL+RFxlMNDv2DLmO+hLIXRYQLbL4ah9BZpnbZ4V8cvW15HbzF1M/X21q/10QuwBXfgfJui6lzOwOaBI0Tpz8TQd/jL0X5LuXgIDUSndQn4zgGYfEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1757865436t268d2bd4
X-QQ-Originating-IP: 2Q1cFhD5gOQXixb34p8OokNnhzwwe83d0wIr9TsTHJY=
Received: from [192.168.30.36] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 14 Sep 2025 23:57:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14379417210709123630
EX-QQ-RecipientCnt: 12
From: Xilin Wu <sophon@radxa.com>
Date: Sun, 14 Sep 2025 23:57:06 +0800
Subject: [PATCH DNM v2 3/5] arm64: dts: qcom: qcs6490-radxa-dragon-q6a:
 Enable all available QUP SEs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-radxa-dragon-q6a-v2-3-045f7e92b3bb@radxa.com>
References: <20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com>
In-Reply-To: <20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757865427; l=2330;
 i=sophon@radxa.com; s=20240424; h=from:subject:message-id;
 bh=1V85CMmb+/2qUjFLnDfCZdknLQA+oopxoMSIenFyMe8=;
 b=TuFr0pwF+lxMqslNRC/5jwCyurLqwTBpmtsP9Cr0xeR6dCj+txxmdR3drRAjStdz2sTCkJRiw
 iG2Gz8jHapiDZh7r05lbakuRs7cAdbYdWyMPCbu+H6ndn0x0HGCKIMU
X-Developer-Key: i=sophon@radxa.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NoFe3wCY3jEyY/xnS7p9ZrFSFQHCt1CIGcmB3uC/fH/JjcSXU91sATZf
	zPJSDpsrwMp6VWuichDHZanaA94Ow1UVe8GEgLfKkuVY43V1+5Nrb6l7XtDkGIbU9vE9/As
	HmoCBDD4HVosucTvU6bSL5wpdqdegD3ioOeVJM4a6OQJQrmZJsokXTZ4t+E9UMs46TTJfzC
	HzulvnbFdBrhlLqJ8+bIVighh3czAyma7RvbUrwGNfd5Nzgfl93TmXgp2emzvSVaX6LblV0
	T0WlIjftnt1Z1t/CFI7ISjJ+Xy715IyJEdbi2oZ/zCiziUfR54Lpmjx89jRcI4FEfPCyg8h
	ZRvA2ldgfN9JoIWPSyyPAm0MrCR6Ff04nlTnj9zAzV+jxTk2Io36pjGkKW23//XNezu6OSm
	jennlG0goyDvPsDuAgtu0WLyrkmRZ0pwQVbF3W+GhNIdNboUAswuqkA7CgDe3kP8l0+UEz1
	bD3ykzJF3QQc3g9zVbhy2LPTPWsaGoc9mLKUZXRERzfNwAhKvqelL+zxcZFUVBDMA8qxbpD
	TrYaQCaqU2rEA7gPm+3nsZe7wZ5K5maeYk35UPBrV1VslKOPkK6cBMI2aKE9KuzBWGS6fv9
	NOh5pq6x3K9j9u/USySTfF5TLX9Ioz4twxUHyJ3Ui/w43yxgGf+yU6fZJ4XXvO1AMm0ncv4
	r650fQWPTXOj8h+1jzuJockR44BKLbkRLWEronTxaSfMX6sqAZhBLYMNVJxv/fYjQDtslJi
	8sA1exVw2nTISSYRoFecNgGbfUVpYY/PhKGZFKY19I2lDZebWH9+vA/jf7zcgPSpnvtzFmn
	Rd9Lg6zVR6cFJoNbQASkRxnswth+Ufnh4cKKm0t8sszLw2jrzlFExULrL4r00UipwF1KWae
	Ss7KNTISJOD/gq00qcBwWJLy2/P2C9levfnvb5WhEvK+BmHef44GztZ2HrHePO9VihC9/3Z
	6d7VV7CwAUpjoh+djeRKn7ED8DJX+xfoDmjDWkI8swC+pimDFSvI9gc+zi7kr1cClOHV4uO
	bW1TxEEPXQ/8gQTUOVNytl1zbW7DtbXqkeupNNQFI72MS0b8doWaQ/exXw9U8=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

Add and enable all available QUP SEs on this board, allowing I2C, SPI and
UART functions from the 40-Pin GPIO header to work.

Signed-off-by: Xilin Wu <sophon@radxa.com>

---

This change depends on the following patch series:
https://lore.kernel.org/all/20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com/
---
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index 85465702279efb7ab324baea0663bdbdbd5fb5ac..d30cddfc3eff07237c7e3480a5d42b29091d87d6 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -432,6 +432,14 @@ &gcc {
 			   <GCC_WPSS_RSCP_CLK>;
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 };
@@ -440,6 +448,40 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcs6490/a660_zap.mbn";
 };
 
+/* Pin 13, 15 in GPIO header */
+&i2c0 {
+	qcom,enable-gsi-dma;
+	status = "okay";
+};
+
+/* Pin 27, 28 in GPIO header */
+&i2c2 {
+	qcom,enable-gsi-dma;
+	status = "okay";
+};
+
+/* Pin 3, 5 in GPIO header */
+&i2c6 {
+	qcom,enable-gsi-dma;
+	status = "okay";
+};
+
+&i2c10 {
+	qcom,enable-gsi-dma;
+	status = "okay";
+
+	rtc: rtc@68 {
+		compatible = "st,m41t11";
+		reg = <0x68>;
+	};
+};
+
+/* External touchscreen */
+&i2c13 {
+	qcom,enable-gsi-dma;
+	status = "okay";
+};
+
 &lpass_audiocc {
 	compatible = "qcom,qcm6490-lpassaudiocc";
 	/delete-property/ power-domains;
@@ -624,6 +666,12 @@ spi_flash: flash@0 {
 };
 
 &qupv3_id_0 {
+	firmware-name = "qcom/qcm6490/qupv3fw.elf";
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	firmware-name = "qcom/qcm6490/qupv3fw.elf";
 	status = "okay";
 };
 
@@ -702,6 +750,24 @@ platform {
 	};
 };
 
+/* Pin 11, 29, 31, 32 in GPIO header */
+&spi7 {
+	qcom,enable-gsi-dma;
+	status = "okay";
+};
+
+/* Pin 19, 21, 23, 24, 26 in GPIO header */
+&spi12 {
+	qcom,enable-gsi-dma;
+	status = "okay";
+};
+
+/* Pin 22, 33, 36, 37 in GPIO header */
+&spi14 {
+	qcom,enable-gsi-dma;
+	status = "okay";
+};
+
 &swr0 {
 	status = "okay";
 

-- 
2.51.0


