Return-Path: <linux-arm-msm+bounces-1325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 226F27F295B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 10:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 517151C20946
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 09:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F9A3C081;
	Tue, 21 Nov 2023 09:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pqYNozjj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32D71F4
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 01:51:15 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40b2afd049aso1591465e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 01:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700560273; x=1701165073; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gp2TNSI1Gs2EmPQurEidEEep2Vv4EbZ/khjCjjp1jWY=;
        b=pqYNozjj9hZKvmDxdKVcFuzgCwQ4MfYiF5NrC+oxQH6LFcHVJAgZbkzlDxB1JpOuBP
         ZVpjsa4xTWZ3aJXFtbJlVKNlKJ/jiM11tOkWT95BImoI3IS9VuBqt6EydDzpCVzGoIFP
         3UAWGU3gfW8JwRsmu28xaxtN55P4ujbSJldE+RaK7lnahvX95NBMIz3VeXLc/m2GaiFC
         fpnLiREIFTyc72hT2Qz5cMZmyEdRYf45vFT2aEvDgv5w5hoS0aW4y91a/R55l7n+i1WA
         9F4faLFDuAT4nE7/nFu+/9DpiShfgX/7ku/8kD5rcWunsxLDed7TwTas5O0yYEJO7LCr
         mbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700560273; x=1701165073;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gp2TNSI1Gs2EmPQurEidEEep2Vv4EbZ/khjCjjp1jWY=;
        b=GouLZL7VAWRkQ8YkG7ri1g1aBcnuNY4ZAd2QUDgVs2aYhR7QIhe63hn6KB3dLtLBul
         mbXyVnkyaWf3/PoXfBNnbF9jYVV6SHNjg+yD+sC0GU6PV89DqVQbKlZMXaNTPeb6hvq7
         /yJzBY0bU2DRjilOgx7MoYkI1ZMs1F0AqNBCfFWOT6VshZUfbxnH3IRIreAe0hEKlRmh
         HEccIHDTrpa8pCdwK/JOnmUop37xWKgKrg6C/OLcQkhMGMn0vIXm7H/PHy/yxD8TZkmQ
         1KyBAPlwigCXR0wQ2j7NlwrBHUq1PRakHvnAN7AOmNVimEuIvqUinyxFwCql3/Qba3Yp
         tSxA==
X-Gm-Message-State: AOJu0YxlMtnAt9n+Z3tCWm0kr0wbiHEfCAQIvw8vRaebs26Qy7qbOfYF
	kJZTqoPy0qBV0oRQXbfN5pWgjw==
X-Google-Smtp-Source: AGHT+IEqchWEaRf3vJf2eHIgK1W8abA02a8geVzEjClI8ifbluQO1t7DjZuFrXzY4FpXunUKLKJj/Q==
X-Received: by 2002:a05:600c:358c:b0:405:7b92:453e with SMTP id p12-20020a05600c358c00b004057b92453emr7881425wmq.37.1700560273592;
        Tue, 21 Nov 2023 01:51:13 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id z16-20020a05600c221000b0040472ad9a3dsm16105068wml.14.2023.11.21.01.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 01:51:13 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 21 Nov 2023 10:51:11 +0100
