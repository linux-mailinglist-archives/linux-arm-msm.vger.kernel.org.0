Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A375535030A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 17:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236252AbhCaPQz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 11:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235665AbhCaPQ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 11:16:27 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19344C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 08:16:27 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id g8so29674597lfv.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tfR5GQ7tlxUtNvzjDvXUuDHT8py3HH/WKc0oL4fpP2g=;
        b=DLL197LDW4t4gzj2MJ+Mj3WUtb/E/9b6aN9yrtdP+M3Ggg+1U0gLZjmiXXREUouOa5
         ICYhVdebrMCGhaaa5Dc6TSsMEIFgBQPVEjy3DF/3xyoDWg64Kjrs6YcWG22rYeWr/pZA
         GEC+7XMwoGCHRct84PE3rTtLmq6QKAy2CleYrQnganal/+F0XYr+a9eaqJ99iAByo0XI
         bVHhjBlJLP3XWIyOD0mXH0ci5jGS2hoYmuvbpgVn37N8CgjulwUtALJWJ+5dK8Ljgkg3
         9eaCJOW6qzqhShfdTSCjkPNv7+ISgJjvvg+Q1Lhtob5PZfCRRdgg5Q7BiVzYzfS2JuTp
         wFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tfR5GQ7tlxUtNvzjDvXUuDHT8py3HH/WKc0oL4fpP2g=;
        b=qNMXjTWgwVu9MwGpfvHmK+NvkCiwXdfTavjAxHTOdKYbyMUPUC6Md7uUVTDUESCoG4
         HaOJ9rWrP7+B05oH6R3UqSqCEODXdrZaMr5P/IRoCfZZMJ6DzNwuqgZI+Digsucu3ToC
         rc40bld3yA+B1EM9xtEhPbOgH/oGZ3thR0lnzOq0S5gbOyruxy8PXw30apA2DHO/+Fky
         XtfC7gXO9DLku9Kg8EIFh/k4Z3/pkbdgBOv6RtwwmTlajVWZzXzHO/YCaoTdWy+mOtLq
         kG7t5DiSaG87Px1W+7+s9TV6XADT7nr2Wiz3WG49qMhG/vmimWsmkc7KExxcACvYywS5
         uHkQ==
X-Gm-Message-State: AOAM532s1V6HHPu4Bkte5MTuGGmlSCH/LgGdQLhIr2Oabr5MO4qyUvtZ
        Pr9Ux8+E2HI49CteAvnsUSOzbQ==
X-Google-Smtp-Source: ABdhPJwRU7V3HX2WVER+WjJhJVlUO+ClGVYaAaQpB+0S5gmKrvYgnVGMOdRylfOr4TgCtkgE4xV0DQ==
X-Received: by 2002:ac2:57c6:: with SMTP id k6mr2548188lfo.264.1617203785619;
        Wed, 31 Mar 2021 08:16:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t201sm266738lff.70.2021.03.31.08.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 08:16:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Manu Gautam <mgautam@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 0/7] phy: qcom-qmp: provide DP phy support for sm8250
Date:   Wed, 31 Mar 2021 18:16:07 +0300
Message-Id: <20210331151614.3810197-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v5:
 - Rebase on top of phy-next
 - Rework 'move DP functions to callbacks' patch to leave most of the
   code in place, using function prototypes.

Changes since v4:
 - Fix typo in the qcom,sc7180-qmp-usb3-phy name in the first patch

Changes since v3:
 - Move qcom,sc7180-qmp-usb3-phy and qcom,sdm845-qmp-usb3-phy from
   qcom,qmp-usb3-dp.yaml to qcom,qmp-phy.yaml
 - Do not touch qcom,sm8250-qmp-usb3-phy compatible

Changes since v2:
 - Drop unused qmp_v4_usb3_rx_tbl

Changes since v1:
 - Provide dt bindings
 - Split register renaming from sm8250-dp-phy patch
 - Add respective changes to sm8250 device tree



