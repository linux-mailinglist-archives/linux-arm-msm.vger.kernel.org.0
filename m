Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC436B8C8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 09:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbjCNIG7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 04:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbjCNIGU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 04:06:20 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87D197FF3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:05:57 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id p6so15762687plf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678781157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sggevdgcbKkipnWP4TBoy7JyP1Clj0YxXKdQjrw2BUc=;
        b=n5ShiHu8TkifJ0rpTG3JyQ6+qX/9SlTcOKdiiRJo/l6aDmDiBrYXy1HcKwqr7467jj
         oEXtF/BwJ27I+1JMUNMVG66bwuQQwdnQx5qfFmOW/QBIUk26+ohXYo2xo96qW/heofsd
         El6IBaTR2yEu+ge99Ysh36mUSo7WAKF4wLgzThC9+uKTGaCjkshefW7pC28U8qj32lr0
         cf6RoTkIRqYduRW7JGM9Bkr5GTUZ7D2CMmHsylcX9uCKA9Cg5BpFjZiAtLejSDqr/2m0
         u4MOGQHHdsx9uzIIeSnV82eN0d9vpvKy61lG8/2X+Jnw7ZmEYW5PI34Tc6soqaT4fZmI
         PnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678781157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sggevdgcbKkipnWP4TBoy7JyP1Clj0YxXKdQjrw2BUc=;
        b=OrzXdiYEOGU3hDR7Q9TVJZ+sLAbeDw+CnEJnbHSGrSHwddVVeZS+Mqj9y1D4ohVFdx
         tkDfgmb7ukXKomnDcLYaiaL8tFZXobmAQlVsHpGHiHoi4kn4OzS+b+hJd6uyYpog2pHl
         GJntRqivAmohFa8TeY3VtdqtLoZ3T21pevXLUHvl7gLPck62i8E0lw4jt2ae4g9JOPqs
         dqm6ZkOZNLFCZs/4KrrtmUE52g6YDDUeMJ/tdnHzi9FXhXZQ7bVvBmz5yKl2LzSDsL63
         QSVAU+H213E0aca+pv4TNiA5eRZz3Pad57USD76kFhooK1FDUiE+0h/k+5+q+xibnQR0
         5o/Q==
X-Gm-Message-State: AO0yUKUjPyRHDlJgvfVlutmiovj7fjLH0dhnHc1LUz0ocNiza/LhN7MJ
        d4o3kk0bfvGbqL+l/H6Drfi9
X-Google-Smtp-Source: AK7set91E81Z5ue0s+hViGYIWmltBDyOFXxkdskzB+J3ofRfV5NNi52ZEZ0p16JswB08mvE13xUctQ==
X-Received: by 2002:a17:903:24f:b0:19c:c8c8:b545 with SMTP id j15-20020a170903024f00b0019cc8c8b545mr40241222plh.50.1678781157396;
        Tue, 14 Mar 2023 01:05:57 -0700 (PDT)
Received: from localhost.localdomain ([117.217.177.49])
        by smtp.gmail.com with ESMTPSA id l8-20020a170902f68800b001994a0f3380sm1078022plg.265.2023.03.14.01.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 01:05:56 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, james.morse@arm.com,
        mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
        quic_ppareek@quicinc.com, luca.weiss@fairphone.com,
        ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v8 11/14] arm64: dts: qcom: sm6350: Fix the base addresses of LLCC banks
Date:   Tue, 14 Mar 2023 13:34:40 +0530
Message-Id: <20230314080443.64635-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314080443.64635-1-manivannan.sadhasivam@linaro.org>
References: <20230314080443.64635-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

On SM6350, there is only one LLCC bank available. So let's just pass that
as "llcc0_base".

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Tested-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 1e1d366c92c1..63e55579e9c4 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1348,7 +1348,7 @@ dc_noc: interconnect@9160000 {
 		system-cache-controller@9200000 {
 			compatible = "qcom,sm6350-llcc";
 			reg = <0 0x09200000 0 0x50000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg-names = "llcc0_base", "llcc_broadcast_base";
 		};
 
 		gem_noc: interconnect@9680000 {
-- 
2.25.1

