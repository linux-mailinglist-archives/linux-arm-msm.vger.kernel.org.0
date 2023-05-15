Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 746E2702E52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 15:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242388AbjEONg6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 09:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242204AbjEONg4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 09:36:56 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5682106
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 06:36:55 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-307a8386946so4969106f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 06:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684157813; x=1686749813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0kxZRhUCmP6zefutXh1eka5fAOo/mUsuRlD9H8W1TY=;
        b=ChxVxpZPk33OO70HkcfDvB2O3WFd4dmjAHjLPogFwhCytQkbAIhNilBX+UJMbGkbBH
         TNiOcxg1UcpP9lWwXm7ZO2H7cw7yUaU+rhZ8gddRHv4VGxj44x3aa3Fij0h/P3kIieh9
         Jk/fTB2pP4PkaIRtjx4rIGGA7GdJ+DWHV/gay5qiJT6R4LsgItMVup3HtgDja+C8D3oJ
         quLP/c8AQL6waxs00wBy9u6jsfrNZgenQDZaX1qZQj51q7uEkEDOV2gWin08cXy+uA+x
         40e68ZU44ZhX0WlctUct/D/iWpjKYG45FKalIcT+1QedgO/bwYCvX6oAYMWwBwpyEuGX
         J8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684157813; x=1686749813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0kxZRhUCmP6zefutXh1eka5fAOo/mUsuRlD9H8W1TY=;
        b=fRVINQuT9ITu5CuDD/PX9D/FiYiBwgdsz51ypdCxYSIInHOEDxWTzCvoDMwppNKtlk
         Nuy/yGct8DHjofNUPlWDEU2VZkrglRcipXG5aE89Qdl0j4+5enzYPslXl0HL13OE+VlZ
         04HJm+RlSWqugLArnbIKsdjq6GzUDaU8R0J52E4W1usGkU/acBhS9IZBN7Rs2fNHgGnS
         eELaeEUqKcKdOnAXCKLkb6CjobGCUuOFOW0+G+LTemQRVPJxHH6p9DuMZeLvPsUULlZC
         38Nmee99piMCMfjmUyOPLMlvPUUEH5LQYROKbKQi2297eg9+l/FnTFFAxRN1/1TuvckY
         udmw==
X-Gm-Message-State: AC+VfDzrnZF+Juq26aupzJhsI0seWvOavFevtm8NhUg1MPJXlkqdNmD9
        BA4nJ4R8t+eKYZYQYKHuEOS69A==
X-Google-Smtp-Source: ACHHUZ4OoEQADns9+LhNzsX3vcQ3y6AEWZIspfJkNrgfYt2mEwgb3sPFShd1Pojb/XLBWjuv+0+ziA==
X-Received: by 2002:a5d:688a:0:b0:306:2b53:e7de with SMTP id h10-20020a5d688a000000b003062b53e7demr22544906wru.28.1684157813564;
        Mon, 15 May 2023 06:36:53 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d4091000000b003078a3f3a24sm28856634wrp.114.2023.05.15.06.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 06:36:53 -0700 (PDT)
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
Subject: [PATCH v8 06/11] arm64: dts: qcom: sm8250: Define ports for qmpphy orientation-switching
Date:   Mon, 15 May 2023 14:36:38 +0100
Message-Id: <20230515133643.3621656-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
References: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
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
index 7bea916900e29..0bc7486e59e54 100644
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

