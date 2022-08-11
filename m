Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E37C358FA78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Aug 2022 12:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234914AbiHKKJq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Aug 2022 06:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234050AbiHKKJo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Aug 2022 06:09:44 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43689923C0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Aug 2022 03:09:35 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id gj1so17307788pjb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Aug 2022 03:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=lSBY1yS1Xw97HWveifQYja2PT0/x+CrBFQy17+c0BDU=;
        b=TUL9B3XAN9V+HnYPC7vRcSjCTLS5cPUYnF6JXKd1JQONfRAsJEkpfUx9cmUNxU699x
         Qua5/zKAuevA2FrhFoT3DTPyaHF2bD79odM6WGIo7ABmiA35Ovhiybpe1y9JXE5Ku1yI
         7d/r+qC0FYVRLz9mMyvyRNTIWWcpVeGIwH3QM8UWtQlAXt3PMYR/pKNzfAWt6B6HjLwD
         7TAaiA84zBJMFG7S15iQgnppjkrRW5V4TMAVBTm9lLbrg5tyCNeJ4zRlmgGYes/qqyeN
         2IQfUwYWCVXCUAD4pYxDyi2rENe9YbhcEJAVqKo20AhsuO5zJEonfESC8MzeZhCR0MEv
         Ymjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=lSBY1yS1Xw97HWveifQYja2PT0/x+CrBFQy17+c0BDU=;
        b=PcNFn1qYIfzGldiV+aAEOQWMAQ1ip8Ypss+8TPOqadjOF7xUgYCBrppJTHOEwpE+E7
         9mT0r70pyXMiOwOP5HBjJHXdzeUTJR3BKSmfKK1dHNKSO8Mwq7+gz+HY6JRIgd8aqIV+
         xfF+3YNTtAKSaB8lp93ALuBJcUhv/hunGbDKpFBHVxCyNVw2sTT5n31i5pKwbV/8pwxB
         s27L0rK7/njpHuLcvwm+juLyEmMnC5QRsCVW+FmkQXG1FLY2L8KEIq0Ds2embrdSLgGC
         zqfBFdNG2sQtr0c4/wdnr6736S0sm/10WNKp9Kzoz828Jr9/mLBv1Anu81IrI8Cm21Bx
         0xrA==
X-Gm-Message-State: ACgBeo0CZn2rxq4LBWkxHEyEWNgPxTuI6yupsG6iLXN6dm6Am5U72N0W
        0xtoWjYg4BrxmPfi5vOenlhr
X-Google-Smtp-Source: AA6agR43LqVirfFoBL1a+ABeiKghnUDzWk5veNNYowKakZi591/NWu4gjeClnI0TrFP2aMtmahs7mg==
X-Received: by 2002:a17:90a:5517:b0:1f8:a7ce:ac33 with SMTP id b23-20020a17090a551700b001f8a7ceac33mr3024058pji.83.1660212574700;
        Thu, 11 Aug 2022 03:09:34 -0700 (PDT)
Received: from localhost.localdomain ([59.92.103.103])
        by smtp.gmail.com with ESMTPSA id 1-20020a621501000000b0052b9351737fsm3714839pfv.92.2022.08.11.03.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 03:09:34 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org, ckadabi@quicinc.com,
        vnkgutta@quicinc.com, bp@alien8.de, mchehab@kernel.org
Cc:     james.morse@arm.com, rric@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] Fix crash when using Qcom LLCC/EDAC drivers
Date:   Thu, 11 Aug 2022 15:39:22 +0530
Message-Id: <20220811100924.79505-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
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

Manivannan Sadhasivam (2):
  soc: qcom: llcc: Pass SoC specific EDAC register offsets to EDAC
    driver
  EDAC/qcom: Get rid of hardcoded register offsets

 drivers/edac/qcom_edac.c           | 112 ++++++++++++++---------------
 drivers/soc/qcom/llcc-qcom.c       |  64 +++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h |  35 +++++++--
 3 files changed, 147 insertions(+), 64 deletions(-)

-- 
2.25.1

