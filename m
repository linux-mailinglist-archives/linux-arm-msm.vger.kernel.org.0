Return-Path: <linux-arm-msm+bounces-49647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD664A47844
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 09:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 122A1188FD64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 08:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD0C226533;
	Thu, 27 Feb 2025 08:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e+Rh34TE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7590117A305
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740646289; cv=none; b=ZZZiKsChOJvLq8Os7lI9r+7ewPbIdj4xx0B2cZjG5QvLbuhMz9C88pHMeZcjeEG2K1FWM2yLkIdyQ8hbhk+gFsgHipBHnb6/0pUIXQqKZucPkLqP56L6v5yNzy5FSrIFUj6ks6Qc1Y1DhaUL4GY493SD2vcIwZpS58djJNgdKuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740646289; c=relaxed/simple;
	bh=XRLC0F/OAsAwom1j0csoEiThelHrO4BRXhTdff3PTk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mDxrjrqnCtOwe5V0e9h1NBoLXrqp8t0PivkpBVjWRQIJFkrYhdX2jsK3ag1Mbb47yG1AeeIm22ovr5E6I+D0lIeqtxHnL0mUOVTKpaZ/CE4X5kv5iFh1nQ6Ez0zKGeWSGvcYDa4mWhcJDgd94p+Ik/GkhfwqixXSXSsWgNj6yMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e+Rh34TE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43984e9cc90so11035515e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 00:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740646285; x=1741251085; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iOauLP0ELqLr6qyOysf0Ro17F/zd6+Uf/b2CaRN4fKo=;
        b=e+Rh34TEAGkVvDCmDUEgmHqZ6JBtY55E7Ehl61VFKx2RJBrbMb+0FdkMJKkPqj4fX0
         41RV1N2Ym65caNwWqvmEnWZv2f9Mdc4DP2rG4IwbkNS4u+AFiwx4VGI/NTtwMFZrgHJD
         SIbRKsRwJ1ThCp745YiuRMbvb/MDU5TDIQhh46i2xMjD7mFiZ6TExGEEnpJPfEeJLyT8
         hecVianDqN7YhXxpp1LKNiqK6jxmXxnuHx8ZtmIBDO4ftGZ44IHLkxZnpS7umpo33UDJ
         hTrVblAzu/6mbMv+tFo6hkLtrzwljB1scHu97rBmmpXxjxEcSossEf1HPLdqb+jO39Rw
         M9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740646285; x=1741251085;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOauLP0ELqLr6qyOysf0Ro17F/zd6+Uf/b2CaRN4fKo=;
        b=E2Z+ARIno8RW4Mcw0AqC+b9kuXfNvNVdiEfwcwr7Lfmj4AXAHEYs1ko2bQTFiMz3q4
         mdV+0wAKH3ekBLAy+TRXdlEhhQ0znpD68xG/hOLKPFihHuse6c/25Ast4uNkiFNt05P0
         pCXD6z53caZYuIYVycuu2S/4BLv3tFMdNgKztMxhU6djyrMHIXv2oDvm2O4r5hqKDAaH
         LYTMVmlvUrZVj3O3Rd0hPJ+5fZD7KYwD2+sxgXWAEThuGUhUOhLKMAZ3zNu1xAoiKpTo
         Uz59BEkjb3ISXeWmL92MA/m5mY+F4RrobL9Pc4gWVbMeiMbXTZzPPbcGMJq2OXBeqqpL
         1SpA==
X-Forwarded-Encrypted: i=1; AJvYcCV3L+NyOHE5c0Asxh77qNbMoCt/Z/MLJH2AL4FYhixXYFLrAfXPfoqIc1BQsxTeg9ShcOqWPv21BBl7APDl@vger.kernel.org
X-Gm-Message-State: AOJu0YzpPBM/NAWU7Nn++0pVHCIyyKy93RB5b3Sr7SO4a35wyy4MubsK
	C6plw11K5TDxH5F/hDBQ3u1F1XO0fRcQuBaGE2sbm5q8do2bnttUDEpxUC+q878=
X-Gm-Gg: ASbGncufNy/t5Rqqyq1QE4GNiQawHhpzMhna/irWvGKfkUgpnk8AEUsdzsSlDP1zaDL
	zNkABHrsyQyNLbZMIh/XPt6neTBbi98+iPJjnaQxiTgIf6EAhOou1CsB0WQP+xZriG9nKX4Amn4
	JAFyaRtz+s2CmS5XqBvSsRi4pnYRrodmT6ZUSAWyqshTUfB7/KiOJwsubBNpLaacza412vlBLvk
	mjPQbtjXk6fwXTHyjvH/U9JW/TtLceu28/qm8IfyJSjhFoW6di5k/lqJdAgV+K94z3iqG3F24UB
	yT2iPrQoUlZc0tBm/lL3PcmPopLcnIg51U4JuAm9ndMx1j4=
