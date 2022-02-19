Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE404BCA1B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 19:43:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242944AbiBSSna (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Feb 2022 13:43:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242926AbiBSSnP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Feb 2022 13:43:15 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9153927158
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Feb 2022 10:42:41 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 86BEC407C5
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Feb 2022 18:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645296155;
        bh=Y7Xw1XgTgBcNzaNUmOMUZUT9huc94W2fdxwywnagsik=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=sdIP9zBnwKW7qALbkGQRP3KpGwNUZodPeooasXyzcTMkQPY8dU53HpLhY4NO1Vvbr
         bN/QVsIqogK7JnV4Xg1Zj/sq7msooTlzNgB/A3+3dj7T54aPMyHzvUpjwar8YM+HjG
         zKlseHXSppSL8Pcj/k9YuDGXIVux0Ya2ucdzGZ2rYudQAU1IsE5EGla/0SLb+RJsvu
         Nw6c4hCYbdeymznUXtrgmt+3kMF0fgW//O0uxMb7NiHo8TDMwa2ufDauLo8vZO6bTo
         CQO8gnPotwxtPWnRdFvoFMsWRpmcXVlA+RMO6ntd+6FdEvg9XPezfFytkqM9WjHdrJ
         An/0YRymbmzrg==
Received: by mail-ed1-f72.google.com with SMTP id s7-20020a508dc7000000b0040f29ccd65aso7619928edh.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Feb 2022 10:42:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y7Xw1XgTgBcNzaNUmOMUZUT9huc94W2fdxwywnagsik=;
        b=YKDaN+3Yc0Hyo+QW3OoxF8Xc5LXRb9QxrWwfk83D+SXhvYXVO5TW9U0flEnalsa3Vk
         Y+4Dba0RrvtF2s/2r2JS4XkDEtPamPUCuxOD8VWUQjaqOPkMIzq+yHAaKfhDxPh5jIEW
         v7UII7xJOH16B95TAcIM1z5kx2wgmwHlE2sMM36rIvd7jXLihHSjHOPmgvn658TqX+w9
         h35axAs3crX6IHdv4yhHd7ImddUTv85bhYO+GReJBlvCSSk1BlBWwgcYGKvnC4rWwA3s
         kv8WbVgZlMQxN31fnSnhgkwLixRjXetr0RO1UqUM1ucwIi9SCRs8D8ZT/9oV30JNBq9y
         LwbQ==
X-Gm-Message-State: AOAM532LmfTi0A+AKlSV2AZaLhrS7ymeXNyb3bSjunejXzsrOF6sv/mk
        1P0MM13fV+vkRdHfc3VWisKhu42EjE4O2Eu1m6BHR4SERYRZJ5atl5gjqQhRKLr3vX6xm3NbgNc
        CGK4Th6346Zi9gwzbmDZ3275eizPGoqQTfAi/DrEKLNo=
X-Received: by 2002:a05:6402:3553:b0:412:d0aa:e7b0 with SMTP id f19-20020a056402355300b00412d0aae7b0mr7276047edd.309.1645296154951;
        Sat, 19 Feb 2022 10:42:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyC5IJLy48tlyYE+yZgcpQSi4MoxWiFd33GYjBfsDjODqOvCAdkALPMOFjD1ZZijcqanmOmFQ==
X-Received: by 2002:a05:6402:3553:b0:412:d0aa:e7b0 with SMTP id f19-20020a056402355300b00412d0aae7b0mr7276030edd.309.1645296154800;
        Sat, 19 Feb 2022 10:42:34 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id j8sm6680745edw.40.2022.02.19.10.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 10:42:34 -0800 (PST)
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
Subject: [RFC PATCH 5/8] arm64: dts: hi3670: use 'freq-table' in UFS node
Date:   Sat, 19 Feb 2022 19:42:21 +0100
Message-Id: <20220219184224.44339-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220219184224.44339-1-krzysztof.kozlowski@canonical.com>
References: <20220219184224.44339-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
index 636c8817df7e..0860c5688977 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
@@ -671,8 +671,8 @@ ufs: ufs@ff3c0000 {
 			clocks = <&crg_ctrl HI3670_CLK_GATE_UFSIO_REF>,
 				 <&crg_ctrl HI3670_CLK_GATE_UFS_SUBSYS>;
 			clock-names = "ref_clk", "phy_clk";
-			freq-table-hz = <0 0
-					 0 0>;
+			freq-table = <0 0
+				      0 0>;
 			/* offset: 0x84; bit: 12 */
 			resets = <&crg_rst 0x84 12>;
 			reset-names = "rst";
-- 
2.32.0

