Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACE1B4C83CE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 07:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbiCAGPu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 01:15:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232478AbiCAGPr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 01:15:47 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A1866225
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 22:15:07 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id u20so25178584lff.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 22:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6RLfZGC4qIzNmsIu/nbD4PYk3OJDU9cWPVg9j6D4exA=;
        b=TZUKP/z+DZaqdoXIUhHUgkXmoQyMcxFqKml/L/hLBsSDs3oG0+AGBi2lblgnxC0cKv
         ohlHD5KuRY2h4D0+c2omnjQmAr6PWikEDaLwIWz5ncusetZBwFM7aRDWutwKRwjdGTnF
         9wtwWJdOxCjhPYT0S73kiJ/+7mlCRsNj1iM24iq14cqMBrM3qeCk/Q5uo1ixZICnq/5o
         SOx6WFjaoFEtVvF9JwxzvqttmiBGRAeiOQcjWPMYtV6Bxb4423vPySLVXwGI77zX/QF1
         4pdvjNWbflHFRLxeGz9Cr0XsRMIF+yxzXDXU3bv7/s7/P1nTIwEJis2QX1lbGDRL3IfA
         ukog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6RLfZGC4qIzNmsIu/nbD4PYk3OJDU9cWPVg9j6D4exA=;
        b=1uofj5/W6YcTCswzH8Qd1JHLxe3OySYmgc/nQsG07ZSKA2vjUGuKPgM9t+N4lkwKyA
         OunWSAPSxiwxbTLyF5WX082BGc7qUsFvYj6+gJBGXBdvWOcPVgrKRli6ms82c//UEefN
         WebgyHEvH1aQd8wKQNFa/ketTkbRzeskvKfAtrSZZ7j1G9w8pvTzcj0KMerdPWH9TJEF
         PiY41CkklTbSyny3zZqcJ3kzmmEneFsIoiP42s2QGdv+9sp1F0koWKFC7i8kxM8rwx49
         e5QksZj2TKl28yXEuxkcHe80KlwSW+3UfM+0S10sCQgv2VJkSzVw75OUotjuNiyt1/7C
         76cA==
X-Gm-Message-State: AOAM530ESXNjEyuKPiRQURYPc3KAvXUMO/vOw+jp+5sNuNQ97ByntwpP
        qYYg3jNQ/A11/BOvepMY35qkhw==
X-Google-Smtp-Source: ABdhPJzDIxFdI/CzDLPhABRc36ZJjAs98+ZfLJ4iQdttDrwRGS2qf4grrP03Udqcn/Cx6AAepWWnEQ==
X-Received: by 2002:a05:6512:260a:b0:43d:909a:50cf with SMTP id bt10-20020a056512260a00b0043d909a50cfmr14085910lfb.195.1646115305916;
        Mon, 28 Feb 2022 22:15:05 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f15-20020ac25ccf000000b004442220c67fsm1318898lfq.27.2022.02.28.22.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 22:15:05 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 5/7] arm64: dts: qcom: sm8450-qrd: enable PCIe0 PHY device
Date:   Tue,  1 Mar 2022 09:14:58 +0300
Message-Id: <20220301061500.2110569-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301061500.2110569-1-dmitry.baryshkov@linaro.org>
References: <20220301061500.2110569-1-dmitry.baryshkov@linaro.org>
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

Enable PCIe0 PHY on the SM8450 QRD device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index 9526632d4029..7b6324969a4e 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -342,6 +342,12 @@ vreg_l6e_1p2: ldo6 {
 	};
 };
 
+&pcie0_phy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l5b_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.34.1

