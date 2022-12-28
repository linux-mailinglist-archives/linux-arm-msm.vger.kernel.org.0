Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 485BD657427
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 09:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232874AbiL1InS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 03:43:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232822AbiL1Imv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 03:42:51 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C4AAB52
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 00:41:59 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id m7-20020a17090a730700b00225ebb9cd01so7564534pjk.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 00:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WUljA05hxjrMgWInu+aANTEuP2TXhzChwqlFzG2wks=;
        b=YbRaJdKTjanKozZ9jibrWhveX5ctEFNkLx+F0Oa42QvbwyxD6ZLBU8UUZA7DFhvKhY
         mBGdAIrXoriXn5vAyZdODH0VG4OpyPkvIDDw1nNnfmEKmx4ak9mEn1kd931+EnbkXrnk
         hMjt7Kos6E23YPkKrviHBbwQ4tqcQyA9Q6zc3IMkPL0Hexc26EAq7tn/kEj03cPe/pu6
         Nrwy6KcprdjCHevGZ5/F8tpfywa846CpI4sFNSBPHY/XcxKSVQ8Cncqs43kbWYMxrq5d
         WjV9TUYi7ynmn0t8KGDKlAo+MTr1OlBrgUCwKVODXiYULSnFk/Eq1jPAe3rOrcFdPO7G
         wwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WUljA05hxjrMgWInu+aANTEuP2TXhzChwqlFzG2wks=;
        b=l8jTdwOc6OJoodt28QIsTY7eLaM/Zc5lDoKTzlP3auAk5w8g7Ko7ld8lmBSLj8hYwe
         3LtJ/EqAS/Z0k7ebU58Mur8S0iwBju8DsIQXDKLzWGeeHuro/T7VYP7pWfaraWXD2K4P
         hz3srvGXBv7Jwi1rezNkiSIiliHaNrKEojoteHlzfenZcIr0w+UCBzKom2d1ML8wXMuh
         z9vnFFC+RUycyoReGm8+vmgBVZ8YCakFQxEqTz2DFnz/EULD3P50pVlPGw/Cr+U2uqYi
         Cfk7b3PwI8CCyiDpdvtpwpzdB4vPUUlPkQGKLyuVLs4o7mTtBAZigc0i8tCtK6TamMhZ
         BWFA==
X-Gm-Message-State: AFqh2kqWt/ZxAFOLUZJ+0JN39uwLoMRabyeXl57ikeANIrZ5ScRsyKbN
        BlfNaHeXgA/lYl+A9n6pUfnI
X-Google-Smtp-Source: AMrXdXtZk6AwBn/gE/Qd6zoDfLS2rMhntnEviK9TyJo7SxfSdFi0mJohahvst5pggXiK2hSVI7uQFw==
X-Received: by 2002:a05:6a20:bf29:b0:a5:df86:f2b4 with SMTP id gc41-20020a056a20bf2900b000a5df86f2b4mr25040116pzb.58.1672216918839;
        Wed, 28 Dec 2022 00:41:58 -0800 (PST)
Received: from localhost.localdomain ([117.217.178.73])
        by smtp.gmail.com with ESMTPSA id d188-20020a6236c5000000b0057a9b146592sm9786286pfa.186.2022.12.28.00.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 00:41:57 -0800 (PST)
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
Subject: [PATCH v5 10/17] arm64: dts: qcom: sm8150: Fix the base addresses of LLCC banks
Date:   Wed, 28 Dec 2022 14:10:21 +0530
Message-Id: <20221228084028.46528-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221228084028.46528-1-manivannan.sadhasivam@linaro.org>
References: <20221228084028.46528-1-manivannan.sadhasivam@linaro.org>
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

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index a0c57fb798d3..7fd2291b2638 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1762,8 +1762,11 @@ mmss_noc: interconnect@1740000 {
 
 		system-cache-controller@9200000 {
 			compatible = "qcom,sm8150-llcc";
-			reg = <0 0x09200000 0 0x200000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x09200000 0 0x50000>, <0 0x09280000 0 0x50000>,
+			      <0 0x09300000 0 0x50000>, <0 0x09380000 0 0x50000>,
+			      <0 0x09600000 0 0x50000>;
+			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
+				    "llcc3_base", "llcc_broadcast_base";
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

