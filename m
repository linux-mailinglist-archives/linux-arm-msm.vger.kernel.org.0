Return-Path: <linux-arm-msm+bounces-53866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F0CA849D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 18:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CF229C5176
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 16:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED1C1EF391;
	Thu, 10 Apr 2025 16:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZgRYCZLy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1A61EE7DA
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 16:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302612; cv=none; b=PWsPsUsyEMfppT5UcNkPNt3ZsWs9jubIilGmZyhC7DfH3X+To644GxILTmejYGVpjtAKVJrKwBQJm9m2kX3Jjf9u0NK4fHUcYuWulGgnifMr9vUpnRzN5EujZVO1Jb6CAs1SdG/50llIWTMYsAgV0HGCPThLQuWJittZG7ZdksY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302612; c=relaxed/simple;
	bh=ZT1naHPMwcnziJgo4UbQxNWT1qHNuQGDv9YaGQAevXU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CEu6s1q05rBnlpXhAraJ9JIvLWavRx6NWWoPPdeGRIh02VE1EcKMrIAV67GenhosIqERrIAk2KiQJbGBUUTC74FKwzPQhVt31FvDzOq/dfqdNCwIf3LRddWBCg/YYJhKeIPeq3AGt/iNY1z78/77HTboFV+/laayiDf0jq0QQTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZgRYCZLy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso7416585e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 09:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744302609; x=1744907409; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CmSQhXqEv16lMgPQ+xzd2jwzH2nXMAOrej8vrFccN5A=;
        b=ZgRYCZLyU6SBQ3VpdQaIX9fnBjgzBmfVAHOsenSoDQQuvEejuBAclgaL2VWE9I5xpi
         HZ9yaj8hjTzPJNDT23RpPWG9jH0TDDrr1e9vE0SLLiCuEX0EhJlFdkn5SyTl3YamAPh0
         2JOibgGdZ8XEXo7zT2vjbH+9woF9cUz01Mf0XZiTTMn6JGA8u2rYbSKW17aghsdzbAXP
         RhZE14xDt67nVOHdaCcVHWwuoZGcBDsE5FG3P4XiD11RNV29aZBtbOnJt3uRJDPwGdeR
         zD4hXAwVwnB7NBNh3Xw1IgtukSp9PrjYnzqzQ6YvVvbJZCkusCRkS5CGmM9MYI7DrWhT
         Hehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302609; x=1744907409;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CmSQhXqEv16lMgPQ+xzd2jwzH2nXMAOrej8vrFccN5A=;
        b=NKYWNB/h3XNmO8w4XKi+3C4sReUKnAvVlAvbpD7NDwj+Uw0GVOW7KPAG2n2NjKENdY
         YoXZ2peRrFIIAxJJoYuXja3wP3FArg5SuNuAkDVxZrSGcx9a3jHaTdfrHiRtNDj0t9zf
         HYaJ2/Up4sT5Dv8qGWN3why75i0b5Rr1NkfR7ECMAHd3hQTpiYOpZotpUQHiblrnNh0l
         hxJk2APToCmuNdyMsRG9DHRJHbOrYhiu2s0sD2XORFIP+5qK1odrbpaXbRfUqU1/IoQa
         BL3urykspyEkXnOnnPNSde11hVfAWQd0MO3RQoPiHzuD5/C0JalyjkFkMtvazXD6KSJr
         +f2A==
X-Forwarded-Encrypted: i=1; AJvYcCVxYSmRz5m9LlNYHxPcZsm1ZFPMe9DQvZpKBpe3O1xRKaibvLrZC9/3WQGgHjc/dIcMPUsLEtEr4GG1B6Pp@vger.kernel.org
X-Gm-Message-State: AOJu0YwFaySSKCfwUCCm+E4fNALBm0Bv8P+9S5JxRiJmgJGgml+HJVx8
	teiRl88q1+JLmIG2hNSC8yEF8hV72Ga1xmpVx9Ah1MBSvykNBiq3ZxE8xmlQadU=
X-Gm-Gg: ASbGncvz827ruIO3NGC3+rPJR3eUzFvHWCNvslIS2QxI5DA/zmxzLTNzLj33pDIdmzn
	u636uqQnaIjjagpYL55b/LfG21H6pWbS32Ax1igArnm3aMY/iEGtcr7UMxglchsUtXSAMwfRMgc
	2UO1HBzDLkNOyIhPSYURf+EzNM8T+2/H3TfIbqDdXMSwYf8G2kX3UXzldYb1tHue8rmQzLa4XN2
	OcZl26lGLpaLSq57MmHtfbeeRaMbhLu1erlKXObi0gQCnilMFXVij0kqn8ISZfBERpMeuI2ArWi
	8Ki8zZqQ9WG2eV9vYRlH/RkwRqbAd/KNn4/pGP0jmdxS7x2NBGJe8zLkovxWAXNxuJlZqnk2
X-Google-Smtp-Source: AGHT+IFqSeHKIM9S2EJiC4vMqu0IORLlomRAI/05NMUp22VoBDjNuDgsC0XQJSAWXvOHZULfmc7Gbg==
X-Received: by 2002:a05:600c:154a:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-43f2eb98fddmr31789625e9.15.1744302609092;
        Thu, 10 Apr 2025 09:30:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8936129dsm5350663f8f.18.2025.04.10.09.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:30:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC v5 0/8] media: qcom: iris: re-organize catalog & add
 support for SM8650
