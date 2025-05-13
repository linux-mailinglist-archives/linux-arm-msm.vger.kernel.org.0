Return-Path: <linux-arm-msm+bounces-57709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D35AB56F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 16:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 959B8176775
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 14:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997312BCF72;
	Tue, 13 May 2025 14:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vr2C19Q8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A801128F538
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146251; cv=none; b=LURLKtM9V+2EPmfPgGH+eOzAy+XOJyYydGyiHVA51CUWoKLYEKoAG2bdk48Ugy0iKM9a6C9EfUjcyNJeVzQpXyOXO9Enc8QKmMSHvWd6k2i0FJ0UToSaDp7wHo/+0ad15XU4AbpqucVyzyIhtWFTx2HhZduVFP3Wp63+2TU9kyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146251; c=relaxed/simple;
	bh=V+yA0wwcS/bVf5oT8EHOGAo5JiL/HicUzO3XXCHGScE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1gDaJfNB8nYRwqsbdSBDw/iAiRuoA/HeiVEWE/Cn1rc7SHYqS6QgiVtOsK2uPrW8KBZJ71EcgR/48v5hGGWfcxhKSQsPCQr1147Q2WiPqPvm9hp6xCwzflAno+KCcwmhSyGOCffgV9IwhRa5y8Erb9RNFZTaxLaendMvOEt6no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vr2C19Q8; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54fc36137caso538992e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 07:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146248; x=1747751048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+mIWe4f7/ePA4eiTd6mBWZ/3eo5UNvBmTQDWz6UZOo=;
        b=Vr2C19Q8UQrlRGw30BYh5g29Z+4kEMYE9XewAWBKBjrstcr3s+O+J+SReRrVgIpjKy
         ahCFUFnFRB+e/cM+1U5K39V48VRmKf+gDHZPAIbEdS9WJAnEQa+8UHudDVYP2z6EvHjU
         R476q71FoTuhEFHJ90kAUeBmwsT2I8L2Zj8Hdt+SthICmAPdX27e1ELRGLhS3Tyi46Y8
         8ly41YHABoaF86ZyqSxYhTjdQf2ijut3M858ZOv9C9iNZ6s+dEWG7wKMsRuzzu6jkC3+
         30BZF3AwqdyZevXojPG1x1vOk4vzgHxXmIHStnl/NS7UiwX+jwKL6+efOxrHOV/XN1b+
         Ib+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146248; x=1747751048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+mIWe4f7/ePA4eiTd6mBWZ/3eo5UNvBmTQDWz6UZOo=;
        b=ItXODR5uW40GDCrEpV8/09s6u76q3YP2fZ0TvP8Xx6Qoeivd1G+CbNr5ofPILfNd/N
         o77Awj0QGNLyN1bANro7isvnLkHMV3NGNwr32IlgvyPj3sIg2fNiTl8BD3HI2m/o1xyd
         YFvVWw5d0PT3xKrpoyOUF/sSFHYcmUTd/LGdx7BBznTeMllfaSKlobYRCBrUSGlf+LYm
         VBQ6xhMtGALcH+ooutc0mhomc/mwR8bZHw1EsKL0QbxA/849cJ4DbI78edqwvBiO1JCe
         HgHsD7tGdjMkRRpcGqbglWOFUwCkAIgAUI0yKSH5dZ/qhMDL/BY5J+XopegCdIbYp2Lp
         oP7w==
X-Forwarded-Encrypted: i=1; AJvYcCXTYFLsrs4PGMO2pFB4n9DUN47tmOkZ+U2I+lT5koyv+eEE35OxgpvDUWh3hp2c5nyHcDVpvg5ud/kYf793@vger.kernel.org
X-Gm-Message-State: AOJu0YxLLrGnD9/NHbI8KX0jbyMpCJN+MbJYgPzDsB2Zz2sVdNLSkReI
	TIRXNcaj8fJp1ANUl5rVVzkCeftNnm0pxvAo2xIOR5VXxUGfg0xU4j6v8X9LOgQ=
