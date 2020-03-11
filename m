Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75E9B1821A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 20:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731071AbgCKTOB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 15:14:01 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45028 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730705AbgCKTOB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 15:14:01 -0400
Received: by mail-wr1-f68.google.com with SMTP id l18so4087165wru.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 12:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ER8r6kuUaQFI4Ynly9v8z6IPFmvVEI9Rxdr3ANi7+iU=;
        b=iicUtDXArOSxEFvBdjsxJcyXboEG8KFyobEdgv9o4gZQVZio9qKETqfoMqs4VtiV2x
         SoEFBPXyciEwmI8pH4NzWRgYl387KY0wql+SWr6rEdu+MYmg7hz1mzncJ1d/SK5iT6Rl
         wlqOyaXrZoCJl46i308wSnFJ5OolXi9qpMjcT7ul1l6Dbmfao97kEQ4ZMss9qz+i9Pyd
         lryNEf9QpnxxA1lWDTuazNY8zXpjgXJpyO0+PT3IXWjB1/vok8O2JuVv9Rnsv1GiWSQK
         0Kbb4QHEX7YhGLQONvDeKxu0/0bAhc73l9LSdPZVopdk6o6Gu69+UMssHjEnWj7uk39L
         16cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ER8r6kuUaQFI4Ynly9v8z6IPFmvVEI9Rxdr3ANi7+iU=;
        b=JbPDSyWzGvPb8LgNx76GkCl2P199ZTsQlzEYDkxU1Vsvucn0XQjxuU1HGZtXtvV6sL
         RlgjhS5Tm+LkutfV8SzRIMwL/hVcbTtJsYRfs+j5bPwT+MejUglZDEFXc5J8trqlZPMQ
         7lGxn2j+Y6cxH8Kn2Lw9mAhJcjS9gQKPNFULvt8tzVnKwi0msh9sBFPPgq+rVrJsLb/U
         3WgLfmRbK5SIHDvDyNHXA009RYNLNmd2tIsTqjnk/MCPnQGHsWBCjWSmUKyA7ciSArvf
         UkzARCIMroRbRmHtv8lMPyhfXAWUkKG+/INjhYyildPiL1y880yFVBRWVw2spYfkxuWS
         tNxw==
X-Gm-Message-State: ANhLgQ1F8mQIzQsiAqM9/6l56a1htTGKQjYpV5Qrs6yBRCTxkFQ4i4UU
        H7CkE1RjCY8PuOE4QUQDZCOleg==
X-Google-Smtp-Source: ADFU+vtF+2GsRN9+8m8r6qqPD7Zzz4pXC2NvU1p4465LKdjjKrUCepF7L1yPBVk9/7CnhbYlxbtOAw==
X-Received: by 2002:adf:8501:: with SMTP id 1mr6362304wrh.56.1583954039471;
        Wed, 11 Mar 2020 12:13:59 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id v8sm69443919wrw.2.2020.03.11.12.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:13:58 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     kishon@ti.com
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jackp@codeaurora.org,
        robh@kernel.org, bjorn.andersson@linaro.org,
        p.zabel@pengutronix.de,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/5] Enable Qualcomm QCS 404 HS/SS USB PHYs
Date:   Wed, 11 Mar 2020 19:13:53 +0000
Message-Id: <20200311191358.8102-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This set of patches does the following:

- Removes unused Qualcomm USB PHY bindings
- Adds new USB PHY bindings for QCS404
- Adds new USB PHY drivers for QCS404

These patches have been through seven review cycles already and have a
number of Review-by and Ack-by. For the pusposes of making it easier to
merge this set focuses on the PHY stuff in isolation.

The last set for can be found here:
https://lkml.org/lkml/2020/3/3/807

Jorge Ramirez-Ortiz (3):
  dt-bindings: phy: remove qcom-dwc3-usb-phy
  dt-bindings: Add Qualcomm USB SuperSpeed PHY bindings
  phy: qualcomm: usb: Add SuperSpeed PHY driver

Shawn Guo (1):
  phy: qualcomm: Add Synopsys 28nm Hi-Speed USB PHY driver

Sriharsha Allenki (1):
  dt-bindings: phy: Add Qualcomm Synopsys Hi-Speed USB PHY binding

 .../bindings/phy/qcom,usb-hs-28nm.yaml        |  90 ++++
 .../devicetree/bindings/phy/qcom,usb-ss.yaml  |  83 ++++
 .../bindings/phy/qcom-dwc3-usb-phy.txt        |  37 --
 drivers/phy/qualcomm/Kconfig                  |  20 +
 drivers/phy/qualcomm/Makefile                 |   2 +
 drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c   | 415 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-usb-ss.c        | 246 +++++++++++
 7 files changed, 856 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt
 create mode 100644 drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-usb-ss.c

-- 
2.25.1

