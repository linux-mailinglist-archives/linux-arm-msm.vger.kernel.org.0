Return-Path: <linux-arm-msm+bounces-83884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FFDC94967
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 01:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E99354E1C57
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 00:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1B91862;
	Sun, 30 Nov 2025 00:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvXffbns"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7770417D6;
	Sun, 30 Nov 2025 00:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764461303; cv=none; b=cwWGKqfYpAG+MY56Eokwp696m9CQ1GF2LkPUxaUphztGQoRbFRC63LYrvwlhDcXSIj7C4PD79g7/eRhQb1lEXim8j56IEhWZp3n8VGuvlclG0ziG5+kT7WZPreVSnmRmiGSHIzkRRPLRsLNuhLhi0iuRogi+YvlVPArAgyVntvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764461303; c=relaxed/simple;
	bh=cC21v9mFYe2j/770WeKb3fcKEuR/IXGavK5QB7A3kuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CpPFLwJ7vNCtSmo7iw+b/USPPob5eywMEOfPb9lczJwVL9qN3JjLYE9kGOBuvi364to6khPQVckiCChEgTydvxp9U2Z5no8w1oksBi7bV074SgSEfWT2h58GwpTIwNPNsd9I27hRAIG3Z7VzVyK+4usszMl78nKcXRvTGSIPMA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvXffbns; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDC23C4CEF7;
	Sun, 30 Nov 2025 00:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764461301;
	bh=cC21v9mFYe2j/770WeKb3fcKEuR/IXGavK5QB7A3kuI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=nvXffbnsCF9ijv0wE5tEiZTEyuFfopo/fxRwAcwjiuUiWI5fij2y33j6re+SCf9vI
	 UX20meBm/IGmic7+z1mXtZvKWy/J2D55pxbMfXDe7HW9o+FmvRXOxHi30alehaAyyL
	 unYkYTQirrJwyu0GwfhVOcOUrkqWEdx48vfdGQC+O71E1w1aBZ7TzV8m9KjulHmG12
	 lKtwivTQ12xSXyrLq9e7IGOrgLkRGikE4rJiVoFsBYMH4Mh8VDa8foYJYW/HDPWvZx
	 eiTbb3GLnVbzwDGzMBVx2l1VyzaM5SQDWUeV8t49tuBHidawGeMcRuvBUuo9ubVoBV
	 wkKFZXNMOxfuQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2950CFD2F6;
	Sun, 30 Nov 2025 00:08:21 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 30 Nov 2025 01:08:19 +0100
Subject: [PATCH] arm64: dts: qcom: sdm845-oneplus: labibb is not used on
 OnePlus 6/6T
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-oneplus-labibb-v1-1-bb3653e43120@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAPKKK2kC/x2MQQqAIBAAvxJ7TlDDDn0lOri51YKoKEUg/j2JO
 c1hpkKhzFRgGSpkerhwDF3UOMB+2XCSYNcdtNRGqUmKGCj5uwhvkRGFNOjc3NGooEcp08HvP1y
 31j4EN6vBYAAAAA==
X-Change-ID: 20251130-oneplus-labibb-05bdd6d6d2b1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=yhGffhFUntOUCTMWNhgszqUC32ou/2+cER0uMXyFzY0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpK4r0rHKaYmKTRdO95a/fUctPZC2iZP8xj5/jy
 oTgMJxYLYqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaSuK9AAKCRBgAj/E00kg
 co+lD/4qrLRtW3r/YdjJ/A08QcH8fVokvjJ3shcfOyzgXlyXdIqhEDpYgPaaeVw+BNk6i7Qvl+x
 sKpVv/hV3MAEPsiB6R3wabQJPHBqImSCrs+i9IS3xMv7icrTfMMOnltvZQRc2qexmHirMx9eetM
 M+7XBqE7xsj46wiiyXISCB4riUGk3l38PX9yMGJeh2i8GxljWTPzUKgJ7ArjYx5TqrH/7AM5tWM
 BugHLf4b6YGv/LCmQq3HqBRbah3qxoAo01yKRPrZudgkhFkTCFatLrJkcGpCFcu9H8q42c1rlbx
 /xTHVwD/mAkfaGK3Xr3I3u/D2/fvJKFG6iMz59KBb5XFduvqzGfdGecnhlMt8DAAdDrCOLtfNct
 yFNnDM8k0WvNdpxHXg8gHVQ5ALrWoTT+TdU24mcIoYQp/1EO/00yZPYLbOl5eip9ZKQHDXqf1j4
 wpCUbhGbRmitVRWfk6l6LPX/5Adw4Daflj4MsaFUS0GkzgiUrmX/spD0GeF0Fr8o64Twei+xVhJ
 U9zwvGXjfitYHN0EidZP6J4EDUXgiDF6S4UQICiK9hzM1ezB7qViKm1RVqMHKFe+pkt2eufXUuD
 0U06xuCt0v4sWMO8bPxpUjwHn+Ali4ClUgNEEO8QGHNtoXLv8mAET2c1IL8THKExB/Uw6h/xmZj
 48uUe6d0lYTAlGQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The lab and ibb regulators aren't used here. Disable them.

Removes following warnings:
qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb: Failed to create device link (0x180) with supplier c440000.spmi for /soc@0/spmi@c440000/pmic@3/labibb/lab
qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb: Failed to create device link (0x180) with supplier c440000.spmi for /soc@0/spmi@c440000/pmic@3/labibb/ibb

Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
I assume this is right approach, as OLEDs on both devices are driven by
different regulators.

Question is, if should be labibb nodes enabled by default?
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index db6dd04c51bb5..78a835bdfe3b4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -419,6 +419,10 @@ rmi4_f12: rmi4-f12@12 {
 	};
 };
 
+&ibb {
+	status = "disabled";
+};
+
 &ipa {
 	qcom,gsi-loader = "self";
 	memory-region = <&ipa_fw_mem>;
@@ -426,6 +430,10 @@ &ipa {
 	status = "okay";
 };
 
+&lab {
+	status = "disabled";
+};
+
 &mdss {
 	status = "okay";
 };

---
base-commit: 7d31f578f3230f3b7b33b0930b08f9afd8429817
change-id: 20251130-oneplus-labibb-05bdd6d6d2b1

Best regards,
-- 
David Heidelberg <david@ixit.cz>



