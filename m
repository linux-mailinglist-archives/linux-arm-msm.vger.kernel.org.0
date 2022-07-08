Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D11856B019
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 03:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237142AbiGHBoZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 21:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237148AbiGHBoZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 21:44:25 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE282248DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 18:44:23 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id s1so28603120wra.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 18:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iNWV7Xx4/S+byFZQTV4Y16qHMAWvuFlUAUHfRfVh15A=;
        b=dsPJKz1lbrnQUyB1E+0nsNWacayIsjrACrFY0w/cxgP4eDNbBHnGINs8xngysLvKLE
         90lXmh9TIg6w0ObwWA5Vc/dEw9ES3yUJulHh2OmRwq4lAz2zXmgO8NfeBQ3GXr7wbSwS
         IBs3kywcGCepWz+1/ziJM2r0/VVQpsUqGCLlNIdboOUaphy2K6YLiSTa6kmUuTf9cqNw
         urKpnHnLGqpMIbPofXGgYmaue2d2JsbMJVb6nbMbtA9yxxtFV9I6rJxvgDbCobvK7ctS
         QXTCqNLhhUqRECyIfXaYWMgMaJYzNnfe+5QCFMAFH8SP2hwvmrVPLyhbyesrejSIiCfr
         +tEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iNWV7Xx4/S+byFZQTV4Y16qHMAWvuFlUAUHfRfVh15A=;
        b=rKvzlpJ8n5WBxLaDwtptUMonZWIzx/ktr4dUGzx4ykoNEIYoLI8/cWxEsWqRzZAIdP
         qL+h+4DLrQ0cPTf9wHNA+CWnPTVeRAb/K89+X3ROtqw2xbLdbakO8BG3V9ADpe2I4+/A
         rLpwdQUBp03WBNldW4y85qhbly/ai7IDRzK2NTsdcXenRt4i1hj2oQXAkOhGsHaQPdKF
         a1UeHKCoVN0GUs6HwbVeu7J/hvw4+0WR6hOwZuPU7ZSGkJSi9AU2uX2c/aj1r46yOaso
         6NElNRUhcZWVQcDleI4npkt3bAKKaH2fJpBVVtKKObWRxVJxvBh7+zutJxI1cpPEnxHs
         jLVA==
X-Gm-Message-State: AJIora8YRgfrCrietT5Iw1tMN4Esg/y/mZYHYEzbVDVuetsXPcK+x9Ea
        qYJZRkaoSM1zfsbWCTcbBHOWRQ==
X-Google-Smtp-Source: AGRyM1ujJPlNW0U1BoBPmFv1+4MTFcD5eR4iVWSPJO4ERtkLnpxavy+EgbWKpVCiqP7UuYn/tFum/w==
X-Received: by 2002:a5d:5244:0:b0:21d:866e:2409 with SMTP id k4-20020a5d5244000000b0021d866e2409mr714974wrc.400.1657244662337;
        Thu, 07 Jul 2022 18:44:22 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b10-20020a5d4d8a000000b0021d4aca9d1esm22732846wru.99.2022.07.07.18.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 18:44:21 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     ilia.lin@kernel.org, agross@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, stephan@gerhold.net
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 0/4] msm8939 cpufreq preparatory work
Date:   Fri,  8 Jul 2022 02:44:15 +0100
Message-Id: <20220708014419.2009018-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
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

V2:
- Previous series title "qcom-cpufreq-nvmem: Add msm8939 with some fixups"
  https://www.spinics.net/lists/linux-arm-msm/msg116201.html

- Drops adding msm8939 to the cpufreq-nvmem layer at all.
  cpufreq and CPR go hand in hand so we need to do the addition to
  cpufreq-nvmem in tandem with the associated CPR driver update. - Stephan

  We can still add in msm8939 to the cpufreq-dt-platdev block list and
  fixup the dt binding check errors found doing that.

- Adds a patch to the error reported by Rob's bot.
  Rob said he thought Krzysztof had a patch for that but, I couldn't find it
  so I just added a fix as the first patch - bod

- Adds Acked-by Rob to second patch
- Adds Acked-by Krzysztof to third patch

V1:
Fix up some missing compat strings for the qcom-cpufreq-nvmem yaml.
Add in msm8939 as a compatible qcom-cpufreq-nvmem.

Bryan O'Donoghue (4):
  dt-bindings: opp: opp-v2-kryo-cpu: Fix example binding checks
  dt-bindings: opp: Add missing compat devices
  dt-bindings: opp: Add msm8939 to the compatible list
  cpufreq: blocklist Qualcomm msm8939 in cpufreq-dt-platdev

 .../bindings/cpufreq/qcom-cpufreq-nvmem.yaml      |  7 +++++++
 .../devicetree/bindings/opp/opp-v2-kryo-cpu.yaml  | 15 +++++++++++++++
 drivers/cpufreq/cpufreq-dt-platdev.c              |  1 +
 3 files changed, 23 insertions(+)

-- 
2.36.1

