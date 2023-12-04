Return-Path: <linux-arm-msm+bounces-3257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAA48033BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CEF61C20843
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD8A249F0;
	Mon,  4 Dec 2023 13:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YL9GK0K1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAEC9D8
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 05:01:55 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40b479ec4a3so44007065e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 05:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701694914; x=1702299714; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zv/eJcHawXXFoFHawlDfjkpiHN2LaBMOvdkHEZ54RT0=;
        b=YL9GK0K1xo1FnldTAU/rLk6HGtwTMKJ5rHac23ob3n8WXryEejiUFetMroYq7OKSCW
         5u3b/OQejK8DUerxG1WTiUqFyHXPjAQaXW5VwwyQqhlUjGg/dQq0AITuZLssCyk4gDTA
         FD+lxqtEegNbzo0i1IlqXhmhAdmYCY9GamGvAAyxNxd9XsuiVTbjpPmAG/gIlkc0Q0Ay
         MgXNKcugUYy47ntcixvDzA7/uQio9Gml+K4GcV2N+I6T+jvgcg/58klm4+NOgf1KFSIR
         nRPqfCXM//k+cctYo8sByHO4nIcdv4xCwmhRdeuvPiflHNdQPrwNS+p509N3aG2rs5X+
         hy3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701694914; x=1702299714;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zv/eJcHawXXFoFHawlDfjkpiHN2LaBMOvdkHEZ54RT0=;
        b=d6Sw2hyJTsB6U9ad31+JnN3EveqInWNR4Y9ovJ1/N/o/brlqvD2KpiDkuJRYR6O/OC
         cA+ZHWywlX1WI+QMgqi6S45qK727Tcp+T72TkdGBXU+ppnQTC6z1/KAgXP/eQMF01XDI
         hgSyHkEeaC6zBFhxcKN2ISPn7DdytIT1DcsR+6kx1tlaldX99aXGxyRIzBOSgIOqmbzf
         I2xZFCPVWTPTE9K955uCiaPD4VzJySvPGHzNNOE2Ho8ZDOC/YQNeEo0UCSUSCMAY50Qv
         s0RH378V5AF4rlqvHp4yZWMyfUPehQ4VwXOHqHX13XC1/SaNothat9bDaPi+hZS9i2Jj
         qdyA==
X-Gm-Message-State: AOJu0YyAIYs/WppChyIk9y8thFbrtWsOgAG8fEoinE3gvuBP1FECdqtT
	YCVe57B9PjUMUJo6GC7LJguEmOwBFLP8OVvnxd4U1lgU
X-Google-Smtp-Source: AGHT+IHLK74clg3zu7Qh7K95BwgXcZW9Dd26WnIA9pNWnWKFMKj2MgNLr7yuo5H2cdX2hlrwcDO1QA==
X-Received: by 2002:a05:600c:3ba4:b0:40b:5e22:961 with SMTP id n36-20020a05600c3ba400b0040b5e220961mr3046777wms.80.1701694913864;
        Mon, 04 Dec 2023 05:01:53 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id g18-20020a5d6992000000b003333abf3edfsm6347879wru.47.2023.12.04.05.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:01:53 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 04 Dec 2023 14:01:47 +0100
Subject: [PATCH] arm64: defconfig: enable GPU clock controller for
 SM8[45]50
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231204-topic-sm8x50-upstream-gpucc-defconfig-v1-1-e615df0c4af9@linaro.org>
X-B4-Tracking: v=1; b=H4sIALrNbWUC/x3NQQqDMBBA0avIrDsQEyvSq5Qu7GQSZ2ESMiqCe
 PeGLt/m/wuUq7DCq7ug8iEqOTX0jw5omVNkFN8M1ljXWzPglosQ6jqdT4N70a3yvGIsOxF6DpR
 TkIiOnSc7Dl82E7RWqRzk/H/en/v+AbVYMyZ3AAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=873;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9Lgr5FF8Qm0y+cs1KGIfxO8WY1rCY8E3tNFMlyO7N5I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlbc3AbZInq107ENvDdSegbav0n1QdyLBPQL6JQmnz
 zcYOnsmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZW3NwAAKCRB33NvayMhJ0Y+oD/
 91m5aNgwUUjgT3VnxYJO+y9rrRCb/jV+/Js5EK0cudv/X5SB8CB6MLzUX1LvMrpTU381POrBd8QZJl
 lEKQe5wiG+p/qz/5gx8UxOJ+s9ekXZ5bEQ/A6MoMSjaxIwRF9hSCn/QVD5smA77D53cDewmjG1cyY7
 pZcbSnfoGmVRG0QcSmrY4hJHpPOkWVkMXWx+f9SznP2KG803AnGirAJD4TKD1ITv/MRD3eePsi6lrm
 SjM2qDcEcfcKhQOu+7lo8m2RPUeO2JTBEQ2S6hw+OCt/RHsPPIg0HuW5RMmKUICYU6LgUooS4PrBxq
 mXTtASnfgZZIXGhNFOTUQZKL2nkG08VJjtN/W3z0w4GbP6eU5eT4ovX5+UilLmEQYtyIzwsNeSzff6
 z1aLGL/NuDIHDaCZ81pXs1xOGdgK5hGQHB4tynmd5pg3OiBkKWqVaIMIqkkF3EYRX8QEXbtb0BSUuM
 uMK7c5Nallhq+Qn7GJVZKYtVcEhIh9Ehj8DePGVubufcwCa4ruMfCdpLmSh1c42xwmnP1SDQNi3okD
 tK5LAxVLIEYHn3PXQb2NitDJvpjccnxMN/RxXOd+ekhpnvWLpgjHDygsgTI5DZcoEvOsXU9yIG06nn
 AS+qWbkUq74WeEzZDaf/PcoW62CQxIIdaoZNc8x2yoTQIS54i+3rFof6OrLA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Enable GPU Clock Controller for SM8450 and SM8550 to allow using
Adreno GPU on these SoCs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5ad2b841aafc..56aebbdcdd40 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1266,6 +1266,8 @@ CONFIG_SM_TCSRCC_8550=y
 CONFIG_SM_GPUCC_6115=m
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
+CONFIG_SM_GPUCC_8450=y
+CONFIG_SM_GPUCC_8550=y
 CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m

---
base-commit: 9046d05c6ad632a271fc4173624e26f396975a80
change-id: 20231204-topic-sm8x50-upstream-gpucc-defconfig-3e3dc264be08

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


