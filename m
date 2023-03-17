Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6926BEC41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Mar 2023 16:05:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbjCQPFG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Mar 2023 11:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231460AbjCQPEx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Mar 2023 11:04:53 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1913531BD1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 08:04:34 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id v25so1258005wra.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Mar 2023 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679065472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81l551VcpX1M6mk9/O5MVJii8ShKhy56jAQgidl0DwY=;
        b=QK8Srk+nXHNfVumQzoJm2XSv8qMrDwjoQnSJCdPoXRC7Zk5Jckw0GncDh2Z+AjxkTM
         mvFbA+g0SVgRBjYuUzNYklqK5YkvufidELDDFEF9xcAcHUf/qVHfIyoyYnzQwVmfMFkv
         B1PoVh52r483oEmxeR+ObsVVUNeU9UoFh3Lk5Hku7o5IijxA1w1LAFF445kJ38JOXSy4
         biO6pLCfXPLVvaAUByKl/ub8wVjkSGcrbf6d5KRAXyT/rfQfv6SHjWpGU+Nwr0BtBkJR
         bGH64i8DycpQXoawBmemXMW3p5UD6htLQYdhPpP8PWMs3Q9yTRRb7pVFSv9j93JLibBR
         k50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679065472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81l551VcpX1M6mk9/O5MVJii8ShKhy56jAQgidl0DwY=;
        b=PVbJmreeEDVfv7BIpov0sFqMdsggplkJhqHH9oShdbk6WXZpYXAS+6mx1ec02wnWBK
         ibh600VcZNPsPvE3D7pjYrPzdIkjuXYN2os6YLn9ogkMUjwpSJG9a2+EpvpjAaALGOjL
         UFBpjooZ7Wavem/GErxhULkPrMqO4L3BFHjet1tfE4mtGPMNy/zmPBNTzVSDPa3ouIKe
         av342ZGqm5iTYv8Q+Pl/vSIg6VHVPVILb4ohB2juccTgSOiraeuSqkt70IkY3RUw1pQe
         2Oel9F+6gStHaEEjxiBuTswdZCm1DGc3TrbSrO2NGzpBT0RXXVdFp4PGlL9CE28lbA3K
         SfVw==
X-Gm-Message-State: AO0yUKXNdvw/3fPkLtEjC5L4NnER6CMcoq76O73T9Qo49E3gtbQuYcye
        jxJFHSOPy4SrTZ11wzx3KIDJlA==
X-Google-Smtp-Source: AK7set9k2B6KLq3og1yxJGCSQGDPvlK4CCN4rLjAbLWbOlacyoKiEkRHsI6+tDFfNBEQEfaaFOAJLg==
X-Received: by 2002:adf:d84f:0:b0:2cf:ed87:37c9 with SMTP id k15-20020adfd84f000000b002cfed8737c9mr2779125wrl.11.1679065472241;
        Fri, 17 Mar 2023 08:04:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600000ce00b002be505ab59asm2133773wrx.97.2023.03.17.08.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 08:04:31 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 17 Mar 2023 16:04:24 +0100
Subject: [PATCH v4 08/12] arm64: dts: qcom: sm8550: add port subnodes in
 dwc3 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v4-8-38bf0f5d07bd@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v4-0-38bf0f5d07bd@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v4-0-38bf0f5d07bd@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add ports subnodes in dwc3 node to avoid repeating the
same description in each board DT.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 6af4079c9a35..da32f6bc34ab 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2460,6 +2460,25 @@ usb_1_dwc3: usb@a600000 {
 				phys = <&usb_1_hsphy>,
 				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+						};
+					};
+				};
 			};
 		};
 

-- 
2.34.1

