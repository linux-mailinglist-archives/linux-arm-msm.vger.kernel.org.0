Return-Path: <linux-arm-msm+bounces-84347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E29DCA3428
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 11:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76CF43059693
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 10:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889B82EDD6B;
	Thu,  4 Dec 2025 10:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9XxsW4K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547F82E88B0;
	Thu,  4 Dec 2025 10:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764844893; cv=none; b=mx3pYls+eKq/LjAHe9C6glPm8VVv/UB+bgDaFVPOhtOVSnkubdFxFZgRt3zCePJ+sep9PScxOcWiPkQ1PxG/mTw3YYhAXtmvqClLutCInUpd2uET6LxEHlGFM8QvpvmR2R4T70mH3AQ7Kqokmi6BHijbPmGoRspOPgJXWWiifHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764844893; c=relaxed/simple;
	bh=8y4xGFFun6h+N78w3IWAvbtXt554lZWi6EwAe2EaVbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GkISMfaQjs3K/odZkgayxSXobg66KAf8K+xScaSqBTP+UNpaWC5NnbiP7f4aVj/5UgYJbGhIWr7JTfy+0UcHlNRDDpbiES04sVQYS7KYZAS9gi5Sn2Y6I9rQAyQyNDccbs64wBRmLg+TB7jgRoF9aNSrAKL5nlz84WBddex01kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9XxsW4K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D062DC4CEFB;
	Thu,  4 Dec 2025 10:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764844892;
	bh=8y4xGFFun6h+N78w3IWAvbtXt554lZWi6EwAe2EaVbg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Q9XxsW4KokpEpwbgZeZSAWCHd/pTa56r4gvELLNNJgdEpGmZ19PHZLILI2+8IUFmX
	 rQ334rIydcf4PzLtWjc0AZqYoZHbQLOdEHNxnleNDkrTCkWBL1Pb4e1uzJ5uW3Kzx0
	 rbc87wnZAUKBA15Yb9gwNYu8Bup8KtbqEQ8YhhZ8tpSBLTWYb1KLAC2igoWFkDe/Hx
	 zLJ8AOsGcz8/T8n7cmPDESZd/5Ol0E2n0zF23DLKLpL9DPw1jCtvoWEHq85cfDfHPv
	 5u4gqZ43FbYhMe/aG7LM7hR9jkfEbvDJaElhQkclPsjHl6BzyPOoB9OUFm4M58Hskh
	 t8FHBlK9gSxfg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBADD1CDA6;
	Thu,  4 Dec 2025 10:41:32 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 04 Dec 2025 11:41:24 +0100
Subject: [PATCH v4] arm64: qcom: sdm845-oneplus-enchilada: Specify panel
 name within the compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-sofef00-rebuild-v4-1-7f6e030ae5b7@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAFNlMWkC/3XNzQ6CMBAE4FchPVvThf6gJ9/DeICy1U2MaAsEJ
 by7BQ9gjMeZ5JsZWEBPGNg+GZjHjgLVtxjkJmH2UtzOyKmKmaUiVQBC8lA7dEJwj2VL14oLaZ3
 VqHM0wKK6e3TUz4vH0yd7fLRxuFnKC4Wm9s/5tYOp/X/QARe8ctYVYLAEow/UU7O1LzYtdelKQ
 /ar06gRjBIqExrQfutsrXe/Oota20opaQBziYsex/EN6JY/bT0BAAA=
X-Change-ID: 20251104-sofef00-rebuild-04cfc6e68e71
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
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2585; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=gj0lInF8ociikTF3j/Wy5V0sdCoAD93LYDKcUIGln5I=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpMWVb9zK5trkln88z1jaFj44tBGnJQgnvtzvJK
 caiHY++boWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTFlWwAKCRBgAj/E00kg
 crfLD/9TX7X7yRxP/Wum7g46+lTMZ0chXFYuXJ0IPcbteaRDkRkUf1twwxaHIY8TQGlSwgk96BB
 pOIH6PYnw1mfd7ooLpsW6/6iwKkDeOqKSRizGH60JnJ9tBIs8ek5chquIvwpZVY+6M+CWCmYewI
 Pj0BcvNX3uU6p9oltQ8sCnccFRAjKk6taUOEko8Jvdux5lTlR84yYHh+zxN4eS9c58mVkNnNwpD
 f3Xhtxk6bVAnkddIsBvpqES5pxYodSzw+bpsko3qPOXyRvd0PAX25N2VZdEb+SaymqefL/1JaPb
 Kd5JiggOvnJfbQFYcQVkNo4XXMSqaSzp2TvVoym7eH+9gjH/YbXNFVtxLaZ8mtLq7y0/yPWRon7
 BhgRuLrdOZDBPobPp/dtvCIV7IqxmPcNbkv6dJ7c5M06UQ0U/ZrGsqS9z6zA+clkxCVUetkVQY/
 F/2Ki9aComJLw1a5V2uke4Ws0LzRGmHDm/HrFTCRdOocww5Ihrx1BoHO+IrhZJe7ViGdA1QX5ye
 RxGBrD9qUsnImDzeDKtYt7PjNNTHKJ5GlCZCEQ0+VVCCErKqsbnkBiP5gQEhlrPflj8SHjWHkuD
 E4BvBCr0uGectZq4ZbY9MX20isfmh/J6TASxpF7odzGZiPrw2sb58PWWBVjd97v3+vdBkTnSZZO
 ngekh7S334pjW7A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

sofef00 is name of the DDIC, it doesn't contain name of the panel used.
The DDIC is also paired with other panels, so make clear which panel is
used.

New device-tree will work with old driver as expected, due to secondary
compatible.

cosmetic: sort the node.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
This DDIC is essential for panels used in OnePlus 6 and Pixel 3a XL
(SDC variant). With proper support, all downstream patches in
sdm845-mainline and sdm670-mainline can be dropped.

The mainline driver was broken so far, and with my recent introduction
of S6E3FC2X01 driver, I had to "break it even more" due to OnePlus 6
common device-tree changes which defined all the regulators and
corrected properties.

At this moment the first version of the patchset will not include
Pixel 3a XL (SDC) as no testers yet volunteered.

The code, including the Pixel 3a XL enhancement can be found at
  https://gitlab.com/sdm845/sdm845-next/-/commits/b4%252Fsofef00-rebuild
---
Changes in v4:
- adjust commit msg s/enchilada/enchilada-oneplus/
- no code changes, just resend as all other commits got reviewed and merged in -next.
- Link to v3: https://lore.kernel.org/r/20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz

Changes in v3:
- Drop arch prefix from the commit. (Bjorn)
- Added Casey into MAINTAINERS file. (Casey)
- Moved compatible legacy comment inline.
- Link to v2: https://lore.kernel.org/r/20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz

Changes in v2:
- General fixes to device-tree binding (Krzysztof)
- Add myself as a maintainer
- Updated commits wording
- Link to v1: https://lore.kernel.org/r/20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz
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

---
base-commit: bc04acf4aeca588496124a6cf54bfce3db327039
change-id: 20251104-sofef00-rebuild-04cfc6e68e71

Best regards,
-- 
David Heidelberg <david@ixit.cz>



