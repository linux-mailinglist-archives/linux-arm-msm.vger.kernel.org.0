Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 999FA73FFC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 17:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbjF0PcY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 11:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbjF0PcX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 11:32:23 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0481D297E
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 08:32:22 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fba64d9296so8533135e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 08:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687879940; x=1690471940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Tj+a3jXCGO/E81fZis7hW50ypnf/qOkSsBlW7O+WyQ=;
        b=q40X9tgSYRtJCgKGQLfvJZIjFblnYS7TTDOLIlos7XgMUwtk6erOMrg7J7/vryoZqT
         hpFX9AjyocWYhoEdqW4w/zKiQoJZxhVg8vjoOUaPwf66mR8L9knQn3QPGR03mXRIGAbs
         AzKkQR8uO05rI03YWl7OkVj3rZxVOZLisjyy30J6VGCUkubkUb+hEBPayyBXQThCd+ZM
         JbIkV2QsonP8+9eSedqjtXFP1x43COo9fnzlJUsOWKy+TYwVbp9CR9rlH91HHhtC4LZ2
         shNbsewDwv7RoUIcnYLmSucF1klLCgJCmetd0TX1x7MsuROjHe7J4bbEoc+hRGvqj5GG
         b6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687879940; x=1690471940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Tj+a3jXCGO/E81fZis7hW50ypnf/qOkSsBlW7O+WyQ=;
        b=WR6aht4QiE2HDWcAXTPEJ1VDSl9mYbNufNhNftTr+Z8UfgQYq8wLlqI4mVcBZ/bxgc
         tRIUGkdDD3AbyKrKIUnlPliatFFRq2JV0l3Mcd3LBt8TzYNcreiDUC28+EKnDCBBUt7T
         xniHf1Eghmk99+wmKsGLpk78rBKEwiNKrguUfS9ZmfrIqD3Sv6Y+lOE4sqne+KBgoVIp
         mG2TYXEgiOqXRnu0zAIbxtDZ2P249PY2lvZqDzSq1LgGOIJeeudRyPM8BvlRP6aABHYk
         n7fztky3h6OQnQVMh18V1FUyMnzp8X0jqUotqsUwj4QtJ2+15l/f7HhSKchllAaKZLtO
         BZsA==
X-Gm-Message-State: AC+VfDymfP8nxSOivk8UBmh/p1ztMiMYG9DNWi5FNYjDwFlqCj38DKLR
        QQDkgWTsjpQWYVo92CO/qDouUw==
X-Google-Smtp-Source: ACHHUZ4+i1SeX23yz1QMLc4MB2CrgRSmfMwJzeeqEuckpZAL8cADXARaE8SDukDM3E3aobeqBF2Bog==
X-Received: by 2002:a05:600c:210b:b0:3fb:739d:27b2 with SMTP id u11-20020a05600c210b00b003fb739d27b2mr2218266wml.8.1687879940580;
        Tue, 27 Jun 2023 08:32:20 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id c25-20020a7bc019000000b003f819faff24sm14089214wmb.40.2023.06.27.08.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 08:32:20 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Tue, 27 Jun 2023 16:32:17 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: c630: add debug uart
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230627-c630-uart-and-1p2-reg-v1-2-b48bfb47639b@linaro.org>
References: <20230627-c630-uart-and-1p2-reg-v1-0-b48bfb47639b@linaro.org>
In-Reply-To: <20230627-c630-uart-and-1p2-reg-v1-0-b48bfb47639b@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=788;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=hWR37olssv9o7C17E5MrA+bQTRMkpf7J0VqJVMSfEAA=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBkmwEBhB/ItK4b5jIvc9Xqfyhxf5tvuUZD/C5yP
 IicsdCerfaJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZJsBAQAKCRAFgzErGV9k
 tk0TD/4iJE/TQl/WU5m3SkRIaBJa+ZmIX/lDiSIlEA1fjgUIpk46yuEfnwziBeIGbIPwiNzjBZY
 13rsM3fRCP1U08n+hcH3NxZecHYFwn4fUUbApb6YlFmwD33X+qM2Nr7eV0XdFRyMaiZkWcmsjwF
 iaIxIBMXBXlZEUAF0qZxXrTkPP/luGNx5C79oUdK4+gUyvqxz1wc0MMh4WGfR3eFdWtwXgwxtuR
 gvGYM/znnLrl8ihUiQvuE3WpKcmDg+jOtXK+/GPKpShAJByfA/QgACc/lKcJgXtKJiD4vv8Z5sP
 NI1LrmwhcUpHWSllX/mJIovbhOOzk2L4h8dasBhjQ+nKApfwH0brJAV0Xi6lmFH/5ZKSdDVhtZR
 pDJ2lcpmy/D+wXUO6ZIeR5TbClS6ZnufL2C4BtfY3e9lxT9DsGmtR8x8t+TqG/TYYyppoujTdSZ
 bf3ByO/VGRcWPSxiS76RKgWFcCZPr1uqSKSQDl3Fow85bBZoc6k+uenOm6swKay9tTrfrR3blmG
 /f8xiu7kyhCPNMcRE6wmZrIGK+MCUESvoT4fNgzBz0Da44VSRr4kRU68q5bmhy0tl1WMdpN3b/p
 CQDrTwrRKS3TW0dD36vf4er8ExHk5UlFK6FSPQqafR6loChQZMTuS+AkQJetGRlASrei6eoM+Rh
 vzcgzGrNyJK9l3w==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The c630 exposes its debug UART via a connector on the PCB, enable it.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 94e37e5d2177..090f73251994 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -33,6 +33,7 @@ / {
 	chassis-type = "convertible";
 
 	aliases {
+		serial0 = &uart9;
 		hsuart0 = &uart6;
 	};
 
@@ -708,6 +709,10 @@ bluetooth {
 	};
 };
 
+&uart9 {
+	status = "okay";
+};
+
 &ufs_mem_hc {
 	status = "okay";
 

-- 
2.41.0

