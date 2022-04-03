Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7BFC4F0C52
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Apr 2022 21:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234929AbiDCTlM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Apr 2022 15:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376345AbiDCTlK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Apr 2022 15:41:10 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360A425C6D
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Apr 2022 12:39:16 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id p10so13577250lfa.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Apr 2022 12:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7VM8CbThF6Gfm096iREz5PHHwbZVCkkG37DDfJjxp9Y=;
        b=Z8unI6Go29aAgORJ25vbR338yeGnLq2xyoSnTiWTNMSEqsNPevoigCjBJDa/u/NvMW
         q+xA8SIgqdhJq81bdsfgyY9WGl9v4u4KE2XUjzBY8pXoFOq585vIfGzLmVNNaNG0bts8
         oFy4bdL1EK4QGJTA8ofrlNUW6ZfpoxEILMGyeky2RWywETtBWJB+e1do/r1Pjy1JOcFp
         5GpIWTDuLgElRaioZ4rkt4wNyUjew1oSeC80dgGyYvshIzTomezHdvHqcT/GTDFSJ9GB
         FWgV+/9fBlVfreVlgurzGjskP4+uiqdW9UrKfbIG+5/CagRsq5Gnz2qPZuzmuN6YjJHl
         rbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7VM8CbThF6Gfm096iREz5PHHwbZVCkkG37DDfJjxp9Y=;
        b=hO8T+vn1T1ZVCs74c20RHh3LT606N2EIQEIwGI2l97Ah2zyuoxI9O3OgnyAbp2MV7Q
         3WZe/Egeyj44D3m86DSzy3Jdnqtm9Kzyjvha/o7XUvRAPIFZiziLG47Cfd92+C475Plp
         OplU7P/PD/zT3DMv6IY2Xwoj/kW0fx/wDEV01sDk3hmjMNxoxqlxmsvDCj9OTqxlr4Us
         wSvt9zRG/QMKfi+85QrjOXVveiwO6G8Er+T9JDlAXa1nIoLS75RRc1GfEolp2+erFLzs
         bqN7ZEuFujhEHDy6NeeeUtj2I9Hx+nMdBXjvR1sQseS25dL+wRHBUS8BgdGUsivL2UPz
         D0+Q==
X-Gm-Message-State: AOAM532sqJuRoM0v5ghopNzqJ2VnVgav12j5E6GwU3d3a+31fqzpFCV/
        KeJo1zqkTlg+PRbudYLBdfbUpg==
X-Google-Smtp-Source: ABdhPJzF9ne/fsGprG3xyDHdGBQprPEnRdvQWJA6/H7pOXY7Zj9IOsf024C3OUKVz9TAMQcGWKoWzw==
X-Received: by 2002:a05:6512:1685:b0:44a:36e5:aa23 with SMTP id bu5-20020a056512168500b0044a36e5aa23mr20148504lfb.403.1649014754490;
        Sun, 03 Apr 2022 12:39:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y37-20020a0565123f2500b0044a1e1c6b37sm900903lfa.53.2022.04.03.12.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 12:39:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 2/2] arm64: dts: qcom: apq8096-db820c: enable MSS node
Date:   Sun,  3 Apr 2022 22:39:11 +0300
Message-Id: <20220403193911.1393920-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403193911.1393920-1-dmitry.baryshkov@linaro.org>
References: <20220403193911.1393920-1-dmitry.baryshkov@linaro.org>
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

APQ8096 provides a 'modem' with reduced functionality, mainly targeting
location services. Enable corresponding device tree node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index f623db8451f1..56e54ce4d10e 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -258,6 +258,12 @@ &mmcc {
 	vdd-gfx-supply = <&vdd_gfx>;
 };
 
+&mss_pil {
+	status = "okay";
+	pll-supply = <&vreg_l12a_1p8>;
+	firmware-name = "qcom/apq8096/mba.mbn", "qcom/apq8096/modem.mbn";
+};
+
 &pm8994_resin {
 	status = "okay";
 	linux,code = <KEY_VOLUMEDOWN>;
-- 
2.35.1

