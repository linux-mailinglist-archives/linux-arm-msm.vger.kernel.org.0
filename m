Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F174A645014
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 01:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbiLGAPH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 19:15:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiLGAPH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 19:15:07 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E584B98D
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 16:15:05 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id q7so19082602ljp.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 16:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=urGNpxJzzyeN0lSvCVEBP/kOzMc+wfTdziRseLi7aVg=;
        b=XsPN61rD10Fz4uWkah7zjnqIyczDa8NqQB/OScOud/dvISx2MTxQqQKaHr2JK9WAip
         oLRrtYyEBIiT1mq+N5ApsxOENzKsvw8UFJuPGKqNXOPJua44xjN6WXP+wzZeIjuGuyzr
         +B99dUrU9gxSt9D4qI4kp3oMyuhEBfRf9mhi53LlBm6w5ZBrzAAL/xZ9sCw0P2yQEd4B
         pNwvXsJXC+p4GVUUo1t9tTNkWWTS/TB5eeXYGTLieJZP3x8+H0DUpY1z+e4jlG+2tmkJ
         hEHMbJ3Y3oMlJLRBApPDWUQJcQgy2Hqfj6i1Nk5UD/8Yg0D1arlFyoFJ00NdMpi1SJcu
         h9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urGNpxJzzyeN0lSvCVEBP/kOzMc+wfTdziRseLi7aVg=;
        b=xaMBGmhT49ZQ/75IQOygIdIk9gVPyqsVHRXvWBnSypbv8XogFGYkvAFVlr4WilGGLm
         Tz42fljeSU8O67R5D+vh9H3xGr2LCrMJou0FVmjqRcerWrFeFZfBOWO4bJ1qd1+Re/VJ
         rIREfhsCCUR/yffjueb+u0LskNjcMfbZbw8d6wbn48lwXJJsnkZyu8XKx3ws5oQxWSC8
         ZGHbnJXXwo7lOzPQh9nFLOBRh9AzeNsvopYtZUgbhPLwGQxSI7go8Ol3Qeju3OyLUckP
         QkrDlP9Vm1CPizo7oFDkFpEWObjZiIXTDZXdXurQtllSFIHFDkZvv+ktuXsW+Ox1asjQ
         5mKw==
X-Gm-Message-State: ANoB5pmF6RUXZBYR4EvtEKC5FQMxBYt8BnzuHaU3gXawfm4rpPK+RfPB
        4iVglHoPNZvndflsOLS1zJboCg==
X-Google-Smtp-Source: AA0mqf62ndvryLlt9OYAm0eA615XFtH/iCXevZFqLnXa282M1B5KoGkEAmijoJ8Qpy5/0rUsJqesQQ==
X-Received: by 2002:a2e:b526:0:b0:26e:494a:de3f with SMTP id z6-20020a2eb526000000b0026e494ade3fmr28309477ljm.85.1670372104143;
        Tue, 06 Dec 2022 16:15:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f50000000b004b53eb60e3csm2308555lfz.256.2022.12.06.16.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 16:15:03 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 00/18] clk: qcom: smd-rpm: drop platform names
Date:   Wed,  7 Dec 2022 02:14:45 +0200
Message-Id: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series concludes the previous work on Qualcomm RPM and RPMH clock
drivers. It reworks the clk-smd-rpm driver to drop the SoC name from the
clock symbol name, as the clock definitions are shared between different
SoCs (platforms). Having an SoC name in the clock definition can lead to
all sources of confusion and/or errors.

Changes since v1:
 - Split the MMXI/MMAXI and sm6375 vs sm6125 changes into two different
   patches
 - Reworked macro definitions and usage to remove empty arguments
 - Dropped qcm2290_bimc_gpu_clk definition in the corresponding patch
 - Alignment fixes

Dmitry Baryshkov (18):
  clk: qcom: smd-rpm: remove duplication between MMXI and MMAXI defines
  clk: qcom: smd-rpm: enable pin-controlled ln_bb_clk clocks on qcs404
  clk: qcom: smd-rpm: remove duplication between qcs404 and qcm2290
    clocks
  clk: qcom: smd-rpm: add missing ln_bb_clkN clocks
  clk: qcom: smd-rpm: use msm8998_ln_bb_clk2 for qcm2290 SoC
  clk: qcom: smd-rpm: rename msm8992_ln_bb_* clocks to qcs404_ln_bb_*
  clk: qcom: smd-rpm: remove duplication between sm6375 and sm6125
    clocks
  clk: qcom: smd-rpm: add XO_BUFFER clock for each XO_BUFFER_PINCTRL
    clock
  clk: qcom: smd-rpm: drop the rpm_status_id field
  clk: qcom: smd-rpm: fix alignment of line breaking backslashes
  clk: qcom: smd-rpm: move clock definitions together
  clk: qcom: smd-rpm: rename some msm8974 active-only clocks
  clk: qcom: smd-rpm: simplify XO_BUFFER clocks definitions
  clk: qcom: smd-rpm: simplify SMD_RPM/_BRANCH/_QDSS clock definitions
  clk: qcom: smd-rpm: rename SMD_RPM_BRANCH clock symbols
  clk: qcom: smd-rpm: rename the qcm2290 rf_clk3 clocks
  clk: qcom: smd-rpm: rename SMD_RPM_BUS clocks
  clk: qcom: smd-rpm: remove usage of platform name

 drivers/clk/qcom/clk-smd-rpm.c         | 1441 ++++++++++++------------
 include/dt-bindings/clock/qcom,rpmcc.h |    2 +
 include/linux/soc/qcom/smd-rpm.h       |    1 -
 3 files changed, 723 insertions(+), 721 deletions(-)

-- 
2.35.1

