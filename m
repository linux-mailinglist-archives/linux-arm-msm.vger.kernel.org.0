Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20D756C746B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 01:18:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjCXASD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 20:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjCXASC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 20:18:02 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A83F7729F
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 17:18:01 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id g17so142316lfv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 17:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679617080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXZmNUbirnPFl8q9p2tBnc2aY6ycoSjw1TdsaS3/lsw=;
        b=T1Tt6r+SaTosUqz5z3VgNeXtDbscpAc74aJN2MHovVEQkKKSgkAYsTLdOeD0+MYWrx
         AmQwMb5LZ9mRoYLO9yNKgQXkDaGIyqef12DFJgBlIWos3U54eVgJrVsa/5AzzG9NM2tM
         y26h8nPKwY55v0kZIPo4gFJs70Lvq3eVqwnDmBFXyFJC3pPhCiD+mOcTaWy4NpJVXLmV
         KtbS3RnC75KtOmCxCy69r09he6vyAesZ+cLkAODzrWrRi9ry3bLLggq9P8MLcUru4ERj
         eB7avTB6wQzs8tekSABNd3aE1fOIibrWgOpH0Jb+TpsS3YplbCoSUDvziKEL3YYPjsSW
         Svyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679617080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YXZmNUbirnPFl8q9p2tBnc2aY6ycoSjw1TdsaS3/lsw=;
        b=kmjTBCKam01CQ+5xzqTD0gxZRePDQCVTFtfDGKsH6RA0j16wgrjGKw1N3+nfDWYFyh
         7ZtXuKLkSCDVedr8Evp+YNm99lS6323zuWKxYf/+cUBqor12L+uDAzznL6wZEn0BFVp0
         GAuG1cYlziqUEnCOYRytJVPj4gXlDt3sLaBmCW4Zbnx1nnqQ1Nm9+AVJwmMZMtOCtO00
         hqIvB0MzVAOlplaKvUTi+lxsp2z3e+F218XwZELth/ufqRN09rQTsHq1YGXM1AVGz3rs
         bsQ70hofxILWg0ia4Usy1B76iUWuJkH51fYeOMWLelxWt8/3Ot+wxUf03zRYK9p6tT3J
         Fwuw==
X-Gm-Message-State: AAQBX9dAbsC2fsCJj7dLG3yCL0kYrPzX5Sm6NydLiXIahgZ7ozIopAwU
        SiaiMUketi5KENv36YOUTapFBQ==
X-Google-Smtp-Source: AKy350YSxRS1teUyJh9xtRbHVhHJuHsZ9juqstlxDXX88PN1mDWISCguYaJ4FEcS5Udj8lLqkYUK5Q==
X-Received: by 2002:ac2:5318:0:b0:4ea:fa26:2378 with SMTP id c24-20020ac25318000000b004eafa262378mr176332lfh.23.1679617079950;
        Thu, 23 Mar 2023 17:17:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i17-20020ac25231000000b004eafa77e435sm569147lfl.146.2023.03.23.17.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 17:17:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 2/2] phy: qcom-qmp-pcie: sc8180x PCIe PHY has 2 lanes
Date:   Fri, 24 Mar 2023 03:17:52 +0300
Message-Id: <20230324001752.1768505-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324001752.1768505-1-dmitry.baryshkov@linaro.org>
References: <20230324001752.1768505-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All PCIe PHYs on sc8180x platform have 2 lanes, so change the number of
lanes to 2.

Fixes: 94a407cc17a4 ("phy: qcom-qmp: create copies of QMP PHY driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index d580f3d3e221..c95bf7ec2abe 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -2193,7 +2193,7 @@ static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
 };
 
 static const struct qmp_phy_cfg sc8180x_pciephy_cfg = {
-	.lanes			= 1,
+	.lanes			= 2,
 
 	.tbls = {
 		.serdes		= sc8180x_qmp_pcie_serdes_tbl,
-- 
2.30.2

