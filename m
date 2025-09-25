Return-Path: <linux-arm-msm+bounces-75037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA46B9E3AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EB4D169952
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793C32E8E05;
	Thu, 25 Sep 2025 09:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DE7OIRlz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7AF2D5940;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758791572; cv=none; b=kw040+IIxuL6bE6YB/DAdWyMzycasjTtjlumU69q48B3psCKpEUMEnR1Fid1CBFWSWo68JfYMecgeWM6tz07VKMyBpRXVqRaZZB3UZ9gPla8vrCkSKFNbXnU5HzDrO/sCD+y2vXgOpGg0zgOIDkcvS7pIcue93Yl6Y+GTj1fK1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758791572; c=relaxed/simple;
	bh=wZ+kYf//hjrbQ0knwcLNvJW260i2ZDxw8gma/2MTEQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJaDpdE70hOg4Xa330E/yEE79cBu+H/WE8HaE4Wu3HdQmSzvNqUTdCuO9gHuFMbJRgZCoc3A3paYW4dSQjM0zppMcoW6b3OGTZkMffZ0oju3Oro5F7jPlh/puMvNntS6frGwb4Ll/anok9MFSJqZVCFwsIm35fxFJBetnkPoBLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DE7OIRlz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3F0DC113CF;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758791571;
	bh=wZ+kYf//hjrbQ0knwcLNvJW260i2ZDxw8gma/2MTEQw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DE7OIRlzVyAS3LS3ZDQpApDZy9noIvlcDz2kbFv4oJY9NcKWJrhanZObGPnzc5iOU
	 fAGpJdo3k4SmsiLvO1h8dMP4b/K7ZPkQcHVcV3C9uE44Y8flqRn/vCs6/OmrlvBqnA
	 xTck3zgfxfV+EgFU6Inv3rgskn+zII8qmA9LUpiBihNe73rarxxwg0rTJK1RALsfnt
	 S61diRNs1KbBvVbbCODt03aF+PZ0eJRdtDw+jTgKHs2zxYWSiLLm3wYnZoDcJhlqQS
	 r4JbzTqJsvpF9ZoehrSf/rl1rD7otf73pInUT9vrYBJxisoOVHPDSLh1mpxyZ2NRG1
	 EkMIelTdcCl6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D30CAC5A7;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 25 Sep 2025 11:12:51 +0200
Subject: [PATCH 5/8] arm64: dts: qcom: sdm845-oneplus: Correct panel reset
 gpio polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-s6e3fc2x01-v1-5-9293016768f7@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=995; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Mx+pkd2/AobEUeDku67R/7xYkAIay2Af2+Zb8hbtf9w=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo1QeR0uPmmIGKjO2LdfReaBRqvbkanfhCyQCCP
 S0Tgv5YyMGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaNUHkQAKCRBgAj/E00kg
 cuG3D/9klNUUR62Vi0zv8Cduyq9ByQYN5uEdD8bw9MyRDRkbAkbTk7KVrGiXtoyBYd1DxdYlhOu
 Y6cCYooM0H9vtclG0W0AD/khhzOgdWIvCmEI0ImNG9Ismfb7tLxb5QvmLAytbGsKC4LGUit/xzU
 QwSNhLjnOaFX+NA7Rv8RThIrP/rRW0+Qq7xa14bGWo2a9D8y2lqcp5eoeg3i3grm99MuXv07UFx
 Uef2mzl+/+TAVkm8NG1acC/MHmhQLygjntueAm6e3mbfZ5A2uQaYEo6N5O7UVKjogxOrkNcrG83
 sTI3xOuTOzz1eDs6Tlomw3qxI+wF8vTfOBn9KuzkxEcbFr3i2aR8vY5TN/6B9H7QRduxej2fi84
 p11oNmovPJzKkn9+eo+tjHwY2S1su7IJqzQeOdgQaoanXAo60YuncHxxtqkG6mVwAgzq/J7XKzU
 3k/qLe3ZUc1dSQSH7B+QHNgM6N7vZEoqJUlO54PxJuwsjscp37lBITCXwqZbEc0loBpdNSIdjrE
 mGJAylPknP2DYMgEfDHm4K+3WY5cPF6BTL7J/89KGUd83uvaZp0255ZJ+O0UmToD/IQcS6gAHIU
 FMo4xZdN+SENhckp7vvt6j68eHoLsU2GRb49Zo92OTDM6TRB1JooLCL3pvOksi0IUwmN7+5M9FG
 axt/aQmt25HlKkg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Reset GPIO should be active in high state as usually the board doesn't
invert the polarity.

Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index aff5e80c1eba43e830991c2afd53b6322893cd27..7f968f90a83b869395bedd5de510ba96de3c4e94 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -456,7 +456,7 @@ display_panel: panel@0 {
 		vci-supply = <&panel_vci_3v3>;
 		poc-supply = <&panel_vddi_poc_1p8>;
 
-		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&panel_reset_pins &panel_te_pin &panel_esd_pin>;

-- 
2.51.0



