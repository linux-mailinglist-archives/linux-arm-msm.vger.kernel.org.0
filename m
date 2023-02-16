Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E83206994D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 13:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbjBPMxF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 07:53:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbjBPMxE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 07:53:04 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138AE41B7C
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 04:53:03 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id bk16so1718199wrb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 04:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOlcxYbFV1QWfu0q4yI7Y8XhpMc15c4VHRcGdANSUSE=;
        b=vGywFXh9F/9t/qsH78rosSvNnut2PMCb0Rr2tiIPebqHzYdOlyFbdB2WyxqDxmcpCT
         gAtP6i/WYxYWUF2XNXreu9hMUsiU4I6UFwFQLRLhe2KNY/fAQuB3ET3ZqYY1K5kH2kYi
         96PfurybC3c88s07+0UZKNuY8+XIYyDAIOLzBiqNrCdLK1c30WPbt7IBNW1msA1dNnSl
         1tGoJNgOFELeSvLD1B3edfJRcT8Y/pw+rZzZw/pBu1dJHKftCF8ajgQ8z7s8hjA/egXE
         F7SQSMJ6ERJ1vfvmemiiglicQruruZUbR46RbdsZdn5GZXVvmUYR2r7LkgahmEhmCmHG
         dkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOlcxYbFV1QWfu0q4yI7Y8XhpMc15c4VHRcGdANSUSE=;
        b=Xam4wAkAjLLNbTrrwQ1npCQGCiMoW8/V01F78V3h6QRXVbqJZ9DhwFq1gCYCscBBGE
         0yYUs7fSzPwOJRHjdUQawUil10mX0bKCnSUpgF256U1g9uMfiWcQrhCfHl8e6aiK7M9z
         N9v6jPNoq72r+uILMz4gRGH0PFk1KoiPUgRsQFK2jVmBzdkbRFfJ+fi4OqohELT4mbvt
         yL/DjEGtlbeh2UD9hz7Se/uYlm0iTmXuTPX+r4k2yDhpCkcJbfSkqZog/60uHZJa4wm6
         W55RduOJRr+S2K3a6tqvVduMM+WPTQgyOi24UD4QMgXH9SfZb2izNPNZfFlEqS827f4K
         b+AQ==
X-Gm-Message-State: AO0yUKVUCQKgznT1/SoISqSpoon4+lcgnpQg2BflLdF+6JcuzxETmgNJ
        mZWEIJ/ht5hh5RXsL2B/XmtEhg==
X-Google-Smtp-Source: AK7set/k5C/fxcrmxqhk/K0SZwIXRY9xmR4qvAhJbJJstjG6jrsIC2EqYZxDfP/z5G4+e6SlOSrv6A==
X-Received: by 2002:a05:6000:120e:b0:2c5:63df:1171 with SMTP id e14-20020a056000120e00b002c563df1171mr5365114wrx.19.1676551981509;
        Thu, 16 Feb 2023 04:53:01 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7c5b:1160:db5d:72da])
        by smtp.gmail.com with ESMTPSA id h18-20020adffd52000000b002be5bdbe40csm1453292wrs.27.2023.02.16.04.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:53:01 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 1/9] arm64: dts: qcom: sa8775p: add the QUPv3 #2 node
Date:   Thu, 16 Feb 2023 13:52:49 +0100
Message-Id: <20230216125257.112300-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230216125257.112300-1-brgl@bgdev.pl>
References: <20230216125257.112300-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the second instance of the QUPv3 engine to the sa8775p.dtsi.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 565c1376073e..894c0662afb4 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -491,6 +491,19 @@ &clk_virt SLAVE_QUP_CORE_1 0>,
 			};
 		};
 
+		qupv3_id_2: geniqup@8c0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x8c0000 0x0 0x6000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
+			clock-names = "m-ahb", "s-ahb";
+			iommus = <&apps_smmu 0x5a3 0x0>;
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
-- 
2.37.2

