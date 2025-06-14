Return-Path: <linux-arm-msm+bounces-61298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B09AD9F3C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 21:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B159F1897B44
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 19:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B79A2E62D6;
	Sat, 14 Jun 2025 19:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q1bk4kw/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D42B2E337E;
	Sat, 14 Jun 2025 19:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749927940; cv=none; b=qEZ8uqRnf8iUN6YJ80hi2ZYV8Md/LJkY7L3rlC5bKgAqATYFsHVvMk11tRoxH/Hof7r+BTHAQv4EMPRbGZ3z/njcHc778T/gU7ZjdZ414Qu/FG8Zkv2OEC2MpKLMrgaLwJfMSZumAP9JEQkWA+FU3tqF52GgTrcWuhDFuMtnr7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749927940; c=relaxed/simple;
	bh=fN09T6UmQUQWoNlq/d6kzX+pIpQOAEX9dXucr1+vPuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R09tqqVM/ScHerrAL+H8TZ4eY71dqQE9QKo4bAvO/WUPaWM1CZYXkqc7qGtX/7zRpnCEow+IXskkGy4Muq15jj7BT30KNamZRIm7xojB1vix0sGCHn+WsIClqJIlgcXIGCA5QGknQnYv1Yf7CkksxLaqTeK8g6w4/Bg+h0/DkSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q1bk4kw/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA6FC4CEF0;
	Sat, 14 Jun 2025 19:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749927939;
	bh=fN09T6UmQUQWoNlq/d6kzX+pIpQOAEX9dXucr1+vPuE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q1bk4kw/MC1xIPKKf/tXygSnxJkItJXu7jJ/na54aUrzi4yJhVkQJv64tFtexysmx
	 GCJaYMcHunFhkiwpLrXOM439tu+9JlR+qutqauoT+NH5NDQWVMCOnz66tfBDfz2wU7
	 UOvL5oXKtApjIsgOZ4lm0GeyuG78aXPSoUV467n6XEoCAvg6QdrkOeUo6ZsF865j64
	 3j8aNibYcPCvigpXDU445PkZPH+GEWevSMxpYxfgj+kgJjnO9GsLQYMxO7/FALGkWL
	 Jkw/9OT+/X8Uvv6ER/lxaC8t3l344tDyhimWnDBb40DcZw1f7slED5+p6D0Icd8FgB
	 dG7o8p0Euhx9g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 14 Jun 2025 21:05:19 +0200
Subject: [PATCH 1/4] arm64: dts: qcom: msm8916: Drop venus-enc/decoder node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-topic-encdec-v1-1-f974c3e9cb43@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749927933; l=924;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=8ZAmT1qakaFf6PowKv1RpK5ODXDll/OieDMC8RFu2UI=;
 b=XlhVwEj72033jVYgxSgineV+L+w5ICBWSrA74wmwApPPONr5PjjVmYFu/hHKkyceBLKav8rt2
 y8zzXfTAZVxANc1LNnwnUSYHesh4cTIKNe8H9vMkDBcqtdK3bbJiEL7
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Commit 687bfbba5a1c ("media: venus: Add support for static video
encoder/decoder declarations") invalidates these empty nodes.

Get rid of them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index de9fdc0dfc5f9b223ee252b80fc18d45c9bb6582..b50c7e6e0bfcd35ab4f8b84aeabe214fd60e8d7c 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1834,14 +1834,6 @@ venus: video-codec@1d00000 {
 			iommus = <&apps_iommu 5>;
 			memory-region = <&venus_mem>;
 			status = "disabled";
-
-			video-decoder {
-				compatible = "venus-decoder";
-			};
-
-			video-encoder {
-				compatible = "venus-encoder";
-			};
 		};
 
 		apps_iommu: iommu@1ef0000 {

-- 
2.49.0


