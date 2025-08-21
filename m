Return-Path: <linux-arm-msm+bounces-70186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A09B2FB1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 15:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAE6F1D204B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB3735336E;
	Thu, 21 Aug 2025 13:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q2Lz0+6N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7D634F480
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783465; cv=none; b=cs93/ZEvGFqJynJRmzGGGC6G1+cPikU49Pgw+KyD2uQlBSd0fjv8TbQ+/WpskpB6Dia/ghTzRzaZPJLm0jqE3XyYL0SlbY66F7rGriB1S3/MPwNf0MRm2DUMqJT+XgeUaeM+5fNpjstjcJJrHnZoAU4eZRCXIj2pganJq1U9bLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783465; c=relaxed/simple;
	bh=sucDWngkcc57lEpuqUyMvN5D5nggCib4i3lqmpo2kAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SzbH+CUuxUm2tBT/GSi1xBqiUn0+mCRnGKK+HB8swI/ZLYNcf+QpKThYS+3RxBUAS6KKxiFuWQ7n/SuQycLbAjMOt9lDz8b+dZzp/8aBY8CtWgZy456LuuVybtvWivPX4TEGA4vDfY92F8VF702u1D/besnoQyXNm1HEvdwnEJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q2Lz0+6N; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b05a59fso7434265e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755783461; x=1756388261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CdhuTg7uI5AhWYYHaCMZroPXcVIf1dIpA0xTfE6eKw=;
        b=Q2Lz0+6NYzjfLfER/+15Tgv1ifg46+CrWDiczHZXpdns4YahAMzgRqEKNgeHNkyGLW
         02ZO6Hu1eoCFfLkeimHnclE5UA26mhwaWDuisJG6zEdQQ6CEkRsFRBDSPhI5xQ28pICL
         hkAXOzbhAhDdCM4kAjdW8R9qXeTL53HxUO/fZ4xg/sQt3LJ9WiZ/UD+ELs2zg4p3ZBKF
         kKykYWXN+8cFK79gWVNCE0AYiyuroQRGAG5sZERCRMxKe50d/1SoFlA9W8UnNkWwc65L
         ehYC3siHXNV/DWbMjf+2hRjJYnB4olG+D4m5dhmhv2wWoXfo20UCCPmvmLweuZdswYkV
         axAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783461; x=1756388261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CdhuTg7uI5AhWYYHaCMZroPXcVIf1dIpA0xTfE6eKw=;
        b=mcfHd+6Pd1hM+jczV5pKEME0VLj4q/zlk4oTkd2BxKV5vD1V51O0QvQbIsvnxQ05Yn
         WMiNFNNVzS27sJkQx7eOmPru1XxN2yAWqo+UvYclkazKgIDhDGcaZnJsMtnniyPLc52T
         DwL6FxOreZDHq55+j8cfDyp/FZXwvj0nlDxftLYItjEaHfypehAbcL86ZzHNK7cLparK
         Irv7CJi7QO6O5GjpM4R2SIlXyRR2+KQBtFZOYbr89LwTVyD+EzA0whqOEYtW0HqrtFCx
         VsnoHPOD4XnrRoll2QgJ3P34IbXZynj/GVyR2I3/9k/aF274d28jyigQBkZnAP/weQBg
         QxlQ==
X-Gm-Message-State: AOJu0YyIWh9bGMHb1oxYhO5AtThFigVVxzbNezq3LtPBM0Cj8Yw0krKg
	uGJGjx/a1iQtXWsVDP3Iz1AFRx8/FQW9tXCO1NYlSmFoc1wewhR1mELa/UvVps79Nqs=
