Return-Path: <linux-arm-msm+bounces-41859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 824029EFF2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 23:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3913188D7E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 22:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969651DC07D;
	Thu, 12 Dec 2024 22:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMl3HLAi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680A31898FB;
	Thu, 12 Dec 2024 22:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734042027; cv=none; b=r482oOx1cnuwmmG4oCmSK3d8Lnywic2waXX4PjVub3pWk6JbTS1X2hSDLKwtsye+8f4VYXT0bwUBxc5uhSHAwHfRcQ6jZzYJwCSqG4VZ2o1+DYzX6gP6VdPiUT34y2/3ExFvvSEUqZAmThrLiq8D4OD2hExE0CIgXOw2S5gkbpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734042027; c=relaxed/simple;
	bh=Euez+aVTh49Mk/2aVnr4lDGpmD6U9EafApiYnIIo8Qk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rLoZHX5wmc1VMmDQJZCKutnamyOPs80Zwe9oEauKqoTwTl9Z3MeUXeh7h97B+hUDNTu2OeVWuhSbxTITflArI6e5ugG/HgJc7cbQmlpah5Z60AS+77pvzLKWWcAaYV9KWMSzlXqHjsjGuVaxikG78BW+rwZ9IEbS3Tq0WqjYkvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMl3HLAi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92D0C4CECE;
	Thu, 12 Dec 2024 22:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734042026;
	bh=Euez+aVTh49Mk/2aVnr4lDGpmD6U9EafApiYnIIo8Qk=;
	h=From:Date:Subject:To:Cc:From;
	b=rMl3HLAi94TZEwbzVW7r066X0WVDRn4Wrm3d4hBHpzJK5fG8VLLJRmhr3jGWn04LZ
	 inzesMZYRbXReQjbIi/PCi22qKFFv7OtN7dXJoAdB1D+OY2PUXf+o6BRQTo7lqu4Qr
	 PhjoZ+bKYFy7r6znkjq0iLwcKL9HTMMM3z78cDUuCWnz7/ZZA/mrA6lOZEIakLVQsE
	 zDwKGncKu5V55qYqa5QzcM+udJDqkGeysnis38t04KRhG9zpveecS/lSouJ1lK9sJy
	 y00Q8e1qI0x9q7rKtNyAq3HgWICmtdMP4mJN0WoR1LFfPsdrV3qzDz62rkygrvJeyB
	 zOk56TLN7+4hA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 12 Dec 2024 23:19:37 +0100
Subject: [PATCH] arm64: dts: qcom: sc8280xp: Fix up remoteproc register
 space sizes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-topic-8280_rproc_reg-v1-1-bd1c696e91b0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHhhW2cC/x3MTQqAIBBA4avErBN0Kvu5SoSETTWblDEiiO6et
 PwW7z2QSJgSDMUDQhcnDkeGKQvw+3xspHjJBtRYGzSozhDZqw477SRK8E5oU6bxtrI1tr2tIKd
 RaOX7347T+34SePqDZgAAAA==
X-Change-ID: 20241212-topic-8280_rproc_reg-15c636427963
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734042023; l=1873;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Od5FRWnmYJBcQ9mV22FaCDysBzrqiaL4nHuQZFMLqjM=;
 b=M165IkQlL6xZVmj+X/ISVja5iTJPoyq8KDkYcCVaHi9at1EsHtiNb++fmR8r7QvrrGS99eC0D
 ooBPFpn0p63BqwNL9Sd0nK7h2e7AU/WRJZM0RdQs2t2urv+CCimm1mt
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Make sure the remoteproc reg ranges reflect the entire register space
they refer to.

Since they're unused by the driver, there's no functional change.

Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index ef06d1ac084d3205a149feff880f457822dca2b4..c97d1eeaf890f7ac2814297bff299c0bdd0ddd04 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2743,7 +2743,7 @@ usb_2_qmpphy1: phy@88f1000 {
 
 		remoteproc_adsp: remoteproc@3000000 {
 			compatible = "qcom,sc8280xp-adsp-pas";
-			reg = <0 0x03000000 0 0x100>;
+			reg = <0 0x03000000 0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
@@ -5254,7 +5254,7 @@ cpufreq_hw: cpufreq@18591000 {
 
 		remoteproc_nsp0: remoteproc@1b300000 {
 			compatible = "qcom,sc8280xp-nsp0-pas";
-			reg = <0 0x1b300000 0 0x100>;
+			reg = <0 0x1b300000 0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_nsp0_in 0 IRQ_TYPE_EDGE_RISING>,
@@ -5385,7 +5385,7 @@ compute-cb@14 {
 
 		remoteproc_nsp1: remoteproc@21300000 {
 			compatible = "qcom,sc8280xp-nsp1-pas";
-			reg = <0 0x21300000 0 0x100>;
+			reg = <0 0x21300000 0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 887 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_nsp1_in 0 IRQ_TYPE_EDGE_RISING>,

---
base-commit: 3e42dc9229c5950e84b1ed705f94ed75ed208228
change-id: 20241212-topic-8280_rproc_reg-15c636427963

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


