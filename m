Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E26E341E0EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 20:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349990AbhI3SVJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 14:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348209AbhI3SVI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 14:21:08 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F19C06176A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 11:19:24 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so8465563otx.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 11:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Td5nNKXFe0z6BB+o9VMLaTYliYU7qDR+uAvJ2+VJffg=;
        b=Ag0Z6xiuaEsDk4p0ERmC/jV+ZY+zGz/93n/yNpcW1XUe7/e/sd7+ayNOv3p8TpBQp0
         5bnC8A7K6YS+mghgU8ZLK9tEwN4lDI8o5r++lKH3OoZlnDBqBI7qR4b//ccH6YWAezQ3
         7uqXA0us193BPfqeyuo9ys4GKiVvdH3I5AuSL5DzgPgEH0VSKTGwWOKFk3PptGWVYxOs
         snqN2xbqfGktLWhqwWKCmvEola3Botbvwq53+0sH21rqtEp7KyA4X4TL69trNEEg04o9
         mxlRtKwdA4CKHtDXSKQ88OlckHFI1mStopmcxbDif9+wq7as7mbl502UwCGTZZr+VCeJ
         HR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Td5nNKXFe0z6BB+o9VMLaTYliYU7qDR+uAvJ2+VJffg=;
        b=0KnzIKQ9hgs7jbMnH3EJ/sloNrw5RTJ380i+9ywDPBtyjaa3eeWabslrtWNC+guhkt
         j42C3L0OfmiJ56ZM+LIjTBX0GHhjocip8x5rMIQ6pYRuFq2xQWMctRbj6mDpq2HBQhz5
         LlHqk3zDCNAVWcSD9X3slS4H+AmSK8luY04/nI+lgsIuwmXqZpFtaoF75zoNVvi2ODtG
         l34Lcij/4XMA+3xgOg+ntNw+QuZ0U5CZ/tQ6Ui8OFo1Ol/fscYdrAsL5UGLzO2ruclWj
         iVw/IMPnhRBPyD6HGRJIi3Up+s5XzREgFxKZoq390JMjMwvvahU8GTgZUI/m3c1jm23I
         Sjgg==
X-Gm-Message-State: AOAM532ZqfPUlexJwJnIqHBApCjm10S4ICN8IvqqiY4azhGvb2FOElin
        CXkOl1Z3zdfrg48XJH3zKtOfMw==
X-Google-Smtp-Source: ABdhPJxw9PsqwVDhjtyg9myFohulOkwSpYUdlB4lFF0YGMRrcnR+hPxiwHJxWhVfDQT0tOzhAssLrw==
X-Received: by 2002:a05:6830:1d8b:: with SMTP id y11mr6555934oti.291.1633025963500;
        Thu, 30 Sep 2021 11:19:23 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k6sm727416otf.80.2021.09.30.11.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 11:19:23 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chris Lew <clew@codeaurora.org>,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: [PATCH v2 0/4] dt-bindings: soc: smem: Make indirection optional
Date:   Thu, 30 Sep 2021 11:21:07 -0700
Message-Id: <20210930182111.57353-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the modern Qualcomm platform there's no reason for having smem as a
separate node, so let's change this.

Bjorn Andersson (4):
  dt-bindings: sram: Document qcom,rpm-msg-ram
  dt-bindings: soc: smem: Make indirection optional
  soc: qcom: smem: Support reserved-memory description
  arm64: dts: qcom: sdm845: Drop standalone smem node

 .../bindings/soc/qcom/qcom,smem.yaml          | 34 +++++++++--
 .../devicetree/bindings/sram/sram.yaml        |  5 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 10 +---
 drivers/of/platform.c                         |  1 +
 drivers/soc/qcom/smem.c                       | 57 +++++++++++++------
 5 files changed, 77 insertions(+), 30 deletions(-)

-- 
2.29.2

