Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D117627B3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 11:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236278AbiKNK7W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 05:59:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236247AbiKNK7V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 05:59:21 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB261C428
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:59:20 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id x102so1472742ede.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHhx2umn0ww7s/9z+eMU/waqeQBTYIwIbE0ugx524dM=;
        b=rwzzB3HgcOU2YnzrrqqsfG0WPxm01HgiqXZ37TcdN0fMgW0gPCD+RHOJBC86kNkaHb
         JiJ6iS3AdY+alzVPIZHti5RygvySjEZItzEqXSbzggioBXmVz3O6xjGjidNhHWYrd/Wa
         xr5kFfkCR/IyfBkg9x/zQ+7FLxxvZhrOgk57RDosgTAJOs8DV+kAFDr6I9TTCPyL3sgO
         sXP0ZA8RYEbATPkw2Sx+msmMbhnXsfS39zauX1oWaYglQBjYmIXkCiR9itOMv5jvrcJ1
         elhPwRyYYZNOov9OQBJgmmD2WgPDdwtnmxV0eOb+PxbXM4FucwLqnF4BbPA+Hs2ezLi4
         43HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHhx2umn0ww7s/9z+eMU/waqeQBTYIwIbE0ugx524dM=;
        b=K/OsQcLhau4Xl6MzDe/d1WmrTSJgTbjPMm3s3pYcZ1bsJYgl8naH+oF5fzaGl+qiY8
         24i4IJlxfkqDS5J0w5n4QI5q1n8gJIwXQKnbhiFznDD/D4aeAvCERwaiduaZe7Y5Fu8y
         GJFdO6Yk0GAhShlv23wsab6QtlTIMS6Unje6dWoH+XvYfaoqfF62iZqzosrP6yXy/18O
         NSdNxIE8qZwPsmNOa7Jy//cQMt7TIPsQIVLwNjF8Iung9ECcvw7RssAQX3tKiEnL/K11
         R3WotTqP3pTgnlAES8pUxJd7l53OeFA4hE7+esCt72hdUprlsiqFzjsHFib7IKeA9P1N
         XFxQ==
X-Gm-Message-State: ANoB5pm7DHK5SjXi5Mb4QtCSd8NstVXZtHNzJsrMuwIf8xjOp9q1kAWQ
        9gwq2/Xkvai3GiItLOTajgjGQMBlIh8G24T8
X-Google-Smtp-Source: AA0mqf7f/ent6oJjt4r7OuYr3KQrc58uD+FPqxPEgt+7rQ8vnXijcl8Rq9CSqyN3UuuGnwPznl8+qQ==
X-Received: by 2002:aa7:d352:0:b0:467:78ce:5fe6 with SMTP id m18-20020aa7d352000000b0046778ce5fe6mr8232475edr.325.1668423558882;
        Mon, 14 Nov 2022 02:59:18 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906210900b007a4e02e32ffsm4036308ejt.60.2022.11.14.02.59.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Nov 2022 02:59:18 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: qcom: sm6375: Add SMP2P for ADSP&CDSP
Date:   Mon, 14 Nov 2022 11:59:11 +0100
Message-Id: <20221114105913.37044-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221114105913.37044-1-konrad.dybcio@linaro.org>
References: <20221114105913.37044-1-konrad.dybcio@linaro.org>
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

Add nodes for ADSP&CDSP SMP2P.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 48 ++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index a5cf9852428b..a904fe5dd9dc 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -508,6 +508,54 @@ rpmpd_opp_turbo_no_cpr: opp9 {
 		};
 	};
 
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_LPASS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		smp2p_adsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_adsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_CDSP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.38.1

