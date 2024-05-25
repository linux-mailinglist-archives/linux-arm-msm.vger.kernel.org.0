Return-Path: <linux-arm-msm+bounces-20459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E584D8CF0BF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C5FB1C21033
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 18:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8076B129E92;
	Sat, 25 May 2024 17:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5PM8IBY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7B7129E6E;
	Sat, 25 May 2024 17:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659953; cv=none; b=fSMhfW01uioglDH01kGtJBbALgfaHUEac7LyCX7Dg5KnlNssUMfoZkBsvXObCZl+CRWRsg9dQ8aLa9VmWyXWMBkJys9j4AGdGiaxvQbxLigYEZq5FrkwtJdpTOBgYEVKKb2g9MYHZ2/NyxBWjLIzuC+mhPAyKkMBahv/JQxuB5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659953; c=relaxed/simple;
	bh=soqRPnZjjJB4ZlQU7QW4BOCssVYk6gZoz0PwLz9+tRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kfc5RsNY3U1ApMQB2zmBIyVn9Pk10E5c+YB+b9DCxlUnlnmU+XiEv3GMTOo2kvpYWP/fEXIynPBEPy1Fsj6T8jDNCOXBEFE8ssO6c/t0upHFE3NDMlx0IMPtC+eacRv11eCCA4PuNyL8bRMA3I9W/aL/4lpPCZhasrL2bro3ouk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5PM8IBY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0717C4AF17;
	Sat, 25 May 2024 17:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716659952;
	bh=soqRPnZjjJB4ZlQU7QW4BOCssVYk6gZoz0PwLz9+tRg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X5PM8IBYcGya57eIPT35+9rtnd4PQ/FHqSBXalbzUelH9Q6ybYvUFMTDPHInVurCM
	 xvTTlLR+TFMh/5Mb4gn/AwdyN+seZANm7RfcckXZI9KB6pNraB79XebY8OQVXoGIWt
	 wBdX20aX52FRruZRJ9vObqD/OGRkG4FMi6Uld8QNh3147cmlJLJ3caofvnDL7ied1+
	 pXw4xizaI8NdOS6qIMCnsVpXZ3IBaDLyYOreLR6R3vAAKcLRgOAxKJUW/PgJODMzMR
	 enRaEND6uqhFm6Y5BlRQwU9KaijLRPFdQUZuBwEQqmq7g1stvGOg3uU32h2tdoYvc/
	 EMrspGi5WplSA==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sat, 25 May 2024 11:03:56 -0700
Subject: [PATCH 03/10] dt-bindings: clock: qcom: Add missing USB MP resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-sc8180x-usb-mp-v1-3-60a904392438@quicinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=874;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=0yG3M/DBR1IOgr30XcxtDO66mM+1kZE3mmBBrbr23/c=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmUigMc5GnZG9v/qf1XcU0lQeQRxuHbzgH4I/l1
 xzitEJH+OeJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZlIoDBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWvAA//fse7KaKPFJIvC2QiCYkYkxud8hw6V/s6krcjLtn
 /u/+wrRmGKsSQMg5T1tQ/OsEnctkKIM3vzrA/XzSVtNh45pULKAneRuRfbn4ILHIV/ZX3G8mkt6
 PeBdUFmW/E7KQGfW9fvUcwhoOHufgtYGJ6CkHOgw1M2e7uurKXi9GrvzWIf/Pwj+yK0L0EgtxHm
 tCKWvjttXnoNnYW5wbOpNJLoLQPo7QcLqYgZdqozWSt7ITdV9xK3aJxeEe+3y9OPWknHtRzal5V
 /d5Hic5CF61oynL++nA7rxUPfXhZLtlsIgoK7Gap93Z4snzIHKHwq1IEPKFjYfJqjf0MtISCiaD
 JDzrmdKkIv0oFs5E0ahWukZfVB6HTXitd5oQ67f6uolfYhBsjX2StWtei2bcK7g4OpEOkUugbfJ
 eQ6Vji7W7OZbnMcWRCavH7UAiVZk/VcLoYfC7RpCqWSRIZ+V7B5wXudfZWY48KAj8F08afrrogJ
 kmgK8YEBDnUlhDxgwvUe0KfNO0UzaIT/YeBntl1UHgYDcB4b+gEPN6YIQESuKl2TfKI0Fkz5ikr
 siH+JuJpigTw4ghNX496Lx7zbAE/oyWyo9yk0cxxU8D0F9Xpk8Ofwy687YvSWxNx1N1wE32er8C
 g8PSDrHIe3CDNeyYAnVvmM9DlJqMgFlyqaAppTQD0OHo=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The USB multiport controller needs a few missing resets, describe them
in the binding.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 include/dt-bindings/clock/qcom,gcc-sc8180x.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc8180x.h b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
index 90c6e021a035..487b12c19db5 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc8180x.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
@@ -294,6 +294,10 @@
 #define GCC_VIDEO_AXI0_CLK_BCR					42
 #define GCC_VIDEO_AXI1_CLK_BCR					43
 #define GCC_USB3_DP_PHY_SEC_BCR					44
+#define GCC_USB3_UNIPHY_MP0_BCR					45
+#define GCC_USB3_UNIPHY_MP1_BCR					46
+#define GCC_USB3UNIPHY_PHY_MP0_BCR				47
+#define GCC_USB3UNIPHY_PHY_MP1_BCR				48
 
 /* GCC GDSCRs */
 #define EMAC_GDSC						0

-- 
2.43.0