Date: Thu, 10 Apr 2025 18:29:59 +0200
Message-Id: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAfy92cC/x3NwQrCMAyA4VcZORuI7SriVfABvIqH0mUz4NaSV
 BmMvbvF43f5/w2MVdjg0m2g/BWTvDSEQwfpFZeJUYZmcOQC9UfCmosktPm8BsJPsaocZxQVwxR
 rfOcJPTvuI3k/nEZooaI8yvqfPOB+u8Jz33/Isr1weQAAAA==
X-Change-ID: 20250410-topic-sm8x50-upstream-iris-catalog-3e2e4a033d6f
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3647;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZT1naHPMwcnziJgo4UbQxNWT1qHNuQGDv9YaGQAevXU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn9/IMKbkRSxg7StrAd02cJPMA5J+jM4ZSZAfisRV9
 i2FhFe2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/fyDAAKCRB33NvayMhJ0TgcD/
 9pwraSP+JBy6WoWCY+0F00mRHfwFZ3P+WoThPNFseD+Ks++o74jrfaSvTJr8iAq07v0kb2mGCAmGIq
 6wcwwXVprWgRDHDCNB31V2KLy//iA4q3I6pKIlX32BsJOiqGTFvEt1GHdT4Iou6l0dGeSUmssGa09o
 13/upBc+AfiFIQyahpAXtFExRWcE0ZgtqUfmFMwZ1VVDF4Eh+R1llplpOq6h3WoaYwQmwhu55ee+8Q
 qUebfpr1dLiEFiDPBGFlcngfCsuBszfpf01BZIngux9auHoe57duo/tMrnQx8rhsgRvQWtYN2cmjLr
 sSqR7H9ZvC1cNqyXw9WHTLYXNfp7yUYtc8rVZAogJHwcxkQtm5wu5TcYPQ3KOqrKj6jNvNrXL1OmTC
 87T3SHF1x5es1B7yIC12y7JNNhxDbzlVzWTchZzggMqDkNipObtnYcjJBOVxio9xowk31ljoFilLCY
 dpu0gc/d3VEIHE3avAzDktqrkrmQdTJcRxJEJx2bwDpb1KjVD1U3rdPWLSlBjqr0lk7Hds5Jr4IZyh
 kyjlN2MxViMYS8hCVfzPf35RWP9YqonpDfpJiB+Vi0VK1t/WjVBhnfT+ZlUm+HZixifil6GKTDzuvH
 STuw1quJjJQeOBf2Yw7RYIVCfxhwwURWoJDR6XHuYkfvC2GqyvJL+Kiiq/xg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Re-organize the platform support core into a gen1 catalog C file
declaring common platform structure and include platform headers
containing platform specific entries and iris_platform_data
structure.

The goal is to share most of the structure while having
clear and separate per-SoC catalog files.

The organization is based on the curent drm/msm dpu1 catalog
entries.

Add support for the IRIS accelerator for the SM8650
platform, which uses the iris33 hardware.

The vpu33 requires a different reset & poweroff sequence
in order to properly get out of runtime suspend.

Follow-up of [1]:
https://lore.kernel.org/all/20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Reorganized into catalog, rebased sm8650 support on top
- Link to v4: https://lore.kernel.org/all/20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org

Changes in v4:
- collected tags
- un-split power_off in vpu3x
- removed useless function defines
- added back vpu3x disappeared rename commit
- Link to v3: https://lore.kernel.org/r/20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org

Changes in v3:
- Collected review tags
- Removed bulky reset_controller ops
- Removed iris_vpu_power_off_controller split
- Link to v2: https://lore.kernel.org/r/20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org

Changes in v2:
- Collected bindings review
- Reworked rest handling by adding a secondary optional table to be used by controller poweroff
- Reworked power_off_controller to be reused and extended by vpu33 support
- Removed useless and unneeded vpu33 init
- Moved vpu33 into vpu3x files to reuse code from vpu3
- Moved sm8650 data table into sm8550
- Link to v1: https://lore.kernel.org/r/20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org

---
Neil Armstrong (8):
      media: qcom: iris: move sm8250 to gen1 catalog
      media: qcom: iris: move sm8550 to gen2 catalog
      dt-bindings: media: qcom,sm8550-iris: document SM8650 IRIS accelerator
      media: platform: qcom/iris: add power_off_controller to vpu_ops
      media: platform: qcom/iris: introduce optional controller_rst_tbl
      media: platform: qcom/iris: rename iris_vpu3 to iris_vpu3x
      media: platform: qcom/iris: add support for vpu33
      media: platform: qcom/iris: add sm8650 support

 .../bindings/media/qcom,sm8550-iris.yaml           |  33 ++-
 drivers/media/platform/qcom/iris/Makefile          |   6 +-
 .../media/platform/qcom/iris/iris_catalog_gen1.c   |  83 +++++++
 ...{iris_platform_sm8550.c => iris_catalog_gen2.c} |  85 +------
 ...ris_platform_sm8250.c => iris_catalog_sm8250.h} |  80 +-----
 .../media/platform/qcom/iris/iris_catalog_sm8550.h |  91 +++++++
 .../media/platform/qcom/iris/iris_catalog_sm8650.h |  68 +++++
 drivers/media/platform/qcom/iris/iris_core.h       |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   3 +
 drivers/media/platform/qcom/iris/iris_probe.c      |  43 +++-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu3.c       | 122 ---------
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 275 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
 15 files changed, 598 insertions(+), 300 deletions(-)
---
base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
change-id: 20250410-topic-sm8x50-upstream-iris-catalog-3e2e4a033d6f

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


