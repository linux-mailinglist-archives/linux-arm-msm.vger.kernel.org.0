Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2D38712D3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 21:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243187AbjEZTXG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 15:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243417AbjEZTXB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 15:23:01 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F361E61
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:22:57 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-528dd896165so753828a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685128976; x=1687720976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bfn7W4wlvGKYY1Xv+0AM7IhBXt2kfIwNQPmd+vEv/4w=;
        b=Dtoy7ewh54wR5VT72iH4ijb/9S+LZy3gcmEkuL3y9fXW/n43FVEitTHRQhuWvtZSOg
         KA7OKe8eJ3Mosl1THk8rMj+NSGnAmVmHIJ1Lk02nAqUwFpvw+i0aMp4SbTwyr3HAWnp2
         JOhXtWjEtdochNrzeiJmvZtuw3TCJxpCMon/9fr1hloWj0W9SVPjI3BuiGDEQUXbNcaH
         IvcPLGvRtVvw23Jxo/0SS3B58mRuAj2X3XtAOz99PzN0hfQ95yKL0JT+80glWyrCaEHW
         2cjZ4au835aDEGbdkFmtQYoDVRbRTF5LqKIFCMTTjbFzcrKh0SMiGDH0ISd1sIhP7QIf
         axqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685128976; x=1687720976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bfn7W4wlvGKYY1Xv+0AM7IhBXt2kfIwNQPmd+vEv/4w=;
        b=LYuzpyJWz5uGwVoPTeFVc51xP/e3R/bVqPB8F429XeQhgzOzzPZP+aErTsOICmswmY
         Xw+KsjygBDZ5BvuG3yiWbEFW2XmIfLCXQ+/qQ3OUWOyQGbiNmtaWzyNv0MuGia4ZWYTN
         UTiiAuu+UAKafyhm13wbxQN0q/gA1JGQxXCnPgfl7aYE2HBFMeYsvSJPn5NLBV+cG/Fv
         OStqtiINbdE5qMaZKLJfx2aoKx9aU7o0/I9VXwsx4VmonVrAgln5BC93AR9EWpEhASY0
         jZBTbLg/fY+V+KAkgu6y3KwKdDaASTZ7j2/nstg15kLGlT2EQFrcHNIRHUQZTMIzQWRU
         pQng==
X-Gm-Message-State: AC+VfDwi+1+28uU4lh04V8DHt6IzPf3k+fq39M/QE6i/e+p5n9sECRW6
        ackjl1ooMX3karAuGLVymJ9svEdz640WVnUves4=
X-Google-Smtp-Source: ACHHUZ5wANoFsNTRQmDGKRNutkbGrk9m4YPYtyi77j8epfqprAhfnQpkcsQ20alJ3V6q4FfYvzj5SA==
X-Received: by 2002:a17:902:d4ca:b0:1b0:440:7f5f with SMTP id o10-20020a170902d4ca00b001b004407f5fmr4451943plg.49.1685128975895;
        Fri, 26 May 2023 12:22:55 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3a:6990:1a5c:b29f:f8cf:923c])
        by smtp.gmail.com with ESMTPSA id q18-20020a17090311d200b001b008b3dee2sm1955079plh.287.2023.05.26.12.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 12:22:55 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org, djakov@kernel.org,
        stephan@gerhold.net, Anders Roxell <anders.roxell@linaro.org>,
        Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v8 04/11] arm64: dts: qcom: sdm845: Fix the slimbam DMA engine compatible string
Date:   Sat, 27 May 2023 00:52:03 +0530
Message-Id: <20230526192210.3146896-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230526192210.3146896-1-bhupesh.sharma@linaro.org>
References: <20230526192210.3146896-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As per documentation, Qualcomm SDM845 SoC supports SLIMBAM DMA
engine v1.7.4, so use the correct compatible strings.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Tested-by: Anders Roxell <anders.roxell@linaro.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index cdeb05e95674..0d1d7328cd62 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -5221,7 +5221,7 @@ msi-controller@17a40000 {
 		};
 
 		slimbam: dma-controller@17184000 {
-			compatible = "qcom,bam-v1.7.0";
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			qcom,controlled-remotely;
 			reg = <0 0x17184000 0 0x2a000>;
 			num-channels = <31>;
-- 
2.38.1

