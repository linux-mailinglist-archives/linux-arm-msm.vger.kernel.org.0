Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7D6F62CFB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 01:32:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234468AbiKQAcx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 19:32:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbiKQAcw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 19:32:52 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A7FD58007
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 16:32:50 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id z14so284363wrn.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 16:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcdtstQsKk2G63NblmToYrdyw9q10P2eTnPQzla04GU=;
        b=sOecY4Fy4anRIpLdMV4e3kkrJS/n1KuUajiBVjcycQ5IeewDlfGPLhkYIDQSj8prXE
         RP0NL5LvubhuVU51gzbyk7OiPh6bsFB01sKDn4kNoaBws4KfHYK8hF7ykFMV4HRZ6oQ7
         MHzVL5c956hhIKVw/GDR2rZY129TcQ0D2X6V0+doPc/z+pjikIKUylqcEtblZiZ/DU7l
         9/DIoC2oSXqEH0O3bBKITj7gJ2nVSPzk/eg1Np4vQrBVxc8dnrMsPg2LZGxMgaxYXUeH
         jD2MH5gkFQ06p6slE4+qIE6TU8QisTYZJlXT6NuXlhX9vnYxh1sieZ/hOwz7YZrY4NRc
         uC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcdtstQsKk2G63NblmToYrdyw9q10P2eTnPQzla04GU=;
        b=w3BgtNfXLbVNI3igJwzmssUCh83k41XJ3cBHKKxdlZ96/43F3dEZLNaJRex5IG3BB4
         1bV8vlvEXFLuyb4zk7LBk7wL5UD2VcO3r33h8zbXj/FuWAuoyPlhGCGO0UN2Klz6bXP7
         bPNLsxgGI0W9UDYJVmqaE9LgfxeKZrgTE4HRjjw3xKZeESWNyjl9HSIyoxXYJ/idpyqy
         ekh+ZnQfErNV2ouHHjsIAOZ1zs1Ykgj1MxcqVH2J72Q5mXfttAmIikyW7r6ZvrOmQ/sx
         RIfpyFFfjhYaeWduKUJPSAQGcbRDNX3ww19jlajBNd9doL9x9r8uerbbI2c9qvp9e5r5
         fyyA==
X-Gm-Message-State: ANoB5pmrPfx02ImRd6APdImmmrFtx48GyqQ6TAMrBQ0ETBA/fkpNonMb
        XuNxLu8YSXkOYOGIeCP3JR/00Q==
X-Google-Smtp-Source: AA0mqf4FHapTgxG6fDq395XcQt3K1CdqYO2TunjV93yBViJMSmzQATxhzc+FJfPux20YS8mMFSNSQQ==
X-Received: by 2002:a5d:522b:0:b0:236:8201:119c with SMTP id i11-20020a5d522b000000b002368201119cmr15244wra.558.1668645169186;
        Wed, 16 Nov 2022 16:32:49 -0800 (PST)
Received: from localhost.localdomain (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r18-20020adfe692000000b00238df11940fsm16472703wrm.16.2022.11.16.16.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 16:32:48 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v7 4/7] arm64: dts: qcom: sdm845-db845c: Use okay not ok, disabled not disable for status
Date:   Thu, 17 Nov 2022 00:32:29 +0000
Message-Id: <20221117003232.589734-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117003232.589734-1-bryan.odonoghue@linaro.org>
References: <20221117003232.589734-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use preferred "ok" not "okay".
Use preferred status "disabled" instead of "disable".

There's no functional change here so no Fixes has been applied.

Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 8a98f3e86b41d..be946f71666bc 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1182,7 +1182,7 @@ &camss {
 	vdda-phy-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l26a_1p2>;
 
-	status = "ok";
+	status = "okay";
 
 	ports {
 		port@0 {
@@ -1220,8 +1220,6 @@ camera@10 {
 		avdd-supply = <&cam0_avdd_2v8>;
 		dvdd-supply = <&cam0_dvdd_1v2>;
 
-		status = "ok";
-
 		port {
 			ov8856_ep: endpoint {
 				link-frequencies = /bits/ 64
@@ -1261,7 +1259,7 @@ camera@60 {
 		vdddo-supply = <&vreg_lvs1a_1p8>;
 		vdda-supply = <&cam3_avdd_2v8>;
 
-		status = "disable";
+		status = "disabled";
 
 		port {
 			ov7251_ep: endpoint {
-- 
2.34.1

