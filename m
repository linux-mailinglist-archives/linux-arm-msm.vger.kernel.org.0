Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71EC04D3D2A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 23:40:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238782AbiCIWkw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 17:40:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233941AbiCIWkw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 17:40:52 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BBC2120F7A
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 14:39:52 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id w12so6300225lfr.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Mar 2022 14:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DQZKBK074A8TFSyYxr2OkPnyn2MB2fIT3PRZzlPro58=;
        b=TWYq/B8i0x1RGd4xJ7dZNnNlKRw6Qs5ACTLfrIMG/k62l74ASgF7HenXPTdt/SdE0a
         uw0CdD0B4ZNN5/skVdtab8lhKgu06KbrfEsmf2PlrbzzdjHCa0qk/hSn5CkiNZRMiSXR
         +FtLS8K/Xo8klcuUQDynwVmNGc6DXvUTzRxv3PmU+I3EFZ5C0Rx9fHwM4azKbwaT5KSq
         gFy1f8KRD9qIOSOeQyWqGlovbp7s1qQ1QCZBWiJ4rXv8zXbT95IUjyQxCHOn6a2ul/yL
         /GjiMpz/s3fRjerYCbgawpFUejIWu+/wEMibKHKdDJhOVXqST+byXaBuP/+4bA0lvi+S
         Diig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DQZKBK074A8TFSyYxr2OkPnyn2MB2fIT3PRZzlPro58=;
        b=YAeg0Ha2RkJ4U3R4apeP64jLU03YI3l0wT0n4SElzBh3TgCtq+FjOI5AZfgjAe1RfP
         szmlBL7GAtlR1/Gi03bGgNsjUNdARxUmMrGJWvFacHt9YfgLMI2qorqFDLP1HY8siAiC
         DXNIAFUZxoQrpOHpE2Jf0Bf6ELQESJKGjylT53eRF06dtPq4+stxVVn1T3GRzyZVvCQo
         EsTEB7T1WAsrgBB8QGacdfemMHRi/LHlMQk2J/XSfkqsqUAjOQP6Q2XZT0AzNdlpH1Ch
         rH9VvoON8KmXZLZlO8WL2R6blu2tjnd/igB7nV9tnVxVOo0clXyxkHQr21i+Myx2gFU7
         GQVA==
X-Gm-Message-State: AOAM530JWeqDVpWW0CAmuH7Jv0xBokxuRfU9MS2U2Pxy/CQxealTGajt
        c6P6oFlLqJUg7KiLqDTgBRd8fg==
X-Google-Smtp-Source: ABdhPJxgEsqe8Ds7AHWdsjR1GGA/1opBZlNnxsNz2vvyHcizxkfTgrlgiGeDywplly4A/vkQMeyszw==
X-Received: by 2002:a05:6512:ba6:b0:42a:84ee:d9d9 with SMTP id b38-20020a0565120ba600b0042a84eed9d9mr1177557lfv.353.1646865590554;
        Wed, 09 Mar 2022 14:39:50 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b24-20020a196458000000b004483734e0afsm621036lfj.12.2022.03.09.14.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 14:39:49 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Thara Gopinath <thara.gopinath@gmail.com>
Subject: [PATCH v2 0/4] cpufreq: qcom-hw: Fixes for cpu hotplug support
Date:   Thu, 10 Mar 2022 01:39:34 +0300
Message-Id: <20220309223938.3819715-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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

This patchseries aims at fixing and improving CPU hotplug support on
Qualcomm platforms. First three patches are the fixes for the LMH
support in the cpufreq driver. The last patch adds support for
lightweight offline() and online() callbacks which are used instead of
exit() and init() each time the CPU is put offline or back online.

Changes since v1:
- Update commit message for the first patch to describe why dropping
  affinity hint is required (before calling free_irq()),
- Fixed commit message for the second patch to include messages
  generated using the mainline kernel w/o additional patches,
- Changed third patch to use dev_warn_ratelimited(),
- Reworked last patch to move request_irq/free_irq to online()/offline()
  to make sure that the IRQ isn't left enabled after the CPU has been
  put offline.

Dmitry Baryshkov (4):
  cpufreq: qcom-hw: drop affinity hint before freeing the IRQ
  cpufreq: qcom-hw: fix the race between LMH worker and cpuhp
  cpufreq: qcom-hw: fix the opp entries refcounting
  cpufreq: qcom-hw: provide online/offline operations

 drivers/cpufreq/qcom-cpufreq-hw.c | 78 +++++++++++++++++++++++++------
 1 file changed, 64 insertions(+), 14 deletions(-)

-- 
2.34.1

