Return-Path: <linux-arm-msm+bounces-69393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5AFB28490
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 19:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7300C585849
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 16:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D81B257840;
	Fri, 15 Aug 2025 16:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4Eyik9U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA8F2E5D1A;
	Fri, 15 Aug 2025 16:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755277014; cv=none; b=c94+u8ohNJ20trCOnQ10Ulvyj5H4mecHIC2kaNdT/fhCpws6C8UiM2NSQasJvS3MeZFR6V88Mu8hrtQ0VRvEuTiZQIoNg9Q5yqjhdOs4m2IeRPWnz6/cng+pofZ8Av/RD/9+1+UGaK3MsxM3zBvCPfh8gDPEAed2M9BTzztAheA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755277014; c=relaxed/simple;
	bh=rBXgpysoY+gnq8IhpusCOZ76mZReBd5LL35VLZtWing=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lw5gALKqZY5lNAzl8fjVGkXGZ2YKrPdw7ugU6fGo/N9WjKxhCxAlrHGNlCnTcSLyuLRpUEqfnyY1WcXsLGJmtMzlnmfhwWfXG7NnIfT3e0X67TsOzQZzcQ5lxvSnFqIJ+U5tHl+1aUnZv3CVe7fJDrZ7SEPYlXPzJf9zARjPwTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4Eyik9U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07E51C4CEF5;
	Fri, 15 Aug 2025 16:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755277014;
	bh=rBXgpysoY+gnq8IhpusCOZ76mZReBd5LL35VLZtWing=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B4Eyik9UkkAlEbX0OnSHoqBYoyssGw0JdsEly7d9L5VfGVtxVEeZgyThRKz9PfpnC
	 GN7eCEp9mXISA8fHwBWoVv7mhzBkprZrShfTn9sEabwijxlwUHxDP2WEUgosBELL9b
	 UsCbpvpZ8qNnlfRa9M+pAsLIDwXDoCXjvdneHLo9Eaz9hVxYhVd5D5o26YHF2mL/Hh
	 kCZOpXy2jfOieF1JtrUclUlEHfHg5sgG9C3zB8UHA1djgS7oog98swpjI1k5j8yXpj
	 08CmBhtGdDNPD9DhIXvmdF19qnIxzc5LMceiBD+EOY6ZphHnnvqPsJFYhTZ8WL6GMW
	 rbE7s6z8cmjTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3360CA0ED1;
	Fri, 15 Aug 2025 16:56:53 +0000 (UTC)
From: Nickolay Goppen via B4 Relay <devnull+setotau.yandex.ru@kernel.org>
Date: Fri, 15 Aug 2025 19:56:51 +0300
Subject: [PATCH 1/2] dt-bindings: clock: gcc-sdm660: Add LPASS/CDSP vote
 clocks/GDSCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-1-c5a8af040093@yandex.ru>
References: <20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-0-c5a8af040093@yandex.ru>
In-Reply-To: <20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-0-c5a8af040093@yandex.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nickolay Goppen <setotau@yandex.ru>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755277013; l=1259;
 i=setotau@yandex.ru; s=20250815; h=from:subject:message-id;
 bh=AoBDT6b0uXhJ4amBaHImHoToM08z45e1CvJ1xPwygak=;
 b=4W9WG60wNXi8SMokbFHuJMZ+BxikzBsYa8aObjWofHxKtTW/yhkFLY68bceJcXpnKMzenDqFs
 tJepivwLnSdAtDREvFd+YVm+pEbp2iXm/aKSwM670nkQURMxcsu04mi
X-Developer-Key: i=setotau@yandex.ru; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Endpoint-Received: by B4 Relay for setotau@yandex.ru/20250815 with
 auth_id=492
X-Original-From: Nickolay Goppen <setotau@yandex.ru>
Reply-To: setotau@yandex.ru

From: Nickolay Goppen <setotau@yandex.ru>

Add defines for the missing clocks, which are required to power up the
related remote processors.

Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
---
 include/dt-bindings/clock/qcom,gcc-sdm660.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sdm660.h b/include/dt-bindings/clock/qcom,gcc-sdm660.h
index 74c22f67da213b8e54109785a564d3be756fd6c6..f19018b742f5ce7f96fad99c126934347cececae 100644
--- a/include/dt-bindings/clock/qcom,gcc-sdm660.h
+++ b/include/dt-bindings/clock/qcom,gcc-sdm660.h
@@ -138,10 +138,16 @@
 #define GCC_UFS_UNIPRO_CORE_HW_CTL_CLK		128
 #define GCC_RX0_USB2_CLKREF_CLK			129
 #define GCC_RX1_USB2_CLKREF_CLK			130
+#define GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK	131
+#define GCC_HLOS1_VOTE_TURING_ADSP_SMMU_CLK	132
+#define GCC_HLOS2_VOTE_TURING_ADSP_SMMU_CLK	133
 
 #define PCIE_0_GDSC	0
 #define UFS_GDSC	1
 #define USB_30_GDSC	2
+#define HLOS1_VOTE_TURING_ADSP_GDSC 3
+#define HLOS2_VOTE_TURING_ADSP_GDSC 4
+#define HLOS1_VOTE_LPASS_ADSP_GDSC 5
 
 #define GCC_QUSB2PHY_PRIM_BCR		0
 #define GCC_QUSB2PHY_SEC_BCR		1

-- 
2.50.1



