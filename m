Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90D54226164
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 15:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbgGTN4x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 09:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbgGTN4w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 09:56:52 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69312C0619D2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 06:56:52 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id q5so17950967wru.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 06:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=teTsd+lyniIxR48cY+GKFo5yHCS0LhKUIulvlmDYWnc=;
        b=NC6pn24FLGswMMMrIpYLJObmNy94hQTIxwG/LhPxWBep1bTaxct/kVtdNqYLyyhEOo
         wP0loCjWASsjV6AqubLqm6paWd8KdwHKkgw4pM8kqwT4KKUvfzUpSriA/TJck4Kmqe3i
         jIEYvArlbMVOBmI8NCuXQbdhp+hLQPo6NoAhGDZlfrRpQFuT0/tsP7Xi39Ee4sNaHk+U
         HYDWNGk2FnTwbcZKLdJ9Rhmj1ohWnihhIxkVGrpEkHlD54IWrl35tRPZRu22ssSCCHew
         3vm/By1CJ9hoXvzGvg3gZ79cPOPDAXwEx0r28khP0WcB0EF57m+gsDBYIbP0PBzgmj8Q
         aCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=teTsd+lyniIxR48cY+GKFo5yHCS0LhKUIulvlmDYWnc=;
        b=QmpNMDr69FlJxgRo2DANT8gzwYheOhKdBJiXcXUKpUoQ63W1+t3pX+ZazjgT8tfmUW
         3Sn2KS4+GNksRC24I1z3svNB5hL5lmus1XeAkQf/pn6TyjU7ELeb/cQZfgnEeokoIhvI
         lDa//IbiaFCpmD1fcbjrUd8eyMS6LkQQaxhiPpHyPQrp0nUsZOX+kGecXBIFnBWsT89y
         B7VpOB5gokmyseq0xO4AkI+NMGTzVQ+IIVgmy7nqiSuwWEE9qSyJYI5vlBDAOo7egNR9
         e159+FepsZ96naAF+Eq6pCzL7kmtVIllcA/StxjcZVa76ABTERsMYeWw3b24zfeTWTyU
         x7Iw==
X-Gm-Message-State: AOAM532yuihOii8BJrioj36Tu4AbdS0MmZ4rZb50eOgkPUoEvyruxBCy
        r0UlcjkKtJnR/oZJ8hKfmuuYKg==
X-Google-Smtp-Source: ABdhPJxONW60AOezRhV/7wUwc6Z/98omckHJGjfk4KqQ/Q6kYQ+jcgxzddYJnAl/T9fpOxsFZiciyA==
X-Received: by 2002:adf:fe85:: with SMTP id l5mr21311700wrr.333.1595253411068;
        Mon, 20 Jul 2020 06:56:51 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id d10sm32776743wrx.66.2020.07.20.06.56.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 06:56:50 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        amit.kucheria@linaro.org, bjorn.andersson@linaro.org,
        robh@kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v6 0/5] msm8996 CPU scaling support
Date:   Mon, 20 Jul 2020 16:02:15 +0200
Message-Id: <1595253740-29466-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series is a new tentative for adding MSM8996 CPU scaling support
based on the previous Ilia's series, with some of the latest comments
addressed.

This series has been tested with dragonboard-820c and cpufreq-bench.
The CPU opps are limited to maximum nominal frequencies (no turbo).

v2:
    - Converted dt bindings to YAML
    - Various fixes from Stephen inputs
    - Removed useless wmb barrier, MODULE_ALIAS
    - Use helpers like struct_size() and devm_platform_ioremap_resource()
    - Coding style fixes + comments
    - Kconfig: remove useless depends
    - Added Co-developed-by tag

v3:
    - Added Ilia and Rajendra s-o-b and contribution description

v4:
    - Rebasing on master
    - Removing obsolete cooling-min-level and cooling-max-level props
    - Align cpu trip nodes names with other boards
    - Fix trip types to passive for cpufreq

v5:
    - Fix reported 0-DAY CI issues, read_cpuid_mpidr usage requires ARM64 conf
    - Fix cpu_crit node labels
    - Dedicated patch for speedbin node name change
    - Added patch description for dtsi patch

v6:
    - Add Acked-by Will tag to l2 kryo accessors patch
    - Fix msm8996,apcc dt binding file (errors reported by dt_binding_check)

Ilia Lin (2):
  soc: qcom: Separate kryo l2 accessors from PMU driver
  dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996

Loic Poulain (3):
  clk: qcom: Add CPU clock driver for msm8996
  arch: arm64: dts: msm8996: Rename speedbin node
  arch: arm64: dts: msm8996: Add CPU opps and thermal

 .../bindings/clock/qcom,msm8996-apcc.yaml          |  54 +++
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 310 +++++++++++-
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.h                   |   6 +
 drivers/clk/qcom/clk-cpu-8996.c                    | 538 +++++++++++++++++++++
 drivers/perf/Kconfig                               |   1 +
 drivers/perf/qcom_l2_pmu.c                         |  90 +---
 drivers/soc/qcom/Kconfig                           |   4 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/kryo-l2-accessors.c               |  57 +++
 include/soc/qcom/kryo-l2-accessors.h               |  12 +
 12 files changed, 1010 insertions(+), 73 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
 create mode 100644 drivers/clk/qcom/clk-cpu-8996.c
 create mode 100644 drivers/soc/qcom/kryo-l2-accessors.c
 create mode 100644 include/soc/qcom/kryo-l2-accessors.h

-- 
2.7.4

