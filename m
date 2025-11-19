Return-Path: <linux-arm-msm+bounces-82507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EFFC6F49C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E59B4EF31B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FA82765C5;
	Wed, 19 Nov 2025 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7QffQcE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7D5274B27;
	Wed, 19 Nov 2025 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562101; cv=none; b=eibUGwtWMNfNvdqaXFYA8pfcPR8BwPLVJhRMPuKGK+uvrnGczelJB5LNM/Z+/b9U1P5oLiTNK3YVsuLlIcuD7h6ahVfisF0jlcJf1WgKMt0Uj15xsemSNzodzHTAtCWvgfabXuIxKXsx5iPFaWT9O7nH/+KNehW6rVBhcb2ROw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562101; c=relaxed/simple;
	bh=RCFsjUix1XQ76jxISlR0S+cS2leVOmgzdskYmMSCvic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZiT7PHOqo8pbDZAB95VPn9Ila3E0n4EeXVL7HAGhs9n4HCE4kwY7jZy2UTCIpM1bBqU2xJLdCyky5v4b0C7YX44tSxC4ylPyQNq6KdRy3ZjLbk74qe5y2myJSqBRlkBK8TNRltESaSDRUpND7wUa2TKz+psJFwFHJA2kfVUVmjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7QffQcE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC0E8C2BC86;
	Wed, 19 Nov 2025 14:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763562101;
	bh=RCFsjUix1XQ76jxISlR0S+cS2leVOmgzdskYmMSCvic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e7QffQcE+JMWYhRcrEiwmchzpWC90OmKhd1Pjtx30iSp0b3LApmnXSmNLkvDgVvk5
	 vpx4mNmHSpNWamUfYBcgz/JwHyLQ3EsgFJnz3TJZvPb3FscsWY+z9vj0pza2cUjOIs
	 cUZb9MLLIe5XNXpwjxNzM6kmihfExmDEpiWBA3rjhj2sCF+OUR0pXqV45AKGawkR11
	 wNxPYeQpf82MNPsL6Ws3EN0QhB2hnjAzVAeGIUKBIQM227HmhFGRL/MXw8pyze2a4b
	 WJUiUMPjEhG/mgv65PYpXmcMY4F93axlV0zRoVQt3nbbWY51szsxzkGJ7TSdH/PUQV
	 UX2hyyvu4n0AQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80094CF34B6;
	Wed, 19 Nov 2025 14:21:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 19 Nov 2025 15:21:27 +0100
Subject: [PATCH v3 02/12] arm64: qcom: sdm845-enchilada: Specify panel name
 within the compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-sofef00-rebuild-v3-2-6cd55471e84e@ixit.cz>
References: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
In-Reply-To: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=XdEJMzUlqHmVFvRkb119Ya6neFS+DHA5Y7GV7B5h8w4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHdJyMXGU0SPjy59reJxJwEVMCdZvJTNqQQBvk
 4S+oxbaH9uJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaR3ScgAKCRBgAj/E00kg
 coTLD/4lKOUmsMD5Xn+6M9R8x4QoYPWL8BjkBYsn36pMAtB+fo0UXsLK07Cg+Cq7PcruRm9WbkH
 XRk7G6jYdM15pdTJnJnlPnwhfoIZ/S0WnaN3ADeh6zfX4+IbXPVT0wj17u7wxkaZrSkAAnllVS0
 QVxn0v3/v+YmXqA4lK/dhtlfi5wo1VLLnJnCsKJ3Q5fRdJldEoCO5EZQx2QDuHtNk0ar6N6niFN
 Mfkoi3Y0CjecGmejwCDyu1gWTzcGJiMacRGGaT6OhA551GYnk76QbmW6uUPOggu+dwrLprXu4kw
 Xw3eiXNvdTSHtUwME5GL1Y9eUtTsAxhj1WBsqAo68tR7Ecz1OjK7RzVpGtUG8LKx/xIGwbXEwnF
 r0aoNGtHJ41Gv2mybmDsXnVL/P0MQgkKnk8Mam9jeCPi0+VXcuYZXUQkhdXeJqrY1I2bL2MY6As
 SRlx2zb244gXIw43Bmv3BgCq2ByJlholZg5aseRxHRxUJEygdMnh8wDmjghUzOQ693MEjZpBc4G
 dgXo94bX0bXBp+rOIIp5au7Rk6tm1D27inCiO15gN5Zu/A3mE91UsYMOVqohIbrI1E56kvu5oAA
 z7yQCVF2V401x3EXWgCmHyprBj3U3VuzVvd6/IXJVpA27JlDe2OyspLLR9Of4pNYkFbddY/BKJE
 8RQ+I6ntAE0v/LQ==
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



