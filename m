Return-Path: <linux-arm-msm+bounces-85851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7673ECCF9D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4542C302B753
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B063112B6;
	Fri, 19 Dec 2025 11:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Dt7ORziD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6AF284B25
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144348; cv=none; b=rcMKBT83O/3TU9QpLm3jpMmMi5oabOiqyLYX0O3k4pWqjE1d+RA8qmqCA511SomzZuXurTyvy6wdpl37q5Prio9qSeE2+D7Q9KvLNvGxsoU90Q8J737Rif21/SxTvBx965NlGvXSe4OdOVeBSblSNLU8pHxTwSb8/QlxrypfRV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144348; c=relaxed/simple;
	bh=MOth1MOMNhgoxoy0OeQdW3iiGNtZ2M3uZvBjGjaYCzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bdE/s7zAoRmfyH/PS7T/ARYgZ4g5sHtV8qY5BSn828v/b8HUJ73GN2zUbwCcP/jm0LcSkCNVFpR7gR2xNPiRt7poRhSN4uPuW8WRfHFPjYnvNAFKq5Aqttoh64DwYaNbZu3sU64utYoXGuU96pCwEaHdyysRuXHkMJ/bCfkyQzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Dt7ORziD; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7a6e56193cso290235266b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1766144345; x=1766749145; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hso2zbgibZLxlFTB4p0W1IRiqs7QuHHIdO/CJaRrSU0=;
        b=Dt7ORziDRkwPL5FoGQXXuJFkmuOuOsrQb0572L5AjA6RAPrGxwDLnRUtZAHgiNws5N
         m+86FCx0+KuXeMzCGCzdu9J1i3L8AIsqSMRXAhlabCI4dPqTDv+VjdRlXWlaEiGAj2KG
         eYhNj1EW7DFoDo5Y4Pcp9wZPeDRBurI+uSyS1s6TUpQ6NRr/BZ9kjP48/Qk6sYabspoq
         cUH/pi7+48vhb1fDKx1AUfeLA9mq2MA23//LmVfo5OuVYVWpHywMjk0KVPRmpu0keMLT
         GylwYDcsha+FjQUraKbreRupSoVdcw1JRvkpHZZ1WPI05LBBplFUlZ5viVK/ki9Rmofl
         4RRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144345; x=1766749145;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hso2zbgibZLxlFTB4p0W1IRiqs7QuHHIdO/CJaRrSU0=;
        b=R58tbn6I2vuUHJN5R+hYPc5/a3LDbUPMI7lLLadtoSi2mQ4Ea7qTGoJxaICDNgsau4
         ghb98RxLV6jKZhEIKg9qAh0i2I7XVlWjc/uJfj4Rq1e0J8BwpMr6qEh8s/Qk82gixmyh
         yUGRLuD6r9OvJ54CbfHC1x/TLBPyOqaxPYJk9q4HuWvlETmMnqy2lRAF9ubgYzwwCjl+
         KnmjQRt6+4Shl6bD4H+cylnhzp3zmCpXzaH1MIDhEO0VX77KYtVLDv8diKq1lELjjMAH
         yQNuP29eLtZDN8ezCI8ebEaWTgjY2HkuJa6Whw6lRjjy4Q55Sx2bkFTfzkqz4rcX0ptQ
         RYDQ==
X-Gm-Message-State: AOJu0YwiyulUsVAM7XuWMdmX8qkan31xwrYG+y/Hr9sREdSY/yaDpVf1
	Hqk32HXkvwyRInuG/K4KUVFbSODfVG37IzLQibK3/fx0z21eWK9N2dCN8DqhA/AoTQA=
X-Gm-Gg: AY/fxX6SafAOaWBpBbnxCCWw5VP2x7YwyKRqwkgIVHMYPmv3q1Ew6jIbIPiiQZHoC0U
	lO9tKfkK+Ol/SDkHv5Ljccru5i4AeBpwqAiIT3UOfzPAkwjGT2S2vVcgbhfqA3kDyt3tVqF1WwV
	A9UU+VC95x/FHLgljuZD1P7uWkbPq9CjevjGUSOTV0hc2nM9WwDN5G8op2zxshN5jxI1MOzIHyy
	pjgXrPQNdmKEz/UoUGpZOeU9b9STIa2cKQE0b3JWV1e8Jx5JRMEQH/OKkzzwftGm6pmHDpaleg3
	G5zxrpqqXrh5k6LlGTGCURSDy+2xTtlw5VJe0Y4i9GSWwYf4E3FkrxHXEhODHOOrmb15A5BFL5A
	iTjHt9nWviVMHMcGxpfWcn2NfW3Iv1Zdr0ujAqGsfqLooyP0U/31lA7v3afUnrHEzhs5tgeWjNK
	HH5UKyUEIYxBjr8qFcu49+JbamzIK/qNd7MZZRtE5r1Tk0vNT+oLY8O3a25Q/W8zNHMHoVP6zQe
	DL8qwjtKKzj5vPUvpzrTCWM7lO4UNzfTps=
