Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEE7612B72
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Oct 2022 16:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbiJ3Pzg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Oct 2022 11:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiJ3Pze (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Oct 2022 11:55:34 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA82B495
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Oct 2022 08:55:33 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id g7so15833622lfv.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Oct 2022 08:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SknTmdpytaVoqgEhV4VIoKMy6fb6ElvI7+52rPABNIg=;
        b=z6PgYoPKULoMtyhXyvnfdfdc9H8b4xcfIWYSimuwDeXxsPk3p852HNEIuvseW8Sodh
         XYtUrSyaxLsWy3NhVf2TOiQXuA0OKFWBVAyKB4eB/VokhHE5Ulfg7obsoyioRYkjrJZ5
         Cjg8zRHfhsIlP0YhyPW6SCSQEfyAEsrcffKZiHnHPPM6jTHpp6VUZbufd44HtVjd+rSr
         9SrGpYpqX5zt+g012rC+ec/2gjinq0QOoVJB1NVFcQjOeEnYVPI+fh636o30jwcBQS4c
         oh0Xk1x2s0OwCJCpBzYtvr4XJXxnYNK55rnEqaVsHr0EoVPpd6EE4qdUW7beymEtPyAw
         329Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SknTmdpytaVoqgEhV4VIoKMy6fb6ElvI7+52rPABNIg=;
        b=UHq5M1AEFwm8gmbnypyOmwL3sMQD7V5ALuAdSP7NbFupmM2vdvCxeYNSh/8O1W5Fz4
         W5jqZbDH1mMI1xbqqC7SYUnuU2tUTeT43OB9DoYWoKQ4JRdF99BTvKDMtOMZdqNWkQTM
         DrO8yLrgOJQLHYHnCaoRfvQd3nMd2R/fr6d9P9faysC623rXZqTzQ1rRJMYvAKiqbHOp
         BVz3/WtIv3CBHhPIWpGYSVn0/ZqdNCrQlStS4x93GoXqaDr48zuCLaN2WNv22XAXQ1ps
         vphs2S7p7IOI7t+zlBPG9PW+nrtbPNqY/6XlYjnPO0iOhJ2relXhVJ6KmQ2j9+mIx+ap
         czww==
X-Gm-Message-State: ACrzQf1xSSb4yxIv5s4c1VRWSgw2Ug4NGN51HuAs5DLILtE8M0r0ZDJO
        fMk2d40fqO7QkljKrZjN0EkBvw==
X-Google-Smtp-Source: AMsMyM7ss24luX83icB/8CUTch7wgGolrzjJUShn2J7NJWWT4/pTr8HrrtZPeYas0dT8xgEo0RJb9w==
X-Received: by 2002:a05:6512:3da2:b0:4a2:6fb7:b64b with SMTP id k34-20020a0565123da200b004a26fb7b64bmr3414609lfv.442.1667145332868;
        Sun, 30 Oct 2022 08:55:32 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id f4-20020ac24e44000000b00497a1f92a72sm842982lfr.221.2022.10.30.08.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 08:55:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 10/11] ARM: dts: qcom: msm8974: add clocks and clock-names to gcc device
Date:   Sun, 30 Oct 2022 18:55:19 +0300
Message-Id: <20221030155520.91629-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221030155520.91629-1-dmitry.baryshkov@linaro.org>
References: <20221030155520.91629-1-dmitry.baryshkov@linaro.org>
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

Add clocks and clock-names nodes to the gcc device to bind clocks using
the DT links.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 7f8b4356ccdb..4e70f51c8750 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1054,6 +1054,10 @@ gcc: clock-controller@fc400000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0xfc400000 0x4000>;
+
+			clock-names = "xo", "sleep_clk";
+			clocks = <&xo_board>,
+				 <&sleep_clk>;
 		};
 
 		rpm_msg_ram: sram@fc428000 {
-- 
2.35.1

