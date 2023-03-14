Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A58A06B8C82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 09:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbjCNIFz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 04:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbjCNIFf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 04:05:35 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 296DF81CEB
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:05:18 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id u5so15701405plq.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678781118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/ORW+ZG5QT+TPocYHNFiE88/XBOJZ36UEuAeSGiS3k=;
        b=Ah5xLrCNiduHUWjN3eAaifuW7SBx2eBFJQeZCeBpzAd9oCHrqH41XV5WJgUV0AsMtm
         4rFmJW5lhmSwbaMxXEahhhQYnOGfaYmMMNUHCooR3qE64bce+IQ65e3+TGIqQ12kP5tM
         xzxXWOmF9wYI+IbWiTbGptEVE3FvQJqhOXOSTciVyyDBxfP6YACrSuszlmGCR4Vh8DRj
         JW5AVs8F5x3wiVXTZnaTOmWoC22marNdES2xjvcZQmUSJq8Pjrk2EaN0V7rm0UzRjRAC
         DeVJXmF5Dj0VKvxSL6UD9eWJkhdqQlw3zpiL/pVYrOazSIeGCh7kFRBK48KAW3vceflV
         G1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678781118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5/ORW+ZG5QT+TPocYHNFiE88/XBOJZ36UEuAeSGiS3k=;
        b=3gLmza4itPLDe8qugEyZwQg6WJuNMKllzkuCr+p8VYpoVg1RyGOE+9SzFmlVXHHR3B
         Dm3af1tSOSjdB8nTBYxdT7u2ZNk1CJd65N6tSxOFHi1EdmMltj0PRDd9/UoegSCm+6mr
         jJwQ2MGEXOBAdzMQNYmW/WFmKoOLdjqXoft8UjvH5cNQnrFET77VzrNEpaRHFGj6mni0
         V+z9izBo/17pcUa3PZ1iZYEYyklRPn7Zql+UEP9NMm2Dw+ExhEfE4Kw+lpwK+nV87ZeX
         7kvGWnFhu27shZD8HdXeaDucYnblXJ+BvLWkT7KrJDk3MCAFrqI0n/dk/uXDyuYHgC9a
         GPVg==
X-Gm-Message-State: AO0yUKUxw7zbYI7F11zCKRurXhNX16l0/jlekfqah6XVOFhvSp3MoasJ
        pXy1O8sQ+Ay/N08ncMED4K/q
X-Google-Smtp-Source: AK7set/SOSxTXU7eeyeseVznLYWE+Jvg5yOMvsbQOS7f2n2I04NMPOPYimkWYhhIQlGQw1/+K/sEAQ==
X-Received: by 2002:a17:902:e748:b0:19e:82d5:634c with SMTP id p8-20020a170902e74800b0019e82d5634cmr40549164plf.53.1678781118418;
        Tue, 14 Mar 2023 01:05:18 -0700 (PDT)
Received: from localhost.localdomain ([117.217.177.49])
        by smtp.gmail.com with ESMTPSA id l8-20020a170902f68800b001994a0f3380sm1078022plg.265.2023.03.14.01.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 01:05:17 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, james.morse@arm.com,
        mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
        quic_ppareek@quicinc.com, luca.weiss@fairphone.com,
        ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v8 04/14] arm64: dts: qcom: sc7180: Fix the base addresses of LLCC banks
Date:   Tue, 14 Mar 2023 13:34:33 +0530
Message-Id: <20230314080443.64635-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314080443.64635-1-manivannan.sadhasivam@linaro.org>
References: <20230314080443.64635-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

On SC7180, there is only one LLCC bank available. So let's just pass that
as "llcc0_base".

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index ebfa21e9ed8a..62cc9eb4882d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2760,7 +2760,7 @@ dc_noc: interconnect@9160000 {
 		system-cache-controller@9200000 {
 			compatible = "qcom,sc7180-llcc";
 			reg = <0 0x09200000 0 0x50000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg-names = "llcc0_base", "llcc_broadcast_base";
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

