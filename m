Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2AFB418F48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 08:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbhI0GuZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 02:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233068AbhI0GuY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 02:50:24 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE25C061570
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 23:48:47 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id n2so11060929plk.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 23:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=JGgK1pP0+awojk4y6sIFF5gFJNXp8xBI/eToel7KJRI=;
        b=D03xhEMQoE8HCYK3EP8igCx+K+PxXLn2YcVBNqcaYPIJkVlwe6lPvral43lBANxnq7
         429TOCF5KNb1VmC/zwx7295eDjjPG1v2lKJnnTziuRVrvrI9DWBFRsyIE+rswctqbMbu
         A3H8urXOhWwKzPRmkMOID2ojKlQOXhlJo9/35mRM0b3VXwnIj/Gc6yQbLgB44DQAX89f
         uIPH0Hs8dZqDQqiM+UwHM4T8Gi9+IrZPgUOyJQKPcfEmYFslJpptCMF8xX5QNb6i/LfN
         HcPEOOTKFcmicZJ+I8Lw7s4hI5rO1UidUT2O/NkQQtEgr4JE8nbS2I3RC/zK/ZrSde9l
         PXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JGgK1pP0+awojk4y6sIFF5gFJNXp8xBI/eToel7KJRI=;
        b=Vh4UQQ4wif/GTqB1ownfQ+iWcVuT6m6ZPKt5AlZE5uMPnV/4RH1bihAUpRiJqfrAuI
         T6K6uktKA/q2YPBSl1Yz4R/sm3E+wqlVr09TedZ0UOr987/mlwwHmpW0+1WBtJH/V3yd
         roCPIwf9CHsxRbw1JRLP9HkVhQz4XOOP30jDhO8SPjU+Yq2qvLQotoOTwGMZVHhAs2Vi
         ZaKMjKhZ8XsHVTeOvaXql1W1FoMwHRrsc0xUWLDH73l8nOPU8p+jrs6YhaoHEtDdya1o
         IOov55Y+9CbHiFwKgBmBp/ItW111bhCEk1XvfGvPJNoKOH9rf4dUXZ8VOPKsBAGx5GtB
         CAHw==
X-Gm-Message-State: AOAM532n3ZsWOMdl6SogfFUBnBUggahtTBcxBr5OBENfnYttn0cn5bLN
        JROwHQ/7KFKO8/EJxf0NC/zg/w==
X-Google-Smtp-Source: ABdhPJx1HcMXkW5t/LysfiEuICq6FfiPRjiYjTxRvAWl/yGWqirR5BPbcfMGwyg6TftdVkNLfFAA4Q==
X-Received: by 2002:a17:90b:4d08:: with SMTP id mw8mr17640366pjb.97.1632725326394;
        Sun, 26 Sep 2021 23:48:46 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id o16sm17169910pgv.29.2021.09.26.23.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 23:48:45 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/2] Add QCM2290 USB3 PHY support
Date:   Mon, 27 Sep 2021 14:48:27 +0800
Message-Id: <20210927064829.5752-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The series adds support for USB3 PHY found on QCM2290 SoC.

Shawn Guo (2):
  dt-bindings: phy: qcom,qmp: Add QCM2290 USB3 PHY
  phy: qcom-qmp: Add QCM2290 USB3 PHY support

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml |  27 ++++
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 143 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   2 +
 3 files changed, 172 insertions(+)

-- 
2.17.1

