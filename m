Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7A03479B41
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Dec 2021 15:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233370AbhLROSH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Dec 2021 09:18:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233367AbhLROSG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Dec 2021 09:18:06 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EAB0C06173E
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Dec 2021 06:18:06 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id m12so7931014ljj.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Dec 2021 06:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9pY2l7uQu8pMBGj266/5fVFZvNlg4PBkcYZxPNpbcEQ=;
        b=T4Dtl78EicbwrSZW/jwbKuWJqU4w9JBPYf/fP/YZot0TgQAPRc7O77VtIOfAb3Btd7
         qQYdES6snn+TlMkqPJDwmbfu91sZpz52W/zn0DBzhiub2CbuLl5s+jystTGhsdUezaNG
         yVkL81uP4Lf1tgYFvzGNjIu+HvASuJyZWgQVQEotAsuoR7d0AOLf53MPCu2COFoiOYUY
         1ii3BmmCmsiJNoVyLwNHgqlLNMzkl3edelq/7ThwB2OPVt69CZchDx3+AS0ZI7Jroy4x
         HENyWcbLq0vQK9sdc40Rn5gWRjS58eSi+Eelw8QxnYKNlWa1fWrjfuD1q7gRXxUch/1W
         jo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9pY2l7uQu8pMBGj266/5fVFZvNlg4PBkcYZxPNpbcEQ=;
        b=6IwUIohV0/nDvIx0rGUr+NT5DY+ck6rzl/b4foilH4G8TQ76fV/xud7tmB+9QOUnWd
         M16fwvS1Cj7YMatNxj9D94aYMwJISNSWQ/whxVTb17v/GrTQcDyr2D9uT61q/wRavbfG
         IjJYhzi1Lpqll/H+pqfRzIHpfgnM/GppfDmVKWSDt1ORCFYkYIqTCViixmKC2Fe/0RoI
         tkNSoZO+H+IVBEaaHM4omdcC66PAnN+DgPEd3ScClsdQOz94pTp03NhVBibQR6dHeOjs
         DN9Qea78nZNh6Ux/ZgPc4ZcLp5Hipqx+nW0NBAAWZVKJYaXUm3U5fE/DZsSDZY+FAR7X
         s3xA==
X-Gm-Message-State: AOAM533rOLthXeJiB914bSkMSoX+qq1uGbimXsuPa72pVMrUnKx9VSdS
        Cs/595aqYh9F7jrFRw3BiszO9A==
X-Google-Smtp-Source: ABdhPJzR8CwEfjHh6blBrM6bGE0jaeF32fOh+fOzWqg1U8jDh7UyE9Apb2NCOMGlgdU86P8Ddhd8Ig==
X-Received: by 2002:a2e:548:: with SMTP id 69mr6809049ljf.225.1639837084443;
        Sat, 18 Dec 2021 06:18:04 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id o11sm1952040ljc.100.2021.12.18.06.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 06:18:03 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] phy: qcom-qmp: Add SM8450 PCIe1 PHY support
Date:   Sat, 18 Dec 2021 17:17:53 +0300
Message-Id: <20211218141754.503661-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are two different PCIe PHYs on SM8450, one having one lane (v5)
and another with two lanes (v5.20). This series adds support for the
second PCIe phy.

Prerequisites: SM8450 PCIe0 PHY support (accepted by Vinod)

----------------------------------------------------------------
Dmitry Baryshkov (2):
      dt-bindings: phy: qcom,qmp: Add SM8450 PCIe PHY bindings
      phy: qcom-qmp: Add SM8450 PCIe1 PHY support

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml      |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp.c                | 153 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  70 ++++++++++
 3 files changed, 225 insertions(+)


