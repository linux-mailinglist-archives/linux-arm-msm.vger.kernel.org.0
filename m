Return-Path: <linux-arm-msm+bounces-26382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 947E3933370
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 23:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D7FC1F22CE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 21:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8B21459E5;
	Tue, 16 Jul 2024 21:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bG/ijgEC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71877143C72
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 21:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721164422; cv=none; b=Tf05JOjOhm+NOD19t2HcMHVsRnWCoW3Pz/I8ZgIAYNxZ8AZBbauI8lsdZXQpb5G2RZaCiZj9a+7aD0Ba2xy68gLjBX4zaiwvBxDnbow3cfd6TNzBkDuCJJj0g4s6RR5WUve5cMhYrIZklGUI1mwBG2ri8v6FXbOkUiT6bdJqRkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721164422; c=relaxed/simple;
	bh=H3P6kcYgEgVhoPQwydl2FDKVuyQZG8UJAHqrnYyjk8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fIfe1uwO834pWRDqS63qZZ+J/HORZtFIe/tmuj64oJcheC/NgdDJ24mmxt7IutJR3jNielXWt2I6Hxm/X9cOTUxeMBVO2rWnq2gHIx+vBgm2DQmEM26+DObEYBwAc/VbXVwrqh2MEnD7ebPSVqhAesFE9LEjBbnf3RiPiu0IOo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bG/ijgEC; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so70247331fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 14:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721164418; x=1721769218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9WJDtlwTe+07Bn8gATLWTCXpz+MbUah3v7QpVZBYUg=;
        b=bG/ijgEC6kW5th2JRL+dgNaVN2tE5zxsD8N8D399EOzpyVyAi1NkzbgVQQxt0D4/L7
         a135CUEkrjBX6lVcCI/uTRXZI+SHF1+7XVdgduJYAJH8pgk4FixENoPhPNMYECgLnlt1
         yf/XbYY6IChkqJix26v6oEecJOzy4X02k8Lk25AzCoOHad2j5XHjiINX6qj/CJmuXpSk
         0g2JL7Fyu2MbULoAO43ZOJ/lMpOuVKNHajdrf5vlhicLFjOiDsV61eNIu17e9i6n5+Ac
         Kq9F8mH41rTIh02MItQO7wKxeGkGYF5n67suKM70kvg6fbRAOX+VPAvu/2zxjJIrZrX5
         ouqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721164418; x=1721769218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9WJDtlwTe+07Bn8gATLWTCXpz+MbUah3v7QpVZBYUg=;
        b=mmh0RhFEF5HevISF1ILgLoV4SY4kz64+dIoNCx1ZzRI65lVaIOZGF+Gpulmhk+vX36
         HDhMzj2K3YFxtpVhy3kkVgu47ZdtgRMnLPx56iVspwJ2/tDo1/a4RQL7ZqqMWYazDwzB
         9yJeBf5CmMWZ3eyAqNMCmbaCDGO6yz1D4GzrvGZmHoNG6YsUsawjv5t6Rdn14xrCZhzq
         ItnNhQvgKYUUamZ+wTknPDsQqpa1cuUCPlJwTJnuXglDppUrMtvylzL7L1+STb3+ezwo
         RROI0Tsf2k9d4Y3Advgk3RmoFCa4UROiSC+y56lGFpKthpXgSptRNxSMHEopDATZ8mj+
         HZEg==
X-Gm-Message-State: AOJu0Yybf6ml6+9ftL/ORGDPTRfvrTEOQqG+jSWQXK1WsixhIwi0m5q/
	HrrgxY7HhhaOKhPTBxp4KAeuDwwgjuyRawDQI7zWZrKr/KzejC82AtoAOuFOYl0=
X-Google-Smtp-Source: AGHT+IFkA38xROXdLdaRd9HzLEhZh2K4goFlkGEWdmjXRGM/yK6Xz4sem+3IN+N/leOnCUcXoOZhTA==
X-Received: by 2002:a2e:9586:0:b0:2ec:5075:83d2 with SMTP id 38308e7fff4ca-2eef418f3e3mr23261631fa.22.1721164417679;
        Tue, 16 Jul 2024 14:13:37 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee179e723sm12433871fa.24.2024.07.16.14.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 14:13:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 00:13:34 +0300
