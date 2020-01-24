Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23E20149130
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 23:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387488AbgAXWnj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 17:43:39 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44980 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387480AbgAXWn0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 17:43:26 -0500
Received: by mail-pf1-f193.google.com with SMTP id 62so1783067pfu.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2020 14:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bui28Vv12xUmXWYpC+BbDFYgTGPFUNN9TS7e8X83ptU=;
        b=nJUnCZVZFNjMZvgzvmEPCuW8bMgT93sV0s2dZgIYVCytFK0KhhjowkK2AosMIsSyay
         KmsdEYHy/oKz+S9r2Kkijver4P7gSJN8tLFftGYIKJ/WG2/GJaPtQiiz5n4FA8uhSKE1
         yjW6QAW2ZhSfO7AVaFhdvXiXxzrTqDyFmvByI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bui28Vv12xUmXWYpC+BbDFYgTGPFUNN9TS7e8X83ptU=;
        b=nnmuYIu81HUIhPAfUfHxklQ+t+YHuiiRKCtYVcyOsismfdGkZdgARmK85MiJvDfELW
         Kkiu8kiatf4sI4wNjjsUe7izBLkArPQZjBaGzFLO1f58Zt1CyDlxs2BkWS9LZ3dLskAt
         RVqqyZXmAgsO0IPA7xA4BVptxd+BYp5RnJXUQx2si6WiY3JwXKvDvC0tO4iF8/YA8ZQp
         CQkjZDQ0XFxa1wcalVjTNyndMMJhKwAyO9lAJXkNfOEaq92c8iha6suXjMwi09q0+6dQ
         0UhApgzPxK2Xny62+ZlhLuHvQ4Egl0WJVz4sKmiX+xCqria7lCBOgqylCyWRAceNbsdR
         X04Q==
X-Gm-Message-State: APjAAAXQiDXBPTFibxb46+zph506J67BpQvVysAvCranLIIpNoeIn3nr
        uzgYsCDFuHwIWpd/470zn5LC2A==
X-Google-Smtp-Source: APXvYqzS9tPcZFwCykAq9Smp2Jxt5RR3eG4xljjcnI1eH/vNH2TY407AdxHLUd4cuuKsTLeq6urYLw==
X-Received: by 2002:a62:ddd0:: with SMTP id w199mr5272391pff.1.1579905805722;
        Fri, 24 Jan 2020 14:43:25 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id o2sm7690948pjo.26.2020.01.24.14.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 14:43:25 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        mka@chromium.org, kalyan_t@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        hoegsberg@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 09/10] arm64: dts: qcom: sdm845: Add the missing clock on the videocc
Date:   Fri, 24 Jan 2020 14:42:24 -0800
Message-Id: <20200124144154.v2.9.Id0599319487f075808baba7cba02c4c3c486dc80@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200124224225.22547-1-dianders@chromium.org>
References: <20200124224225.22547-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We're transitioning over to requiring the Qualcomm Video Clock
Controller to specify all the input clocks.  Let's add the one input
clock for the videocc for sdm845.

NOTE: Until the Linux driver for sdm845's video is updated, this clock
will not actually be used in Linux.  It will continue to use global
clock names to match things up.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Patch ("arm64: dts: qcom: sdm845: Add...videocc") new for v2.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index e624c91dbd6d..8c41e25bd4a8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2605,6 +2605,8 @@ video-core1 {
 		videocc: clock-controller@ab00000 {
 			compatible = "qcom,sdm845-videocc";
 			reg = <0 0x0ab00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
-- 
2.25.0.341.g760bfbb309-goog

