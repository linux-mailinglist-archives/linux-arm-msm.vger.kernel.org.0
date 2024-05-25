Return-Path: <linux-arm-msm+bounces-20460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C928CF0C4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DCC1280C6F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 18:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E5D12AACA;
	Sat, 25 May 2024 17:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IFamleQC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6550A12A17D;
	Sat, 25 May 2024 17:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659954; cv=none; b=nOk7l9yTUZz72OGgF3q0Nui/4EGr+IOzYiiF88ycfimRdTXdQq6RTv7mDrRmXwFjsYDpX6KbOgZKrvucvdVp4XVmnFxKpjfcuaV4OtLcA0F4vPafgz3AKz4FpEX2aVd5X7HAD5bBZwoL05Baji7VotHZKVNN4tFLMa5lr71rr8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659954; c=relaxed/simple;
	bh=Q2ceOV02t0UpAKlBT7IZDlFZ4VK5kxjOlehGgDK729I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Npuh5sj5Cv55DOMkhyOwLkZ/4U1OhwlU7NW0h7ldIqfabMgbJBQ39yxQUXMl8EQQIHeBoRq9WspXRkZVTw7YDGJMUTWtes1kcqvklmyXN/qN7jzGreTb3a8hDKjR1/A71CQr34DVlXO986ThMGqQGvrRFBqsZd30PFobYJVcCkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IFamleQC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21370C32782;
	Sat, 25 May 2024 17:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716659954;
	bh=Q2ceOV02t0UpAKlBT7IZDlFZ4VK5kxjOlehGgDK729I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IFamleQCqmp4hyGizraruuelpC4DJCrYrItyOCkcLvJntK1R56HyMM4DQDmcwqX0R
	 MmaFhQyHZJgcNiD5z2cDx69DM7nOVYtH3vpHGsqTfBD9yAv15nrCaTXrxVhS0AdNRI
	 HUzwTVncXZQUsT+HUtnk8gExkQx4muPO4cmYo98JKz6QOC1ScNqnflq3N4dwPIKEp/
	 Sz7/4jngiErm1QwRko1llqbHWR22/FvrR5r/ZeVUL4JfqKR8xvQWHkS49jhnGvCKky
	 y138ESwFXKWrG7XFHD8zlMmnO2pvaCOMbinmSbBoayLL6Yf+5NUzBtU3FLVUg0dgPU
	 l9VzZRJIVwd4g==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sat, 25 May 2024 11:03:57 -0700
Subject: [PATCH 04/10] clk: qcom: gcc-sc8180x: Add missing USB MP resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-sc8180x-usb-mp-v1-4-60a904392438@quicinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=938;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=iUm27Y39fR9WTb3MyN1jhNQc6XLpkUGGL3f13Lft8RM=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmUigMcLXih/lldJjCgFL8NnxiZ8IM0Tbfl9WVQ
 fy+uETiTgeJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZlIoDBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWsIg//fclC9y+rIhNKjYnJBEFmB1IWTkQ+5fXehS0dHCT
 CxUILyOOXF8ypStrb5gyUvFowWCzB1zAUaOyVFDpIBWTIVYUL1OFUxEH4Y/VpqD2tjjrNj659cT
 SWTA/W0m/DcLC4gyujCMzz5YyLkV4V95Q/l+AnxzR9Q6cizGzT87+kQmppIHpap1xdUwDwFER/J
 D0wvqaAAxTlrq7UCizBkDI4/H/9tUj8lreyDnclg5QN8txzltYHyDnDMSiMrTT1njMcmkEGv6MQ
 VvtedNa6sstvrDdIQ660nfg3/7SjyqLWv6TUSGpYsG7YM2NwLniPKRpcaqvyV5Yz+lvKE8ju7lx
 BKsYvq9Ly+za4F812S73ZYhmXZvvap6IvBK8to18Zh45VcwOv7487heXPJnTz1aRpxTBwBnaowg
 PhnWm/Ds520AQ0kDvq+XKqAra4JpCG++4Z+yHVWF1hh85jC5jPXk/RlLnlNL+rcGLq7RQILlL6T
 tPFNTfEG+B8T0G05XXILuGbsDtd6pns+SEtJ9Ube10+126ECR7waYHv8/xWbjaZiLedmka+aY+x
 OnXrsPbpHU10z4xukO+5YvYzkII0esDTOagXjfAvziPdrNSzaBFEg4igsGvu4TL2YXNM64jcJhQ
 lRt0E1b3ft+xY+czul9WwOUwjj1FlQ73mJjA9RkW5ox4=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The USB multiport controller needs a few additional resets, add these to
the driver.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/clk/qcom/gcc-sc8180x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index 5261bfc92b3d..f77578e98ca7 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -4546,6 +4546,10 @@ static const struct qcom_reset_map gcc_sc8180x_resets[] = {
 	[GCC_USB3_PHY_SEC_BCR] = { 0x50018 },
 	[GCC_USB3PHY_PHY_SEC_BCR] = { 0x5001c },
 	[GCC_USB3_DP_PHY_SEC_BCR] = { 0x50020 },
+	[GCC_USB3_UNIPHY_MP0_BCR] = { 0x50024 },
+	[GCC_USB3_UNIPHY_MP1_BCR] = { 0x50028 },
+	[GCC_USB3UNIPHY_PHY_MP0_BCR] = { 0x5002c },
+	[GCC_USB3UNIPHY_PHY_MP1_BCR] = { 0x50030 },
 	[GCC_SDCC2_BCR] = { 0x14000 },
 	[GCC_SDCC4_BCR] = { 0x16000 },
 	[GCC_TSIF_BCR] = { 0x36000 },

-- 
2.43.0


