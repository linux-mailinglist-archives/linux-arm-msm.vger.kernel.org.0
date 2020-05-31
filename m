Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D5D1E9965
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 19:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgEaR2M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 13:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgEaR2L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 13:28:11 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D539C061A0E;
        Sun, 31 May 2020 10:28:11 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id p5so3235640wrw.9;
        Sun, 31 May 2020 10:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h+V0If/8WPtg9Cm+oT9f9ZK7VvNPlURM+alM6i1MjXI=;
        b=uIDE2NldMA1Ige94hh6Yg7i0lpOMf2Dk4klWFGLPFY4AN9lalr2pwEzOJO9CojH9Ml
         0MlBu3aaeYfzrYo+8PbKTYRn8T0iDJ7lTlH8VW58rl5UtujNC9SN+V1C+T8SXVo36Lqd
         QDQsvniwIwbekrglyKulejbT1YezE/e0/9UuGzjvmjdJkWm+2unR41w2j+TgfW1YMjJT
         wBQuRsAgO+RPesZtwPzDaK6DZyrNWZrpoE25ZnLrd6oZp7JC15rD4Jv/bq4N9Tt05M6P
         3fEQM+AXiDNZb4P3NJ4MnUY/JCz8MzxXsdhnKstmAsyAqF8yzH8gRA/wRccQGRchLbyt
         Ag/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h+V0If/8WPtg9Cm+oT9f9ZK7VvNPlURM+alM6i1MjXI=;
        b=kFdeUALlrPoUOc2OepSerUgIrfL2t649Dy7J9nRwKOgKL/CGNiNDzc7SqlDq7fUejk
         qgQizBeDxtJS3nrzCsYpsmhWD/d3H0lwqPi2CwcyTdLQ0G014Qu8JpHJkxP/rEMmsOsL
         x1xFAcbmz1xM7pXxhzprzwLKDuxK6nW7mI+bg4rtUp5o/h/tX9kRNDpk/MlHNOlVqnID
         2cDQJqG9KKzRI+L3etaeg6yutFsvWND/mwEQTWYIzv4j8bDl6hRVEJI+KbOe7mqAtsiW
         YaslYsPP/HL6Hvgsh0DXkH34OLL81ExvPKcux980d2xhiLYWCw9a+j3aa9nmor2DHsn2
         iFvQ==
X-Gm-Message-State: AOAM533O3vdHeNzSonWe8as8jMVi2W6LOvOzW9M6p/cvuBN9Sy/m7IjN
        2WdjXz7nvfGxgoZ9b6AuGl4=
X-Google-Smtp-Source: ABdhPJwhwMV1txEqP1MDXRBAwRZK4winX3/2r9eBJjs5xP8yP41cmQNPWFe0xQA+MLVklBrL/6pviA==
X-Received: by 2002:adf:9f48:: with SMTP id f8mr18262454wrg.228.1590946089619;
        Sun, 31 May 2020 10:28:09 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id b81sm8922326wmc.5.2020.05.31.10.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 10:28:09 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/14] msm8992 DTS updates, peripheral enablement
Date:   Sun, 31 May 2020 19:27:50 +0200
Message-Id: <20200531172804.256335-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for PMU, PSCI, SPMI
and SCM, as well as all six cores on msm8992.

Please note though, that due to the lack of a core 
cluster interconnect driver, it is only recommended 
to use one cluster (as in set NR_CPUS to 4) for now.
The other two technically work, but in practice slow
down the platform by a LOT.

Hopefully with a proper MMCC driver this platform can be
brought up to speed with other Qualcomm SoCs.

Konrad Dybcio (14):
  arm64: dts: Add a proper CPU map for MSM8992
  arm64: dts: msm8992: Place clock nodes in clocks{}
  arm64: dts: msm8992: Add a SCM node
  firmware: qcom_scm: Add msm8992 compatible
  Documentation: Document msm8992 qcom_scm compatible
  arm64: dts: msm8992: Add a spmi_bus node
  arm64: dts: msm8992: Add BLSP2 UART2 node
  arm64: dts: msm8992: Add a BLSP I2C2 node
  arm64: dts: msm8992: Add a BLSP I2C6 node
  arm64: dts: msm8992: Add PMU node
  arm64: dts: msm8992: Add PSCI support.
  arm64: dts: qcom: Update msm8992 pin configuration
  arm64: dts: qcom: Fix msm8992 SDHCI
  arm64: dts: qcom: Add a label to the msm8992 rpm-requests node

 .../devicetree/bindings/firmware/qcom,scm.txt |   1 +
 arch/arm64/boot/dts/qcom/msm8992-pins.dtsi    | 149 ++++++++++++----
 arch/arm64/boot/dts/qcom/msm8992.dtsi         | 167 ++++++++++++++++--
 drivers/firmware/qcom_scm.c                   |   1 +
 4 files changed, 275 insertions(+), 43 deletions(-)

-- 
2.26.2

