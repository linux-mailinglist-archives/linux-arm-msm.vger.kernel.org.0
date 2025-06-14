Return-Path: <linux-arm-msm+bounces-61301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A4BAD9F45
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 21:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB42D1761FE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 19:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD332E88AC;
	Sat, 14 Jun 2025 19:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UsI/uxi/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D8F2E88A7;
	Sat, 14 Jun 2025 19:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749927949; cv=none; b=jzcJMfPdv1fVSF+kI4feWoK/i8QfNsGW8sNc1fnl535MUORPq5w/s+Hf1PEiFK0NZzW92RgDaK07ZL2ykBJQTQoJBIqsZsKJGM5rAAmIq/w8wmyaIrFpmi7eSFSkpeP3EEt7igbfp0ZisIJ7OKAl+Drj5GzANgqwD4LIfwI58BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749927949; c=relaxed/simple;
	bh=RGHN4La1oPMm89bxuBz+7M7X6E5lGzORHVP9hj1Vw7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dz177p5vUJrVk15K/Fzp56kblFQFrZL01yQmPbq1XRnPMP0Q2q13UcC1V0YAsH+1gBAbsV9ir1EdURPp+t/bNeTGlyH27LhU5W+C1CCQXtJPs0s743VAN+wmHwcJT3v/oqFOR2dKzjL13uIw1tc5Z/R3YyuaM+kNYHVdpJYkhEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UsI/uxi/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FC2C4CEF0;
	Sat, 14 Jun 2025 19:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749927948;
	bh=RGHN4La1oPMm89bxuBz+7M7X6E5lGzORHVP9hj1Vw7A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UsI/uxi/TlKM0/ewlzOsse8tk3YbE0XQDaLzVulL3c8ObS7OMpFeWS4pZfnaqmhEc
	 MZJzhfwj2aRbMb58yW+ioUa8KE/HfhBxw182KWgexsPFxU0DmloDO5inSKhVJC678P
	 VXlBBeZxjUMPEoqm59i78Y44Mv2WIOxDgt29K95sP9g+jsHv3dsZ1aWqoB3c52GB1o
	 /mI6dmB4wQV8bEAvkFnxH0rh8oI0XUAmE4A8Y98lSY2Xr5I4yBRi5xzgDG7b5t4ifY
	 7ZuD4kXz43VsuG4yILr9R069xRB71MWP7bReTCDp0o+M2O0OqePCWWJ5Ia0+i+80Dw
	 D7Z8KWt+p6Gpg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 14 Jun 2025 21:05:22 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: sm8250: Drop venus-enc/decoder node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-topic-encdec-v1-4-f974c3e9cb43@oss.qualcomm.com>
References: <20250614-topic-encdec-v1-0-f974c3e9cb43@oss.qualcomm.com>
In-Reply-To: <20250614-topic-encdec-v1-0-f974c3e9cb43@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749927933; l=896;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=DZvSEBYcxVcEiRSqlHyIXZ0s+XkUOtOjHbSZuhRe+fA=;
 b=yu3fd3zd3A37AtjU2UhITBci1a5t9RMSDHbYy6p4KOVquoMq7Obiwm11EU7fBT94esm3ICxyQ
 8rdyEwtaFwKAYs5c61rTmKOyYYnEc7ohjP1Rl84BdGuw3IFsMT0X6zm
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Commit 687bfbba5a1c ("media: venus: Add support for static video
encoder/decoder declarations") invalidates these empty nodes.

Get rid of them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f0d18fd37aaf467516169bdb4c035617aed04e8c..7a647ba6177d11ea10a303e153d19af11bdcf50b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4332,14 +4332,6 @@ venus: video-codec@aa00000 {
 
 			status = "disabled";
 
-			video-decoder {
-				compatible = "venus-decoder";
-			};
-
-			video-encoder {
-				compatible = "venus-encoder";
-			};
-
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.49.0


