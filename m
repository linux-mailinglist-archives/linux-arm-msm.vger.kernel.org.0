Return-Path: <linux-arm-msm+bounces-82349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2E0C6A1E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 0622B2B387
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF1535F8B8;
	Tue, 18 Nov 2025 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="prci9UKY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC88535E52E;
	Tue, 18 Nov 2025 14:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477549; cv=none; b=Svxb3LRFIAd7vrWRPg8lHz76EnZVAv2kqWqdg4FDTgvUiD6LM1A7iXicDsSw4fLcotkgcOJq6atI32lCmEFNTqKXBbhOl+2kGfwDBrRDBL+z0fTIk69zpMduhEGYFEaM+PCT5S8hfkirUyNTodmdsNw+yusopHyn6Itu4X2sfEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477549; c=relaxed/simple;
	bh=kbh9PjUss38jOi9Yi6sQtRYZLw2ocu42YqZMRP0x2zk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VlytABzv1ICGw4M9z2Dkz2IRObAY4TpY9+n9bhC9pS0nJPYCQmHgkiKmAQjWvSMMKikDwSRToVTrwg0x21o/VZhBpainvSkw2SWbnVjtOhzlet9ixwOyrSORnl1Pi+/yfBP9eXwp1zjTPLNFf5DhZMCbph7EnnYYfz8++KSHkZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=prci9UKY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69298C19423;
	Tue, 18 Nov 2025 14:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763477548;
	bh=kbh9PjUss38jOi9Yi6sQtRYZLw2ocu42YqZMRP0x2zk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=prci9UKYoahpiS2/Kaj9jVdNCeQAqaK7Wt5WR/KV5H2jpfc/zl6vjpt8Z10K44Xsg
	 amSuDxUG5Qfi0930tair7gZeX+T5sV4TGz/3ktp7BBDmB5zrBc75VdlcuVbhNcPJtv
	 79spKY71jx5oTQ1fprwqjShx8DX5SqTbju20HiCXgisFVn8THgSWSoGb/5hzXEPmNe
	 1nElMmFe5CVUaYCHK24Ok6CNcHe+wuQvyGgaAn4GgRRGJn41gc+O7/60/Gm3PphDwB
	 //OmWf10wLR5EyDWBldYjsu+4ChiWTXWo6FkMsqAd2MaVxIZuRuAQYLulBCAAOLNF8
	 Qmdwe8tJrKjyQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61359CEDDA5;
	Tue, 18 Nov 2025 14:52:28 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 18 Nov 2025 15:52:27 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: sdm845-oneplus: Mark l14a
 regulator as boot-on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-dts-oneplus-regulators-v2-3-3e67cea1e4e7@ixit.cz>
References: <20251118-dts-oneplus-regulators-v2-0-3e67cea1e4e7@ixit.cz>
In-Reply-To: <20251118-dts-oneplus-regulators-v2-0-3e67cea1e4e7@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=956; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=asJlnClcHp0fv4e2caydGSPUa8vKn55oet229kJb8As=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHIgrc2s9azOkHbeJ9bWIEeEKidzuyXXHEvmhr
 fruRkFAYveJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRyIKwAKCRBgAj/E00kg
 ctr9D/9OI2nJX0LotRDlNe6zih50k2xZBeDe/8TLxHJvoECawKClZD0W09j1xPnskFCHVykSXA+
 qnjMm4EoVAt3JxhcTgsAy+jPILS2lPS42NsTa/VCBiJV16g1WfzOor3yZ4I4ECmcQ3xijwIw3RW
 VCqcSSLpmD50vdLHH0XI6twkslt6Ujz0mrewwCyoAY8K+8Cu1SZN/k+MA6E3rBSMVS60xWQTDiN
 O7MCW/+8Jkv0ffXyXHa4/LbFUg6dhol3lXlO6ODk1G2sujV0Bj1gP6l+3SIoS7T2ky6M/vfCClv
 NmSWRaqeuGxf1u5c69qYxepe3wGbtWD/ooSvEYRAxppmMGqOELiQ29rh6UKLT8VEttq6EaG+ry6
 107naSm3AGgVv4wltzOaCOMN9mkkvXytYoOFhA93FrZlQ3dCIDSBV+O0QIwkiRP7PlKVuQEqT56
 KHxw+pG+LGaGPE4R+/VhaXiSUbDV4oVu5kpiyqRlbnf+ssjYdJCU8VhLSCrSkHfs1Z+ZTvOONB7
 qFAkueHsYAQMIJGJO/oe+aOVeXO3Wa0tH8ihQVOMKhh+pbBp+BbaIFa6IqFvGXgZyyPcrZGwtyr
 ar2lfznzfipF2rvrQqUByaJqOjAPdMOdSdgkek6Ma7S62bYYqECVZL7UxzTpHaEVHzA+hgRW363
 VvwcZ1Wkn8Kcslw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Casey Connolly <casey.connolly@linaro.org>

This regulator is used only for the display, which is enabled by the
bootloader and left on for continuous splash. Mark it as such.

Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 5845bc3bb80b2..8251f5a2f9475 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -272,6 +272,7 @@ vreg_l14a_1p88: ldo14 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
 		};
 
 		vreg_l17a_1p3: ldo17 {

-- 
2.51.0



