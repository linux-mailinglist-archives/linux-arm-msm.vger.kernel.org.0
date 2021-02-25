Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4217325958
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 23:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbhBYWPZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 17:15:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbhBYWO5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 17:14:57 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC1CC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:13:46 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id w18so4559763pfu.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4zwBjkMJGS+IZy9ICNLfkk+HUIUBip1htcidFl5tiVI=;
        b=I9rrQuSWljAocoj3aBTjQbt23RCc4NWStkE1NQQWHcvcOTMYCyqueUZpcAUTf+1oeM
         TwERyBQxNaMYn8RGasiE4K38NXr1/3sd5hoC93g7jgAjCDssvI0Zrm8N+H/5ywoBd2Jf
         SrxCEa7jtXwradokv9npIYFgQ+ZPLmQMHMFQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4zwBjkMJGS+IZy9ICNLfkk+HUIUBip1htcidFl5tiVI=;
        b=V2Zftd88l44Fl9/W1iYphX1k+m/L6TiCzJNZl2eMeU1m8/PBWxFBKiza7WjWnq9I/V
         sBIKbXXavnZ5jCAjqxx7hcwa5PsqghHKccxdNvrWeqYn+yVc2z/JDzZqghFNRTisLII4
         XdF6etBadRpsNsBoDWUK+S7m7QWBRgU73WDPXaobUXO3JaK15Qz4NdNkthP6z7ejOvk0
         o/e8PU30GsIBaFHpKXnyj9CcDSpYcLgpZ/cQqzXDjbMCdXzPxGh6G2TN9M2aPVxdlIjX
         /3QforDbqf49aqXkFLikgzyjEH/+rJZ/MZYaNVYpq3b08EKoMR3jAscfN20I3TkAqZRI
         ETPA==
X-Gm-Message-State: AOAM531U1EEny/thdyMmpTv7mfSO8M+DENs9gmMOuLo2MMTCebVXFDSz
        Br5d7v565/On6ft9qqtHUne8Rw==
X-Google-Smtp-Source: ABdhPJzPwuxhRV7o3IjGNASfZ9IF3YgqtfSTyEPkoaLmVLbNt7x4brgGIBQYDX75FCqFVH/8ItV5wA==
X-Received: by 2002:a63:4761:: with SMTP id w33mr60066pgk.118.1614291225926;
        Thu, 25 Feb 2021 14:13:45 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:8414:45a5:94c4:d35d])
        by smtp.gmail.com with ESMTPSA id jt21sm6713301pjb.51.2021.02.25.14.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 14:13:45 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/13] arm64: dts: qcom: Disable camera clk on sc7180-trogdor devices by default
Date:   Thu, 25 Feb 2021 14:13:03 -0800
Message-Id: <20210225141022.6.I22522b0c9db505ee43ed08e8d5d9e8fe632e7447@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210225221310.1939599-1-dianders@chromium.org>
References: <20210225221310.1939599-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Stephen Boyd <swboyd@chromium.org>

We only want to use this clk driver on CoachZ devices. Disable it for
all other Trogdor boards.  NOTE: CoachZ devices aren't yet supported
upstream so until it is this is just disabled for all trogdor.

Cc: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
[dianders:adjusted since no coachz upstream yet]
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index f3a99c801582..69bf600e1c9f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -568,6 +568,10 @@ cr50: tpm@0 {
 	};
 };
 
+&camcc {
+	status = "disabled";
+};
+
 &dsi0 {
 	status = "okay";
 	vdda-supply = <&vdda_mipi_dsi0_1p2>;
-- 
2.30.1.766.gb4fecdf3b7-goog