X-Gm-Gg: ASbGnct+t8fxtiv+s+EXEK9cw2Nz5EAO9srtoob0lpeTCpp7Y3ickfPVkmPo5Ilu54d
	3PVKORbrDDMd7SukLXwlF26aiDrRFS5sBFmIRbz0oEXd2Q72kH9JWzeGvXii5KpByNhLpz4Jp0/
	awypUm3BQtpkcrl9UejEsFbQEL3n3fEOzDpRSoFX1Po73F7KBhlkfaLp5egnUTs+weB+oaVyP5r
	v5M9FLhDCHkjZgQWWJUVSJbYXqjrn4SGqQ2+9UhyjMSa7++o8vXumGDWWVIkrdqlY8rPd8aU2fp
	gnC49cZOSk/UfVHV/qm6rx6Ke9fSvplugmQ5K+xoTHcA0sdhg43y+VgiLEOpWqYg01IdKBvseWn
	uB6CXFz0u8eph5bugRyq5xrCeb6BtD0pIK2YqbsRJ
X-Google-Smtp-Source: AGHT+IETgSn1urVnMun+WYtNS1QXqt+HyQMwe0j+DtEuUcdRDUPi7bIqRr9TigWkClOwQ9fQ4/Hijg==
X-Received: by 2002:a05:6512:4019:b0:54f:c2ab:c6be with SMTP id 2adb3069b0e04-54fc67bee89mr2089901e87.7.1747146247658;
        Tue, 13 May 2025 07:24:07 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fba0sm1871813e87.23.2025.05.13.07.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:24:07 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/9] media: qcom: camss: register camss media device before subdevices
Date: Tue, 13 May 2025 17:23:48 +0300
Message-ID: <20250513142353.2572563-5-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A media device can and at least for sake of simplicity should be registered
before V4L2 devices including the ones added on async completion.

The change removes the second and out of camss_probe() media device
registration path, and it allows to get a working ISP media device
independently from connected or not sensor devices.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 25 ++++++++++-------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2977aeaf27e1..976b70cc6d6a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3417,11 +3417,7 @@ static int camss_subdev_notifier_complete(struct v4l2_async_notifier *async)
 		}
 	}
 
-	ret = v4l2_device_register_subdev_nodes(&camss->v4l2_dev);
-	if (ret < 0)
-		return ret;
-
-	return media_device_register(&camss->media_dev);
+	return v4l2_device_register_subdev_nodes(&camss->v4l2_dev);
 }
 
 static const struct v4l2_async_notifier_operations camss_subdev_notifier_ops = {
@@ -3645,6 +3641,12 @@ static int camss_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_register_subdevs;
 
+	ret = media_device_register(&camss->media_dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to register media device: %d\n", ret);
+		goto err_register_subdevs;
+	}
+
 	if (num_subdevs) {
 		camss->notifier.ops = &camss_subdev_notifier_ops;
 
@@ -3653,26 +3655,21 @@ static int camss_probe(struct platform_device *pdev)
 			dev_err(dev,
 				"Failed to register async subdev nodes: %d\n",
 				ret);
-			goto err_register_subdevs;
+			goto err_media_device_unregister;
 		}
 	} else {
 		ret = v4l2_device_register_subdev_nodes(&camss->v4l2_dev);
 		if (ret < 0) {
 			dev_err(dev, "Failed to register subdev nodes: %d\n",
 				ret);
-			goto err_register_subdevs;
-		}
-
-		ret = media_device_register(&camss->media_dev);
-		if (ret < 0) {
-			dev_err(dev, "Failed to register media device: %d\n",
-				ret);
-			goto err_register_subdevs;
+			goto err_media_device_unregister;
 		}
 	}
 
 	return 0;
 
+err_media_device_unregister:
+	media_device_unregister(&camss->media_dev);
 err_register_subdevs:
 	camss_unregister_entities(camss);
 err_v4l2_device_unregister:
-- 
2.45.2


