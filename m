Return-Path: <linux-arm-msm+bounces-46299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A47A200F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 23:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 596DE1885D72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 22:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020941DE4DD;
	Mon, 27 Jan 2025 22:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="Jf6MElkT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABBD1DE2BB;
	Mon, 27 Jan 2025 22:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738018002; cv=none; b=jbILL+SGVwT3+qL7fFI4l8xonsW3E61S1Ro+2sjJXdq+uEr+8uxykxxSL+Er0WLDaP0mcvbP6nbZ03zItwP6ZDNoanYUqVKdREa2K+6XuwIm+zHY+uSLWyh5IaLEhcRs58HYJauYuC8VV2Kw5ZUCb+8XcXT7OWz+h5xeGakjYm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738018002; c=relaxed/simple;
	bh=asbDMQ42SDs4b1srxiQIMMXY9QcxxqIiu1L0P2FyiPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ciWj4wZ9TA3I+GzjzJz9Ju4IFiFGjUdUDlzGT7NELEH7plcdfhdHPGsOBNRpUJAW1euFvy50VVsQPxhggZtB7enUwG0DxY51geJ8AzAyK3kaEm8MyYYmFsscysTZ7Bs/jFq+E1kjuk8OMk0JyH8xVrBj+8KuBSclEh+S2ufLxbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=Jf6MElkT; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738017997; bh=asbDMQ42SDs4b1srxiQIMMXY9QcxxqIiu1L0P2FyiPc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Jf6MElkTHhrVNdFnyvpZcu8O0Cyaop0+fviS86apngeGwqFndn4g/llJh8dZIUMf9
	 wqxEM7Xug0k0cqikP4958Tat/UqAU5zNtjaPKJVJx1ekW3Hapn5BOqkzfXpmhUKyLb
	 CkBUWj/Uoe5OnIKiA+VMVEQyHCZS2+/PBETD9hPg=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 27 Jan 2025 23:45:39 +0100
Subject: [PATCH v3 07/13] ARM: dts: qcom: msm8226: Add node for TCSR halt
 regs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250127-msm8226-modem-v3-7-67e968787eef@lucaweiss.eu>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
In-Reply-To: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=916; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=eB48oZipWmKlZ7VBf2h0qGYYC/OPKdoJotfz6BVVjs0=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmAzElQbdLP01HB+GPPf4QGcjlrkPZKp2CVAv6
 ZONt6cQG/2JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5gMxAAKCRBy2EO4nU3X
 VstlEACEonuHnK7OmOZ+n13M44YLp80uCNvwMu3H4w4Id+38iHDXyjz905rLbN3O3lcig0qolIC
 VROFvyi2CB4Gtz0r1tey165ESV0/xiBIE6uC+1/EgdiT5qppYZcfbO/ek4+p0fZYoWyWicqgHAd
 2Ms8L6PNoSgoAFHwbI8C4ovIQh8u41l01tRK93tOj7FJHxWsq3ZTrUA1u9i5FErAL7w9F/miKzA
 Tj8vUzFVgt70axz+ldnYI1ytTFTqz400Wn1ZVSewmUF3JbpcYlYRN7Z+i9dcfXuMjfz2SNhrelZ
 WT63VBbdrXx03sMUshEsgnE+BaJLETvLpWYobLrp+lqVHV624hhmVeIK1E/vWpPcl1ofcjAOIAm
 eAHkb1vf4FHF3VBUoWDsTXcM5+UNb4rGioZzwIV8PCWuy0e+adRUeOGn0DvR2ZNx/Um3gNy/Edv
 wMNzJEW5Uo2xILo9Rzx3OFFX/KrlVWmwkNgLbIyTnftnJvBwgeWOKbUcZx5rA+jQLa5Yk+LuxHk
 OJUbis8t0tBVe7fl3ptttdX/PHe2NbcOuwDUYO6pBsUXTrfXyvy5ENwcGueEz7evOyZZ25Bn4bR
 ZHN3HsXT+za5EKsBtb9iNzaD3MalHx047o6SyK8vmdfsUfAmkll0yrdnrBZT4H2GwJHf3xh+o6u
 nvg0zmBBUI6kCiw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Add a syscon device node for the TCSR halt regs needed by
modem and other remoteprocs.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 64c8ac94f352e46dc4a18f902d2c30114ecd91d2..caaeeadf289f78d29403312738bbb714eaad74d2 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -851,6 +851,11 @@ tcsr_mutex: hwlock@fd484000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr_regs_1: syscon@fd485000 {
+			compatible = "qcom,tcsr-msm8226", "syscon";
+			reg = <0xfd485000 0x1000>;
+		};
+
 		tlmm: pinctrl@fd510000 {
 			compatible = "qcom,msm8226-pinctrl";
 			reg = <0xfd510000 0x4000>;

-- 
2.48.1


