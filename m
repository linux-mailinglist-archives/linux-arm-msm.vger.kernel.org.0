Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20C38706712
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 13:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbjEQLqs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 07:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbjEQLqr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 07:46:47 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A8A40E1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 04:46:44 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-24de9c66559so602559a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 04:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684324004; x=1686916004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RFzuu4N5fQjgRDDnnSeSZLGRU4lI0OQgLcecIxUQhiw=;
        b=zbIyMbv7Wj7QKL0JlRXH1I1LWAzjbwqYQZELjaaH5JBLnOMywqLLxlnqGGz90Nv0YD
         cOaR0Vx97w3xYx/z/lHkW5pzUvjdB+AJHz65heCAKNVgbhqhKDxsJSjSjytEebiU2iHD
         51P7j7JRY8echQFn1xXxQG9WyTGTCOn2WxfOMSukSGGugX8Ml1+Bqyk9eTQ/P/OfAdqH
         VUMfS2zM7xQOBj0hjfUYpc5NVV9GYPgw4FUDMfeyNQohgzo9d5MoosOeuSC8wySKOu4b
         yUSLoKvwWrXwQLSRFvboh2RvJPVo3mHI/VzPCGrcjWwK6mKvOoLEkOTtbX1Z0bZrMEA2
         2XgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684324004; x=1686916004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFzuu4N5fQjgRDDnnSeSZLGRU4lI0OQgLcecIxUQhiw=;
        b=LYQyGsfv8Ju4F6favlA8Dc+pjRl7rKqDpY37rxSjn+hIir01aTydkiJYbOZdb2G//K
         XmhVyS2Q47/uC8sPH4hYyIh43cFUlbX6hwLGJivQXc5+6vnv2XdRAPsZaVLMaMSCKKUm
         CyO8W//vO7EFOYv3woqnufP11A6JaVeaVjy+1di2ap6bjSxVDIEoH9Qaox8lNGA+WmTq
         JDgRla7hhNg0bg5FDsFJ+h9m1s8IPRw2+Bcl2J2oYNyJ6GUBgRvmrF90z+degCsWUgT/
         Fq0GA0PlbY9bKZNcDipRqDzmhq29fnF+ESu6Ee2mChDJjd1uSpXb1yo06feLLq5XjJ11
         eSsw==
X-Gm-Message-State: AC+VfDzWQokv+Qt6S9lb8BpfF6goNbp6A1WGIwwHULiNYBQ6mYW+nwgf
        tm1s8ycyeIX9qzLiKbjuxEBm
X-Google-Smtp-Source: ACHHUZ6fMetp6J+mojm2mXSpPEDIeSGJUTqYYffReV3Lh5yumI/isAX6OLVOH1wtaSGSvIEsoPXaDQ==
X-Received: by 2002:a17:90a:de91:b0:24b:2f85:13eb with SMTP id n17-20020a17090ade9100b0024b2f8513ebmr39318239pjv.30.1684324004344;
        Wed, 17 May 2023 04:46:44 -0700 (PDT)
Received: from localhost.localdomain ([117.207.26.28])
        by smtp.gmail.com with ESMTPSA id s12-20020a17090aba0c00b0025289bc1ce4sm1366971pjr.17.2023.05.17.04.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 04:46:43 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, bp@alien8.de, mchehab@kernel.org
Cc:     james.morse@arm.com, rric@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v8 0/2] Fix crash when using Qcom LLCC/EDAC drivers
Date:   Wed, 17 May 2023 17:16:33 +0530
Message-Id: <20230517114635.76358-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
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

Changes in v8:

* Collected Ack
* Modified the patch 1/2 to remove the ret variable initialization

Changes in v7:

* Rebased on top of v6.4-rc1

Changes in v6:

* Rebased on top of v6.3-rc1
* Dropped the Kconfig patch that got applied

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

Manivannan Sadhasivam (2):
  EDAC/qcom: Remove superfluous return variable assignment in
    qcom_llcc_core_setup()
  EDAC/qcom: Get rid of hardcoded register offsets

 drivers/edac/qcom_edac.c           | 118 ++++++++++++++---------------
 include/linux/soc/qcom/llcc-qcom.h |   6 --
 2 files changed, 59 insertions(+), 65 deletions(-)

-- 
2.25.1

