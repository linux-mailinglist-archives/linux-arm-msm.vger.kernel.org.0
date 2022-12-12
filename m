Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62E2A649D5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 12:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbiLLLRl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 06:17:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbiLLLQh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 06:16:37 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58907E43
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 03:10:58 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 1so17955099lfz.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 03:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Aj+330nl1Dw+8TyIk+FiR4ts8UoIAAS1yegVuti/jI=;
        b=iZ25BCiaOAItYIrLjA6FpvOHD6+/k8NH3HtpszFWipd9w4dTRFcxQv9JyZxdHxAW/5
         hZozKXZKPgrlJoWQyUTeVcgHNfTYEK58HAxTuk3TLeHDm1QCe3ess6tiTrLVePa/GIAL
         l4EjUEWZKD4U/yZZu4MUXXKwaB+Xvz8bDuOFlRprojbJ42w6kNgGeggwHADtkKaVSZMf
         nGRWFYf9akkMtv/ImhLNm0NhQvFZP3+X8343tEjlyYQYJXK5x+u0a4vHwpahjO38bo0q
         YXeVJ6gudOGal7TjWHVSNh5oG8g/FHjSFbs4Y6EY6uZRXEEDl33h8otUqDIPjzpcGRub
         Dr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Aj+330nl1Dw+8TyIk+FiR4ts8UoIAAS1yegVuti/jI=;
        b=nRCzaiAcO7PJNQR4dNVaNNHjRUaNVgdD3JQITAmQ7ryqOJpGFOSW8Kq5jh/BulMWpO
         fZ+dTv7RmLPok4XmKu0zGPPniljnt1ixzwyHiC2WoAr/dqnc95HquduBudqoxDDROGE8
         cnuN6UACbWAvsn7HSrqInLWwAxwihcqkm3FIy/yQi1gugXLyUOYJTzZ/QMFWLTiQnzj0
         /qpZ1ZEEBQaOUyCRUo+xyX/zirhEOA6YRswblgyGHk7xMfDhnyfDuNRC/2g9+QFlUZEh
         mtynIqc2AsNfCCSZwOEhTX2zCro33b2FqutNFIgFNYtfzzgWh0yxIysi5zvOk8w8UVaD
         p/sQ==
X-Gm-Message-State: ANoB5pmnTnQl9+R3O37Exkmn1gQATwqIs86n4v0xcFbA2JN6b5l3Fkis
        xlMVuu4iGwMA8yAAi4yq8B7NlG9NISZt+Wuk
X-Google-Smtp-Source: AA0mqf4n4t5XIlLiiQPFojiQZ+lx18lt9+3KQD2ddUGEyrkStiQP/eIB+6SOiB+A+76hn+amgCH83g==
X-Received: by 2002:a05:6512:39c2:b0:4b4:f303:9b3f with SMTP id k2-20020a05651239c200b004b4f3039b3fmr4733845lfu.66.1670843457695;
        Mon, 12 Dec 2022 03:10:57 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id b4-20020a056512060400b004b57a810e09sm1599110lfe.288.2022.12.12.03.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 03:10:57 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] arm64: dts: qcom: sdm845: Fix some whitespace/newlines
Date:   Mon, 12 Dec 2022 12:10:37 +0100
Message-Id: <20221212111037.98160-10-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212111037.98160-1-konrad.dybcio@linaro.org>
References: <20221212111037.98160-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove unnecessary newlines and fix up whitespace near the soundwire
controller node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 376fcbdc08ed..9eecf1b4ebf9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3903,8 +3903,8 @@ swm: swm@c85 {
 
 						qcom,dout-ports = <6>;
 						qcom,din-ports = <2>;
-						qcom,ports-sinterval-low =/bits/ 8  <0x07 0x1f 0x3f 0x7 0x1f 0x3f 0x0f 0x0f>;
-						qcom,ports-offset1 = /bits/ 8 <0x01 0x02 0x0c 0x6 0x12 0x0d 0x07 0x0a >;
+						qcom,ports-sinterval-low = /bits/ 8  <0x07 0x1f 0x3f 0x7 0x1f 0x3f 0x0f 0x0f>;
+						qcom,ports-offset1 = /bits/ 8 <0x01 0x02 0x0c 0x6 0x12 0x0d 0x07 0x0a>;
 						qcom,ports-offset2 = /bits/ 8 <0x00 0x00 0x1f 0x00 0x00 0x1f 0x00 0x00>;
 
 						#sound-dai-cells = <1>;
@@ -3912,8 +3912,6 @@ swm: swm@c85 {
 						clock-names = "iface";
 						#address-cells = <2>;
 						#size-cells = <0>;
-
-
 					};
 				};
 			};
-- 
2.38.1

