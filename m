Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C891675CC0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jul 2023 17:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbjGUPhD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jul 2023 11:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232151AbjGUPgt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jul 2023 11:36:49 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE9D73ABF
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jul 2023 08:36:29 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso3463256e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jul 2023 08:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689953787; x=1690558587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13Rk7PvVFVgZK5/Lw6qbyP9+OCjNsRZI/rlhzen0zEs=;
        b=bFqce4tOxRhS79xNa8XdfoI8bfrfZj7bVLuLQJ997jH83CCHETDazhJLM1T5cdgxmM
         mn6WfH2AEocg42ZQUfZsqGTRl/vTr/VBHpMsrFaEp8BkW2BpJ6nX1HxlNTnd+Qh6C7ZB
         8VclWolHj2b1BLXJh+0dk6YS/yRvnwQdZHWNQASWlBjTKBtgfARQJP8IGLqo5UXkePU3
         ITm65ItIj2eYO3X7bBmteeZ1aZ7Ket/3ghR4Me7jv1+wS5sTvsufRNJP376S48Jp0o2C
         Ldkjjqd47kwjpfQgTfJaDIltr98Wj16ENfqPxTmKEmMTfP5m1nRKQQLbEWvK7P/4g437
         g+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689953787; x=1690558587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13Rk7PvVFVgZK5/Lw6qbyP9+OCjNsRZI/rlhzen0zEs=;
        b=eDP9FmWggZPLOZ337jX0Zrc0AzuzwepqgSH7EyJ0h4Uydm8uIR60IVUiETzTY835iU
         dg+/ylnR+ky5wWzTUEtin3X2JuZZH05ZHUx17svoZHjOwAaVbB3fDrytgCjDq6TsU2pg
         K9BeDj099x8nLF5iiLSbVxjufuU8Irqmekci04lw65ufPeYm/BSEg95r4tApipllQN5x
         Y4jpc02CjBSQRLMdQwX1cPMqHZt1NnnPhKw3rjC3R4iB8bqCEdctdJMD3f/Nm34QbrwD
         V7rxVIuak+DZCIx2w/t6LtgYGAPTfQvs7QOwwNKVWYUbQr9OH+sOqlN8qXhk5mZvL3cp
         +Cww==
X-Gm-Message-State: ABy/qLZ+2bH4I/L2CORR5WFNsk4CQT+g02RZnxnSpf8nki4Pid28i667
        6Ch67XFJFvtcYYAZGiBZ1osmCA==
X-Google-Smtp-Source: APBJJlENs02T2o88jYqblKOTzLm3XOslc8hnQvsNXrUU2w8srbiPqe5hxM++s3Z2yuyXb/TqAUSs7g==
X-Received: by 2002:a05:6512:1095:b0:4f8:cd67:88e6 with SMTP id j21-20020a056512109500b004f8cd6788e6mr1581174lfg.44.1689953787678;
        Fri, 21 Jul 2023 08:36:27 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id t9-20020a19ad09000000b004fba1278e6dsm782535lfc.107.2023.07.21.08.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 08:36:27 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 21 Jul 2023 17:36:13 +0200
Subject: [PATCH 10/11] arm64: dts: qcom: msm8996: Remove AGGRE2 clock from
 SLPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v1-10-cf6cd5c621d5@linaro.org>
References: <20230721-topic-rpm_clk_cleanup-v1-0-cf6cd5c621d5@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v1-0-cf6cd5c621d5@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689953767; l=853;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=UyucyOzYTTTxD70LJmIkWWdISyHLh4eJOt7zI+SIcSc=;
 b=SGaVWPNOwmDWM5smDku4+YSzJd6XCRol8QjB7HGBG4KbxEUG8XuLd31PXbP1vd5GvmUWy5bJ6
 05VGfY5ItaxCHgSeRCPhqSn2qdl0YCnUhPDoeVgqC6r6XlCP0W3gulg
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The AGGRE2 clock is a clock for the entire AGGRE2 bus, managed from
within the interconnect driver. Attaching it to SLPI was a total hack.
Get rid of it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 0e1cdb5335eb..ea383cf178e5 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2433,9 +2433,8 @@ slpi_pil: remoteproc@1c00000 {
 					  "handover",
 					  "stop-ack";
 
-			clocks = <&xo_board>,
-				 <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
-			clock-names = "xo", "aggre2";
+			clocks = <&xo_board>;
+			clock-names = "xo";
 
 			memory-region = <&slpi_mem>;
 

-- 
2.41.0

