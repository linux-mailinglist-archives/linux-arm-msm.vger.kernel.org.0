Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 182376D28F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 21:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbjCaT7f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 15:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbjCaT7e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 15:59:34 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 854B9135
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 12:59:32 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id h17so23565435wrt.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 12:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680292771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aKMqWuHq1atNt6umWF5yeL6AWpUb/E2kDARevmv/t7E=;
        b=R1yGbDzZkXSfNAmHOrec1xK+vmJwYF1I9Tmf/86J//hF4fFCeObYLB/wng4+xQouEu
         IRHckzWQYRtWBSOU99bxb3/VfvIaF0Tp0i8TCxAZtDqKgW27pDehQGLXzHUeUT+3Xo9j
         1JNeCmWulw+B2RmWzURTrsKrqvE84OJxJ+WiVJAhfBw6IYh2cNeDEpF+B91M/JIJXvT1
         Bnc2FU0rLYrCRcM1iwhSjaAdIXBXGayRbyBnQd0Vz0w4I80SRNkIbgDRHzcd5Rj2XLSh
         MwC2Q0SkR9bstLKfuXsue7hxTLABhSZA2MuwSZVlL6L93HdYBkIwJ9QkMOKQW9UMB/yv
         lY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680292771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aKMqWuHq1atNt6umWF5yeL6AWpUb/E2kDARevmv/t7E=;
        b=ol2zd1Q214YILOJ9WAsiLrn19eHD+ekk5eUy0dRS/SzwR4kvOw+pLyL3bKEUbgKcGt
         NHSvTxxQYaFccoccA5YIvkutKBmyDA/KKMR4bUJoAe8l3Q+MetDiBWchUbwaEle946Vf
         yczSkhyV2hGsFs6wmMejgj3p7htqMxSdCKanWL5jP9pwzD/JAGBreHhLa9z81+1QOmv4
         JkpRkSfEa6xkghIagmt0CvNgip/o8Y13yV2I0fGVSj+WuLaqrLb023JdniRc3NwXDy65
         7FGP1xagy3+bwu5u6/lwMMIM0oac9mk15TN/9cIxl/yVBP/Q+qS/XoVUNJXyh5cbjaFS
         KGgg==
X-Gm-Message-State: AAQBX9dvz1tF1jybKODpia9a6qcdPjS66we+bm63TeAgLe+Epoe0UCxP
        PnJVw6bIRx/q+e5kgG9m6mMk/Q==
X-Google-Smtp-Source: AKy350a1XhX1OiVE2JDxPVA6mRqh+3WGPa6RQJBfgkXi+23ET2/y3h1dJrDNAhcrcMzEY25bJ5KkdA==
X-Received: by 2002:a5d:4e47:0:b0:2e4:cbfe:da52 with SMTP id r7-20020a5d4e47000000b002e4cbfeda52mr5117629wrt.3.1680292771045;
        Fri, 31 Mar 2023 12:59:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1dc:d1f:e44f:2a1d])
        by smtp.gmail.com with ESMTPSA id c13-20020a5d4ccd000000b002cff0e213ddsm2990286wrt.14.2023.03.31.12.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 12:59:30 -0700 (PDT)
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
Subject: [PATCH 0/5] arm64: qcom: sa8775p: add support for UFS
Date:   Fri, 31 Mar 2023 21:59:15 +0200
Message-Id: <20230331195920.582620-1-brgl@bgdev.pl>
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

Bartosz Golaszewski (5):
  dt-bindings: ufs: qcom: add compatible for sa8775p
  dt-bindings: phy: qmp-ufs: describe the UFS PHY for sa8775p
  phy: qualcomm: phy-qcom-qmp-ufs: add definitions for sa8775p
  arm64: dts: qcom: sa8775p: add UFS nodes
  arm64: dts: qcom: sa8775p-ride: enable UFS

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        | 34 ++++++++++--
 .../devicetree/bindings/ufs/qcom,ufs.yaml     |  2 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts     | 19 +++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 54 +++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 38 +++++++++++++
 5 files changed, 143 insertions(+), 4 deletions(-)

-- 
2.37.2

