Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 829B06DDB9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 15:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbjDKNFL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 09:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbjDKNFD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 09:05:03 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D0119A2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 06:04:50 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id q5so4477772wmo.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 06:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1681218289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qYe+MGPT9BvgNTQao8r5YoHx9jSImbM+Yzl5JdLRqIc=;
        b=hVZ3SwYl0OMmYsZaktA4PBdt9FadcHLKLFYV9Y3oM0OwQMDSvu0iLQvhsEk273pBFz
         xMjYDP0n7IEjOWvg0jISH4vr2oIC/LyzfkTZe4at0Vr/uAALu81PnqpyLw+wnzfZTkOu
         TmmYK/UpBhgsP/7GQxJnjCUe2pBPAKV/CQTAmMGl8sZ1EImT7qlINWkY4JXfZ/GrWP4R
         kNx5eTCgbw5jeQ3dd40Zt6Xm+q2a3SxD5X8uzYor6aZ6NYE+DFGibBhxxrQmDPt07nNo
         UO/oZCVEaKDxUGsMoWQdcNXYTyk7IivtZey9/F1/u1rsT/Wp5oauw87Dn7CTk390xBgT
         EPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681218289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYe+MGPT9BvgNTQao8r5YoHx9jSImbM+Yzl5JdLRqIc=;
        b=uX3937Q5gVlJOKKuPnsJGu4jCKgN1c86kfyWG/X9ciYxCI1pBKs5q07gE5Q5RptCOu
         5XSYqOsZfd3u8vSyWOHRukEwEPkHD7F/5HRrprvPrWVwbHLNAHJeMH5oc1OaNVEdsJPB
         ASFbqRiVtn0pKRREpfSQeQcTJNaf1huPHX99xXsu7TvG2vMb65m7cHnIGZ+XdrgSByTE
         runJqRiipjJLrYBhkKdQJHdLyiMRm/hvzXjbaPszHinr1PMz1XEWRSPwRwVlL1KBNNUy
         4VRA8W/1RoDLdvTJwQeHLsThJ2d5aoZoRm7iketdrB8cH5zwlJG9CVlOHvSTKvFy0/FD
         NxLQ==
X-Gm-Message-State: AAQBX9epSIh92Vj61oC+I1YklPSJBcG//Pe/S7unuF2lDFuwQ06FBOlx
        bPTSA/T208Fnu74johyAl+kGag==
X-Google-Smtp-Source: AKy350ZfLdAiU/iKV0HLRk3Wy+S1F1keCNjX+IH2eaUg8QZgScVfnsLzAoOiiBKsX+Op60vdlbkezw==
X-Received: by 2002:a05:600c:2294:b0:3ef:f26b:a173 with SMTP id 20-20020a05600c229400b003eff26ba173mr1910380wmf.14.1681218288917;
        Tue, 11 Apr 2023 06:04:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a099:fc1d:c99a:bfc3])
        by smtp.gmail.com with ESMTPSA id t6-20020a7bc3c6000000b003f04646838esm16921301wmj.39.2023.04.11.06.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 06:04:48 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 0/5] arm64: qcom: sa8775p: add support for UFS
Date:   Tue, 11 Apr 2023 15:04:41 +0200
Message-Id: <20230411130446.401440-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Update relevant DT bindings, add new config to the driver and add UFS
and PHY nodes to the .dtsi and enable them in the board .dts for
sa8775p-ride.

v2 -> v3:
- fix DT bindings: move allOf: below required:
- collect review tags

v1 -> v2:
- order new compatibles alphabetically
- rework the UFS PHY bindings to accomodate more clocks
- add a comment in the .dts regarding a non-standard clock used
  by the UFS PHY

Bartosz Golaszewski (5):
  dt-bindings: ufs: qcom: add compatible for sa8775p
  dt-bindings: phy: qmp-ufs: describe the UFS PHY for sa8775p
  phy: qualcomm: phy-qcom-qmp-ufs: add definitions for sa8775p
  arm64: dts: qcom: sa8775p: add UFS nodes
  arm64: dts: qcom: sa8775p-ride: enable UFS

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        | 26 ++++++++-
 .../devicetree/bindings/ufs/qcom,ufs.yaml     |  2 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts     | 19 ++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 58 +++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 38 ++++++++++++
 5 files changed, 142 insertions(+), 1 deletion(-)

-- 
2.37.2

