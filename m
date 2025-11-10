Return-Path: <linux-arm-msm+bounces-81054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB60C479DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 488474F4ADD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 15:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D415531770B;
	Mon, 10 Nov 2025 15:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arQxLJZc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E4C316918;
	Mon, 10 Nov 2025 15:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762789067; cv=none; b=dJUSQOGv5peN+7qc36VRtEp0Nz/mVr9BQ/So1Nqm+4HsvIMNWThRMkrShK6J9Aj7/td1pi464xDAwrrFMKat7soEyKEuOt7i+xvR9h5685DZeBdq3V7qkqfT5/RsCaTlZT30QomJrSNOBX15nNRjr4dyxej8Adze7OMdfMAWAUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762789067; c=relaxed/simple;
	bh=zDyXcxlijNT/RkW5UswlqCFu3v7QcmS3sYNEvW4iinE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XW7u7ZKEmmM0LyZGFIyfva+84eeH3YituBVQoZYmocEpo1OOek9vUkCe9Y1gj45EBlb3kJqU0ugTsHe2NxcGMVNPmZBjxnJHDL42OGuaY2WUzPJY6OgNYx5HB8Z5Dxu5fQFlJzJZEedFyX0vS175vDagJFQ5z4z5cX0SI5EfjdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arQxLJZc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39726C4CEFB;
	Mon, 10 Nov 2025 15:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762789067;
	bh=zDyXcxlijNT/RkW5UswlqCFu3v7QcmS3sYNEvW4iinE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=arQxLJZchSMmdRJqt0AhXlBY3Zj7P6Xw3APMfzNQdCOb6QCGM8uRWFpy0vx31TKXW
	 Lre88x8BrW5eWrcy1oI9XEeEJxsH2K7LqvSYC+uSXjxsyxtddCqDvMoG9yRRT6OFS1
	 s2KG58CHJPaOrgXyipN99VsC+RemW8uo0D5AdUxNbUbiDljV+QoSkZtdiM44V8/1tc
	 NSnmWr2JdLan7DMCOZOMNxpkJFaPTmE7t93OVmLMetO/oxcVPNP1011aO2WGbLE7wK
	 2FJmDNjw1BgVfE4O3sGVu94lXO8p1Lu54r3BbYQsawVF37bmh4fHDz4dsZ7h7UXryb
	 ARTMOL1r4ALsQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323BECCFA13;
	Mon, 10 Nov 2025 15:37:47 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 10 Nov 2025 16:37:46 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: sdm845-oneplus: add ath10k
 calibration variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-sdm845-calibration-variants-v1-1-2c536ada77c2@ixit.cz>
References: <20251110-sdm845-calibration-variants-v1-0-2c536ada77c2@ixit.cz>
In-Reply-To: <20251110-sdm845-calibration-variants-v1-0-2c536ada77c2@ixit.cz>
To: Dylan Van Assche <me@dylanvanassche.be>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=zaFsh51wt+u9N18DrqLw/5F/kUzi/3Xr3TCrNN/kMWQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpEgbJvmP1YVaTKsdEidnX7/yIL9D+Hfj2Lu66R
 oC7vgRiTzWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRIGyQAKCRBgAj/E00kg
 cgWiD/96tkJfm1foW5WPAqFk5sPMzn/ntr9xKrQJsQOEM/ajSQiuVfIzNhwlF5LAuEV/smgLE7j
 JDvq+Q0wDuX8SCtVk/j8Jk/omDiJYwanJNfQ/Gh3p26RWbEoz714UvmIg0lzuP1v78wz3SHwIHH
 wty+kdxs6djzqCZ5vowvUwmgt+nnHQTXaYI6N5TOYFVIXSw/U4XDXCSQDwjYxVwVoWm+t31Sioc
 0DzkKQPm9oTFID/Hrsvnlo0qM8syP9sjphPW0L57Ru+q2FUAIkqNlRxJWxlimuXEJD/pbCmeMwQ
 DEP2EVV50+sQnGeIQYCJH2nSL9TKT1kVL76U8mqCX1GQmaiygv0qLJNQrBcSoB3qwtS1lhdDjMi
 XQd6t05y+gE+4rKcUY19UzxUxuIrNnW42a5UISn+cmY5WUqhrIeR9lOi+qT8QhGdyKbr6JkAUbj
 8PrksdecnQ0aDF4rGrS5fmKm5xtaJs5k+VEAfQZFpBRL5JtkuHptxwCj29Wq1zVi43QKTjLKhVx
 yhvCWUf+38V4/us49h+HjYl41ZTR2uJ/O7g/MHeC7NCqBCgk3qmjfnbtTuviu+tskQqy+udJqi1
 Edb2tOtsOfPXA65wMmZyS0Fs8pUXvHPD6tJPWJ44TByG8fnI4+GpEd4Sb57viH4ZOgo9ZFE64J9
 kTVYBzRzlzGoiVg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Dylan Van Assche <me@dylanvanassche.be>

SDM845-based Oneplus 6 and 6T have their own calibration files
for the WCN3990 WiFi/Bluetooth radio with the ath10k driver.
Add the calibration variant name to the DTS to reflect this to
allow using the calibration files from linux-firmware.

[David] Adjust the compatible as ath10k-calibration-variant is deprecated
Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index db6dd04c51bb5..a0c2f6efec59d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -929,5 +929,6 @@ &wifi {
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
 
+	qcom,calibration-variant = "oneplus_sdm845";
 	qcom,snoc-host-cap-8bit-quirk;
 };

-- 
2.51.0



