Return-Path: <linux-arm-msm+bounces-4283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C050580DE6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 23:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 765142824E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 22:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4523E55C24;
	Mon, 11 Dec 2023 22:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z0HC5gj5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA2CCDB
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 14:46:15 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54c79968ffbso6690394a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 14:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702334774; x=1702939574; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wCLPI7bH+3S27i/ILivETHCwTpYXRhVoatws0XCHn9U=;
        b=z0HC5gj5mMISBJgMoSEBEDECL+yjGp8rKN6GB3QIyfp1iTFPjKWIJiCR4hSJFsHwxx
         Slf26vinpBvDIuOi1VxFOai2Ed8/2Xjsa4GcQ7jxhwi+ohsuZFiFNwIgBH5ryzkQBN/M
         98hxbYp/mbarSAXq1omsncd5QmqDHHDZogN9vHe7XNQ/GMUMnCZfBoabpGnIl7WzPt3o
         6TLQYttyyRr4Lob6OPwM2esNTCL6aj9N/od6skeOexeeO8+23CtZgX601RA5vuxIY0E3
         YY4pQ67Y30GOQwB1Eq5o7eUQHyZbFqRZQJ/uf5ibtkavvjyM0lpk3RtkZEPfXCrDVlUa
         ACtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702334774; x=1702939574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCLPI7bH+3S27i/ILivETHCwTpYXRhVoatws0XCHn9U=;
        b=k5DteBYhRb49ojgK+c+oSinQ69qsG7Xp7BrzB2EE82FVFG+w1nEJ7BMb2ZVJVi5qhC
         DLk/5I6Kmgoh1Dr3tXOftouS6xGAksvTMGxSrSEDwmPs3p20/B+ook51jZ54sBTW+2Kk
         U5VXi1lTnQ+AI/Q0bbs5w/mpMqhS+RTlagy1msB4n4keZR7lCdt/1etmGc2mWsKd74vw
         z6Qh6Wq/1IjQIXYaW2NZqi9Yw8zXiWPx6NmFTUfKatvfkTwSbKA683ZdwvNZpjlr590V
         yNZDHr9kP3chm74zIbLGSC4d56NVWQP7X+kF94oC5xGCZh93FMrESaPU9n93hYqOyszs
         QTjA==
X-Gm-Message-State: AOJu0YwuMbCRqf8Tie448SxIufViht2uO1gVHiS1uT3rt8t8IFfGn3oH
	VwPNuDbioUuWjvOwghLAljPdDw==
X-Google-Smtp-Source: AGHT+IFf3TFH3Vq8IqCVrsc10vqAtg/huwnES61DvJq6mhKHgfkX2oXYrK/cvtToGG0f3G0hT9s47w==
X-Received: by 2002:a50:871e:0:b0:54d:712c:2323 with SMTP id i30-20020a50871e000000b0054d712c2323mr2601746edb.16.1702334774393;
        Mon, 11 Dec 2023 14:46:14 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id if3-20020a0564025d8300b0054afcab0af2sm4091789edb.59.2023.12.11.14.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 14:46:14 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 12 Dec 2023 00:45:42 +0200
Subject: [PATCH 02/10] dt-bindings: clock: qcom: Document the X1E80100
 Display Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231212-x1e80100-clock-controllers-v1-2-0de1af44dcb3@linaro.org>
References: <20231212-x1e80100-clock-controllers-v1-0-0de1af44dcb3@linaro.org>
In-Reply-To: <20231212-x1e80100-clock-controllers-v1-0-0de1af44dcb3@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5335; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=SR7cwWuwrAzLkn1MdxMzxwbh9Ip0B4d2L9ip2mgk18A=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBld5ElvntL5DjE5bE9JnkZCvgb3D0JAiPu5uEJr
 9TK0gSzNBiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXeRJQAKCRAbX0TJAJUV
 VqgvD/9gCOqnm7FjMy7a66PkaedEj3x8CuE+N+6Le8kxaX09lP47H5L22QclKysKew+NhQHR5ly
 UGD6swtRaei5NC80MkbhKybk1JsEDC3Dmgx7c0CH4snJ/qZc6gcJeKUNe7H+xMo3M+8lwEedXfy
 4Ip5QCEQ2fgrF165wsidv6edP2JoHADj5c6QtSYURzqoctGVNKZdJJGt3s+ldD7/myEPuAiInFt
 DA4n4TmWKkfa9Q7CilUEtn2kQH4XC/skhBM416dE3voK8LoS4AUiR/rk+CG0M47BJ1Q2W31/sI+
 y1/OR4aL49bfTOL3N2vktnIHqRYOybOVs/mHP88Nwghb6rJ9qBMMUK6WCg3VoS4SjreMganAn6V
 DE2Lh7/zGQ+YRRIxyyFkKkBb5F2qPN5O6ri7wbxULPt1QBGAVCg2XgimflPd/9NX57zMJ+cC3Yc
 v3l9mt1aGUyaZr5u2VtYyHmb2bKX/jQqAi0JNtansbpRMxvoWp6ehI61NwXXPBbzT3injOtKESI
 fKZgg0cp4OttuQhCMnu87PW32x2JFjRHRMkYkaPtG1SnPM7ZPr1cZEnH0yfXjLrTiWRCGT6bDNr
 cKNoiwfeWAeaiT46Ya/isgfnT+Agmn2fPedyKIVscM3QdGu3hIle8ln8eaRdPzs3bG47cUQTr1H
 qrVsEzoEkyQGwCQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Rajendra Nayak <quic_rjendra@quicinc.com>

