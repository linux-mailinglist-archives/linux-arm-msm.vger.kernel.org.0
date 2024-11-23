Return-Path: <linux-arm-msm+bounces-38898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B937E9D67AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 06:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79745282468
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 05:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F419C16F0CF;
	Sat, 23 Nov 2024 05:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8Qj4jQQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCA582485
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Nov 2024 05:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732340704; cv=none; b=HTWGDjAZGUXy0GQ9RHT09C1VihNtKKKwhgWix5JrFpcieEkKjwSbxP2/NaI/AXkliS1o4ey5RNYYTdQq5sOzzczBbSos6iDi24sGT5MH+ZeRQE2OUchLZlqY/z3T33Rhc0Vop5dSYl56TXu9dxF6c4a0qoo5gx++XQjXi6ogT8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732340704; c=relaxed/simple;
	bh=wo85Gu5tBP+bwX8G9oF56lJcLl9CC7oulIrznUfB0WU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H2RYttFFBmCJWD/C8YcZ/YlHGZhBMcoMkABF/ljlq7nzGtyznAkK6Er+InXDxcRrba3mH7MekDgxx0W9ZN9SRRXcu4jRAs3i/xvCVkUESIKGNnljcPbAWSuEFkX2+sVe/sPRfeizdG6wOsuy1hNvHJTrergSsg1NFPSU8BftLSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8Qj4jQQ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53da22c5863so3438681e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 21:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732340701; x=1732945501; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b0HbshW0FDIroP6XclaSjKmLerWTeDPWIHr80xrRiJ0=;
        b=B8Qj4jQQ6sAeqpRvFpXmVxwQr5szW9qXVU4Q97/CnMwRbFindsLSyzEc3HJi43CVoI
         Uo6kmPevwaEBkqk+J9859BpoCmB63Rwj6zl/53abZkqqWdjPoRwIPWFjQ6JQQQzfe6aW
         o1hLMkrHoc31fvk8nKHpOCDsNQ8CUwO+4/yzQaVbmbKIgDXJVwDJEzpz56MTOw/EtNhc
         3H33ZHsR5Utt/GE7r59z4TGxA0cg/fE+ryfxI0V+PzJ9V2HbCbup5rlMRLiKOJnqjsPR
         UxPpL9ke1ZODXM+2Nv0EbFF+Io/GMJ2WbOii229xkMm5rV+H3KoDiYkTypsySQSwwZpj
         MXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732340701; x=1732945501;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0HbshW0FDIroP6XclaSjKmLerWTeDPWIHr80xrRiJ0=;
        b=wxcTqvHbbzkVy8mylrzIFbMl8AuBzZczpBmWUEqcvN7z6YNS25FwovQOhVusQQ1Vz4
         D2Yl4UNOl8Nsd+lhduT/IrDZjn5KFTQoE9GCVkZ+RO6bHtlW7HSJ8/kmHwwIW6OWOPT6
         QpQEe6kJ3OlptQRqx2eaemKvxGIdla3Xxe9U0QFQxwWP0JZON3Tzf/Gn/OQP5fjJrOHk
         QsifYzOsYWGdaqopBtfgjk0aIDeDQwX10U86+kCMgxIY72Qu9nqRUXLqoG+EvbOLFB1F
         zqR6CeqXWJWnwJJH5pyPp3XbTJJbR11he6YGKuZZGOuI/yXS06wXsJ37UWt3cW6psScV
         vYfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnb5d5KsmY1tVGERL/InSemmTiKZEA5y8VGLHHIL5be+iS655eUMTEvDt9RPPvG3jp/A8EH7uXU9sxzGck@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9GdR872uZMItq8t74Mhdx9G/7or7FrhSpYCGPYPk7btIGaEGO
	X1j+Nxq/6czEf1m07zIbUxwGOISx27ZvO1LjSIZLlXayfo+u+N6yPsVysclPzwkIn965a7wRARF
	l
X-Gm-Gg: ASbGncungSYagwh8E0GDYzTJmYF9+gYgq4zbOcvZe+cZYfIa7L2Bkxf7Sahh1WusNqJ
	yowGGXbm6n95N5eLQuTS18AiNLDdUXW/GlgDlQVQnDqyWLNUn1ZsCz0o+o8cvhwbMDJR3KrtDnZ
	a+ywxN7LIXbfy9Io7Wt7Sfsi9g7PqCLFfpajDERmWXxhIDdlctpnYqV/s3/CtQY60y5oVH4qqUg
	g4WYb6y1t1VIEz+GwjWGkKrd2RAfq4Wqwo5UC/8ps1LXgO4xt74XrNhHA==
