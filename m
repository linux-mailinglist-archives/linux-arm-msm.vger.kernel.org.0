Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4906F649D51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 12:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbiLLLRj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 06:17:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbiLLLQe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 06:16:34 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A71013F83
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 03:10:55 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id g7so17961403lfv.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 03:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahjhNPXZvD+58zH1qXHW9UJeCkWe8VWwLFXeTy0nTzg=;
        b=KibbbwYTpZIZHtkidJc57gXM+WC37fOa/h9/RZzsRJG2NWv2Qe48tBH7qIMwr+ym55
         k9pEcQO8xZnuiT5g7fV6lDIVk9KcuyM5v2iLR2i1K4SW1aT8EkXv9NOVgsThP4EokMuk
         Qn17UXtXw5zEpiLTyIObSWUbKxAQgdGXo6Zq76jJnK+KaHVK+nc/eSz4vSzofx3fJH1y
         xw5crF9H/t8fJapuTpN1toyZaqnjxku+LqDdDfklSHmBOOurvVqpn2GXwQKpYhbbiy6r
         SkdpxeNsAqNjXnTSOLH4Zh1Fy1TXZt1k95uGkQxTsL3yk5Xt8VtpM+qWFfoQ/Wrq95DS
         o9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahjhNPXZvD+58zH1qXHW9UJeCkWe8VWwLFXeTy0nTzg=;
        b=Inplco344jZsHTy3msFoXgdMUtOMDgkbwon1sdBHnipWHEw/cNstllBWvM+FAdZU5t
         RBOOc9c3KCo+PgBWntoJQexcH8r4uwaBNTdFfIG+zqPZWEtBOHOuA2Zy8m8y4XFLx4qD
         HTgYLLJM9z9F2NYic8xJg6llC7lIVDrTFYumERzyqkCBi3vrozk92wpmxRmB271cZyCa
         sijV4tA2Zu08W15CbgSqCHGO3G2MoKSBeSMW2vJSf5531T7Bp4AdBktlIx/a+dpC2FMi
         uEc3FNuvnc3vomfbuqR/i3jDVzzKJi/duXma7rnhmCpEYAa9KanN9WQG6PZGuSFoPLlk
         lsAQ==
X-Gm-Message-State: ANoB5pk68G/lsGRVyfH1zf/5Ke5HuMQ82XflBd8pw/fdGCWwZgRPtnTY
        nUMJfzlWaJ8x7/8OQCngJQON75qZ58rKW4z9
X-Google-Smtp-Source: AA0mqf6bGjMxGJIePwLkGc4XnD9AfjRj5oBl36Mbb2mjraa+ElWNluUGDRHT+hG3kHu/JDIBzUGmtA==
X-Received: by 2002:a05:6512:6d1:b0:4a4:68b7:f877 with SMTP id u17-20020a05651206d100b004a468b7f877mr7347449lff.27.1670843454803;
        Mon, 12 Dec 2022 03:10:54 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id b4-20020a056512060400b004b57a810e09sm1599110lfe.288.2022.12.12.03.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 03:10:54 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] arm64: dts: qcom: sm8250: Use lowercase hex
Date:   Mon, 12 Dec 2022 12:10:35 +0100
Message-Id: <20221212111037.98160-8-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212111037.98160-1-konrad.dybcio@linaro.org>
References: <20221212111037.98160-1-konrad.dybcio@linaro.org>
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

Use lowercase hex, as that's the preferred and overwhermingly present
style.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 34 ++++++++++++++--------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 3e1e0acc7631..c008f49b5852 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2326,15 +2326,15 @@ swr1: soundwire-controller@3210000 {
 			qcom,din-ports = <0>;
 			qcom,dout-ports = <5>;
 
-			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1F 0x1F 0x07 0x00>;
-			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0B 0x01 0x00>;
-			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0B 0x00 0x00>;
-			qcom,ports-hstart =		/bits/ 8 <0xFF 0x03 0xFF 0xFF 0xFF>;
-			qcom,ports-hstop =		/bits/ 8 <0xFF 0x06 0xFF 0xFF 0xFF>;
-			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xFF 0xFF>;
-			qcom,ports-block-pack-mode =	/bits/ 8 <0xFF 0x00 0x01 0xFF 0xFF>;
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
 			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
-			qcom,ports-block-group-count =	/bits/ 8 <0xFF 0xFF 0xFF 0xFF 0x00>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
 
 			#sound-dai-cells = <1>;
 			#address-cells = <2>;
@@ -2378,15 +2378,15 @@ swr2: soundwire-controller@3230000 {
 
 			qcom,din-ports = <5>;
 			qcom,dout-ports = <0>;
-			qcom,ports-sinterval-low =	/bits/ 8 <0xFF 0x01 0x01 0x03 0x03>;
-			qcom,ports-offset1 =		/bits/ 8 <0xFF 0x01 0x00 0x02 0x00>;
-			qcom,ports-offset2 =		/bits/ 8 <0xFF 0x00 0x00 0x00 0x00>;
-			qcom,ports-block-pack-mode =	/bits/ 8 <0xFF 0xFF 0xFF 0xFF 0xFF>;
-			qcom,ports-hstart =		/bits/ 8 <0xFF 0xFF 0xFF 0xFF 0xFF>;
-			qcom,ports-hstop =		/bits/ 8 <0xFF 0xFF 0xFF 0xFF 0xFF>;
-			qcom,ports-word-length =	/bits/ 8 <0xFF 0xFF 0xFF 0xFF 0xFF>;
-			qcom,ports-block-group-count =	/bits/ 8 <0xFF 0xFF 0xFF 0xFF 0xFF>;
-			qcom,ports-lane-control =	/bits/ 8 <0xFF 0x00 0x01 0x00 0x01>;
+			qcom,ports-sinterval-low =	/bits/ 8 <0xff 0x01 0x01 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0xff 0x01 0x00 0x02 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0xff 0x00 0x00 0x00 0x00>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0x00 0x01 0x00 0x01>;
 			#sound-dai-cells = <1>;
 			#address-cells = <2>;
 			#size-cells = <0>;
-- 
2.38.1

