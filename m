Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1A6A57B1D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jul 2022 09:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239968AbiGTHhL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 03:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239943AbiGTHhK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 03:37:10 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8977351406
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 00:37:08 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id x24-20020a17090ab01800b001f21556cf48so1217741pjq.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 00:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ecs-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=3Wj9GT1NdFqQ2oHNWAiuoS6nkINcnSck7GS6eVjAGfI=;
        b=mBMyPU/vqy55XL0Y2xA2hfo6WZDL605Hyj30QJqvh2C6iLY7UuxuT15c2zcoThoqiq
         qxAlvDwK6xKKmEh4MjPJqX3G9K7/iFFph9UdsQY+p2DjnKZ9I09yKhfiB4i03Kwg3I7g
         0rDEMPekkptPA2BevSfliJwThlDsqrlYqaAhPtWsQI41Wf7kh71xdEeBN/OCZMxsw28K
         mVs8tNo0fNvpL+Zp3hj3SvcK7BoqWMhBitlnONJbSsJRvQPxWJsTvRHdS9V5k12c/w9e
         wiWV1gptbrhRP5T+43DOqd4TtieVopZpwAtKB8tn9DVj+NXiLuIXFn+93a9NTll08s2D
         M2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3Wj9GT1NdFqQ2oHNWAiuoS6nkINcnSck7GS6eVjAGfI=;
        b=NwtGb5pqFbpKl8on90feB/iItUz/PZ2fGdMW4pVbcPJIbXhsLnz/FOk1jkg4TrCrqo
         mNPabWz492U+Pm+weF+hPdqaF4+MOWll7VqMS7LhOpXimlPA5NDL+3SJYi9UYdpMIzju
         TLg865sBn+01u8Fcvq5Xa197A+oGChrbVbqLVpz2+vYtPGIv/5qxtiTTqlP+4CX7LQWy
         kxrqhqbcb/NVIuT1GGB3lrgugyzjD2L737I92LFoGnopgr5VH3mAAxzOwQ99+w2bSDA0
         aZYeAb4KtsRlKB8PWV+8xx75yzX/vIDIcjaqUY2Qv/XsG4ifKpcok6ONuBGS9JdpEt6S
         eggg==
X-Gm-Message-State: AJIora+dkn6r77rr/5zQPwreKcA5hwaDnypXRMl5L3WlLuatGod3Ck3O
        yfELAa9xFr5o2Dn9NaNvDHSrPw==
X-Google-Smtp-Source: AGRyM1tvTO8b4fdoW6z++qQVp4cwEdSv1juNrFsh8iGREXYRTyg52uv5tQrn7+ojavdl2vNb2zlmCg==
X-Received: by 2002:a17:90b:4a83:b0:1ef:de4c:660f with SMTP id lp3-20020a17090b4a8300b001efde4c660fmr3745862pjb.213.1658302627968;
        Wed, 20 Jul 2022 00:37:07 -0700 (PDT)
Received: from localhost.localdomain ([103.104.171.43])
        by smtp.gmail.com with ESMTPSA id s15-20020a170902ea0f00b0016bf803341asm10997748plg.146.2022.07.20.00.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 00:37:07 -0700 (PDT)
From:   Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: Add SKU6 for sc7180-trogdor-pazquel-lte-parade
Date:   Wed, 20 Jul 2022 07:37:00 +0000
Message-Id: <20220720073604.1.I249596c011ff05da5a95d72fc321e115ef859803@changeid>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SKU6 is LTE(w/o eSIM)+WIFI+Parade

Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
---

 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts
index 764c451c1a857..767cb7450c0d8 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts
@@ -14,7 +14,7 @@
 
 / {
 	model = "Google Pazquel (Parade,LTE)";
-	compatible = "google,pazquel-sku4", "qcom,sc7180";
+	compatible = "google,pazquel-sku6", "google,pazquel-sku4", "qcom,sc7180";
 };
 
 &ap_sar_sensor_i2c {
-- 
2.17.1

