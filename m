Return-Path: <linux-arm-msm+bounces-53310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1A5A7D011
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 22:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0767B170584
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 20:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17EE821858D;
	Sun,  6 Apr 2025 20:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BiKIhLGy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483D11B5EA4
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Apr 2025 20:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743969717; cv=none; b=jeDC6F0SW8MWlqEnYF/dGmjF8ztjFxkgNtV8LymTL4/As0nAaKCJqctTXaJGFyDLtUeIAgZ+jwWo7WI2PMZH8ps6Gpq9UeUNGmk1aDqdSvaENAe8+XA+dJPl/rtXXwC88R+n4kn91ElFptMSK3OZ/wRGwJXr+lj3cZwLReX7uZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743969717; c=relaxed/simple;
	bh=l7CRhFlZ6pn6hdkl7kstlhIYoNXxtom6dCRCabxrvMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fbJAvjAe2FLa+Lm5hIx56WfSdW+zWdcjqgskBfvKnmPMSOClUSsSPtwoZpv7Ht8l4kC2TB+KbRQDwdF60fbQXX/7u250zSyIqMywZX5nKP1Hd5P20tlNRYRFXUecQiUY0rkJkiFWBM+0Xw06uU1lI7ZO49g93y6gh5KD2o861js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BiKIhLGy; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3913290f754so445970f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 13:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743969713; x=1744574513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ux2yY1RchxKGuIqfE/2wQobUJuq5g/5pfkTf4qTXwDE=;
        b=BiKIhLGy9tI1I+L510O0dm/UGF5E5mhM3xxrtL/nZrqQbmuvckexqPbeJDZ0rnChbl
         aJsWipiuHgznhVX0+lr8BEp9XvDbSxFIybuDzkFzv0Krf/kMilZCJGgqmM6XiSXxF+GT
         E63zBNmtfmvmmgPHCgIcERL/Sl/acryadiyyEQFheia393X5GaqsSOpCO3NEaciir7/f
         +jl6P81cVR+i5+wwFneHkU6E43JXmfGdpUzVfgN9nFoWqtaJmYHTRTJEJNuyCzuV74Zh
         ozxjsPvDI5/wp9d/Gl/x8QF/ot6VUkvGNfPoXkTYAm8we2SJ+HK35GJt1CMXPep2Jl0f
         +0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743969713; x=1744574513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ux2yY1RchxKGuIqfE/2wQobUJuq5g/5pfkTf4qTXwDE=;
        b=ZwySqfqv2/O8WxW6KqDf91S7djR7CcLV0QRp8FfC/OT2B7Q6hv1s7jZZPsW2CDNH6e
         WyuGvRNAfIpurGtBtN1nYdmdI1d3aN4jIlJFyPjKH3L/FBd07yQWdAzocQzM4WitvtGQ
         PqczK+7oU5lYRbNQk2npt99TNFrHtlDCiXhecaTk76aD6Z4XI2vp85z3D2nRc3TnODO8
         +aHNT6Zr/LphS705umR0zd0Wo9qMxZ6Xua5C+5bZgROEzTRtjzohc4MhqInuWteRYdEi
         zftmt2Wg2M1DPKK8kE2uEYoLr15BWx9Up7IDSJzk5bqsW14Sm7wsj0Li3sYG+0qWsC8K
         Wy4w==
X-Forwarded-Encrypted: i=1; AJvYcCV+51bCdtvZMu28IQvJoRzsqArTgYiL/MD7+dK3fP8sFBmcdaaRVW7AlyUBzkMlQXH6NasaCIfJwMo1bCUa@vger.kernel.org
X-Gm-Message-State: AOJu0YxI/ns9PJJMjN8qBN/Oh0gTpyz/8pRI0RcSF58meqE10m9e2FYv
	HBlziKIP7jmA1foKCcTZyubBOdR/nzi2NPeO8JDJdvt51p9MsGvNDjjK5KJpLAo=
