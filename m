Return-Path: <linux-arm-msm+bounces-51032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A3EA5CD1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 19:03:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C78D189EF26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 18:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA382262D23;
	Tue, 11 Mar 2025 18:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TH2cX9i1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1831D2627E8
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 18:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716185; cv=none; b=EjqYaKDkKLdO8EuOaDWvJijCCmhjri5zZ6uqtnAIpDb142V1OJoWiQmB1C4XVuxjE5JDKMRNKOC3MrjIDgQ6ju59lJ7B24Y5iT8HQchFU13WRY+JPauQFxCzGKiB0nbxrLoAOFLZ5cm+jDf28xqiXWnH3xtjN+bv3kiqQqzUKJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716185; c=relaxed/simple;
	bh=TSHmhqZwyLnRao31ZE/kuynrWIfbFM/u9czNvOIv9MM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H94+9zhI5J5TCSMFuRjPCsTO9OO4su8i7O5Sw+BsYvezM9AsrUFo7uL/QTvSJQyyo3edeEJxHc/m0ApJK/38L1w6ciOFt3nEGZBR7wDgo6KUDp01xDilNyWJSQb9NsxGpdgEbYg+M96b64rQ4rugbmNprFdA7hcHE0TPEPPhnSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TH2cX9i1; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab78e6edb99so878060666b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741716181; x=1742320981; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ccls6QlRwKxRURW2wbvi5fD6dk24Crfv3eaY7igy5w=;
        b=TH2cX9i1X7qPGcCjitS15NQto7EzckVYHXsKtXY9mCSpeiTb0GzbM2doZGnOWkkJv9
         QH5Cwvt3dKeFMQ4uhafRXi3Y2qFsxEoj4qnEa9VYD3lTTKUmq51EwIE5I3c/iuN2cnqR
         V5LwrzBmW67kwkzCCyG9nUZZpYigbN9WFQI8bLGeQsjxAnBiZbWncJs2uGuZFt/h59nK
         fphE14ihHswjXZhKhvwnk4qjCDI9N67pkB5YKP0jvn5I9OgkeFheB77dxddIk2j0fqI5
         vaEJr+7Tglhl6TrWy2ga/3mvNxPDma86AmQ7B+RUJXebqltaXgTXsmh92TqFu4jgl1gx
         BIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741716181; x=1742320981;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ccls6QlRwKxRURW2wbvi5fD6dk24Crfv3eaY7igy5w=;
        b=h8T3oVZWjutocPa32v1kSh2u5ZEUkBO1xrChoD3+UlBiebj8NThDxYEuvv8rdzptaR
         j9JcuZw1jxbzKpHLsszmRg45wtqEgmbcm4yM2d36L2I6XHvvFD92JdN00wZPDve+UTnQ
         3bmW3kGfENGz7vD3WxgRFOAzeiCIgh9aLKlw697wnYCr2updq0KIvpjvXBO5uP1G14Bq
         O39HmUsmftlVl7ZRga4B1WIs75t8nbWiFbEbI+jsXe63kBLY1B3PJkWKMK/LmZs1g/A5
         H2kK2z3dM5W7eJzYuIbL9U4Au0k9hIRzmbSUkIP3S8h5On4+PRzVyI0bjd7Tv5aNO15O
         s2Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXrvCXEf5Mo+l2k8eUnhKEyUG2kbQlcs7jDmZV1yMJRK2aSUw6qwaWgC7ED66aQEjMQwXfF9WwZsYnXD1JF@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ29lnAKNoFuD5W3a0CMqfEjVjAHnDRiCT75IORTwy0SsdkyIa
	J5KRrtUZsO34VfYVHXN+wRiTSqm/WQf+SjzLNfS+B070KS+CUaUUOxd47iROA48=
X-Gm-Gg: ASbGncucizFzGMe0jDHSNZB/tvpsBY3DnTiD3KlAfTdOmAnqb0pfK+y+JjV2r2xbD0S
	gwKEGZ4bFrYuYhhfq9CrLiIEP4melX+vnnSo9lqXY3Cb8fMb7Ef7xvy/BZFMFuV3KXgw8GHLxtF
	2hTHRlngYQRZLnq1Cs6Uh1BqHZHDIFQfz3th6AWbwb0XdX93QiawyEhvTPZbrrtTcejHAHN1WNR
	XxmLa+RizvfPsgE2Ozl08kjtrz0j+SgYVsSnszo5M+UrZRUlHeYRplfyz7pNWEHc/YM7BECWWKJ
	5zUCMcXXiAlKw6exFPvUBD9boUjqq2QZ4GMQqWIFBBWPu0/VTev71Wo=