Subject: [PATCH 7/7] dt-bindings: clock: qcom,sm8650-dispcc: replace with
 symlink
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240717-dispcc-sm8550-fixes-v1-7-efb4d927dc9a@linaro.org>
References: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
In-Reply-To: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5699;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=H3P6kcYgEgVhoPQwydl2FDKVuyQZG8UJAHqrnYyjk8I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmluJ6nvyR/mTVhbJMB/xIW9PAiNIi2rh1i+OrT
 iBDrKIdUQCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpbiegAKCRCLPIo+Aiko
 1bTdCACOrvqnZCxUDceulA7HJkt5PZcXO+zWMhVj+v9/dgRvkmoAUEJpcgvRQsPvMEvR2h3kQpe
 9VCzCY27X5ckzRihUp5NG9W/Yishn6XNuwkFiuC52VnNcKIhaHUrgylhgzwlLSsz9z3o4zj6SJ/
 2t79XR2+UVAlBLmZSIKWdsoM8r364UOfkpOfjnQogOHrHnxinLw8NuomaczwfXrr5GSztZnPWjS
 wWff5L6I3u1f/FIX6t76HjxOTjmrSIz3Jwt2IH5EMW8hHPmU0vVa4ttc3Keo8KQQbMdNQGgBqaH
 fcUKVXUi8UsNCQCeJIMcDD4sVmcLy0uNv1v9xJMp69Jje24h
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The display clock controller indices for SM8650 and SM8550 are
completely equal. Replace the header file for qcom,sm8650-dispcc with
the symlink to the qcom,sm8550-dispcc header file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8550.c               |   2 +-
 include/dt-bindings/clock/qcom,sm8650-dispcc.h | 103 +------------------------
 2 files changed, 2 insertions(+), 103 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index 78e11eade2ea..9ffcd9eb9283 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -1776,7 +1776,7 @@ static int disp_cc_sm8550_probe(struct platform_device *pdev)
 	}
 
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8650-dispcc")) {
-		lucid_ole_vco.max_freq = 2100000000;
+		lucid_ole_vco[0].max_freq = 2100000000;
 		disp_cc_mdss_mdp_clk_src.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src_sm8650;
 	}
 
