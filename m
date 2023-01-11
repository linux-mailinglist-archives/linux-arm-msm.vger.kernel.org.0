Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90836666376
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 20:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbjAKTUM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 14:20:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbjAKTUH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 14:20:07 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67DAB12
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:20:06 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bq39so25095046lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bemqEEgA0VxN54ppHUN6LqnTVBLfz/fQJTaypfkAfeg=;
        b=l/5sRgseiaNqSIuHMF/bFNw4OO9+EKUYK/MBTtQ3qhE7HEftTdwVik/RrE9bmjv2vH
         2qYxE0Gl3hekyHHYXpNxwnyy+dzfXt/XVwQeyrFyh2svXowZiy3FuxK12nzjWDRbMucb
         CFfemNHSApNUDjvKT+9sMXNYCSJB/xuX6jiztCHvz0nzSfXEk1GZJktzwG7Q7GcevUUa
         9aeLTqSYWVD7NDOHQH4KOO+zzM6bQmv2Dsp2LJEf5969GPllJ36RmbyP6y1JTJuXL8DU
         Pt1hg6C8C9Od3bpzmkSoFZaDFCZzr6YAmjnxXLBnilEXNincUgTU4VFZTOwtQEqbiHhM
         IQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bemqEEgA0VxN54ppHUN6LqnTVBLfz/fQJTaypfkAfeg=;
        b=dwIb/Y8TeQibY8WhIyPilXiEx0BwUQ98VLYuwXAROO7k4ZLGuKA7yJQmqxzPhxxasz
         zeZJWn8d4Q4kM+tP21nIQDlgq5CbD2tnrYQCFSj85HZ5vGqT3bPF3uiFoUPVj8ERvl18
         qJiLG7VBncOyN51qB2Scgj17H+gmSzMFkitOQw1XVHfm960Lk02SFshmwYO+ed4VgpJ1
         TOymbAQ/oSfoiSUZMxWa7N0ia/IDtmu0qWcDJkqHOrc/NhILwpofHFHGAF++f4YEHAKL
         rb14410vGmjAeyO8mQA3+e7P1PcfGIpRuBmCX1gtDFtme+zmLZpN1eGqUi2qJio41ZkK
         QyEw==
X-Gm-Message-State: AFqh2krs5Y8WveYxuHox56dpULGQbK9Zv5krIPlaqcRKuUIa0QIJhZYJ
        SJ8V1VCj4n5pItSN5uyjwzh+0w==
X-Google-Smtp-Source: AMrXdXskLgELe3qNVkma9JHgy6rZmiAQ6EurGjIfRRlp9EJgp0TliZo6ZDEPJNS+Z7YpKW7T4RUP9A==
X-Received: by 2002:ac2:4317:0:b0:4b5:834b:9f82 with SMTP id l23-20020ac24317000000b004b5834b9f82mr2281161lfh.58.1673464805100;
        Wed, 11 Jan 2023 11:20:05 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bj36-20020a2eaaa4000000b0027ff2fabcb5sm1807787ljb.104.2023.01.11.11.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:20:04 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 00/13] clk: qcom: cpu-8996: stability fixes
Date:   Wed, 11 Jan 2023 22:19:51 +0300
Message-Id: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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

This series provides stability fixes for the MSM8996 boot process. It
changes the order of calls during the CPU PLL setup, makes it use GPLL0
(through sys_apcs_aux) during PLL init, finetunes the ACD, etc.

Dependencies: [1], [2]

[1] https://lore.kernel.org/linux-arm-msm/20230111191453.2509468-1-dmitry.baryshkov@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/20230111191634.2509616-1-dmitry.baryshkov@linaro.org/


Dmitry Baryshkov (13):
  clk: qcom: clk-alpha-pll: program PLL_TEST/PLL_TEST_U if required
  clk: qcom: cpu-8996: correct PLL programming
  clk: qcom: cpu-8996: fix the init clock rate
  clk: qcom: cpu-8996: support using GPLL0 as SMUX input
  clk: qcom: cpu-8996: skip ACD init if the setup is valid
  clk: qcom: cpu-8996: simplify the cpu_clk_notifier_cb
  clk: qcom: cpu-8996: setup PLLs before registering clocks
  clk: qcom: cpu-8996: move qcom_cpu_clk_msm8996_acd_init call
  clk: qcom: cpu-8996: fix PLL configuration sequence
  clk: qcom: cpu-8996: fix ACD initialization
  clk: qcom: cpu-8996: fix PLL clock ops
  clk: qcom: cpu-8996: change setup sequence to follow vendor kernel
  arm64: dts: qcom: msm8996: support using GPLL0 as kryocc input

 arch/arm64/boot/dts/qcom/msm8996.dtsi |   4 +-
 drivers/clk/qcom/clk-alpha-pll.c      |   5 +
 drivers/clk/qcom/clk-cpu-8996.c       | 145 ++++++++++++++++++--------
 3 files changed, 111 insertions(+), 43 deletions(-)

-- 
2.30.2

