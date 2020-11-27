Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01F872C624F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 10:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgK0Jz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 04:55:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbgK0Jz6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 04:55:58 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A8BCC0617A7
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 01:55:58 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id s27so6227974lfp.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 01:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CLNYIE3vndBOAusimV+1mCUTRKa8LpNqu793Pf61Gw4=;
        b=ZIhDHaGelTUDMqnT1aXPAqMMqH+UraAtd7jS2EAzw2GAnpHbpUW6e4ZEgRnwKbdlyU
         tWH11C1Dt0uyRZ0+1sF+JWg9cz7o1Kc8WRM04cxL3r/72YDjjaQBVtPw/5MOueeRuJt4
         nYwTp51nXjEFLXfB5wGHN9Rk0CpljusaOKJosSwjqZMLaqK7SCINg/g6gUubjCM2/tLQ
         kNPHCiKgHLLHrwIffhBxqdIx7SYlsm8OZjPOwDG8Tq0pHLZTVyA/cwV7T2V9fBvv6NH3
         huTSLHoJP/lKiya9RPsT9Ac4TEpeZ5/fb9CSMW0mdAjGzCkP5dXjXoJJhJBqfRkdyOB3
         fgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CLNYIE3vndBOAusimV+1mCUTRKa8LpNqu793Pf61Gw4=;
        b=lyu+JuuZ1mU7aiKdwyOY7J6n9NaTILYjCOAQSwQy9MH2ziBIsR45YtTtYa6Bw+fk+h
         h6dLfQ3RyP5VfPvjjkzUDfwWuw+gsit1IeBHLTzInafVXGIro3zPuZ0n6/y4ntfZz49L
         VvANrN1moo74ayWRzeA/6vtGFs2HvtZQIFMk7PmRi+z4XzSD1c+7VE5050HsNCcHW5nP
         x3kyekoNalUaeFUsdyctcaiogcjr+ilLLaRNfm5phR96XBOZ6q5YxvkmicseNCOcoFgL
         p3arb25K/rg/OCY92uJyC2xZpoNU9St0aUgX1W7rbaeUHAvvEpdE54LiqrRmquLAFEdr
         rmpQ==
X-Gm-Message-State: AOAM533ZpIW1P/iR0WqWnSaZscYDwA/q1lxnq8CBMsrQ2236mj51wLLO
        RKPMM4olpz2lQ9irNH0PYK5hsA==
X-Google-Smtp-Source: ABdhPJxz6WuNCrwose+c9RXiwtZgc2KinpGme8TrIpNriyinPFysm/TsfiZQMS1gTwQdzElxKs8mhA==
X-Received: by 2002:a05:6512:491:: with SMTP id v17mr782337lfq.142.1606470956984;
        Fri, 27 Nov 2020 01:55:56 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.79])
        by smtp.gmail.com with ESMTPSA id x25sm628477lfn.99.2020.11.27.01.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 01:55:56 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 5/7] arm64: dts: qcom: qrb5165-rb5: correct vdc_3v3 regulator
Date:   Fri, 27 Nov 2020 12:55:46 +0300
Message-Id: <20201127095548.128217-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127095548.128217-1-dmitry.baryshkov@linaro.org>
References: <20201127095548.128217-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

vdc_3v3 regulator is sourced from 12V, but it is controlled by l11c
regulator, so set it as vin for vdc_3v3.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index d1f6cadca35a..70e11705e9f6 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -80,7 +80,7 @@ vbat_som: vbat-som-regulator {
 	vdc_3v3: vdc-3v3-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "VDC_3V3";
-		vin-supply = <&dc12v>;
+		vin-supply = <&vreg_l11c_3p3>;
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
-- 
2.29.2