X-Google-Smtp-Source: AGHT+IH6UhR57ulZYuKyh09s5uYszlWMtP35nMK2waRENXknVY9Xjvy0uz9MTrTjTI3i0IEmvmMtYg==
X-Received: by 2002:a5d:6d0e:0:b0:390:e005:65b0 with SMTP id ffacd0b85a97d-390e164b43amr2112628f8f.3.1740646284792;
        Thu, 27 Feb 2025 00:51:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e484486bsm1329159f8f.65.2025.02.27.00.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 00:51:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 27 Feb 2025 09:51:21 +0100
Subject: [PATCH v2] arm64: defconfig: enable Qualcomm IRIS & VIDEOCC_8550
 as module
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-topic-sm8x50-upstream-iris-defconfig-v2-1-13b490a4f402@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIgnwGcC/5XNTQ6CMBCG4auYrh3TjpYfV97DsCgwwCTSkikSD
 OHuVm7g8v0W37OpSMIU1f20KaGFIwefAs8n1QzO9wTcplao0WpEC3OYuIE4FqvV8J7iLORGYOE
 ILXVN8B33UNssy9Dc8hq1SleTUMfrwTyr1APHOcjnUBfzW/8EFgMGCmdyQjLltS0fL/ZOwiVIr
 6p937+Lcqi82QAAAA==
X-Change-ID: 20250225-topic-sm8x50-upstream-iris-defconfig-b56662147b20
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=XRLC0F/OAsAwom1j0csoEiThelHrO4BRXhTdff3PTk8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnwCeLDum95n+pn0C1lqAR/CAGSzOjk7OzPoO2Ns42
 xhwYqq+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8AniwAKCRB33NvayMhJ0TCYD/
 9MSTCXn+P8EBqr5oWbDRM6p8c0tAHYK5DyWCyhXAMuJQFGu/qWYfhzc5svdagvtEE7YQH4t++3wS+A
 tRo9lSEejUZ3BNY+YlPEtYaI5caz+FgeJI7krmOsS4ZtdiN11uuer1Jz8yKkS2yqH1vpZEEXmai/vG
 FSDIoYtM6y1YgaQKiFK1eBvizdpPYk/zRdutyT4nxRBacGyzkZrHOEqBd1qrxQeBsTkga6GTlu2htY
 deV9pjZXR72BPeNtptZfwOhTF1EiGeh6toBqpdaD+6qEYMAnIWXK1+EiY86KR8valmX6LrB475VPdh
 kNJ/8Kkvj7QmXRb2cmQpcT3vQFEd/rh68b5+xH6LY5w3/+FjhdVMb+n0q0DvER9OZjBuFZm14E3Aon
 rD/teM9SFkWBFnRvZoB27NsuWvHTvC9OQrF9+KxPZQinzKbsJRfW1SxNatp3ym6tMkrcONzHOyz6PZ
 al21RkGzNT6LUgMr9hsNeB7yPx6rNf6GwwA8yuz5xEqzG618deZHMN9mgf+sxilzqWoN638HNsuXJ3
 EDCPYe8wQPKvuUOQb2/HwkSYVUQo0tytIGCAwYCKZjPNcGNj3ipuIN6iewsS0Grw4CEMYdL3K+e6e3
 y8e7+L5j1bB28jfA8UtmCNSnFYYSB/ialrQTijo1zJJUsOBf6FLJLZ/Gq1qw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order to support the Qualcomm IRIS driver on the Qualcomm SM8550
platform, enable the IRIS and the VIDEOCC_8550 dependency as modules.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Reorder iris before venus
- Link to v1: https://lore.kernel.org/r/20250225-topic-sm8x50-upstream-iris-defconfig-v1-1-8a17e2e193d9@linaro.org
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a1cc3814b09b31ee659536a64b7db704153d6fe9..9d51d5bfb8158b297be2ecf8e645ef829ca27661 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -846,6 +846,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_ISP=m
 CONFIG_VIDEO_RCAR_CSI2=m
@@ -1395,6 +1396,7 @@ CONFIG_SM_TCSRCC_8650=y
 CONFIG_SM_TCSRCC_8750=m
 CONFIG_SA_VIDEOCC_8775P=m
 CONFIG_SM_VIDEOCC_8250=y
+CONFIG_SM_VIDEOCC_8550=m
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y

---
base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
change-id: 20250225-topic-sm8x50-upstream-iris-defconfig-b56662147b20

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


