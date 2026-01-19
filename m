Return-Path: <linux-arm-msm+bounces-89701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 575B5D3AEAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32BE73038324
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB44389468;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPIFGpr9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60832387596;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835585; cv=none; b=SV8Bn3U/xNT+ikLIPANz61fnpyNfjWSMu756+q2Rgo+Ln5WZMIoudWUbSy/0AiRtB/ega8Kbv25DNHNW3bRA8rf+x89yBCw/d07LbgtCzgSvh4lNLRKErOWkkglrg/uN2C4vxZ2WcKTWw8Xb7y+2DYF6CJ0FARJrPzr/bGwY1YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835585; c=relaxed/simple;
	bh=xSed7ku8GbjuhfMyH9R1okVBc5yBchUojM6SKDGw2mQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G+RZQCe4jPveNJmo7raYmuXMabR+NjwRCnC+6GJn+cy4eaPZW0yz+EkGFtaNF+lYGieeuDidk6fb95PrJdHpSgRrj0iorkcG/j5HfbCG4s1uXNzu5RTtogDh1y8OLOphFmfCcOAdHZWD/AzEoxym45KyJpYPvkGeJeI0z9vKRBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPIFGpr9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21B5DC19423;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768835585;
	bh=xSed7ku8GbjuhfMyH9R1okVBc5yBchUojM6SKDGw2mQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gPIFGpr91lR7GLkQOzGuqf9o039tm4TgNNDcaFVYvnVINF8+mEY7td/mRQGDkLXZW
	 pgmGM6lLPajLqVPsOK/7CHD83he/QlcKx7aNZ2+Yh2MOCpxgrAGztPvCNVU8k3Un3x
	 qzvn5PMCVG5UoiYQE2D73kHsuzNUp3wXa9KHs62KJelaewSR0XC8+isuJzCLbsOYBq
	 X/FRTN4lQwXOH/OqyI4gIkKeUt8PcwGBKgDt3VPlnnyjlCDLlChcvOkf5x64cUdSFF
	 y1TrDxCKOOGiYhFqZ5rNtLLbFSBfBB9qjYyhhi84a73W+CmFft4aLWkf2I1iYydf4C
	 /ZlkzGIIMUfIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EDDD29C37;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
From: Biswapriyo Nath via B4 Relay <devnull+nathbappai.gmail.com@kernel.org>
Date: Mon, 19 Jan 2026 15:13:04 +0000
Subject: [PATCH 2/5] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable RTC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-xiaomi-ginkgo-features-v1-2-3c8fae984bda@gmail.com>
References: <20260119-xiaomi-ginkgo-features-v1-0-3c8fae984bda@gmail.com>
In-Reply-To: <20260119-xiaomi-ginkgo-features-v1-0-3c8fae984bda@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768835583; l=669;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=EQrK75ZNsaIFDozIKUYCVxzfxzc63MGvpxtCaRdfcUE=;
 b=XLOQNh9YRaxFc2SPTPtu8zamMUSWtWSi2IAFBrJsE6G9C7aCEnJgmlFt5XXtuHeUn5uUuu6eb
 i6tzprWuA7nDsh2EpW2F/y/uKHekCmLxvJ8zXMK8Mzqxbfo0PoYav+C
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Endpoint-Received: by B4 Relay for nathbappai@gmail.com/20260118 with
 auth_id=607
X-Original-From: Biswapriyo Nath <nathbappai@gmail.com>
Reply-To: nathbappai@gmail.com

From: Biswapriyo Nath <nathbappai@gmail.com>

Enable the real time clock from pm6125.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 6e0333378..673bc92c7 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -111,6 +111,10 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&pm6125_rtc {
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };

-- 
2.52.0



