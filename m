Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD8C6526F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Dec 2022 20:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234079AbiLTTaQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 14:30:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234105AbiLTTaA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 14:30:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37EEF1CFC3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 11:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671564555;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ecs0/8gH1scEMeIme5t6fO1yMGgoodnS/vov5q84tRw=;
        b=dmjl5jNVqL4ShvoCDOvE/0l3ABx29Q/xfpq219T1q8hLH5Pd/wQ7/+oZDCFN1F3ABe+AL/
        fE6hejfUa7uYTIZyLn2QS4y/1KxAxNbKo0m377TOS6cOaKYRfWOm/wsTZtKtgKRZje2obu
        x1HdyUSd7ZQKwqfgEg3wR2JEtrKZSfM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-263-NPy8U6qjNlmRZS6BSwtdVg-1; Tue, 20 Dec 2022 14:29:14 -0500
X-MC-Unique: NPy8U6qjNlmRZS6BSwtdVg-1
Received: by mail-qt1-f200.google.com with SMTP id bt4-20020ac86904000000b003a96b35e7a8so5906337qtb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 11:29:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ecs0/8gH1scEMeIme5t6fO1yMGgoodnS/vov5q84tRw=;
        b=o25LuV1gHVsPBs8RJz0CzrVABiL81OCZQ21Cti0i0bnEfemfkpCto4y4c0PwWVcWmD
         kczgOY3EtzVBviyQE0a0y/g3nLL2dAA9B3T8HaapXI6jr6MMf3jEGuoiGLeHPvRj3x6U
         ki6Gyf0fOT7EFeE962quNSrjYJFUcMAmzteQlDePdbodWxbi//YuLaMvSDCxZtL4V7Fo
         ji5sJckYHzeLZlgS133qDfQpS1MyyAofbBPKxp0i2OcNTNyvQGoapcHIdN6hEOGQUyej
         jaJHrZ1sK3Gk8n3v71t5hOsA3bSaOQb6uOzFNd85bRY3CzBOIGlkeBnvd3uveIe9Bl2h
         jJTQ==
X-Gm-Message-State: ANoB5pnjJEx6EEAPEvYxnRSusqxnuiXaUL2T7b1c2UgTJtl0d4u+Ijyk
        T0Yk8yfIhHkjk5fRXkMJVTlzR135eAgSajaSeZcUAkERIxmFdazF+kFssZJwp1xBL93Bh/wHjcU
        5yz+KZuun+sWP+Hb84KSh4JN5QA==
X-Received: by 2002:ac8:409c:0:b0:3a7:e1d5:3429 with SMTP id p28-20020ac8409c000000b003a7e1d53429mr70867699qtl.22.1671564553694;
        Tue, 20 Dec 2022 11:29:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4GKVILLxTyjNI2fMC1r5Q2z5HoeC9HtLC0jziqMaxlNF9RToh9O46Khi3OzGsyiVdZQmbEug==
X-Received: by 2002:ac8:409c:0:b0:3a7:e1d5:3429 with SMTP id p28-20020ac8409c000000b003a7e1d53429mr70867672qtl.22.1671564553450;
        Tue, 20 Dec 2022 11:29:13 -0800 (PST)
Received: from x1.redhat.com (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id gd15-20020a05622a5c0f00b003a82ca4e81csm744348qtb.80.2022.12.20.11.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 11:29:12 -0800 (PST)
From:   Brian Masney <bmasney@redhat.com>
To:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     quic_shazhuss@quicinc.com, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ahalaney@redhat.com,
        echanude@redhat.com
Subject: [PATCH v3 7/7] arm64: dts: qcom: sc8280xp: add rng device tree node
Date:   Tue, 20 Dec 2022 14:28:54 -0500
Message-Id: <20221220192854.521647-8-bmasney@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220192854.521647-1-bmasney@redhat.com>
References: <20221220192854.521647-1-bmasney@redhat.com>
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
Changes from v2 to v3:
- Correctly sort node by MMIO address

Patch introduced in v2

 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 4591d411f5fb..6c2cae83dac6 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1602,6 +1602,13 @@ spi15: spi@a9c000 {
 			};
 		};
 
+		rng: rng@10d3000 {
+			compatible = "qcom,prng-ee";
+			reg = <0 0x010d3000 0 0x1000>;
+			clocks = <&rpmhcc RPMH_HWKM_CLK>;
+			clock-names = "core";
+		};
+
 		pcie4: pcie@1c00000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-sc8280xp";
-- 
2.38.1

