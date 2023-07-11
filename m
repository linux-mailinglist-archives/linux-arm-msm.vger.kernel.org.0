Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21B1774EDAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 14:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbjGKMJs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 08:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjGKMJl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 08:09:41 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF348172C
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:09:21 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fb960b7c9dso8943831e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689077360; x=1691669360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKy1B9p7DH6xQE/2oUDFVqP6OaI090XvdmNMy3z1j5Y=;
        b=RtIpyBb/OSHr2WGL9B+RJ/L8TN2ZmA2S6spFsZAL9YbtOiIERdFzXqyvXf+4uEV5v+
         PZ8zrI6DPFtgBe1evZV0nQIEbpiJ7xXaCbz6jI0nE62/IXR2o+SbUE2W9E9vd2zK/tTe
         INKPq8uqTZnCiIGw5hMr15J9sh7swgFrWS+TsmaHnL2JaR5n+9pFAHwXYvZ3abd1mnPN
         M2oepcBr0oKv+uiltOdyVryHAMmD9SFhMVzEaSiEfsMk8uHfI6GzlDYJmgDhv81XqiD8
         Ib7vSlgOlKc08Wj8sE0OkZdocfgUUlSE2DXcxEPipUn3BCdkcgNBkuPG9I182efQMR+z
         6SOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689077360; x=1691669360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKy1B9p7DH6xQE/2oUDFVqP6OaI090XvdmNMy3z1j5Y=;
        b=mCXtzU5MWwVlVvtaNNQ8ZFUuJV4A3pZfclxTYlZB3ZizZUOp8LKPw2W32ogNzBhrKo
         bdqhYi1akqKucLDintdZFkbFxFh4mVwUp222LceGTVpcbNjmBlhpUn8VjXewhfle8Nr9
         XvseZU5Me7jBEOBQKsX17XT/3vyUBvQKwCBQmJJLW2LzTvn0qMKcIncCaLMN9rPq5JBp
         nx8qyf8ooZkiOUe2krFEvTX6mRr0KBftHHmuIUxrLwOIguHg9Zsr7OPFed1czE6K/TOH
         FGgwqBLsNB3NodWVndnsA9pQ3iSNuY96FwPDB23RjlH6A6hmNL/c/gjgf6nWY4Sai3hX
         he8w==
X-Gm-Message-State: ABy/qLa7xFlPKL9kL2n3/NrqNFeJ2b6wu//eUbcRPFnheTpgOilhk7y5
        EWItdb1ONwpX0tsdoWD7n/hCZg==
X-Google-Smtp-Source: APBJJlFRqvEzXAlf+Yk09isQF+YTEbaDa58Zj0a//2UkQIgs1JYmeMcJaNPZydutci8AVSClG7njDg==
X-Received: by 2002:a05:6512:3682:b0:4f9:92c7:401d with SMTP id d2-20020a056512368200b004f992c7401dmr10787610lfs.30.1689077360107;
        Tue, 11 Jul 2023 05:09:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h22-20020ac25976000000b004fbbd818568sm291447lfp.137.2023.07.11.05.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 05:09:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 04/10] phy: qcom-qmp-combo: add qcom,sc7280-qmp-usb3-dp-phy compat entry
Date:   Tue, 11 Jul 2023 15:09:10 +0300
Message-Id: <20230711120916.4165894-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230711120916.4165894-1-dmitry.baryshkov@linaro.org>
References: <20230711120916.4165894-1-dmitry.baryshkov@linaro.org>
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

Add separate device entry for Combo USB+DP QMP PHY on sc7280 platform.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7558a8407b9d..530d171e456e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3515,6 +3515,10 @@ static const struct of_device_id qmp_combo_of_match_table[] = {
 		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
 		.data = &sc7180_usb3dpphy_cfg,
 	},
+	{
+		.compatible = "qcom,sc7280-qmp-usb3-dp-phy",
+		.data = &sm8250_usb3dpphy_cfg,
+	},
 	{
 		.compatible = "qcom,sc8180x-qmp-usb3-dp-phy",
 		.data = &sc8180x_usb3dpphy_cfg,
-- 
2.39.2

