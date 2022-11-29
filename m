Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED03D63BA60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 08:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbiK2HM4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 02:12:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbiK2HMz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 02:12:55 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D4701FCCF
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 23:12:54 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id r18so12173072pgr.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 23:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1BYbRDXPGcQcPqTkrRbe5deFveMBdsfHu4xmu6DCjgI=;
        b=mdX4Jq7Gyk1rEVAiudR1pYpqGjGHLrK89wTJNOntjp4sXsiU4+okSAw+FpWlqCBCV1
         ZRwRftH+oNnCAGs6Naumkg7aXI5oJPJMAqCuiHQoZ7vg1m2IfVI4BZZrKxrF1WkxDGji
         A6Kx9Na35bj7jVToM02a1ogZNGqcagtlxZgch0VxfvclH3edHEk/GSj5oL0nHq0KNOKG
         CLZERW3VUPDAc14NF8MOt76ZAkCC5mo4DTyK3TzhVqkO5i6gfEco2rCShOeeZAkUmk3S
         o5up2fwoTw8lRRy/S1oGpqPnH2XFiE8Wj+C+DfeN7Utkm+JKf4FVF5hO+COr6qp66xZg
         i+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BYbRDXPGcQcPqTkrRbe5deFveMBdsfHu4xmu6DCjgI=;
        b=ujwl2lATeyRFSTzKiXS76VdGl/wMZTmp5/7VDKlyUpLv/OLGdZX5Mb7Pz8FY45eROT
         hLKjrF3yYeEL0D3YwMxIaQ5YbvNg0rbjlI3r7YvoojXqyFt8XTSE7cMjYYaRLGuXRRw7
         hBgwoDbcf9bcn7Kpy9xQWKBeEk1Q8NLadNaY6X5ojyx7SITZxWGA+AZIU4J6UX277tfa
         HsmaZz21BvyvLyfv+gw02SQXhYhT3wUudkLdRR3q8sxBSpOuiNSdQ8w3G/aV8KZC2n6b
         M0t8/4oaHhjvhLGjTs1Ql9YrDolAhwMRFQpU/JDjYEzcD0cFJkFH600G5QpWUcHq4icu
         5SyA==
X-Gm-Message-State: ANoB5pmhNa5EGLmS6qLYKGhRS7bXK6D2RPk1jC1/b57Vvai81NaVbh1H
        3X1pYGtKtduIqQJqpBYODeXq
X-Google-Smtp-Source: AA0mqf5kR2s3CRihNNEGNGCFgRcYag0fXK4jste277loSBYWcTYuwsAmeukb9ePjg76TXasGspwCwg==
X-Received: by 2002:a63:f845:0:b0:478:1187:b58 with SMTP id v5-20020a63f845000000b0047811870b58mr8757510pgj.43.1669705973588;
        Mon, 28 Nov 2022 23:12:53 -0800 (PST)
Received: from localhost.localdomain ([117.248.1.95])
        by smtp.gmail.com with ESMTPSA id u6-20020a170903124600b00188fc6766d6sm10009264plh.219.2022.11.28.23.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 23:12:52 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, bp@alien8.de, mchehab@kernel.org
Cc:     james.morse@arm.com, rric@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_saipraka@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 0/3] Fix crash when using Qcom LLCC/EDAC drivers
Date:   Tue, 29 Nov 2022 12:41:58 +0530
Message-Id: <20221129071201.30024-1-manivannan.sadhasivam@linaro.org>
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

This series fixes the crash seen on the Qualcomm SM8450 chipset with the
LLCC/EDAC drivers. The problem was due to the Qcom EDAC driver using the
fixed LLCC register offsets for detecting the LLCC errors.

This seems to have worked for SoCs till SM8450. But in SM8450, the LLCC
register offsets were changed. So accessing the fixed offsets causes the
crash on this platform.

So for fixing this issue, and also to make it work on future SoCs, let's
pass the LLCC offsets from the Qcom LLCC driver based on the individual
SoCs and let the EDAC driver make use of them.

This series has been tested on SM8450 based dev board.

Thanks,
Mani

Changes in v5:

* Added fixes tag and CCed stable mentioning the dependency
* Added a patch to fix the build error with COMPILE_TEST

Changes in v4:

* Dropped the patches that were already applied
* Rebased on top of v6.1-rc5

Changes in v3:

* Instead of using SoC specific register offset naming convention, used
  LLCC version based as suggested by Sai
* Fixed the existing reg_offset naming convention to clearly represent
  the LLCC version from which the offsets were changed
* Added Sai's Acked-by to MAINTAINERS patch
* Added a new patch that removes an extra error no assignment

Changes in v2:

* Volunteered myself as a maintainer for the EDAC driver since the current
  maintainers have left Qualcomm and I couldn't get hold of them.

Manivannan Sadhasivam (3):
  soc: qcom: Select REMAP_MMIO for LLCC driver
  EDAC/qcom: Remove extra error no assignment in qcom_llcc_core_setup()
  EDAC/qcom: Get rid of hardcoded register offsets

 drivers/edac/qcom_edac.c           | 119 ++++++++++++++---------------
 drivers/soc/qcom/Kconfig           |   1 +
 include/linux/soc/qcom/llcc-qcom.h |   6 --
 3 files changed, 60 insertions(+), 66 deletions(-)

-- 
2.25.1

