Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC79A780006
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Aug 2023 23:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355378AbjHQVji (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Aug 2023 17:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355435AbjHQVj0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Aug 2023 17:39:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BC810C7
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 14:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692308316;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FqqZicTGV7T3Kk10xXAHHZqVsDBeCNcyh9Qza7vGkZ8=;
        b=YeMvHaUt5zk9gEnSROnoS/kHej1HobcpJA2tVKDCHUNlIRqtZvbbqI8bCCbAogvAW42tjJ
        CzbKs810Z3ygIjgX2Ks/Ez+DnwAN/+wWEcTomRRBMMYGQHduoYlkwB/wqbQCl/jxTFnIsY
        YMuiOOVXg4K1RGs9hM7edSYo4Hf4veA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-enpUwI47Neartenrfakp9w-1; Thu, 17 Aug 2023 17:38:35 -0400
X-MC-Unique: enpUwI47Neartenrfakp9w-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-76d84238ec4so32172285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 14:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692308315; x=1692913115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqqZicTGV7T3Kk10xXAHHZqVsDBeCNcyh9Qza7vGkZ8=;
        b=NY2dh1IxQ7Ch7W4V0n06wIuasDxXormpWAS8fZBgWgY47qDFW62AXg2KBNW9luLIFC
         0SUal7cbTOnNxDKcmObwjvFu+c2NVAKqunvwk3ltMNRM8om30cwm+OLGy73bOmY+Vt+0
         08xMB3fL5CO10Hoj1UDdbJUhKli9BceJiyaJ6SBlzbmxjRSIbuxfoZbzcA2TTkkbNH5k
         o4XmEDeGC0rZMhQnBqMM0gd2SjhxZkHSfYQ5OBDrNFNWIRIcp763O1F4root/jGK+zJz
         apMXNt9p1hGouDMlxj52ZMcTHXRR7fb8yqJZdedX1BLwwBGgdfvDm+ehr/t5srP70jFM
         TiOQ==
X-Gm-Message-State: AOJu0YwYOasHcv9Zxc1gL3CHsb63xpSiqkd6dK6olz+yrPR4xA6ImBMm
        adEqmGNJCoq3hXumOR8DvAmVcGlC8vRxuqDPiqcJERbZ6FitMHqbe5DAEJqFcYXYNcAcuwPNDDW
        DTrH+0GF71Xl+ofaS7e5z3HgAeQ==
X-Received: by 2002:a05:620a:4451:b0:75b:23a0:d9e1 with SMTP id w17-20020a05620a445100b0075b23a0d9e1mr1197243qkp.55.1692308314959;
        Thu, 17 Aug 2023 14:38:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkp3rZRvDcTzFKJ6Hqm2t/JobO+mLJ0a7jWTkq/V/9LaaPUGogroqre6KXatk72o3i6DIw8Q==
X-Received: by 2002:a05:620a:4451:b0:75b:23a0:d9e1 with SMTP id w17-20020a05620a445100b0075b23a0d9e1mr1197225qkp.55.1692308314722;
        Thu, 17 Aug 2023 14:38:34 -0700 (PDT)
Received: from fedora.redhat.com ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id s1-20020ae9f701000000b0076c71c1d2f5sm96547qkg.34.2023.08.17.14.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 14:38:34 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     andersson@kernel.org
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@bgdev.pl,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH 2/2] arm64: dts: qcom: sa8775p-ride: Describe sgmii_phy1 irq
Date:   Thu, 17 Aug 2023 16:37:17 -0500
Message-ID: <20230817213815.638189-3-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817213815.638189-1-ahalaney@redhat.com>
References: <20230817213815.638189-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There's an irq hooked up, so let's describe it.

Prior to commit 9757300d2750
("pinctrl: qcom: Add intr_target_width field to support increased number of interrupt targets")
one would not see the IRQ fire, despite some (invasive) debugging
showing that the GPIO was in fact asserted, resulting in the interface
staying down.

Now that the IRQ is properly routed we can describe it.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 8fde6935cd6e..9760bb4b468c 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -295,6 +295,7 @@ sgmii_phy1: phy@a {
 			compatible = "ethernet-phy-id0141.0dd4";
 			reg = <0xa>;
 			device_type = "ethernet-phy";
+			interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
 			reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <11000>;
 			reset-deassert-us = <70000>;
-- 
2.41.0

