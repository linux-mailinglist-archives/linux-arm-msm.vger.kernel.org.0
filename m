Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 749316048F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 16:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232731AbiJSOSL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 10:18:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232853AbiJSORz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 10:17:55 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E065189CF4
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 07:00:51 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id f140so17317982pfa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 07:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OzAmFJUitT522Y1pMwEljBD9yHh+MrS0Tv4SZYF/11U=;
        b=a8Xhd+ArGyjvYWY5frIWpbb/ecNGCYPd7mpbXRTTZA6scDoaNxbKEd8qrby48Z8uJu
         Er5AvA2IBoGO9b2gZI+6rL5Tt4AeIJDtp9Xdupu+8O1HcjLlXirCgIuPuUuqCJ5P5QGQ
         L6S8UTL0sQ6i3OdxzomruA0s8QUU5YGDJJUbGPy0K2zgc3pWQqf9WP2ZfBWzDmSC+4jW
         gjH8TWVchZS1zNi+js3ax0z+FdOOhRREqA37n/oqA6nyEU/V/bMl6NPXnljJt7oUIjMy
         q25JDpfjhPfgZfafX5i1QUFAaYoMSCHU19vzxc5zWQ7n//J9grmDSRe6VlDxHpEns4fj
         +LLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzAmFJUitT522Y1pMwEljBD9yHh+MrS0Tv4SZYF/11U=;
        b=lzTF/yx06J8YIezbHEhl0y9EiPQGAUVkCXY4aY2Iea7uZzQI75qfY+Vilu4kd47m4l
         z0q8q2cN81KwI5w83j2O7hcbOKFB6YNpXBlGNEI64N+vj4tjy5oy+0cC52aV2PKdmpcE
         IL33onIM2Yy/GOktEecoSZOjOdbRs8hThhf1BLmx8iCxQ7oC5YUN5ILlGnqEstb7Yxm9
         VPE89HaL0YrTZArEelEa2qNk8rHytZ8ihgMiB+4G129JBTNSdm/OYIn3fvE5ccnJJWuB
         84Qake9Z5xkF6CNaaW6eHKG76/W+k4Is9ELHLiXGfRIZTxxkRuKlrBw6/J9HPhnVzJ7m
         p/oQ==
X-Gm-Message-State: ACrzQf0D304P6grxg6mYal/gSEZTx/8kDX9oG/bk6e05NDxFhQdsPDIy
        JVDeWwbAvu/3dgqEf9+8j05h
X-Google-Smtp-Source: AMsMyM4FRnEfHMnSGKSja2zW54o0AMPMEWL6DU12fRR0KMBMA5OQDJjdo/83d0CU/vTI9yGKcvtyGg==
X-Received: by 2002:aa7:810d:0:b0:563:1fa6:fecc with SMTP id b13-20020aa7810d000000b005631fa6feccmr8916163pfi.24.1666187977124;
        Wed, 19 Oct 2022 06:59:37 -0700 (PDT)
Received: from localhost.localdomain ([117.193.210.93])
        by smtp.gmail.com with ESMTPSA id 194-20020a6216cb000000b0053e199aa99bsm11240322pfw.220.2022.10.19.06.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 06:59:35 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, viresh.kumar@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, rafael@kernel.org,
        robh+dt@kernel.org
Cc:     johan@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/4] qcom-cpufreq-hw: Add CPU clock provider support
Date:   Wed, 19 Oct 2022 19:29:21 +0530
Message-Id: <20221019135925.366162-1-manivannan.sadhasivam@linaro.org>
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

This series has been tested on SM8450 based dev board and hence there is a DTS
change only for that platform. Once this series gets accepted, rest of the
platform DTS can also be modified and finally the hack on the OPP core can be
dropped.

Thanks,
Mani

[1] https://lore.kernel.org/lkml/YsxSkswzsqgMOc0l@hovoldconsulting.com/
[2] https://lore.kernel.org/lkml/20220801054255.GA12039@thinkpad/t/

Manivannan Sadhasivam (4):
  cpufreq: qcom-hw: Remove un-necessary cpumask_empty() check
  dt-bindings: cpufreq: cpufreq-qcom-hw: Add cpufreq clock provider
  cpufreq: qcom-hw: Add CPU clock provider support
  arm64: dts: qcom: sm8450: Supply clock from cpufreq node to CPUs

 .../bindings/cpufreq/cpufreq-qcom-hw.yaml     | 12 ++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |  9 +++
 drivers/cpufreq/qcom-cpufreq-hw.c             | 72 ++++++++++++++++---
 3 files changed, 84 insertions(+), 9 deletions(-)

-- 
2.25.1

