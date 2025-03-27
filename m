Return-Path: <linux-arm-msm+bounces-52570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7373FA7284A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 02:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9CCD3BC0B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 01:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4234715573A;
	Thu, 27 Mar 2025 01:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="db6qeFLo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADFC15278E;
	Thu, 27 Mar 2025 01:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743040055; cv=none; b=mTfW6Qj87e6f9JTP02rJUvRbLbr9/svlDv/W4CsH13q/d9XaD5px28rbw3Fz/Ia3UjCBzbfPo688rPKaddakRA00b9VG7tjZ+lpP4kK3PvXVBacKJ1GVFu18OmNMD/OriC2n+39//NqneaHFOE6N5PClu725l+mAX69vy3UFGKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743040055; c=relaxed/simple;
	bh=LSvNgTuST4vU6i1JVVfVhtZFIEwPBopaNJg9sGM65oY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KUI14br685kzr91bH3LMT2Vwoky9unZJsR7D7FWADmeYMBG7CrE3aGVULHB/mz2J3ZH/+WanL2cNgCtluJ8RBxoMfpBXDSrEL1xAlub24lRLks4Hum7f3VHKrcnD0+kKgT9bs6uS48+J1Oy2HAPZZ6ioNiAgKcEVHRpsIxd1GRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=db6qeFLo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80009C4CEE2;
	Thu, 27 Mar 2025 01:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743040054;
	bh=LSvNgTuST4vU6i1JVVfVhtZFIEwPBopaNJg9sGM65oY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=db6qeFLoOe2czgSBv4AfFDw8RJ2onvisLzTviSJ9sOZ/iGsM7jFLxBwzwvF4R+Gks
	 0uzcDGF+vl/uNqhYvQBT/JuOr16LD9JTvN6aMbr50LQTQSrNtH3zPgTmEPFKzBEiOX
	 gjLYsL4GswfBpFWAJQMiw6en3s5r6VZZ27Z0v1nK5WnOytsLFzY0qvzNvrndlsEZS3
	 YD2e/Y3aebxBrDwlC3Hu99Y4VFTIxVVrWWA6j7Sl+mV0Vq0UgEQwMpQI9/dyj1Hmhu
	 /EExcxxdz33ksezwCEHJ6TUG8iw5KiqUh+p8z1Mfy+ioJ4H3XSMUHeMx7lo6Z7toN9
	 OanEzvyHIPp+Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 27 Mar 2025 02:47:06 +0100
Subject: [PATCH v2 04/12] arm64: dts: qcom: msm8998: Remove mdss_hdmi_phy
 phandle argument
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-topic-more_dt_bindings_fixes-v2-4-b763d958545f@oss.qualcomm.com>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
In-Reply-To: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Marc Gonzalez <mgonzalez@freebox.fr>, Dmitry Baryshkov <lumag@kernel.org>, 
 Arnaud Vrac <avrac@freebox.fr>, Sayali Lokhande <quic_sayalil@quicinc.com>, 
 Xin Liu <quic_liuxin@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743040027; l=1429;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=TrY2JGuV6loE+tHO0QsYu5rNVD7CM2Fvdv/2gvxCSxI=;
 b=ECBJpyidl9nyvDfAZI4qozut1QsjwuHt+HRnkSVv7pPn9ig0Kbk+q3VE/6GS5vSAxbC1tEGVa
 Bu6jVpid/vSB0USeV5c8UoQxN7woNuT+8llOMgZgFKL5hZ4FawCX3vq
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The node has #clock-cells = <0>, as it only provides a single clock
output.

This leads to a turbo sneaky bug, where the dt checker shows that we
have additional clocks in the array:

clock-controller@c8c0000: clocks: [[3, 0], [39, 178], [156, 1],
[156, 0], [157, 1], [157, 0], [158], [0], [0], [0], [39, 184]]
is too long

..which happens due to dtc interpreting <&mdss_hdmi_phy 0> as
<&mdss_hdmi_phy>, <0> after taking cells into account.

Remove the superfluous argument to both silence the warning and fix
the index-based lookup of subsequent entries in "clocks".

Fixes: 2150c87db80c ("arm64: dts: qcom: msm8998: add HDMI nodes")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index c2caad85c668df2ebe900bc560e39480ae03e353..8d5a8a3f2c12ee1bc742c7dad35368f140d81dd2 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2794,7 +2794,7 @@ mmcc: clock-controller@c8c0000 {
 				 <&mdss_dsi0_phy 0>,
 				 <&mdss_dsi1_phy 1>,
 				 <&mdss_dsi1_phy 0>,
-				 <&mdss_hdmi_phy 0>,
+				 <&mdss_hdmi_phy>,
 				 <0>,
 				 <0>,
 				 <&gcc GCC_MMSS_GPLL0_DIV_CLK>;

-- 
2.49.0


