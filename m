Return-Path: <linux-arm-msm+bounces-9245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C70843F79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 13:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4CAE1C229AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 12:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674D97869F;
	Wed, 31 Jan 2024 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cMNuiwJa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD6676040
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 12:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706704535; cv=none; b=FZ4Xq5ASDPdbReRgKQb+IPvOtBX9/ksz50WpjTZY0/OxbBnLVTFKubTDQjmjT2Lba95Nx/iDvKUNtZXZzB1A1mVlL804dL+zBPnfvDUpxJbgNkOAHLkFqe7Pc4zSFxcKHZDH7vLIlizWth+xbkoL+MzRfCaN5f6/d/2w9PY723U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706704535; c=relaxed/simple;
	bh=w2bmAJ0nzsqoalBpGmsMLOmE/qsljTRmZBe5Nbchf/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cpUAR10hXWiPdaJO8YtMBGJlDIvv3z0lvVMoUe0qUIIL6Klm1rlB2T/jcodM0tQDViBSzsPJ8V5qJ6Rjy/xwhAMvWdje6OGjdKwLJQ9i+8d/pPPUZnqvExnnjsQT7pLJhn1Zcgt1EX4Iv1HHVhBaLTpj7r/qoMRW1x20owhw4qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cMNuiwJa; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55f2b0c5ae9so3094121a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 04:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706704532; x=1707309332; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RzoNtv4zjMbI5M4GmQ/IM20349q4pSFjUG8rhyBeLJU=;
        b=cMNuiwJa3oYCABD1+fZI1W3K4hL2smvBDf4tWyE766Jq3LO3cgp9C62VbosZ5UeVqX
         Cxe7pqEiyNOj8bcaP+Av2l7TrJNdfSm1paCADOlw6O0rqwD0defVWYtwPfxF4R7EyoUK
         +Wn7mTub5cMeEQUMtElgWX+Hd94+beryEFOa2MiuOOtk9rwEUCCW0XmGzv0HAwChxKRv
         BmrsORyKX7uQlfZnb2CP8Hm9Dmt0SJEJFA0qswMDebHzoGHlJH1h3RcAgJfjdp9XxgGa
         9IRdk1t+bwav/tsAtUV5srXvFxUg0CZOhvWn69uSKZY/cP2Tt3mvskt0ygfrqh8FWtZA
         t4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706704532; x=1707309332;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RzoNtv4zjMbI5M4GmQ/IM20349q4pSFjUG8rhyBeLJU=;
        b=fjPAYNVc+2/RI0WO0zIhKUUvd1WVp6GGWaWzMmXUyT8LG7nA2VVJo7QD3EbXj3zEgY
         Yh6BMdhaqy9G6aFKME9jIbh+kuNZjSqcGAAh0RLxHT1td0VRrpCzD/Ch2v7Mu1CGZnko
         6uJqGWQsws2MK9DCQNtqkjoRCoOLithy7TKOsTVvhoUqcmPLnBpJmp829rfWOGlgqTA0
         uuUbP9ge/v45vxLc+UwB5Sc670nIo0ZPALto1TGD2E3MkD7Jowibckpm4+L90u9C6DZg
         JCfn123MZ49VOwqA/rB6Vn8/1NSFSjtZMhd/9X8wgPsV12puOEDSKmacH5ygtVwtT9Ax
         h6FA==
X-Gm-Message-State: AOJu0Yww5JOObWQXwmvDS2Nnc+pyJsanPbpLDrLK8ebhDUjyYugLacMT
	5dk+5Lfx3dvxcXyG3f937Nw7B43zNJB0szSqFzv3I9K3G/s+02tLD+wIA4bAE+w=
X-Google-Smtp-Source: AGHT+IGtZS9N7CtUcW94pZVB02sVlRqtHadz6/z4++B0mGuFkpEeSYmXbulfAuMGIbzsIH+m53utjQ==
X-Received: by 2002:a05:6402:1803:b0:55f:7b91:cbcf with SMTP id g3-20020a056402180300b0055f7b91cbcfmr1086694edy.6.1706704531735;
        Wed, 31 Jan 2024 04:35:31 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id k4-20020a50cb84000000b0055c97f940fcsm5797004edi.81.2024.01.31.04.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 04:35:31 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 31 Jan 2024 14:35:16 +0200
Subject: [PATCH] iommu/arm-smmu-qcom: Add X1E80100 MDSS compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240131-x1e80100-iommu-arm-smmu-qcom-v1-1-c1240419c718@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIM+umUC/x2NQQrCMBBFr1Jm7cBMgli8irhI48QONIlmqBRK7
 250999fvLeDSVMxuA47NPmoaS0d+DRAnEN5CuqjMzhynh0xbiwjMRFqzXnF0DLab7xjzZiIz+P
 FJfbOQ1dMwQSnFkqcu6Ssy9LPV5Ok2795ux/HF1hs+byDAAAA
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=945; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=w2bmAJ0nzsqoalBpGmsMLOmE/qsljTRmZBe5Nbchf/4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBluj6IwzyXy3eNlLeiHej5D5hRWuRN8IiqUkwP3
 WIeTnQmr+OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbo+iAAKCRAbX0TJAJUV
 VqxVD/43QDc1w17onfyvHi3K12ydFg+Of5vdAS2Ya4Y7er6pJenrPlY1FKUEQtHQAqc7hfjEbXh
 QmUyjzcsAJn+Bfb6GfuPVfwrb+uCi3WUcKrMfNeTf/4ON6QHRN067/RAdpKjEov9ppo8fXUuv0b
 z8IaHDM4Ze8Yd20A3sA1Oy9oH6wW9AYplCvSxLkhjKe2c0Qs8w04rRM+nY9vM9j4i3KWHQZqfeF
 9fdza0YW+FycnQYs6A3SRFLA1xz5Fc3puYx2gULfk8quYGa5lyxm/11bE7QlPsQRXhD6g3U9LCq
 hIlR4ftRLl/TXndWjl/UZKrI6Klz2aviVIcHdRWS5hpRFavbFJxZzcHYllxNE9XIgqn0ZG10WbU
 XHXxnEHNQx0RgF69vaWWIK2oS9E0604Kd9l7RKBUB8F3W05Up55lytuVwJ+R4YhGieMFeWc2TmL
 nlMhaub1zn934mvz44Lc9FjSNdBJmk3BDheJ9GKJ+wG+2NvUrw2cqxVGx1kMMDqKOljdrw6WDxB
 K1r0fbei8nT5L9B3v0lLDLymD9Lrh8z/9tjXpdekmgWUGEvtwyQzlOY9t828MRxn6hUEOID+IOT
 k7oBVrfqnBS/pIVVyo6AwdimgPNW1RF0UJUBma3JtXFQYw1R74MsZV88W/wV4+13tYuFh5k0PjD
 uv3PKP8qumiiTfw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add the X1E80100 MDSS compatible to clients compatible list, as it also
needs the workarounds.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 8b04ece00420..5c7cfc51b57c 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -260,6 +260,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sm6375-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,x1e80100-mdss" },
 	{ }
 };
 

---
base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
change-id: 20231201-x1e80100-iommu-arm-smmu-qcom-f015872f1323

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


