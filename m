Return-Path: <linux-arm-msm+bounces-20458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E198CF0BA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 19:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6643B2131F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 17:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388C91292C3;
	Sat, 25 May 2024 17:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4a+3J5Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF32F128815;
	Sat, 25 May 2024 17:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659952; cv=none; b=kcOL805uSs+0QgMCil0TYPiffGFjLQR6nEckT11KPbfjXZyTRuOHMWrSpy7zxDen6ubPwSQlItBtcVHOMMrV2PhiT8H774t03SiqgFc88WfObTdEXVkmdjBM2j8TqJwCw7Ex9xRBg4AcskJIwpk2vwzgJDVWlAOv8zIXCv/JTus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659952; c=relaxed/simple;
	bh=KRrS6daAl9jmj0dMdUa1UyfQe0Kr3SCOM0K6I0FXIXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pbv8KhtQh1qczAx0J6nWCSe3UlBdu9vZir80WaFF5GwlKBpJ4QJUc3468Q5aR5my1xBuost1urFKIA9Wgm8EkgmJLeLaz+H84slP2OcYEmYN6QvA1BAGPtuf0nduoiPH2zdCkmWDtQPBqHre4dZvTxOn/1yb/YnfmzQWmaGQN5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4a+3J5Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B38BC4AF13;
	Sat, 25 May 2024 17:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716659951;
	bh=KRrS6daAl9jmj0dMdUa1UyfQe0Kr3SCOM0K6I0FXIXY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g4a+3J5QNQ0fyGISj1JpaVI1p2BzUSZL5dsgzNfGpb1msTSQRNmenw8SJoWh/69F2
	 o6Pt6tETJzs8v3X7szQ4QDmSNkb79PlBHlnHDP4fFAJj1y5rOcw0dc+ooNz9ZmIyru
	 11oq7m5KI50M4rcyUFImH1wuRTaSPPp/CkOs9w1WCnWz92djmxfRrowF017aMo/Qgr
	 fAhPK8miajIGdv2p3iunUffoNao5HHk5bl4HZM4WULUTyzGbirvJG6xisXA5Sei3E7
	 Nx/BaHVj6VrVnnSxH3ZiI0/MxVqWZdU8SFpHgw1ygAQ8D8m980XcErwhWTs4mHBYf5
	 txrg9V6/2lHzQ==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sat, 25 May 2024 11:03:55 -0700
Subject: [PATCH 02/10] phy: qcom-qmp-usb: Add sc8180x USB UNIPHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-sc8180x-usb-mp-v1-2-60a904392438@quicinc.com>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
In-Reply-To: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=863;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=AKIFUem0XLI2sN1r7OXd/5hs5LThK4k7U6q6yjGq0rg=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmUigMqcNCPpRKu4OxbJsqr7QjBbMS81AaV0s7T
 HZkMiwtIwCJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZlIoDBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUb4w//cR4kym9ancbDsT4rv5sAt1uYW8Y1rfQoF+GO9AJ
 3QwRimqp2hQOiEa3RaXa4SwLKorFEIJHYrILO/zwxDvPlgQa51o2x1s7j5MQna1VVopvEUuvA3d
 Ml0KoJaJfJD5dZj9rQJHvU4lxkA5z3vdGh2UBFAxw8A1cdID0ul6K5NXTin2XaJZUseKRhCfE2R
 YeDXF8SF3epJSrjkiPakVs5ngtsHLEq5d3O3Mirb8N5EhOEmETCfMC8nL8YR9WFAaqgIjiNW5Nz
 5xnHv+p7/CtcXuGQ9xN3YlI4h9s+PGRMKunsOb6bFeB6SpW2aaXFippNW81yXyaqa6OEHgdS7H9
 m+6/sC/Zxh2OJnCvjccybsEfrcKCgi3H8O/WFndV7AJUsALlzGJBGCWusrn4D6Hg5TTqZD/7wlC
 Ny6mIrXOiJyR/asyl9J60r7Z+30psRDNwpYkzlx8wK8xqLzyi17t1/+RzazXo0X3XyZ/dy/LaL7
 WtS2cL64s2SU4IheoxirCiznmHzSx0/nbbb/OKQ33IEw8Ubhb8z6GdtwyO5KXbJgsIxiLLWpOQ2
 F26M/McOr7mxNJoUgHuw4Dj8HEYbtfKcv4swT2fO+qOX2vlg+kVg7KQ9g+zpTqo7uPt/QuASek8
 Z2z5E0PTPFn7w43QLTp4qCBZwoepgBme2232RSJkZBLA=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The SC8180X platform has two UNIPHY blocks, add support for these in the
QMP driver.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index c174463c58a3..9b0eb87b1680 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -2252,6 +2252,9 @@ static const struct of_device_id qmp_usb_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sa8775p-qmp-usb3-uni-phy",
 		.data = &sa8775p_usb3_uniphy_cfg,
+	}, {
+		.compatible = "qcom,sc8180x-qmp-usb3-uni-phy",
+		.data = &sm8150_usb3_uniphy_cfg,
 	}, {
 		.compatible = "qcom,sc8280xp-qmp-usb3-uni-phy",
 		.data = &sc8280xp_usb3_uniphy_cfg,

-- 
2.43.0


