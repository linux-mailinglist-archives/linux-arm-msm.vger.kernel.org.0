Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD0E465127A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 20:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbiLSTNW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 14:13:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232355AbiLSTM5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 14:12:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D43A011456
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 11:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671477127;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OIdwR+qvjuKwdLoe3e5YFQ/t6daZrSiNt47lDk8vL4k=;
        b=eeEKz0NEinFSOp2wZuS4kzNX+KukUztBn1oJ9NYnod6uw4COdMnHNEnzYZ99kBkOxvX+9y
        cRUxoSKuHsT/42iy7W+rYFMFofvYLY9qFqt6QWt242gUc2bkvlHltv2sKpdqyTwN6S8isE
        Br0xiMooDIYDhdSOqmSgUyxTDgSX9Q8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-604-pINTy4RqN-yLkJcqstOmpQ-1; Mon, 19 Dec 2022 14:12:05 -0500
X-MC-Unique: pINTy4RqN-yLkJcqstOmpQ-1
Received: by mail-qv1-f72.google.com with SMTP id o13-20020a056214108d00b004c6fb4f16dcso5965814qvr.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 11:12:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIdwR+qvjuKwdLoe3e5YFQ/t6daZrSiNt47lDk8vL4k=;
        b=vQ5rqO+5x1CGmF6xE6uS8+MrsKO8DNupBEypA+qhwF4PxCHVgWmWDwBLmD5H+GUD0H
         x7YMaVqchepc1t/SR9c6hG9F15+9yYr5WBJLNuwKw+UZGfbwdcG1gAfiBPCjvdeJD3+k
         KXwQWJy2KVcx8mZo2bWxImJ52tNHSa6fyqtFOvlsnCf1A8R2WnAkpy0OkgUdGmO885ui
         xaUhEqA6aHX6cZlhmh3hVMB7SJX/4u/I9De07vpF10866PwCeSsSIQT3fkAyj73EnkHR
         HHQMaF4PTpMo37DGGGxKsCL4fFoH1VLvakP0X/ZMvbSbJXRjvBJktIEmoAJWGCqgl408
         qXXg==
X-Gm-Message-State: ANoB5pnNcynATfJRZjSLIi3GdHlbHJglDFz5wCJDf/To8Z9+3+TQkW1Q
        XtF+Ks6gNIOAikhDMGAmzaJPcA9haE5b8V+YBMWzj2pM7JnAvg0p82ijYK7xrBOJvXQiSai3p8D
        MDtuR7Uddp+tFv+lpbqDe0sociw==
X-Received: by 2002:a05:622a:242:b0:3a5:467b:c1d0 with SMTP id c2-20020a05622a024200b003a5467bc1d0mr82719773qtx.18.1671477124902;
        Mon, 19 Dec 2022 11:12:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7O2YefxePKoJwTUXuIPiBA7nNAECGHZpF9m3+9R83hpsnY8mCSL2vmHY5jCgQlVc414BYjwA==
X-Received: by 2002:a05:622a:242:b0:3a5:467b:c1d0 with SMTP id c2-20020a05622a024200b003a5467bc1d0mr82719753qtx.18.1671477124696;
        Mon, 19 Dec 2022 11:12:04 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id w7-20020ac843c7000000b003a8163c1c96sm6344207qtn.14.2022.12.19.11.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 11:12:04 -0800 (PST)
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
Subject: [PATCH v4 2/4] arm64: dts: qcom: sa8450p-pmics: add rtc node
Date:   Mon, 19 Dec 2022 14:09:59 -0500
Message-Id: <20221219191000.2570545-3-echanude@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219191000.2570545-1-echanude@redhat.com>
References: <20221219191000.2570545-1-echanude@redhat.com>
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

Add the rtc block on the first pmic to enable the rtc for sa8540p-ride.

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

