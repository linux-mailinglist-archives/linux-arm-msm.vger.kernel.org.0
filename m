Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7713B4A60
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jun 2021 00:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbhFYWFr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 18:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhFYWFq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 18:05:46 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3CEC061766
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 15:03:25 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 22-20020a17090a0c16b0290164a5354ad0so8788166pjs.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 15:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l1RnRkRZpqgaaMNcuAwV2p52P2QAGdOgzYxbw1QRorI=;
        b=GZcaTHtQ5jxsRPK9zYSwUL0Uy6N2XwFBwgoXb4ILppc6/R+0Sh7hVs/xdf4ULlHQrb
         AD7U+jZSjUyi1TpGAoucCU6uFdj3tgVejRn7LpaJEcWlHknZeG8unRMOcGYsB0O/0eSb
         tml0eoRiuePCAmFpXy/cytYZSR6oQJmKdHudP4EpV3xNe4/ZvG8thpOTpgHQ0p2LdOJw
         WXl0CcSY2w1fAtwVP/mX4WhEhyww0C0qmv3itNc8Xz9vfqzQNvVmorNXQD1sQ5EPnOnK
         lu8Sn3ZL2l0eU149E2Ud7d0ZMwve9qxOiL4fUDgeR1zgGLqh1t8m8TtJKIutxT6h/5y9
         hXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l1RnRkRZpqgaaMNcuAwV2p52P2QAGdOgzYxbw1QRorI=;
        b=YJxCA5horYnznKIxkpj2uR9t9tF1eZJyNNp9oT3bwIBEGFLXQRIcYxC1F9qzmwRLM+
         txXK3vvRaYzYYcdsD7f7DLpDMPqYCPoEb7CI5Tnj41X8Kur7OMaKhrsb9ytwt0ewwGZa
         cbdv4CgF7bP4alTNWv/8dRkLRlly0vxp7e1vKwvvhbMisgoR6NYvR+P9eTOib7gk1ca2
         /y3UKisbd2DU8ngyln/o23RTFcqd14A3v5yG+FXC9mwBPE7PFgkLT6H/KL6dKCF0BRAu
         d0Z6sy5//Lsr0EC8z8+MDwXqgle99Vs3Q5nBjPyRLBi2ZMs3yndurmYeFi3Teyl28hvg
         0uQQ==
X-Gm-Message-State: AOAM533/l8uGXzJcr+AOfvU65YafPZXz3ypMKu8ykG+q7hriS4zE6XL2
        aB+rzJ6pPz91kBCtz4EB7ROmlBI3jzxCfw==
X-Google-Smtp-Source: ABdhPJy/yIkRxBX8RRlakoK1p3LDTXdw84kxPUgI7I+XCC/0U/NrsRbOEGZJLb9I9D6U0hPWp5xt9Q==
X-Received: by 2002:a17:90a:7e18:: with SMTP id i24mr12939843pjl.130.1624658604920;
        Fri, 25 Jun 2021 15:03:24 -0700 (PDT)
Received: from localhost.name ([122.177.20.255])
        by smtp.gmail.com with ESMTPSA id d9sm6374040pjx.13.2021.06.25.15.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 15:03:24 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        balbi@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: Fix usb entries for SA8155p-adp board
Date:   Sat, 26 Jun 2021 03:33:09 +0530
Message-Id: <20210625220311.527549-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series enables the support for two USB ports (named portB and
portC) found on the SA8155p-adp board which are connected to USB Type A
connectors.

It also contains a minor naming related fix for dwc3 usb nodes found
on sm8150 SoC.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>

Bhupesh Sharma (2):
  arm64: dts: qcom: Use consistent naming for dwc3 usb nodes for sm8150
  arm64: dts: qcom: Fix usb entries for SA8155p adp board

 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 60 ++++++++++++++++++++----
 arch/arm64/boot/dts/qcom/sm8150.dtsi     | 30 ++++++------
 2 files changed, 66 insertions(+), 24 deletions(-)

-- 
2.31.1

