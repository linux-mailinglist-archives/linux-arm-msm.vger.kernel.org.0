Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 187395271A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 16:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232940AbiENOKt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 10:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232938AbiENOKs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 10:10:48 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9421B140D5
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 07:10:47 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bu29so19031221lfb.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 07:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M0l8uf13lS8T2BMe8oGUirk3JiCk+Q/7ugdeXN9BOAM=;
        b=U8hSAUb8DK2WBaCc/mVtKuRoBrYqxsph2Kt1kxzCH08QEOaPvN1hbyyaqdSAv+dUsB
         k7WLZIWrXdKEtfGJRBF3Lnd25XzhdERyQ9h2wCpfHRfwaTg86kIbnXKbAjEZXKU9YVi3
         pwJbDIzYVjTBGDUsBNZs+Qb6TqaWo5rFf1uEJ3fY+p4SOHP5GWaM4/pvrI1bD1Rq60cU
         3K++xLMmYGJa5L+0ToqPvhXIPcStq7BfixJ5eg6h2qd9uTx2tl+VdnPLMSUswBN32j9M
         80z/TZZl0XDLYtfLkIwof/w33itntUCW06aTaavWHJtLPcTdRoClamlPAkrw/P4sRmyT
         6nxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M0l8uf13lS8T2BMe8oGUirk3JiCk+Q/7ugdeXN9BOAM=;
        b=MyQtAZGCTNPw0LDw4J3VfWAB4by5K/somEyNi9unxuwKC19o3VpGSmaB8Y+9BIz471
         kP0cK9YQBxaxBEYQiVJK0nrmNSSxxqwlgIWH00GgR/iEk8hfQX83E+pbj0i9KLvY2EbF
         I3WyZUirN3+8ipmQtw8cKQmuMgGo0zHespGdbGaovv2kUO17LYPTY3BZ2YHSxtGC4Ho/
         MRbiPcXGhIo6RJkTMzhi6sD4W3FHJO0b/k0Kf+vL7nrNKTnxQo8qJ3Qc3hhkQFm7cBFM
         WALH8VLFbe3cespIT+6miXMtK69Hp/njlRf1p5PT6h7GVfAkZOITEaLSxCitDdeeoPT8
         866w==
X-Gm-Message-State: AOAM533JKJ/sPHveq2ondh7weJdomH1ZgADbuqz1vEmHZqXgf8zS1fEt
        2CBTssjQ7kfMah4V1kknbYIlPg==
X-Google-Smtp-Source: ABdhPJxHtrOggywCH1D3tFl4UkhhWN6SbJ40OrZovjcJtDH7dPrYNKzffiIFlKGTNoG2ZHvnzwPJzA==
X-Received: by 2002:a05:6512:3b28:b0:473:b9ec:187e with SMTP id f40-20020a0565123b2800b00473b9ec187emr6866220lfv.536.1652537445942;
        Sat, 14 May 2022 07:10:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x9-20020a05651c104900b0024f3d1daedasm845912ljm.98.2022.05.14.07.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 07:10:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 04/12] arm64: dts: qcom: sdm630: fix the qusb2phy ref clock
Date:   Sat, 14 May 2022 17:10:33 +0300
Message-Id: <20220514141041.3158521-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514141041.3158521-1-dmitry.baryshkov@linaro.org>
References: <20220514141041.3158521-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

According to the downstram DT file, the qusb2phy ref clock should be
GCC_RX0_USB2_CLKREF_CLK, not GCC_RX1_USB2_CLKREF_CLK.

Fixes: c65a4ed2ea8b ("arm64: dts: qcom: sdm630: Add USB configuration")
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index e8bb170e8b2f..5be0ec06ed86 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1262,7 +1262,7 @@ qusb2phy: phy@c012000 {
 			#phy-cells = <0>;
 
 			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-				<&gcc GCC_RX1_USB2_CLKREF_CLK>;
+				 <&gcc GCC_RX0_USB2_CLKREF_CLK>;
 			clock-names = "cfg_ahb", "ref";
 
 			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
-- 
2.35.1

