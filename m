Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E30D051A5AF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 18:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353539AbiEDQmQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 12:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237034AbiEDQmP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 12:42:15 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1119D2E9E3
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 09:38:39 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id t6so2800751wra.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 09:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PA2ONwZQ2aNf3XU05hmmrIW1CKcRJL5Vxbk4O9KxM0U=;
        b=ZVO7iuC3y+8vECZtgXKsSGDXt7vhff57IF29kTm07enoAqdiotnertd/QkXHpyIbIO
         wmJ7bywYCbo41uf7pK766HfRJ4uikbB5X4vs5ZWTyHHfcfYUsvENQUIX4iri+g+l2+YB
         vOdrlZN0QEq17EAoLEWU0i51TT7GLDhWn0QqpwpYGnRY76MSmA3L8suIWEZFIev3c56H
         w1P6z4tpfO1nv3cfqoP3S2xqKDeGMXUn650VWIJyk21h8VjvoM0rSw1JekR6ksgYaVus
         awPIz6Lp+JgLY5D87DETBvKy4FtUMJyFymybVkrEj6c2ksMDLLAJ3kr5Hk3Jo0ufRPDG
         KEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PA2ONwZQ2aNf3XU05hmmrIW1CKcRJL5Vxbk4O9KxM0U=;
        b=D5ZtzztBakfFHXftPoNEJiFAsGdONzLyxnkdqzDhYWbo4qx+ANIW0X/wDXtEyT8Yj/
         ns/eVaPkQ4I6AgCbucyhM5Ay63fLo7RFmShLr6SgmadZA78iBeLe9d+0tXt/oKoAM2Fy
         YmIvPzFdHkGmHSOLKk4eIlyFwIwPLeQjVmPW3vfT52Hqe5Bx21EqdNiKU/q7ph5mR7Ep
         7YRSbfj8atdwAybTUSJ/uhFsdvuK3owwx/kmvFFn1bGm6Lh36s661dtw/Xa+6f5FdlnN
         BrCt+lhLZNlmv/8p4vavHaihBaq0sfhij3NIBUNLp9iCXPr0sMd/Ze9TEcIBYE8K0OAr
         yEWQ==
X-Gm-Message-State: AOAM531M8vqrZElrwFCFanSm9lKnCRGWewFIN6qksmk1SpmTFzLeUQ8x
        VfuuJSm1k7Ho1KQFIeTaOLEMSA==
X-Google-Smtp-Source: ABdhPJwiBcGQdxU/eQ8+6BVGeSYguBi2ruvk4NT3NT9jegKSzB2iaHgyNMmRpHNRlNUs1CzE0QRYxw==
X-Received: by 2002:a05:6000:510:b0:203:e469:f0a3 with SMTP id a16-20020a056000051000b00203e469f0a3mr17276636wrf.710.1651682317410;
        Wed, 04 May 2022 09:38:37 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r20-20020adfa154000000b0020c5253d8c7sm11671706wrr.19.2022.05.04.09.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 09:38:36 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 0/4] clk: qcom: msm8939: DDR and system_mm clock fixes
Date:   Wed,  4 May 2022 17:38:31 +0100
Message-Id: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
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

There a few omissions/bugs I found recently which are worth fixing up.
The BIMC_DDR_CLK_SRC command RCGR points to a value off in the wilderness
and should be fixed.

More interestingly a number of Multi-media peripherals are defined as
pointing at the system NOC for their clocks, instead of at the System NOC
MM.

This turns out to be not much of a problem so far because we currently
aren't trying to set any of these clocks and the MM_SNOC clocks are derived
from the same source as regular SNOC clocks, except they can vote for
higher rates.

Bryan O'Donoghue (4):
  clk: qcom: Add missing SYSTEM_MM_NOC_BFDCD_CLK_SRC
  clk: qcom: add gcc-msm8939: Fix bimc_ddr_clk_src rcgr base address
  clk: qcom: add gcc-msm8939: Add missing system_mm_noc_bfdcd_clk_src
  clk: qcom: add gcc-msm8939: Point MM peripherals to system_mm_noc
    clock

 drivers/clk/qcom/gcc-msm8939.c               | 31 ++++++++++++++------
 include/dt-bindings/clock/qcom,gcc-msm8939.h |  1 +
 2 files changed, 23 insertions(+), 9 deletions(-)

-- 
2.35.1

