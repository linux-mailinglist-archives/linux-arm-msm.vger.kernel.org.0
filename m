Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBB01B60D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 18:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729708AbgDWQ0Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 12:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729703AbgDWQ0V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 12:26:21 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23315C09B044
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 09:26:20 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ms17so2731416pjb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 09:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fs+VyUYiQhHLqjr9qU6M46uht+we4DMR37Sq8mHOUJg=;
        b=DpLPKwlMZsLZnxIioolM8ptTrEbItSx7IHdh1uPs+5fsxWGMGiV+5LduIaSEo0UdUH
         lfewHcUPuCS2CaHrmBVsSnkGCWg/Y04/Hd85eHRDtEqVH1g+b5xaPV0zWfvc0d0aJOmW
         t+u2CkySUhgOQJfywp7JUZRfHAv1W7wSiwO2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fs+VyUYiQhHLqjr9qU6M46uht+we4DMR37Sq8mHOUJg=;
        b=CRLN5/ZxMdYHAr6h4m5v2fH36n2DrPc34+G+NUA7RBJ8Y3/ou9Tbh5M7Pt9ssXl7o9
         VGRtfgICTuM7lyqqxVF9AxPcgj83lGiraqciB5s0i+ElLXtAkg10OI1ILnrkiDqtdoDR
         5BKrEDMgfG3l/1Ypk6zqPqXyvNBOVrAqO0QHD6hUvBQywLGWnYQK7bLsaiBDQ8Yb9iea
         eVu3Z28zuI3p3uXbGtlmmUTF/7G/0jHPr2Jf3Ctetj9rqYTEFbkwkfPOE/uXHwW+Ej5q
         U4yUiBOPIEozlVSUSS+pFFEuJjahJF+fXc3s6gUyjCQfELrDWDgwZ8oUQHwBiQxbxUY/
         ha8w==
X-Gm-Message-State: AGi0PuYKli99Ybw4eUzKZMQ96YvRV+2/zKox7JfdYDk1SFRqullGmse/
        kBJn6folaFAqEzQWZ5+PfltOag==
X-Google-Smtp-Source: APiQypKJjjilIFJnRl4OpyzS4YRq70Qi1utK3lHOL5ENRwaojLCeKCJCNTxUDY7zc6N7YPo9khOOyw==
X-Received: by 2002:a17:90a:f68d:: with SMTP id cl13mr1559548pjb.107.1587659179681;
        Thu, 23 Apr 2020 09:26:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id d12sm2841927pfq.36.2020.04.23.09.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 09:26:18 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        narmstrong@baylibre.com, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org
Cc:     swboyd@chromium.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, jeffrey.l.hugo@gmail.com,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        robdclark@chromium.org, jernej.skrabec@siol.net, jonas@kwiboo.se,
        bjorn.andersson@linaro.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza
Date:   Thu, 23 Apr 2020 09:25:48 -0700
Message-Id: <20200423092431.v3.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200423162548.129661-1-dianders@chromium.org>
References: <20200423162548.129661-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We don't have the HPD line hooked up to the bridge chip.  Add it as
suggested in the patch ("dt-bindings: drm/bridge: ti-sn65dsi86:
Document no-hpd").

NOTE: this patch isn't expected to have any effect but just keeps us
cleaner for the future.  Currently the driver in Linux just assumes
that nobody has HPD hooked up.  This change allows us to later
implement HPD support in the driver without messing up sdm845-cheza.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v3: None
Changes in v2:
- ("arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza") new for v2.

 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 9070be43a309..5938f8b2aa2f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -548,6 +548,8 @@ sn65dsi86_bridge: bridge@2d {
 		clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
 		clock-names = "refclk";
 
+		no-hpd;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.26.1.301.g55bc3eb7cb9-goog

