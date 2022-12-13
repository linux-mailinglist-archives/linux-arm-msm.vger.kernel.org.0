Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D595664BC13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 19:33:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236530AbiLMSdi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 13:33:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236445AbiLMSdT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 13:33:19 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4695924BE0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 10:33:18 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id p8so6322313lfu.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 10:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksGsvN/7pu3308GYeGLVRZHiJ+Zmt5xVrgiqbPzB6uU=;
        b=KHE785GhnVqa57gzfPbGtC7eNf7/tGlM+05o5w3DWPkJIXquS5H1dqmw1gZiW73kmJ
         31m0n9uYea7TaHHg1zP6ydEth0XIvnm9sR+XeRu6K/7A8Kuyd5Gymf1p9VvPDceH7pcj
         zgS1wDhNMW59b5NC24Y21O8fx6ATr5Ni2AlZ0LDbEWfXKuUxUGoa2faW9GrNNQJ9G2YW
         02mDi0h933jfG1r6XkSzCwsdfvekORBXVbdEwVBNB6MkrLpJKjXaDJFbj9pLcJS/bEHk
         44tH1yPYtNOjO/i3a5xe0g4l9lcs5v2FWHkgSDUd8apbj/VkaHEmJ+F2n3/WlPwYzk9P
         mwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksGsvN/7pu3308GYeGLVRZHiJ+Zmt5xVrgiqbPzB6uU=;
        b=6/0VUe9bjzHEd+7QW40+S+4qGZZfYn3BZK2ebahTc0gkB30xafiWTJ3IatBbz0VLev
         lI/fcVAwxrPl+doEgCPgVQT9bHgMqwBJV5O9GGq7LZnHFuPnK6ek5KOfYAgR2KsVfZ6n
         8/q9N6nj4ZL8Kg/kuPl78lYmVLihSp93KxS/48Jp5jPf2YFvQUoth/q3v+x5wh+QbRQ6
         oUe6LyWHMYbvdoPcbxERJfiW2mAIz1ojyIpt+ONLaWTP1QCwZQueno8fkyYzqoNYP5TT
         seNrBfP9VWAMJ3P/HHCbmJx8nCvSNMMnBARYPZyGtB9g4bAS4g6lYU0x5h8+UM+Rv8bR
         2d9w==
X-Gm-Message-State: ANoB5pnHQrR9pGQJmukGziRUk376fhfNTjFCdaGe1UQ7uxO56sI8d7fD
        ryoK31DlptCjpV5mZc3m9CPRUWNuNYMpNiDL
X-Google-Smtp-Source: AA0mqf6h18RwTV2Gno6xS7F985WmlQZ6jX3aVpy3gWecqiJKC/pmNh8c1GDDQCh21cqWfLnXRLbqHw==
X-Received: by 2002:ac2:4346:0:b0:4a4:68b7:ded7 with SMTP id o6-20020ac24346000000b004a468b7ded7mr5045486lfl.51.1670956396438;
        Tue, 13 Dec 2022 10:33:16 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id t10-20020a056512208a00b004b501497b6fsm465963lfr.148.2022.12.13.10.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 10:33:15 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] arm64: dts: qcom: sm8250: Add fallback CCI compatible
Date:   Tue, 13 Dec 2022 19:33:03 +0100
Message-Id: <20221213183305.544644-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213183305.544644-1-konrad.dybcio@linaro.org>
References: <20221213183305.544644-1-konrad.dybcio@linaro.org>
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

Add a fallback CCI compatible, as required by bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
No changes in v2.

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 0c4ecdab1244..6d16857fed26 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3723,7 +3723,7 @@ videocc: clock-controller@abf0000 {
 		};
 
 		cci0: cci@ac4f000 {
-			compatible = "qcom,sm8250-cci";
+			compatible = "qcom,sm8250-cci", "qcom,msm8996-cci";
 			#address-cells = <1>;
 			#size-cells = <0>;
 
@@ -3764,7 +3764,7 @@ cci0_i2c1: i2c-bus@1 {
 		};
 
 		cci1: cci@ac50000 {
-			compatible = "qcom,sm8250-cci";
+			compatible = "qcom,sm8250-cci", "qcom,msm8996-cci";
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-- 
2.39.0

