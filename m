Return-Path: <linux-arm-msm+bounces-61300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 696FAAD9F43
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 21:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE5277AA2C2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 19:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7AD2E8888;
	Sat, 14 Jun 2025 19:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CS41uJV4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55C12E8880;
	Sat, 14 Jun 2025 19:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749927946; cv=none; b=rIrWBZbdCRkRR2ZYMPvsG75WC0cvzZfpHhNP5D02uUJT4K4HNijhXPnTEWh6wyo2VZ8u7n269yrj3wVMrX1Hcj6c/IWFcEZAL8ap57kvYjk+Bgwb6ZTaWWK9BK9ZOFJtli/NJ7CQRglqUbKIteG/sc1GQmwJc0DHj+qKPDgCpl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749927946; c=relaxed/simple;
	bh=PzOxgqyTvfdrY75GBArryO51hIaCU6TCtSIHCi2MrOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dJtrpUm/IHK7m7dRSTwyQJ5I9Ta0jpPapZJSf6WgaIxoHwrUS1Y1i8m4aqBfHhT6dJm77RZIBrAJuiIgeH2i65qv2farHzwEc0V0GTliLWjtKfEw/14jTQJ7CwV7DREhrzA2Hv/S8K68WxT9wvkK9jWP1xIcAoY4zKYEbpq4M0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CS41uJV4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C984C4CEEB;
	Sat, 14 Jun 2025 19:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749927945;
	bh=PzOxgqyTvfdrY75GBArryO51hIaCU6TCtSIHCi2MrOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CS41uJV4zsh/eyw947gPmbb+H8oS0ZNxSE0JlPmT8W6jnKkZ5OcajeqMPEtvWkJDM
	 k64pagzadO2zNnWEwBrqUfMzjboRR9JqC5NXd8BYGsyzrXN50sRcjs4jM9aSK4L1Wz
	 1SjxygnvfpAJOCllmvkXq+BRygO2R7OD2o90R+TO6ndNNwTXAk7RAPXXAEYzFHX4Cd
	 iJaf/FFHBy4OleMCPVieGUFeMthGFd1PLZzMg4xxolv+dqmtDB0wiAKH78mjfryc3a
	 ds5qdXiTqkUFx+x99kRQg8aZUr8a2b3HiUBX39XxYKqpYwd5gQG8VkbMlLbmDRxYnx
	 uYNi4PJZDqRcA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 14 Jun 2025 21:05:21 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: sdm845: Drop venus-enc/decoder node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-topic-encdec-v1-3-f974c3e9cb43@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749927933; l=892;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=tiAlmdxAzSMlXOJ4EgHpuS9GBwMk1Wztuv7hHcSlENs=;
 b=Hp08jZS+k2cwQPyvD5eTTkOpw/jnAIiJaehfLNHZaE1ZWU8/fKCVh5JbPQZrDM29xRgRO8L9W
 K3btiTI8F9rCu68tmyNQDl7pjAe2LDOB0M1iS1C5CrZ6cATuD9ayxQU
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Commit 687bfbba5a1c ("media: venus: Add support for static video
encoder/decoder declarations") invalidates these empty nodes.

Get rid of them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 3bc8471c658bda987d6fcff3359d63b367148e89..c1b77d1d1ef9fc1c7dc75f4452cecd02d6d7b588 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4254,14 +4254,6 @@ venus: video-codec@aa00000 {
 
 			status = "disabled";
 
-			video-core0 {
-				compatible = "venus-decoder";
-			};
-
-			video-core1 {
-				compatible = "venus-encoder";
-			};
-
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.49.0


