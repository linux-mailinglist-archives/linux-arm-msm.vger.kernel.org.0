Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E369A525866
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 01:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359573AbiELXgw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 19:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359530AbiELXgw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 19:36:52 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67FBD580F9
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:36:51 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 4so8334257ljw.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=azPGR+vZJiRZ8wrc365ZR8Nim5+sjCT0QCeZdqg0Fso=;
        b=l5nombBMfLAuoochQ9oKZQKmL4OlVXimRrMej51XNpCjFbI+7UJi97jWbuDOSquEoU
         8Xns6m6Xc2aRVdzBcLMxBJ7A48uyOpqfwq5CTKT+O/DUBTfNBzIaJ9ocYIXvw7N8HKKh
         wZKDdQ6VtJCQfaOvOw+A8Ph1ZlZtbHtxdAaoDIMy7SB7hIs92PDWqfdtQxUMGB+pLxmt
         RlVyJTHg3L2wK56nSPk13WlmcUb4Eppn/TvKfXbdgo4U03FFOj+Cwl2U9OaPPxg2wIdr
         syXry3wLBnBGqGV3z+0lxjuMYfsfga1fN/9KnUv+wO/bqM3ji5wYesLAM4c7HOUXnrpM
         rQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=azPGR+vZJiRZ8wrc365ZR8Nim5+sjCT0QCeZdqg0Fso=;
        b=hgrqDKc+BoCkvkxIN5swHguxi/lmVBBLhNHxV3fDbvaKYdjDUEMTS6dGw2TXKtd+2z
         29HCr/FW1KLbjqHdxoBwtGhsNyqUlu6W5p/3uJGYrOwAZpruPTXP2ZUZLlvRnLElnnOH
         8ZtJ6nrl6S3jIM76TWpjufcRK3X0uSTbMGmiF+Z2GrH+EzLBpSsjTi3gQR9lMb1H5aPA
         qEIajoHuvAJm7ezrAQTA6qRuBoERdQjU+7vz3zA46R6c1kj9icf0nW29e4YDffNls1sQ
         djR7IG2rJVypK1cLjIkccn91WY4CpirQmjZ1rzlwt4NROby0vEwhy98jAKQPTKpnKm7V
         vDew==
X-Gm-Message-State: AOAM5326ZuiYdvHGcUlCzU7U/LahrSliHJO8mqBl7MfpQbmI/2ypGQFY
        tcOusumgmC3m8hWuKqm3qQhYIQ==
X-Google-Smtp-Source: ABdhPJxgCHMnJ4LEek1kUdhz+O1bKDx5YuEx6gHj4DQBPerUjDefkT8WWBp7JYFactZEmVCxE/WRtw==
X-Received: by 2002:a2e:8902:0:b0:24f:1446:3101 with SMTP id d2-20020a2e8902000000b0024f14463101mr1437014lji.266.1652398609807;
        Thu, 12 May 2022 16:36:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p13-20020a19f00d000000b0047255d211c1sm127937lfc.240.2022.05.12.16.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 16:36:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/8] arm64: dts: qcom: sdm630: disable dsi1/dsi1_phy by default
Date:   Fri, 13 May 2022 02:36:41 +0300
Message-Id: <20220512233647.2672813-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
References: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Follow the typical practice and keep DSI0/DSI0 PHY disabled by default.
They should be enabled in the board DT files. No existing boards use
them at this moment.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 240293592ef9..8697d40e9b74 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1559,6 +1559,8 @@ dsi0: dsi@c994000 {
 				phys = <&dsi0_phy>;
 				phy-names = "dsi";
 
+				status = "disabled";
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -1592,6 +1594,7 @@ dsi0_phy: dsi-phy@c994400 {
 
 				clocks = <&mmcc MDSS_AHB_CLK>, <&xo_board>;
 				clock-names = "iface", "ref";
+				status = "disabled";
 			};
 		};
 
-- 
2.35.1

