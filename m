Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4392E68D393
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 11:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbjBGKHL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 05:07:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231710AbjBGKHI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 05:07:08 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07BE846A1
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 02:07:02 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id i5so5817751wrc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 02:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXvmrp1e2c3eR/W4yiRq7uPHVhG6kKlslQK7in15eks=;
        b=SZENXQmWZzwSmDdoBZMkfIIuLXOBosbfRXHllFc3IGkGARjHWis01z+G+khhySHT4M
         vGGU5eQguMGnxRX62kiiK4QDV4oI26efdy2XL4XqnLS//vV4InMDsV6mOuife8RU5BB7
         KuzCeAJw6XkgqmgENpoFLaE6COpny9sBacOp4/Ry8jYGF2M3ENA9uk0KBE5rZVNbemYj
         gui97/RJaGky7J5PPYyvFqASMOmVZVHTJXg/gg/VWt1kKFSRaX7YU6RmRe94AH7sskV+
         BaEKjlARIMmzc9rj3Qnfi6xyOLEG4OatlHHkiTcF/pUC4Hw0Q8ZO4yN8FZisCs2zHq/I
         okcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXvmrp1e2c3eR/W4yiRq7uPHVhG6kKlslQK7in15eks=;
        b=o5uID0scsJe0XD0i/hey5EtDlTTXLEGqlJTsT0bzwp7f3A14c4bZMW1gB/p3oPDxgu
         PvELE8kI9oEG1WPKE0/97V9SrUAey6gCFMEw6eR/eH5Bb2xxWOZg2hPAIqFcQ6I6dV+G
         ioNTUaZZPVRMXIeJ8qqpB1oUyU0wvnjA99Ema+gQtYp8+SkCg24xSaM96ltI0En1qONS
         b5P5UdJ4GA0C2v47vq5CUjNnjB6UyioNgWkrc8TUB5tpFg5smBhNuJVE988fzHzl5vY3
         5i4Ydt6/ZoXlpESN11cRaAGRv8dSkf6ScTRhwDj/vPPtE8FgcyqsBISR0pRBXhA3CkMG
         Oy2w==
X-Gm-Message-State: AO0yUKXSgxcwh9Js2ibBoe1q1aDa4I4GbMd8xKq4QA1Pjq5C/D/8GdP7
        mehiVS7aRMoSvOU6Y10ve9iINw==
X-Google-Smtp-Source: AK7set9dfLbEeekzy2n6PXv2B0T4vB5k+F+0FH97eNpoNyhtvk6xhs2elqkxhywoPzADVs+g25/QHw==
X-Received: by 2002:adf:dd12:0:b0:2c3:f26f:8cca with SMTP id a18-20020adfdd12000000b002c3f26f8ccamr1860104wrm.67.1675764420656;
        Tue, 07 Feb 2023 02:07:00 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600002ab00b002bfb5ebf8cfsm11428205wry.21.2023.02.07.02.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 02:07:00 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 07 Feb 2023 11:06:58 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: pmk8550: fix PON compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-topic-sm8550-upstream-sm8550-dt-fix-v1-2-698d132ab285@linaro.org>
References: <20230207-topic-sm8550-upstream-sm8550-dt-fix-v1-0-698d132ab285@linaro.org>
In-Reply-To: <20230207-topic-sm8550-upstream-sm8550-dt-fix-v1-0-698d132ab285@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The right compatible is qcom,pmk8350-pon, it matches the
reg resources associated to the node and the subnodes compatible
properties.

Fixes: e9c0a4e48489 ("arm64: dts: qcom: Add PMK8550 pmic dtsi")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmk8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
index 47213d05bf92..201efeda7d2d 100644
--- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
@@ -16,7 +16,7 @@ pmk8550: pmic@0 {
 		#size-cells = <0>;
 
 		pmk8550_pon: pon@1300 {
-			compatible = "qcom,pm8998-pon";
+			compatible = "qcom,pmk8350-pon";
 			reg = <0x1300>, <0x800>;
 			reg-names = "hlos", "pbs";
 

-- 
2.34.1

