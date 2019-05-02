Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACDB311092
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2019 02:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbfEBAUA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 May 2019 20:20:00 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34757 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbfEBAT7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 May 2019 20:19:59 -0400
Received: by mail-pg1-f194.google.com with SMTP id c13so221984pgt.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2019 17:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=M72UrqeRuyBcXD8fVbPV6qhuJNerzMcfy2w0Aus0l5Q=;
        b=dc8l3OQySRYWLVNn/lNNOOqt83xbVy2XhNg7RGbydOcYn7Om65TwQj0KBdKZMDrL0N
         QqLJN/xHpF1BlRPF2e/fy4TVOYZBVG11d9Ab/42A5XK13rpLDsIC3zjvo1ffygZ/C5Yg
         XWyrSHlchanQGOSqzmw4lBXzj8FfHQEV456idxvVHcL8ijw6OxX9bSIr+zwj51m2UMXJ
         mG+Y8DbpZ2DrqV7pDIFDRXwChZ25J68IQGDf6qJCwMWd24vxvAxyWEvCwMlo8q3KXjAe
         aaB1Q2K/fug4A2EyfYbJ+BBpFhIcXTz8oeszUfHkaE6a7heBF57cRX+ILLqRe15Swt7A
         pd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=M72UrqeRuyBcXD8fVbPV6qhuJNerzMcfy2w0Aus0l5Q=;
        b=CSvKPIsyG0gYtKxUaktyC4TVMhxKLD6GhdzlQMG4I8xmtuchU19Uy05gS1GDjFR0Kb
         7FF5kG3Bo5VDXoYKawlzhA/mtF3191WFNZ04LA0+PUyWFqT2SekKVRGOLQMfAm4OBL4F
         yETY3fTy/w4oN7h380GkotYc1rFOkGrmbDd+p6ujX0UB9roNu2+J/NhTFKy8e0rpEfQm
         F6Y4/MYODWGCfB1NjXWQFC4N+yOYKPF9U8Gqx7x8uxrErXLH9ABlk6nN0oPA+xBuvSrC
         itl84bdr/ZTN+EQELKzPIUICtLEKTrRETB2NLTINQUf6aCkUu9cie8u2gOShUTStA4M/
         CCIw==
X-Gm-Message-State: APjAAAVNAQ86MtsAP9Hd3UaqTxNH/PhzoG5M0XRJgu6i81qVyw9bVejE
        oC3iRu9QYgNPbNuPwmvIXq7WTg==
X-Google-Smtp-Source: APXvYqwEsMTw7jtqbIuD2dAeIQqOvPTqQfWtFxK+h2Zk/KCJ6frEkbIqUzDedlB2IbgR1ONZECfytA==
X-Received: by 2002:a63:e042:: with SMTP id n2mr828742pgj.45.1556756399042;
        Wed, 01 May 2019 17:19:59 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s198sm36927534pfs.34.2019.05.01.17.19.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 17:19:58 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Qualcomm QCS404 PCIe support
Date:   Wed,  1 May 2019 17:19:52 -0700
Message-Id: <20190502001955.10575-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support for the PCIe controller in the Qualcomm QCS404
platform.

Bjorn Andersson (3):
  PCI: qcom: Use clk_bulk API for 2.4.0 controllers
  dt-bindings: PCI: qcom: Add QCS404 to the binding
  PCI: qcom: Add QCS404 PCIe controller support

 .../devicetree/bindings/pci/qcom,pcie.txt     |  25 +++-
 drivers/pci/controller/dwc/pcie-qcom.c        | 109 ++++++++----------
 2 files changed, 73 insertions(+), 61 deletions(-)

-- 
2.18.0

