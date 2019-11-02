Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1670ECC6C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2019 01:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbfKBAbx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Nov 2019 20:31:53 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42393 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727297AbfKBAbx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Nov 2019 20:31:53 -0400
Received: by mail-pf1-f193.google.com with SMTP id 21so8097776pfj.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2019 17:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RmKwPYUz22DWejWNDVX+p+n7NWEKBj1pY8e7LLu4FLs=;
        b=NKEQCCyXBdgTsGovN13Be6nAO4bGEHx/a7ewD11xgbfrfEdejeHj3o4flLocvdw49X
         5B7JbUckbmB9lrKYnDlhDzzEliMODTUXLmKaeYRp+zDBxNYZOLVd81WSrt1Rc3BVT7JM
         CcPUfhLlVwhjRytWNNpLKQWXQ0eGOSwwk+S4cTzycQvkobf81mn6l591ypI/5qgNxvCd
         ulpR5dD4A88Kh3jdtBjo0S9giVajmA95L6j7JF0QMK/R5FmH5UzfoPFxfUEXy7LL1ubw
         44YroGDFlduFRzbV2uzcvcFQZ001lOP3k9Z6qreygswNFG+/QCrg9FfLR6iw6m/JAAzo
         QELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RmKwPYUz22DWejWNDVX+p+n7NWEKBj1pY8e7LLu4FLs=;
        b=SX+uDB4mcGBfPgUHH0608QZ0IKMSCaeBLsX5DjC4Sw3jXE1PAFErUyLb6bp0filR9o
         zEUJXJkZ2i/NzMp3QfpvU3K4HDDwue94nJaU4R//ZOv+IYbrR3JGTIN5b5MFZzxawrtX
         yoJcAnK1Yh2+wgXIjNYW4S4PJIopXP7ya7A03Ai17e2SqYnXtKXh0eX7R6L4hVQHgxFO
         nSnsh80XYpTaY/Zq7P5wz5IQicFKXobfY/dVo0NsKzIMABumXPUqMhSdpYCVu15DLp5r
         Y88JnhmV7Z6sDO4NBprc8aymgWVJclBTZXhKyOw3rSsn4j9n9lQuLZqHhouAg5WZpyzN
         vpyA==
X-Gm-Message-State: APjAAAV3hmiPpQ8c1nkTp0cxKwGVTFvzcZEu0PhMfqE+Q9Fa2Qwjg1P7
        EyaeWz+ldAjJMeqkdiN6SnrAmA==
X-Google-Smtp-Source: APXvYqyA6507ov8iEXResqYrB3v7w2XAzOhHSiJo19Q5bEyZRWThuZq6+g+rzLB4CPtyR+YiNFevRA==
X-Received: by 2002:a63:5848:: with SMTP id i8mr16181286pgm.217.1572654711927;
        Fri, 01 Nov 2019 17:31:51 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v2sm7957522pfm.13.2019.11.01.17.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 17:31:51 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: qcom: sdm845: Add PCIe nodes
Date:   Fri,  1 Nov 2019 17:31:45 -0700
Message-Id: <20191102003148.4091335-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PCIe controller and PHY nodes for SDM845 and enable them for the
Dragonboard 845c.

The two series' that adding the PHY drivers and controller support can be found
here:
https://lore.kernel.org/linux-arm-msm/20191102001628.4090861-1-bjorn.andersson@linaro.org/T/#m6a892f4d6a8eefdd2c16b29b1cebb0023c69eac0
https://lore.kernel.org/linux-arm-msm/20191102002721.4091180-1-bjorn.andersson@linaro.org/T/#m42ca469f4b23d534000a4b45a55d9739edbebdc4

Bjorn Andersson (3):
  arm64: dts: qcom: sdm845: Add first PCIe controller and PHY
  arm64: dts: qcom: sdm845: Add second PCIe PHY and controller
  arm64: dts: qcom: db845c: Enable PCIe controllers

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts |  91 +++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 215 +++++++++++++++++++++
 2 files changed, 306 insertions(+)

-- 
2.23.0