X-Google-Smtp-Source: AGHT+IGpjToIBJ44QoNH+SbgkbTJNPHhnqrJFPvM4cLmxG9MfJQgRo4eD050bfH/K4zXCtsLTbTckQ==
X-Received: by 2002:a17:907:7f07:b0:b73:870f:fa37 with SMTP id a640c23a62f3a-b8036f63811mr215818666b.17.1766144345215;
        Fri, 19 Dec 2025 03:39:05 -0800 (PST)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ddffc7sm212534366b.43.2025.12.19.03.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:39:04 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Dec 2025 12:39:03 +0100
Subject: [PATCH] arm64: defconfig: Enable options for Qualcomm Milos SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-milos-defconfig-v1-1-f58012ac8ef6@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAFY5RWkC/x3MQQqAIBBA0avErBMcQ8iuEi1CRxsoDYUIxLsnL
 d/i/wqFMlOBZaiQ6eHCKXbgOIA99hhIsOsGJZVGhUZcfKYiHHmboucgjHYTKStxtgS9ujN5fv/
 jurX2AeQy/cRhAAAA
X-Change-ID: 20251219-milos-defconfig-95d3e2c018ce
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766144344; l=2186;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=MOth1MOMNhgoxoy0OeQdW3iiGNtZ2M3uZvBjGjaYCzQ=;
 b=LxyNjGaTNVn4N1yVVkakEW2xFhItwfyvQBXfpC0vjOBiCFuBkE3HcXDaPBYumYat6qJbOTRCG
 IwS+mOC/m1hBmB2kNEqLavROX9oTR1nP7WNR1B897rxIAJjtJX8yxYk
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the pinctrl, clock and interconnect drivers for the Qualcomm
Milos SoC. This is required for booting The Fairphone (Gen. 6).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2f746f779323..4828b3b704d6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -671,6 +671,7 @@ CONFIG_PINCTRL_SM6115=y
 CONFIG_PINCTRL_SM6125=y
 CONFIG_PINCTRL_SM6350=y
 CONFIG_PINCTRL_SM6375=y
+CONFIG_PINCTRL_MILOS=y
 CONFIG_PINCTRL_SM8150=y
 CONFIG_PINCTRL_SM8250=y
 CONFIG_PINCTRL_SM8350=y
@@ -1494,18 +1495,21 @@ CONFIG_SDM_DISPCC_845=y
 CONFIG_SDM_LPASSCC_845=m
 CONFIG_SDX_GCC_75=y
 CONFIG_SM_CAMCC_6350=m
+CONFIG_SM_CAMCC_MILOS=m
 CONFIG_SM_CAMCC_8250=m
 CONFIG_SM_CAMCC_8550=m
 CONFIG_SM_CAMCC_8650=m
 CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
 CONFIG_SM_DISPCC_6350=m
+CONFIG_SM_DISPCC_MILOS=m
 CONFIG_SM_DISPCC_8450=m
 CONFIG_SM_DISPCC_8550=m
 CONFIG_SM_DISPCC_8750=m
 CONFIG_SM_GCC_4450=y
 CONFIG_SM_GCC_6115=y
 CONFIG_SM_GCC_6350=y
+CONFIG_SM_GCC_MILOS=y
 CONFIG_SM_GCC_8350=y
 CONFIG_SM_GCC_8450=y
 CONFIG_SM_GCC_8550=y
@@ -1513,6 +1517,7 @@ CONFIG_SM_GCC_8650=y
 CONFIG_SM_GCC_8750=y
 CONFIG_SM_GPUCC_6115=m
 CONFIG_SM_GPUCC_6350=m
+CONFIG_SM_GPUCC_MILOS=m
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
 CONFIG_SM_GPUCC_8350=m
@@ -1524,6 +1529,7 @@ CONFIG_SM_TCSRCC_8650=y
 CONFIG_SM_TCSRCC_8750=m
 CONFIG_SA_VIDEOCC_8775P=m
 CONFIG_SM_VIDEOCC_6350=m
+CONFIG_SM_VIDEOCC_MILOS=m
 CONFIG_SM_VIDEOCC_8250=y
 CONFIG_SM_VIDEOCC_8550=m
 CONFIG_QCOM_HFPLL=y
@@ -1825,6 +1831,7 @@ CONFIG_INTERCONNECT_QCOM_SDM845=y
 CONFIG_INTERCONNECT_QCOM_SDX75=y
 CONFIG_INTERCONNECT_QCOM_SM6115=y
 CONFIG_INTERCONNECT_QCOM_SM6350=y
+CONFIG_INTERCONNECT_QCOM_MILOS=y
 CONFIG_INTERCONNECT_QCOM_SM8150=y
 CONFIG_INTERCONNECT_QCOM_SM8250=y
 CONFIG_INTERCONNECT_QCOM_SM8350=y

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251219-milos-defconfig-95d3e2c018ce

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


