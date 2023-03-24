Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48FA56C86C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 21:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjCXUXC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 16:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231959AbjCXUW7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 16:22:59 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 812E71ADC2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 13:22:58 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id y4so12488448edo.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 13:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679689377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/LMWIXCTebbEBvRvBxmqmfgG2n/mr0skTdDZ9JrIkA=;
        b=Yj/L4LaMQo1d88HWuWhJxmGhhr59MtceqkMjwGzSRPFlgr+DTKBmZKZ6Q8uPZHTwAV
         L7PrKMr397zwramr5+Vyua8RsVv17vGdLIhVXnJjOhL3biw4V0rhZKhJz2vqa705MLTz
         kfP6od8vu0XlPTL67JakuEMnF0Bu8mIc1MZJpJcQaIoukBgpDOoOs5pobeBUd5lU/C4L
         NUOG+ECN7zUAlwJZ2j9exQiH2y3nzV92Sp1Bilpsylpj+dIDOJH0RYkljMd/nvY9bkno
         iVGKBFzePeZQLMFTnf6GeVHXy7Wfil9zaQA5G6G7AGuhRZxMhg7ac/aLzPBLOT4gNR7D
         RVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679689377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/LMWIXCTebbEBvRvBxmqmfgG2n/mr0skTdDZ9JrIkA=;
        b=pxCc5SRm6zX++lf9refXlbeClC12Lh7Bk7xluHqWucjPvhtIlwCasrRWcLis2IizcA
         L436vwRugsG7oE05h5/EJsW0KR1+k3kLyIfBRXUQ9QNpr4rOfJIrnIxbsJeu0iWRMVZ+
         IDf1yYXERbT5JvDpvYKB54mKszWlb8iT61JA72Z9s9ZOqEBWB/1CqxT3HRYzWX4AJxdq
         L9AQVNMSqx+ByMnGEvj6UqLOI5UGg7Hgaztyg1ydStjstnjfCs5MP9YVQdHwnwoVYEZn
         hJRtQiw31TrNVq/eZrHzgYbLpUY/56EF3hoaiH6nO82zPgfLQ4G5DGVXqroeLpr0D7HP
         DXtQ==
X-Gm-Message-State: AAQBX9dbkpbg4gV/C2jNp3KxtZ5iCXHGPLIuruGWxSMeInLxBTDGHqZo
        T9nJhgNHRzYmOBfWqqzX2ibzkw==
X-Google-Smtp-Source: AKy350b//DLxCLjIHZqp5EtohEhanJKITOUhXiuRpIsdcPHHb/BMBYKLcq9yQBjW2CBHh/a8pMWoqQ==
X-Received: by 2002:a17:906:9bdb:b0:93c:81b9:a2b1 with SMTP id de27-20020a1709069bdb00b0093c81b9a2b1mr3800033ejc.62.1679689377131;
        Fri, 24 Mar 2023 13:22:57 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:3027:fb0b:ae08:588])
        by smtp.gmail.com with ESMTPSA id rh26-20020a17090720fa00b00930ba362216sm10900041ejb.176.2023.03.24.13.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 13:22:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/5] arm64: dts: qcom: sdm630: move DSI opp-table into DSI node
Date:   Fri, 24 Mar 2023 21:22:44 +0100
Message-Id: <20230324202244.744271-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324202244.744271-1-krzysztof.kozlowski@linaro.org>
References: <20230324202244.744271-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The soc node is supposed to have only device nodes with MMIO addresses,
so move the DSI OPP into the DSI controller node to fix:

  sda660-inforce-ifc6560.dtb: soc: opp-table-dsi: {'compatible': ['operating-points-v2'], ... should not be valid under {'type': 'object'}
    From schema: dtschema/schemas/simple-bus.yaml

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 38 ++++++++++++++--------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 5add1951d963..ef63aa86ad67 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1450,25 +1450,6 @@ mmcc: clock-controller@c8c0000 {
 					<0>;
 		};
 
-		dsi_opp_table: opp-table-dsi {
-			compatible = "operating-points-v2";
-
-			opp-131250000 {
-				opp-hz = /bits/ 64 <131250000>;
-				required-opps = <&rpmpd_opp_svs>;
-			};
-
-			opp-210000000 {
-				opp-hz = /bits/ 64 <210000000>;
-				required-opps = <&rpmpd_opp_svs_plus>;
-			};
-
-			opp-262500000 {
-				opp-hz = /bits/ 64 <262500000>;
-				required-opps = <&rpmpd_opp_nom>;
-			};
-		};
-
 		mdss: display-subsystem@c900000 {
 			compatible = "qcom,mdss";
 			reg = <0x0c900000 0x1000>,
@@ -1610,6 +1591,25 @@ dsi0: dsi@c994000 {
 
 				status = "disabled";
 
+				dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-131250000 {
+						opp-hz = /bits/ 64 <131250000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+
+					opp-210000000 {
+						opp-hz = /bits/ 64 <210000000>;
+						required-opps = <&rpmpd_opp_svs_plus>;
+					};
+
+					opp-262500000 {
+						opp-hz = /bits/ 64 <262500000>;
+						required-opps = <&rpmpd_opp_nom>;
+					};
+				};
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.34.1

