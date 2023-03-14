Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74FF76B8A9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 06:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbjCNFi4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 01:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjCNFiw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 01:38:52 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B39C795E29
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 22:38:26 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id x11so15395509pln.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 22:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678772305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqwK6TcGjAz04KGXLoszY4ospGxs4tGDAzQeGyANDbE=;
        b=ZdG7vKoqgh7TLFE5DkTjS8lZMZZ4fYvaX+ZAa5JUaX7njeWUBsK0TwE9uu4jPM/k6M
         MRsIUbyomZdq12tYQPcfd0u4jRRxzSYfKlepDEv5yJ7xQ/NyTbrVTHBk0HJBb2rrgOHQ
         h4TXpL8f8nRKOYYgE0pQtKzpmNomchpoLCqMXl86YKUnIFjuW91rSAv41SnGZFv5WB8k
         bSJqBrit69KKWEHJErhWCmmhoXtZna+xDxzj4YNfV/Yv1c+s45YgtDWhX+/g/7icbtFU
         ZuQP0Xep8MpIva7udnuc84/wWudb4TmMDbKQ5ryQkic16bzvNqFTwn3upia/x+sdW42N
         VS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678772305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqwK6TcGjAz04KGXLoszY4ospGxs4tGDAzQeGyANDbE=;
        b=eiigKnSmkHFXNOoiKK1wpqzeNhmsI8St5WCzuL0CKIktEpWlRQPS0+SQzgjEaEZM2k
         NearKHiZ3/CekZ28oeVEIo7mkPycWmnD7M6SI4/zJSFihsBvczGh+fiZi/aX8BgWU/py
         t89wTX/7GxCBx7NJlweyEU3xgyb4/dqIh5yTDjqc4usDo4V2CqEaJiHElNEUNX4TRnkf
         4mo4hbh6Xpz6U+2UnF6No3XZput4L0hbNNBkzs2bHk9xU9EBJ8k332lqThvqn/Hb4cTJ
         8EsqqTg4XlEwl/MgYQV9thH+3UhDXdf9HW9Srpx/bbnQaNIBKjy1gKOVs8xhl5ATa7Em
         Yclw==
X-Gm-Message-State: AO0yUKVX5hEePzxfgV8rqrIccQfGGZI/3EJwDr1GApkLG0toYLOfh+Bd
        bh1CTDbFi03lmMz5npaZajWY
X-Google-Smtp-Source: AK7set/INcAL/XhbTRZrdf8CPE6qbsudRjLaC2QYDBO0o0H4NLZzIYbtXxXor2+c3PaD2Cdi5tsnDQ==
X-Received: by 2002:a17:902:ecc1:b0:19d:ee88:b4d7 with SMTP id a1-20020a170902ecc100b0019dee88b4d7mr45413170plh.25.1678772305294;
        Mon, 13 Mar 2023 22:38:25 -0700 (PDT)
Received: from localhost.localdomain ([117.217.177.49])
        by smtp.gmail.com with ESMTPSA id n126-20020a634084000000b005034a46fbf7sm675093pga.28.2023.03.13.22.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 22:38:24 -0700 (PDT)
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
Subject: [PATCH v7 10/13] arm64: dts: qcom: sm8450: Fix the base addresses of LLCC banks
Date:   Tue, 14 Mar 2023 11:07:22 +0530
Message-Id: <20230314053725.13623-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314053725.13623-1-manivannan.sadhasivam@linaro.org>
References: <20230314053725.13623-1-manivannan.sadhasivam@linaro.org>
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

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 1a744a33bcf4..636dc6823d4c 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3981,8 +3981,11 @@ gem_noc: interconnect@19100000 {
 
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

