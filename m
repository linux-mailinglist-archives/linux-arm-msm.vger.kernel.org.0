Return-Path: <linux-arm-msm+bounces-62919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8B3AEC8CC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 18:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46D051BC1394
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 16:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1C35789D;
	Sat, 28 Jun 2025 16:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KNbszcg2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D7B1DF75B
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 16:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751128576; cv=none; b=k6E1P+IZ194vigqPDZ8+i3QURb+PjEGkK3UVjT+kK6Pz7g1JKIqs9QYFtqWxZ2eHs15B7p7b0R19TjfLVpbpuEb76qGLOi6wn7+Dv1PkX53hJkQ9LHp75qSaUu+dVoR0Qr2pe0aocrOtjgsFcW5hug2U2JBoqf1ekTznrb3WidI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751128576; c=relaxed/simple;
	bh=OwP/lf62mREd1vSSmxVBEiQeT13TbHQ+vptHjo7GqTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SWacV4kBb5K3D8GJgMeIcUaL0eOjSdWJW1/ZJA48qgO73v49ZPtR6KYOKgqXWWhfrURJJ1pURoLSiveDRdJyu/auIavGmqLRZWTgh+KMxnHqx+Lx94NFcNASwNorl0n87saP7NCNsvt2c42/A3yVAdksQufSCghc1BbGHWUbXto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KNbszcg2; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-611998766c0so433378eaf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 09:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751128573; x=1751733373; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QuQ4Fw7fDUnS90iOwROBUGe+MKAwoHfg9mWA7eHjYOY=;
        b=KNbszcg2fo2lg8yofl2GCzCkkL26ABe0x7gUQNC+UODFkqJo7T1L+A5HekKwKofLXv
         RWqXVLMcw4YrSFuj8lGzP5Qw9bjPP6/ORa4wzK1i8vraYONMAVaRD+kE4bX2iMmyAJZx
         +bygeb84BiIPWGesrk/fMFpDP1OskRDOIWVG/onRohembvkfWfqA2fPwZkfSZZ7H1iKJ
         jW1n9ocAWpCjXBY+0khaH67+YsV8Ofjn5FBe4xjMG3CQ4EfSIiX4no8M6WQAv97hS1ij
         7FsZouBA5LzcVoeSEaeLC7LW+edJylvuBbS1ZbvGwLOQcpj0G83TDRiZKBR9g4SiZRKA
         UcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751128573; x=1751733373;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuQ4Fw7fDUnS90iOwROBUGe+MKAwoHfg9mWA7eHjYOY=;
        b=WsmMZ65CUu2YlWBt9qWH1VIX6+KobeidIKiOkjYGMWtFLtXpelJsMUZEEDs2fMPWlx
         pl+868lKFf3aHhxy5Sr4KKggSvWQsSbl/y6Ujn7ttDl8g1EM5Ud4h0EpmCg8EpF12kLW
         OK3APOBIRUnPUt6TSHR5M7LEFIBhgfcyMnvdrv75IW32sSIAjTTOHwVv66FMZjx2Vzs4
         eP8MT3dZGjuRgnemQmipyqPTIo6nWDqQRvfRfvpE9ZfPSqtjPYz0xK18c7hcG0tsVRkQ
         iuVky5h5rso8HyTceLyzwU7iR/CQHLhRn9cBh/zlBKuuDvPd1DW9+fRlIaHCmQXGiI1c
         LzQA==
X-Gm-Message-State: AOJu0YyMFYPLVryT4jHCnzfZ1g5C3LdVaRnvAaXDD9nnUrQIIXyqxT9i
	Kjk9C/tiCGIVndkHZi3GJ/co/67u7YTmdgCv6Br+J3KDL5/ZQJJ+oWitmOaDZKlLRv4=
