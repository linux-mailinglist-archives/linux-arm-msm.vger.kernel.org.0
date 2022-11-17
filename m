Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEC0862D2B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 06:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233742AbiKQFb6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 00:31:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiKQFb5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 00:31:57 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477F4532C6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 21:31:56 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso900257pjt.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 21:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7oPr2c5sFjkGMsgr2UPxb1pE9bvOecjFKXm2LmIgOts=;
        b=D156S2K69hV/6I7Gnhas5LRMf/1HeHCRR6mF9kHXuGKmbVj+03aTzr9DUECHUOXQha
         2Vfu7ELiV13A6ODirlbwv3BmXf6udj+Oe+gQKOOEI05PfKFipqvM8FrFKc1Dw0cXOBhV
         2HmVnvpEtF3QVsXMIRkNEl+ni+O7w/DPOqyerfNlU0Bt2aldI7MLSwjLevjfvLJKwVEY
         DQZ7SU/cxtR6L6MyDmT8dicCsfcZP1hk86DbBQG2H4m8u8xk0hHj+BdzwJErD/c3S8fC
         f+eu5r+uIDGRTBeUwd4jia0qn+v64ncYmMGpoQtzONp+palhU1fRWxds6B3KCTrGsP1p
         TFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7oPr2c5sFjkGMsgr2UPxb1pE9bvOecjFKXm2LmIgOts=;
        b=oZlaHVcM9WE+s7WOOFco+ky6Wmg048yn0mYB5lMG8nBk4ieWxjwKplVqesLDi3o3Xb
         ejcu1LBH34fx4EdeH/WFgs4EHGCqwxu+cJSF/F/aky7SS3Xl28yL4VULe1BqutyQ6GGk
         xj6fiCaL0Y3RG0b/aNsnWhSw/XHsnYPYEoOzqwGatNWhf9134OVfApczoQQarPS8uAUO
         34hAztdtU5bWxrFPFTrXXO+wDZk9jy3zB4H3hVyFaUFOzanBAIvbGjI+ZafMnhRmxGTq
         mE6gbSxM2+3sfhM5xYnZl1Qa9pjDoKAS9mCdBPW4rKM0r/DKiP9/FPDaGfcRWKmYjUub
         pVmg==
X-Gm-Message-State: ANoB5pk+CdVVOZkF+DvHc0KmS0q2rV2oI+iiiM1pPIqvcQLiCSgeuaOU
        WQvg+i5W8Xn7FNq7pvywAwZ2
X-Google-Smtp-Source: AA0mqf7M4odCBsOw9ycvH+5mwO2zaa78y+/Y+XY0Cny6ZmRSUdTkjtaAoOkKpU93SzgySuz9tG37BA==
X-Received: by 2002:a17:90a:bb16:b0:200:2d7f:18c2 with SMTP id u22-20020a17090abb1600b002002d7f18c2mr1211167pjr.106.1668663115721;
        Wed, 16 Nov 2022 21:31:55 -0800 (PST)
Received: from localhost.localdomain ([117.193.208.31])
        by smtp.gmail.com with ESMTPSA id q4-20020a17090311c400b001865c298588sm96600plh.258.2022.11.16.21.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 21:31:54 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, viresh.kumar@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, rafael@kernel.org,
        robh+dt@kernel.org
Cc:     johan@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v7 0/4] qcom-cpufreq-hw: Add CPU clock provider support
Date:   Thu, 17 Nov 2022 11:01:41 +0530
Message-Id: <20221117053145.10409-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
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

Hello,

This series adds clock provider support to the Qcom CPUFreq driver for
supplying the clocks to the CPU cores in Qcom SoCs.

The Qualcomm platforms making use of CPUFreq HW Engine (EPSS/OSM) supply
clocks to the CPU cores. But this is not represented clearly in devicetree.
There is no clock coming out of the CPUFreq HW node to the CPU. This created
an issue [1] with the OPP core when a recent enhancement series was submitted.
Eventhough the issue got fixed in the OPP framework in the meantime, that's
not a proper solution and this series aims to fix it properly.

There was also an attempt made by Viresh [2] to fix the issue by moving the
clocks supplied to the CPUFreq HW node to the CPU. But that was not accepted
since those clocks belong to the CPUFreq HW node only.

The proposal here is to add clock provider support to the Qcom CPUFreq HW
driver to supply clocks to the CPUs that comes out of the EPSS/OSM block.
This correctly reflects the hardware implementation.

The clock provider is a simple one that just provides the frequency of the
clocks supplied to each frequency domain in the SoC using .recalc_rate()
callback. The frequency supplied by the driver will be the actual frequency
that comes out of the EPSS/OSM block after the DCVS operation. This frequency
is not same as what the CPUFreq framework has set but it is the one that gets
supplied to the CPUs after throttling by LMh.

This series has been tested on SM8450 based dev board with the OPP hack removed
and hence there is a DTS change only for that platform. Once this series gets
accepted, rest of the platform DTS can also be modified and finally the hack on
the OPP core can be dropped.

Thanks,
Mani

[1] https://lore.kernel.org/lkml/YsxSkswzsqgMOc0l@hovoldconsulting.com/
[2] https://lore.kernel.org/lkml/20220801054255.GA12039@thinkpad/t/

Changes in v7:

* Added a patch that returns the throttled frequency for cpufreq_driver->get()
  callback (Sudeep & Viresh)
* Added error check for kasprintf and allocated the clk name locally

Changes in v6:

* Removed the local variable clk_name (Matthias)
* Added the clock id to the error message of devm_clk_hw_register()

Changes in v5:

* Switched to Hz unit for the CPU clocks

Changes in v4:

* Rebased on top of cpufreq/arm/linux-next branch

Changes in v3:

* Submitted the cpufreq driver cleanup patches as a separate series as
  suggested by Viresh
* Removed static keyword from clk_init_data declaration

Changes in v2:

* Moved the qcom_cpufreq_data allocation to probe
* Added single clock provider with multiple clks for each freq domain
* Moved soc_data to qcom_cpufreq struct
* Added Rob's review for binding

Manivannan Sadhasivam (4):
  dt-bindings: cpufreq: cpufreq-qcom-hw: Add cpufreq clock provider
  arm64: dts: qcom: sm8450: Supply clock from cpufreq node to CPUs
  cpufreq: qcom-hw: Add CPU clock provider support
  cpufreq: qcom-hw: Fix the frequency returned by cpufreq_driver->get()

 .../bindings/cpufreq/cpufreq-qcom-hw.yaml     | 12 +++
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |  9 ++
 drivers/cpufreq/qcom-cpufreq-hw.c             | 87 ++++++++++++++++---
 3 files changed, 95 insertions(+), 13 deletions(-)

-- 
2.25.1

