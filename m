Return-Path: <linux-arm-msm+bounces-86020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BECB9CD2E61
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 12:39:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A77B3019B55
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 11:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8098830BF6D;
	Sat, 20 Dec 2025 11:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHGxwplu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F90D255E53;
	Sat, 20 Dec 2025 11:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766230740; cv=none; b=HaelHpiZqfyktms+I+OdiSst6HY13nq9LImByPN8x9aJzyTYtFP9LH8nRsCj24njdY4GWuVYoTUP8VWPjzirvCSHFDmH7bqy0ilJRoqu2BQ3v/SvUedaqIGHiNG0tG4apElLuZOwfhEZ5dwig6wpoyspczZkZyFlKJ13JCdGRmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766230740; c=relaxed/simple;
	bh=baoiwSlnAzYK4OZcIi1V+6DZsaFv+lrKLgGaT3ABaB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XL9BYrrL+mz/ngeBCakITWLuTPeqe3/QVADfcV0nP9N8UM25uIHahmdyCEQs/WSk8bjZnnG40EGvsrTvlUs8WI9LMzD/Q/T0EN8ghIwW9y6fekpMxUoUR0MTsFAR19fvRuZkU5VfCg7YX+3wSetN20aYSY3xVADAg4SQuE1xylg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHGxwplu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4A3CC19424;
	Sat, 20 Dec 2025 11:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766230739;
	bh=baoiwSlnAzYK4OZcIi1V+6DZsaFv+lrKLgGaT3ABaB4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CHGxwpluqTQOEWPMpv7HsjpE7+wUQS8dpKjP6+IHhU6dIwUXb6Hloq1bHQrs+75nk
	 O0XDmq506kxJ9pR9AOCWJi4/Ms4fOsNKzCuloxzdkKdn4Eza1aT5QH0QO03cN9ksxT
	 e1JiPHoXTjrxvm7DmPy5SumHuDCibxhRvCKfdJN6/2jlVH7x2Xa9p++8YpIod43ANJ
	 2Og3us0qWDmyvkbMmJ0fpo3AZGT2OKsYnUXSdWeFW7GzrCBGjS3ZSUFpN5l+kEvWwV
	 BY5SK3Ji063ea5W4AEKXwqi9HN+xLFSJfFKbFHvE2EaO2lDNi1hAB3KpDzt/ISFDKq
	 Yt68MkpTg34Jg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E6BE668B8;
	Sat, 20 Dec 2025 11:38:59 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 20 Dec 2025 12:38:59 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: x1e80100-vivobook-s15: enable
 IRIS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-asus_usbc_dp-v3-3-5e244d420d0f@hotmail.com>
References: <20251220-asus_usbc_dp-v3-0-5e244d420d0f@hotmail.com>
In-Reply-To: <20251220-asus_usbc_dp-v3-0-5e244d420d0f@hotmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766230738; l=1073;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=Ab/UozggKho3gMsARYVcu0mzFrTNbu/B7Hyha3WoJ8Q=;
 b=/MDIgLNDs2Okk38zRBSQWkoFrrWGIo1/MRuJBBgM0CBvSWp0zj/Wvu/y7ySb0LatDX+W9Bg1R
 Y0y27LC7BbeBT3HPHq+4z3nluDhk4CweuHZJf4dv+VNGCKculqbZxJk
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

Enable IRIS to allow using the hardware-accelerated video codecs. The
firmware is not upstream in linux-firmware yet, so users need to copy it
from Windows to qcom/x1e80100/ASUSTeK/vivobook-s15/qcvss8380.mbn (just like
GPU/ADSP/CDSP firmware).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index d5794189b98b..34467b84a2fa 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -833,6 +833,11 @@ retimer_ss1_con_sbu_out: endpoint {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcvss8380.mbn";
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.52.0



