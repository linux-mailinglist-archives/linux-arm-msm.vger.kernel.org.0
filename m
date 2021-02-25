Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31EA532596C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 23:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233871AbhBYWQK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 17:16:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232144AbhBYWPj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 17:15:39 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A040C061221
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:13:49 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id g4so4782652pgj.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DWfJgrkm+PiOhD7g8KXUD8ia7V1Lzy83q7sZnbzerdI=;
        b=A/aRmSydE/uJYEhHY+s4KHoIPPxgRYmCY5N1mmrw2rW5mmZ+XMApgFAYNieqeFW9bP
         R8oPJYyypqaixPSp52KTRAqNihidnvEfavgNdHzwrK/qGGM7bIYAZCstVhjU5fvT6PUz
         AAh2vuza8Zlg38SFwI892+Gl0+GVqOeaOp+Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DWfJgrkm+PiOhD7g8KXUD8ia7V1Lzy83q7sZnbzerdI=;
        b=fCk7WTJIRZXK0ar4y1BIqDp9tgaZubRIstm5KliHZOFDieT+/N86sugazcPpxalnk2
         Pa3zUR+AqBp0eXRCVSG57bUy3wk9C2wf3JDVu84kAscbsCzYuLc6Q6pm5guXJYhhiSsa
         wwKGTErD1XYT+cRfHj8QpiTU8q0jMJHx45QzHJN/XZJrbwNXSQNd/cgyFGaSWH13gnkT
         9og4eyB1R7nkBkw/FXZ2kR+igB2iGaLS8FkJj20bEcVlTSn3+zKZl5aqg8nwLAk0Q6mt
         6+sV/K6TlRuKwtZtRsLGpGaaoO+MvqRo5/KfcOqBSM5tYq2T92TvgQ0N6gD986GMAdkH
         9CXQ==
X-Gm-Message-State: AOAM532/I5Xi53Vbzsu0922afVVqCJ8TavzEVKXm+toxQEfGcwN9qOm/
        ntvFjuBihsDbeRe0yZALQWZ2xw==
X-Google-Smtp-Source: ABdhPJyRASVmSouq5LszmzLBjUuuxzI6kqNOdBDRujBCpa+n4UpgF79DeAwjNdtxwKoNGZsLUw1ZZA==
X-Received: by 2002:a63:4f59:: with SMTP id p25mr8007pgl.335.1614291228656;
        Thu, 25 Feb 2021 14:13:48 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:8414:45a5:94c4:d35d])
        by smtp.gmail.com with ESMTPSA id jt21sm6713301pjb.51.2021.02.25.14.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 14:13:48 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/13] arm64: dts: qcom: sc7180: Remove clock for bluetooth on Trogdor
Date:   Thu, 25 Feb 2021 14:13:05 -0800
Message-Id: <20210225141022.8.I80c268f163e6d49a70af1238be442b5de400c579@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210225221310.1939599-1-dianders@chromium.org>
References: <20210225221310.1939599-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>

Removed voting for RPMH_RF_CLK2 which is not required as it is
getting managed by BT SoC through SW_CTRL line.

Cc: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 12397e31bef6..05e3c3db2e9a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -833,7 +833,6 @@ bluetooth: bluetooth {
 		vddrf-supply = <&pp1300_l2c>;
 		vddch0-supply = <&pp3300_l10c>;
 		max-speed = <3200000>;
-		clocks = <&rpmhcc RPMH_RF_CLK2>;
 	};
 };
 
-- 
2.30.1.766.gb4fecdf3b7-goog

