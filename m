Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AAEF4BFB9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 16:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232700AbiBVPBT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 10:01:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233152AbiBVPAz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 10:00:55 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61CC910EC56
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 07:00:06 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2624F3FCAC
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 15:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645542005;
        bh=LfKEooVWXSt0X9amI75MXA0ImuzcwyjqGr8txR6hCCo=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=vc3RucsustSnI9z6fj1AZ3faXkw/uB81BLhjsfHz9uRvUq0axAi6FjprYifCaTms2
         G/jZ5OzN3Fsjqjp3rsoU3oDbFNiRJX2kApHmhH+rnhTqdDTx5nOGGuQIQ6z5ypInDT
         XQZhR0GMrPt225HGhVjquKJrxdjFIkraKhNTHqmrvpXeZ8puofX0OhzAWd4CK4s/vq
         9GzlJ8XZX/v1ep8CVwanxcr1kJpqdvVbDSGMOKMMO8rOrzUgh3NRPONnqXvUrres2E
         cQUpSxkQE6or1M4U3Lv7nrjl8vQ/IdP5JnUWZeNc5MxtirhxkAKnBLLSweT95TmM/D
         k/vJQLd/Zafog==
Received: by mail-ed1-f70.google.com with SMTP id y10-20020a056402358a00b00410deddea4cso12065288edc.16
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 07:00:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LfKEooVWXSt0X9amI75MXA0ImuzcwyjqGr8txR6hCCo=;
        b=6RTkxx46Mo/+GYCUza+kKnIURk2860oWJx2XpZMV1K0HME/nCEZPtUdHpWDCcwgacW
         7KqaserOJID4rODwagpMyhoFCI2KrT4uLdl1SUFz09KNGrNm4ZO4ciI9gKM9v4j2oWN4
         Q+4DHsva+32pJBDF31fZkvnN3yBbTyQSFkDRmd1UuKCTZXNyPQYt9LYT4I3H1C2oZtOO
         PryGd8aq0jtggw+vJBO05gh9m1yHNChMTuxWFkWEZFdFsQOeFiCH+dMTbWrXVIt1laF5
         GB1oxgFfnWk5LtZAqdEg81lqEWQP3l3WIRzyRcGquBJBteQe4krHEY6yVwXA/lXqv75W
         nhHg==
X-Gm-Message-State: AOAM531zuGCzCKHB5H1XTBgdDLlv/6QFI51A/ryydyMXndsuDEb05nM2
        P01s9IFWfrhmshJeSz4nYhXAXJ/p0LlvosebVoAavRw7LmmIOSGevG6p7XAUhyz3WSc/IDFaRtg
        JyPD8ETAC1kOXuMSiRNl4RZXoio3vzgTLX/UNYagGTZo=
X-Received: by 2002:a17:906:70c2:b0:6cf:e1cc:4d8c with SMTP id g2-20020a17090670c200b006cfe1cc4d8cmr20090159ejk.696.1645542004858;
        Tue, 22 Feb 2022 07:00:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyR3qbd+Iftv6XGp15bvvgUICPOPWMYZg+AzIuOxdejdmzbh/iz1wm8C/0MI15ezn8MGt0S6w==
X-Received: by 2002:a17:906:70c2:b0:6cf:e1cc:4d8c with SMTP id g2-20020a17090670c200b006cfe1cc4d8cmr20090120ejk.696.1645542004625;
        Tue, 22 Feb 2022 07:00:04 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.07.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 07:00:04 -0800 (PST)
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
Subject: [PATCH v2 15/15] arm64: dts: qcom: sm8350: drop duplicated ref_clk in UFS
Date:   Tue, 22 Feb 2022 15:58:54 +0100
Message-Id: <20220222145854.358646-16-krzysztof.kozlowski@canonical.com>
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

ref_clk clock in UFS node is already there with a <0 0> frequency, which
matches other DTSI files.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index a26bd3f13d4a..cb6442c9e761 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1916,7 +1916,6 @@ ufs_mem_hc: ufshc@1d84000 {
 			iommus = <&apps_smmu 0xe0 0x0>;
 
 			clock-names =
-				"ref_clk",
 				"core_clk",
 				"bus_aggr_clk",
 				"iface_clk",
@@ -1926,7 +1925,6 @@ ufs_mem_hc: ufshc@1d84000 {
 				"rx_lane0_sync_clk",
 				"rx_lane1_sync_clk";
 			clocks =
-				<&rpmhcc RPMH_CXO_CLK>,
 				<&gcc GCC_UFS_PHY_AXI_CLK>,
 				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
 				<&gcc GCC_UFS_PHY_AHB_CLK>,
@@ -1936,7 +1934,6 @@ ufs_mem_hc: ufshc@1d84000 {
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
 			freq-table =
-				<75000000 300000000>,
 				<75000000 300000000>,
 				<0 0>,
 				<0 0>,
-- 
2.32.0

