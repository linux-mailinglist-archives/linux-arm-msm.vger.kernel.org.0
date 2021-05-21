Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3F8338D061
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 23:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbhEUWAQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 18:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhEUWAP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 18:00:15 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7894EC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 14:58:52 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id b13so12154262pfv.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 14:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fZVsdD5w5dtbGbEEJ61BTCXnjeAcPQ5ciZkXFGTTwac=;
        b=kIfjc8CrfmKYbfTMMlU4WT1c20OGxulKRNlpfMkt2Fe1V5wrobpSh0DOXQDgZQRNp3
         I2vzHrrBfeBmvokmGjtoU3g6ARWz+b7/3GXd8Cd2Q4DT4xXcSD3lPQXpgbyIZmkPOzj4
         nyo2uuj6aUa5lkvl3obu0QD9/zkrJK0y7mXh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fZVsdD5w5dtbGbEEJ61BTCXnjeAcPQ5ciZkXFGTTwac=;
        b=mhabHb8Ab2akJPlDpfh8RDfBJrTVDUxtAyHtCR+k718K1fNiLo9qX5AH/wSK4AaIqq
         W+CURvMmSkYQO9J7i1ajJi+EVh/2b0GxbXHoXynt8GlFncKToNwCzMGKJgGIJyHzWqqR
         dtsKYprC+5eTc0b30D6CXAFsHX+IOvL/Zaek2mAy/mxl3n4SUo2wenLAgOxvNpwNvQKC
         /RUPRiC6YhmquKXEcLNFQHxs4lm6QsEWq4lEgtof2luZRJ9fl8ymMoaF2GAHVhGfVBJ3
         rEYoAXc0OyL/koNX8GEdEU/psxbTI8613anXoe2fKJIevtq1wnvM9taBfgNeiNSKOMmr
         NrDg==
X-Gm-Message-State: AOAM531kzmcnsZNNBvut3dXWTULou1XYuRr8UWfwCkSiOcCTHTc4oaOK
        e6Q6pqWTrvBt0JjEY0s4w2q0Tg==
X-Google-Smtp-Source: ABdhPJwotZClCOCfN/A5TcF4NmLnxWrS4mDUkcKdUN2PVVtqamZYxDVB1UBsora2T4defngVpOwHUw==
X-Received: by 2002:a05:6a00:2ad:b029:2dc:900f:1c28 with SMTP id q13-20020a056a0002adb02902dc900f1c28mr11986089pfs.67.1621634331957;
        Fri, 21 May 2021 14:58:51 -0700 (PDT)
Received: from sujitka-glaptop.hsd1.ca.comcast.net ([2601:646:8e00:b2f0:22bd:8c3f:584d:d265])
        by smtp.gmail.com with ESMTPSA id h8sm4590835pfv.60.2021.05.21.14.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 14:58:51 -0700 (PDT)
From:   Sujit Kautkar <sujitka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Update sd card pinconf for sc7180 DT
Date:   Fri, 21 May 2021 14:58:39 -0700
Message-Id: <20210521215841.2017349-1-sujitka@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series contains change to move sdc pinconf from SoC specific
DT file to board specific DT file. It also contain change to set sdc
GPIO pin to bias-pull up

Tested sd card working on sc7180 based board

Changes in v2:
- added pull-up for IDP

Sujit Kautkar (2):
  arm64: dts: qcom: sc7180: Move sdc pinconf to board specific DT files
  arm64: dts: qcom: sc7180: trogdor: SD-card GPIO pin set bias-pull up

 arch/arm64/boot/dts/qcom/sc7180-idp.dts      | 102 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 102 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi         | 102 -------------------
 3 files changed, 204 insertions(+), 102 deletions(-)

-- 
2.31.1.818.g46aad6cb9e-goog

