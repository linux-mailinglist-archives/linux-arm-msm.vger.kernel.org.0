Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 516B06FB296
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 16:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234585AbjEHOXh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 10:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234571AbjEHOXg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 10:23:36 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDF13C27
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 07:23:30 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f195b164c4so30213445e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 07:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683555809; x=1686147809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOwO+f9dgoCq7yiaazJXQ6WqCRqep8/4128RgQMh2rI=;
        b=GMR4MQjkOK7jR3sEC5AxXVMsIAHSRRXlbC4hsfhmrqU7rgRbbZqp8K4JS2PzyoXkyz
         eyPibNVAfTmJFgu7hbgGFtNOK4Vs7VrCosln4huhksuWC/0fdmEg1k4NsPIdcDPz/w5B
         tMqHfg2ryERBC/4qobBXLj8vtvva53+TFGKrsxXGDiUNVi9UhTi4aWpiNAjoEqnWIpo/
         CkPhO930PgCupmRiAppBht3ScLFDSfZe0hleii8wGa0/XzsxGnhO4NHLN3vusjg8BXVe
         Lt1kgijyMUxLrVtQfQbu2XSP/KIa4YpmlSv2MYuuMSemzBikVD8l2mFRoGpyWdUi8wS0
         YVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683555809; x=1686147809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOwO+f9dgoCq7yiaazJXQ6WqCRqep8/4128RgQMh2rI=;
        b=AeNtuMUAObWaicsRY8TvKc1813kbMmjchQGCFIhDImxWgjFNuxeGJyjMlxbqZRqr9r
         AmDQaZm/BT7AgDXwDJygD/b3quxudeJ+LHuxVT6wXcxrrbDZiXextZMM34w/dfm0qSbk
         1j5QtqmNL1t+3yix6vsaMxE2vQ/+ZTxWiYSzm292jezUGn7SYiy9aGKLRlxDoJB7igr/
         Iw7SmSxNZ2qC+xEixTjhDzSQa6dZ/duTJXnHKcSXp2sfBF5LW6rYh3Yr/6P4/uVPwG5z
         jGW8nMABcY6+4OCZciinRlJdJRtQL2mByeaH/yKWD+pF0i5ewMZx8WxNOjuS0rfOO88z
         kFOQ==
X-Gm-Message-State: AC+VfDxk7OoJVLlOd1jQ3dyRDqZQ9Tj3q+sZTxK7EPXH7hIQdmrdLIe3
        mjg6I5Cwk4v3r3l/a2EnqFSTMw==
X-Google-Smtp-Source: ACHHUZ52nZBEIBxWuVVwYem0TqBeYXBoVhKITScVR5R3kZrvcWiCeorF7qp0rb+Nyo4RnpiNhCJJoQ==
X-Received: by 2002:a7b:ca4c:0:b0:3f4:2819:7777 with SMTP id m12-20020a7bca4c000000b003f428197777mr1149158wml.38.1683555808809;
        Mon, 08 May 2023 07:23:28 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y25-20020a05600c365900b003f42456c490sm4081544wmq.33.2023.05.08.07.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:23:27 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, lujianhua000@gmail.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, subbaram@quicinc.com,
        jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v7 08/13] arm64: dts: qcom: sm8250: Define ports for qmpphy orientation-switching
Date:   Mon,  8 May 2023 15:23:03 +0100
Message-Id: <20230508142308.1656410-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
References: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ports for orientation switching input and output. The individual board dts
files will instantiate port@0 and port@1 depending on the supported
feature-set.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index a91d1175255e8..af16d3ba76b8e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3581,6 +3581,19 @@ dp_phy: dp-phy@88ea200 {
 				#phy-cells = <0>;
 				#clock-cells = <1>;
 			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
 		};
 
 		usb_2_qmpphy: phy@88eb000 {
-- 
2.39.2

