Return-Path: <linux-arm-msm+bounces-70328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF74CB31400
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 385315C38D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987E02F3C18;
	Fri, 22 Aug 2025 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XigP8NIN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FA02EE281
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855573; cv=none; b=JLxPyB0N097/fSLQ29/cHe9FuuqQgD4GttZlxhtsYR6+gcwazRWSLvL78Lo2H/2wdrYGjqL05IaoySeipS5clp6JkN4qwLSKDdJ+vNXV0BIpGvpZEddkxbt+lMwN27ol1fFq9pH0sSGKegYAU/Rv/A+A/+dgId3G1m3vvHFlED8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855573; c=relaxed/simple;
	bh=CBHmMHHtxlm10+qeAMc8aYam3qMzlCk22/bbwKvrU/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jTTp1nyjmgRQ9hnEMWktjfdCXs3ss0ppnr1S97ioCEMRSK5t22QxfgyCz88pRBZ8vjsxNQgdQj1c+PEJPBt/yfTo/DVXwhCPWrwSU5PSRJb65tn6feVBYOSGg5SPvGamD3E8e6aYnF3SFRYXFNa/bKzvT8afBBklkFJl9HnwcD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XigP8NIN; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9dc5c2f0eso1014690f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755855566; x=1756460366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wtFtCOZAL2gp20b+62S3Bdf9VL3D2oi1QDgtuJyRDc=;
        b=XigP8NINASaqHgNsw3dtxpbAVJkDNZs7ZmiehaG8edaR8m782XlcQCIa8BlNMGDMMt
         OanH1lSxa8gjZBmLfmlIH3ta8XBGf5nYyDdXSCUkTxiZg6ADzHhUeO1QJ1WncLtgogTz
         ZRNGBcZ+Xt0fBG85qftHcr4xM5btpEpOuIxvuTtjHLPdSKT+Noy8sU0E/Kk01kWnzGCS
         ZMFk7Mrxwr2HEekKqliBjspKQriF7/qtTF8dfXPjQGdYgZR2tQyXrpSWReL50aJST5MM
         ZzBOs55Cn7wF14hpgdWVN5iYJcgltLRmsTGkTrMOUDGWXuKUvpShCpI8sjs+WvYNNmdc
         0yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755855566; x=1756460366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wtFtCOZAL2gp20b+62S3Bdf9VL3D2oi1QDgtuJyRDc=;
        b=kn2lZHnMitMjw+3k0ugQMKZWniRy3Vjarz25afjppuGY5hJNmInZXvQoYIVzi1x9BG
         Z1CrlP9tyg4y3FeVnKqz2qrtlzRnSeH0mnoU43xpnNwpzlNDkCt37cNC3/GyZDI8s86+
         7ob8z9cpfpY+HU/i9whZNhmMD/xV5T7mdv2xADhiWpWTOfXE6sAu678sCG9wAh1q/Gk6
         R+lkTP5laE5d5MVrbXml6vGP68xTr1uW59OB6zbM116iELGYJxM3O4ANonrJOvFJydRo
         exG1+4RCh5sj52xSeUpSrBoSYtdDGcyiiDRbMW1V9eYQkLuW2s9RkMWBeE3jF6dzCPjA
         CA1Q==
X-Gm-Message-State: AOJu0YyMjf08jEX5R2R2//Ty9IYUAwcQU3uUMa0LxbazptDX/u2pXa/r
	RIzhljwDSNTrXoKMh+4D+yLPv8S6wLFCvCMHY8vE1XrlSQ/ex3+hQ5EhT4iQxEGzB50=
X-Gm-Gg: ASbGnctYnbRXU6Kbgz/vP3c+WMhZH7Ci+GPoBeHd9NbV3hckvzVgRXz+U1Fybr3sX2E
	Rs0mW2sOwQ5smbe6bH37Yr9vQbGi920yh2/7i4KOOFOl/awWxVncG887BmY3MG3mr7o025reyPR
	gXI5QK8CmFOrh2wYSpOhonpd+gFBb+a1Vm8hJiBPeiQ8WdFJNafxHU1FCC/xmn3ZFSRc8j/z21i
	20yzAi/3q34MeYPQGlaVUWqfA6qeKCQMI6RBHJK3+2ZO6NAkN/juPIROZj4PtRbMu1gpnuBLzap
	RE9p06D1Sm8kh6mZjYVyXBz0nvHn49BUHRGqWre99RI/W0RVHeWUglbwDhKT+od8Mx8Jb7nXM30
	U8F3llC+GKXx4JDLGc0hf633pO+zQyBbWCWnEL5fK3Bk=
X-Google-Smtp-Source: AGHT+IFMdA+UlvnzSqoAYaRrz+fdGKmnqVvOLzoeU7ARbgBeCxxvgVNrDp5jiLZizY/hep4XyZWS5A==
X-Received: by 2002:a05:6000:2c09:b0:3b7:7cb3:1124 with SMTP id ffacd0b85a97d-3c5daa27b55mr1725445f8f.11.1755855565645;
        Fri, 22 Aug 2025 02:39:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c684524163sm609890f8f.61.2025.08.22.02.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:39:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Aug 2025 11:39:18 +0200
Subject: [PATCH v2 06/16] arm64: dts: qcom: sm8650-hdk: Set up 4-lane DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-topic-x1e80100-4lanes-v2-6-4b21372b1901@linaro.org>
References: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
In-Reply-To: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=732;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=CBHmMHHtxlm10+qeAMc8aYam3qMzlCk22/bbwKvrU/Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoqDrEp46lbfw6kjGVKRoadQShNqvJcC4YMvIC9NT8
 T86DSTKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKg6xAAKCRB33NvayMhJ0UR8D/
 9kVxmdTHcMl5itvIRUfmySrfSw7cByYBjfAmF5+AH4bjrJMYQu3dtWKPTsfmJew4O7qA7RuiZx3dny
 eo8nd1ChmR6fdf/m+2c6wPG5QlYlWGES3Xff5mMWH7DPSTipemTKy0kHk2mXuKFQW7l8CIKlKfBnxS
 /ZomTCfhZmuTbMwY2dEqR5pjg7mWos01jST2YzNNSOQW2cp2zLOJGZAD9IM1mr2nliR81TfSrsFvfk
 WaZ0K3MZHq6FllncAx39qVOynKNEGHpFHGzLbEKvjetLDuhfKiPtxKfRLHUKWhQSwneU/fx3e236Fy
 cbvTZ33PckX59dWlIO2ary17EpT2XVrYIwrussncwBRaxdBuI6QvsSAPRlvwGaI8E0zrLOOCIDmLqF
 ZQEq0lXTnLeYrIGmwJTU0hJnqAxwz11jhibPQwrWZNoPKh8/P6hNIbRjYYWMD7qfqgcfj9qkxwzr6Z
 FGuqwMdnDe91rD6VzaQJiohx2Ym+7LvZMesO7ZvC0ppIoyfHY1FbyB4fH15zv9XjXmltJji+94dDx/
 5QJf5SI+jN2v7Hh96EFvK4vUHmvh/zEs4ff8UQJSP6K/Tug5dbV2MtjGLLOg+hnzKNmhgLkhvj4br4
 Hra5Vy8wyuXSwJSaj1txFr9txxYoEigxiJpk0ubGWHMxu7r04szg0lDYGQYQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHYs to the
controllers now the mode-switch events can reach the QMP Combo PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index a00da76a60620b998973cab189f12eeaa0a448fa..5029c8bfec5921074ae6e1171bc3685ed9407278 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -942,7 +942,7 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 };
 
 &pcie0 {

-- 
2.34.1


