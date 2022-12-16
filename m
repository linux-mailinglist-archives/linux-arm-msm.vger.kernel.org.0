Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8177F64F511
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 00:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbiLPX3x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 18:29:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbiLPX3r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 18:29:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C81C67DAB
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 15:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671233334;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w4BtxFD6uNzaoOu9bZx/kJ3U6ajtggeXtCvgnndPkQ4=;
        b=gtC3kY+I3FSeEapjs5kupiAUhA8usHX6ESrKi90BbCz+ELqQQfuZmFtKKDJJnLVHkrmdRo
        yg7o18+VQItAqIoaeBfLzJAKorSK/Mkc8h5nwxOUooQNniEfXVdhEiqMRnb7Hzo+uu58lm
        iw8F8oP3C12uag/RML69b0dh7yO46tM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-ewZT1plONe2GYhuyDXtF4g-1; Fri, 16 Dec 2022 18:28:53 -0500
X-MC-Unique: ewZT1plONe2GYhuyDXtF4g-1
Received: by mail-qk1-f198.google.com with SMTP id x2-20020a05620a448200b006fa7dad5c1cso2945142qkp.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 15:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4BtxFD6uNzaoOu9bZx/kJ3U6ajtggeXtCvgnndPkQ4=;
        b=QTijM84SWs9lpKfD++sioeD3KRm37Ok71uJwQ7gnON0Dqzug+Tn+r/07+pTsI8FBa8
         04RAWuHsorMLfeQaN4G1GDKcET+y0GJKYz9HsKeLz9iKYpaPVJRPpIYB8S1fPEbhTrdO
         zAX6Bd4jkGdQKy+Zxpq9q1BkFp0OMvnVg3oawA36wrJIeM2yFvLMa8OkHbWZJGv3zMEN
         ISmuIl7Hjj26Bv31GMbyzpo1zISMynVOt2nnT0CR4xCSFaijDAovOBz14ClBNUlEqgL/
         92ftk4GC/+Qkx0CCeFMOmYjHLEE8U9UVLZRiC8LXGakjmww69Kj5BED8UAT/RO6ZMhbm
         aWLg==
X-Gm-Message-State: ANoB5pnYF5iWvtI7rWyUdI4W+AR6v4qW3PPIuNeGKZl+lFDRj4QSOSHT
        +zEyrTeW2HOIEbS1uOpiIFGsGWuyQAnXqmmftKxutBus25MdEuA8MRMETC699TmqrsFt9hR0IMl
        +ieEbnxq8n29YHAkwiVAdaKslAg==
X-Received: by 2002:a05:622a:148:b0:3a8:1ac5:47bd with SMTP id v8-20020a05622a014800b003a81ac547bdmr36216437qtw.32.1671233333129;
        Fri, 16 Dec 2022 15:28:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6FF85AlZ+J5JHnYn9fJoJI25V9d1BEBcI2Vkwmh/LiZ4jpUW+xSFo6Z7eZab53j/NxMYWslg==
X-Received: by 2002:a05:622a:148:b0:3a8:1ac5:47bd with SMTP id v8-20020a05622a014800b003a81ac547bdmr36216413qtw.32.1671233332918;
        Fri, 16 Dec 2022 15:28:52 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id a16-20020ac81090000000b003a82ca4e81csm2043298qtj.80.2022.12.16.15.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 15:28:51 -0800 (PST)
From:   Eric Chanudet <echanude@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Brian Masney <bmasney@redhat.com>,
        Eric Chanudet <echanude@redhat.com>
Subject: [PATCH v3 2/4] arm64: dts: qcom: sa8450p-pmics: add rtc node
Date:   Fri, 16 Dec 2022 18:26:04 -0500
Message-Id: <20221216232606.2123341-3-echanude@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216232606.2123341-1-echanude@redhat.com>
References: <20221216232606.2123341-1-echanude@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the rtc block on the first pmic to enable the rtc for
sa8540p-ride.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
index 34fc72896761..c9b8da43b237 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
@@ -13,6 +13,14 @@ pm8450a: pmic@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		rtc@6000 {
+			compatible = "qcom,pm8941-rtc";
+			reg = <0x6000>, <0x6100>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
+			wakeup-source;
+		};
+
 		pm8450a_gpios: gpio@c000 {
 			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
-- 
2.38.1

