Return-Path: <linux-arm-msm+bounces-48294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8A8A38EB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48BBC3B18BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DE71B423D;
	Mon, 17 Feb 2025 22:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="tOAA0m98"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AA91B0403;
	Mon, 17 Feb 2025 22:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739829962; cv=none; b=Lre5xKXZ7qX/uQ5EMPKkzq2SnwDRNZ+sxllFmz7PtSg/GwR6mOOi3Z/TY2umFH3SHsKpNk6YVMp9lDCzyIu2tob6AUhqAZ3TiEZH0Ph6sABv8E0wqQTx8oFgg9KAdxt7GI3YQgfu4+1trLvyz6P5zJwrb9HCuxPG0gwfon97aW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739829962; c=relaxed/simple;
	bh=DLjfEGxFWMNPCYEaP5OzjsuwOiEesmoVFxG+cMzU00A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MnJddXoVCpxUFi3i8zZeuf+CYCMa37XDmczFRRt+JKjXiGq2ARD37y/FmxYBi5ktMDEBb6Gp+zRO582o6FZuaFH+PsKtgvoR/UUUsEaRrz3oJSJwT5EnZ7zkYKoNAktsGjnFJV7US927HaNWjfweoTJoWWdTqNyo0hpOtFH81HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=tOAA0m98; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1739829951; bh=DLjfEGxFWMNPCYEaP5OzjsuwOiEesmoVFxG+cMzU00A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=tOAA0m98RTxJC6hw7EI7TqeKf5R+no9PpntIEvDtc7KWM6IAPiFCd84hhl2T+e4XD
	 MJU++18ykbcBJj+6jNN2Uet/C/CwGsg/mepxO58vWhiU/t6qIGFgFWr7qT6JMXdJ2d
	 X5VJ0B9NeRt4NPnlK413TkPnCyKe/C655jHNNfKY=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 17 Feb 2025 23:05:26 +0100
Subject: [PATCH v5 12/13] ARM: dts: qcom: msm8926-htc-memul: Enable modem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-msm8226-modem-v5-12-2bc74b80e0ae@lucaweiss.eu>
References: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
In-Reply-To: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=DLjfEGxFWMNPCYEaP5OzjsuwOiEesmoVFxG+cMzU00A=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBns7K6qgsPalcZz4J5Vg21CMlhGrqYZQ6WfY+hx
 BguKa5c9DeJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7OyugAKCRBy2EO4nU3X
 VmeWD/9qBddHdJx/BIRLpAcIRoo0ff8exVe6xtgUKzn/fnMaPwZFC834MquvpTUykmzDVPeK5IQ
 BCZ34CVijdpECs9d+SPgvJg2X8qljf0r9holoFYjPAmZo1y7Gbi/hfmvDap/G2GITiaVSBfjJfZ
 zhF5OVMjNZW0DJMAkYazdsqVeiXaV+xEAQN04iPaBzLVXXbQUSJUOutIp2A+IzC/vyEu82Ps8hO
 6TTEm4j+1Ygx1Wp/M21XLFayJla1bFHRQdGuNaAuXELYjlS6EE3g0hPsngjCa38Ejb2C/ZWrgNX
 8+q+k5+KlE6uvs/1Xiya5Zp67fnuRkDu0uma/MA1Dgns/XUYu1Bh+4ecNHA0d2Fz5QbkZZNg7+L
 yF0WOYDtiVC2Td1v5VcLjxxLWoG2Ld/TBcxV9+g8TXA7u/+o4qwtqsTi+QiKfoZmU47UxRlrPG3
 qt9u7LG3205/ASGJQ4R5VkOV0+WYYO5oN7ts5hYqPyLu8Gu7i3N65vJlFt4Vs6cIFK+cpfYPwq4
 sOZtnhfHUx+SpYpS2G7ON9/hIIVu0UfFIMujigb/z1GfQoCIjqxV+iEXBW2kn9H6Lnc4LLyvY81
 lpL7ANvZUNb9A0ZlgVfFiEHiTyOMTrD0AJoIqM3zo3oc1kSqAFRk9VQpJCWjJDwM6kivwclhZxL
 v6ueYbLai8nMC7Q==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Enable the modem found on the MSM8926 HTC One Mini 2.

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
index d6eaa82cee4daf6a1386902f537f1351811d4a06..cb571aa13c11598182dc020f064fe8268bcc061f 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
@@ -195,6 +195,16 @@ &blsp1_i2c6 {
 	/* TPS61310 Flash/Torch @ 33 */
 };
 
+&modem {
+	mx-supply = <&pm8226_l3>;
+	pll-supply = <&pm8226_l8>;
+	mss-supply = <&pm8226_s5>;
+
+	firmware-name = "qcom/msm8926/memul/mba.b00", "qcom/msm8926/memul/modem.mdt";
+
+	status = "okay";
+};
+
 &pm8226_vib {
 	status = "okay";
 };

-- 
2.48.1


