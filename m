Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41D31279972
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729363AbgIZNDL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728330AbgIZNDL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:03:11 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F27EC0613CE;
        Sat, 26 Sep 2020 06:03:11 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z4so6899374wrr.4;
        Sat, 26 Sep 2020 06:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TK14iUVfpjj01NGyLgnHpcNoTopba5SYsdekqr19l7g=;
        b=eV/P+PpD2SP+2FjP15F4Uytb/y1/dNoVWdz/ARCZ+JAjhL5gDmyU9pkiYxOhar2yMq
         ikxGh3w/C6rvCvOxbIwwusY4izUGypZHt72mV+iYsIxJTHpkkLNvxMGmHnzrQfcp0llt
         CJhbHFY8jhxI1KzwfcnZOedBvcbLaao71Z4NHsf9G/pdBNpt7FBtmkLWBUs/FjEIh39m
         6fNVqR2ellQGTJtZw95cuSFEd4j/d5tvUlL8LFwFB2QzHBgRjxab+KnKT1/cTzlO5OFo
         T9bYuDVhiBWpiiJteeX+WbwXaFgrpVV2nnqhBpQuXRWhlbbKZvQ+FkcK6Qw8t2KepexX
         4Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TK14iUVfpjj01NGyLgnHpcNoTopba5SYsdekqr19l7g=;
        b=R+U5lvPwrdYvFRhwQTHA4lRnCizh/VPJ9u4+nQ4rhpyzsEHC3GGbvI1szN89cLt6CA
         2S7KpcXbyksVlTAEKKs9BXjqPG/W2VYAp5nRABn1V/fMzrk/aDIVAs7QrSDAMqKDlnxp
         hsPFgiaaRjR/u54DwyNC7oByBz/uTjgtLKBdrugEkkE1MA5IeVwy3OC8ogEpL5jGvKQR
         xYbrLTsB0MtTd8YOGBElHPjhvK1UTVTxCMhT+JkQ/EbFMxf+GzgTX96gmJ1EGD/DUNlt
         UOiqNz2ueolPdxgsjKF2nztuK9/BAEIDNS3LX52fzeN2MrIhBORtTzXxyUJUZEqGCDoG
         /ivA==
X-Gm-Message-State: AOAM533yOKeW2XdbKhdVIDLLFDVYv2nC2iQSwtvKDKHfpZLJVsYv5GVc
        oI2CMaZxDddoYxY0QiqeqCw=
X-Google-Smtp-Source: ABdhPJyHCG+B0Ff4UamiK4dS63fUpUY7qdVc7IIoxCqLiUv5J9x00p97+b1KBz8DlMaT/DtXMUd9kw==
X-Received: by 2002:adf:f10a:: with SMTP id r10mr9096112wro.86.1601125389698;
        Sat, 26 Sep 2020 06:03:09 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id d83sm2853213wmf.23.2020.09.26.06.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:03:09 -0700 (PDT)
From:   kholk11@gmail.com
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, sboyd@kernel.org, kholk11@gmail.com,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] SDM630/660 Multimedia and GPU clock controllers
Date:   Sat, 26 Sep 2020 15:03:01 +0200
Message-Id: <20200926130306.13843-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This patch series brings up the MultiMedia Clock Controller (MMCC)
and the GPU Clock Controller (GPUCC) on the SDM660 series of SoCs,
including SDM630, SDM636, SDM660 and SDA variants, where applicable.

This series depends on "Qualcomm clock fixes and preparation for SDM660",
which is required for the drivers to work correctly and to even compile
(due to the gfx3d rcg2 changes).

This patch series has been tested against the following devices:
 - Sony Xperia XA2 Ultra (SDM630 Nile Discovery)
 - Sony Xperia 10        (SDM630 Ganges Kirin)
 - Sony Xperia 10 Plus   (SDM636 Ganges Mermaid)

AngeloGioacchino Del Regno (4):
  dt-bindings: clock: Add support for the SDM630 and SDM660 mmcc
  clk: qcom: mmcc-sdm660: Add MDP clock source CXC to MDSS GDSC
  clk: qcom: Add SDM660 GPU Clock Controller (GPUCC) driver
  dt-bindings: clock: Add QCOM SDM630 and SDM660 graphics clock bindings

Martin Botka (1):
  clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver

 .../devicetree/bindings/clock/qcom,mmcc.yaml  |    2 +
 .../bindings/clock/qcom,sdm660-gpucc.yaml     |   75 +
 drivers/clk/qcom/Kconfig                      |   18 +
 drivers/clk/qcom/Makefile                     |    2 +
 drivers/clk/qcom/gpucc-sdm660.c               |  349 ++
 drivers/clk/qcom/mmcc-sdm660.c                | 2857 +++++++++++++++++
 include/dt-bindings/clock/qcom,gpucc-sdm660.h |   28 +
 include/dt-bindings/clock/qcom,mmcc-sdm660.h  |  162 +
 8 files changed, 3493 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sdm660-gpucc.yaml
 create mode 100644 drivers/clk/qcom/gpucc-sdm660.c
 create mode 100644 drivers/clk/qcom/mmcc-sdm660.c
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sdm660.h
 create mode 100644 include/dt-bindings/clock/qcom,mmcc-sdm660.h

-- 
2.28.0

