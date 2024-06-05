Return-Path: <linux-arm-msm+bounces-21808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0D08FD721
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 22:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EB121F24B6E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 20:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A281586C2;
	Wed,  5 Jun 2024 20:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JkI0XPNX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410EA157A7D
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 20:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717618226; cv=none; b=uJYw92ORQUq4Kh2KPEZ4YoBOnnzyhdNJQcESN/z7TU0riDm2ogxSpZuuumTwCd6d/24gywus1Wzfxqral8q1WkprAUQV6aZWj5yLB2iMUKGxsdlxreeQgGQvPq8wxqZ79xgf9DAxuWigIZJ9GLkT32LHi8W0j2nCvgaVPFPZ+88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717618226; c=relaxed/simple;
	bh=pcoDxWlC8iqZ1yXyRHWFFhfilc2C0qAAL9dra9Pimmg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MbeX4k0is6vsxTE5jcFTFJaopEMQpyzqZ4D9ptpR6EPCYq5vKk+r7YNfm5F/LJXliNezLx+eDMXTnX/kH1LlP97VFAL0xdN92ThqFv4zvaPiivMHa1Y9KpGQ4PWHnXloru2O60t/3B7FXnIhJiSlp3sAS7LS04PFGKWr5rkXFM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JkI0XPNX; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a68a288b8a4so11722566b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 13:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717618222; x=1718223022; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YGczuZ2lWdVfE1piGkex5C9npOPV1bJTkT4lzcILbpk=;
        b=JkI0XPNXxURCIVC+6+0OEoMPlAqEojE+XumAZ+FSGkAjdNLxpUzP20ZXmX2YOgv3v2
         MGNCB1GNQ5OFRCn43tgVr4LBZ92bqiZNP/SpvWxXHOPaE4L/XxIDZnc+7KI37TNF4ehO
         vwA2yI0GXvSmNE1xnn9eR/MLGnG4NnkqnjnG/+Ch7INo4Ske0uWPsMuAV5IfvbGsK7b3
         nYsCCWiPEELaTPyp4nAf02NdmswEKrNMCby8NF9HjjJ/0W7cVmJ4McmU/0cmnHOme7Nb
         X3zHdYWb2RJ+RV2YiwefVaaGhw4Y1zypD9V2Q125fn0fBzYm5PRw7HGD60zQVx/6t4Nr
         Q6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717618222; x=1718223022;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGczuZ2lWdVfE1piGkex5C9npOPV1bJTkT4lzcILbpk=;
        b=r/Ma/O/VbRVybKkn8No/JZ8FYEhU4hexwgHcy2xDz1z6E15dKt8D2DcAWcqai485/9
         pDYXdcbHt5QQjAB9LY/0Smx3WN6wrN9Y8zJKAxJ2y6m/yKM7YvZsbh6K7u1Q9QFuhBP/
         Q++3N3GRF5izaHbZnmMj17LmrGk1KvL/80Q63Cbn83Hkm8D2H4IFiWcDt/2G8afeGx1Q
         L2j2Q0ibA8PLKlzqS5ysI6OJWq6Mfp0l3LcFLNoe7ZPq2S7Nv+KxPKGSYuD+nF9vz47C
         vrWzuQJlZVvePzto/VeqVd/RzRSrxfpDN9jAieroS/7K6JTtqTArbNNFyEtjR8H6d7Uw
         LjSg==
X-Gm-Message-State: AOJu0YwkmndB6118D7tWeHkh3ce91sGhr49jefGFEYR/sGnWNmqLV107
	1h9foRgK+4e5h8Oyg2MLGQBRumQs+i3tJC6IoCjAb9jyyfemtgdLoweIghYueJ0=
X-Google-Smtp-Source: AGHT+IFrCBrnkkLsecGW7l6vDIv7uQOZiW1K0q3pJY+cy9j4zxXAM/TcNHR+nEx9T8KHaN1eo6bC6w==
X-Received: by 2002:a50:875b:0:b0:57a:70fa:8875 with SMTP id 4fb4d7f45d1cf-57a8bcc4aa9mr2438463a12.40.1717618222534;
        Wed, 05 Jun 2024 13:10:22 -0700 (PDT)
Received: from [127.0.1.1] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31be4e36sm9717473a12.53.2024.06.05.13.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 13:10:22 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/7] Add SMEM-based speedbin matching
Date: Wed, 05 Jun 2024 22:10:13 +0200
Message-Id: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACXGYGYC/22NQQqDMBREryJ/3ZQkaJGueo8ixSSjfqiJJBJax
 Ls3Fbors3oD82ajhMhIdK02isicOPgC+lSRnXo/QrArTFrqWpaINSxsRZoxP9ICOMNetA6wTho
 MElSWS8TAr8N67wpPnNYQ38dJVt/252v++rISUlho015q3Sijbk/2fQznEEfq9n3/AOJYqwO3A
 AAA
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

Newer (SM8550+) SoCs don't seem to have a nice speedbin fuse anymore,
but instead rely on a set of combinations of "feature code" (FC) and
"product code" (PC) identifiers to match the bins. This series adds
support for that.

I suppose a qcom/for-soc immutable branch would be in order if we want
to land this in the upcoming cycle.

FWIW I preferred the fuses myself..

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v3:
- Wrap the argument usage in new preprocessor macros in braces (Bjorn)
- Make the SOCINFO_FC_INT_MAX define inclusive, adjust .h and .c (Bjorn)
- Pick up rbs
- Rebase on next-20240605
- Drop the already-applied ("Avoid a nullptr dereference when speedbin
  setting fails")

Changes in v2:
- Separate moving existing and adding new defines
- Fix kerneldoc copypasta
- Remove some wrong comments and defines
- Remove assumed "max" values for PCs and external FCs
- Improve some commit messages
- Return -EOPNOTSUPP instead of -EINVAL when calling p/fcode getters
  on socinfo older than v16
- Drop pcode getters and evaluation (doesn't matter for Adreno on
  non-proto SoCs)
- Rework the speedbin logic to be hopefully saner
- Link to v1: https://lore.kernel.org/r/20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org

---
Konrad Dybcio (7):
      soc: qcom: Move some socinfo defines to the header
      soc: qcom: smem: Add a feature code getter
      drm/msm/adreno: Implement SMEM-based speed bin
      drm/msm/adreno: Add speedbin data for SM8550 / A740
      drm/msm/adreno: Define A530 speed bins explicitly
      drm/msm/adreno: Redo the speedbin assignment
      arm64: dts: qcom: sm8550: Wire up GPU speed bin & more OPPs

 arch/arm64/boot/dts/qcom/sm8550.dtsi       | 21 +++++++-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 34 ------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 54 -------------------
 drivers/gpu/drm/msm/adreno/adreno_device.c | 12 +++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 84 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 11 ++--
 drivers/soc/qcom/smem.c                    | 33 ++++++++++++
 drivers/soc/qcom/socinfo.c                 |  8 ---
 include/linux/soc/qcom/smem.h              |  1 +
 include/linux/soc/qcom/socinfo.h           | 34 ++++++++++++
 10 files changed, 185 insertions(+), 107 deletions(-)
---
base-commit: 234cb065ad82915ff8d06ce01e01c3e640b674d2
change-id: 20240404-topic-smem_speedbin-8deecd0bef0e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