Subject: [PATCH] arm64: deconfig: enable Qualcomm SM8650 SoC drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231121-topic-sm8650-upstream-defconfig-v1-1-2500565fc21b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAI59XGUC/x3NQQqEMAxA0atI1gbaDhZnriIupE00C9vS6DAg3
 n2Ky7f5/wKlKqTw6S6o9BWVnBps30HYlrQSSmwGZ9zLWmfxyEUC6j76weBZ9Ki07BiJQ04sK0Z
 m8mze3gcDrVIqsfyewzTf9x+k/hgOcQAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=duoOtpjsw8oDmAagwU+LZ25wk3WFADYydw5Bw8RpyHw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlXH2QHLIE9nmslVg2Ia/r5d1ICCytU9AjNhX2Ieqn
 oWg0xMiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZVx9kAAKCRB33NvayMhJ0WVXEA
 Cjw6+Eo3bg1Wr8n87y1cN9ktauAR3wIYl9CsKRmbvOGjbpGWKk5yeNsctI7dFBL3ABYKLIUZRhgYGe
 iVOnsLY4B3Lg4li1nSIatXseI1PF3u7HaH6VlPRZaE4zGZbRpJyPvlk/BdJM0En/hNtUKXHjJfPjNs
 5Utdx8XNrfcw58WQFklm22bmXV28S3AmlM0DlTHXAcuUrvTKjH3/XL+POoRq3OekVL3jIeYpW/ehTP
 r+Tl3GbzgmjCW3oLHA8nkUxF8x/TSPywKFnANGU1h7vg5Cyx0Co72lHYyhG76ipl6vYeEEKlptgDY5
 0/kc/ciai9SbD3df+wEN0747+0ucElWbxu0Z7yufTT/2VFWVjFf9DwzBLxaPhaXCkp7bUjGN/2gsEu
 DZ+Zlm4c+ug8pPU//8U67uJi9LhPSWfIY2IDI2xDM//mUfVXoukIs617DUesbC8fGYd7LDsWOLy9+l
 I/rwktaM6GbQOokeCkr0pmn3xbA5T/0yzHPk1vJKpn0GesbygxFWNbrh8f6ZLwuM/CVkMxB8sBikbf
 lTRrShvopgnrlLP1g86164aFBQPzXQpo5qWK2f6M3GzOgQ528c4FubLEaaW+nXK/OO59gP/kNgBcBN
 K7DsZQxvpQ/u0mDQnmn7ZTgXsS2TUuxaIHxjzVWzkFUXya1ocnuHpXv88WMA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Enable Clocks, Pinctrl and Interconnect drivers in the ARM64
defconfig for the Qualcomm SM8650 SoC to boot the SM8650 MTP
(Mobile Test Platform) and QRD (Qualcomm Reference Device) boards.

TCSRCC, GCC, Interconnect, and Pinctrl config are marked as builtin and
not modules due to boot dependencies.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
For convenience, a regularly refreshed linux-next based git tree containing
all the SM8650 related work is available at:
https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm85650/upstream/integ
---
 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b60aa1f89343..55a196a49c34 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -613,6 +613,7 @@ CONFIG_PINCTRL_SM8450=y
 CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
 CONFIG_PINCTRL_SM8550=y
+CONFIG_PINCTRL_SM8650=y
 CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_LPASS_LPI=m
 CONFIG_GPIO_AGGREGATOR=m
@@ -1257,14 +1258,18 @@ CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
 CONFIG_SM_DISPCC_8450=m
 CONFIG_SM_DISPCC_8550=m
+CONFIG_SM_DISPCC_8650=m
 CONFIG_SM_GCC_6115=y
 CONFIG_SM_GCC_8350=y
 CONFIG_SM_GCC_8450=y
 CONFIG_SM_GCC_8550=y
+CONFIG_SM_GCC_8650=y
 CONFIG_SM_TCSRCC_8550=y
+CONFIG_SM_TCSRCC_8650=y
 CONFIG_SM_GPUCC_6115=m
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
+CONFIG_SM_GPUCC_8650=m
 CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
@@ -1524,6 +1529,7 @@ CONFIG_INTERCONNECT_QCOM_SM8250=m
 CONFIG_INTERCONNECT_QCOM_SM8350=m
 CONFIG_INTERCONNECT_QCOM_SM8450=y
 CONFIG_INTERCONNECT_QCOM_SM8550=y
+CONFIG_INTERCONNECT_QCOM_SM8650=y
 CONFIG_COUNTER=m
 CONFIG_RZ_MTU3_CNT=m
 CONFIG_HTE=y

---
base-commit: 07b677953b9dca02928be323e2db853511305fa9
change-id: 20231121-topic-sm8650-upstream-defconfig-dffe6f0966c0

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


