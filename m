Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77E916B954C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 14:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjCNNFB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 09:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbjCNNE2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 09:04:28 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72FE885A49
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 06:00:38 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id f18so19927961lfa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 06:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678798818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqZsJOX1El+luUmSocWq2Ruds493hltfIeGTUI/M7s0=;
        b=CuYPXI+gqmXBO5GLmwjK9ZwpOlIgoZ0QaYauVwUAMLRsDPHVjxwoHAwdU4xhQqVZ1y
         qe0NRtEWef4IRT7+kdzrgENaCljIVOtqP4VOUustSsgjjTAHYNCtL/ffv/PUMyqPdKkI
         5B3/f7ZEZYcR0sYXnhKz2Jbo+W4j+GuEEbvIQj6ST+9e8sZVoGzO7XJ9g8ls3C9GA6VL
         YZKALQhlQ3gDqRTRl9Y2tZ36tovedhu12g/6ktC9M8S2THKGxGZO3XNfZKE8nvnNtRHa
         lYYvqv3IGJelbKIrd1nbG03B76ilUkPVnJvbxMgPRV8lJdXk/rYxbFjmOOKfJUBahFSL
         uhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678798818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqZsJOX1El+luUmSocWq2Ruds493hltfIeGTUI/M7s0=;
        b=Yu3L3zkbOj2STBXIPtFKK9fc/hD1zdrAxFAjhKiTeZfnJPNjkPaBm5cuywNNwr98xx
         JUCdDN2YDBLV7mlSVTPYcahql6bangTKa5XK5+cfgcbTA2Kj2R5Z3XC/P83dYHjMzFjC
         abl4hJ0JNfPYVNT59c42TrLsc1DWeoFowo7ful6VO8+fxuNICrSAh+/BTkYRID0Y9/Hl
         KYoox68KTymCqyjZL73zA/Rh7VyViimk/8ruN+72SKgwXmBQAyamfpFUuiSdfk+SCIQ2
         Iu4tV/zjYc9KkGBP4Jx1CxeLCjU/f5KIFJhq2xSdAHG7ENTlbedlrINXhkz++NF6I4yk
         1z3w==
X-Gm-Message-State: AO0yUKUsX/KNOAl+5+KWd7hmUTbvjcEJGhw2SKs+r1JBfPMvstSZXuHp
        UVuiXf6D22yP5tPIbSqBSqmYewDcSPfckbVLeB4=
X-Google-Smtp-Source: AK7set9qOvhwQgOeP4U1McR7yj1LUoKO8eAR6fKuhFRTzvH3/lO2wA88LCnFpHmHEttF3cZT0GEPtg==
X-Received: by 2002:ac2:5a11:0:b0:4dd:afb4:26b3 with SMTP id q17-20020ac25a11000000b004ddafb426b3mr768141lfn.16.1678798391245;
        Tue, 14 Mar 2023 05:53:11 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id s9-20020a19ad49000000b004dda74eccafsm395374lfd.68.2023.03.14.05.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 05:53:10 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 14 Mar 2023 13:52:57 +0100
Subject: [PATCH 2/6] dt-bindings: dmaengine: qcom: gpi: Add QCM2290 GPI DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230314-topic-2290_compats-v1-2-47e26c3c0365@linaro.org>
References: <20230314-topic-2290_compats-v1-0-47e26c3c0365@linaro.org>
In-Reply-To: <20230314-topic-2290_compats-v1-0-47e26c3c0365@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678798384; l=817;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9mAqu5IGrrdUOaP0PlfWAkH94BH0kiBbnQ1iZWRCDUM=;
 b=Sh44OBUk8yAs+WqMAoK2kFFPM3jib6rHQJUJlUycILo2oU82/iPMiKJDnydXvXJL+YhzIpMEFN+N
 sGnknaghBoSI8VGUuzX1St9M1lXVjwwnkKWcthQp66XIHR9eCzzo
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

Add a compatible for the single GPI DMA controller on QCM2290. It uses
the same 0x10000 offset as SM6350.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index fc5de7b6f19e..f61145c91b6d 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,sm6350-gpi-dma
       - items:
           - enum:
+              - qcom,qcm2290-gpi-dma
               - qcom,qdu1000-gpi-dma
               - qcom,sc7280-gpi-dma
               - qcom,sm6115-gpi-dma

-- 
2.39.2

