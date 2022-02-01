Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC4F34A53E3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 01:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbiBAALS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 19:11:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbiBAALL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 19:11:11 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE59C06173E
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 16:11:11 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id b1-20020a17090a990100b001b14bd47532so772619pjp.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 16:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BLyJY/CY058PdC6QzTbbwc0EGXgTrNIX9qqqeiwTwrw=;
        b=ayCvbNcKiPTczzqS9XHoyUnHjt4Z3nLj6ZGXwOxIZHj6AF48fpi0jxqXunWsnufBUJ
         XP/rpS0IRJa7HQ5OYPiMUxZL2ggXFfQABDoOVt/d0X+AFqc3zWrCT807UUnffnB4gxQe
         SW78/BW7hd2R0hYUJE5RfhI+c+gqz2DaYciDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BLyJY/CY058PdC6QzTbbwc0EGXgTrNIX9qqqeiwTwrw=;
        b=QIt6YljQUeSOH5ieNkrxLJv7GhVP5MkseGoM78h2HrICntucacS0SMGs912J7rBLSM
         8K30Y0WlNk/ChjWLHvCvcgfd8kK80eIdLGOIRy9j1RhhZC7t8WYG706gswxDEZf/5jkd
         NMCRCns9/rE9VPoLThkT83y/Wam5Lv/h4NQlvNdOTPXaXB6k5h8Bq1236OwqGWPcbcii
         KrV523+LL8Gm2rAmYG11Z1LR20OUG+iGDaf+1LDpcbuz/6s4ZvoUdiTHqCQkKz+bsPpK
         FPy+mZDKQFMhn33OCKW80Ov1RS0WNeMCo6ctJ5tXvC/smk1IyMEcxTSFwOTig+/7x66/
         ymMw==
X-Gm-Message-State: AOAM533xnpLLC3hbw8dk9gYxnfehpcRtjd970KC4im3gIMynRa/FzjuQ
        HbywCteQrarXaQj5GRaScDYn3w==
X-Google-Smtp-Source: ABdhPJzhPbukCAQnFB32y0r3lP+C+C9GoEC9M2CC+qRHwEeEZZNueWtJOl6DIlqw6o8Q3YFKVs9uEg==
X-Received: by 2002:a17:902:6b0b:: with SMTP id o11mr5876923plk.169.1643674271194;
        Mon, 31 Jan 2022 16:11:11 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:c47e:986d:769b:ead2])
        by smtp.gmail.com with ESMTPSA id oj5sm424024pjb.53.2022.01.31.16.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 16:11:10 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>, mka@chromium.org,
        swboyd@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: qcom: sc7280-idp: No need for "input-enable" on sw_ctrl
Date:   Mon, 31 Jan 2022 16:10:42 -0800
Message-Id: <20220131161034.5.Ibaf8a803802beb089cc6266b37e6156cff3ddaec@changeid>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220201001042.3724523-1-dianders@chromium.org>
References: <20220201001042.3724523-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specifying "input-enable" on a MSM GPIO is a no-op for the most
part. The only thing it really does is to explicitly force the output
of a GPIO to be disabled right at the point of a pinctrl
transition. We don't need to do this and we don't typically specify
"input-enable" unless there's a good reason to. Remove it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 7a987bc9b758..23e656e51904 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -534,7 +534,6 @@ sd_cd: sd-cd {
 	sw_ctrl: sw-ctrl {
 		pins = "gpio86";
 		function = "gpio";
-		input-enable;
 		bias-pull-down;
 	};
 };
-- 
2.35.0.rc2.247.g8bbb082509-goog

