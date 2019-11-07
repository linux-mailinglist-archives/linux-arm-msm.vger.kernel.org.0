Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1B1EF230A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 01:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731910AbfKGAJX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 19:09:23 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38868 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728254AbfKGAJX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 19:09:23 -0500
Received: by mail-pg1-f194.google.com with SMTP id 15so360150pgh.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 16:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rCG7lU0priqMVKwFQzQJqK3jErBmez8plidupT5N1nI=;
        b=e/AK8pYYZcburR/t3rfFasVBBfADxe2TQIP+JGJ/z21euTg3hoVOAveAbMaPIALq6t
         Q0eJhSvq4LFqu2gARbckiqAAOCwBj60PXxkIq6gNlC4wCvorBNatYjqN9FZ3FH+svRGS
         EoU0qn1nEaXq9anAwy+PTiZ3GiW/IqOFcLOYb6ppw9lfhjuhHK3F2kSvz9snbGjPXu0G
         LeA4zFi4oLkFe4eMWl5co3meTBtDGC2jD8bsv5wY5z4BcNA1vYxEAKYVn8Y+S8EKGaMv
         9HYa2Em/W3BPGnzaG29vHNIXa/BfZrGuNxd69hcbOcu5TT5Qb8UwwNl6hwi41y7FR/HI
         IGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rCG7lU0priqMVKwFQzQJqK3jErBmez8plidupT5N1nI=;
        b=tEBgdVThNRbDE4qqrAD0Nj4aZXzTR3+Wv8OaBlfPM2WNVDMExlC5AiB4ZbT4ci61Cb
         KejquGoc65rCcBfAKUyW11Oe8qzZge0uxFZ/aJeQ8ltG0KQs89pVJzw8g9hUo28eHLlz
         aCNLKHPvX+V8kEVuizt/v28VZR3Nqh4OXw552a4eOYpCsk2pIJiWDO9HxRFS2/ozOgps
         LMbkr7Tzx0Z92yOfaJeAR/jwA5KEj3KVVkTlUkYm/+KX92r3vIUIfxaGsdx3z6dw3j+u
         c0a0eDIqhhkDoDIXWawWXg5aOPsG6ZdAatMHHORtjLFQqU/Df4u/N6JkFkuwPcAR4DiE
         FxMQ==
X-Gm-Message-State: APjAAAW4r2xJ8mkG4Btm2oGGHGTUMOcUCtt6NdrklTY/LF6mSBpE5SN+
        4cgrzX9KtXQkzdewyvUQ3VeucA==
X-Google-Smtp-Source: APXvYqyiblvWdNuox/MQmOXfqbfG0RLNV24+NjZyLLck8iOnBH22XtxN4kqtN/2S6fbSGLKxWHjR3w==
X-Received: by 2002:a63:f244:: with SMTP id d4mr703636pgk.233.1573085360870;
        Wed, 06 Nov 2019 16:09:20 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z23sm216549pgj.43.2019.11.06.16.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:09:20 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 0/5] phy: qcom-qmp: Add SDM845 QMP and QHP PHYs
Date:   Wed,  6 Nov 2019 16:09:12 -0800
Message-Id: <20191107000917.1092409-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the two PCIe PHYs found in Qualcomm SDM845.

Bjorn Andersson (5):
  dt-bindings: phy-qcom-qmp: Add SDM845 PCIe to binding
  phy: qcom-qmp: Increase PHY ready timeout
  phy: qcom: qmp: Use power_on/off ops for PCIe
  phy: qcom: qmp: Add SDM845 PCIe QMP PHY support
  phy: qcom: qmp: Add SDM845 QHP PCIe PHY

 .../devicetree/bindings/phy/qcom-qmp-phy.txt  |  10 +
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 321 +++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 114 +++++++
 3 files changed, 441 insertions(+), 4 deletions(-)

-- 
2.23.0

