Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7948D72CF7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 21:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238244AbjFLT3R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 15:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238132AbjFLT3F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 15:29:05 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B131730
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 12:28:53 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f738f579ceso35809825e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 12:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686598131; x=1689190131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nJZJSaEZDg70TXbshUH3X07m1qzGMFDczgD0hVDQgVw=;
        b=cp7o0HoGkxtGnWAvfPLUcigk1NXL22/mysLv2Xtu+BWI9J/YI7aKTBLHbf+4S4De4b
         IJ3Qtv7wM6Mp4sN/lKa+Fo/8ldPIx23PT7wxeeBbZdZ+LJx8ULV8nTuWoKAiq3aGtWtB
         cU5KBL+/AIJrdiRDrHJDK2+uHxSx/QePtYDhRp76VSJ/XozzWlcYGOkk5JahdeJRXLgD
         RAdHnAFdjI4UjLTBzCLQqrbZzWasP271gPYWjPH35aaZ84rXWbqFi8RtsYKlAos/VRLl
         yFN+YFWqZvuwtb/hvdK6GH/hNSHC6SrR/3Wn32b1FK10iZDlyfHUZljdNjgegR9bT+6S
         HdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686598131; x=1689190131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJZJSaEZDg70TXbshUH3X07m1qzGMFDczgD0hVDQgVw=;
        b=Wfhhhwwvmkao6A5mOasXYS3et58uZiUvRpOL35tIQSfbFVmXBncqUmJqve7xtuVrxl
         zrhtaG5qGe9Vi9bzr74FAR+8QEWDI5ezKvT2pax5jo67DfavmRiXMk424zE+UfV8DZcq
         w7RFFwvEXnUOapaylEP9jxufIaziKBekjct3Y6L8hTwRnc1Ar5QQ/VEJ3shCGRw9E3Im
         X6gc1VpBOZOLuVZVg3IZ1SEHAntc6JG/NMI9PGGU5mpPSj9TiQho9YYr19CnZ5Dws18Z
         qHkhe5iK8vi7EXmskaDXKbV96AtUGfdDeH+2FgF0EhUI1MTiAfRWYHvzrZUNvGbiX4Qh
         9gSA==
X-Gm-Message-State: AC+VfDwj99NJv7ZFkeApaygo/+LPyId/2T6fX7LrAusTb2OnXYTtrQYb
        10WZ4SQlHApuWKjeBtM6FN6Krw==
X-Google-Smtp-Source: ACHHUZ5OzKiW3U57XN0Htaa50N2NhdLd5CFniE1NlCW4kDpPPcqYy2HPZOQKXayyvEEZJhY+ya0Wwg==
X-Received: by 2002:a05:600c:2190:b0:3f7:395e:46a2 with SMTP id e16-20020a05600c219000b003f7395e46a2mr6389324wme.16.1686598131498;
        Mon, 12 Jun 2023 12:28:51 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id a7-20020a05600c224700b003f60a9ccd34sm12286861wmm.37.2023.06.12.12.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 12:28:50 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@kernel.org>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: [RESEND v7 0/3] Add dedicated Qcom ICE driver
Date:   Mon, 12 Jun 2023 22:28:44 +0300
Message-Id: <20230612192847.1599416-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As both SDCC and UFS drivers use the ICE with duplicated implementation,
while none of the currently supported platforms make use concomitantly
of the same ICE IP block instance, the new SM8550 allows both UFS and
SDCC to do so. In order to support such scenario, there is a need for
a unified implementation and a devicetree node to be shared between
both types of storage devices. So lets drop the duplicate implementation
of the ICE from both SDCC and UFS and make it a dedicated (soc) driver.

The v7 is here:
https://lore.kernel.org/all/20230408214041.533749-1-abel.vesa@linaro.org/

Changes since v7:
 * rebased on next-20230609

Changes since v6:
 * Dropped the patches 1, 3 and 6 as they are already in Bjorn's tree.
 * Dropped the minItems for both the qcom,ice and the reg in the
   qcom,ice compatile subschema, in the ufs schema file,
   like Krzysztof suggested

Changes since v5:
 * See each individual patch for changelogs.

Changes since v4:
 * dropped the SDHCI dt-bindings patch as it will be added along
   with the first use of qcom,ice property from an SDHCI DT node

Abel Vesa (3):
  dt-bindings: ufs: qcom: Add ICE phandle
  scsi: ufs: ufs-qcom: Switch to the new ICE API
  mmc: sdhci-msm: Switch to the new ICE API

 .../devicetree/bindings/ufs/qcom,ufs.yaml     |  24 ++
 drivers/mmc/host/Kconfig                      |   2 +-
 drivers/mmc/host/sdhci-msm.c                  | 223 ++++------------
 drivers/ufs/host/Kconfig                      |   2 +-
 drivers/ufs/host/Makefile                     |   4 +-
 drivers/ufs/host/ufs-qcom-ice.c               | 244 ------------------
 drivers/ufs/host/ufs-qcom.c                   |  99 ++++++-
 drivers/ufs/host/ufs-qcom.h                   |  32 +--
 8 files changed, 176 insertions(+), 454 deletions(-)
 delete mode 100644 drivers/ufs/host/ufs-qcom-ice.c

-- 
2.34.1

