Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5E0C64D19C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 22:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiLNVLi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 16:11:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiLNVLh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 16:11:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 277CA2E9D1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 13:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671052252;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=TSz/PgjD23JYZUEwUZKhlqGEr6/v6TI6lxpkBzb4/nA=;
        b=QMHHGrPRnBgNboGMHeWBGTKjCBDefgVcpxBFDumiJ2BGunqJP2iJlVLi40RjdpqZ5cr/6A
        YKEcZrrXPGeYcE6jNJzNFeK9Km+woH72msMV/CFJHYxtWaC52T0PKKAOQmE1MhrWE3Jr5J
        I8yg05YoRczVEGIdtX6ek0a0qEbYHok=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-319-aH60I4nwNmu5ZDtzCK96Ug-1; Wed, 14 Dec 2022 16:10:52 -0500
X-MC-Unique: aH60I4nwNmu5ZDtzCK96Ug-1
Received: by mail-qt1-f198.google.com with SMTP id j26-20020ac84c9a000000b003a7e6d38e01so3212716qtv.14
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 13:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSz/PgjD23JYZUEwUZKhlqGEr6/v6TI6lxpkBzb4/nA=;
        b=m+wYONgLu6rRgZh8sLWKyXeyQZE4LdT4TePhfM/oxtPQfbxbXLWhfTfqojW79vj2i4
         0PhKhU5+AXoEi8GmzREgiw8G/IALb9khYxcQniA0cF7mxbzeDoOZlN+smrNlq6HLHSkU
         geyx0b9JIQi8ydvV56RuFy/AUv1pRtx/+vxpeVHmtw499iNKp7veJimHPcrxR0t/dkom
         skC28FHOVCiPZiv/pv6CAjMln0Hso87Ytw2SNffLAnd5Ib3/vIekg0SOh0QDTj2rhFar
         oxhS102asTW8FavqPKBQbRiD6FTYuTIly2F8CFhRMUjJHj8H0E2yrS3HNBA/eJafNQZB
         hH7w==
X-Gm-Message-State: ANoB5pnW1rZJ8bAnRqEhEfqeQbu2V3RRCq038W4KTA/LdMyrd4+hHTq8
        iYbkbtO6CA3t8h6rE7gN8WYQKE7nqeQOHZX8M9gv3mOC5tOVjtus3Qq2/pOkwKevPlEX+Ds8Ihz
        MidaYOnYPR4hg9x3nuDpHqyaAKg==
X-Received: by 2002:ac8:67d5:0:b0:3a6:46b4:2a6b with SMTP id r21-20020ac867d5000000b003a646b42a6bmr30959255qtp.27.1671052250460;
        Wed, 14 Dec 2022 13:10:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4S2E0HvCIJs1npjyTP0+FxeBR1jIWod47l+DgBW/7PchMqUrHqEm/2Mth6sLMeDAPoCyfFMQ==
X-Received: by 2002:ac8:67d5:0:b0:3a6:46b4:2a6b with SMTP id r21-20020ac867d5000000b003a646b42a6bmr30959237qtp.27.1671052250278;
        Wed, 14 Dec 2022 13:10:50 -0800 (PST)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id b22-20020ac87fd6000000b003a6a4744432sm2391060qtk.87.2022.12.14.13.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 13:10:49 -0800 (PST)
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
Subject: [PATCH v2 1/3] arm64: dts: qcom: pm8450a: add rtc node
Date:   Wed, 14 Dec 2022 16:09:06 -0500
Message-Id: <20221214210908.1788284-1-echanude@redhat.com>
X-Mailer: git-send-email 2.38.1
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

Add the rtc block on pm8450a first pmic to enable the rtc for
sa8540p-ride.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 arch/arm64/boot/dts/qcom/pm8450a.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8450a.dtsi b/arch/arm64/boot/dts/qcom/pm8450a.dtsi
index 34fc72896761..c9b8da43b237 100644
--- a/arch/arm64/boot/dts/qcom/pm8450a.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8450a.dtsi
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

