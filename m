Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89B843293FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 22:45:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237309AbhCAVoH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 16:44:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237983AbhCAVkz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 16:40:55 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1C89C061A28
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 13:34:59 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id l7so8195248pfd.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 13:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/v9Pd43iBs+UXvunT6Xej2iPnF6YuJWrIvn13kPe8ps=;
        b=ER0cDodvgrX0R1orNgdEufheAUD+DGvVilhrK19E8IulYd57qgELzQcP3Y5muluHan
         LBP+p6Y4jL8/Q0Upaclhbl+YvpUOQlXr1YbfrJLED9ymGlvalRPjAI8SigCJn6izIzhD
         VgnBEI35E3zSBP7k7wKNaOq+MVhMkno6a5gUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/v9Pd43iBs+UXvunT6Xej2iPnF6YuJWrIvn13kPe8ps=;
        b=RA2ufHr5rrEoA1EB9KmhWTKrbGREtG5yjUfjzdf4CiojXECGkm+XLDMHQhv+HEG5tK
         l0dIoSowt97c9VCj1uzPX4Xc6OmXDsIEyoILSyp1tqC170rluNQ4aAW3P2cmm7F8KtxQ
         98Qdklzm9ftSldRTTwT6diFbXNG6zw8H1HV38svyG5Xcmn++Y734FHHXFhDmtToDxDdS
         uNRkIH8++xaTLmFXiiBEGfcXrIxZTWg9/PwSY2JBJ/QRk3FnPqVJYqGn+QhJF82ECNrl
         07idN+WwSgs/87juBKyORppTXGC0/ot9Y3Rxu5BOYEF9vG4pvxkeA3VU5I9TWlLCyH5+
         RmIw==
X-Gm-Message-State: AOAM533HQ/406MZUg/mi++4inUHyAnKd5WvxNkCZ4G3CZVaL4eyoInfg
        pavm/U3uuOsNV3e/Gxsf72vYQQ==
X-Google-Smtp-Source: ABdhPJzwzy+/N6Jkfo5THvMD7z0G+wqXpC7aqjYsGZ2pJZWXcsDeE47DPaZ/S3RIgqr9ZtmEyDKSiA==
X-Received: by 2002:aa7:8f15:0:b029:1ed:9356:a9e with SMTP id x21-20020aa78f150000b02901ed93560a9emr333253pfr.73.1614634499503;
        Mon, 01 Mar 2021 13:34:59 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:c086:5f6:85dd:98c8])
        by smtp.gmail.com with ESMTPSA id f13sm790366pjj.1.2021.03.01.13.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 13:34:58 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Abhishek Kumar <kuabhs@chromium.org>,
        Philip Chen <philipchen@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/13] arm64: dts: qcom: sc7180: add GO_LAZOR variant property for lazor
Date:   Mon,  1 Mar 2021 13:34:33 -0800
Message-Id: <20210301133318.v2.9.I4a38fe64dd79c54af80d7e4ef5940f8cf4f86e75@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210301213437.4165775-1-dianders@chromium.org>
References: <20210301213437.4165775-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Abhishek Kumar <kuabhs@chromium.org>

For trogdor, in the latest board-2.bin file, new BDF with variant
name GO_LAZOR has been introduced, so we need this property set, for
GO_LAZOR BDF to be picked.

Cc: Philip Chen <philipchen@chromium.org>
Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
[dianders: adjusted subject line and sort order]
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
index 5efa04d0d256..6b10b96173e8 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -49,6 +49,10 @@ &trackpad {
 	interrupts = <58 IRQ_TYPE_EDGE_FALLING>;
 };
 
+&wifi {
+	qcom,ath10k-calibration-variant = "GO_LAZOR";
+};
+
 /* PINCTRL - modifications to sc7180-trogdor.dtsi */
 
 &trackpad_int_1v8_odl {
-- 
2.30.1.766.gb4fecdf3b7-goog

