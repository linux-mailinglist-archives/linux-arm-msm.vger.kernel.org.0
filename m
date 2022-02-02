Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2714A7A39
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Feb 2022 22:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347518AbiBBVYR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Feb 2022 16:24:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347494AbiBBVYN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Feb 2022 16:24:13 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492E8C06173B
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Feb 2022 13:24:13 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id h125so569166pgc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Feb 2022 13:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lx3TMLoS/ccsHQO3VD+SVt4McQv0p6ZVmWj0lN92NGU=;
        b=S+FmMe0XDGVbdO6F2612akicEND36WrZ545/CycVbEwrRBh4kp/wdVuVVqNuaUaeF+
         6nbFlmNfNe6kmMPySV3vLO2HSUV1wfTMq6TfParESA95Lplf3Z/0L+fwi3+NQDp6CP15
         MXcKVvJiU4k8LFmC8HB1TxNcngIOSce+Rmiew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lx3TMLoS/ccsHQO3VD+SVt4McQv0p6ZVmWj0lN92NGU=;
        b=GiFIanB3QAVZ96PnKJ6nnZiHbDZp6DBV6FYuE+tdchsVAyoRX0OomYMhaODBDJoRqG
         UAdOpq1w+li4DQoURA2kfDNBpH4O9AN3XsScWPrgV4k4CLeycts0RxEiV2yKJtRTJjkf
         ExzQps06wPiZiQ0m1NxLxNQ/zp0xOYr0qn/a0cc162qpV5m/GIsSxxa26WGiL+Mh14Le
         P0MRQGjwBLUgndXtr6m0oVw2HQYpZZdJzz5vHZsRDiKNHjcWu8ZVqnTfYhTsMSqphUVo
         XcUyDaLagdfv+BXI9qhODvOLYMvtFEf99RHxA2s0SqPKGUWym1hfbXcNEy+/zB1V2xqs
         VRpQ==
X-Gm-Message-State: AOAM53214NjNg7c97dTShNucrlEwQmoMlI78D7217IrgfzrpMpUBv4Oe
        zSh+lZXLwbT45ISzfJv8Kq1Rpg==
X-Google-Smtp-Source: ABdhPJxvlqacvd20dmSeJxHRuX/KACpy2OMOVqGgPZDO27KpcoQz++ErAJUhPqThhWXtLkv9zVrgjg==
X-Received: by 2002:aa7:928f:: with SMTP id j15mr31649692pfa.58.1643837052801;
        Wed, 02 Feb 2022 13:24:12 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f1c4:10b6:b4ef:16e5])
        by smtp.gmail.com with ESMTPSA id on9sm7627983pjb.16.2022.02.02.13.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 13:24:12 -0800 (PST)
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
Subject: [PATCH v3 02/14] arm64: dts: qcom: sc7280-herobrine: Consistently add "-regulator" suffix
Date:   Wed,  2 Feb 2022 13:23:36 -0800
Message-Id: <20220202132301.v3.2.I627e60c5488d54a45fd1482ca19f0f6e45192db2@changeid>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202212348.1391534-1-dianders@chromium.org>
References: <20220202212348.1391534-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some of the fixed regulators were missing the "-regulator" suffix. Add
it to be consistent within the file and consistent with the fixed
regulators in sc7180-trogdor.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---

(no changes since v1)

 .../boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts
index ad4fe288b53c..f159b5a6d7ef 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts
@@ -177,7 +177,7 @@ pp3300_tp: pp3300-tp-regulator {
 		vin-supply = <&pp3300_z1>;
 	};
 
-	pp2850_uf_cam: pp2850-uf-cam {
+	pp2850_uf_cam: pp2850-uf-cam-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "pp2850_uf_cam";
 
@@ -192,7 +192,7 @@ pp2850_uf_cam: pp2850-uf-cam {
 		vin-supply = <&pp3300_cam>;
 	};
 
-	pp2850_vcm_wf_cam: pp2850-vcm-wf-cam {
+	pp2850_vcm_wf_cam: pp2850-vcm-wf-cam-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "pp2850_vcm_wf_cam";
 
@@ -207,7 +207,7 @@ pp2850_vcm_wf_cam: pp2850-vcm-wf-cam {
 		vin-supply = <&pp3300_cam>;
 	};
 
-	pp2850_wf_cam: pp2850-wf-cam {
+	pp2850_wf_cam: pp2850-wf-cam-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "pp2850_wf_cam";
 
@@ -251,7 +251,7 @@ pp1800_fp: pp1800-fp-regulator {
 		status = "disabled";
 	};
 
-	pp1800_uf_cam: pp1800-uf-cam {
+	pp1800_uf_cam: pp1800-uf-cam-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "pp1800_uf_cam";
 
@@ -271,7 +271,7 @@ pp1800_uf_cam: pp1800-uf-cam {
 		vin-supply = <&pp1800_l19b>;
 	};
 
-	pp1800_wf_cam: pp1800-wf-cam {
+	pp1800_wf_cam: pp1800-wf-cam-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "pp1800_wf_cam";
 
@@ -291,7 +291,7 @@ pp1800_wf_cam: pp1800-wf-cam {
 		vin-supply = <&pp1800_l19b>;
 	};
 
-	pp1200_wf_cam: pp1200-wf-cam {
+	pp1200_wf_cam: pp1200-wf-cam-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "pp1200_wf_cam";
 
-- 
2.35.0.rc2.247.g8bbb082509-goog

