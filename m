Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6659A64CEBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 18:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239239AbiLNROy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 12:14:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239240AbiLNROR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 12:14:17 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DCE529375
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 09:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671037929;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ogLpJVKKC25ddDetbiFHml5GQ+TG5tUiXJ4wCFo3kZQ=;
        b=ATXapgZZeXBm1vcPbz1JssyzpE2YPBwHs4UYfGwRzsLM/zD6d5Yl/fheslLbPrftIXUPkB
        vgRt+Y9cbCTglZJ+uDd7M+2WdfT2G77dJ557prq7oloW8UTAhM+SCk+rY6PlDquExd4XZu
        CVy/7qdx7LJkJR+7cC7tPH4bnOk2vng=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-191-ZamNZlBbOCuEw6kc2tihKg-1; Wed, 14 Dec 2022 12:12:08 -0500
X-MC-Unique: ZamNZlBbOCuEw6kc2tihKg-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-40306a5a42cso5155087b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 09:12:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogLpJVKKC25ddDetbiFHml5GQ+TG5tUiXJ4wCFo3kZQ=;
        b=JSPQjgGcsV8Tx0BDMzfUphRBG8NECzqaxBqD/fnk78aUxPitKGEIpIx7ZYFDcpeKQc
         8RhQLdB3lsE8a0sMElQHyJlCGUHzcU9dcRbwBpN1yXfvpa30c98ySdFVr+mDq14TAdvL
         kqiVGl+d5QU+0577HnbEmXjMhemy+V+pbjOjlT7ZfntsKOUBTaxzP6zQ6DELrQXXaL19
         E700QEXCEaDCYwc14rHuSUwEJRC2vCOvKSWdP9E1bi7aqvZHxOgYL6ByfuUi0QxPmKM9
         Jy9quLg6XRBIvy30ctQ74XvYHjrF46USGkhauKIaLbFQk/82Fln658E/Vo+fqTd8Sk3O
         pLsw==
X-Gm-Message-State: ANoB5pnEs2athz+YXk99SYIza8aU4qPWtvwgwf37nD332ZYeKL/CMeWh
        QNyLXVL0txDOpCbRYcJBVxOJqFqx7m64HNg2r6HVPHInfJz8ABpjhzm9vIVHvzRPr9xvnwVEuTE
        zF3xCXIw7OZ0la4a3C1eL0HDjMA==
X-Received: by 2002:a05:7500:5e90:b0:eb:2066:74bb with SMTP id fk16-20020a0575005e9000b000eb206674bbmr2050398gab.75.1671037927520;
        Wed, 14 Dec 2022 09:12:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4f7iwQnkCpYy5hXj4Muvs1rfWFtodSaoA7k2Vmw6rOiEcFyQ9B99dD7TcL3PCjYKLke3cndA==
X-Received: by 2002:a05:7500:5e90:b0:eb:2066:74bb with SMTP id fk16-20020a0575005e9000b000eb206674bbmr2050371gab.75.1671037927175;
        Wed, 14 Dec 2022 09:12:07 -0800 (PST)
Received: from x1.redhat.com (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id t30-20020a37ea1e000000b006eef13ef4c8sm10305477qkj.94.2022.12.14.09.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 09:12:06 -0800 (PST)
From:   Brian Masney <bmasney@redhat.com>
To:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     quic_shazhuss@quicinc.com, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ahalaney@redhat.com,
        echanude@redhat.com
Subject: [PATCH v2 7/7] arm64: dts: qcom: sc8280xp: add rng device tree node
Date:   Wed, 14 Dec 2022 12:11:45 -0500
Message-Id: <20221214171145.2913557-8-bmasney@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221214171145.2913557-1-bmasney@redhat.com>
References: <20221214171145.2913557-1-bmasney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the necessary device tree node for qcom,prng-ee so we can use the
hardware random number generator. This functionality was tested on a
SA8540p automotive development board using kcapi-rng from libkcapi.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
This is a new patch that's introduced in v2.

 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 4591d411f5fb..67765975361b 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2811,6 +2811,13 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 230>;
 		};
 
+		rng: rng@10d3000 {
+			compatible = "qcom,prng-ee";
+			reg = <0 0x010d3000 0 0x1000>;
+			clocks = <&rpmhcc RPMH_HWKM_CLK>;
+			clock-names = "core";
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sc8280xp-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;
-- 
2.38.1

