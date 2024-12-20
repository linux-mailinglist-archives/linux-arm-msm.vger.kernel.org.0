Return-Path: <linux-arm-msm+bounces-42980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 212CA9F921A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 13:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 788EA16A63D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 12:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1A2204698;
	Fri, 20 Dec 2024 12:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yNe1M87h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97D1204596
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 12:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734697338; cv=none; b=oDHNPDkI/uzG20srtnj20JKgcWM3nBJQAemazi82LqSgvzWB7r1sAhUAzKhtv15FHxt4rQveDhgEL3NMyURfrviSoDj7pk/ELBdjNcKqM3fnTYjUwsBoKkiI6sNAAMvpb4map2wpMu0Igctyw2Rc0SK28Q2Q8aLj2QYcrqMUcws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734697338; c=relaxed/simple;
	bh=qx5p/hDbUkuDZtzddbNWpM0QTt2rSGt/pmcZqagYCts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pTbt8PSqmmnI4u5iHVjiW2TQi39r2H0CT7XJdCgI0nUVZse3WwR4ZWfF+KUi5RV26FH08nn44YW3PO/tEHUMh8seh3HwcQ4PcNPpLFuOhj4bDRYfqIFUWYPVxm+oNt+5gCcTMmF6s+M8cZGGvg7RUK7NtI431byks/o+D+KNBBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yNe1M87h; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa696d3901bso333539066b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 04:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1734697333; x=1735302133; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dVIs/A5zO1lF6Hvf56Jf96I1JylRoUAYB/UjCgUI+Ws=;
        b=yNe1M87hI4shQl5xbvB5lfiFPX8AzZmee9d8Y/Qjy2JqC1Ws+mK3zlWN5TEW7NuYkr
         MfHh5/GpW0ET11M3A/9CO9GevuavAJlWy+H46RjyU0kOpuO+LCiaT1HT32pXIowmrMEt
         5ibW/d6SA+j1srgNYxGclQzDQtDufNO8GuNLjh4u8wE+xG6HcTBa4+toGaFmrTt+g/x6
         uxFpTLtXIkJ0ipoAwgYC+OJjAfzmlBdfy0LF3fW+WTjTiCvDG3F8RfNj0wnMInu77edQ
         Q1Utfk1POeg0y1Yc5V5d00b1Oontqwwvi5wYjTcXxKfL/zi8e6DKbRzCiri0FnzikYHL
         oTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734697333; x=1735302133;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVIs/A5zO1lF6Hvf56Jf96I1JylRoUAYB/UjCgUI+Ws=;
        b=O0acaLiMJ1KhDhrg0pcfQJpgfS3BmBw0EcNJaPeFGkWoZdoYI9nSLmm8+hNPS+PL0R
         eN5RzCaqBdi55iTHFG7J0Y9MZJKwoHHXjEY6RfF2RzAJlUiVWvaa0EKs1hQ3MmOrArpx
         VEwPHTztYbbF5wtYhgUl/Sr6CFZF/574bjFR0sHJB1ig/0Fl6fYYo2vLSgGB2HIP1Jd0
         keVtlj/jxYhM5+K9iic2MHV/2PTkY6gTFu5P7PqWpW7MrTepdIejmaayv0ITMEYpC3Tq
         2y5PD9OW5fhXiqLw5EnHfhRaVM6akjeDd2AxFIzjY1MqxTmSyFA19KiVOOE1vhCYOmK8
         qvOg==
X-Forwarded-Encrypted: i=1; AJvYcCWScvF9gmDuzQhnLU+S8K6NN/VAs8jMiXZhOfWlA7vJCODg7QVxwIfgXxrkHJ1d/BAF7vR1dlvcNj1t27Yv@vger.kernel.org
X-Gm-Message-State: AOJu0YwmSEotWMQHt3kbrjYMieQrnE2VSVw93hY5B8ysH2AY7f040tFo
	0Oda+Grio/aJ5dj8g+Y2mC6wMwo8FLQT4H33v9I1D4YfMunowBceixKmOn61CL8=
