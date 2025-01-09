Return-Path: <linux-arm-msm+bounces-44504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E6EA06D12
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 05:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80B5B1889B3E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 04:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EEB213E94;
	Thu,  9 Jan 2025 04:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jJrSc0L4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE55B2F2F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 04:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736397356; cv=none; b=NIyjURziKYSbAoBUKHUR1hnQJ0lzN/edUrCH6Gcbx5AJJrCSWJkLdc3lDHJ+Ob0ng7VwxIEsHBZ6tm1aKrJoa5EwabVPHsoCYBoX+AxPdqReQ3Q7dE63FFtBDF4OInAGu/p9I76KH94fwclTZdjbsjWRsgGA3399RAPaC4nrCjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736397356; c=relaxed/simple;
	bh=XAgVDFM0e6qnzFvvwCfDFOS9ZgnR2kW9kV/ghkIjd3o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rh+GXv9Sxt278OaMQlo0BJ43Xe+GkBAurzGivzvJA3HMX8WINbXyJgxSIJkEbiUIt8Yatzjc3RH4CMrUAnFs4koaZhEDtyWwBf9+EGRnp9+NyJT7c1yCyQL/UduiB07oRzyfMJKP5kmdmNIzN74pa+K0dAGjNxoumTyFT8zn/BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jJrSc0L4; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54252789365so577469e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 20:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736397352; x=1737002152; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dlmp6mP7QuJqPIB9KT4sUcihAOrSvj8Sn+LsCkFlT5k=;
        b=jJrSc0L4XaXb14unDniSvXgsMeT9lJTmUZysWyHKoWYjWrlR0Iuz3r67hGtyku1wsa
         +1NUwx5NzWlkRnVmFtbNQqUUtWHHfkgREpj1St2un1k+mW2vTmOJzG8TXBm0U/50L7qF
         DkpE6muNeHbiggxOHBTRIGeqCYKk9u4BIo40XS3p8eLMbtGUs/jml/ADRHQLNeA5UP8Y
         N0++3Ap/PTLSbKXuJXomFQwnqR5US3wXTBd7szxyU7PV2YE3mbz72w/RmYekX85Cx7bJ
         VfeoMEF/IATHrEWwFQdmcgfwzeZI+WFfwKXS4v0/wHI9X/KUz9aTudttn5qDNbkfC5wF
         tlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736397352; x=1737002152;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlmp6mP7QuJqPIB9KT4sUcihAOrSvj8Sn+LsCkFlT5k=;
        b=thGjl+48gp7Y0i6JNP9OJBBGuotrYPZaIJPGZ2qsAsSpho//nGuHVsq1lkCNg1qocd
         /nhXXMcC0ZSIeWgEnzvzFbw2lB2FziPz+K3EKKMwBe45w+C1cSodeksHak5mIqx1daCF
         R/7akL49p7tB5ryAxCKC7IIL37sVPzNekSA0AolzSqAWE8cVVAnWuFckc3XK0481qvWy
         sVijnJs4SqR5zdUVp979UiQKdKRjeRf0wLCwRZqTsgQZFdgCDj4owpjVujv4gzW152hE
         yj83g1vHbCvFMH7SHrdYSZPPYZg/bRFGlqUS+HLGpJLFQQiscoAGqWFswXN7YY9jakMH
         ZqiA==
X-Forwarded-Encrypted: i=1; AJvYcCXc9tJnjkG017mIh+0bcOuFYG09XhoqSZrTXMIiQju1vkrYECfQQ/cMw9DlJwWcBloKZcyPlJd4PJLlHk+5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ovdtyteTgkaItmcaXM7W8BTYZQQLaPCrIGlom9Jj0ilpCrOf
	/UArsJ0MuJUU5EOdMcl6wg0LsfUmzTL1gYUgm8BkLUBgJfwtqxLYlPc6cP9lhZ3d+Mx3zg7AbQB
	V
X-Gm-Gg: ASbGncsQUukbkKNsx9QvW2gFkU3RjTa7A9ITb7NIKmyjnnqLhHEKFXKv8Cb/5EWV0IL
	bc8EMso29Riqz2exVul8cAdf6CiPtysHHoABeSrZk+1JBmn2Ro49DMfg6lP8k+O8ic+I3yucGXb
	lb3uF2a7J+5DCunYeDJbKkfvnEdm9JRpZL+nPLmWUWdZxtxDVu8ObBWfFSDdIZXVGmaaFPmKoE9
	WuLP5Pk4R2d5koufmvH3g/UbbM0+UKYn+dKhjfO2thv+aXvzAovXT0Ty4qnV1IabHvIvDXbI7KR
	mitMNQUb/fd/R8leGG+nQxGy
