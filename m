Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 324456C3293
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 14:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbjCUNWT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 09:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbjCUNWN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 09:22:13 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A96728E72
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 06:21:51 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id az3-20020a05600c600300b003ed2920d585so11073610wmb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 06:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679404910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81l551VcpX1M6mk9/O5MVJii8ShKhy56jAQgidl0DwY=;
        b=u5wDvnU5hACTBtCn6dC2jd1UHQoxB55D3g1UTJkb2mQo85TrOLuN8+Y9MG9f8pzJ6n
         ECeRasH6lSZbGr0Gh1oPH/LCqGHZvYzXKi6+MW3zyHC5xcBsus/Yujnund5Px0X86qZF
         BBB/iWukaUm3XIFbvu37wjiqfJ03jZmVRdIJnMTIzqyL5V/Cft78vSO233UmABcgBMdu
         kUYZLYy2tOv5VdgcRs7Pdz1AlMrd+VqF3BF/8Q7EBydukqBZ1tIcwhKsQbBNjSoSwoZ7
         YEtDGjZQzH88Su+UWSVQ7KFLH0HEC8j9BXiZ+OzIj9PF/mCH+ncSr9wTDlDBHOw+LwYg
         Y4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679404910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81l551VcpX1M6mk9/O5MVJii8ShKhy56jAQgidl0DwY=;
        b=QdCm82YBhJD+o5ESJ0C/Z447SsJXfKfDjAIJMlq3DKR6jwyImK9mC4PGjaFnOaR/7h
         9sQy5xwugZu+F+kyMcT3VJbVli54iMLNqFJPZCvXOJLe+YrSILtryJbx2BlnDMKgDmAc
         YH29CGNTrYQ5eEBxNbUffKB89xyL0H1xmVmPIFOTqqYYm2ocyMIwmNe+gc0UU+e9PQHt
         gnox5z0C73U6BIVzEdP5hHDt85/Anp9MaVC2tSiQ1jE1Gyg1nJ60oKSsFyLspLLwd966
         GQqmf1Z70Js3Bk6nQUp/QT7781X8pyDyYYiKfJ/k8C4sgs8ozuPGy+g+ejAc5j1aMKXa
         x15Q==
X-Gm-Message-State: AO0yUKUGk0+qs3FBZHUZ90YtPAU/1KR2oDdx9GFsbAXZ3b4A96ik5DtK
        Tqokz2oR6EyGzHUV86Pq1m/eJQ==
X-Google-Smtp-Source: AK7set8fXSHZo1jW0ghJmwoQ9sG7rO22LtuTYhu9jFFbSKHxpMa32xCW0roGXPzhEi9NnV+HI39rDA==
X-Received: by 2002:a7b:cb57:0:b0:3ee:2bed:222d with SMTP id v23-20020a7bcb57000000b003ee2bed222dmr1862432wmj.3.1679404909927;
        Tue, 21 Mar 2023 06:21:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v26-20020a05600c215a00b003eafc47eb09sm13393016wml.43.2023.03.21.06.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 06:21:49 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 21 Mar 2023 14:21:48 +0100
Subject: [PATCH v5 08/12] arm64: dts: qcom: sm8550: add port subnodes in
 dwc3 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v5-8-552f3b721f9e@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v5-0-552f3b721f9e@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v5-0-552f3b721f9e@linaro.org>
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

