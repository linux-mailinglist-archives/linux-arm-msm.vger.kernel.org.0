Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 152B16EB32E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 22:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232922AbjDUU5m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 16:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233033AbjDUU5k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 16:57:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1DAB1FCE
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 13:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682110612;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=P7RzzGtL5Qme9j/hdre25JPbFnXeBl/FsBkZ1xbOQB0=;
        b=S/N0lMLqKqgxR3L/lwWJp8mz1qZnYYN774AkF8nrlU01cIEldRVDg3WgzCtPhR+c+wxY+n
        F+CCFHUoUDOo/rhPzWtEZP9GafmK0g7PSTk0oNsjEiJtwg6KS/kjsPPGQn2zvJ85WSFCDT
        9j0Lhz96teqZm/5V1xdxkY/vrtAcEAU=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-Jd0VQV1VPumzdNlN95xH5g-1; Fri, 21 Apr 2023 16:56:51 -0400
X-MC-Unique: Jd0VQV1VPumzdNlN95xH5g-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-54f95c79522so31174887b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 13:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682110610; x=1684702610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7RzzGtL5Qme9j/hdre25JPbFnXeBl/FsBkZ1xbOQB0=;
        b=I1696a4sr54XahM8715wAy/6EsOInbO7DNrWfsKK0XI3tqaQMgu3x50ghHUYQCD3Ro
         hiARDuA96Ckg7LBJ2S5q36yS9E5onzRq6muF6GQKjE2KZN1yoqGMW1Jhm1m7f729M+qf
         maMZ2Mm9onqevZMKbqpC1jWH1KiERLx2xeYmSHJJfnQi6x9jAehYU981RhipgnOdG0ex
         MaZcP126dCnLwbgEQHdssJZppxRjQjFpYdMyh+ZqiRyl2WVSfWQAdgn16qGYfhctXDYA
         +jiLxf2fTKejAVSRFJIq/IzdQuW3SpZAGjA3JO3BasYl5mGDB0rNgpbScZ6kEtT2Qxjh
         o61w==
X-Gm-Message-State: AAQBX9fhnlaUM2aUurHw74eZX9CmiqLGNLC8QGfVbPzNXnjuqcYsON78
        fwXRm3xeScE4V0+FZnakylFTI/cl/j81exN/B7IK7lShHlLLGCGiWwWwiTXs3jxH5L+I8gsR8H5
        B57oEnVRPS2jyn/slvOfNBj9XzQ==
X-Received: by 2002:a0d:db06:0:b0:555:d2a9:4187 with SMTP id d6-20020a0ddb06000000b00555d2a94187mr2537992ywe.23.1682110610620;
        Fri, 21 Apr 2023 13:56:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350Ysv83zsjjr1cp1Suy4HWlK3tdWVEM6VXyriWG1GQF2XZOnobMkx4hDq6giIytxpxtehgZ8vg==
X-Received: by 2002:a0d:db06:0:b0:555:d2a9:4187 with SMTP id d6-20020a0ddb06000000b00555d2a94187mr2537972ywe.23.1682110610145;
        Fri, 21 Apr 2023 13:56:50 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id x67-20020a0dd546000000b0054c0be459dbsm1179999ywd.39.2023.04.21.13.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 13:56:49 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH v3 1/4] arm64: dts: qcom: sa8155p-adp: Make compatible the first property
Date:   Fri, 21 Apr 2023 15:55:09 -0500
Message-Id: <20230421205512.339850-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As stated at the below link in another review, compatible is always the
first property.

Follow suit here to avoid copying incorrectly in the future.

Link: https://lore.kernel.org/netdev/20230331215804.783439-1-ahalaney@redhat.com/T/#ma76b4116bbb9e49ee4bcf699e40935d80965b3f3
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v2:
    * Collect tags
Changes since v1:
    * None

 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index 339fea522509..029b23198b3a 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -352,19 +352,18 @@ &ethernet {
 	max-speed = <1000>;
 
 	mdio {
+		compatible = "snps,dwmac-mdio";
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
 
-		compatible = "snps,dwmac-mdio";
-
 		/* Micrel KSZ9031RNZ PHY */
 		rgmii_phy: phy@7 {
+			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0x7>;
 
 			interrupt-parent = <&tlmm>;
 			interrupts-extended = <&tlmm 124 IRQ_TYPE_EDGE_FALLING>; /* phy intr */
 			device_type = "ethernet-phy";
-			compatible = "ethernet-phy-ieee802.3-c22";
 		};
 	};
 };
-- 
2.40.0

