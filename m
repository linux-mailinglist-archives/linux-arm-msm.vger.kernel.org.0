Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5577562CFB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 01:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234415AbiKQAc4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 19:32:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234502AbiKQAcy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 19:32:54 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E0AD532C5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 16:32:53 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so3221235wmb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 16:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5GtwnbHFc8JFwvCMf+qKNxY1iza8pBV0u1xvIJjvmI=;
        b=AS8t/hBXzwxi5nVWsnoSdYaw3l5EsXTlzAm39sRlLRHGwpTmY2sBk2ZtXcsPH8gbiK
         E33hzBZFv6qkl7v564PeKFudnQ8SJfbmJOAZc4HziJEzA0kuDaoy3TVSl0nf4K2x45i7
         7r4rxCgTgbMhZYfMXODBCYxq0OSHgA3zwYozt64kuqXzQOkmUABP5d4/kAU6QQPdw5/F
         TwYpnj7m1OjBumdkFKYL+Fh+d98MGTHjsvMMxjXd6q7d8Bnjr8YnF+e4mWqsLup3RuKM
         ZH0+krWw09wVjHdbJG5VX2qv0e7xuglRU/V5P/vfedePO3LD6NmfyWWEmk/VwsjvBbNb
         KySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5GtwnbHFc8JFwvCMf+qKNxY1iza8pBV0u1xvIJjvmI=;
        b=44T7OYxqaa8WIOJQfk2GUNDa+IMgzXgpoxEkz8s5K9OCyH0JwIQ9OZ/2rYmSq01/9T
         Ma8aVzw2JeSeiAF+NClfZfYOKoTuhfqvdNU8RlGcyn36wBn5IkBGx4exfUyIUKAcrdSq
         toDlTUsmFGI7gGSNnYrM/4q5gxEI39ymiFwO0Ubm+N8o/ODZ8rSP+6qqwkM/cfHqj4Qn
         uGJ271ddE9vaLpzsmvkNzTzMmGVmA+paS6ysU+Hcok69GqiXnYaZq2jVdWLQSPJDrlDc
         79Kb2pSilTGtaVC7mph1hyiniGbarohkEsm2n2OyeA4QRzYveoIaRLGDyEy4kofQk1Ot
         azwQ==
X-Gm-Message-State: ANoB5plEdMykOHXo42CB91/aMCFZ6g90MtfQSGQT/IAca2qyflVhcdab
        73BcfV1/5x3vaRQ0YpiNVXMzGg==
X-Google-Smtp-Source: AA0mqf57JNoZXn+kDpyzVK4BsIzocPIT2S+8TOhlXQm1RVB9cnPGdta9jkAZK1lVbeV48o2sbkON4A==
X-Received: by 2002:a05:600c:34d3:b0:3cf:a7a8:b712 with SMTP id d19-20020a05600c34d300b003cfa7a8b712mr3617947wmq.124.1668645171958;
        Wed, 16 Nov 2022 16:32:51 -0800 (PST)
Received: from localhost.localdomain (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r18-20020adfe692000000b00238df11940fsm16472703wrm.16.2022.11.16.16.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 16:32:51 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v7 6/7] arm64: dts: qcom: sm8250: camss: Define ports and ports address/size cells
Date:   Thu, 17 Nov 2022 00:32:31 +0000
Message-Id: <20221117003232.589734-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117003232.589734-1-bryan.odonoghue@linaro.org>
References: <20221117003232.589734-1-bryan.odonoghue@linaro.org>
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

Define the set of possible ports, one for each CSI PHY along with the port
address and size cells @ the SoC dtsi level.

Suggested-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index d517d6a80bdcb..806aa19ad93ce 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3412,6 +3412,35 @@ camss: camss@ac6a000 {
 					     "cam_hf_0_mnoc",
 					     "cam_sf_0_mnoc",
 					     "cam_sf_icp_mnoc";
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
+
+				port@2 {
+					reg = <2>;
+				};
+
+				port@3 {
+					reg = <3>;
+				};
+
+				port@4 {
+					reg = <4>;
+				};
+
+				port@5 {
+					reg = <5>;
+				};
+			};
 		};
 
 		camcc: clock-controller@ad00000 {
-- 
2.34.1

