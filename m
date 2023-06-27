Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8300473F062
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 03:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbjF0BYb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 21:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbjF0BYa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 21:24:30 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D6E2173B
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 18:24:28 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f9fdb0ef35so3439196e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 18:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687829066; x=1690421066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdqO6zGHqUFGOniEUyeh2n1gTGVptKCzsy8MWMxTm+8=;
        b=QnX2dCY+yUXuP4PeiAP0MBPYo9x30Ka3TgIhD5z06kTVFteD5A0G6E6NpZl1LYphbc
         +aBIjkNcTwAKxwd76Mjfs2KVpw3Xq4LQ+RHhS/yDI3DxUGF4C3GuhfBjRalVwnNXDbQ/
         OT8+p0A3I1qz+z9X2NlWPd5mUhORJScgQI23NMcI7Ux71L/ui209ELBLtvqbq18dIH9F
         EvZ4aMnSTIQGcUYf+HMzjxtyrrXemNPvRBcq0LWqbUQzV6Xe39Tp53JYLWYmmzdLTOaX
         bSh+C3857kKQKOZqIw+VKrHbzojWPTfMfU72KFfLmrdPe9gzJMql/+u00QEkiS7pmtCX
         MdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687829066; x=1690421066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdqO6zGHqUFGOniEUyeh2n1gTGVptKCzsy8MWMxTm+8=;
        b=gHNkiMM5afQL6i70HStzG7TxQgM1d0yF6BmwxtQ+huOYO8/t+D8v+p8DPo0Y8KB966
         XE2cc553ZXK5fv0NCqg7jzV8V5GpR/ub0VNCg08BYdMKgcit8r/5C/SRpe0ayK47FYXt
         W5RBZBimf2nPEszZ1p+lxKK1AiBb1DTRi+Jjczj5V9xXn/oAro2fTh2B3G0LmGxNhrVt
         nXIgVCkKH9h1XJcTpcSPoOmNmRE9A5sQKnoqhil86Bsf+NDTYhmhGw1eQXAqjmkcrV8r
         J3whselSL6vft4EQrfPo6j92TOodVPdHk0PoKB4rT1xfUcBri2JCqbfI/LaVaG4MUAA4
         vRHg==
X-Gm-Message-State: AC+VfDyDS0cfZw06xT4Og9Joc9SFHhqG67+9RqNjidsjHdOLyT1NIVR2
        WxwHW1hIVDE1G3tzkxHgW+SptA==
X-Google-Smtp-Source: ACHHUZ6VOFPHFx3ESwYouFDom3fhjuosJ1VsjjbDPt6xDkVZnRtajpb2RAfTmHzcofI6LkcfKU7LzA==
X-Received: by 2002:ac2:5f4c:0:b0:4fb:7666:3bbf with SMTP id 12-20020ac25f4c000000b004fb76663bbfmr2117980lfz.26.1687829066600;
        Mon, 26 Jun 2023 18:24:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z7-20020ac24187000000b004cc9042c9cfsm1331301lfh.158.2023.06.26.18.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 18:24:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 04/15] ARM: dts: qcom: apq8064-nexus7: move sdcc1 node to proper place
Date:   Tue, 27 Jun 2023 04:24:11 +0300
Message-Id: <20230627012422.206077-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
References: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move sdcc1 device node to follow the alphanumber sorting order.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index c57c27cd8a20..0e80a5a8e3c6 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -181,13 +181,6 @@ &mdp {
 	status = "okay";
 };
 
-/* eMMC */
-&sdcc1 {
-	vmmc-supply = <&pm8921_l5>;
-	vqmmc-supply = <&pm8921_s4>;
-	status = "okay";
-};
-
 &mdp_dsi1_out {
 	remote-endpoint = <&dsi0_in>;
 };
@@ -336,6 +329,13 @@ lvs7 {
 	};
 };
 
+/* eMMC */
+&sdcc1 {
+	vmmc-supply = <&pm8921_l5>;
+	vqmmc-supply = <&pm8921_s4>;
+	status = "okay";
+};
+
 &usb_hs1_phy {
 	v3p3-supply = <&pm8921_l3>;
 	v1p8-supply = <&pm8921_l4>;
-- 
2.39.2

