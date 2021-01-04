Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1BCB2E90E2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 08:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727561AbhADHXV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 02:23:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbhADHXU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 02:23:20 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953C5C061794
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Jan 2021 23:22:40 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id n7so18537452pgg.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Jan 2021 23:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pXFP/mDtbX6rOKoKmCzMOZbkWkRy48BUP7gekqphCDg=;
        b=brRLnzPM+VCNZQWtez6ENRPD5HNQEo3PCZwVieBiA/8lJWMIzQwXuVEHn8mV1qWFwT
         RchZ0s9ml91okYiuwbNypm5R81tyH0IJvHjcDtf/A2n9yUnoXXbI2idHRh5AkIYu5xcU
         6lnm//V+Xw2TZj6UeCN+mfzJoiMeLwkOTY4z3j94WyvkrbQaqNVhWe0WIGlMxHTGosCM
         NJA8cUZkRfE1/GswcVV3MQH1/J9XSqFKfVEgkEdu6o5Z+gI+lRgbrClPNhahrLNH9v6N
         tgO5AQ1svI4ULETEhCPyBWanET8p5m1hf8vFWM7I1nxh/Le58jZJsId/ZzhS60diHzy3
         429g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pXFP/mDtbX6rOKoKmCzMOZbkWkRy48BUP7gekqphCDg=;
        b=PtInjjmnSOEEfbaN7h03+fxtdblAArLlbWQRTxqVUKhL6DWwUPNy8nehHdTNehCeFa
         c8EY1PptgA31B5EY2Q0P4tZaejpIqWUx1NM6UfFAcMX8tPQYvMb6nx4uE+xSo+ugOASX
         CPADhO5D3YsC8xxSoXhnOudNzTNC/69/t35ZG25SacGypbGHnlO86gE9PVOy8TV20/dY
         lLMawEimjPymSSCB6XAzUOYkU8Lm9Gr53LGLIu50rdnrgespLL53Hw7TrwuLP/BZS2/S
         /CCAAIC8Tnq0Eizj+GT45/kKskopmC0u96iuqISaa3v9rAMbwBnkajS5K4g4tomyS4ez
         qgHg==
X-Gm-Message-State: AOAM5322M4hpITk2GsKXYYGYEMur6nsY13q7CeDaMfV+g6zhsvvXS8RQ
        Sf85Nw579czmOcV/ILegA5X9
X-Google-Smtp-Source: ABdhPJz5zeJcaEXihwL5Z4D5OXRnNcKttdAONkI46PsJpNlLkxQ/qEihV7OsTSAl7yWZ+bxGIJfdSg==
X-Received: by 2002:a63:1214:: with SMTP id h20mr46514167pgl.379.1609744960015;
        Sun, 03 Jan 2021 23:22:40 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
        by smtp.gmail.com with ESMTPSA id h7sm56676668pfr.210.2021.01.03.23.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 23:22:39 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     kishon@ti.com, vkoul@kernel.org, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] Add support for USB3 PHY on SDX55
Date:   Mon,  4 Jan 2021 12:52:10 +0530
Message-Id: <20210104072212.144960-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This series adds USB3 PHY support for SDX55 platform. The USB3 PHY is of
type QMP and revision 4.0.0. In this revision, "com_aux" clock is not
utilized.

This series has been tested on SDX55-MTP along with the relevant DT node.

Thanks,
Mani

Manivannan Sadhasivam (2):
  dt-bindings: phy: qcom,qmp: Add SDX55 USB PHY binding
  phy: qcom-qmp: Add support for SDX55 QMP PHY

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml |  2 +
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 83 +++++++++++++++++++
 2 files changed, 85 insertions(+)

-- 
2.25.1

