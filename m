Return-Path: <linux-arm-msm+bounces-58269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96143ABAB6B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 19:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FD19189F30B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 17:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B09212B3A;
	Sat, 17 May 2025 17:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LcualHrz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2326A20E700;
	Sat, 17 May 2025 17:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747502902; cv=none; b=nXzK2QJzt5xKL0Ent+CW/dw9Z9OIOxuMFpDG6QEgM0DS2zYJwcR+o+L2X6jxr+7cnZsdlVNpeRndyqSz/tderhfJhBmczM9NOYnWKVUFI+bTUaXqCYlmZWfMBqxQLF6LKEvL67+O3GOS6+sZEJrtY+uOvGI9Kkr0rchWUF6EaBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747502902; c=relaxed/simple;
	bh=bFX99d4iDUfBKROlNQmRvgt2RP+a/LFomqFqS1jbu0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PiHT/scLHRQDfvAyntjiE9I8myQBQGdWRfMZOdljed1BChiyl3dg9SorASZn4YMlzfidUufjUV1fvxMnrEGGJm2crxgMVcsR4LgDUyk2FxTh+BFIfYa0Mz81hljWMQ/r74VC9DC/iu5QGKKTOAcvJujkEfKWOlocYaLsj+dYJ9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LcualHrz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4464CC4CEE3;
	Sat, 17 May 2025 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747502902;
	bh=bFX99d4iDUfBKROlNQmRvgt2RP+a/LFomqFqS1jbu0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LcualHrzutnL8XGO4j7F32DLLaiGZyRVUE44I1SCBpw1I7eCZ9+FnYluVcNjHm2ic
	 r2wf0VUGTqGW3NmNL/ajWipicTKjk5apvm0qEZKT0ZrX1w51uNjRkKWSQdpyYtzjzi
	 TTJ8+gbTnLUbyyYNdos2TDs6MGXSuUiZUO6jOrly6kPhsHkGIKoty0Nq/8+fBkY6l5
	 MQYuswPvkQV2cCgfTxxSH6SKVysiV0tEK84cB12BVJ+j+gZ/iy7BToP0hKrOmfD72r
	 8MPXJehEpfe7A/ypA/oR2WgkHdTyevUKy0IlX0XPARegfGVBGFOT4T2Cqutzeo1dND
	 lLm6FbGzrZ4ZA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 17 May 2025 19:27:54 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: sc8280xp-crd: Enable SLPI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-topic-8280_slpi-v2-5-1f96f86ac3ae@oss.qualcomm.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747502874; l=786;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=2wD84tJ8gt8pgUvujCw2PohRr6DpmIenOHQLwyQ9MuU=;
 b=IWLbbVPyTdtTzkwCrpCBhhIMOgyIDpw1RMjdrPri+hyUdSEgbY+jdeGYAlcXJrGAyICnW2+o6
 6hDt7w/JEXYDuvaLwMiAR/PmNhdXUoyj2j3GwI0qVGBPxUQHXL/5ATD
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Enable the SLPI remoteproc and declare the firmware path.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index c4a5828be9353de0e4215b71a78ed5ca8e4b6b8a..8e2c02497c05c10a3a5a43a6002467736a3b7f95 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -751,6 +751,12 @@ &remoteproc_nsp0 {
 	status = "okay";
 };
 
+&remoteproc_slpi {
+	firmware-name = "qcom/sc8280xp/qcslpi8280.mbn";
+
+	status = "okay";
+};
+
 &sdc2 {
 	pinctrl-0 = <&sdc2_default_state>;
 	pinctrl-1 = <&sdc2_sleep_state>;

-- 
2.49.0


