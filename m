Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAC34CF224
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Mar 2022 07:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234344AbiCGGqh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Mar 2022 01:46:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233480AbiCGGqg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Mar 2022 01:46:36 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20B6B5FF09
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Mar 2022 22:45:43 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id v1-20020a17090a088100b001bf25f97c6eso5830014pjc.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Mar 2022 22:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wVn4uRZg+YKMfOFAeldUGJ/LiriTwdJu0U1lZacIdDM=;
        b=hzTSvFPxpPwjQyJ0VHtasLUo5yjoprO+oZRWY2rlqxyjk6wBrS5NqxKNGzgj/Ml5vN
         UFfes1wlgu42sm4Nwo9hISosEBtYjOA6jjc2UcWPVyufUymbwnRUF/8aWqgN0G1P/dkK
         AIPcGN6BBwRATGAS8aVyvEWiQIpwDy4pkb6K6fIdvIpZStBh6HXtYrg3Vk599w9dzU2C
         PquWW2v+jTNwxox2jj7QUtKRGLiMdymXdPfpkYQWeTz0plfhQrkWk2pykzGcuGFhnZ3+
         Zz68MCoSP+IosX7xlT//nEZTyhIRH88mu298OaqUBVnF9ldZVYmCpwM8x3ABJdkhIPjR
         W8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wVn4uRZg+YKMfOFAeldUGJ/LiriTwdJu0U1lZacIdDM=;
        b=k7fGUtVMF/xDOHsOGpbSxlQZkoowDZN8U0bhA4cJESOcasyvTgxHaXw2RujCabykoF
         OnBJLaRufCI9wBK4GomaC2ulUjqL83XYkKsKX1L4CfoYabpErJP7CqI4I6D4Mun5ds/b
         QeJr4xV+lS4tm3h4Xo49u3LU/SRLLyBFtF/av9s06daiIMVAmE0Y/+HXBKKfns2nKSz1
         1btoRlYH8ZAOFrhkLRO2is4n98wXT8oXllHJz5AbpMUljlaa0Km+mxDlZvfCKyv4sygX
         Cvap1V87jSzLnmMRUa2eDbY4iUEW0WrRfIGAEVTe6RdROCw0+ybd7hpXzm56aWvvTOWj
         Ankw==
X-Gm-Message-State: AOAM530+vttn4S4fP9GyAst7S57L6FYfNnWUD4c7CZ+lkbwzcE1cW0EY
        ey+SBtnBubYH0u2wjk7HI6gc
X-Google-Smtp-Source: ABdhPJyzWieNmuO9fHFMVJFZ9QSFUaen3fJwQ2r0++wW5LU0X1MofBMi6GvvZxI9PjVUoFCkR+/nlg==
X-Received: by 2002:a17:90b:1052:b0:1bf:5024:c2a7 with SMTP id gq18-20020a17090b105200b001bf5024c2a7mr6473564pjb.218.1646635542531;
        Sun, 06 Mar 2022 22:45:42 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.157])
        by smtp.gmail.com with ESMTPSA id s7-20020a056a00178700b004e1a15e7928sm15841940pfg.145.2022.03.06.22.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 22:45:42 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     rafael@kernel.org, viresh.kumar@linaro.org, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] Convert Qcom CPUFREQ HW binding to YAML
Date:   Mon,  7 Mar 2022 12:15:29 +0530
Message-Id: <20220307064531.47678-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
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

Hi,

Patch 1/2 was submitted separately [1] but Rob's bot reported errors related to
the performance domain binding that used Qcom CPUFREQ as an example. But Qcom
CPUFREQ driver doesn't support the generic performance domains yet.

So I've added a patch 2/2 that fixes the warning by using MediaTek CPUFREQ as
the example and added both patches to this series.

Thanks,
Mani

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20211005044920.78544-1-manivannan.sadhasivam@linaro.org/

Manivannan Sadhasivam (2):
  dt-bindings: cpufreq: cpufreq-qcom-hw: Convert to YAML bindings
  dt-bindings: dvfs: Use MediaTek CPUFREQ HW as an example

 .../bindings/cpufreq/cpufreq-qcom-hw.txt      | 172 ---------------
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml     | 201 ++++++++++++++++++
 .../bindings/dvfs/performance-domain.yaml     |  14 +-
 3 files changed, 211 insertions(+), 176 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml

-- 
2.25.1