X-Gm-Gg: ASbGnctuVEoGYcwqJAx0ebr+zYKLXzcy0Ml8wk2uc524TGgRnwlGhwkScPrN2DyGQ5/
	VYF/lNiai9xNNvi9GYqFFq4klqwRdlN7M+94ylElIZyIBqfORpJDgX+Ookirrm03jpua7c4x4iQ
	FJz9VfpkK+KfiubXP4CMHDHdSF4nHVV8tNJ3/JiWMOEeg4rl7yVrWSGWzYNAutHD+jSCsOK4PIm
	JyFU71zwA4OnuBkxvrmb3rV1pYMol2THMtGJA0/OHtWkEcQTu9rXsohgLtHg+yIhuN557QA30Gj
	BZTPdpANlAVU+JW4ho5za1AiaJFgNQih8ohoJQjjevGHfx+i8vZP+d/DitiIb1LKTrhv
X-Google-Smtp-Source: AGHT+IGh2gll+hAT9vkyWgz+C3DSp6kI/Nkor4In3e9lHUogN6Ibi+9tUPUmM23hw4Dl/y/rFPFEWA==
X-Received: by 2002:a4a:ec42:0:b0:611:befc:38e5 with SMTP id 006d021491bc7-611befc396emr4059962eaf.4.1751128573140;
        Sat, 28 Jun 2025 09:36:13 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-611b848d77fsm585371eaf.14.2025.06.28.09.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:36:11 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 11:36:01 -0500
Subject: [PATCH] iio: adc: qcom-vadc: make scale_adc5_fn const
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-9-v1-1-188ca6e904ee@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAPAZYGgC/x3MQQqAIBBA0avIrBswIbOuEi1kmmo2GioRhHdPW
 r7F/y9kTsIZZvVC4luyxNDQdwro9OFglK0ZjDaDtsahSESKIRfcfPE4oXWOyLKh0Wto2ZV4l+d
 fLmutH0N6la5iAAAA
X-Change-ID: 20250628-iio-const-data-9-688cc6e2c7a0
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=OwP/lf62mREd1vSSmxVBEiQeT13TbHQ+vptHjo7GqTI=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYBnz9eKqq8quTOIkwc6SaCszLQlsuCda/9ZoH
 8AgHhHwI6uJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAZ8wAKCRDCzCAB/wGP
 wHNLB/93kelZS5rjf9G8Z2hFczYFXGUdgcOoU0x61Bw4szcN6fynYL17wHfIZNi0ByH1Ny/ughU
 v6MP+cg8Gmv6nsZnip0tcvh+V60hOLa7kxNK2LpZo2Nt6JpiJI/3Z1F3tg6e/dNrrzuAHcfGZr+
 maD5VABiMONhMNhpaKzsqatlx2Z/FzkqQ9XvHpbph1rQ224uuIRjlZDPed/DhAaTPLglGHv5J03
 rIdCcDl+vK94T5PXLa4YGSTeSl+0Dr4elKHuCy4wb0VuSh/DsQX+ySQuZAArlXc1WwGiqd1Y+VK
 yM/FsMB9Z41aIJa+HnOIH5xZSxIARXHe7YSTylu5lwFfqle0
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add const qualifier to struct qcom_adc5_scale_type scale_adc5_fn[]. This
is read-only data so it can be made const.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/qcom-vadc-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/qcom-vadc-common.c b/drivers/iio/adc/qcom-vadc-common.c
index d5209f32adb3e265acd51d56dda32e6d0be42e21..b03cf584b1657ed39a325fcdbdd9dea96f171f8b 100644
--- a/drivers/iio/adc/qcom-vadc-common.c
+++ b/drivers/iio/adc/qcom-vadc-common.c
@@ -330,7 +330,7 @@ static int qcom_vadc7_scale_hw_calib_die_temp(
 				const struct adc5_data *data,
 				u16 adc_code, int *result_mdec);
 
-static struct qcom_adc5_scale_type scale_adc5_fn[] = {
+static const struct qcom_adc5_scale_type scale_adc5_fn[] = {
 	[SCALE_HW_CALIB_DEFAULT] = {qcom_vadc_scale_hw_calib_volt},
 	[SCALE_HW_CALIB_THERM_100K_PULLUP] = {qcom_vadc_scale_hw_calib_therm},
 	[SCALE_HW_CALIB_XOTHERM] = {qcom_vadc_scale_hw_calib_therm},

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-9-688cc6e2c7a0

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


