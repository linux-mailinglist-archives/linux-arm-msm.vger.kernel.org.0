Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2D176B5772
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Mar 2023 02:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbjCKBWk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 20:22:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbjCKBWU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 20:22:20 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD1CD13E507
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 17:21:57 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id n2so8903678lfb.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 17:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678497716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stOPeYTP4PtrTxc9DZ8WUp41vUN4jSPIr3dhvopb3F8=;
        b=VqbZLgDNDvxLQMHekol6z+Jh2KnJKO6S1UBzUMCb5XmoWt+48cFVHI3kwKf+TGDfTt
         E+BVHcm8yqcD+erNs1inxYh4/OzNBtMvJp5IebICMRQJaX5SJuUX/ALouIeEKRBUyn41
         nt0zeER0eFFFP1IFy8yqYruzUCP0bEwFEeP+T8/dq4Bw1W+zdqZhv4pzbQqx/mtb1z1g
         vYLasiELSCuMJwdBdPMgWjy9F6WHNXlYiAFdlghmQeaXX/KbB7mOhk9PuUyCwZbLNDqv
         zjSGClzQw+0zH+5JZwGNnSb6dKckCYFg9/BSFnoSj29WFQh6j8rblmqvWag+Puw0Ik/M
         eGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678497716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stOPeYTP4PtrTxc9DZ8WUp41vUN4jSPIr3dhvopb3F8=;
        b=oiD7upFUu5CxTwNt4qZ3wvjsZu1Vcw5lSWEAnCifMvxPvktqaaq0Iiy53lsWL9rOsF
         kM2SXHdjrQMFmo+8HBL++fCj58NsApcSiocrA8Tu9Pk/DPl4BQ/OHBaAQuyrLHvp6N25
         CtwdJ0mR8vfGNz3+Wrx+QARp4rNZ9kGXm+HsAIkfV9fwxtFlfydsIff6qF66dNrjf25z
         kR3wiNhu1V0Cu07VZgm6bpbaRfoZFoP0xI9SlgNELOxc7XYZdGhIIXKTLVcN3WBm2wnG
         4k2wCJN7W77qLizWJirNzmj1E/g08wDWo7U4X2EC/PlM7oEQd+DwRl13UWM13IEt3ujB
         C5gA==
X-Gm-Message-State: AO0yUKXTE5dkcy/nOdh1nLZNXjl3i1d5rrjtDHDu7JamhsfpGnl5etyr
        B3oLgoUFpsEDe6P3KfHI1tV9WUHntkXBOnHKApE=
X-Google-Smtp-Source: AK7set9vEy4CSMSNZEtuiOy7SpTreQUEFlEBh44RJKThs8nStf5ddc/4lzOcHBHBpDRQ99tyRIocKw==
X-Received: by 2002:ac2:51a4:0:b0:4dc:5036:e713 with SMTP id f4-20020ac251a4000000b004dc5036e713mr7993659lfk.32.1678497715869;
        Fri, 10 Mar 2023 17:21:55 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id y26-20020ac2447a000000b004db25f2c103sm142318lfl.86.2023.03.10.17.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 17:21:55 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 11 Mar 2023 02:21:40 +0100
Subject: [PATCH RFC 10/15] arm64: dts: qcom: sm6115: Add simple-mfd to
 rpm_msg_ram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230311-topic-msg_ram-v1-10-e9c2094daf09@linaro.org>
References: <20230311-topic-msg_ram-v1-0-e9c2094daf09@linaro.org>
In-Reply-To: <20230311-topic-msg_ram-v1-0-e9c2094daf09@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678497700; l=704;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=auavZS2vxRrYxwmw6Ymd+4fnG6KUURpDEkcukQIXo1w=;
 b=O/gnJPWRXnH9BYZZxrZCMkvKzi/qqPVny/KrM7noM5nmMthv8J5qZVvauUlVJ4Jq4/iphMXhaBPp
 3+k/oYyTAbQLuZkemVMEW1iEMeLO/TMzDD8vVqGDfmFBfMB81LLt
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the missing compatible to make the node compliant with the bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index fbd67d2c8d78..985c9bd55f05 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -705,7 +705,7 @@ tsens0: thermal-sensor@4410000 {
 		};
 
 		rpm_msg_ram: sram@45f0000 {
-			compatible = "qcom,rpm-msg-ram";
+			compatible = "qcom,rpm-msg-ram", "simple-mfd";
 			reg = <0x0 0x045f0000 0x0 0x7000>;
 		};
 

-- 
2.39.2

