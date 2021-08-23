Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5F13F47F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 11:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235716AbhHWJ5F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 05:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhHWJ5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 05:57:04 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7EEC061757
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 02:56:19 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id mw10-20020a17090b4d0a00b0017b59213831so6438986pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 02:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=+HcYX4o3oYabXOVjOFPvNIFXnMCujvnBt9jGvMZEMNQ=;
        b=cmYV78ghXsy4hjtR3Z117IW2pU/YgW/Xlv/y/3eea6DCXCAMlwvzYmSE95Mi/znrIi
         sHc9IoOoV+KBpBu3EipOfMbPVtgYDExm+iM7aT9G5I5IZZqcZT5qpNjtpFHh7Y2ES/2P
         PQYeISUXrny4nVFTUrKh0PpPj2RI2dfkCHOJV4tLZFIwyn/UiidKHADujfYSbnqACWxB
         PGLVVZHTgmi3ltfXqczTKvC3wzVfkLqjdkYNVu1GUtjUY4tNOE4CWVtaj+qyWyq8XupV
         FN7kBqUMgRYF+EX0jKiEP2E89bSuHcqXao8QGczw0uEPC4O0NRrKFTyu3kI+Dum5LJ0F
         zcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+HcYX4o3oYabXOVjOFPvNIFXnMCujvnBt9jGvMZEMNQ=;
        b=hID8ezt2N8y2YfrSVTo03214A0em81oFzu3iH1jPrLk7Lhg21IKVWbazXzZ47Dj1HW
         BuEA9rqXASGfE1yjzSE4JMqeKK36kMaxgPwp0Kpx7pWebgEd00OXlWtIB7/fUJpvRM6h
         64Y3HI2yU3djAsNlOJ05Pxy1oG+IuMpz/J4CCh7TeXJ3LS1V1x9Pm0OI7Xwxw9yuFeJO
         roLk5Qc7R3zF4X2vtpDbN5k2R1N93OpIIGmgZzLmZSl4Rv6XgiWcqkZseasSzLnW/9tG
         VJkIKDlV44B01jjpsNCOEdxikPPVq/aiDMnA+8hROaAs3HO4SYq7AOUaK9JHpWsrDLor
         2U/Q==
X-Gm-Message-State: AOAM533VJ6bPAXSiUMQtBWu4YZ2d/OvTi4gChHFxtAnYsTWveQmld5m2
        OhDue3+hstF5Y1yQuAmubZHOKA==
X-Google-Smtp-Source: ABdhPJyojLzAIU8oA6E7pgKoWx1updv6tv/T/1Pj7USfwiU/5uJ/llsOkcLobIAW08B9ShwhwJQGwA==
X-Received: by 2002:a17:902:8d8a:b029:12d:3774:3630 with SMTP id v10-20020a1709028d8ab029012d37743630mr28229682plo.65.1629712579445;
        Mon, 23 Aug 2021 02:56:19 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id z24sm18708230pjq.43.2021.08.23.02.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 02:56:19 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Georgi Djakov <djakov@kernel.org>
Cc:     AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/3] Add missing A2NoC QoS clocks for SDM660 interconnect driver
Date:   Mon, 23 Aug 2021 17:56:00 +0800
Message-Id: <20210823095603.5538-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The series updates SDM660 interconnect bindings, driver and device tree
to add A2NoC clocks required for QoS registers programming per downstream
kernel[1].  Otherwise, qcom_icc_noc_set_qos_priority() call on mas_ufs or
mas_usb_hs node will simply result in a hardware hang on SDM660 SoC.

[1] https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/sdm660-bus.dtsi?h=LA.UM.8.2.r1-04800-sdm660.0#n43

Shawn Guo (3):
  dt-bindings: interconnect: sdm660: Add missing a2noc qos clocks
  interconnect: qcom: sdm660: Add missing a2noc qos clocks
  arm64: dts: qcom: sdm630: Add missing a2noc qos clocks

 .../bindings/interconnect/qcom,sdm660.yaml    | 41 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          | 17 ++++++--
 drivers/interconnect/qcom/sdm660.c            | 14 +++++++
 3 files changed, 67 insertions(+), 5 deletions(-)

-- 
2.17.1

