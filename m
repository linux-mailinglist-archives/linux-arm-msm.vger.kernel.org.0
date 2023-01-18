Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 616AE6720D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 16:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbjARPMv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 10:12:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbjARPLh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 10:11:37 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A8D3F288
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 07:10:26 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id q64so36067573pjq.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 07:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6zR8ugZMMSbsUYzZxGLGG2mvpL7z7iHt3BZjr/IYFc=;
        b=KYHlJzqYB0S+TMh1QJwb46T/KhpPwcT8JN1cCEJBxOmCb9ejw8Zk+e+cZBbdB2WFgE
         wfOnPik0q9Hw2wbxUEGe7kxI/Z7WdP0wAjBxbX8rmcg36gAMEO1GfFz3ohLvzLTpH2tl
         ULbJQ0G4oQSJvt7sd1uLCAAgXQT9+vsQ/v0DiDni/R0YC2Xw0SNdVeLPrdGLARz8NKK5
         HMhL6Ens6OC0f1B1QVLUo/cTIdixQH1788x7tCUs69jhWgJNHuN+DGoBIYIU5CdEsin+
         c/UGlcL4TmwIjalSQaEJbPldm/oC/LGiTLBBubvytFov9+SWTj837d9bagC8nBp/87i2
         5PNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6zR8ugZMMSbsUYzZxGLGG2mvpL7z7iHt3BZjr/IYFc=;
        b=cFQh7IrahSgbEuVnxN1aIEm3ZmsAMWBtmkAtqC/m08t2Eeok4fwJwnIY7Jf4UXACuD
         TDveA5u1pM6pyXWBEcwmE2LDgMWlepO8XPyacrHvLPVKNyywvPGOLq/CMidDYdKmdEHY
         Z1Efdn0n1KVK/5171fvh+lNvOiieuMbO92wOizkfWAZYFGfP0GFT0iWrA+B2EREeYhn4
         6cHwazExGxF8FH0H37TzEcZS4RJ3zHRCztPjFcz/4GHmKpDj74bzZADW0ORvGXObKP5m
         WIGHP/9Bszxn6Gy3f+azW/g3iMa80tzhHiA4ZkgmDTKJ3l0odQVxb8ZBzGS30zdurglm
         DYPQ==
X-Gm-Message-State: AFqh2kr25frj5qyugwS1Cii9oqjYFFUgYX37mU/GY13j/WtrPlwJ9Y8/
        ZpKGnQFRA5aRlp3wX4E0BnQI
X-Google-Smtp-Source: AMrXdXuoTYMbdhO1E/hIDv1s/NfWac9D2NnkXoBO9E1sFw5QSCw3wXsl9Gz4EmFoS4BQqssmEWhZSA==
X-Received: by 2002:a05:6a20:be1d:b0:b8:7e6d:5b52 with SMTP id ge29-20020a056a20be1d00b000b87e6d5b52mr6614642pzb.38.1674054625604;
        Wed, 18 Jan 2023 07:10:25 -0800 (PST)
Received: from localhost.localdomain ([27.111.75.61])
        by smtp.gmail.com with ESMTPSA id i15-20020aa796ef000000b0058d9623e7f1sm6721544pfq.73.2023.01.18.07.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 07:10:24 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 13/17] arm64: dts: qcom: sm8450: Fix the base addresses of LLCC banks
Date:   Wed, 18 Jan 2023 20:39:00 +0530
Message-Id: <20230118150904.26913-14-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230118150904.26913-1-manivannan.sadhasivam@linaro.org>
References: <20230118150904.26913-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 570475040d95..12549a2912c6 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3640,8 +3640,11 @@ gem_noc: interconnect@19100000 {
 
 		system-cache-controller@19200000 {
 			compatible = "qcom,sm8450-llcc";
-			reg = <0 0x19200000 0 0x580000>, <0 0x19a00000 0 0x80000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x19200000 0 0x80000>, <0 0x19600000 0 0x80000>,
+			      <0 0x19300000 0 0x80000>, <0 0x19700000 0 0x80000>,
+			      <0 0x19a00000 0 0x80000>;
+			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
+				    "llcc3_base", "llcc_broadcast_base";
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

