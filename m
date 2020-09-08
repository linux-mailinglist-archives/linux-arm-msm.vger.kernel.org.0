Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78243260D01
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 10:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbgIHH5i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 03:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729729AbgIHH5c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 03:57:32 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D95C061757
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 00:57:31 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id l126so3270081pfd.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 00:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ITdkk36tx9oBNoeh+htptP26+GpLBLf3As2BXQ4eM1k=;
        b=CLdfO9RzXJzpfk8lmE2Wst3FdItUkCfAYmuowNuE88a7a1WPiN6S9D5Z3S/rzKmDLM
         haVL+hkxhNc+BfT6GpMVG4VRBJTFkKHn6vsyrMuSKCO241m+QripjjpGjtO8IABKQDI6
         7T/IJbulr09PZ59rrhIa4yASomd9RbTXUD8b1R5Hw8orz8J8Q+Ella/jW9+o+LhszXYf
         fhidD76Q8Tr+DXLcTeCxUj+F2HJJCXx1QmoYQokl+ziA+k0xaUrLEA96WofYQaS+xqG0
         /ESezN1Pf0+wA6FkZrXvYkVYhUqZpzxHymCNtZuaoJiP8PjTI/ZflhvJ/f/AAcWSTz6I
         mchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ITdkk36tx9oBNoeh+htptP26+GpLBLf3As2BXQ4eM1k=;
        b=m+aMsRU+4OKsPJJ6mOxutRVOvChY6TKYzrUY/E5BdGjdqFXi/aj0Q/OR4S04Uuu2NN
         qadDgMRyUT3/iqrQQhsu8Tth6X39eqyboUz4ixI+P5rthQLxdpos7HbkUhUoOJ/25yRc
         xQO/xG2EvuaJBfHOw6OXfI7p+FEn9gpb0rlNbBM4Nqk+XYQigGFX02JSr0X1BNcD2so4
         a49h9MwCFCJJc3QlhMO+OXUOCnmrUb13TS8U8huH+hFYUZcWdNmF7Qy2K7sheZh25xx3
         kPsUMSAY8eHAhWxIMZMnkWHBXlUooujcXpCob3QKY0zjdzWgMaAYbIAomMXsikeOg+92
         RbbQ==
X-Gm-Message-State: AOAM531XAbz/61zGsHPM1Hh11anv5byDGOpNVMyb8xKEODT11Hb9g4Vk
        DpmGJIZTqzbXjnGbLADNfj2s
X-Google-Smtp-Source: ABdhPJxQqQutMxwbopIVDuWQ82nAqur0M9bIpK2rrrtnp1TxBVoi90q3P+vr1rg4AlMOCvDjvycO5Q==
X-Received: by 2002:a17:902:6945:: with SMTP id k5mr2325037plt.131.1599551850609;
        Tue, 08 Sep 2020 00:57:30 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id m21sm7560154pfo.13.2020.09.08.00.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 00:57:29 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     rjw@rjwysocki.net, viresh.kumar@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     amitk@kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
        tdas@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/7] Add CPUFreq support for SM8250 SoC
Date:   Tue,  8 Sep 2020 13:27:09 +0530
Message-Id: <20200908075716.30357-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This series adds CPUFreq support for Qualcomm SM8250 SoC. The existing
qcom-hw driver is reworked to support the EPSS block on this SoC which
handles the CPUFreq duties.

The EPSS block supports additional features for which incremental patches
will be submitted on top of this series!

Thanks,
Mani

Bjorn Andersson (1):
  arm64: dts: qcom: sm8250: Add cpufreq hw node

Manivannan Sadhasivam (6):
  dt-bindings: cpufreq: cpufreq-qcom-hw: Document SM8250 compatible
  cpufreq: qcom-hw: Make use of cpufreq driver_data for passing pdev
  cpufreq: qcom-hw: Make use of of_match data for offsets and row size
  cpufreq: qcom-hw: Use regmap for accessing hardware registers
  cpufreq: qcom-hw: Add cpufreq support for SM8250 SoC
  cpufreq: qcom-hw: Use devm_platform_ioremap_resource() to simplify
    code

 .../bindings/cpufreq/cpufreq-qcom-hw.txt      |   2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  22 +++
 drivers/cpufreq/qcom-cpufreq-hw.c             | 160 +++++++++++++-----
 3 files changed, 143 insertions(+), 41 deletions(-)

-- 
2.17.1

