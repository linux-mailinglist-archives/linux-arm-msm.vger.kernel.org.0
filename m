Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2B664E4EAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 09:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242979AbiCWIv5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 04:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240660AbiCWIvr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 04:51:47 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43BB7523D
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 01:50:13 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id o6so899262ljp.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 01:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/s85OGqNXpkecnGselKWsKN2lTwYoyTplSl6MyjZK1Y=;
        b=Rv1EUItMANZppwyCr9Jl2CMrJmPC0C5EQ/mwQX4i9HwrH9gjUugekbESDuDoXXXdgw
         lM4vHt+/zzY8T2DfU/eSP+6kb9qV0uaH+EqQUO9cOmOKL+QM6DZza6yPtk4boMJYGQ4b
         pXscXdP/SF7CNI3VDCX5COa+YoOaf831fzok1D0fxUV7kL9vcX/kw89M4QtEQG/AjLPF
         FfSYO0Yui+BSak0K4c7d47o/QDMjToQYt12Kf6S80nk3KJnXWyPmfuobJTvUW7dBbNL3
         0XPmFCmoM/tY2EGrzUd8z6Dlz6lMl9nyDUl+w9ixuBz2mbFa2Xilg9gClILyCRkvFPMP
         a2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/s85OGqNXpkecnGselKWsKN2lTwYoyTplSl6MyjZK1Y=;
        b=5xw9Vj20u3Vn0LeV5OVr305761bq2F+yawlfSsqLpLYCRMn2AuzDLsK3Mm+04amsTQ
         BThAfeIaI/cEQVt3LPDM+mDfqN6FX5+4ipWdjEmbZlh31KIf1/mIVxrv9YfCRS5IyyzL
         gcdjrHpYlxUzsBW1fwh2iMQuo3kUWHIT11Yq2LOrwULy84gtRoHtXJ6DFSwI8LfP4KaG
         8vhNqAKSNTOZzSgIfGNTt2RaisMfNHwZMzqN7EFswIKeZg+/74C0EmNR9Hn50jt+hcH6
         8XWwjSo65hw+o8i/09S+wCe/ApCiTmNPotjf5U2ERzRWq40zgnTzndXTFakTrcj46byq
         XqGg==
X-Gm-Message-State: AOAM531caEXpUBSTF9lP0hvPooJNwlfuaHl6rhDD1G5FhYppH7mi1AND
        ZBl7VCfkJCkytkxRqCEffQpYDw==
X-Google-Smtp-Source: ABdhPJzZBjgziwAktuqj5IF3PvEcgzoqe5VUzz07rF9U+wnxqiPYUwlXvbKIw1wNahdhKbyS4/fXIQ==
X-Received: by 2002:a05:651c:506:b0:22d:b44b:113e with SMTP id o6-20020a05651c050600b0022db44b113emr22374179ljp.32.1648025411971;
        Wed, 23 Mar 2022 01:50:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c40-20020a05651223a800b0044a1edf823dsm1376140lfv.150.2022.03.23.01.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 01:50:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Prasad Malisetty <quic_pmaliset@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [PATCH v1 0/5] PCI: qcom: rework pipe_clk/pipe_clk_src handling
Date:   Wed, 23 Mar 2022 11:50:05 +0300
Message-Id: <20220323085010.1753493-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PCIe pipe clk (and some other clocks) must be parked to the "safe"
source (bi_tcxo) when corresponding GDSC is turned off and on again.
Currently this is handcoded in the PCIe driver by reparenting the
gcc_pipe_N_clk_src clock.

Instead of doing it manually, follow the approach used by
clk_rcg2_shared_ops and implement this parking in the enable() and
disable() clock operations for respective pipe clocks.

Changes since RFC:
 - Rework clk-regmap-mux fields. Specify safe parent as P_* value rather
   than specifying the register value directly
 - Expand commit message to the first patch to specially mention that
   it is required only on newer generations of Qualcomm chipsets.

Dmitry Baryshkov (5):
  clk: qcom: regmap-mux: add pipe clk implementation
  clk: qcom: gcc-sm8450: use new clk_regmap_mux_safe_ops for PCIe pipe
    clocks
  clk: qcom: gcc-sc7280: use new clk_regmap_mux_safe_ops for PCIe pipe
    clocks
  PCI: qcom: Remove unnecessary pipe_clk handling
  PCI: qcom: Drop manual pipe_clk_src handling

 drivers/clk/qcom/clk-regmap-mux.c      | 78 +++++++++++++++++++++++
 drivers/clk/qcom/clk-regmap-mux.h      |  3 +
 drivers/clk/qcom/gcc-sc7280.c          |  6 +-
 drivers/clk/qcom/gcc-sm8450.c          |  6 +-
 drivers/pci/controller/dwc/pcie-qcom.c | 87 +-------------------------
 5 files changed, 92 insertions(+), 88 deletions(-)

-- 
2.35.1

