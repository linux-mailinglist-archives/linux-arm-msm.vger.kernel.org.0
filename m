Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 037926F3027
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 12:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbjEAKVK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 06:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232357AbjEAKVI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 06:21:08 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03CA6E53
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 03:20:56 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-63b35789313so1600176b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 03:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682936455; x=1685528455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHlYfVSIlUv7hGQmE6g33A1D+HGAd8m4wWI+iWluRyQ=;
        b=kyb9iYRWJ0T9GXYIoXJ9Etz6KGQwlOAM30OZvmRMZklQGGszXI456Kx7O2qp6EsXpH
         Qe/PiK+RVIMDGk7bc7Bwkrh7MI+Nn9U8MRKW5umCgZNPxQCcOwdO8fO61uL10cq/xL8J
         8wJG3SCzE2zAIass8SHiqmAnPqydtOlhz5W9WMxvcI2Gnrel2NfLAOH2uPw6bZtimM+2
         rHi9TB8HB1+k33xJqN43BZwqfkjjYUmpZDfa+1xyXQLwmf5mpgEUsVu+9mEvWpF5J4JK
         fD19OKi7L33tMRJa7atgRYrv2cjpmezqvukDFubI+VywUi8aF1JPiBB8SrLQ0+foQGY5
         ur+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682936455; x=1685528455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHlYfVSIlUv7hGQmE6g33A1D+HGAd8m4wWI+iWluRyQ=;
        b=DozKpQfI0aLVriFPlQigVMmg+fD6Pdhx885PRpAUfgXLa5TP7j2qyZbXxcGlYVYvmf
         ByBQKFbXKLiNYI4L0oAXL6LNfgFa5l2h5YFdPsvYD89/unS+d517wGBfbzqPF8+4VXAu
         jM+Vyu/ZeQwp8roUwrJLrOWHfb7xLIBsvWmA3vsWtHuVhnQ7yNTrajrKW3YFJ8mDY5dV
         OxLHI6QY6qXtu26jrlEW29BowXZdMeC9Da66fOO5Zh2w5lM+dTW+9PkgS9pa3eVD/dHq
         6/GnXKBGJUe3ON8IBrWnOGljOa474TMoTUkjtteuFVC371dk2kDE4JHZ3Zw5cHX5GTzN
         6YyA==
X-Gm-Message-State: AC+VfDxLz7zQsaIUIk5nt+QsYmyKMxpod7rJUCNX05x3zB6T4VW91z27
        QbhW+rMWLMDmTxxazjW4/77QjW1Ew8CYSYLB8B8=
X-Google-Smtp-Source: ACHHUZ6MfOSHf7RGpJpAndKEFE7Ql34ANEYGkpQ97J7sBQyfp0va83p26e0NbTW8k3sYiu7P4/pdRg==
X-Received: by 2002:a05:6a00:21c3:b0:63d:489c:971 with SMTP id t3-20020a056a0021c300b0063d489c0971mr18732922pfj.24.1682936454992;
        Mon, 01 May 2023 03:20:54 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3b:58fa:39f6:37e1:bb9a:a094])
        by smtp.gmail.com with ESMTPSA id k16-20020aa788d0000000b00625616f59a1sm19198903pff.73.2023.05.01.03.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 03:20:54 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: qrb4210-rb2: Enable aDSP and cDSP remoteproc nodes
Date:   Mon,  1 May 2023 15:50:35 +0530
Message-Id: <20230501102035.1180701-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230501102035.1180701-1-bhupesh.sharma@linaro.org>
References: <20230501102035.1180701-1-bhupesh.sharma@linaro.org>
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

Add aDSP and cDSP remoteproc nodes for Qualcomm QRB4210 RB2 board.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index bff6ba1d689f..3ab46499d3fa 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -34,6 +34,16 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	status = "okay";
+	firmware-name = "qcom/sm6115/adsp.mdt";
+};
+
+&remoteproc_cdsp {
+	status = "okay";
+	firmware-name = "qcom/sm6115/cdsp.mdt";
+};
+
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm6125-regulators";
-- 
2.38.1

