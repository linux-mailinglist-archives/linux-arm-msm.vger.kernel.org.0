Return-Path: <linux-arm-msm+bounces-77146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F59BD8A3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 19AF34EB858
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11AE02F5322;
	Tue, 14 Oct 2025 10:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SO4egynB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6FD2E8E04
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760436178; cv=none; b=Be1lJi9grwpg2ZZfOr1+5VLWZK3e4oyMStk+/NxEbfqEUQl9pFCS3wrk+aULQYezp7Ia2LiLbUjljiKI2GZR0gN99AiuxvPtNi7J9kB6UxUp0B/EIAd/DF1vbkrHuY0s5mlDqVqpMq5kLsgbMMKTp7aDvZCNSL51Es/Kf8Gkb4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760436178; c=relaxed/simple;
	bh=SVtMO7VUBLSAh8tqnEqoTPss3ef9mx54zpbAairZ8UQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VPynNK5sEdaFU6VhNcTWi9GzqZm6j6bCmZvYdX+TjunrtMSXQOKd1jWDUAaBpkqSJdTRbZeRZ3cqRxwB/B5XsSIqLz8/5MleM670y0wdlkMwoEnAjMNWow0KHtB+J8keItQBH83+Q3v6AaEHRgLLGB0tJLihb+b6jjYGn12eg+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SO4egynB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46b303f7469so33500135e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 03:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760436173; x=1761040973; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1c6b+GqeawN6AugUtZw8SvN92PfqxV890zC2ujYfseM=;
        b=SO4egynBNsI7pVx3JIPcQb6FqMyNtjDKDwMTFVmsHYvGM+Bu1PX/YufamEkA2tM7fm
         h8y6ta//VeMVdf30KsoOS7+IONJZIoVU8EzWx5EM30QpGyT9utNcF3Cg1TcmVWrUPZf5
         yAZ2gmcpJtmdJSji+qjniy/A0smxLw4TVOQSckHQJ1NsFaI6QRdfu98de71u7Z9iVuug
         ZFf67PUU+Um9YtBfsV6ERShlNqVhOUMqNylPW4xREY+znVAuhRpyqNAxQk/LNUe05n1V
         +uwe+pRkNiI/4MFAfadDksktc1qRn7Jnx0yOn2Rnnm+r5m5Vk31SLXM43V372GipZZmm
         Ng+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760436173; x=1761040973;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1c6b+GqeawN6AugUtZw8SvN92PfqxV890zC2ujYfseM=;
        b=o0yJ/t9YUs2g9pE+D7MhfVkgQLUb1kpv0GWfie6u9t3ce0WLifLmDxjaqL5+72hhtl
         /xDhfyfRJxOmK2kpJZDF4a0qjtFgHvW/gKbjgQZoRd0p2XC//PyIJUhRN7Sw3J9neUWI
         hu7PKl6hErvvLUGUJYULN0GgaYNQXd+pgKalCUFaam24he+SyxQcS+zyN/jdgO23u4CD
         0Q98IF/WCgoa3jnyhxA8Z8r6Q+wZGLyHBgvG6GmTDQ1L4NB5irJnA3ek2TZcjpna8LgI
         S+8m70shC0b+qgncBPEg736piaJHHHzQqWET/me6cS/SGyyjaxCMiMkQaTnO+mI3xQ/+
         AQ3g==
X-Forwarded-Encrypted: i=1; AJvYcCWI7Bs0TdOdZgwfin55H9sA9LmfblFy7IQ9podbUXvxyuNtmf+KnijHQyBfwkeYYgRZFiq7INR6WRsNq6Ap@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1QZAw8a3BmJ02fgf9YSz0oYt7NkQJNoNBnKRFWJ+7ui5JhxBa
	xMT5yYZdJgkByoaOX0Z/uiCdhiNLpm39bD8eId7wJNgnvwRlryHd6p6pLVQ2NPWNv/o=
X-Gm-Gg: ASbGncv9fz/y96cHpRIzUahsnUAp26GET9rkooafUNY1wN8/ZcSuyaQB25q7u8rDfxw
	etnyuoytFetsmasjCS9frrYYgCoG1lt+QsQVQzYXLNwOmTVMQ89JJanK/QNUqtx662+LvyCFB2U
	fQ94RqhLNKY/MfosQ6wy86xcnMloSZhqE0s5TDJDbyl5/Up7lncMoW7yZlxeVgCfFnbYT4WYQrO
	RREb1Jk923juCuULlgWEynKF7haLs4fv/b2UeVyvcAdc63XA3AL83DmMwW6iFV8HDyrhrdd9Oau
	3pVn3PODYasW78xDMrMIC3QB7jr5RdbRCYUXtL8RUIDgGGlTK3YUoAvoWeMNROWtcqLKRe0kUcO
	3+Zpv2oU8taf/KGWzNLGD7NiAK6H8CeLCTu+eEdriSc/AFw9qyaIlkQ==
