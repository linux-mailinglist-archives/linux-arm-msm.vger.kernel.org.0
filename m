Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60EFB67CD1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 15:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbjAZOAJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 09:00:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231822AbjAZN7t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 08:59:49 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1377C3A9E
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:59:33 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id h16so1831844wrz.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RF2YyGY2PogpnFtO0lOlawE2OSglZRNn+XgKRaj3V+o=;
        b=uiBLnAVwS2GyS1HRbMqSi5MUkD9pZgyuG5ld57sC3WW/mTf4dgApP6wJ2EFmq8pET/
         SP9jA0BkIDIZLQXu4hpWFXvU0xHcf52eS8l9tfOB53FdpHg8i4OzcAujAS1dAcJmZhHg
         ncMf7V9MexDLVepUxHRFKUa2lbtIMwPgphkd22V9dI1SczoqsjVFBE4xz4cVqE2rLzqf
         a/mFTTdPlEQbH8vZieb+eFqLVvOhDN6cqsD13UDhI7kZgULVeeOr4vVpeuhhDwFs2APQ
         TpeIkDJ0/tYN2Y6Bfj0sznfA+z42vMfi74FpI88ieIQ1ZkO+kQ4dIVfSRFZ1Ku+8OdTm
         KowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RF2YyGY2PogpnFtO0lOlawE2OSglZRNn+XgKRaj3V+o=;
        b=xuXuTT5OuBaTBZKfA2j371eawrYALdF764Jbn1j+VZi6ObEOBEf/akxwK1W+jlBrM2
         Tz8xln4yRSECgMDxgn2RMUCx0pjhD0lGoJ0YMWeo1DK0sQ366Ky12G4lh38eO936INPK
         v4l6ODOPUNsf3ZdancXWgvUn2Xa99uOznsMSx1maas7Pfc5Z/Xpz08r7EqI9xEKLMJSC
         q4ns0K7v4zsn+1oPkjmx/vbOTT/bJC3LJvACfRMx4LrUqi75grR9czAM36vD+3Woub6K
         lJE/pYsIl0Ga8BP0Qb2UQshANj//SwzQLi5xkYkcKiNktkvS105wZ1JfhRvW6ADvKpah
         w9KQ==
X-Gm-Message-State: AFqh2kpp01mwRkDMNaPvFJiydjTmhiOaPg14n1dRAtcd6FDDiBSaSN9j
        mA7QjzSp0LoOEt+GSeahj4tXQQ==
X-Google-Smtp-Source: AMrXdXuCTjk6Okl662FT10hv63OmbQhiMMsNh+o2Utbekk3FmmpF/b+EF+eUGq1xlkBrh4Vkc6YuJg==
X-Received: by 2002:adf:e3cf:0:b0:2bd:c7c6:d1aa with SMTP id k15-20020adfe3cf000000b002bdc7c6d1aamr30375067wrm.35.1674741561720;
        Thu, 26 Jan 2023 05:59:21 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l15-20020a5d6d8f000000b002bfb37497a8sm1594067wrs.31.2023.01.26.05.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 05:59:21 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [RFC v2 6/7] arm64: dts: qcom: pm8550b: Add eUSB2 repeater node
Date:   Thu, 26 Jan 2023 15:59:08 +0200
Message-Id: <20230126135909.1624890-7-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126135909.1624890-1-abel.vesa@linaro.org>
References: <20230126135909.1624890-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Neil Armstrong <neil.armstrong@linaro.org>

Add nodes for the eUSB2 repeater found on the pm8550b SPMI PMIC.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8550b.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550b.dtsi b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
index 16bcfb64d735..72609f31c890 100644
--- a/arch/arm64/boot/dts/qcom/pm8550b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550b.dtsi
@@ -55,5 +55,11 @@ pm8550b_gpios: gpio@8800 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pm8550b_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,pm8550b-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
 	};
 };
-- 
2.34.1

