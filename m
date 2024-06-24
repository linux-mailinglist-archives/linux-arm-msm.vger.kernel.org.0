Return-Path: <linux-arm-msm+bounces-23889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E6591447F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 10:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C1C92849CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 08:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C474965C;
	Mon, 24 Jun 2024 08:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eyAGgcL3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5490C54654
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 08:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719217154; cv=none; b=jIn56IzwZcDf07UF0IS/bY9T/yYGxFVXJVTIp60L8m1fTjijSvms6YwMs29Kp3zJoxpjsYg9+wCxGey79rWHZg8aSaJgcFW3g6lKusENak06ER1q0kkBxwOXKpywkSgJRKYIFTBCLngVJSEPGQwp9V7c/BJ+vxWKVnqlJBo/u+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719217154; c=relaxed/simple;
	bh=hrcbm/Drjw9ypN+HcZfxd5WVucStMi5y/7ez75gjaJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AyGevO3uCsvoTMHKh2FYn+nnZAbnp3Dcfq86k7hfZdPe9/Oo6aWIkEQ+bnr5PN7s+0U5qxW0pWbxcOBP9tVqXWNwMY8fURsMnbKCnBueOvS1ud0OaAo2hPe3+VX5SY28c29aQ1a8bR1SOmK2hE33PnIBf12zIkw8/Jid+M824M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eyAGgcL3; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52cdf9f934fso1522460e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 01:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719217150; x=1719821950; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jwPwL72m8s93kw/p7VxOEDDmYj0qJsAuA8dl81m3PQc=;
        b=eyAGgcL3XkMNNMzbIdTO77oSFJndYkR1jhwj751TAxnHHQY0P4I8GDr6DWb+vXojF+
         tAPdH+W50rezV2u79ZVrZAA2IMCZyxSoiDj/4nGWNAqrmRMvhkhz9lL1m9CpAjek0C4G
         XRURr4UTrQycQZo1x8Jzcz8/x65tiIKmAfTwwqMZya39JDy9sgxugJ7DkeWzXojJRvCl
         zXVW2Noq5aDcNv+iuGclzyOVksybTd/QaFY5w0KJgLZ1e42StNZ+F83VPvWZXzRMaqqX
         HjjPP9QY5W8UeNPrFIXQVzxE3gc3x2bT1XlVU5VqDMOGZmtPttvvzyFCOK8ohrNDnd4S
         rwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719217150; x=1719821950;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwPwL72m8s93kw/p7VxOEDDmYj0qJsAuA8dl81m3PQc=;
        b=nuLNYbTRvLBUKIJ3hc5Fd4iwsRZV4bZ1UYaazhCQmf/0iyhq84EDtx3MArEqXIXJcz
         zNm496werjX3otAeu61OqX/l23Jgq9j4TMrhfvkn/v7H07saklb8u4BQ42z5gTSsVCgs
         UPIttcEgnkDmHw+W4wfFOz9T47YArGgGRtMk+V+KHu8pZtpGDWfFx+dP7eD6WoUYdA+6
         QkkRSw+NdHOkHIndSh7RdCN1vc6bejyhMWZUtt/8vVn1fou8Fx2eA88qfKQsc8K0HhHU
         siCQvsE0c+bPzXLazBsvgk+PNf+caKrNYS8M2Zf4oZQZ1NCNAc9ZifBAofcMrhkXLOZE
         Vcaw==
X-Gm-Message-State: AOJu0Ywc+CySfP0QlX3wwB8BvtMwolNYGej+cNHSeBK6UHHjWA10/AgV
	dAvl01bHQnRY+Gk8GwON3q1vnCe2wQVLwF2RNq+S7gvOanFYEYecaX6jTwwlDZ8maBOJ1YfvIUr
	HjtY=
X-Google-Smtp-Source: AGHT+IHpL6UH6p0b9w60yb/Nc8u8gfZQbm7Xx++lCO0XJ1GqYWCIG1rZ3OamjznZPFHcsOt+MHvVSQ==
X-Received: by 2002:a05:6512:78f:b0:52b:bf8e:ffea with SMTP id 2adb3069b0e04-52ce064f62dmr2413777e87.40.1719217150488;
        Mon, 24 Jun 2024 01:19:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63bcef1sm923572e87.72.2024.06.24.01.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 01:19:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 11:19:09 +0300
Subject: [PATCH] MAINTAINERS: CC dri-devel list on Qualcomm FastRPC patches
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-fastrpc-ml-v1-1-5dad89dce78f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPwreWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyMT3bTE4pKigmTd3BxdI5Nk8xTT5DTTVPMkJaCGgqLUtMwKsGHRsbW
 1AHdoaQFcAAAA
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hrcbm/Drjw9ypN+HcZfxd5WVucStMi5y/7ez75gjaJM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeSv9zpf8H4BgKPlJxOg47IlU6qKet0Gdiy2mb
 lK54d+wY2SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnkr/QAKCRCLPIo+Aiko
 1dokB/9wFHH32XcKFs1rHJdH5p1yiMiZrguW0qbo3/I8qIMjE2YUjFNtbRxgC+rk2TUs6uP6WM6
 YEzuOuCRLhsffQOueT6cNgwHDNALL63lxA6n6sfbctfqzqNr5homT+myfqRZCGkPo1BBtGBPHKJ
 Pr0Pr5QbXvvEvbJXk4ePerGK3kvMg9RbIE05Hah/c8eYVny9s7Q2NvOfuBQhVF/d0Jl8SxM6xfa
 5PZYnOPJPLEKZ/+O6+8y4U3QsK6aC6k0NzFUirbmtJKknqcmmLb5YiuSwbkpgMuhkwHcKwe4q3a
 l1w+2aJKlNAHjiDSOfSPwcluCidivsn5WvRA/Aa5MLxfp7GY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

FastRPC is a way to offload method invocation to the DSPs on Qualcomm
platforms. As the driver uses dma-bufs, add dri-devel mailing list to
the MAINTAINERS's entry, so that DRM maintainers are notified about the
uAPI changes. This follows the usual practice established by the "DMA
BUFFER SHARING FRAMEWORK" entry in the file.

Suggested-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f45881e982d2..26d628c677a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18621,6 +18621,7 @@ QUALCOMM FASTRPC DRIVER
 M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 M:	Amol Maheshwari <amahesh@qti.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
 F:	drivers/misc/fastrpc.c

---
base-commit: 2102cb0d050d34d50b9642a3a50861787527e922
change-id: 20240624-fastrpc-ml-24c7d5cf5e7b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


