Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A407762BD88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 13:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233379AbiKPMVD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 07:21:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233881AbiKPMU1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 07:20:27 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E371CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:18:24 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id t4so11759930wmj.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CexamFfG/FS3ngrrhitZZy7mpo4nC1L6pbUeLp3AZOw=;
        b=IQjngCj4wfNPukaelqxkn801Xy0n+XGs7+sLDNi04oV/9sqU681Ttlp6daRmvopjZf
         I/ajH5ntEj3VXVASzTkRifAA7GY2f4l/ZOkVTm0bmCHh6Uuyv9zHJFK7mgV+l7bAIjEV
         3esZRwGrxWnXbhN4U6JY49Op29UbveXSMv7cTx/G/cixGNEM26bAsOYxOh7dNNnShvtG
         ajiAKSBLb5A9dTXhvgFsHfSB7MWTwFDP4pGmWQgn5bD/42/+sPq1vOMkyMo4KPFOVFYX
         obU8HFVGUDGe6SqAk/NEr2lxuiK9s3QobFcKSfipDz7YE+1YPO1jG9p5uoGFh+Ndiust
         F7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CexamFfG/FS3ngrrhitZZy7mpo4nC1L6pbUeLp3AZOw=;
        b=y9PITZ8ALyAZBt09/e5zEpR2SuyqbmeKvc/ErRBVa3/m9mYMCQLFowEfkwNUEb75WB
         XekaF5VFABsDA+O10fWV9QbWBpBp/3zHVGvfg5eXZPHTHgiWRIXtoXIgdofaE7XRWfs5
         lsZn5qXDA8hYmlEPDfXBTWsDf90IPETukTRcn491KA+eURQEwjg4+l4VJWEUIa7amFjo
         8etq9nWwdQyPnMFnbPdCpq1dfSxXZ+hPFQSiCX83CRgP1+wOHy6l08d7zABm7kl6fNai
         Xs+7zOh69GdiqmfY4WvmNkRMZ3ylF+UhtZjQZ6aw+ilnpj9InW112cQEy7ZH670Fmad3
         uNgw==
X-Gm-Message-State: ANoB5pkLrCFf3dvg5ljPk+tp0YlbAUxsmBacdv3fwsF2jzcBK909iFU2
        Tf0CfiyI+UaAKLeMith0387fjg==
X-Google-Smtp-Source: AA0mqf7mxdTG3n6ju8hRQCVZ7ABXa/QvWKlq7iL5OlfERBYM2FmYxv/F53D5YL8+EN9TQB69Wl+Tmg==
X-Received: by 2002:a05:600c:5014:b0:3cf:a18d:39a4 with SMTP id n20-20020a05600c501400b003cfa18d39a4mr1908881wmr.125.1668601102577;
        Wed, 16 Nov 2022 04:18:22 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id t14-20020a5d42ce000000b00241a8a5bc11sm1090359wrr.80.2022.11.16.04.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 04:18:22 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: [PATCH 0/2] ufs: host: ufs-qcom: Add support for SM8550
Date:   Wed, 16 Nov 2022 14:17:30 +0200
Message-Id: <20221116121732.2731448-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds UFS HC support for the new Qualcomm SM8550 SoC.

This patchset depends on:
https://lore.kernel.org/lkml/20221029141633.295650-1-manivannan.sadhasivam@linaro.org/

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Avri Altman <avri.altman@wdc.com>
To: Bart Van Assche <bvanassche@acm.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: "James E.J. Bottomley" <jejb@linux.ibm.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org


Abel Vesa (2):
  ufs: host: ufs-qcom: Clear qunipro_g4_sel for HW version major 5
  dt-bindings: ufs: qcom: Add SM8550 compatible string

 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
 drivers/ufs/host/ufs-qcom.c                         | 4 ++++
 drivers/ufs/host/ufs-qcom.h                         | 2 ++
 3 files changed, 8 insertions(+)

-- 
2.34.1

