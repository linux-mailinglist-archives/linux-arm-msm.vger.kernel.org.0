Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD9E2C4CF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 02:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732193AbgKZBzJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 20:55:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731736AbgKZBzC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 20:55:02 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 110ECC061A52
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 17:55:01 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id s10so319845ioe.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 17:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i17QMd8vkhN67qG5gREON3zvFxFBu1aRL3V4o/4TxAg=;
        b=IEjKalurW30XYFDjdsl28nQBRfKLYLJ+qdAf5CYAzGgPDk2W0RmL5XRxRW+c0ZRExk
         H5aMqxcKU6rj9sUURloAfDfs0ollquNBzMxTA+NqMJbHu0bLLQ0WwGaf07OUpoK6eIjb
         yAiz0oDSy9HA+jqkhzELVzRr7IRXjwLi+femMmqtOILDxdbPsD4BVkhLtm9qA+x79RZY
         NsatKxNsN67k3u8KfVlyUCv7YtlLXUXlHqhp8MiY3x05bglTpEPR2JbBw60xpIOXR+ll
         xlFtzRRwPMfaXoM/K79WDGp1CqCBaJUF1neXWAr5azjLyAIgFX7T2oRbFHSnzloSe1Sg
         i7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i17QMd8vkhN67qG5gREON3zvFxFBu1aRL3V4o/4TxAg=;
        b=bLG7nziM4gDcOAgcvrPCqotNdDDbudt5CyDf0Vx0c7lPcai3gnLzP7I0LO+AympiD5
         faHgADOyiUxMKdP0htCbxKzN0OMiL06IFdXRHWf3AR204xGM0UNWD8oqr43AzQ4jlYH8
         xQ7n17/80Vw5K2uN4C/xtgQXhuzhqSasNpW/n775PjAzafD5lDCnpLnBMUVpNBsItam4
         F8WfInULbUrr+QDjTrdFlqeYh7iEi2n3tfMkTioxq9rfrJsfgp6M19huJFpmZWAUnL5C
         u9Q0AmwpYmG50JUun3qAkdHQ/hNDgqy05zDA5TH8cxo5mwlR4jl1sFxQRWY+uIkUffZ8
         nJPg==
X-Gm-Message-State: AOAM530S/1PCaFXlItieFcaJKcafhKY0tU8ZEfH2QPwofbU2iCNPHX5Q
        hLD99obtvwjkqBy5/nhwulk/oio0kKUxKw==
X-Google-Smtp-Source: ABdhPJy71WnIi4Z58HUMX4jikkOEFY/62xggxdr1QUv8zavqnRz5yH8xDGn4uhPdVIr7ue5rcjqxRw==
X-Received: by 2002:a05:6602:22c2:: with SMTP id e2mr739207ioe.156.1606355700182;
        Wed, 25 Nov 2020 17:55:00 -0800 (PST)
Received: from beast.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id r17sm1714907ioj.5.2020.11.25.17.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 17:54:59 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: fixes
Date:   Wed, 25 Nov 2020 19:54:54 -0600
Message-Id: <20201126015457.6557-1-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The first patch in this series changes the IOMMU specification for
the IPA node in "sc7180.dtsi" to identify two streams distinctly,
rather than specifying them with a mask.  This was inspired by
something Bjorn did recently for IPA in "sdm845.dtsi".

The second and third just replace 0 with GIC_SPI in two IPA
interrupt specifications.

(I'm sorry if I should have separated these.)

					-Alex

Alex Elder (3):
  arm64: dts: qcom: sc7180: limit IPA iommu streams
  arm64: dts: qcom: sc7180: use GIC_SPI for IPA interrupts
  arm64: dts: qcom: sdm845: use GIC_SPI for IPA interrupts

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 7 ++++---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.20.1

