Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2E1F1A9324
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 08:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393549AbgDOGWV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 02:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728821AbgDOGWS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 02:22:18 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0CBAC061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 23:22:17 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id a23so892410plm.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 23:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r7ztLwR0nrzj14bfkYxl4aJo2UR6d2mLG0ia7JK8sEE=;
        b=CvxVgWlbWjZSIJo5Xm1E2EQr1dEP5seT3eF+i8JK2W/3XQ/jyY2U3u6WQCqFgodlET
         O0bcdK/L3W8CEXqMemVVI6jAYYGBl+tjh5tAiUw7HNVvOOecm9876AFBDxIFY3lCGyIr
         bm+zH0C25JB90ZIM/5besoq7HEVcxXaVu5UHEgwAglxGnozMaw+KqAfpw5WznYRzRXYX
         7PjHgkkWfU4ErZbNZQJo/KzxfU7+JtN6ZLHtR5aBelXwVO0PYLsEAvWs4ff36O6SuaB5
         +ElhUSMiZwDH/gqu0To6GS6hZYvn/xrFVgCPUL2Ts9xgGJ+QFJE5WjqUU96MFtNWsFUY
         mbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r7ztLwR0nrzj14bfkYxl4aJo2UR6d2mLG0ia7JK8sEE=;
        b=dSAtqOJZOQWYRWK7MYAo66RvUazLhyCBTU5NVGiZZr4Ib3V4qw7CkVcZ/cZtMXK1tD
         recWr9GLxlFPLQw9HW/Z3/ULFPUT3nPfM721UJZna6By+aV/wuSk7j/6e6iTho6Az2hO
         vznyuo/3l2OcRsPk35STvrQnq26yx7fuSh92tNHiAP9vnm0JHNf8ZBGO8qXiDOWpsbfp
         cpjYaPLK/UVKbFxySfPAVNLAYtsdb33IQOuKC5dL2Gi6mEBHzkBSVFJOXWnYoCfi1sk4
         YUMcXqVJqRmfwmWhLaY89rS/vHbAbDuuGvr9IsbODfCVP6FX0nSJ/v6TFiBfjidGwTkL
         2WFg==
X-Gm-Message-State: AGi0PuYnUWg+8tpdMQP3Gr1FqNLbhg3AIFXnSYfCrDqkdGf1kP/i9gyr
        Uro8GLNbXBlQLoKX/sjS/vldvA==
X-Google-Smtp-Source: APiQypKWBS5ovDriytB8DRjNlCjsW7YgYHmuwGauDfW3GBOM5hji6Wr1BmawS8I+rA7IQhD0HZadoA==
X-Received: by 2002:a17:90a:ac18:: with SMTP id o24mr4468175pjq.62.1586931737426;
        Tue, 14 Apr 2020 23:22:17 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id nu13sm14032899pjb.22.2020.04.14.23.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 23:22:16 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Qualcomm SM8250 PRMHPD support
Date:   Tue, 14 Apr 2020 23:21:52 -0700
Message-Id: <20200415062154.741179-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add rpmhpd resources for SM8250 and add the relevant node to DT

Bjorn Andersson (2):
  soc: qcom: rpmhpd: Add SM8250 power domains
  arm64: dts: qcom: sm8250: Add rpmhpd node

 .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 51 +++++++++++++++++++
 drivers/soc/qcom/rpmhpd.c                     | 19 +++++++
 include/dt-bindings/power/qcom-rpmpd.h        | 12 +++++
 4 files changed, 83 insertions(+)

-- 
2.24.0

