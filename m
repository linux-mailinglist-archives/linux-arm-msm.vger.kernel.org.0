Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 297B85BD503
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Sep 2022 21:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiISTAv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 15:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiISTAs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 15:00:48 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1683F33A08
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 12:00:44 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id o2so14153lfc.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 12:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=aQpCr8CbcLt5b8cCorH9mTi++VmrmoqaYGapPOIr11k=;
        b=cNVv0xP0qxV9iatZ/ZDu/eVjPg37cWXUSle1jYYHMovzo3fE05+qmAtHsy8jUptYF+
         1Mz1HDx4se6RuY+I3wdfgKSkBT/dNLkMcmXr1OPU6SVeEnCcjSZws8mlmELGNRrAb5Wo
         ylie2OjzZaGdQTVb3hCAGtfbXsO5LkSI7wSyUcB/tVtZ2ph+Nyzw2wYsHT0LojN+m88t
         kF/tz7x+NpWubwevmiKNIZwactJbmdqJhNfeK3omihMjAIBxZxGuz+dIyrUS0ihH8ErE
         IlQtORiRTOLVleiPcOSPIcit53EwlaTJQ38RPyI3eGf+1w8MtUqsMBOgD1auG9J8eMyl
         yLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=aQpCr8CbcLt5b8cCorH9mTi++VmrmoqaYGapPOIr11k=;
        b=rqEHoVCRuOHPNpQnj/bDjeOj0zKo3Z+22S7IoJ0ZmLULe0WITAMu7bGIISwE5zDs7+
         6c0cjsZ7CUOjyETAIJMMkrve2OAwHYS+DZbQAi/4TbcEpn+47+1sIy13YReG36wqF1nn
         mlo+Gp+p2auVNgXN8KPW6xg/eUpbMGfCvEQV3+hFaKgeG80XaV0M4Lou6np5T4Er/93V
         NbtFEJieHZ3qIbstrM0kvj0K7Dy13Xq9lXzdElqtiBrGAwlNTcZYKU6HoKbh3BSZ53D1
         hvQdn3KGSgo20MYIENdQdqQrcRuI5UGyk3MJdbA/bXPUsgYWGTZq4iqhnB3IWezp/JPg
         u1Vg==
X-Gm-Message-State: ACrzQf385qgUWe/tE+WqF/S0lSEdBon26mfJlrb9QedkVPduIZDW0mAy
        eJfa5oem0N4BhlkPD95oEqcafg==
X-Google-Smtp-Source: AMsMyM6x8+Dr5zV99tyRXp3ZcHReWx2xJiyLFP60ckhf+0nsObPl+cYKowYDbd7kgcfjtjNm9tcbJg==
X-Received: by 2002:a05:6512:12d6:b0:49f:48d4:a1c4 with SMTP id p22-20020a05651212d600b0049f48d4a1c4mr6848529lfg.52.1663614044292;
        Mon, 19 Sep 2022 12:00:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u12-20020a05651220cc00b0049a747d6156sm4878907lfr.287.2022.09.19.12.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 12:00:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 5/6] arm64: qcom: dts: pdx223: correct firmware paths
Date:   Mon, 19 Sep 2022 22:00:36 +0300
Message-Id: <20220919190037.2122284-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220919190037.2122284-1-dmitry.baryshkov@linaro.org>
References: <20220919190037.2122284-1-dmitry.baryshkov@linaro.org>
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

Correct firmware paths for the Sony Xperia 1 IV to include the SoC name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
index d68765eb6d4f..82918c2d956f 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
@@ -523,17 +523,17 @@ &pcie0_phy {
 };
 
 &remoteproc_adsp {
-	firmware-name = "qcom/adsp.mbn";
+	firmware-name = "qcom/sm8350/Sony/nagara/adsp.mbn";
 	status = "okay";
 };
 
 &remoteproc_cdsp {
-	firmware-name = "qcom/cdsp.mbn";
+	firmware-name = "qcom/sm8350/Sony/nagara/cdsp.mbn";
 	status = "okay";
 };
 
 &remoteproc_slpi {
-	firmware-name = "qcom/slpi.mbn";
+	firmware-name = "qcom/sm8350/Sony/nagara/slpi.mbn";
 	status = "okay";
 };
 
-- 
2.35.1

