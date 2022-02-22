Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B37654BFBAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 16:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbiBVPBp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 10:01:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbiBVPBM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 10:01:12 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A803D10EC71
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 07:00:09 -0800 (PST)
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 83CB43FCA0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 15:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645542008;
        bh=AXkZYdVX5Zodn+3WZgtIGj/ZSa6Qs/Xzl3ZJQ9geNsQ=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=SEI0dP+ccLbsdkdyR9+wuZHjOWLgur0Dz+xxKn7evx5gBkqr6bk+UM/cj3juuaaPS
         QzNwP15bx/+jHqqQ8N1iK2QDX82T3m27F/NM3DvUjGBhUBaN6vFbDXps6yHHHAzQIf
         RtozXvY+lct/Lhfg6AqkX0gQVZk9S7cxRJAmaYz9X9AECVMvffUmvjL3Fhj6U2K4PM
         vjAuevb2VOQu4mFkzss2yjeSxYXxyp0FCyIQ5ohgh76kp5XFwLzxYJbdlUkaybNSu4
         YNyB7YtK4WKDGMdfU9xBKTmg+nwGL5O3ADOQwtuie38mR2eyNzxtlvzaVj9f2Lv3CV
         v3bxhjni7iaGQ==
Received: by mail-lf1-f69.google.com with SMTP id v13-20020ac2592d000000b004435f5315dbso2832986lfi.21
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 07:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AXkZYdVX5Zodn+3WZgtIGj/ZSa6Qs/Xzl3ZJQ9geNsQ=;
        b=UxfAmRwQM4hIudLhdDiG6HfPNhQwdPIyOS0UjQ9mpDiSUGmxKmGSUdIpUifYsczHMJ
         O0GV29whNjn8SgUXsdgwYp3nYxNrwcjOMgD+8ewuaL4+KSytLNFOCHRpDlucyaW4Aeh3
         mzIRj7ugnK9fSj/Tc49HtV0cDjw2eutJDYTdUWanT+pi90XXXHookfTXstyqyxOuUHNk
         jti/wNa87rOtONAlfAB5p7TrNBh4i1LKf2Dm4w3zVhTQLcFmLRl8CbR8RvqLLv8dfraH
         ivE9vuVr1877cJ5hQaxbXp2N1sxqpezfac5P85QPiGTIvqQBBUiPfafWoZoNtrxU+khi
         lm8g==
X-Gm-Message-State: AOAM532RyuRCzDPO7EQIc2kajvqpMikV1uvIVou92Wr9Dl76k9ikNEtt
        Aq/hUQJ9RnPiqL+UaRAj9ZyHW4lJsLi8/ITr3PWe59stmgb71ZTg+SxYQg7Sz5Ma6rJeJBEatz9
        Bnn16TpqW12P64jyVFPJWGlFeV+Qm1BLDTKlg26ZOvFM=
X-Received: by 2002:aa7:c703:0:b0:410:b96a:6bf with SMTP id i3-20020aa7c703000000b00410b96a06bfmr26705748edq.439.1645541997725;
        Tue, 22 Feb 2022 06:59:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfSFtNX/a3KL4lHPEAhSPb3vHh30FiudcrzDoMBrPmGyj5vo81xOj/2DV7Q8M391vFSdj/vQ==
X-Received: by 2002:aa7:c703:0:b0:410:b96a:6bf with SMTP id i3-20020aa7c703000000b00410b96a06bfmr26705712edq.439.1645541997526;
        Tue, 22 Feb 2022 06:59:57 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 06:59:56 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Yaniv Gardi <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 11/15] arm64: dts: ti: use 'freq-table' in UFS node
Date:   Tue, 22 Feb 2022 15:58:50 +0100
Message-Id: <20220222145854.358646-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
index 599861259a30..34aff40c6b8e 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -1257,7 +1257,9 @@ ufs@4e84000 {
 			compatible = "cdns,ufshc-m31-16nm", "jedec,ufs-2.0";
 			reg = <0x0 0x4e84000 0x0 0x10000>;
 			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-			freq-table-hz = <250000000 250000000>, <19200000 19200000>, <19200000 19200000>;
+			freq-table = <250000000 250000000>,
+				     <19200000 19200000>,
+				     <19200000 19200000>;
 			clocks = <&k3_clks 277 0>, <&k3_clks 277 1>, <&k3_clks 277 1>;
 			clock-names = "core_clk", "phy_clk", "ref_clk";
 			dma-coherent;
-- 
2.32.0

