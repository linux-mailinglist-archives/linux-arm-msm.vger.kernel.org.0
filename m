Return-Path: <linux-arm-msm+bounces-5165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F3F816B19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 11:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3EFA1F212B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 10:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03A1168C0;
	Mon, 18 Dec 2023 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vxa3M/Cp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5672F179BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 10:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-336417c565eso2557956f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 02:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702895293; x=1703500093; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7BPN7HknVmK6uiDCdIFric0Cs4pCUrzneUiBQGa8T20=;
        b=vxa3M/CpzubCkl5Kt59mcFXalLt5gLKuligKV8vW+o1TyOsSX5tfHxTAiSp7yqt7wZ
         HMjqCZWOBVx685peXXjmXmX9U0iKCPGTT7bvGJcIrSSRdMB55kasF//tJwsh3X6bosJj
         vhpV+AlWKHrU8NTvCSwLm+O2uNQz6FppbVi3fD9aX5x7jVDSOGT+LcRlZFj6fGA0y8gm
         sWYmVNCyC7LKURuB/Uyvphax+qsli3f8HTWTcNjHhtedyv6tiba/N+9Q29NoQOOghbaj
         BY4bbfpGHjQ0/y4bbHskOisfHJQ6C0WfWodkTk74up7ehdySVll8RUnn/4JwDAk/UmHT
         cp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702895293; x=1703500093;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BPN7HknVmK6uiDCdIFric0Cs4pCUrzneUiBQGa8T20=;
        b=IqR9/P6DHwRLbQjISLIJqMsuactgEHKzLvg9QTBDmUVFJlAxm5gu+U99h3K7VVRgcV
         +zlVUFiHeKi7+uHuFQEVRMXmjs6KHMsJ68LepQ16Av6cxVBGJX921cQYUczfRg5TvQwU
         oj2Gpj9i7xD6dtmGPG6S+CTJ5gzDdh9w/2uxzaCHYgiTLZ2Yh8lEPRozLjdvxcZTdkS7
         J+ELvHx/HTvQe+mRZktfr9qmNixJLkcnSGC94MmlkNTKIKl5v0VKc3K9XKVPt84fVXFp
         wtYnrbBzUHfJmuNJkARW/ZuRZNdJR+ov129qkbIhYrU7/ZRKl/lgY8XK//jA87WW189K
         iNDQ==
X-Gm-Message-State: AOJu0YwSkRip86wFxfhUwEHmVqJOPL+fCeWt0oUcVY7Ocr+cesgcZTwE
	5QQI1ACe9lShRQmZM21+q51IZA==
X-Google-Smtp-Source: AGHT+IFmtQVh0lgPHrpchHq9aidxRx3+Tai8ce+R/UJ0bajTpWDDZaDgxghR+xP3csHsEumWKju1IA==
X-Received: by 2002:a05:600c:a05:b0:40d:1b50:54df with SMTP id z5-20020a05600c0a0500b0040d1b5054dfmr144232wmp.265.1702895293384;
        Mon, 18 Dec 2023 02:28:13 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ay35-20020a05600c1e2300b0040b2b38a1fasm41857967wmb.4.2023.12.18.02.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 02:28:12 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v6 0/3] remoteproc: qcom: Introduce DSP support for SM8650
