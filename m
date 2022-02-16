Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E36664B89E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 14:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234254AbiBPN27 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 08:28:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234252AbiBPN26 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 08:28:58 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4360D163D7A
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 05:28:44 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d17so2189595pfl.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 05:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ZHriclNHcfARQz6gk+CKow6808MH12Lwf6CagzPJ1w4=;
        b=S33hEt2BQqVZwAaMgLA3TC48JP7dGWC8DEtm950f/BsYz9JouJKrpFDIJFRlIh2REH
         SYCjtdDGjxf95DrVarpNfYrRsLEVu14eOpD+EiN4Gt8YytXbmmFPuoICt9mDoAzHKDeR
         Ot6M7gQuDlbfMNZVxApkzWiAjIzAG354CFIWlHNrhe/sbZDS+AKEqDZGOkGZR42WYdEN
         M/mDcDHNYybR8Urc5J8oZs37i6wYlFmRjCfB9FtGjrlxjhvXdIYUWoWudFFizPx97OsI
         bMhvghSPYSqKW/ZnB6xrA4qqZHf7BDkJiZUT/UP6W4jHFoitvdoZBob7l5zXDJmpnhHW
         +Yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZHriclNHcfARQz6gk+CKow6808MH12Lwf6CagzPJ1w4=;
        b=21JQ47HQx+GCBAPvfZRRJ7Au3Xk2EwU9yc9CXissFL3PRVT17Nihgxbkaqi6Ki1KKQ
         SpNInL0Du8mt5IR4tYUyGnw9KEuobio66JLTqQ7Rcdp5VvwCNXmXxssjhI0AC7fuL4l8
         y5i9HVUrgbL/wPzOw6b5FblPm2ymd0lJfX/hO+NrtDfUnZSk1h78LVRli8ntzJPQfSHj
         auDIfpSSgQZOHGcSzT2SiGYrn2AJCVYA8x2tP3fwMoZOf3xiCtgW7sSAHrp8z+s+cVJA
         VhoxjXtTXvCr7cS+UfPkN6qCz8vYjBWKFIzIgM2lXMHlFhxForSOvWVAqg8idJyx6Jnj
         gv3w==
X-Gm-Message-State: AOAM533X4Z8ExHCsxdkvjmHFXNcaGKQ2DsM4b/YbYJEjIHcz4u438oz3
        c5IOzBb72Dg7TlMMXrCYtmFZfw==
X-Google-Smtp-Source: ABdhPJwt9lYtZUjk6IffBKsOdSQJFfowDAqL0A2WjhfYRVtb1TKU9CDq9yu7NN64OkGcK133Cy+bYw==
X-Received: by 2002:a63:e817:0:b0:373:8abb:2c51 with SMTP id s23-20020a63e817000000b003738abb2c51mr215900pgh.185.1645018123746;
        Wed, 16 Feb 2022 05:28:43 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id c68sm5431002pga.1.2022.02.16.05.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 05:28:42 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc:     Maulik Shah <quic_mkshah@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v5 0/3] Add Qualcomm MPM irqchip driver support
Date:   Wed, 16 Feb 2022 21:28:27 +0800
Message-Id: <20220216132830.32490-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It starts from updating cpuidle-psci driver to send CPU_CLUSTER_PM_ENTER
notification, and then adds DT binding and driver support for Qualcomm
MPM (MSM Power Manager) interrupt controller.

Changes for v5:
- Drop inline attributes and let compiler to decide
- Use _irqsave/_irqrestore flavour for spin lock
- Assignment on a single for irq_resolve_mapping() call
- Add documentation to explain vMPM ownership transition
- Move MPM pin map data into device tree and so use a generic compatible
- Drop the code that counts CPUs in PM and use CPU_CLUSTER_PM_ENTER
  notification instead

Changes for v4:
- Add the missing include of <linux/interrupt.h> to fix build errors
  on arm architecture.
- Leave IRQCHIP_PLATFORM_DRIVER infrastructural unchanged, and use
  of_find_device_by_node() to get platform_device pointer.

Changes for v3:
- Support module build
- Use relaxed accessors
- Add barrier call to ensure MMIO write completes
- Use d->chip_data to pass driver private data
- Use raw spinlock
- USe BIT() for bit shift
- Create a single irq domain to cover both types of MPM pins
- Call irq_resolve_mapping() to find out Linux irq number
- Save the use of ternary conditional operator and use switch/case for
  .irq_set_type call
- Drop unnecessary .irq_disable hook
- Align qcom_mpm_chip and qcom_mpm_ops members vertically
- Use helper irq_domain_translate_twocell()
- Move mailbox requesting forward in probe function
- Improve the documentation on qcm2290_gic_pins[]
- Use IRQCHIP_PLATFORM_DRIVER infrastructural
- Use cpu_pm notifier instead of .suspend_late hook to write MPM for
  sleep, so that MPM can be set up for both suspend and idle context.
  The TIMER0/1 setup is currently omitted for idle use case though,
  as I haven't been able to successfully test the idle context.

Shawn Guo (3):
  cpuidle: psci: Call cpu_cluster_pm_enter() on the last CPU
  dt-bindings: interrupt-controller: Add Qualcomm MPM support
  irqchip: Add Qualcomm MPM controller driver

 .../interrupt-controller/qcom,mpm.yaml        |  94 ++++
 drivers/cpuidle/cpuidle-psci.c                |  13 +
 drivers/irqchip/Kconfig                       |   8 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/qcom-mpm.c                    | 440 ++++++++++++++++++
 5 files changed, 556 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
 create mode 100644 drivers/irqchip/qcom-mpm.c

-- 
2.17.1