Add bindings documentation for the X1E80100 Display Clock Controller.

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |  2 +
 include/dt-bindings/clock/qcom,x1e80100-dispcc.h   | 98 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index 369a0491f8d6..bad0260764d4 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -17,12 +17,14 @@ description: |
   See also:
   - include/dt-bindings/clock/qcom,sm8550-dispcc.h
   - include/dt-bindings/clock/qcom,sm8650-dispcc.h
+  - include/dt-bindings/clock/qcom,x1e80100-dispcc.h
 
 properties:
   compatible:
     enum:
       - qcom,sm8550-dispcc
       - qcom,sm8650-dispcc
+      - qcom,x1e80100-dispcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,x1e80100-dispcc.h b/include/dt-bindings/clock/qcom,x1e80100-dispcc.h
new file mode 100644
index 000000000000..6bbb5c2d0b16
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,x1e80100-dispcc.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_X1E80100_DISP_CC_H
+#define _DT_BINDINGS_CLK_QCOM_X1E80100_DISP_CC_H
+
+/* DISP_CC clocks */
+#define DISP_CC_MDSS_ACCU_CLK					0
+#define DISP_CC_MDSS_AHB1_CLK					1
+#define DISP_CC_MDSS_AHB_CLK					2
+#define DISP_CC_MDSS_AHB_CLK_SRC				3
+#define DISP_CC_MDSS_BYTE0_CLK					4
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				5
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				6
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				7
+#define DISP_CC_MDSS_BYTE1_CLK					8
+#define DISP_CC_MDSS_BYTE1_CLK_SRC				9
+#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				10
+#define DISP_CC_MDSS_BYTE1_INTF_CLK				11
+#define DISP_CC_MDSS_DPTX0_AUX_CLK				12
+#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				13
+#define DISP_CC_MDSS_DPTX0_LINK_CLK				14
+#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				15
+#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			16
+#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			17
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				18
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			19
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				20
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			21
+#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		22
+#define DISP_CC_MDSS_DPTX1_AUX_CLK				23
+#define DISP_CC_MDSS_DPTX1_AUX_CLK_SRC				24
+#define DISP_CC_MDSS_DPTX1_LINK_CLK				25
+#define DISP_CC_MDSS_DPTX1_LINK_CLK_SRC				26
+#define DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC			27
+#define DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			28
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK				29
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			30
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK				31
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			32
+#define DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK		33
+#define DISP_CC_MDSS_DPTX2_AUX_CLK				34
+#define DISP_CC_MDSS_DPTX2_AUX_CLK_SRC				35
+#define DISP_CC_MDSS_DPTX2_LINK_CLK				36
+#define DISP_CC_MDSS_DPTX2_LINK_CLK_SRC				37
+#define DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC			38
+#define DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			39
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK				40
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			41
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK				42
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			43
+#define DISP_CC_MDSS_DPTX2_USB_ROUTER_LINK_INTF_CLK		44
+#define DISP_CC_MDSS_DPTX3_AUX_CLK				45
+#define DISP_CC_MDSS_DPTX3_AUX_CLK_SRC				46
+#define DISP_CC_MDSS_DPTX3_LINK_CLK				47
+#define DISP_CC_MDSS_DPTX3_LINK_CLK_SRC				48
+#define DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC			49
+#define DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			50
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK				51
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			52
+#define DISP_CC_MDSS_ESC0_CLK					53
+#define DISP_CC_MDSS_ESC0_CLK_SRC				54
+#define DISP_CC_MDSS_ESC1_CLK					55
+#define DISP_CC_MDSS_ESC1_CLK_SRC				56
+#define DISP_CC_MDSS_MDP1_CLK					57
+#define DISP_CC_MDSS_MDP_CLK					58
+#define DISP_CC_MDSS_MDP_CLK_SRC				59
+#define DISP_CC_MDSS_MDP_LUT1_CLK				60
+#define DISP_CC_MDSS_MDP_LUT_CLK				61
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				62
+#define DISP_CC_MDSS_PCLK0_CLK					63
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				64
+#define DISP_CC_MDSS_PCLK1_CLK					65
+#define DISP_CC_MDSS_PCLK1_CLK_SRC				66
+#define DISP_CC_MDSS_RSCC_AHB_CLK				67
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK				68
+#define DISP_CC_MDSS_VSYNC1_CLK					69
+#define DISP_CC_MDSS_VSYNC_CLK					70
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				71
+#define DISP_CC_PLL0						72
+#define DISP_CC_PLL1						73
+#define DISP_CC_SLEEP_CLK					74
+#define DISP_CC_SLEEP_CLK_SRC					75
+#define DISP_CC_XO_CLK						76
+#define DISP_CC_XO_CLK_SRC					77
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_CORE_INT2_BCR				1
+#define DISP_CC_MDSS_RSCC_BCR					2
+
+/* DISP_CC GDSCR */
+#define DISP_CC_MDSS_CORE_GDSC					0
+#define DISP_CC_MDSS_CORE_INT2_GDSC				1
+
+#endif

-- 
2.34.1


