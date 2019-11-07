Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6286F2325
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 01:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727741AbfKGAQr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 19:16:47 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42720 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbfKGAQr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 19:16:47 -0500
Received: by mail-pf1-f194.google.com with SMTP id s5so588380pfh.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 16:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FCMNty7oDA9/2upx9KzHHcUHDuDdSYC8CouQyEOuw2U=;
        b=hkuy5kk5U+g2TgAyVP3fApfR+AdGzexBr1356eA7KJHXouxnPe4rsgQjnetphDxIl1
         9NxWhJQbC2Q3NmMGlagFa9gIw7Eixs7J/DUxKGD73TAqwS4UCjX7aZ6soEDsDwMoVaPQ
         39VgNt1HA3cTN+hUl93WJkLrXH9kzUY6xICTPf4KvoWiPbcdD1AWqdu5MTG0xKUrrp6A
         3lxPO2/HxI59dqj7QVc11F77EzJCqSTadJZrBShClx8YsTpqRJmAD2ryRkLt6DXyEW+u
         E6QFYW3HZnYXOnVWZzCC7caKEDTC1tsKpConJExQVMdosLFJOS+r2Y2XVTUwj7a18Xq1
         pSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FCMNty7oDA9/2upx9KzHHcUHDuDdSYC8CouQyEOuw2U=;
        b=iKUgx3OlhsUOSOOsDeG/zvxZN+DASvFeTi/a64nGkdcTWQ5rgbQo9q5fhVbI1kI9Q/
         JGZjbA1eJxjUqa1FqED30LCF2j+KxBplb9kycU2wogXIEezQwLRduJrDU/WlJPdAxkV1
         5cQJ7IuECbcz8vMqPpIixqtDiBP6mP7zDUjpjhdbIOmWaRMxC3Rbm6hvjlr+ktms2Bb/
         D7EJGUv+MZpXNL7xHDgwajLKEhI1gxqw09ZS4uIetB+pnfM9skZ2VH8k1QrO2KmCPMrd
         CNe6+1KdsRV1sKNTL/IeDjXxrvIlpDcMc9U+js6NGJ/Xnx7+Agwo9OxNrnr5qPi8tO7l
         vRCQ==
X-Gm-Message-State: APjAAAVkhxEa7UBky9RIdfF6eK0/hf8AHkWdzSWRdCWF0MUBzGYKOtfI
        LMc/W3rU7UU8RvF2trH1TysLjQ==
X-Google-Smtp-Source: APXvYqzTII1yOFz1jRvfEcyQCRGCRqp3dNhGhZANAQuWZ+wD+Yok0q99yIqWyXwsOAlX4QJn0jBPKw==
X-Received: by 2002:a17:90a:24ac:: with SMTP id i41mr926884pje.11.1573085806538;
        Wed, 06 Nov 2019 16:16:46 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 90sm81044pjz.29.2019.11.06.16.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:16:45 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andrew Murray <andrew.murray@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] PCI: qcom: Add support for SDM845 PCIe
Date:   Wed,  6 Nov 2019 16:16:40 -0800
Message-Id: <20191107001642.1127561-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds support necessary for the two PCIe controllers found in Qualcomm
SDM845.

Bjorn Andersson (2):
  dt-bindings: PCI: qcom: Add support for SDM845 PCIe
  PCI: qcom: Add support for SDM845 PCIe controller

 .../devicetree/bindings/pci/qcom,pcie.txt     |  19 +++
 drivers/pci/controller/dwc/pcie-qcom.c        | 150 ++++++++++++++++++
 2 files changed, 169 insertions(+)

-- 
2.23.0

