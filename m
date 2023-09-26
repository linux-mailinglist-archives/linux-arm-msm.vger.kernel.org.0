Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0087AF293
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Sep 2023 20:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235418AbjIZSYs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Sep 2023 14:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjIZSYs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Sep 2023 14:24:48 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48198E5
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Sep 2023 11:24:41 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-523100882f2so10883274a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Sep 2023 11:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695752680; x=1696357480; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wRbJzVyzAsF5dK6nn+zhhFn0HQb3v3TAPzMsem2dH88=;
        b=TJ3MJla1G9fry5m9KtsqemxPyC14x5o6FK4nXzjRPosJ9AKgzBargcHfd1bO89BNm8
         zbUDn+90SKKQT7cZNbx952cOwlncYXTg+b9A9F22Z/5qL/X+A2CsDbCWH3sAlNn4oENL
         IhTo6SsxIRbsLucUIFmcWSEdboNeNDv+c9v6DwXVpKyYX7i4mj8+HL6mxTurmc3xH2FM
         2ejS8oNKS34Pl+NcBUWsKW7Tykhnaadko4+t/hnAu0qqnMh0prYhhxenmWkNT1oyJ32m
         7EcNs70Sfp2szFoAcvExutgJiIcbcaQ+JO82eTaD1Zq6+9FJln28bBC46Edidc53ZoBV
         oi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695752680; x=1696357480;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRbJzVyzAsF5dK6nn+zhhFn0HQb3v3TAPzMsem2dH88=;
        b=r3+Hb+X62vO77o4WvscrmmInxCFXz/9E26kpKVjR8dbA9QIkL9EYWqviRV1fWRu4X9
         KpLsa/cIAeQMN1fcrBr4SevCu2Bw476cXlqtCsHx6WNCEn5NzdkdRgGhEsNIC17VVHvR
         OKhyyZGNP6uM0f459WRFDTp6uYQyJYzwjS5V1xLvXNW3YC9IVvINE2lRmSiN9JU+MXHI
         eQ6RTnEhrecKkMwD2plJobuw7WdxqkwkbHiDMxH6yAD5nsIDHRgGeI8InCJ54gWon0zM
         n4DdSQaiimTp/nnmsG3Dm1oHOJ91RpOm2hyUM+EAS2iKf55vnWte7NShEWhsq6FGUlY2
         Y/yA==
X-Gm-Message-State: AOJu0YzbzL7dARg1k+K5ypCypkQGqFu/blfQTD93VBg5700PRNJz16dZ
        zFR06/tYmAFmSIGOHEq6EtnBww==
X-Google-Smtp-Source: AGHT+IEvQPOXzH6evT1wU3sw4ZwK7LW3sBAWFWdrUZzq0HmG2Mrdkcf0x6ZDGIfcs2fl1PuQKAMnKg==
X-Received: by 2002:a05:6402:176d:b0:534:7ae0:9789 with SMTP id da13-20020a056402176d00b005347ae09789mr875694edb.24.1695752679713;
        Tue, 26 Sep 2023 11:24:39 -0700 (PDT)
Received: from [10.167.154.1] (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
        by smtp.gmail.com with ESMTPSA id f19-20020a056402151300b0053090e2afafsm7020643edw.22.2023.09.26.11.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 11:24:39 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/7] Adreno 643 + fixes
Date:   Tue, 26 Sep 2023 20:24:35 +0200
Message-Id: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOMhE2UC/x2NywqDMBAAf0X23IWYFF+/UnpY060uSBISLULw3
 116nIFhKhTOwgWmpkLmnxSJQaF9NOBXCgujfJTBGuvMaDvcYxKP1D0dUs9+JDOQoxY0mKkwzpm
 CXzUJx7apTJm/cv4Pr/d13Zmw8BhxAAAA
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695752677; l=1165;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=EU9teWjPD7h5e92Oew+5MuXdWQG5NKBrkuAcC3oTWG8=;
 b=pEgeFuwL0ONn3mJdwEhg/cTN76w/vQK27DzSYLvcj31+lB+ESvoYMsuidc9PHh2HmEbvyk91I
 khKsQeAIVdrBCc48WPE1MOUH8l5idaZROwlYG37dWiV9yT2/HvWgkio
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

as it says on the can

drm/msm patches for Rob
arm64 patches for linux-arm-msm

for use with https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25408

tested on QCM6490 (SC7280-IOT) Fairphone FP5

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (7):
      drm/msm/a6xx: Fix unknown speedbin case
      drm/msm/adreno: Add ZAP firmware name to A635
      drm/msm/adreno: Add A635 speedbin 0xac (A643)
      arm64: dts: qcom: sc7280: Add ZAP shader support
      arm64: dts: qcom: sc7280: Fix up GPU SIDs
      arm64: dts: qcom: sc7280: Mark Adreno SMMU as DMA coherent
      arm64: dts: qcom: sc7280: Add 0xac Adreno speed bin

 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |  2 ++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 26 ++++++++++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  2 ++
 4 files changed, 24 insertions(+), 8 deletions(-)
---
base-commit: 4ae73bba62a367f2314f6ce69e3085a941983d8b
change-id: 20230926-topic-a643-a7ec9a08a3a1

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

