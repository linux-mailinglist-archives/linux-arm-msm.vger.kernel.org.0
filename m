Return-Path: <linux-arm-msm+bounces-16281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A77598970B4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 15:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48BAB1F21192
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 13:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87EE15099E;
	Wed,  3 Apr 2024 13:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oZPTkmoF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5D015098F
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 13:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712150416; cv=none; b=sqeOkvfRbh65UUKfcMEL9acqdp+JThAg+rJdJC9iFV1cbwC7kyeFFTWqfkwfGS7OOGkkjmarkpIn4OjrkpHID7R1ASgpm97O/x8mpZFdazl+xP9h6NUcAg2e1NSCSFn6HxhvpRFRmGcuD3+cKOvLal7YIbBmwrkRsvQ1T8d7dK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712150416; c=relaxed/simple;
	bh=I/WssGKzx2pu9m1OGtbWNQp8YlFg6iKJZjVi11y1FHs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cjVmR1geDLzHaJJwzI5EyTFFYeCRzGsLf+zSG/85SpjbX4m75mgUhF9iB0UiTgfwIEh/YNho15ZDXyGQ5GX1hKUvTkZrWf5Q6uKbGtTQmq924G3jCD4PxRS9nQPA5AKKZq1ojk/kr1IS89dKzE63w/hw28dGtw0a2xMPg0rV2g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oZPTkmoF; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e88e4c8500so5107723b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 06:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712150413; x=1712755213; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JEsqOJgrZKfiF2/lAe/0WeYJIosNuSPi2rFlnClcirQ=;
        b=oZPTkmoFnRDD0YGlx/b7FzKkhWl6Z+m7h4hniLRZELTDa2C0jeYjittfFrbZKrfzww
         +xyReQkZivoTWqLcsc39/GYXMuFuhnudE1yx5P+F8SrZtM5Tq5zDpSfr6Bj+5ge2qVT4
         sz8CioULMUeNlqOWjvN7w9Hh9eLACNylY1EzEYHQXwg/UKkmYFLXlmQhgZNCy30uwgpk
         r7RlY/Mud8ehE3sCI5Yh9UVgSBM+SkVhJH6sokzi6StJdmhFVcPDDt27nJhcXdsh+Vr7
         /n0c60M57/lnuvBGpG+6XjY4GIueLBe3qlXaJiFM2GKMJaTd6eKWmExu3aj6xGKsYFNG
         pX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150413; x=1712755213;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEsqOJgrZKfiF2/lAe/0WeYJIosNuSPi2rFlnClcirQ=;
        b=Auzm4DLygVhszKyc9wvOfSvxAKMrecQsQ0aJhkermrvwEKkkQ84Tkw+3yFny4uqf4T
         QhNr+biwZTNAZDjaskfKe8/GDhXQP6zHDe5a+C6kMC+MlhmeZvZq2JJNAhnhJPCayS2+
         lHjYGZr1BlAcOI26vChu6+cUZ2W1+JpW1cvYQn4fGSrQqJAXudDDYubhZ7TGHeQHpzuA
         0ZcO4Ga2sSIJlYJWX5x/lAWg+aZcxN8wv4UY40NRlv0CQIIcRN+te6XQu0rTfOsiIhhC
         JPElcFq8/Woe1FzgZ0AB1hyo6ZdwmlgXTGPXmjsD+X7oES0riZ4oC1L+IZw/N09AyHE7
         Fl2Q==
X-Gm-Message-State: AOJu0Yx1x3cLmVpIT1zwBDbMBXgcq/9frBkMQ68uHzUsCMHHMJ677+iL
	0rgVdiPOKaj6xg5eqZprN1235xHZue4cXYdjTUfoQH9Gk6DBhkNFalSwsLp9Qg==
X-Google-Smtp-Source: AGHT+IE+mv0vqUVj752A8+B5uK4aKOSeJFS0d13jC9TEMRJbt33Mn6Zcv6SnMhyVyxPHw+XjYiPyLQ==
X-Received: by 2002:a05:6a00:4b46:b0:6ea:f369:f204 with SMTP id kr6-20020a056a004b4600b006eaf369f204mr12783329pfb.5.1712150413075;
        Wed, 03 Apr 2024 06:20:13 -0700 (PDT)
Received: from [127.0.1.1] ([103.28.246.48])
        by smtp.gmail.com with ESMTPSA id r1-20020aa78441000000b006e69a142458sm11640518pfn.213.2024.04.03.06.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:20:12 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/2] scsi: ufs: qcom: Add missing interconnect bandwidth
 values for Gear 5
Date: Wed, 03 Apr 2024 18:50:02 +0530
Message-Id: <20240403-ufs-icc-fix-v2-0-958412a5eb45@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJXDWYC/22MQQrCMBAAv1L27Eo2jRQ8+Q/pIUk37YI0ktSgl
 Pzd2LPHGZjZIXMSznDtdkhcJEtcG+hTB36x68woU2PQShtlFOErZBTvMcgbSfd+8JYcmwu04pm
 46eN2HxsvkreYPse80M/+/xRCwt5Zb8hNwQ729pDVpniOaYax1voFL2GfbacAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Amit Pundir <amit.pundir@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=896;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=I/WssGKzx2pu9m1OGtbWNQp8YlFg6iKJZjVi11y1FHs=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmDVeJnTVsB5vVtzC1XXd+71BouXk1NUPDkQH8U
 XZE4J+Gjk6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZg1XiQAKCRBVnxHm/pHO
 9cW5B/sFuhC43fGkXLgFBtBpf9x+bFYfUF6omoJDt7oqWbnol3Lx66367osNuqO0sYm/sv0XGQ/
 ZhrBvtltB37VYds+n2KStqf2qOjNvxpDhCPYyHTlnyZm4F1ZQFXbtpNYYy5S3GUOwL0XBaAwUkM
 WNb2Jy8eiHEGElIfZi8qGeVM94X03RXe2Ihw8lyV043M2tQo6YNP9Q00IPn0VUwJFVQIGNOc5fU
 tt5tNPI/qSusT4yIjlCyeyhfKVQ8sjYH9nc75942mJ/ftHs9ff3StuFij/1FkJBqEPcpESyLtcK
 n3zKHOD6dMuac8unAvfEkUGFPwvoKAOajqJgdTPrfslZ2R/7
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Hi,

This series adds the interconnect bandwidth values for Gear 5 to the Qcom
driver and also adds the check for the unsupported gear/lane values.

- Mani

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Changes in v2:
- Added sanity check for gear/lane values
- Collected tags
- Link to v1: https://lore.kernel.org/r/20240401-ufs-icc-fix-v1-1-3bac41bdfa7a@linaro.org

---
Manivannan Sadhasivam (2):
      scsi: ufs: qcom: Add missing interconnect bandwidth values for Gear 5
      scsi: ufs: qcom: Add sanity checks for gear/lane values during ICC scaling

 drivers/ufs/host/ufs-qcom.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)
---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240401-ufs-icc-fix-123c7ca1be45

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


