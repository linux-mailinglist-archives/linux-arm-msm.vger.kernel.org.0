Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECE054BFBAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 16:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbiBVPB5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 10:01:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbiBVPBN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 10:01:13 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D30910EC6B
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 07:00:08 -0800 (PST)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EA46D3FCA8
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 15:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645542006;
        bh=4OhXJxblf34wMx5+uRUs16cf2JFWMcvDQKlBG/4EIbg=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Rdy5IgroHscYIVGFB2/xRhp+CT0/SgnjZiWGmaHpKCe7Vg5++z1SVwH3C8AKYt3fX
         sX5lZoOj0z0PjC0EXg8mKmfxhBDoIOYFwuP0Yd00rWdFkj+Gy+4qUzH39H0JisYEVZ
         7ZjwlVxfFBQuo00my9tAwkIiTgvisuAKzqzq999VOjcHoOwd+fUryWYBIMDIepJPLo
         Dg2uPLX1hqO+J/Tbdv3kK4ByFlCCxNuZAAZ8GrP7UejwPYrB/1SRGyT5AtPEPHI6pz
         wZbwt6BZh0U/SWhN8w9qy5ka4blUROpgdxXh1cfeZ+k7/Po1AizcIYfRCz9HwRfn1O
         1R5bYqIxDvgqA==
Received: by mail-wr1-f72.google.com with SMTP id c16-20020adfa310000000b001ed9cd8f4c7so337112wrb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 07:00:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4OhXJxblf34wMx5+uRUs16cf2JFWMcvDQKlBG/4EIbg=;
        b=n/tjr0m0Mjyq6PShDjzCwhylBHTMDZ/jiQJagyhStC1cCtgwBsUNchS7vF+CHflB7P
         tRnMourVO/Ly2jcMiX4E6Jo1m9i1zWqnUYzMIRGLJdoF14OixkghRnFxt6VS18hcpMz/
         i1VDg7pwaEE51/e8CluhXRynIkaULqnZIt5PkOUNd96fyFkWwhlv5aQWuJIzJ8LOQjeg
         EH6oMWLJ+ayDQq4ciQQYU4CwvxuXQvdAQrkdQFd3O+30dJViz0yC632ZXT7UYZ/De69T
         584nRBxd0JcD+tI6h9MwlVonT9M93N4L+KIXC0QuT+NnRlMds10vzH3ZOSFlgvfpZqif
         R9Ig==
X-Gm-Message-State: AOAM531v9uI2fAXOmMZhK7WHjuebxbUYLXp+uVHKFeEuKD5xWPw9eQFp
        TW6FcoG38Z4S0J1ic2CzwBhCYzu9Bpe3PdCcJve63mZZ0PD3H29a988HgywATPSgIf7qKzyJX/J
        99eB6wx/24xehSRygvD2eoxVetFmkKtfTX2jznHFUlwc=
X-Received: by 2002:aa7:cd81:0:b0:410:d64e:aa31 with SMTP id x1-20020aa7cd81000000b00410d64eaa31mr26939007edv.167.1645541995664;
        Tue, 22 Feb 2022 06:59:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaJdWHb8xk+e2xSEaK1p8tjIOgBKlnOjh9riknUovYkgJh1fsrFc3SbrR3EFVhnzBs85hG8A==
X-Received: by 2002:aa7:cd81:0:b0:410:d64e:aa31 with SMTP id x1-20020aa7cd81000000b00410d64eaa31mr26938989edv.167.1645541995521;
        Tue, 22 Feb 2022 06:59:55 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 06:59:55 -0800 (PST)
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
Subject: [PATCH v2 10/15] arm64: dts: hi3670: use 'freq-table' in UFS node
Date:   Tue, 22 Feb 2022 15:58:49 +0100
Message-Id: <20220222145854.358646-11-krzysztof.kozlowski@canonical.com>
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
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
index 636c8817df7e..754b3a66ec0d 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
@@ -671,8 +671,8 @@ ufs: ufs@ff3c0000 {
 			clocks = <&crg_ctrl HI3670_CLK_GATE_UFSIO_REF>,
 				 <&crg_ctrl HI3670_CLK_GATE_UFS_SUBSYS>;
 			clock-names = "ref_clk", "phy_clk";
-			freq-table-hz = <0 0
-					 0 0>;
+			freq-table = <0 0>,
+				     <0 0>;
 			/* offset: 0x84; bit: 12 */
 			resets = <&crg_rst 0x84 12>;
 			reset-names = "rst";
-- 
2.32.0

