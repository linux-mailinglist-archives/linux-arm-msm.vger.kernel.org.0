Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCB2675574
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 14:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbjATNSk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 08:18:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbjATNSf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 08:18:35 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB25C41E5
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 05:14:54 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id mp20so13827358ejc.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 05:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySBpf/g54h4mieeOX1iTHn4nbDJmcd4e2yinCvFCp5c=;
        b=LQoXIY51ocKZoiJFhh/AKSvIacV/F1db3r+IWRBBO5CRnSUd4/y6t+JPN0hZcOZC4j
         5g67O4XNBTR/+4FcVFML8g5LzcxfzWKtB9YbLXV3o/Db+9DuJBVvgDmf6VRweZz9QhDU
         bV1mIusIhlsezQ+F7aqLrpXr/4I4jyYEmNI8gosKdTeftWaoFn1xi/3E81QKglReGzWm
         TGMHSuUcV+YZiR5D5WDxbZsbn3viFZ1oQNXG1fdq0+VPKfTaNemr1mbtrXs9xNrEEgw4
         7JVC9CibLH/pdTT/Po5D4c3F3Oiyy4xXwS3aNWAxEZNeXLTRFj386RA7xlUos4xg0BOx
         gGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySBpf/g54h4mieeOX1iTHn4nbDJmcd4e2yinCvFCp5c=;
        b=aDIu1hChFQM7y3difhJvMnvXhUbtXkXkHboQ5uxroFgmWhGHcgIPrsAWlo80hDiibb
         bvgGVBNN+o66MoNVwrwvk/uPpkM3ex/VbFBSJ849xivSHzHex1VCZ0C1JEBh34yeZ5mJ
         0tP6FB0SKSYI2XbMeKdF+fTZUufRLjt4FfEL0Nu4RHaggzgfjqRlnbvShy9Lgj75Z9se
         9OEznoq63qSVj4sn6KMWu428ru0A7Yz+WAkaes7i/+xGKtBuxUX+ZQeW32YQmTcWdBAH
         vLS7epgTp2XGLkKFdhtUnlf/4hm35o7/UN65aiGT3jijxJpU1Xs2iwU2mypcgaf62qSn
         I3+Q==
X-Gm-Message-State: AFqh2kriToxjDnz3lRkw0fq6+F3yX6INeRDQSSZxroAOs1cBFcejnLA2
        cK0mxLTwvcAJVx2sVXpWazf36w==
X-Google-Smtp-Source: AMrXdXvwTGSr0VTfDAVxv+4egpg34iuffH5U0RjzGKJRCWUe2ybZYxw/9OuLWcE4dBOerhoopk/deA==
X-Received: by 2002:a17:906:c7cc:b0:7ae:bfec:74c7 with SMTP id dc12-20020a170906c7cc00b007aebfec74c7mr14237590ejb.72.1674220492599;
        Fri, 20 Jan 2023 05:14:52 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709061be100b0086f40238403sm8063276ejg.223.2023.01.20.05.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 05:14:52 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 20 Jan 2023 14:13:45 +0100
Subject: [PATCH v2 2/4] arm64: dts: qcom: sm6350: Add camera clock
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221213-sm6350-cci-v2-2-15c2c14c34bb@fairphone.com>
References: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
In-Reply-To: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12-dev-78462
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a node for the camcc found on SM6350 SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 8224adb99948..300ced5cda57 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1435,6 +1435,15 @@ usb_1_dwc3: usb@a600000 {
 			};
 		};
 
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,sm6350-camcc";
+			reg = <0 0x0ad00000 0 0x16000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm6350-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x64>;

-- 
2.39.1

