Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 030AF45EA8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 10:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376434AbhKZJoL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Nov 2021 04:44:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376377AbhKZJmK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Nov 2021 04:42:10 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321BAC06139B
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Nov 2021 01:35:55 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so9501320pjc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Nov 2021 01:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=YPCZQk3ldefrvQEF5kF6Pda8ed46AtY2WEwLZ32ZdQE=;
        b=WtOjZrJ8kWWA/IQ4NgDTdNnoPQvTwOGJEmFe7tzDF4AdX9q/wCXVktD6SA0o73hhhK
         Ages3FPYK+dSDrmrTCNCKS+r+kEUTvNJAMnLCgEYP+a5o1txJ1biFs2Bht1JkgeMlLFC
         c1F7hNnVJpYnfnRYsNgwKZaKiupTk6ASc0altLy6340h73qSJE9U3bNuUPHXow5nFRan
         k+mVFsaRRod9TJWK+P6SEMEiwaMe840mO6MHRPDc8aiNSMkeLaUBflqBYZ9t4E+76aN1
         jMYkyIXWYN4Fmr5Dh9pRfdvib69XCoPH1ShjXpqHFeBmdd/FFoGs8MyXewkcqd+eb/4w
         1PJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=YPCZQk3ldefrvQEF5kF6Pda8ed46AtY2WEwLZ32ZdQE=;
        b=nAhCG3ooWvEDmP9Ih3cvPuLQpfxLhIrIGs8VAOqHIE9HWptrXwPDSvf/ImHftOv0gF
         RwJ9I1Fh2JgqS9mJgRnc14ZrOiedLcHcKnvkWuE5FDrJfKzYiWVzGqGMaEW/9+fdJp7T
         hfnfMuSzF9ZKcsl9H8BalgaEw4hlYVl+nl3+6la3SWN1btVy739eyYzZMhCYhryzSbSQ
         nSO7T/nNym1XpBtLCj+3E40bRHlgoUc0/N0tgo5ChBPbkhhSFzkc+uRnv4Cin5fKdH6U
         lf1uEEp1DELRNRKUjHcwcW7ov6v4N8pQkTHDF3Ntf4bLqfEKGI4ue2sf6KgBhojs+ISf
         WEPw==
X-Gm-Message-State: AOAM530UhMOCH8zNPqKzmSX+b2wvKChvjNCXH/Skj9ZfyZlzOh4gBv/C
        bDTdS6PArwGH8GTg9yhUd2feuw==
X-Google-Smtp-Source: ABdhPJwaIFkm5Ct+j9PxVOQBfts3QKBod1ClI7mOqt7mHRmi+bme6jGCvPJj762Z361zKL1GGNJsRw==
X-Received: by 2002:a17:902:da8d:b0:142:4fa:9147 with SMTP id j13-20020a170902da8d00b0014204fa9147mr35915452plx.72.1637919354703;
        Fri, 26 Nov 2021 01:35:54 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id q11sm6079647pfk.192.2021.11.26.01.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 01:35:54 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 0/2] Add Qualcomm MPM irqchip driver support
Date:   Fri, 26 Nov 2021 17:35:27 +0800
Message-Id: <20211126093529.31661-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It adds DT binding and driver support for Qualcomm MPM (MSM Power Manager)
interrupt controller.

Changes for v2:

- Update both driver and binding for better alignment with qcom-pdc
  implementation.  Devices with wake-up capability via MPM_GIC pin
  will specify MPM pin rather than GIC interrupt number in DT.


Shawn Guo (2):
  dt-bindings: interrupt-controller: Add Qualcomm MPM support
  irqchip: Add Qualcomm MPM controller driver

 .../interrupt-controller/qcom,mpm.yaml        |  72 +++
 drivers/irqchip/Kconfig                       |   8 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/qcom-mpm.c                    | 487 ++++++++++++++++++
 4 files changed, 568 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
 create mode 100644 drivers/irqchip/qcom-mpm.c

-- 
2.17.1

