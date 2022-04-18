Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBC3505C5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 18:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346112AbiDRQZK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 12:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239069AbiDRQZJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 12:25:09 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 165EE2ED59
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 09:22:30 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id u3so19134354wrg.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 09:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=87fivufv+so6yKZtxUBhcGonieGouXYN8K2+TCVK0ss=;
        b=PeItOQ6+HTRiACn1qDrDWjBev3e8pjsy0JJwE69tnHzKfIlask4Y2mJf5Ok/6OHPvJ
         wKJKH//k8pTKkAGqWfM7dh2HXdpjX64qz1CoccHT1Q5uSph7HWJQ1CEyxEqXGeeno7e0
         HSfcvWIuRCbipz9k4bDuqRwJcEMjLT1JUGOTd9iBL093bLskSExhM9lg7XHebMU+Kgge
         wJ4RzTRn3IGhPoiRGFoztzRXQfsZz6L5nS6c8Je9ZecmRgQIai5i1t1WsH403y2/iSxW
         3PBD6GiNSOcPF86XyzhaNo1pvZcNwoK37mg0CtrCGxNaKKpTzGGBmKY2oEkezCFG6KJ4
         JZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=87fivufv+so6yKZtxUBhcGonieGouXYN8K2+TCVK0ss=;
        b=Z93G9Mu2+yIHsZX7sVFB6MPxVatpo+qd74SNNDTtIhl6irTc7JdFJiJEHOOKdR8pXd
         bzUQezokeqK8qFoC4NJRZa2moOI2Ov68hmxUkwFQITvhEJnAefeVBYV2XS5FS7Lxuww3
         YM5UY71jOUCsxyjB+3LTIID3FieXsQtY9CCqc4Ipi8BkZBrPhJlfGA+FlicQTf8ALlOd
         dEJuEX8Rt7XOf2RKgNbU4wl8ul7vf1OCbSb0w4gVVfoe+7ZhvpFo2dcf5CeCzPePQjC6
         uASZTlPS1JJlRJ5hhrVmp/cygqyfaAUuA/b4nbmJsTq+r9G50fRGdcc2W0C3I4E6VdwX
         ksrQ==
X-Gm-Message-State: AOAM533m4FBgwgypHzWwicrIjEeOPuIEWxcHDN38a0TOExmYQfobnRbY
        KuOUqC/c2nHGN4IAKvYGXBAZV4TpfV0YRA==
X-Google-Smtp-Source: ABdhPJwQc9dV88o70RWZPUPICkBZwssgDGng+SnWVz63m3b3vZJ87go4O1jhRoU9FYgVh+pDubEWoA==
X-Received: by 2002:a5d:5487:0:b0:20a:8f45:8f34 with SMTP id h7-20020a5d5487000000b0020a8f458f34mr6361256wrv.699.1650298948651;
        Mon, 18 Apr 2022 09:22:28 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 205-20020a1c02d6000000b003928c42d02asm8460853wmc.23.2022.04.18.09.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 09:22:28 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ilia.lin@kernel.org,
        rafael@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH 0/5] qcom-cpufreq-nvmem: Add msm8939 with some fixups
Date:   Mon, 18 Apr 2022 17:22:21 +0100
Message-Id: <20220418162226.2983117-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix up some missing compat strings for the qcom-cpufreq-nvmem yaml.
Add in msm8939 as a compatible qcom-cpufreq-nvmem.

Bryan O'Donoghue (5):
  dt-bindings: opp: Add missing compat devices
  dt-bindings: opp: Add msm8939 to the compatible list
  cpufreq: blocklist Qualcomm msm8939 in cpufreq-dt-platdev
  cpufreq: qcom-cpufreq-nvmem: Rename qcs404 data to cpr_genpd
  cpufreq: qcom-cpufreq-nvmem: Add msm8939 as cpr_genpd

 .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml  | 8 ++++++++
 drivers/cpufreq/cpufreq-dt-platdev.c                     | 1 +
 drivers/cpufreq/qcom-cpufreq-nvmem.c                     | 9 +++++----
 3 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.35.1