X-Gm-Gg: ASbGnctWuAt9vpP7IP33rurEP6qZsB7Qtt6/qRb/BOXKGgUuEGfNFLj3fpwsO1kiz3i
	B92eKjFT1POkIDOHleXjESvGD1dww3fl79FipKATApXlGCdcPVRE1f5Ay5CcdRcL7MvDrESOavl
	kdISoOwSACCA2AJE8MtExy764sxyHC8q5FpIb+G3Dqqk2U1f+zBqE0Mdr3vUwTWNCXPMHaOU10p
	0vCa3qNSeKgIG1U5UrUOj6zff+zcZktHLkWN0KZYY+vHfazFqyrFjSNfk1c+qPXYpGNB+rm6sA9
	DaAahF/tGEuH8lOU7uN1gxt+ly1WCw==
X-Google-Smtp-Source: AGHT+IFPG5xPXCwcvvE2JWaV4HcrHvc6W3DgQ5ZikyH58crfIMJ8TJhxYQjOiX6A2Ig+f3m0RqS6HQ==
X-Received: by 2002:a17:907:7e86:b0:aac:4ef:36de with SMTP id a640c23a62f3a-aac2b19a851mr241107266b.17.1734697333203;
        Fri, 20 Dec 2024 04:22:13 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f5f4sm171403166b.6.2024.12.20.04.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 04:22:12 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Dec 2024 13:22:07 +0100
Subject: [PATCH] nvmem: qcom-spmi-sdam: Set size in struct nvmem_config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-sdam-size-v1-1-17868a8744d3@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAG5hZWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIyMD3eKUxFzd4syqVN2URLPElNRks7SkxEQloPqCotS0zAqwWdGxtbU
 Aju9aLlsAAAA=
X-Change-ID: 20241220-sdam-size-da6adec6fbaa
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shyam Kumar Thella <sthella@codeaurora.org>, 
 Anirudh Ghayal <quic_aghayal@quicinc.com>, 
 Guru Das Srinagesh <quic_gurus@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Let the nvmem core know what size the SDAM is, most notably this fixes
the size of /sys/bus/nvmem/devices/spmi_sdam*/nvmem being '0' and makes
user space work with that file.

  ~ # hexdump -C -s 64 /sys/bus/nvmem/devices/spmi_sdam2/nvmem
  00000040  02 01 00 00 04 00 00 00  00 00 00 00 00 00 00 00  |................|
  00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
  *
  00000080

Fixes: 40ce9798794f ("nvmem: add QTI SDAM driver")
Cc: stable@vger.kernel.org
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Related, it would be nice to set sdam->sdam_config.type to an
appropriate value, the ones currently upstream are:

  enum nvmem_type {
      NVMEM_TYPE_UNKNOWN = 0,
      NVMEM_TYPE_EEPROM,
      NVMEM_TYPE_OTP,
      NVMEM_TYPE_BATTERY_BACKED,
      NVMEM_TYPE_FRAM,
  };

I don't know what would fit for SDAM and I couldn't find any info on
createpoint either, not even what the abbreviation SDAM stands for.
---
 drivers/nvmem/qcom-spmi-sdam.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/qcom-spmi-sdam.c b/drivers/nvmem/qcom-spmi-sdam.c
index 9aa8f42faa4c93532cf8c70ea992a4fbb005d006..4f1cca6eab71e1efc5328448f69f863e6db57c5a 100644
--- a/drivers/nvmem/qcom-spmi-sdam.c
+++ b/drivers/nvmem/qcom-spmi-sdam.c
@@ -144,6 +144,7 @@ static int sdam_probe(struct platform_device *pdev)
 	sdam->sdam_config.owner = THIS_MODULE;
 	sdam->sdam_config.add_legacy_fixed_of_cells = true;
 	sdam->sdam_config.stride = 1;
+	sdam->sdam_config.size = sdam->size;
 	sdam->sdam_config.word_size = 1;
 	sdam->sdam_config.reg_read = sdam_read;
 	sdam->sdam_config.reg_write = sdam_write;

---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241220-sdam-size-da6adec6fbaa

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


