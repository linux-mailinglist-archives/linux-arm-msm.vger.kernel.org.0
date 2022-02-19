Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84C9F4BCA2E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 19:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242981AbiBSSqV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Feb 2022 13:46:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242911AbiBSSqU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Feb 2022 13:46:20 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0DCC178BD2
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Feb 2022 10:46:00 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 08928402FD
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Feb 2022 18:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645296359;
        bh=eJ6HQrRnH7eCjaR+k7F77ct8AqISDRTidseB01nTcCM=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=jW6DWiNMtuUSYkoNS8Z4CjBwgSwZWnHasheVPDyf/SEXPf0Kqd4gz4/uWX93BCqaf
         DIDAorSTOqikEiiMyiE4zNULFYSjD6OkAVFycqPI4oN6W877AYAueEeY6F4feARK9L
         T4HdgSqrXn2uQSCYhYgJnSXVAa5TY7aMdSXUil87qLmJ44PMOlwxMIlx8iPp/4mYUn
         09Z7iFFgJ441Em/zQU7bAS3r2B34T+/WzhiYoWnx0V+sJUfIE7Mazoj1DkkDhnpZie
         nWiMVywTwJwsiDe1d5kKGB2riGstPaeRPorch0bLSd9kflBBFowD8O+69VKpo1ee4Y
         rwM1AfU1t1+Wg==
Received: by mail-ed1-f70.google.com with SMTP id o5-20020a50c905000000b00410effbf65dso7571191edh.17
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Feb 2022 10:45:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eJ6HQrRnH7eCjaR+k7F77ct8AqISDRTidseB01nTcCM=;
        b=S+8VJj32MmQkTKS952jJdXy9bMYFsMsIpzcJFKPH34I1RpknR8cO1e4oLULE4zoz8T
         PaJG2vCg4ykZkzZKNuf0YycMtk5a3hTlj1nddDrFPNEgwqaNZsMmzzQP8P4PyDBjCNbC
         uLxpy6IWfwXRETlSDzM8enN4rKCAo9TUZBOuANdVSLhf93E0WBISRUPVd7sZlg6x8fK/
         mEOqjFJsBfIExKjWBfOl9g5u5w5PNAf8nQsH/0tPdjWs3J8uOtx8evqAVZUDCsBvrgLh
         8TnbiKHUiw0hzklg0IR+4QcdKRA36xZaQbJljmwO0EJHbry/sUXDGL1xhXkriDxMgRgY
         j8xA==
X-Gm-Message-State: AOAM532YHL8ovdm1ATJhuyp+dRuAEKry6aZDM3TAmt3n64OjxB+j7ja7
        Vim2rsdzdKqUazB/JxOZhWXdq/89J53CtBe/Na9CDkPBYpizA3tT1QIY1UfPTwt3ptlTddI76+c
        yk5ViEqAKvEFtHs1AMi/DmUsC2Ucg9CJAXOq18oVIcZ0=
X-Received: by 2002:aa7:c612:0:b0:40f:2a41:bddb with SMTP id h18-20020aa7c612000000b0040f2a41bddbmr13789840edq.291.1645296358467;
        Sat, 19 Feb 2022 10:45:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCUQahoUlw1/KaqiAKlfUzjGeKC0o8en5bVZWTPpKsIDqk+8vzgYr9LfT4H6VG0K4MxnLXbw==
X-Received: by 2002:aa7:c612:0:b0:40f:2a41:bddb with SMTP id h18-20020aa7c612000000b0040f2a41bddbmr13789828edq.291.1645296358336;
        Sat, 19 Feb 2022 10:45:58 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id j11sm4847509eda.106.2022.02.19.10.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 10:45:57 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jan Kotas <jank@cadence.com>, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 8/8] arm64: dts: ti: use 'freq-table' in UFS node
Date:   Sat, 19 Feb 2022 19:45:54 +0100
Message-Id: <20220219184554.44887-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220219184224.44339-1-krzysztof.kozlowski@canonical.com>
References: <20220219184224.44339-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The 'freq-table-hz' property is deprecated by UFS bindings.
The uint32-array requires also element to be passed within one <> block.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 599861259a30..c3afef0321ae 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -1257,7 +1257,9 @@ ufs@4e84000 {
 			compatible = "cdns,ufshc-m31-16nm", "jedec,ufs-2.0";
 			reg = <0x0 0x4e84000 0x0 0x10000>;
 			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-			freq-table-hz = <250000000 250000000>, <19200000 19200000>, <19200000 19200000>;
+			freq-table = <250000000 250000000
+				      19200000 19200000
+				      19200000 19200000>;
 			clocks = <&k3_clks 277 0>, <&k3_clks 277 1>, <&k3_clks 277 1>;
 			clock-names = "core_clk", "phy_clk", "ref_clk";
 			dma-coherent;
-- 
2.32.0

