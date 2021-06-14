Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 294813A7225
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 00:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbhFNWlC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 18:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbhFNWlC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 18:41:02 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 738DFC061767
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 15:38:44 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so12431740otl.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 15:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EdHc/AxSkP+B70QGXtT/aVMYWMcBsbv+TEZwsL21ckU=;
        b=mCb2TXDTwhE4FEtPNA/TpAkjiNGklA6mfl8axXo4tK525o5v+zfhoPrKoNzw/MXKNe
         z5eb+9p6ss5BpDJEccjK4Q+onsgxWc+bUHOnnYR9GN4as/c7C1easVB8kQVMtFIc+gwN
         9XeDq3olp87AqtVR/P7S90ILEEQAxpOJkDvXGBIarf//sMJIIkPLYZL9n1apNqQK4YTy
         NSobicHh2yUs8IzJaWQMn7jBJb8EUED9oiRXzBbs/2cyjJflPr472oMUhR9mcEQuBtyF
         cNawO38eIrt/e+3AAvesAkUWkjHkRfmtUDZEVHdlNWMH4osSwqaaTpc8CWu4lagZhOrp
         UoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EdHc/AxSkP+B70QGXtT/aVMYWMcBsbv+TEZwsL21ckU=;
        b=uGRqkNcCNhUI2JtvwbwWtsCqXRpCqxFltNflP0/tzFEX3ydlqX8Yfnn1euwJZK7f6T
         m6oAiDgG13hVKgnXFTk3fW9U2sCY/pFsbBFyFSeGzvwNvbWs/Xki8KpmG9NPLuD3GsrJ
         fisSOaCRLQia3TyzSzGNfUNiScIdul+Q06mVXmfHubCY7CfWg5ElHvSOPJyo9tHsJYvX
         OkBxLIjp/V8IGXmiSfVehSTlDIWUocO6iLHal81807Mk8yeG0Ou4e4hy9NqbwvLwFTXO
         MW5E7Xnk8xgrkpK39UEWyJAVY32yfkzjQH/w0llibKICniC5fX37hH2V1+oPVuOxK3ix
         ekTA==
X-Gm-Message-State: AOAM533KsgnjGvMSZZ+eFippGLeLA9fpJIdkbX7O9aDm6jIr6U2JMepo
        gC3/oa+sXldFI9rBlG/xoeBS8EwMmh2KzQ==
X-Google-Smtp-Source: ABdhPJyX5H0T9BOTWQ6nUh3uF2mKqVo3hx7K8ZqUddihisusNh3QjDfIZMhEGBGypewfXbeE+lgBuA==
X-Received: by 2002:a9d:6b83:: with SMTP id b3mr15358658otq.325.1623710321397;
        Mon, 14 Jun 2021 15:38:41 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p1sm3423879oou.14.2021.06.14.15.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 15:38:41 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jonathan McDowell <noodles@earth.li>
Subject: [GIT PULL] Qualcomm DTS updates for v5.14
Date:   Mon, 14 Jun 2021 17:38:40 -0500
Message-Id: <20210614223840.393224-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.14

for you to fetch changes up to 2011fc7a8b5b7415d7cd885fc84ada88d37569d3:

  ARM: dts: qcom: Enable NAND + USB for RB3011 (2021-05-31 10:56:25 -0500)

----------------------------------------------------------------
Qualcomm DTS updates for v5.14

This adds DMA, NAND controllers, USB controller and PHY, RPM, L2CC,
thermal sensors and defines thermal zones. It them enables these for the
RB3011.

----------------------------------------------------------------
Jonathan McDowell (5):
      ARM: dts: qcom: Add ADM DMA + NAND definitions to ipq806x
      ARM: dts: qcom: Add tsens details to ipq806x
      ARM: dts: qcom: Add USB port definitions to ipq806x
      ARM: dts: qcom: add L2CC and RPM for IPQ8064
      ARM: dts: qcom: Enable NAND + USB for RB3011

 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts |  58 ++++
 arch/arm/boot/dts/qcom-ipq8064.dtsi       | 425 ++++++++++++++++++++++++++++++
 2 files changed, 483 insertions(+)
