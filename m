Return-Path: <linux-arm-msm+bounces-50247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 130B9A4E956
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16F837AA8A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066E3281346;
	Tue,  4 Mar 2025 17:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGYo0f47"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1BA25F979;
	Tue,  4 Mar 2025 17:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741108261; cv=none; b=iGjUh/dG3guyzeYDLN26g0EQ+L0kRvYJQNwnkcNPORoIicswOZgrAbWuKiyfyJgWrCOaz9G8EzfQZheGl2urNGdVFbfB2Q6Ury48YwODN1gJEjZD6/zE4IztXc91ZvMFbP3pMYE+P7cVRd5zKBWuND81VsPN1n13dTuvIaDZMtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741108261; c=relaxed/simple;
	bh=QyJnJjJ/lXLnZyjDS28b5GSFwV9FD3aP+4XwcadNkRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GBvbkuYUNurxcqRUuFTeDWwKye3926VzeVNr/b73xALqNPzpLN5/lrwarfJhwK3wptDKH2mtLGyWS16OigyLyuOplx2x7qQSRCY8+WV1lOVSLefACltJTUR/5b1Zec07EN/3wtiRh+zdWNrDqibbKp101FsL7wEjH5FYb02Sq+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGYo0f47; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746AEC4CEE5;
	Tue,  4 Mar 2025 17:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741108261;
	bh=QyJnJjJ/lXLnZyjDS28b5GSFwV9FD3aP+4XwcadNkRM=;
	h=From:Date:Subject:To:Cc:From;
	b=RGYo0f47bdIphAXi3nG487Me7SQvi3vSP8HlcI1krepoc4UIgzfLABTZlLoOOYEd/
	 vFjRPpa8mV2DKyp63Z0hnG4BYKK2A8gKBlyiQxCfuNsSrc6h+MFtRio80jn3RrdsdH
	 1Ypn9wEvG2YXqlWYFZSUwmDZ5a6Ze7EyhR+ZIojN0M3O+JRsGeGrho7IjgrPDns68p
	 O1bkgcSAUphQluzSh8pco38/wZn80RA4ZLOgqtXzGFU82K7aeVbbb95PiWxi+icVnu
	 axyq/oDmmp5VqJMHb0i6cUoxhRs6fQnM7wvUxf4M9X56lbLLhUxIn0vhG8Bo53BiRJ
	 f6xmAKe5Bf9Lw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 04 Mar 2025 18:10:46 +0100
Subject: [PATCH] arm64: dts: qcom: x1e80100-romulus: Keep L12B and L15B
 always on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-topic-sl7_vregs_aon-v1-1-b2dc706e4157@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABU0x2cC/x3M2wpAQBRG4VfRvjY1ByKvIknjxy7NaLak5N1NL
 r+LtR4SJIZQVzyUcLFwDBmmLMhvU1iheM4mq22tna7UGQ/2SvZmvBJWGacYlLHaALX1aB3l8kh
 Y+P6v/fC+H9PfDDJlAAAA
X-Change-ID: 20250304-topic-sl7_vregs_aon-1201ee52ce83
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741108257; l=1496;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Q1raCAdNlbWo+epSFVrbDIAnmmxs+X4h74jjAxQUfLU=;
 b=IgCjeXZpbP0EeY9TZrvIxpTFUsVbsEiCtkLNSlhtHr/5lSuxS8wjCBfFcFaacDGfZmKXuNfuJ
 pKaHFJs9pPWBF7BW4EaRURpD3WMB3vJTE+yTLQhnlc99aoiPrEESgUJ
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

These regulators power some electronic components onboard. They're
most likely kept online by other pieces of firmware, but you can never
be sure enough.

Fixes: 09d77be56093 ("arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices")
Reported-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 5867953c73564ca7ae1279b73f6834aa1d732792..6a883fafe3c77a45e045beba8357d67caa88dabf 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -510,6 +510,7 @@ vreg_l12b: ldo12 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l13b: ldo13 {
@@ -531,6 +532,7 @@ vreg_l15b: ldo15 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l16b: ldo16 {

---
base-commit: 20d5c66e1810e6e8805ec0d01373afb2dba9f51a
change-id: 20250304-topic-sl7_vregs_aon-1201ee52ce83

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


