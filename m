Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2769D20313F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 10:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbgFVIAG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 04:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgFVH7r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 03:59:47 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D71CC061796
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 00:59:46 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id e5so12315980ote.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 00:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W0AVC+X9ErzkYiUB5L4DLbPxCRa8htBKCdd8OA+6EeU=;
        b=FvvYYEOPp4pm6JVzYIdlhQZgKQC4Eu0pmimukdREZ26w/K4RWzzQxG6c9zeJgTqiSa
         qN9MIBtsPbkb1j8GYgXREyt9oAag/aycbJACqYdW2300He/IjRZskDg01Jrb4KGzgHnc
         v7PpiflO7XHUd5c3kq2IC7VL26GWdN931FFhC8ecLCDSDzgUp3mTEMYSC4aHI7isoLQx
         3QWbS0JX7Ux/UxNywd/1HiblCWy1NGOUA9KnD7kqRBdX27StGF/cltlpLWluWdSwjV+u
         u4cHpa90l8EjkyRqYGA4wBdan6v21SoAsVRylPM83g0vJjRP9vgYLEw3Cg6/oDOzKgwL
         x+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W0AVC+X9ErzkYiUB5L4DLbPxCRa8htBKCdd8OA+6EeU=;
        b=XoHfdWxxIvUkdYGBhJhTvB5/c/ooN4azyPODVl8wrUnfVO95k2MYekNZIS9DDOJyZp
         Cg2dz4VLz1+/R/K2IkcFqgHPM/PTtncY1xJixo+cZ3N2a5s+48rntPLLQzdkvcrPkZT/
         W9fpoj8nWApyU+ssgjzpmD2u0GoumtVujA7CGqpM8YVcWYgySZBQPJGQG1I66A6X4NmD
         c9ksHYcCfvgDcbijPwsn9x+chfPsiRpk4yzjaNnRw8ABXfUXrlCeIWX9Ybh3zzf6saca
         M0DH6d/WIVZys3ObbcTPcmaSZuDogGPcmX+meFTcYgMcLzROCaQqhiii6GtLmGLkU/34
         Fd9g==
X-Gm-Message-State: AOAM530dq1n4QVMhLec1LxVJ02DWQVqLv57zGaROHaR4UlLkqAmQT79R
        B/9mwvBFVrizQzmDiAUuLMB9aQ==
X-Google-Smtp-Source: ABdhPJz7O6kvIiN2932DRiySX4pyGzskG5olUNFzZYaoBSXN+4cLgQQHk6GWwwfvkD/ldN3thmQAKQ==
X-Received: by 2002:a9d:21c5:: with SMTP id s63mr13578242otb.63.1592812785534;
        Mon, 22 Jun 2020 00:59:45 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f7sm3135396otl.60.2020.06.22.00.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:59:44 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] hwspinlock: qcom: Allow dropping the intermediate TCSR mutex syscon
Date:   Mon, 22 Jun 2020 00:59:52 -0700
Message-Id: <20200622075956.171058-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In modern Qualcomm platforms the mutex region of the TCSR is forked off into
its own block, all with a offset of 0 and stride of 4096, and in some of these
platforms no other registers in this region is accessed from Linux. Update the
binding and the implementation to allow the TCSR mutex to be represented
without an intermediate syscon node.

Bjorn Andersson (4):
  dt-bindings: hwlock: qcom: Migrate binding to YAML
  dt-bindings: hwlock: qcom: Allow device on mmio bus
  hwspinlock: qcom: Allow mmio usage in addition to syscon
  arm64: dts: qcom: sm8250: Drop tcsr_mutex syscon

 .../bindings/hwlock/qcom-hwspinlock.txt       | 39 -----------
 .../bindings/hwlock/qcom-hwspinlock.yaml      | 65 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 17 ++---
 drivers/hwspinlock/qcom_hwspinlock.c          | 70 ++++++++++++++-----
 4 files changed, 125 insertions(+), 66 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
 create mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml

-- 
2.26.2

