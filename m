Return-Path: <linux-arm-msm+bounces-75032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 791D8B9E382
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2020D3A87E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2250827FD5B;
	Thu, 25 Sep 2025 09:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0wtzazF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A3D279795;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758791572; cv=none; b=l6KkgxDT69CpB4AX5zfmkq4TZZs0nA9mlMNRzmRDaa/ms1rH9T8MZjUTuNIxmiVWh4m26bFam6Xjf+wblXYHgPaHM+mPGaVQAeRZ1pXkUEfYRkiE29kng1vgvwxTKtzuQ39HTUaUmN0n9PNzRYr93CXKvpYhmLk8o7Diidvoxtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758791572; c=relaxed/simple;
	bh=OVZdLNzU8JMu9ax5m0rVrkbR3c+sAVUJmeagTRbt6aQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r5v8I17h+NQQ8aiPPPwQI/j6AoMAlPS8IGWJxRv0C556wLKiu9GfxnTkaQpVImms4wZMQE8ImwMjyQWDCmvHPQP6aiBoJTdT5jR/fscUwlqPD/zx1pISUBWVUaZgmGbAipMEWzp1EbJ8moEvXdbbFEujVU+AY5EUDa37AcnZ/1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0wtzazF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC972C113D0;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758791571;
	bh=OVZdLNzU8JMu9ax5m0rVrkbR3c+sAVUJmeagTRbt6aQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=P0wtzazFPoQFJmaqhnFcSfZ137mU4N3PO9XiChYC8v5OiTyl8JMyO0irCxFnKGgNu
	 3klL1osFyA963O12Hjpo6o/NQxCETgEPHNdn6VW5n2R8poT3xomI2N0z42ygWA86cf
	 4zHqnRdNAwuqmaUE9YjU46DQtAe3MraQT+R9DvHmEh8hPn8jFTmUAZXgg+hZc7NSDl
	 jY9mty+2MnI6cs+gjNbvuGktSQW3lMj1HQQL4l5/OIpDwZf2NlJmIfxU953vFkcMcS
	 xPYtK1DgpF9NsPl7wNEpJJgiEJXPkFdob00ZZgDgrq35v3Z/pPlzaK22FQ1mUI2hiv
	 MUDkqSRu2iqOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3ADACAC5B7;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 25 Sep 2025 11:12:50 +0200
Subject: [PATCH 4/8] arm64: dts: qcom: sdm845-oneplus-fajita: Reflect used
 panel in compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-s6e3fc2x01-v1-4-9293016768f7@ixit.cz>
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
In-Reply-To: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=861; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=eLKrJy3MogmhhzpVb+BH02zF400XocWMS6U/eaonSM0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo1QeRvxwxJYI6TOR7wTwyUD5kobLbzqgYHQ6Bf
 KDUTcTuVRiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaNUHkQAKCRBgAj/E00kg
 cks1EAC0dCaWnmAeauXa5CENO03e6DcEb5ymfAs7+BmwY/Eg99hTreAcR+VvwTSF4Bij8gWiRqa
 Bi+mHh+j72BSu4ATwbriE1RWPelaH9qCP8LKX25jayeI0mJ0cavNd3rtl+0CSFXCNKsHAOwYMW5
 6i3q2H6pSF2sCPwWLOeu1cp4qA8rRt869uSJ0w/xYVVVlm0FUFVZZrzWT/PzpnLP03d7QPKlPT6
 fTIL8ONvJxIDfKria6ZZd1AxJYjZYngfOAbhLUWkUruedf7MRg9tBQ4L8haHAznC01CGuOKS4PE
 tJBm6WiFCZarlTQiO/r8NTZDSRriyc73pmgSPRMIfiiOJlODWyorfRwo1ukw79gahhnWW1Ly5lM
 tLrzgmHqjMzqRvWO8OrXRtbDmVM12mDgmj1Js/FPjaGYzdhk5plEEGB/TcGKOcP9JtAFEmo235R
 pZJp1LeOKYMXhhmJedmHLp/R4lbH4YkNC1Xo6h+e5kdNeFnpHTN1KpLyxmUXKoyEzsLXXwUb4AS
 noViG4wRIaBKcBfA/YuSJ4eo+7K/O4XKhAkpQu/mMiZdnCp1upI0Rd/NLxy1K5nWJv5kF5PXMhA
 CS1MqxPSWK9yeHwmsXIpnbYSBQ7LH8PIHJcUsJ7T8Y8Dx9QrQ5F8QMlaYR0ZUdVlq+FH9xctss1
 9XK2tKJoVXsWF/g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Currently compatible was only reflecting DDIC used, but now it also
describe the panel itself.

Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index 7e75decfda052b9639f2c0ecdac5a71196fc702f..55b3e94dd97262c765165b01b07bf7052e9ffcfb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -32,7 +32,7 @@ battery: battery {
 &display_panel {
 	status = "okay";
 
-	compatible = "samsung,s6e3fc2x01";
+	compatible = "samsung,s6e3fc2x01-ams641rw";
 };
 
 &i2c4 {

-- 
2.51.0



