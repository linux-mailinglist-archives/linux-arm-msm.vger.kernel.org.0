Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 104F94BFBBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 16:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233133AbiBVPBY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 10:01:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233067AbiBVPAt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 10:00:49 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C2510EC4D
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 07:00:04 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A0EA63FCA4
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 15:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645542003;
        bh=YBEC74wb9GPpBj/B6mQOA+S5GClKlTxflH8/ImjOGfA=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=vIHSxIZtUtMvY8LbwucgAJVDS028dioxguf0a32TH56J3fgW2zQgl+ZECbhkoO+W0
         CYiwZNlNLd9EzqFMvNLmOzAIN3rFISViGI6nwrMShv85TuGz+5f2Mpp5NhnTVOeHTB
         Es6Ym7paE3POlrY+0oKiPBICcYbZerj8Pzu6uX8SXxOPTuuvGVf8C2mzd3GKzqQBNt
         zBVrSPalP6b0GA/uocSY8wHnKVFVXhvUBqqCPMk40S9OEmMiBmK10oE+a669maIUnj
         995DPhhcORxrtLmGOTlfes7bQq1JL9IA/kyFRW6Gb6MeSgXzx1MF/g7q/HmBz5apOT
         UJs1wgo9eUfhA==
Received: by mail-ed1-f69.google.com with SMTP id b13-20020a056402278d00b0041311e02a9bso2915565ede.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 07:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YBEC74wb9GPpBj/B6mQOA+S5GClKlTxflH8/ImjOGfA=;
        b=1ZeZu8EHG2XJFBR+j7NqLlisIrVeZmCqtL3B2k2+RKy3wIOyK7FJ/rWzcIWuCcI689
         GAHSAt1JQHqQ0WIfup9MA0yJai4L0vggdyvJy/y3Ql6/kfen2ATKqXT38KiNshaF+ivm
         P2ReeyNy33mc+jrp6QpbEiss32UG20fM326y+yr28uGnNvcTJ0Kv5iwoCJuEB2yG/cQR
         hS+6ubPO6q9K3soPJEUm+Kpqh8m+HuxcyeYq50gf4qPDLWbY3wa5aE0xT5Nf4Hg2IAuy
         4JUgub0TjzubzbicrBPdw/T71EfmUN7ihkct0Z1LNhKYWLolLSf1LN5+jy7GnqHOYY8P
         ybwQ==
X-Gm-Message-State: AOAM533rwB4eHKibg8+SOpp5ed6HQc6pyxj9Ppus1CF1dvER9d2MClVf
        vE2wMdq0ccfXnrr/XHLYEelvAnfTmgRn3D1KkteAl9BmNlY5vAS93ISfV/04JSoWrjtQLbjKFJw
        UMM/nv8lCWnJFaodaRJ9MzVS2ijT8zpyJdy+u9GvThSE=
X-Received: by 2002:a17:906:7746:b0:6ce:a12e:489f with SMTP id o6-20020a170906774600b006cea12e489fmr18914890ejn.551.1645542003128;
        Tue, 22 Feb 2022 07:00:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLi2RkpjMH1XnBpd7ijPxBtJkEM6ya606jWmcrmuPZusdxAuidRgjMaupSJDwmi2J8JqbfkQ==
X-Received: by 2002:a17:906:7746:b0:6ce:a12e:489f with SMTP id o6-20020a170906774600b006cea12e489fmr18914869ejn.551.1645542002826;
        Tue, 22 Feb 2022 07:00:02 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.07.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 07:00:02 -0800 (PST)
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
Subject: [PATCH v2 14/15] arm64: dts: qcom: msm8996: correct UFS compatible
Date:   Tue, 22 Feb 2022 15:58:53 +0100
Message-Id: <20220222145854.358646-15-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm UFS bindings require to use specific (qcom,msm8996-ufshc)
and generic (jedec,ufs-2.0) compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index fad1bbfa1c0a..f25c68511b64 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1728,7 +1728,8 @@ pcie2: pcie@610000 {
 		};
 
 		ufshc: ufshc@624000 {
-			compatible = "qcom,ufshc";
+			compatible = "qcom,msm8996-ufshc", "qcom,ufshc",
+				     "jedec,ufs-2.0";
 			reg = <0x00624000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 
-- 
2.32.0

