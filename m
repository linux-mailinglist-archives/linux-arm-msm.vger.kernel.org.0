Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 253DD6E154A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 21:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjDMTlR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 15:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjDMTlQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 15:41:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E758A47
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 12:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681414832;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=DAws+N1whAZqdp2+FmcZLsXGffvhZMy054TUXCEFTxA=;
        b=c21UMAk5iscdghwkUGvCeUq/zkukLdfPXRkNdveNT28MbI4g3t/k18WJuZTveJMWscQcZM
        5ph85kwSD2dwnzDqQ+o06XYbqYzv/69A0uxrfc3t0ckczQIvJnP32UuC+uIlT5WNkGWmMG
        9AVNxC/mtSJQOF+e5t+7ZxS7Fzopy+8=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-WWAup0w0M4ao5ydGEms96Q-1; Thu, 13 Apr 2023 15:40:30 -0400
X-MC-Unique: WWAup0w0M4ao5ydGEms96Q-1
Received: by mail-ot1-f72.google.com with SMTP id s6-20020a056830124600b006a037b882d8so3950020otp.16
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 12:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681414830; x=1684006830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAws+N1whAZqdp2+FmcZLsXGffvhZMy054TUXCEFTxA=;
        b=fZwo68FTJDfsNnzgC24GlR15DHqvqi8/Iz4VNs8skCSlJyKlyCegxjNAFZYWL3vIyF
         FkKJ6qTTi0/lIANJWONmUWL4FkGVeYrwxdlGaoYCg8Jod4hIlWTbPbBZWaDgIca9OzgS
         RlqGz4ga6BzQAokvVL9+Eod2NJ0md8wNBkuMpE/xZoltvGJQ+Gcyylj8CeAPAdFnmbwD
         4NWpnu1KhuIQcZYvzIKqjHNd8k+Yxb7KBESV+T/3XqRxNrZXfu7drnkBnWuMpcsXXb3q
         y/tiFA7rWqX9NehAyUWvjfjSWbjJ2Jk6wKlndkJKUQXSlQ8eEmfT+57UJyzF1AO+DTw2
         dLBw==
X-Gm-Message-State: AAQBX9e2gKMMhdNu85GOzXXHpVfbBCy2wXsx9QAEkRyIWT0kmiYZ/7m3
        Ao3Weo64rxq5LyugGQlDLXUtygGN0ZgaiKFuFTKc5hh1knB0z87I2NnTrIn7NzBLE+Dkat6821v
        760P0GnuafHEnpGSeYAZQgw0d/g==
X-Received: by 2002:a05:6808:49:b0:387:3324:29c6 with SMTP id v9-20020a056808004900b00387332429c6mr1720496oic.30.1681414830168;
        Thu, 13 Apr 2023 12:40:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350bFJPcabd2xer93D43uqwTOnEY7fzuGU+iChbHVBOp+gryFxy/XPCdtzRuuHoUgy+wpwDOzRg==
X-Received: by 2002:a05:6808:49:b0:387:3324:29c6 with SMTP id v9-20020a056808004900b00387332429c6mr1720483oic.30.1681414829849;
        Thu, 13 Apr 2023 12:40:29 -0700 (PDT)
Received: from halaney-x13s.redhat.com (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id x19-20020a056808145300b003898bec0e01sm966140oiv.17.2023.04.13.12.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 12:40:29 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH v2 1/3] arm64: dts: qcom: sa8155p-adp: Make compatible the first property
Date:   Thu, 13 Apr 2023 14:40:18 -0500
Message-Id: <20230413194020.1077857-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
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

As stated at the below link in another review, compatible is always the
first property.

Follow suit here to avoid copying incorrectly in the future.

Link: https://lore.kernel.org/netdev/20230331215804.783439-1-ahalaney@redhat.com/T/#ma76b4116bbb9e49ee4bcf699e40935d80965b3f3
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

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
2.39.2

