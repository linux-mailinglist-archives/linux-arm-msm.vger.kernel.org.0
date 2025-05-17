Return-Path: <linux-arm-msm+bounces-58268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E409ABAB68
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 19:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 382E8189F1D4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 17:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8012116FB;
	Sat, 17 May 2025 17:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QjjyPP3G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB2A1D54FA;
	Sat, 17 May 2025 17:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747502898; cv=none; b=JuoSO2SbY4VmL5qq/v63nyflCSGejWUkYfMFIpcthLJFRhkBm7kO9o/n5d7HZIUG4+RYcAVrAj+2LSK84xCHFDgRVeQr1o3M6IvwSWWiduERlqS9sFSVl/p3nlJqMEXLsONCrwyKXq1UyJ8pGSqy5FZjSh5TC/nhMxWOetmrm6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747502898; c=relaxed/simple;
	bh=QXNhEHu2ar499BueqOxPMpoBZrKZEwfn1UQPRy130gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LJ2TjYijBsdosmHsxqW+Pv/Dk7Yr+LYHtxRlVIOjKgkV988UZM/EeN1EhjWq47uUQj1ZNyxaroL1a3GKVA9e2ehRWjrun7urIicaFojcXTmAmcZBs1bxIJvS4fD8et1ln6iqDUVCBneU2FWCkkJpiaa4DcwbFwd/NeRsEMuHcug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QjjyPP3G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9A7C4CEEB;
	Sat, 17 May 2025 17:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747502897;
	bh=QXNhEHu2ar499BueqOxPMpoBZrKZEwfn1UQPRy130gk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QjjyPP3Gm/kutL2hE7geWNYPmjSh60pvkeea6EojvZd1r+2vvP4AQXyq2Orr55Y6Q
	 wrq0YCg6pkNBQZty1Ab27IhtIrmuOxc2QyPqTHG+p+wuPQ2Kgt5uBAZzmazvMR3nqN
	 nADFIwto6rM2cnS72Y7/YtxIVXmiHu4uECeaWYmcb2K8AIOExbfF8D9Pp9pKf5vU7F
	 BxS5W4YZWCaOlbTxelP8yEcI064GzKmzErGB1oV4lN2jOLyEnIm9cbANLxECD5JNmj
	 f+TYBO0vwseli9cwu1v3Bfxx8bZw/tna2I8WWbb35QpPU/Rihi1ftPnFzmsVxYYNjb
	 jKtXgNbY3+tTA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 17 May 2025 19:27:53 +0200
Subject: [PATCH v2 4/5] arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s:
 enable sensors DSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-topic-8280_slpi-v2-4-1f96f86ac3ae@oss.qualcomm.com>
References: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
In-Reply-To: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747502874; l=933;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=tSOwtYnZZ0SyYAMbjuyBvUPHokHp58zplXRrov7im9o=;
 b=u3yjIFQufvVbezCszu4kedb9XMQMV0gzKNTDknaZEpa500ho3eaOKa+rv8+L7e8M0OtM2EBHR
 sS88c5/kzieC1l4JAuRe0B2Kjm1hxdqYBn3Mh5q7ym0ad+6CHLMJ9mi
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Enable SLPI / Sensors DSP present on the SC8280XP platforms / Lenovo
X13s laptop.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d36fc1ebe50e8baf73e21bd571f716e0152aa624..ae7a275fd2236a2c71808b003fbcb66687e6e45e 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1175,6 +1175,12 @@ &remoteproc_nsp0 {
 	status = "okay";
 };
 
+&remoteproc_slpi {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn";
+
+	status = "okay";
+};
+
 &rxmacro {
 	status = "okay";
 };

-- 
2.49.0


