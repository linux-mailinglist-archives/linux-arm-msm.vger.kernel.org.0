Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C929F4A7A35
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Feb 2022 22:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347501AbiBBVYM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Feb 2022 16:24:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239328AbiBBVYL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Feb 2022 16:24:11 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA33FC061714
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Feb 2022 13:24:11 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id e6so409462pfc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Feb 2022 13:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i4WGKpLM5d225Yy80Ebf/msPm9bZWnw4jLfGHHCULaY=;
        b=kvdClqHx9m5Fx5WsiTKBnO5iR5fKTkWEyaXLdb/SgjByx/xI49QFUeoIRKzrGmHU33
         3WBiT7Pb0Y37Mbr1dNzyQMpdkngEwHguZs9gwi758yqDVAOXsRHR1UDrHhRInPx8OS+n
         2KyC/i4HRLegFrYfWGFjt5P9mnubLeCRk4Wo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i4WGKpLM5d225Yy80Ebf/msPm9bZWnw4jLfGHHCULaY=;
        b=77tNr5wjUsTTo3uSzu6m45p7MAQxZubzUeNdB5MZdpxlGqaxn4VmYgZZ8OXe7ttaDn
         KhFf4uw/5PrpXyhh9Am1iQzvKUQeIkEHewI85D/cCTh1ic/myXvXQZdIBfdrxQoATY7T
         S3obrLhGkJnjKEc29k+Rwvx6sgInm1/U8TfEMC+kXki7DQbLi5+8wDvKccCCeqbj+pMY
         nlJuInHiXU4aEaHNVZ3kiYNfGK6VQ54IZVO9KBeOtA57BYLor0nKkOS01bo92gYO2cjh
         aywT0aaeQa5/R7Fv+szNHSrYb2DpYdD6Cgp2pqdAXjDVNDKtkqbptqKZ74r8iZReTd5U
         FcmA==
X-Gm-Message-State: AOAM5308r5jVOaTglUVb296Vr70zRkoqHaW/F4a/8fGpNEcYUKMZsCK5
        DqF5U8E3zClZd4otoQpAk4v+pA==
X-Google-Smtp-Source: ABdhPJykoMzCtnDv2hPHTz2HWWXMhhw2FS1TINJjCXvSh3UzfrQ40FYv+iRPnS3ADvp6imgLpzgtNQ==
X-Received: by 2002:a05:6a00:8d2:: with SMTP id s18mr30930242pfu.5.1643837051273;
        Wed, 02 Feb 2022 13:24:11 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f1c4:10b6:b4ef:16e5])
        by smtp.gmail.com with ESMTPSA id on9sm7627983pjb.16.2022.02.02.13.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 13:24:10 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     pmaliset@codeaurora.org, mka@chromium.org,
        quic_rjendra@quicinc.com,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        kgodara@codeaurora.org, konrad.dybcio@somainline.org,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        sibis@codeaurora.org, swboyd@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/14] arm64: dts: qcom: sc7180-trogdor: Add "-regulator" suffix to pp3300_hub
Date:   Wed,  2 Feb 2022 13:23:35 -0800
Message-Id: <20220202132301.v3.1.I7b284531f1c992932f7eef8abaf7cc5548064f33@changeid>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202212348.1391534-1-dianders@chromium.org>
References: <20220202212348.1391534-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All of the other fixed regulators have the "-regulator" suffix. Add it
to pp3300_hub to match.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 7d8bf66e8ffe..78296ed6fd29 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -284,7 +284,7 @@ pp3300_fp_tp: pp3300-fp-tp-regulator {
 		vin-supply = <&pp3300_a>;
 	};
 
-	pp3300_hub: pp3300-hub {
+	pp3300_hub: pp3300-hub-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "pp3300_hub";
 
-- 
2.35.0.rc2.247.g8bbb082509-goog