diff --git a/include/dt-bindings/clock/qcom,sm8650-dispcc.h b/include/dt-bindings/clock/qcom,sm8650-dispcc.h
deleted file mode 100644
index b0a668b395a5..000000000000
--- a/include/dt-bindings/clock/qcom,sm8650-dispcc.h
+++ /dev/null
@@ -1,102 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
-/*
- * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved
- * Copyright (c) 2023, Linaro Ltd.
- */
-
-#ifndef _DT_BINDINGS_CLK_QCOM_SM8650_DISP_CC_H
-#define _DT_BINDINGS_CLK_QCOM_SM8650_DISP_CC_H
-
-/* DISP_CC clocks */
-#define DISP_CC_MDSS_ACCU_CLK					0
-#define DISP_CC_MDSS_AHB1_CLK					1
-#define DISP_CC_MDSS_AHB_CLK					2
-#define DISP_CC_MDSS_AHB_CLK_SRC				3
-#define DISP_CC_MDSS_BYTE0_CLK					4
-#define DISP_CC_MDSS_BYTE0_CLK_SRC				5
-#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				6
-#define DISP_CC_MDSS_BYTE0_INTF_CLK				7
-#define DISP_CC_MDSS_BYTE1_CLK					8
-#define DISP_CC_MDSS_BYTE1_CLK_SRC				9
-#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				10
-#define DISP_CC_MDSS_BYTE1_INTF_CLK				11
-#define DISP_CC_MDSS_DPTX0_AUX_CLK				12
-#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				13
-#define DISP_CC_MDSS_DPTX0_CRYPTO_CLK				14
-#define DISP_CC_MDSS_DPTX0_LINK_CLK				15
-#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				16
-#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			17
-#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			18
-#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				19
-#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			20
-#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				21
-#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			22
-#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		23
-#define DISP_CC_MDSS_DPTX1_AUX_CLK				24
-#define DISP_CC_MDSS_DPTX1_AUX_CLK_SRC				25
-#define DISP_CC_MDSS_DPTX1_CRYPTO_CLK				26
-#define DISP_CC_MDSS_DPTX1_LINK_CLK				27
-#define DISP_CC_MDSS_DPTX1_LINK_CLK_SRC				28
-#define DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC			29
-#define DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			30
-#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK				31
-#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			32
-#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK				33
-#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			34
-#define DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK		35
-#define DISP_CC_MDSS_DPTX2_AUX_CLK				36
-#define DISP_CC_MDSS_DPTX2_AUX_CLK_SRC				37
-#define DISP_CC_MDSS_DPTX2_CRYPTO_CLK				38
-#define DISP_CC_MDSS_DPTX2_LINK_CLK				39
-#define DISP_CC_MDSS_DPTX2_LINK_CLK_SRC				40
-#define DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC			41
-#define DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			42
-#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK				43
-#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			44
-#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK				45
-#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			46
-#define DISP_CC_MDSS_DPTX3_AUX_CLK				47
-#define DISP_CC_MDSS_DPTX3_AUX_CLK_SRC				48
-#define DISP_CC_MDSS_DPTX3_CRYPTO_CLK				49
-#define DISP_CC_MDSS_DPTX3_LINK_CLK				50
-#define DISP_CC_MDSS_DPTX3_LINK_CLK_SRC				51
-#define DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC			52
-#define DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			53
-#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK				54
-#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			55
-#define DISP_CC_MDSS_ESC0_CLK					56
-#define DISP_CC_MDSS_ESC0_CLK_SRC				57
-#define DISP_CC_MDSS_ESC1_CLK					58
-#define DISP_CC_MDSS_ESC1_CLK_SRC				59
-#define DISP_CC_MDSS_MDP1_CLK					60
-#define DISP_CC_MDSS_MDP_CLK					61
-#define DISP_CC_MDSS_MDP_CLK_SRC				62
-#define DISP_CC_MDSS_MDP_LUT1_CLK				63
-#define DISP_CC_MDSS_MDP_LUT_CLK				64
-#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				65
-#define DISP_CC_MDSS_PCLK0_CLK					66
-#define DISP_CC_MDSS_PCLK0_CLK_SRC				67
-#define DISP_CC_MDSS_PCLK1_CLK					68
-#define DISP_CC_MDSS_PCLK1_CLK_SRC				69
-#define DISP_CC_MDSS_RSCC_AHB_CLK				70
-#define DISP_CC_MDSS_RSCC_VSYNC_CLK				71
-#define DISP_CC_MDSS_VSYNC1_CLK					72
-#define DISP_CC_MDSS_VSYNC_CLK					73
-#define DISP_CC_MDSS_VSYNC_CLK_SRC				74
-#define DISP_CC_PLL0						75
-#define DISP_CC_PLL1						76
-#define DISP_CC_SLEEP_CLK					77
-#define DISP_CC_SLEEP_CLK_SRC					78
-#define DISP_CC_XO_CLK						79
-#define DISP_CC_XO_CLK_SRC					80
-
-/* DISP_CC resets */
-#define DISP_CC_MDSS_CORE_BCR					0
-#define DISP_CC_MDSS_CORE_INT2_BCR				1
-#define DISP_CC_MDSS_RSCC_BCR					2
-
-/* DISP_CC GDSCR */
-#define MDSS_GDSC						0
-#define MDSS_INT2_GDSC						1
-
-#endif
diff --git a/include/dt-bindings/clock/qcom,sm8650-dispcc.h b/include/dt-bindings/clock/qcom,sm8650-dispcc.h
new file mode 120000
index 000000000000..c0a291188f28
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8650-dispcc.h
@@ -0,0 +1 @@
+qcom,sm8550-dispcc.h
\ No newline at end of file

-- 
2.39.2