X-Google-Smtp-Source: AGHT+IGnY0H7YzlXD8CZSfCox70QPKmTLZoV4lqMqMMxiyALS3HVvR/aMstzphLmsjj59KVicmXt3g==
X-Received: by 2002:a17:907:1c24:b0:ac1:e1e1:1f30 with SMTP id a640c23a62f3a-ac252fa0c31mr2141888066b.38.1741716181234;
        Tue, 11 Mar 2025 11:03:01 -0700 (PDT)
Received: from localhost ([185.194.66.242])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac2394894cbsm957805166b.70.2025.03.11.11.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 11:03:00 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Tue, 11 Mar 2025 19:02:56 +0100
Subject: [PATCH] arm64: defconfig: Enable Qualcomm interconnects as
 built-in
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
X-B4-Tracking: v=1; b=H4sIAM960GcC/x2NQQrCMBAAv1L27EI3UlG/Ih6azaYu6KYmUQulf
 2/wNnOZWaFIVilw7VbI8tWiyZrQoQN+jDYJamgOrndDfyTCn86YvB9zYHxzemGQyMmiTqhWJTc
 24VrQf/RZ1dAN58h8OZEngpads0Rd/svbfdt2VwwgJIIAAAA=
X-Change-ID: 20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-258fcc961b11
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=TSHmhqZwyLnRao31ZE/kuynrWIfbFM/u9czNvOIv9MM=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn0HrQzl89Jaz1kNZJdzDGOQWcFYbCljywikz7i
 iJbfuU8tICJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ9B60AAKCRBjTcTwaHBG
 +DL6D/9IB7zq4cq3vY1Uw0waKJ/M8zCahI2LFsClUcFcgNnupikDLQ+SmcrOS6iYWqy/YcZQoD6
 VT3RQcN9OCgdeYSkAuhR6fXeN8GGJgiZXkSHWC/pn6M4exxHBGjRgn2i0cQqaMin+hW9G60fI5K
 L9aL0T/EP/MTgglpTKzhy+95WWh2JGR9hTXLfcSgen6fX/qiMIMsEKwtW24moUHMD9D4wb73+mY
 4scWoq5pWJ+TuVdpaurhAxFfRwgOObeiDEsRR+pqqU6iom1pTmV5cA9CpNaRjhmUNGnTYB0uqV1
 iBhsy/R2yd8AsX+Jrz52OHGpqmxa/+jJPFc20S7Tpx/aVmvvzXo3JkF4Zhfc7a19JEW8smZjJ5n
 3Scp8cnscwYBiVIYopZZ6HMjFsA0V5KXoOacBiqnXnw1CDHs48i2ZUoaF5R6OAkR2ueArZm8R8r
 kgGKM3zKTVdqsFWN7FAmx9x4aWY0omSWN+IY2TWvUOtA8NMJnFuKmFwu79SdpdKj84yxxZOKGKs
 49HqauXRI+g6UCm0G60qdDwWUqHqX65zjMMOS3vMwVUjVd3dbDS2uEnQ60Zuw6UJyQr0gZ2wTCK
 Cl/4MRMdb0P3wqr0E6eL7aZGJJixWG+nDMMk9R0t89eRki5HOd73rNgzb56w97aUAhQoU0HljoI
 CT5uZJChxYybamg==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

Currently some Qualcomm interconnect drivers are enabled
as modules which isn't overly useful since the interconnects
are required to be loaded during early boot.

Loading the interconnects late (e.g. in initrd or as module)
can cause boot issues, such as slowdown or even not booting
at all (since the interconnect would be required for storage
devices).

Be consistent and enable all of the Qualcomm interconnect
drivers as built-in to the kernel image.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/configs/defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 219ef05ee5a757c43a37ec9f8571ce9976354830..6582baee2ab02ecb2ff442c6e73aa6a23fee8d7f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1656,11 +1656,11 @@ CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
 CONFIG_INTERCONNECT_QCOM=y
-CONFIG_INTERCONNECT_QCOM_MSM8916=m
+CONFIG_INTERCONNECT_QCOM_MSM8916=y
 CONFIG_INTERCONNECT_QCOM_MSM8996=y
-CONFIG_INTERCONNECT_QCOM_OSM_L3=m
+CONFIG_INTERCONNECT_QCOM_OSM_L3=y
 CONFIG_INTERCONNECT_QCOM_QCM2290=y
-CONFIG_INTERCONNECT_QCOM_QCS404=m
+CONFIG_INTERCONNECT_QCOM_QCS404=y
 CONFIG_INTERCONNECT_QCOM_QCS615=y
 CONFIG_INTERCONNECT_QCOM_QCS8300=y
 CONFIG_INTERCONNECT_QCOM_QDU1000=y

---
base-commit: b098bcd8278b89cb3eb73fdb6e06dc49af75ad37
change-id: 20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-258fcc961b11

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>