X-Gm-Gg: ASbGncuDTOpX3B5MmiIwFrgI6Oq8DWZnZUFrIf6bNtYHL9e+yQNTUxWSixJLCHqrOjy
	HyggysJk0BQiSif5hc5vOmL90FolJ5wB5xK7GpS6HmyQzVZ8GEguNH+ziAbV5bwxPgdKXcXSblC
	r/T7kZQkn8a8wUQ9kpfOreveC/NmwHqHtL1mE/aGYwx0aS2g6txuj2/5Nt5JB05Sw2TT7X5HIXB
	xP8VLKGDxoutFQqjEwgZNh+mbXKboogmOKBk/bH2wRWe7R2kH9Kji/y8tc65TRjNY/wMIcEUsox
	DqTZRpDwGviFBnsvtSucdQY7VsJAELLwxuXYsMlDYhYytFn0CsqsKQ50CepaT72lvyG+rY+LNw=
	=
X-Google-Smtp-Source: AGHT+IEJ+Ef3Oex5pdoKvNGE2jNPnyAvjiCvNX7k53N0P6w5OL4ACrTa/WVrbC1VAnfl97pDetAO6A==
X-Received: by 2002:a5d:6d81:0:b0:38f:27d3:1b44 with SMTP id ffacd0b85a97d-39cb357b616mr2957681f8f.2.1743969713594;
        Sun, 06 Apr 2025 13:01:53 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d98bsm10199924f8f.76.2025.04.06.13.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:01:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 06 Apr 2025 22:01:44 +0200
Subject: [PATCH 3/3] iio: imu: st_lsm6dsx: Fix wakeup source leaks on
 device unbind
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-b4-device-wakeup-leak-iio-v1-3-2d7d322a4a93@linaro.org>
References: <20250406-b4-device-wakeup-leak-iio-v1-0-2d7d322a4a93@linaro.org>
In-Reply-To: <20250406-b4-device-wakeup-leak-iio-v1-0-2d7d322a4a93@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=l7CRhFlZ6pn6hdkl7kstlhIYoNXxtom6dCRCabxrvMU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn8t2qifPOWPOc85NGw1m7yDEGSug8i9ONXMKX5
 5gP53XtWDiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/LdqgAKCRDBN2bmhouD
 1+B4D/0eXUZVxZoiPcZjMLxa3FH+U7uhxJSCqoHJdSpdEtOM4g0uDEfsauINOXiir8KF2EspHqx
 nkVH6hoL3EaHuDsWeD8bjY+PNKS3sThCakly4LNMYHyPCd9Hw6ikDYNkk3IIAMigdi0g9VUvBh8
 A1NZIeM2OwUbGz01zpelL3sXyRjgDxQY6d0BlX4iTPnAiqmdIq5pTVDmp+v7qZd5owzwKwYqvN2
 OCom9ADN+y/ham4MXhB7UFJoUKyrQcH7EKiqUCZHEGKCC7z25oZl26FaJCieR09OMf384mizQ7n
 zGGGFJ5Ik4Y9vMcQ6qMmM0GglVdV2VgYrHKob4im82KXGwWNcVIKS2a6KA+MGiv1riFAUOPDHzj
 h93xmc6Zfx594JWNbGfOHU7+n+zgbzGDO3KFe25OQLRHsWKNpUGOSgfTV1EVzL10JB8v1iWMvAR
 5E/NTLjRjTwTqfqb/2M5DMEsJ4EAZi7EugacBRC8h0CFI1dJYLPtVg6Lk1R/98F/DFqe1VZhj5p
 Lg/dHImuAp5oCNfiLULw8w7XbBvIHYPeLFABam1fdzfllND6QIUUN1VX6wrr40uhxvJANSrJfL3
 2Pc4yd55QRMjpKsKeX69vo2wtceyXiLQ5TzD53RWM1brIXiYa1zb191VmBV6xp2Glo0pnt68BgT
 ThIX3TfHGrgd1Tg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
index 4fdcc2acc94ed0f594116b9141ce85f7c4449a58..96c6106b95eef60b43eb41fef67889d44d5836db 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
@@ -2719,8 +2719,11 @@ int st_lsm6dsx_probe(struct device *dev, int irq, int hw_id,
 	}
 
 	if (device_property_read_bool(dev, "wakeup-source") ||
-	    (pdata && pdata->wakeup_source))
-		device_init_wakeup(dev, true);
+	    (pdata && pdata->wakeup_source)) {
+		err = devm_device_init_wakeup(dev);
+		if (err)
+			return dev_err_probe(dev, err, "Failed to init wakeup\n");
+	}
 
 	return 0;
 }

-- 
2.45.2


