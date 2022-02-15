Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D63934B7615
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 21:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240454AbiBOURE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 15:17:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242713AbiBOURD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 15:17:03 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C910EB328
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 12:15:44 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id bn33so170350ljb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 12:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Th2VzxKA5njhVR7C6q0Seii6kGVYOgIuJRxukrhBkgQ=;
        b=jVDYQhALWivot1jBnBvcoyYcVd5SLvZKGd4ue9SRYEZRNU3V67F+nEcyISvPjwyRZt
         e/sb096n882re8IahjbMNoWrgQ7ZG9tVbuwmWOf4kz6lTCgxlbP7artQMDSWEvW5oTz+
         mWBtfCacT+n50WGH8COe4AXe+rjyg36BJo07j5cPiVFlLnRAw6uqjjbswQ9zJELUAoc8
         Tf/UMXfmLY8Yf8tPUhLcFbNRiU4dAEZ32R6v2ESx4Ec0tKZYUCYbnK+WJQKoCaY5VD+y
         e1dnK2NtltN5C3aOwuPaM3arDvVfAsWECtDk0m/WIjSehB50Wz4dSO7IoWubUMTYUIEo
         BrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Th2VzxKA5njhVR7C6q0Seii6kGVYOgIuJRxukrhBkgQ=;
        b=ypPWGXVooAZ8GMSN/f3a6/VA1lvPf352aE8crzuTotJ2soWJgGVId8E1E8jjAPSEmF
         x/tF/y4rL5owxcn1PRc6wJ0sJiI1dHcSt3FAD2yBX+6cGFTsmJ8ZLzs9FxBqTEo1nmzq
         fNSglbhIjipPgTmgVHaFtEsWg9TYBfuENEGuGFDNOxCxHvRlBDWAkSaX92UQd7ZEyWKo
         VhCJ/VyRd3FuJievqHWpok9ckRKn5Eh97vIH6QdSSougrprR2N1HvqXq4cwRtohC6k1y
         9eFv2YrmSzn94ZEE/JWdPe0Z+Tn8hdDi5J/XzGPpq5re0A3IP4f36zN6/elkRBatDQsm
         3taQ==
X-Gm-Message-State: AOAM533E8ICQaNrgs/24ohexe3SWlpLtWEuLnlsInZzrxQwl5/F73c0v
        fJoBYuXEL2bH/6/3BzY2pQ3Ehw==
X-Google-Smtp-Source: ABdhPJyJzRz3LwsbW2JO7/ugaMGb55TgHovMgFBeG8ndCSD7iqVy6oMb2rwTj1pbePh020cZVO+8pg==
X-Received: by 2002:a2e:7f14:: with SMTP id a20mr501557ljd.320.1644956142858;
        Tue, 15 Feb 2022 12:15:42 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k16sm4548419ljg.111.2022.02.15.12.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 12:15:42 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: qcom: sdm845: add bi_tcxo to camcc
Date:   Tue, 15 Feb 2022 23:15:37 +0300
Message-Id: <20220215201539.3970459-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
References: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Declare TCXO clock used for the Camera Clock Controller on SDM845.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index cfdeaa81f1bb..9288bcd3475b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4139,6 +4139,8 @@ clock_camcc: clock-controller@ad00000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "bi_tcxo";
 		};
 
 		dsi_opp_table: dsi-opp-table {
-- 
2.34.1

