Return-Path: <linux-arm-msm+bounces-51804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B04A67C08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 19:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69A6C422D65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 18:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACD72139D8;
	Tue, 18 Mar 2025 18:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDTxSFgE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0AC211A0D;
	Tue, 18 Mar 2025 18:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742322944; cv=none; b=IzvqChuLKc7lGn20wAgyja1OzURbhjm8DZJeH+ZyVVg82qrk9f4WXJnq4e3ngIW/8bhFxAQMvB6ClV7E5QR/EVf0p3HewEn2sI88hXlBSIMBDteqOuMwt5Ri1uBwPeE8GLnrnKBPO0By3cVR9JNRcnYCZ044w6UfqBY3WtpYELc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742322944; c=relaxed/simple;
	bh=lb9q/iTzHtRiGTIZskumXdymcp8Ma5jDvxytpGDrCaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oOnPCRUu2DmzfLPpbbn6vEFlrGgXCtnUq+ltmT3W/Hf7m8+ebzwfSj1ldCRyRfyiKAtyKYvt/fg/3iVF3gv1gv0rcje9bg+QP24ThPkAaFrnVeeNa6OhuDqW8BSnH5B/6q+XGlyatNG7WXd8+Uc5LSC2i7l8vtp8goDYArBfREY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZDTxSFgE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5AAC4CEE9;
	Tue, 18 Mar 2025 18:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742322943;
	bh=lb9q/iTzHtRiGTIZskumXdymcp8Ma5jDvxytpGDrCaI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZDTxSFgESvZNqCZaeELbAqmpQDv6sDw+AQBKI09J+B5xJ9u7icMjEKhTEHa6C5XX6
	 hW3xDXLfz2GfBkY9+Qqclt/on/INwa9IdKxCayfgRSU5/f3o7xeCyrVC3lcr3V4i8M
	 liTLkvBWypmQo7QdvXYYzScpAjFxzMgDaT3hgsithFkxEUmaSSI+4IqeDmkbj6O/Ns
	 7Isg45+dYJroF37wg6dfu2HeUe9QS69VVw0ip4DKzAb0V3F8XRto7ayBy4IIgmg6Yl
	 TMPiFKm1ywUTDeXkNZwAdx392OWD85nflpU/xY0YrAyZWr9eAIHLjlNoj/badj6Ho/
	 VqcTD5Yh5fF3Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 18 Mar 2025 19:35:16 +0100
Subject: [PATCH 3/8] arm64: dts: qcom: sdm845: Add specific APPS RSC
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-topic-more_dt_bindings_fixes-v1-3-cb36882ea9cc@oss.qualcomm.com>
References: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
In-Reply-To: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Marc Gonzalez <mgonzalez@freebox.fr>, Dmitry Baryshkov <lumag@kernel.org>, 
 Arnaud Vrac <avrac@freebox.fr>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742322925; l=1059;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=iwi7S4cQ6jnTkWIbV/OQXhe1VRG70rGkSOrjnWJ/opE=;
 b=rtH+3pvm6MbWm0he6RFbh3tmJ+k2E1GbUOi8eF1po2htYfBqbGh0BzJxCa6PS72pNJ7YRGZGW
 ScJmtC0aW6bBWGfdQtqZLgr5KMTfKG1uKRY/8AbaiuQvFuSnMpcVboM
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

SDM845 comes in a couple firmware flavors, some of which don't support
PSCI in OSI mode. That prevents the power domain exepcted by the RSC
node from providing useful information on system power collapse.

Use the platform-specific compatible to allow not passing one.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2968a5c541dc0a6c1c28e32160c4c40a8f332497..4466c08a8bb08075d71835e04733ff4dbf6f190b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -5264,8 +5264,8 @@ apss_shared: mailbox@17990000 {
 		};
 
 		apps_rsc: rsc@179c0000 {
+			compatible = "qcom,sdm845-rpmh-apps-rsc", "qcom,rpmh-rsc";
 			label = "apps_rsc";
-			compatible = "qcom,rpmh-rsc";
 			reg = <0 0x179c0000 0 0x10000>,
 			      <0 0x179d0000 0 0x10000>,
 			      <0 0x179e0000 0 0x10000>;

-- 
2.48.1