X-Google-Smtp-Source: AGHT+IGd02lt3azQ2L8dtZpNhnUtSYlUFcXM+F8aY38ZwoQvOB1Dn82BTxyDnFVI/52fZpi1dBJQ3Q==
X-Received: by 2002:a05:6512:b05:b0:540:2549:b6da with SMTP id 2adb3069b0e04-542845d65b5mr1571756e87.23.1736397351523;
        Wed, 08 Jan 2025 20:35:51 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec06e1sm73866e87.191.2025.01.08.20.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 20:35:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/5] nvmem: qfprom: add Qualcomm SAR2130P support
Date: Thu, 09 Jan 2025 06:35:44 +0200
Message-Id: <20250109-sar2130p-nvmem-v4-0-633739fe5f11@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACBSf2cC/3XM3QrCIBjG8VsJjzN8X93cOuo+ogN1ugntAw0px
 u49NwiK0eHzwO8/k2iDt5GcDzMJNvnoxyEPcTwQ06mhtdQ3eRNkKICBpFEFBM4mOqTe9rRwVVE
 2da21liSjKVjnn1vwesu78/ExhtfWT7C+f1MJKNDSGI6yqpUz5eXuBxXG0xhasrYSfnnce6SMS
 sENoATtsNl5/vEFAyZ2nmevamGZlo1Fp378sixvCyxwFS0BAAA=
X-Change-ID: 20241017-sar2130p-nvmem-5f856d99bbb7
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XAgVDFM0e6qnzFvvwCfDFOS9ZgnR2kW9kV/ghkIjd3o=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnf1IiMLsAC7cPs4XDpPSBMCeitIpurLIFZI2r+
 tRJv2pM4G+JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ39SIgAKCRAU23LtvoBl
 uK55D/9C964Cn3h2eg+tUXlHIu1NngKJC8MIVe8QFnwm0O6dUbLdYh+n93xBvCq4KebBrV96SCb
 bTlMwGZ/z5Fjy2B+kTMEqgJY+4hNnOVZbJP9VOhSYde4NY5m7SQdn6uLD0BB+YlS3M+SkRX8x66
 kNDcsLPmbGEsjCza8nABjfaLT/B5sN5934NLqA9EH1RZbr9sBx08l2z6p6b1RDJgR1SUACKV0Ts
 OEEL6CtD+48qfMbqqkogpIxMRRay4L82g96A+55+W9QBb+XWbIktwtKGWZ4DZFa1vqO5jPh8mlN
 W73osZ3jIm0y7+/P++toipgfVAuui1f7ydoMXUj9jbunBHFkhzspBl7c3xLp1RhK/GrQZOA1VdR
 9aJnQoUJrfO001ZSYLGrO2vHXekzkTDkqUS/BRa7qPfB3bZ4Bh2oXQbhqcaGxNCFSeK5HrVcKNs
 DHT0MgDkRggUDpDdIYVch4XAGMM0HnvntBU0JLESUBB0wBa0LGe/P/H42nvIwBgC258WFxrbX+X
 l5VhkPK/GrB8uCKoUtR4pYqr7SjATIjllDXEDBYxoNLSvOXVCW3MYWNmnqt9X30zaQhylb8OJnv
 4GTdVC+HLIF6JHktuLJeOQJGy4Z5uaIbjPxWT2oAPgpvrqMwKcFKIJ/KnO8fqJNc3uzquOEwo/v
 yt7MxWDW3AP2/hw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Qualcomm SAR2130P is one of the platforms which require 4-byte reads
when accessing the QFPROM data. Fix several omission in the NVMEM core,
rework the QFPROM driver to use readl() instead of readb() and finally
add compatible string for the QFPROM as present on the Qualcomm
SAR2130P.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Fix conition for bits vs bytes overflow (Akhil)
- Link to v3: https://lore.kernel.org/r/20250104-sar2130p-nvmem-v3-0-a94e0b7de2fa@linaro.org

Changes in v3:
- Reworked the qfprom driver to specify stride and word size (Srinivas)
- Link to v2: https://lore.kernel.org/r/20241027-sar2130p-nvmem-v2-0-743c1271bf2d@linaro.org

Changes in v2:
- Picked up required patch from QCLinux.
- Link to v1: https://lore.kernel.org/r/20241017-sar2130p-nvmem-v1-1-6cc32789afc6@linaro.org

---
Dmitry Baryshkov (5):
      nvmem: core: fix bit offsets of more than one byte
      nvmem: core: verify cell's raw_len
      nvmem: core: update raw_len if the bit reading is required
      nvmem: qfprom: switch to 4-byte aligned reads
      dt-bindings: nvmem: qcom,qfprom: Add SAR2130P compatible

 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |  1 +
 drivers/nvmem/core.c                               | 36 +++++++++++++++++-----
 drivers/nvmem/qfprom.c                             | 26 ++++++++++++----
 3 files changed, 49 insertions(+), 14 deletions(-)
---
base-commit: f8bde2c106663ee2398a16bf6500f1cc8f5cf64e
change-id: 20241017-sar2130p-nvmem-5f856d99bbb7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


