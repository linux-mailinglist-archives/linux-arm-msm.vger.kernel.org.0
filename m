Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55B8B29DC76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 01:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbgJ2Aab (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 20:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727982AbgJ2A2i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 20:28:38 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA967C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 17:28:36 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t22so452282plr.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 17:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0LDlgcrX0fTy8G8ru/vcpjFBOXvVtIG9PCAS8YM1+BM=;
        b=XVh8FmbWZByklsfuhcxri/99HqwoYvxpsz2YHwrdIaEuCatu/oQBDjSTqVzV+xyQ4l
         vjHBkW76l8dH8Nmb2E8S89Z8NKduZWA/1MdCRhObe6UQ+gWQdLpD2VzCC+KYu/CoiaGY
         k/2xW/5NoH63op6cTEAkDUDwoPIjT/iH4KAjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0LDlgcrX0fTy8G8ru/vcpjFBOXvVtIG9PCAS8YM1+BM=;
        b=JZ1v1q4l+tkHiTZ6vh8GscJuBq/vl4o51DSZ+u0JdCeySzJlIReQMnAVm5ZdWesmuT
         eMaRVRMAekLWeHRXwLnU4/nlLfAwNnOmHsZo3C9bLN98l1xF+e0CHcE0bptfKFOsZbXa
         M3Z4PxrLq0or6eOHp2WmwO6ZTVVJEWktqcOxWb5sBBKgEDnHbTI6O3gaAPCbmxue14xD
         /l+H2/FZPRBTKqgoe0ywpx6xe0B91/mYTevNgq7hFVsoZF/ISEHmJcNAEBpktTnFw+99
         3cO4VrmkFGfKHrvWhA5qZJ3ABcVL2CUaVbMefVd5otOUzAC6owKnpN/dhZSy6apvBitL
         Sqfg==
X-Gm-Message-State: AOAM531wPqcFeX60pwpIi075v6EEPH1tU2sXwW7pvcO33PxQSKO9LD/V
        Sn+X0N8eq8FKs+w5u8sWZeP+ag==
X-Google-Smtp-Source: ABdhPJx4SwYDCGcxrzDITC5oKVfN6ljKGWxLSvwiYYuUt7t1zU9WiXpzVkggpeS9ohVjCwCxH+l83w==
X-Received: by 2002:a17:902:744a:b029:d6:8b8c:622d with SMTP id e10-20020a170902744ab02900d68b8c622dmr173631plt.67.1603931316319;
        Wed, 28 Oct 2020 17:28:36 -0700 (PDT)
Received: from evgreen-glaptop.cheshire.ch ([2601:646:c780:1404:250:b6ff:fee1:7d4c])
        by smtp.gmail.com with ESMTPSA id u13sm743625pfl.162.2020.10.28.17.28.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 28 Oct 2020 17:28:35 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] nvmem: qfprom: Avoid untouchable regions
Date:   Wed, 28 Oct 2020 17:28:23 -0700
Message-Id: <20201029002827.1729915-1-evgreen@chromium.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Certain fuses are protected by the XPU such that the AP cannot
access them. Attempting to do so causes an SError. Introduce an
SoC-specific compatible string, and introduce support into the
nvmem core to avoid accessing specified regions. Then use those
new elements in the qfprom driver to avoid SErrors when usermode
accesses certain registers.

Changes in v3:
 - Fixed example (Doug and rob-bot)
 - Use min()/max() macros instead of defining my own (Doug)
 - Comment changes to indicate sorting (Doug)
 - Add function to validate keepouts are proper (Doug)

Changes in v2:
 - Add other soc compatible strings (Doug)
 - Fix compatible string definition (Doug)
 - Introduced keepout regions into the core (Srini)
 - Use new core support in qfprom (Srini)

Evan Green (4):
  dt-bindings: nvmem: Add soc qfprom compatible strings
  arm64: dts: qcom: sc7180: Add soc-specific qfprom compat string
  nvmem: core: Add support for keepout regions
  nvmem: qfprom: Don't touch certain fuses

 .../bindings/nvmem/qcom,qfprom.yaml           |  17 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |   2 +-
 drivers/nvmem/core.c                          | 153 +++++++++++++++++-
 drivers/nvmem/qfprom.c                        |  30 ++++
 include/linux/nvmem-provider.h                |  17 ++
 5 files changed, 211 insertions(+), 8 deletions(-)

-- 
2.26.2

