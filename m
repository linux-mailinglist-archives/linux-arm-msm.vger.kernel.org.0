Return-Path: <linux-arm-msm+bounces-49024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 031FBA40886
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 14:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE4937A1952
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 13:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622A720010B;
	Sat, 22 Feb 2025 13:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="vb8aQ2Md"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3088494;
	Sat, 22 Feb 2025 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740229274; cv=none; b=BaybxInF7/8TaOAbKxD0WERRWAMpvH3WIHsHYkz64HEElsEshQW2RESOyb6a7/fVX2EsFL2E9zkH1LMGLsso219xYg7d+wvSWDAoyIpR9MT6+6XxiHT1MM7UyBqBDBQUu7x5Qz/KM3UMo7OHBYRKUFiqCFRX816I5zTOQwtCeGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740229274; c=relaxed/simple;
	bh=gfKEKbA2BvR7Fy/3vqEuEwx1Y5+zZWqkQUSj9M2UP/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=De7p9jgV0wPt77j5D92DVi5GfbndxW3CZQdtIPzO2hwMYXIEucAJswRSsmvjUIwZpQeHbWYGF0D0C2hzCOhUnVxnaETKHBh1jsWtML+ZKa9u2mmtgagjdgKpipwZ/5DuKfmyeVz4Pe0xiTz+QraGmrPHbJghcaNDjkuk76iD6us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=vb8aQ2Md; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1740229265; bh=gfKEKbA2BvR7Fy/3vqEuEwx1Y5+zZWqkQUSj9M2UP/0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=vb8aQ2MdbcIfiHcxFjO+xkus2jWjdnx8PmclchHRq8tDHbij3Her4QWbyehRLu+0P
	 8wFL9Lscce+mCX1QAoWkrZFc/PWdnqfXdHtkCeIGjWvWYfaythyCMV4My57eQK5Ne9
	 my07haI1E0c5LNyTKMRAP5OgOYRCtLKUEv3zmYLE=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 22 Feb 2025 14:00:50 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable modem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-fp3-remoteprocs-firmware-v1-4-237ed21c334a@lucaweiss.eu>
References: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
In-Reply-To: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=gfKEKbA2BvR7Fy/3vqEuEwx1Y5+zZWqkQUSj9M2UP/0=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnucqPA8NpyRTHW/o/lw8bzYoB7F0bmgY0KCwnb
 t4QGBFq3fGJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7nKjwAKCRBy2EO4nU3X
 VlWkEADVyP77oPNbpMWKaX3zcGBi/5QxEq2dweodDQqAB2lDH8RcqVcStDrHFaxwq2bfYFrgyKa
 EhAw33W8QO2LM66K+X+Q1W8rBNPRBJWlc20j9cbCSa/FMVKIUgQGIvAZJQ26hlcFTkGzkF0/FAp
 YA1JOD1dqf0EVPo9QchvZx+2LaBl0/LaAJqNcVfdHiPBSjOpUwkteaY19rcKG92z0lJh+GJkicb
 mpBIx1hMv6MeP5H4KV1rcRBJJ4JSFe5bisI0uKUnAi6lFYK57w86TDVw+2QBlTsQmvYmAx56C60
 gBLLIJG/1g+P+xHGA4pLq0hEZsZ4q7iDfGk/d2f3PjW4a8+IXMSLjPwhbY+3zQ243IMNiAHh0DB
 OjiNNccHLtIsnvvKudotgTSF8gCrdR4i5lP2HA7IJ380L2cGpyh6yFt8bxlfLn6FqeEMpiH+zgT
 Dr/+VDUkIBavANqp7hf1OeiaDPbe4LxDRmc1atRetVqKhak0nAXWzhJ1cpY6d47p2VzbYmCr+MI
 4FTia9yFw61vIGTli+WX0Lf8Ixyj9pn2Lcvd5Ps2vhD5CMXfQWqO4ovCB3CyPo9OJ/3KZC5VSMA
 8ZRrpeikLeTl7CyTMklyA4Nm4pf0VBps4z7Snq59GwWjiwWnzheK28hDemQVoZumCzIGTPnqXpc
 hdXOwnZpw0BLSRw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the necessary supplies and set an appropriete firmware-name for the
modem and enable it.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 5611209dbfa41d7834af7903535ed3e05604ba63..31ed26c31e6ea381a8942ccf569513df3300cdeb 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -87,6 +87,14 @@ &lpass {
 	status = "okay";
 };
 
+&mpss {
+	firmware-name = "qcom/msm8953/fairphone/fp3/mba.mbn",
+			"qcom/msm8953/fairphone/fp3/modem.mbn";
+	pll-supply = <&pm8953_l7>;
+
+	status = "okay";
+};
+
 &pm8953_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";

-- 
2.48.1


