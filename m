Return-Path: <linux-arm-msm+bounces-16006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCA98949B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 04:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5275282CCD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 02:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10EE61401B;
	Tue,  2 Apr 2024 02:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ho7xyzBe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE6814A8D
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 02:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712026640; cv=none; b=o0ycVXleskvmkmr8gWTXe3q5Yi9lTgskfTw7pVwQL6xQJR7JPAvvhfKwWxBoF51IvYCZwMpZvHmvtz+riaRFE+nUnD2e8qcy5hVAZw87UAJdAIp9snNzctG2huGhxj9qRWqZR7lc21XETJvIGl5uulbWCf5J0G1eRxhxO1XekBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712026640; c=relaxed/simple;
	bh=mx7vGKdoct+1XCR+gKQrL0/i2J+RoirrlHsWudiB9P4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dU0nSeRE1RKwwdbouM/5/3q5Yw/j+tCKyEmNbMCyTTG5Q16p9/Xmo/nhVBomniCwXUH4w3yYwf3D8Y/6q4qPfqC7BSHczZyxyq4toupGVSPQc/vzGf5zFmYCxxfk9cujcZRoeEjXSAtObt9x19FFxsbqSRlKeE4gFgw5652QJLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ho7xyzBe; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d700beb60bso79914881fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 19:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712026637; x=1712631437; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CcOWlQgGqIBcz4uNt6+yhh3mpC8OO9XobRr1R/KttXE=;
        b=ho7xyzBes0cWLG43DFVepM+cpiUNqu1kE1FjUT8vxd6Vw+bHrKL3yeNP7aHd+GzH4P
         +rYLPvAJvO4lk4OgS01jrbMJCTqDQAjKuLv+DS7qkHFIz76VFB/fQg4eix7KsuUlSRLB
         NUCyxGL25UWPJnq1ZS1uEZTtgUQOja34TuMsLeJAzkBzigMn3RhRXkqGSmLbOU8Xpkr5
         Dnh3N+WsrYISbs43SA5QKlgqqC1220G9oAeAbcq0pMy5/xpv9HxyOlmGBucpqazisgKQ
         buXldds4OYDnURXAigyQNCr9diwcXrQElU1/CrlKK8JykRNJ+S/b3V+Lsc4oN/3HVZsE
         yocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712026637; x=1712631437;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcOWlQgGqIBcz4uNt6+yhh3mpC8OO9XobRr1R/KttXE=;
        b=UPEgJd5DUXQyMPceIJ+zQ2KPMgRsLDHDWbVeuQOcPQ13frkZ113TddvJWLvQa4nXz1
         JkpoFvw5moG+iOltw6xJ+iNBvcR4CpmxKxJU7dBKrVgKPcJWDTrVcLKVNdPf2nwehZDf
         vLbBBwDVHFYXG1bOE/6PzG5psA2cUSwoSNmyHTzHToaqueTgAstQxPJxtYm5EgRrn61i
         RX2TTOvaz+0LOxXccQ+Pe9JE3fBgLNr5cZMdGGsyDBHaq6EnOmkVfwi6Aj574NUUzETr
         bXn9uYp1XRh2B9SBXT4Tz+cog1dER3APEUI0Y/nniyho5pHNGNuDwQFAChZ5xLMW/1Uf
         XGVw==
X-Gm-Message-State: AOJu0YzMqbZ52KgDngf/IOXjgHrTEY2Yqt9P8kOCqfbMkbm9wo5XZxQA
	3+MMPiXNwLjko+6xlNZbQ52yhIsWW7olDz0BMegZHt5cQEqny8An8bg0nVG5TKc=
X-Google-Smtp-Source: AGHT+IFzre67aWg/rp35jenHFonGTGNHJMZBGMJI+1ExqAewWmJtZ2jIlumaCs6UlCm76CrVFChZOw==
X-Received: by 2002:a2e:740d:0:b0:2d6:cd05:1899 with SMTP id p13-20020a2e740d000000b002d6cd051899mr226762ljc.17.1712026637244;
        Mon, 01 Apr 2024 19:57:17 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 14-20020a2eb94e000000b002d48dcd10a9sm1562356ljs.86.2024.04.01.19.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 19:57:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/4] arm64: dts: fix several display-related schema
 warnings
Date: Tue, 02 Apr 2024 05:57:14 +0300
Message-Id: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAp0C2YC/3WMzQrCMBAGX0X27Ep+q/Hke4iHtEnaBW0kkaCUv
 rtpL6Ige5r9mJkg+0Q+w3EzQfKFMsWxgtxuoBvs2HskVxkEE4pJ0WBwGOiJuRv8zWJreDDKGs2
 lhurck6/r2jtfKg+UHzG91nzhy/dfqXBkqNReu2Y5KU9XGm2Ku5h6WFJFfHTFxK8uqi5NGwxjm
 rvDtz7P8xsq44Op6gAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1265;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mx7vGKdoct+1XCR+gKQrL0/i2J+RoirrlHsWudiB9P4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC3QLqQPJDTO3b9cbxOZVHZF2gHNoh+neyJLyo
 2tSe/nn3TGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgt0CwAKCRCLPIo+Aiko
 1dsAB/4o6NTZpu+9kDk11QO7Miwhq1iDIWhXF9K+tE3FxXcaA/68RV8j/0aNacrI+RDdHkt0ioS
 ryVluVfGN0ZIFz9se5tQkp5wEET2kIE0W8LBnfIlbF+5XRirltVzTF52YDzjRSszJoijgSuAfeU
 PBu18se91/uFrBtclkP2pYYYWNudBL3rUfAACrgWWSmlo5+gLURe3zyjer1u5meh31UrAQcImHV
 qsAPUXcNXYRk1PdZSED+PsEnbEGAyZ/S4j44XuPxZmSvcr2+5ihlzg7Ag1ukZYb7J8JK2nCLDBG
 ZDKt71aQgicgZIpd0QK9qux3f4+MTrfZBXCwFG3qVWP1PCES
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Fix several warnings produced by the display nodes.

Please excuse me for the spam for sending v3 soon after v2.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Added tags which I forgot in v2
- Added the Fixes tag to the dp_p1 fix
- Link to v2: https://lore.kernel.org/r/20240402-fd-fix-schema-v2-0-39bf90051d83@linaro.org

Changes in v2:
- Added Fixes tag to the DP change (Abhinav)
- Switched the schema patch to use contains (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20240326-fd-fix-schema-v1-0-4475d6d6d633@linaro.org

---
Dmitry Baryshkov (4):
      dt-bindings: display/msm: sm8150-mdss: add DP node
      arm64: dts: qcom: sc8180x: drop legacy property #stream-id-cells
      arm64: dts: qcom: sc8180x: Drop flags for mdss irqs
      arm64: dts: qcom: sc8180x: add dp_p1 register blocks to DP nodes

 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml   |  9 +++++++++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                       | 13 +++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)
---
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
change-id: 20240326-fd-fix-schema-b91f94a95135

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


