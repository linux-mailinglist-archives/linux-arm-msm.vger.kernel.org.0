Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 080DE64F50B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 00:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbiLPX3j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 18:29:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiLPX3i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 18:29:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E5728710
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 15:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671233330;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LfWbuY2Nzj8geuaHp1jhfQ6giSwZLaTK35PfBVw+w04=;
        b=BTZpdxSTOmMuXcxa3tbpTKWu1GoI+orGW6DUQYcMzSm6TrDNMOb+bdMaGDenLKwsKQyRHv
        MlL3DQVqSX7QFxkWJ+ywF+zrP5h5pnaoRgWKbUrlDZIon0tO9UevMIM2qTS3lyZEBZHu4G
        W9sSukCr3INhPbQGxDSXMn6nBaG4PpM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-c0V0VA92MGKF-GqLLMfp4w-1; Fri, 16 Dec 2022 18:28:48 -0500
X-MC-Unique: c0V0VA92MGKF-GqLLMfp4w-1
Received: by mail-qk1-f198.google.com with SMTP id bj4-20020a05620a190400b006fc7c5d454cso2940884qkb.14
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 15:28:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfWbuY2Nzj8geuaHp1jhfQ6giSwZLaTK35PfBVw+w04=;
        b=xDFZVJgbmfI9G/xrPcvT37WI7jEHn1SoVZQh59B9iVaM3pToJfuHcLQ8BFgsDKZAJG
         OJIFbCtG5c769aZxT4LmgaigUVkUt7a0kc6T+AD94kJXJXTGb2/kuplxykV0fcMFj+7T
         CuII/f/VPyAquP6hVudboYwOMEhlrRyRoLcAs23O0l7/OC6tJ9ktI3rSZu0G5KYwL29a
         DcypDZhh19AQE3JfEoND8mYkzHMgQ+yxceZIpIwA4DabQtVsUizdsWOnaSxF2Tzkja4o
         lNq7jWav07yAaFegR8wimaEX5WArVv+WH6gDvFiq/074pa+RjmQ5CVJ2Hqimryn28y47
         tnLw==
X-Gm-Message-State: ANoB5pnDzL0iatb7qE4uoh0BfZMc2bs2PgKwazxN5UvCzUKLf2YQgxik
        UxcMf3Q7/PVJlQS8RaHlz37ZNzsU4osQh+/fdSdWIVAIvZNL5wJz3MXIoZMcYvpmGrv0cHzGVlY
        4YvqA4yOSIewnfwFj0V2vIAKTEQ==
X-Received: by 2002:a05:622a:4892:b0:3a3:56f7:196a with SMTP id fc18-20020a05622a489200b003a356f7196amr54110836qtb.7.1671233327996;
        Fri, 16 Dec 2022 15:28:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4+xhpEzJrK4BApIroXNlQRVm+twiSeTowTgWXDWiBnm+NpWCClAv1iOJEy+9+iNePzECkSig==
X-Received: by 2002:a05:622a:4892:b0:3a3:56f7:196a with SMTP id fc18-20020a05622a489200b003a356f7196amr54110820qtb.7.1671233327795;
        Fri, 16 Dec 2022 15:28:47 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id fa11-20020a05622a4ccb00b003a7e8ab2972sm2192823qtb.23.2022.12.16.15.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 15:28:47 -0800 (PST)
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
Subject: [PATCH v3 1/4] arm64: dts: qcom: rename pm8450a dtsi to sa8540p-pmics
Date:   Fri, 16 Dec 2022 18:26:03 -0500
Message-Id: <20221216232606.2123341-2-echanude@redhat.com>
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

pm8450a.dtsi was introduced for the descriptions of sa8540p based boards.
Rename the dtsi to make this relationship explicit.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 arch/arm64/boot/dts/qcom/{pm8450a.dtsi => sa8540p-pmics.dtsi} | 0
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts                     | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/arm64/boot/dts/qcom/{pm8450a.dtsi => sa8540p-pmics.dtsi} (100%)

diff --git a/arch/arm64/boot/dts/qcom/pm8450a.dtsi b/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/pm8450a.dtsi
rename to arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 6c547f1b13dc..77d499702ea8 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -10,7 +10,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sa8540p.dtsi"
-#include "pm8450a.dtsi"
+#include "sa8540p-pmics.dtsi"
 
 / {
 	model = "Qualcomm SA8540P Ride";
-- 
2.38.1