X-Google-Smtp-Source: AGHT+IFeF879+ZVKEsJpJII/6YXJBFFuE25hKrVz1ilfZmhvgCYyYIsyl9axbuskS/eO0lovEnBZtQ==
X-Received: by 2002:a05:600c:502c:b0:46e:1f86:aeba with SMTP id 5b1f17b1804b1-46fa9af014cmr155783425e9.17.1760436172814;
        Tue, 14 Oct 2025 03:02:52 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb489197dsm239615305e9.10.2025.10.14.03.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 03:02:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v3 0/4] phy: qcom: edp: Add support for Glymur platform
Date: Tue, 14 Oct 2025 13:02:26 +0300
Message-Id: <20251014-phy-qcom-edp-add-glymur-support-v3-0-2772837032ef@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALIf7mgC/4XNTQ6CMBCG4auQrh3TH5DWlfcwLgqt0ARobaGRE
 O5uITHRFct3Mnm+BQXtjQ7omi3I62iCsUMKdspQ3cqh0WBUakQxLbDADFw7w6u2PWjlQCoFTTf
 3k4cwOWf9CFRyQkolaMUFSorz+mne+8L9kbo1YbR+3gcj2a5fOz+0IwEMmrP6UglJ8qK6dWaQ3
 p6tb9CGR/oLimOQJjA9F4xxovNS/YHrun4AN9TtnSABAAA=
X-Change-ID: 20250903-phy-qcom-edp-add-glymur-support-2a8117d92b89
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=SVtMO7VUBLSAh8tqnEqoTPss3ef9mx54zpbAairZ8UQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo7h+83gSTsRn9fQ8mn3dvjXIkW9tI8b06P5FCJ
 a90fnDYkB6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO4fvAAKCRAbX0TJAJUV
 VoTyD/wLoSKlk6qM/kYRJn3q2sUnNKCGjNvMO4l1wD77dL6VELuCYerCQ1iqRE9M2vqXsmHU0Kb
 9LYILHrsywic2wK1SZvJ1FKfGx7dvreGXljDLjqx34ANm5bwu1ZforYQonfw7ngEkThuGQl0T1V
 XyVcqDy/zkAvoJ0nU0PCaH3DlWj3H81shqWEwiJtQIPLaO5xrmbrW75yC/v78cNjKIVR8HC9xFf
 EjbPbCXZY1n9UIuewFuQbK+dYTOxeA3Ze0V6BWWeRYiFWdbXfH1grqXzrBiiMcaSxer6z/ZL6P0
 UJWSSCFqNbA96c0scoRuM0fjDNhLnsilrYuBYEfBkaSNczAOWTzU0Lb5o0I0OyrCmwU4/k2t/Ff
 Uj4dnrYYXRDVmt2Sse97ZJLLvijcmC0v7avLMCOxJQBQIQ2V/4qg/I6QP/tONMHYn1Qs8qBwkuS
 ryIsn7/Hzg0AwloJLq+dxZhPAI6fyqOX7TmFTQSFxs2w0PCu6lPfMo/W+WYMOHFaxI3pGh4PV0Z
 hdct7EEVRw3ivOwmPqvL7y6FeZT9UJqflZitZB75V2vWl6AjUyVbg5kPSkpP/SeRzYttUL2jJqR
 KULGBIJMsm7fxfe5SKeaJrcapOFh41xwHdTne44Ylb1Kk8NRmcOde4Zk3ciYoG2Ncn7X9Z9iJpB
 c5ZZQjFbfS1j2Qg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Glymur platform implements the eDP/DP PHY version 8.
Add the necessary registers, rework the driver to accommodate
this new version and add the Glymur specific configuration data.

This patchset depends on:
https://lore.kernel.org/all/20250909-phy-qcom-edp-add-missing-refclk-v3-0-4ec55a0512ab@linaro.org/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v4:
- Force fallthrough for 5400 and 8100 link rates in qcom_edp_com_configure_pll_v8,
  as they use the same values.
- Picked up Rob's and Konrad's R-b tags.

Changes in v3:
- Split the DP_AUX_CFG_SIZE change into as separate patch, as per
  Konrad's request.
- Re-worded the dt-bindings commit, as per Krzysztof's request.
- Link to v2: https://lore.kernel.org/r/20250909-phy-qcom-edp-add-glymur-support-v2-0-02553381e47d@linaro.org

Changes in v2:
- Sorted alphabetically the both the compatible and v8 specific
  configuration.
- Prefixed the new offsets with DP in order differentiate from PCIe ones
- Link to v1: https://lore.kernel.org/r/20250904-phy-qcom-edp-add-glymur-support-v1-0-e83c6b9a145b@linaro.org

---
Abel Vesa (4):
      dt-bindings: phy: Add DP PHY compatible for Glymur
      phy: qcom: edp: Fix the DP_PHY_AUX_CFG registers count
      phy: qcom-qmp: qserdes-com: Add v8 DP-specific qserdes register offsets
      phy: qcom: edp: Add Glymur platform support

 .../devicetree/bindings/phy/qcom,edp-phy.yaml      |   2 +
 drivers/phy/qualcomm/phy-qcom-edp.c                | 232 ++++++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h  |  52 +++++
 3 files changed, 279 insertions(+), 7 deletions(-)
---
base-commit: b529e9498b7948df2be579282cbf0d5a9a3b7f9a
change-id: 20250903-phy-qcom-edp-add-glymur-support-2a8117d92b89

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


