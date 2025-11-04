Return-Path: <linux-arm-msm+bounces-80360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78365C33289
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 23:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 428C718C2DB1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 22:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4961A2D322F;
	Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkLdYHXN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED9D2356BE;
	Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762294575; cv=none; b=nB26rHTpQ8ZZvN8dSt6zfw51QED78jYxonShQnvYmxJwT3qCBNv+3ho9U4982dWCnlup6m/MEvC7MfGjwzRJSLo1TYoiDsStYYY77N69o0wwNFAG/6ifKpWf2+4lqrgy9mhQdSxk2GldvyhhQtMvwmPWvSo5iD5d17VxFIiD+Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762294575; c=relaxed/simple;
	bh=Qi0+yC6UACKgnI2+CloHBOde0gf8t+GaLz9m6VZbpgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JLbQnfrGCrUv59vK1r8Xb4p4DVT/3H6ORY8lbg+V+fJl+sabPD9LN3VMNsK3CJXuPEt7Av4W32QBTV3xej/LpB/dEHZE8mvanl4PUjiv7GRx6PrQ31eBDNm2bLkHmEdM1BV7tHVs3yelCvjXWXrVvkrbqGjQKDe/t/dYtawxaRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NkLdYHXN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95DA2C116D0;
	Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762294574;
	bh=Qi0+yC6UACKgnI2+CloHBOde0gf8t+GaLz9m6VZbpgM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NkLdYHXN72sizE6eqF2ZjGwHgyPLqdA8LaijD+n2Mi575EGIGI2Vo/VM7Ayf8ykNd
	 DgGyqpgjTAxhXmBRYrMyHZkbPVLiL72DyhyiNEaGy0PT9uYOstCRPDCTDFF4aCE92i
	 EtKRgr25GbalUKqzBtIHxFPLAT8ytwwVgFvOOzcucw1sq5RFNkMoyymZfet+Xl1MW6
	 +r8XlcI8LnXDKQsaEVAcRNS8hOY39A9XjQ9M70AeNsFa3T75UUFjGLzOrx0qU4GtOY
	 Gve6i0J0JhhdpaFk90AAyG61sQrP55U5vpSBQEUiBJAMtvoaYiSVffda0PjJ8LRM2B
	 IPUwnIUWenO/Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85209CCFA0D;
	Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 04 Nov 2025 23:16:10 +0100
Subject: [PATCH 02/12] arch: arm64: qcom: sdm845-enchilada: Specify panel
 name within the compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-sofef00-rebuild-v1-2-dfcfa17eb176@ixit.cz>
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
In-Reply-To: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=890; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=gC1Y0XFWgXtqr21a8lQBohbuf2aAabfAVdPVUFhXq/o=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpCnsrefsVG8yAxscAoT5RPZOEbQJHkjvDDqUhp
 4qXbq5I9QmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQp7KwAKCRBgAj/E00kg
 cqtbEAC5gs+xlucpqIFCsdjxNByKIGfdOjoxZG0SHTZ16xG7TmDOwLvQdXOWphPKQl2a/GS++fC
 rWkI79nS8ZZTNCMqXBNiDA63gcdfAV71sOS9hgZVOOTYs9299wlSThIeQ7lib9UPzcGj6XeEIvX
 fLVYCABOblvN+Qr5xtE7UQ8yR0Ec2ftxb9egSX0DPop3fAW0Z99YZxZRbDthmP+lkD8wg+KHteV
 UusTrX2WXWk1ArdT9a83+RXnG6ebJEMp91ersFpyXaPHtYqleOZMzXSjpDQVCYVHualKvYI8qg6
 ppxjDpCBc8ceJJfbSNAXFbJ1wajoInunlutixL1Wkf/GAgIVgpMRKOQSPoD9xQAe+Wg3p32+frI
 37T0EuXDyIQjeZHB9qvAWFMZUXVKXZKBa5GVtqN2oAl3+qbSg6ecGhfZUDzbVDraxrcWtu1/RPN
 tK8SefyF6rGCwesQ6sQTwHV8zkOJPrh/NG0bBGkp8HUmOe/EA7zm0mutXvu51SGItE67so1ZtCW
 a5CPynaqjk6X/g/SrIHwcCvVMPejjZ8jHe6+AyslJb0Mz+24hZtY2yE1ZuN2atmTPtkDf3yIQ5Q
 K351c8f01gUScN4fy56kmQfBGUI7K0loSanWLxZJW6w/pXWkCtqxzYN8yoZwJoC0dnoixUcQTYk
 BLDJKoY/YcuCU2A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

sofef00 is name of the DDIC, it doesn't contain name of the panel used.
The DDIC is also paired with other panels, so make clear which panel is
used.

cosmetic: sort the node.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index a259eb9d45ae0..8aead6dc25e00 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -31,9 +31,9 @@ battery: battery {
 };
 
 &display_panel {
-	status = "okay";
+	compatible = "samsung,sofef00-ams628nw01", "samsung,sofef00";
 
-	compatible = "samsung,sofef00";
+	status = "okay";
 };
 
 &bq27441_fg {

-- 
2.51.0



