Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42FC321DA58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 17:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729940AbgGMPmt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 11:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729822AbgGMPmt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 11:42:49 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA61C08C5DD
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 08:42:49 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id j10so10239390qtq.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 08:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o6mVIteS5H22xj7K9FbgllDWoWh0dWKcuZiDimv8WT0=;
        b=PWuqcgBxjYScsRLGOLnb7Muj06nTih8BeA2wxRUzz65ls/OgusFE+hlPsst9WP7HSl
         0wbLJmYCzmvh57Itn/lK1AWfozL4MPIcAdPDZV7lupW5RvF3pkuafSA2sQNkM6/hqZtY
         qQ4NPXtZUw5pXwb1Xj2IPAY8uHSEfhXfEVSEe3sxsvn9hssb/iaxp+EbEo50Ou1k6Vka
         T0NCu5E/Xs+oZnort4PcU5yEmqjWsr56TC4r9K+kCGtIZehRrxSMXNVk8vg8XHKv4aXi
         /32B36zBejkNQ6VA+C5FQU9i4t4HBbFH2GYLmR1lUwNIKq7WPl62vAy/VCAvd+aSzn3g
         R4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o6mVIteS5H22xj7K9FbgllDWoWh0dWKcuZiDimv8WT0=;
        b=a7XQu2zwYNbeLUswaem3rnji5AvETnx8BplI3NS80wy5idJFtLA85ARKD3bt3eOlZg
         PjBcuDEMcbePeW7WQ6sDbUetvr4rhTxZRko/qaAfOi75NY3aoui43jL5HO+xqQghgZNU
         2vbtPb74JE7xt72Eq6KF9zMK6BOX4C4JLL4inkJZ/mqFnvXE5KZjHV+nhy3cpd7mMaZ3
         JjnLUxemUbSFfkmFU9NIh41hgx/sfs5jV9d9XGz8bDnbI8Nded8IVTAGx9molgRga6Np
         KNd5NiAkWwbHOTy2P2AbU2UOzy7uzFm4IYtJFkv0ThIKqDuYDKINYcvnZIghTl4O3G6a
         OcJQ==
X-Gm-Message-State: AOAM533it36UD2/r1Tk/5CU5SsjyEuOklrkCFVrQiauGLcD3ayfQI9on
        XUArLEZJqUPlu0hvVlhWDD/SA5SoBsY=
X-Google-Smtp-Source: ABdhPJxV2KKXGOQ10kOUx+nUwR0+7ahOgBJa7GfDP+fROft5m6+JqIu5v0A9I3+GFGxVzwGxo7V3eQ==
X-Received: by 2002:ac8:45d1:: with SMTP id e17mr88246364qto.159.1594654968159;
        Mon, 13 Jul 2020 08:42:48 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id l1sm19806371qtk.18.2020.07.13.08.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 08:42:47 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org (open list),
        linux-pm@vger.kernel.org (open list:INTERCONNECT API),
        Odelu Kukatla <okukatla@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/7] Add SM8150 and SM8250 interconnect drivers
Date:   Mon, 13 Jul 2020 11:41:09 -0400
Message-Id: <20200713154121.22094-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Most of this is generated from downstream dts using a script.

There are a couple things I'm still not sure about:
* When to set keepalive in DEFINE_QBCM macro (set to all false)
* Size for the reg fields. For the size I just used 0x1000.

v2: single yaml file for RPMh interconnect bindings, drop display RSC

Jonathan Marek (7):
  dt-bindings: interconnect: single yaml file for RPMh interconnect
    drivers
  dt-bindings: interconnect: Add Qualcomm SM8150 DT bindings
  dt-bindings: interconnect: Add Qualcomm SM8250 DT bindings
  interconnect: qcom: Add SM8150 interconnect provider driver
  interconnect: qcom: Add SM8250 interconnect provider driver
  arm64: dts: qcom: sm8150: add interconnect nodes
  arm64: dts: qcom: sm8250: add interconnect nodes

 .../{qcom,sc7180.yaml => qcom,rpmh.yaml}      |  55 +-
 .../bindings/interconnect/qcom,sdm845.yaml    |  74 --
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  82 +++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  82 +++
 drivers/interconnect/qcom/Kconfig             |  20 +
 drivers/interconnect/qcom/Makefile            |   4 +
 drivers/interconnect/qcom/sm8150.c            | 639 +++++++++++++++++
 drivers/interconnect/qcom/sm8150.h            | 153 ++++
 drivers/interconnect/qcom/sm8250.c            | 655 ++++++++++++++++++
 drivers/interconnect/qcom/sm8250.h            | 163 +++++
 .../dt-bindings/interconnect/qcom,sm8150.h    | 163 +++++
 .../dt-bindings/interconnect/qcom,sm8250.h    | 173 +++++
 12 files changed, 2186 insertions(+), 77 deletions(-)
 rename Documentation/devicetree/bindings/interconnect/{qcom,sc7180.yaml => qcom,rpmh.yaml} (56%)
 delete mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sdm845.yaml
 create mode 100644 drivers/interconnect/qcom/sm8150.c
 create mode 100644 drivers/interconnect/qcom/sm8150.h
 create mode 100644 drivers/interconnect/qcom/sm8250.c
 create mode 100644 drivers/interconnect/qcom/sm8250.h
 create mode 100644 include/dt-bindings/interconnect/qcom,sm8150.h
 create mode 100644 include/dt-bindings/interconnect/qcom,sm8250.h

-- 
2.26.1

