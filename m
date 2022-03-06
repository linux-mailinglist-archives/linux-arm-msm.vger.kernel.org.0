Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1B3E4CEAC2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Mar 2022 12:12:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233295AbiCFLM4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Mar 2022 06:12:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233349AbiCFLMs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Mar 2022 06:12:48 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A4B606E6
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Mar 2022 03:11:56 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B88333F62E
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Mar 2022 11:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646565111;
        bh=fptfaOUAaErRHK6yyvwk8Ba2q3vPhWe6MKEfwn6hivY=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=kIEBkS4geO/1XXSDtxFXclTdE4OB6IWHj1bYyfy5BrVkAkJxAdvGint+r24MqMEpq
         bw+6S1dZ118MfAZqKPCOgEgHhglW4+0jScD3gOMmUgn+YiJrAzWRI2hUTKaMXQ253g
         Wt9ipRVKGhj2taUyerrFjvYzDi/oCsoffsscPC1Q0N6iveNoi9iGoi5GgZV9Vce4ae
         Nt+NtAT72KQnK3F/Y0uUZz2QnYBZp48g/OZL6Tq7yoN43ONnolIiQ2XC3uC4tfwr25
         MxIdaa7IsLbx4UePFnlUxp/Ozi9D72yjT/sXeDdcQ0MafaTxe0WSKAeW7Xz1A9LMrY
         b+6atqfZ85/ZA==
Received: by mail-ed1-f72.google.com with SMTP id i5-20020a056402054500b00415ce7443f4so5815704edx.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Mar 2022 03:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fptfaOUAaErRHK6yyvwk8Ba2q3vPhWe6MKEfwn6hivY=;
        b=YwiWZdZ57DfLCXNqN7Glli/QzIPt3it805YkSTLCHGff6bDYOyJwXwf9PQuw6jVbLy
         mvBdebqAdl6SmW5aq2CZWjKK6MhIcOpH5QFNkXrAga24F9OkZ9kRDXJSUi94vKNn9zBL
         5vI6sPI1Z4JZkiKB5d0LX8JFdmicoYnu7VglnAhc7sS3lFY05tHft2MBxHSn5cNucbw/
         3s+0mVtfHfo5gy6x89PV4zcFxmOXuTdn1LViBqXA+bhGHu32blFlqPew2KIp4f9HAomg
         5I612dritf6ymAeDensC89s6ANoyBuk2B64KAfYU9Qah3gT4bSZaxBLKcs/rWsw7NZ6g
         NbqA==
X-Gm-Message-State: AOAM533+omUfvFLKXPGqt8HPe45EHd20+UBrUKyhY2dRR8m4sxlA0Iug
        OCCe6qLrNm88dg9hQlzqyd/+LYcc/3WxLk8+PJSJH9sJjWjuFez2fRwKSvBhlzqWlPf7EQHkRyo
        vQH8/0HUjy2y571LLdPudQIxNnAJW+h3Lwtwc16L/JIY=
X-Received: by 2002:a17:906:4fc7:b0:6da:92b2:f572 with SMTP id i7-20020a1709064fc700b006da92b2f572mr5333901ejw.184.1646565109088;
        Sun, 06 Mar 2022 03:11:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJya7NhXOCbqGIagE53ZCTSIPIL5hGs6/ccWmxHFezSS2trgYWXGqqPKbwVvYlPcyFRrUXKq6w==
X-Received: by 2002:a17:906:4fc7:b0:6da:92b2:f572 with SMTP id i7-20020a1709064fc700b006da92b2f572mr5333879ejw.184.1646565108853;
        Sun, 06 Mar 2022 03:11:48 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 03:11:48 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v3 12/12] arm64: dts: qcom: sm8350: drop duplicated ref_clk in UFS
Date:   Sun,  6 Mar 2022 12:11:25 +0100
Message-Id: <20220306111125.116455-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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
index d242bab69c2e..02589b3beb7c 100644
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
 			freq-table-hz =
-				<75000000 300000000>,
 				<75000000 300000000>,
 				<0 0>,
 				<0 0>,
-- 
2.32.0