X-Gm-Gg: ASbGncuXY5VqDcrkRx8gUvks1rXT8tTNJxO2EUL27LyFK10NrdpeUMeA2Dn9Rmrmvy6
	8zR8EjrJoahjMPP5dzwWAjuvvGolcy6/6KtDhig6TQ/ED6s0U5+tkWF/TRGH9HtnD6b2d8pIfCl
	lfBrza8/Cv+l1GjdmLkvCk5A9XYVH7uoykkBcvxSMOlgd4SUrtLWgG9GYFolUuXjckYAhVxe0kr
	QJ/ZzLdUr/suZPnOeQIfuUuUVufEC5skUNBL3YGiQ06V3XXf+azjL/Df1P58Hq3GVn3xnliKJnW
	llptJBZICNDkjEGaf2XqAKdWsTzpFyHMJpGeErwPiI8yKmSbypIBsKpviC1bngkn6q0cPB7in93
	aEPqepUAA7Pmq9aOzggDK5yNOhfha+yveNmr1yPWC1TI=
X-Google-Smtp-Source: AGHT+IHJcRqxvxhfNk5q7LamRHRhfUiEMhvBean18E0qgC7uRY11qL6PpxaespWRZGAMiDI1SzOoZQ==
X-Received: by 2002:a05:600c:4590:b0:458:6733:fb43 with SMTP id 5b1f17b1804b1-45b4d854718mr20919835e9.19.1755783460789;
        Thu, 21 Aug 2025 06:37:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4db2ab4asm28937605e9.8.2025.08.21.06.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:37:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 Aug 2025 15:37:31 +0200
Subject: [PATCH 12/14] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Set
 up 4-lane DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-topic-x1e80100-4lanes-v1-12-0b1a0d093cd5@linaro.org>
References: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>
In-Reply-To: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=sucDWngkcc57lEpuqUyMvN5D5nggCib4i3lqmpo2kAM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBopyEaLSvxD8vmZe2M8WM4JfJREm2CXx429V0432lo
 vTKEyi2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKchGgAKCRB33NvayMhJ0fVDD/
 96OZTgHm+92ETPV2lKOqXNAK5CiF2LTcdC2GLWwRNEx0hJgjzDaeZmTVVyxdDzx8VhCMsEcAtBd29f
 M+EwoMv/3dDn3AwniIEPRRPR0lknz6YGMpi3Gax0s/XiZghBFHk1v0QSgSXFqm+OPdUNakGgrqj7Vl
 fvEbuvgYwMSn6tTWLBj+2GDIODgThf3p9tt2F2PLue8UJcvS3LqXY1YqMIMJxpUf3K/v/Nhi5tLBtr
 GPtMYUzQBT21RSWAqqjK+DksmOlZTX9fPvorLL/OWCUAaU7An1l/VsWMnJw04djbbGfR3wyn1WsRoY
 TG4RCg04zgk7mIXA2hSbQWC1seLSjIC32Pdrl3eSZ+sU74xbUL9yDr14YYtAZvL/oLKu/jAdKb0uwC
 DrOxEEruF4TP9Jlt2cfPKSFfP+MfExYh7sCnkRTXWl6IyZCx+Eqkub7t3F9ea9EzJaeKB9Fnupwiu6
 k7wMJsBNdtyeL7PRxDhDAeBgh8LSvwWStP2rNTZS0Ie7lrgI9g56eqwjmSbuMf5RK/yvEdBbuBX78m
 C5D2SeUMrul1WogkK4dRAkq0FKB78wlXeRGnJt0n/ZvE/w8O2IMe7fd5xO8ByhYIhCgrcIx9VTEc6a
 YIVIOsdIwz1inVVaoYxDoeOp3Rz1gwGKKytoqUutfDhMLI6usx6l2uClBurg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHYs to the
controllers now the mode-switch events can reach the QMP Combo PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 71becfc5e6f649299b05b0b93cf74b81dea9fa57..4374692d6da9030462a577279263dceeacb3ce7a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1061,7 +1061,7 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
@@ -1070,7 +1070,7 @@ &mdss_dp1 {
 };
 
 &mdss_dp1_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
@@ -1079,7 +1079,7 @@ &mdss_dp2 {
 };
 
 &mdss_dp2_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 

-- 
2.34.1