Date: Mon, 18 Dec 2023 11:28:08 +0100
Message-Id: <20231218-topic-sm8650-upstream-remoteproc-v6-0-3d16b37f154b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALgegGUC/43QTWrDMBAF4KsErasyGv1Y7qr3KF3I8jgR1JaRX
 NESfPfKoZAUL+rlm8X3eHNlmVKgzF5OV5aohBziVIN5OjF/cdOZeOhrZggoBQjDlzgHz/NojQb
 +OeclkRt5ojEuNKfouTHONkSdGYhYZeZEQ/i6Vby913wJeYnp+9ZYxHb9xVH/jxfBgTvbI5DyJ
 Kx//QiTS/E5pjPb9IIPooQDIlbRQEukGyRwuBPlXRRw4AFFVrHveuVd56hTzU5UdxHBHhDVtro
 1XpIeoBVyJ+oHUeABUVeRGtU64ZRFY/+I67r+AGDUpAgZAgAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Mukesh Ojha <quic_mojha@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2743;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=HgV0XaiMWlDJwJaCvMA7pHtaQIayK1j0Gw+cHP3hehI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlgB661PtZ2N2ni9jPCNobKTqTasMWL0uPveoMVI6U
 QISsktqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZYAeugAKCRB33NvayMhJ0QDeD/
 4tdqH0NhMK3V+AEoT5SHj0pEHgYmS3DP6cFgCdS2gVwVslEMxwdngpNc34LuZqBIuMFLmPaqJ7tp/O
 Q+pM87+DKWTIqpLnrko8ejCISRwJ2VmBm5K0t3g8FVxNofh0f2432cYmd3QGsM7I0gjZdqI4UBmN6F
 2pDznpXXQ0TZHwnu2aCkkQ8qXD+5JBpydHfdjvA/OyjJrh9Jghm745A+qCw6ahpjMuNHEiSqWAXwdq
 I72xz9MoZFvjTKKrG7mvBGjSf0i/9oWS0Vtyk+QrnPz/ah49RYDReP/FwaO4RDo9W7tBHE4UIoQNBc
 9ljKyCy/vhxHGKZedOVFHnOcRiiab9qVnmHX7/Otf5Ddd/PLWNfO3izaRd+qvI6ZfeXLvXQ3NSkAPc
 NTWRT6YK920MHk50EBWsMLhegGzCTIXX64CtAqYYaY6oQbh5L6WVtRvvoVKOgvOBJ8ffrIv7EgY5YL
 59ImZV0SUkeymocxoK03pBq7Ml0/5xbxz22ic3eXWLMrszNbQikOqkKez95ckqxi+10WSTHtiIUhPm
 zJKxtdh2mDaYNxJS5hpUvFKBJVRvzIJQcBO+P3xkj5KY6OPsBzwXWCHggA5ecbRcuZ5Y+78tnEYS1z
 e2P4dRiOswCsGywrTTRA3p0H1/YSevaoX0n8qWPrAJGo1rXT+FQk1ejghaMQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the bindings and driver changes for DSP support on the
SM8650 platform in order to enable the aDSP, cDSP and MPSS
subsystems to boot.

Compared to SM8550, where SM8650 uses the same dual firmware files,
(dtb file and main firmware) the memory zones requirement has changed:
- cDSP: now requires 2 memory zones to be configured as shared
  between the cDSP and the HLOS subsystem
- MPSS: In addition to the memory zone required for the SM8550
  MPSS, another one is required to be configured for MPSS
  usage only.

In order to handle this and avoid code duplication, the region_assign_*
code patch has been made more generic and is able handle multiple
DSP-only memory zones (for MPSS) or DSP-HLOS shared memory zones (cDSP)
in the same region_assign functions.

Dependencies: None

For convenience, a regularly refreshed linux-next based git tree containing
all the SM8650 related work is available at:
https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm8650/upstream/integ

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v6:
- Rebased on next-20231218, last patch did not apply anymore
- Link to v5: https://lore.kernel.org/r/20231212-topic-sm8650-upstream-remoteproc-v5-0-e749a1a48268@linaro.org

Changes in v5:
- Rename _perms to _owners per Konrad suggestion
- Link to v4: https://lore.kernel.org/r/20231208-topic-sm8650-upstream-remoteproc-v4-0-a96c3e5f0913@linaro.org

Changes in v4:
- Collected review from Mukesh Ojha
- Fixed adsp_unassign_memory_region() as suggested by Mukesh Ojha
- Link to v3: https://lore.kernel.org/r/20231106-topic-sm8650-upstream-remoteproc-v3-0-dbd4cabaeb47@linaro.org

Changes in v3:
- Collected bindings review tags
- Small fixes suggested by Mukesh Ojha
- Link to v2: https://lore.kernel.org/r/20231030-topic-sm8650-upstream-remoteproc-v2-0-609ee572e0a2@linaro.org

Changes in v2:
- Fixed sm8650 entries in allOf:if:then to match Krzysztof's comments
- Collected reviewed-by on patch 3
- Link to v1: https://lore.kernel.org/r/20231025-topic-sm8650-upstream-remoteproc-v1-0-a8d20e4ce18c@linaro.org

---
Neil Armstrong (3):
      dt-bindings: remoteproc: qcom,sm8550-pas: document the SM8650 PAS
      remoteproc: qcom: pas: make region assign more generic
      remoteproc: qcom: pas: Add SM8650 remoteproc support

 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  44 +++++-
 drivers/remoteproc/qcom_q6v5_pas.c                 | 150 ++++++++++++++++-----
 2 files changed, 159 insertions(+), 35 deletions(-)
---
base-commit: ceb2fe0d438644e1de06b9a6468a1fb8e2199c70
change-id: 20231016-topic-sm8650-upstream-remoteproc-66a87eeb6fee

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


