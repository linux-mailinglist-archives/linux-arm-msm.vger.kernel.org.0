Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 819513E110D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 11:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239836AbhHEJRw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 05:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239818AbhHEJRs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 05:17:48 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82CA2C0613C1;
        Thu,  5 Aug 2021 02:17:33 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id k38-20020a05600c1ca6b029025af5e0f38bso5739425wms.5;
        Thu, 05 Aug 2021 02:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kCcVZEkYGRKFKKDWnwfipeEmkrP7zTh5P/d+2TB0cUM=;
        b=CecqXqs6u0MwWRSNJzmPq7ZV9p5HS1nJTgxLI1+KshvG77X4R7GDcvsBNos2j+7GPI
         OhxZg8ddcYi/Ospo5gRFQefQAjBmlTY75Bh3VQ4c47DVKruUvGaLLXk7+tGv4sVq3neH
         RQhvSRahFuwTeqiQuH9gexX/J7QYVKaE8FHdOYBLQHshHFfxOF2OqkWcBoeruiDPQ6Dw
         xPOua4v2s0dNKzrTX940Ocr3o6FsmBi7e/w5tTSwrpiRw/UHeO6+aO5ZYB3IOPbBrbNy
         5jpgXPcMephl4nYOj5jg8xJ7kIfVxVSiHfIRN6URaO2YQUNtTbreY4u/lXVFltT/8mCC
         2zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kCcVZEkYGRKFKKDWnwfipeEmkrP7zTh5P/d+2TB0cUM=;
        b=IojitkZTByWQ8ZXa/qntgkqa/QZMiI/5pi3CXtmC4+NYKiMK8wcWUHWqcjxv+O1BBB
         9J1R9FGl9l986/86vpOk7g12B8mR9mkwvOTgcpUGoQWuegng3X+6ok8whIB97qaECKdx
         wrBa4ptL/nqjXngzDqUBJQBze0gqjOTRqitvL/m5+TpmlB4/wPkLJnVbDchhIWesYtWL
         3v2kfoL8sW3Y9GboYuPXAZdvH9eqhLJ0YFHvTR+CU/qfl3zZ/qzi/y6sIRdmg5FEaGSn
         nKTdjpqpoxmVyRh7WahMMUUNdaJEBUTnAI99lOBEadyzesraARM5ZpQImBLyTdyV1sfi
         uCIw==
X-Gm-Message-State: AOAM530rdZ5p7XoSuq+lE+BxWCDiRr1/liPFvMQKLrKjq5JpRiOTXSWP
        /7JhQdfKD0b2GlqOGRyx+TE=
X-Google-Smtp-Source: ABdhPJw15xqh1brrWI8Pf+be3kDcHP2cDuDoXwAt8GH1TssNeJErGCOUrxxWHyXbeJuwraVEQA2/5Q==
X-Received: by 2002:a7b:c779:: with SMTP id x25mr13865095wmk.88.1628155052199;
        Thu, 05 Aug 2021 02:17:32 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id l5sm6238776wrc.90.2021.08.05.02.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 02:17:31 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v1 0/2] Add UFS PHY support for SM6115/4250
Date:   Thu,  5 Aug 2021 12:17:25 +0300
Message-Id: <20210805091727.942471-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The UFS PHY found on SM6115/4250 is named v3-660, found on cheaper qcom devices
(possibly starting with sdm660), but up until recently wasn't used much due to
prevalence of sdhc port for internal storage/sdcard.

The name is a bit misleading, because most of the registers found on v3-660
don't share much in common with v3.

The register values/sequences are taken from OnePlus repo [1].

[1] https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250

Iskren Chernev (2):
  dt-bindings: phy: qcom,qmp: Add SM6115 UFS PHY bindings
  phy: qcom-qmp: Add support for SM6115 UFS phy

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 124 ++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 153 ++++++++++++++++++
 3 files changed, 278 insertions(+)


base-commit: 8d4b477da1a807199ca60e0829357ce7aa6758d5
-- 
2.32.0

