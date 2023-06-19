Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE94A735765
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 14:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbjFSMyV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 08:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjFSMyT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 08:54:19 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F24BF1729
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 05:54:06 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f870247d6aso1397961e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 05:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687179245; x=1689771245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Le26KL+9DdFLnEft3uCibkKfY4cZldwlPluP1qp2kKc=;
        b=c0WKBbF8plNCUQFI8Vzg2KPayFDXLzEl+TUB/kLWs/hI5m1VZbbM1LM7F1uGYxq5cQ
         7ID+pH5bG/nUMErzi2pqmeTIIsMpZBg0TsbOE+otU+Y5LU3l9jCc50t1OxIxwaHS7sYK
         Qhr/P+j/jB0DxzNMsSbYg0x3q3awWBNl3jPBYC7+GCQPPjqWwfTCZ0GV3gKjrjn5i4Or
         81u/OIaU6E5fmR5q58t0KdtfJ2s0NaCyZ0/bYUeVWpt9VHH0Qw71BnU+81s3Q3v8Thlu
         92jetZ7y6SaLaqxfhiKzF1Dabb1gnYi3zJyLnV8Rsuy4o45IhfU/NPRlXdO+GqGiWi5T
         kwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687179245; x=1689771245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Le26KL+9DdFLnEft3uCibkKfY4cZldwlPluP1qp2kKc=;
        b=DicdHLmlj0FLZixaXZGsDAJ5nKfhR/uljdruCEt4zxZgzNfEPTjpg3YB/4SDcRs/7u
         vGB9w/XNM/aSRDojGMdqCawA/dFeNBbv53ra78V2zDsTJGK95cPd7SIQCmUNeCOD8L67
         uMXvvTDKWliFaxscXyJWfcIFB59L3t88dGJoUXwcS8q0UBcv9vd/FjN6TSFYp/TuDMpI
         FuTAGzQpsOLxIFTvyzVTRLwR6hs37kr/BVqNylAobS/uphsNgFDCDRV/IVQzQta1coP7
         uvb4vW4LFrlxUUilPUseJ4jl/dD2SH5hRb1PFbAmtDfFbcTV+8oN+pM7jzUwWn7sIyHG
         jFdA==
X-Gm-Message-State: AC+VfDyvJFEyZxYbg64xmw4HyPEFXn0DZyrt248SNBIdr4HD8FVTXums
        57cUrGNYP5g/tzDE8/4g/0ZGeA==
X-Google-Smtp-Source: ACHHUZ78VIb+00HUSlNRHLi7RfvqAQoF8yll8s/RrSigBfJ1VSX+E1hEMrt2Lu891L2DIFOtnYIC5g==
X-Received: by 2002:a19:ab11:0:b0:4f8:75ac:c4e8 with SMTP id u17-20020a19ab11000000b004f875acc4e8mr618218lfe.43.1687179245263;
        Mon, 19 Jun 2023 05:54:05 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w23-20020a19c517000000b004f874e12e72sm229623lfe.224.2023.06.19.05.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 05:54:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Clark <robdclark@gmail.com>
Subject: [PATCH] arm64: defconfig: enable Qualcomm MSM8996 Global Clock Controller as built-in
Date:   Mon, 19 Jun 2023 15:54:04 +0300
Message-Id: <20230619125404.562137-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

The commit 8f680c287445 ("arm64: defconfig: Switch msm8996 clk drivers
to module") switched CONFIG_MSM_MMCC_8996 to module, which also resulted
in CONFIG_MSM_GCC_8996 being switched to module. This breaks useful
bootflow for Qualcomm MSM8996 / APQ8096 platforms, because the serial is
not enabled anymore until the GCC module is loaded.

Reported-by: Rob Clark <robdclark@gmail.com>
Fixes: 8f680c287445 ("arm64: defconfig: Switch msm8996 clk drivers to module")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f72d0f915340..2bff20171792 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1161,6 +1161,7 @@ CONFIG_IPQ_GCC_8074=y
 CONFIG_IPQ_GCC_9574=y
 CONFIG_MSM_GCC_8916=y
 CONFIG_MSM_GCC_8994=y
+CONFIG_MSM_GCC_8996=y
 CONFIG_MSM_MMCC_8994=m
 CONFIG_MSM_MMCC_8996=m
 CONFIG_MSM_MMCC_8998=m
-- 
2.39.2