X-Google-Smtp-Source: AGHT+IE6fTO7btbu83dqsP1xnHmtk6AvgRM7qns88Yv9lZ+YmpujoZwp8x7KhxKEiw6v1OvMyAq2Gw==
X-Received: by 2002:a05:6512:238b:b0:53d:dbb9:f3e8 with SMTP id 2adb3069b0e04-53ddbb9f54amr669860e87.4.1732340700953;
        Fri, 22 Nov 2024 21:45:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24457e1sm740143e87.34.2024.11.22.21.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 21:44:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/3] drm/msm/mdss: rework UBWC registers programming
Date: Sat, 23 Nov 2024 07:44:53 +0200
Message-Id: <20241123-msm-mdss-ubwc-v2-0-41344bc6ef9c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANVrQWcC/3XMyw6CMBCF4Vchs3bMtNDEuvI9CAvsBSYRajqKG
 sK7W9m7/E9yvhUkZA4C52qFHBYWTnMJfajAjf08BGRfGjTphqxWOMmEkxfB5/XlUJExJxvIxNp
 A+dxziPzevbYrPbI8Uv7s/KJ+6z9pUUjYKOVdrMl6Mpcbz31Ox5QH6LZt+wK6vSxdqwAAAA==
X-Change-ID: 20240921-msm-mdss-ubwc-105589e05f35
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Connor Abbott <cwabbott0@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=wo85Gu5tBP+bwX8G9oF56lJcLl9CC7oulIrznUfB0WU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQWvZfOsGqP696O7eYCPysgh+v1Zp5nT4q6jp3
 TJjXjxhRfqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0Fr2QAKCRCLPIo+Aiko
 1TtPB/0RHVW0p8/zsE5/LcsUtA1U+CDchj7dVu2x+xpE5DZqqTkUSJ7hCpgMNltoltWFehV/O9w
 NPQu9g0qgTH+iRJJOsETgPFcz9t9mGGgdmRgv+CR5RZJiZ3ngp1HSgBt/+lh+4sazrTCoAtuq9W
 FvvZ+EeuA2FZUjE5gNwrf2b612BDhoyK0xYU9G08ny9xWu+NJHB2t0zTeb/1l6rs3eypSwDnQxF
 xl/Q1vkfiPGSIZdtIWty2HfGQKRUDlh/VtxowjK1ajoC6JCGMAJ2LtL5v7URvpShxJG12IUreow
 87sm8JQjt0ZUpZCYIYaICGinoIzA/hg+10kiPR5Z8TotquI4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Current way of programming of the UBWC-related registers has been
inherited from vendor's drivers. The ubwc_static was supposed to contain
raw data to be programmed to the hardware, but was later repurposed to
define of the bits. As it can be seen by the commit 3e30296b374a
("drm/msm: fix the highest_bank_bit for sc7180") sometimes this data
gets out of sync.

Rework existing msm_mdss_setup_ubwc_dec_NN() functions to be closer to
the actual hardware bit definitions. Drop the ubwc_static field.

Unfortunately this also introduces several "unknown" bits, for which we
do not document the actual purpose. Hopefully comparing this data with
the more documented Adreno UBWC feature bits will provide information
about the meaning of those bits.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Dropped applied patches
- Added defines for UBWC_AMSBC, UBWC_MIN_ACC_LEN and UBWC_BANK_SPREAD
  and .ubwc_bank_spread flag in struct msm_mdss_data (kudos to Abhinav
  for helping to handle this on Qualcomm side)
- Changed msm_mdss_data to use true/false to set macrotile_mode
- Link to v1: https://lore.kernel.org/r/20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org

---
Dmitry Baryshkov (3):
      drm/msm/mdss: define bitfields for the UBWC_STATIC register
      drm/msm/mdss: reuse defined bitfields for UBWC 2.0
      drm/msm/mdss: use boolean values for macrotile_mode

 drivers/gpu/drm/msm/msm_mdss.c                 | 71 ++++++++++++++++----------
 drivers/gpu/drm/msm/msm_mdss.h                 |  4 +-
 drivers/gpu/drm/msm/registers/display/mdss.xml | 11 +++-
 3 files changed, 55 insertions(+), 31 deletions(-)
---
base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
change-id: 20240921-msm-mdss-ubwc-105589e05f35

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


