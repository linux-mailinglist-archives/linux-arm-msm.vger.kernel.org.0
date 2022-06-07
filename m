Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4F7C5426D3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 08:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378913AbiFHA7R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 20:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1574406AbiFGXZk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 19:25:40 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C37170F2A
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 14:35:45 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i29so13530620lfp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 14:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ggI96oh4nmAF7H/TKahQWu836yBK21tCOCTlg3vHU9s=;
        b=doRCuV5A0DI7BomjV0eVJ7z854H9CJSGK+oVS7Gb2uxhNdE3mf/sH2WURuCFXdizlA
         KA8aOi/S6SWKYeC6lOEsLTlJ2vL4B8eLJpeIkGlvCK8E381VCwQDsB+qN+eVpvTPTCSf
         rmGmPrDGWN3xE+njNDL/I4w1yIG44umNul1g7lxCaZFCOoUFfaXq+3DvHXKdXne1/K5A
         jr55sOGEbA9ar0Z3xJDctl+nxozg/iA7UxFcp40DUEjvzPW7p0q6sUPxfeSVnMTCIwD3
         gmpRU1jJOmKrnVc6YtWaQBIAun2Ntq7VQiTAtixX9P2xO39G1HgFmK9miVeYs7ozpoT6
         tB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ggI96oh4nmAF7H/TKahQWu836yBK21tCOCTlg3vHU9s=;
        b=7DAjgmF7cE4af+fBASpGC6TBhv3W/+M1RE+gQTjYhqGsm/yz6gNYYrRahFPQAfOcbh
         l5J54kEgV8VYqXs7nmGcT6lv1J4F9QQEyZnPKbkwIOgprCWv6aivOEO0maO9Zj8+bEgG
         riGFo9l3JWhnejvETiLp4E/uzSm/de28m5ub7aEookzh4ecTRADVdqFjbsvMYzmimj3o
         Uiwt041HmrnwwKq5ErFQ90BiXL5+mbed639UdgLPKKghrFfrknwsoyzRP5fPReN+W3cb
         O8h3VtPq8pvGoc6GzL/GSeFfnaEaSFG5dtMCA6/MjjUZpTCGNHbdoR9aElcH68YQecio
         3zMw==
X-Gm-Message-State: AOAM533STk6iK8ds1xUkixgHTBW+R/p6KKsv/bdb4ipWwBSw7EnQydkl
        D0rHuxBy1MjTUvmJVay4Ep0n1A==
X-Google-Smtp-Source: ABdhPJz1EszLbQUB9ohWH+LJawc4IJSKOyxgeyPazzlOBAh37VNSPWCi0pQAvLUG+1eIa+Dbj97ANw==
X-Received: by 2002:ac2:4c50:0:b0:479:4fac:dd8e with SMTP id o16-20020ac24c50000000b004794facdd8emr6556972lfk.678.1654637743812;
        Tue, 07 Jun 2022 14:35:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 4-20020a2e1644000000b0025552d57beasm2975060ljw.89.2022.06.07.14.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 14:35:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 01/30] phy: qcom-qmp: create copies of QMP PHY driver
Date:   Wed,  8 Jun 2022 00:35:32 +0300
Message-Id: <20220607213203.2819885-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607213203.2819885-1-dmitry.baryshkov@linaro.org>
References: 
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

In order to split and cleanup the single monstrous QMP PHY driver,
create blind copies of the current file. They will be used for:
- PCIe (and a separate msm8996 PCIe PHY driver)
- UFS
- USB
- Combo DP + USB

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org> # UFS, PCIe and USB on SC8180X
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-combo.c}     | 0
 .../phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-pcie-msm8996.c}  | 0
 drivers/phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-pcie.c}      | 0
 drivers/phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-ufs.c}       | 0
 drivers/phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-usb.c}       | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 copy drivers/phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-combo.c} (100%)
 copy drivers/phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-pcie-msm8996.c} (100%)
 copy drivers/phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-pcie.c} (100%)
 copy drivers/phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-ufs.c} (100%)
 copy drivers/phy/qualcomm/{phy-qcom-qmp.c => phy-qcom-qmp-usb.c} (100%)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
similarity index 100%
copy from drivers/phy/qualcomm/phy-qcom-qmp.c
copy to drivers/phy/qualcomm/phy-qcom-qmp-combo.c
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
similarity index 100%
copy from drivers/phy/qualcomm/phy-qcom-qmp.c
copy to drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
similarity index 100%
copy from drivers/phy/qualcomm/phy-qcom-qmp.c
copy to drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
similarity index 100%
copy from drivers/phy/qualcomm/phy-qcom-qmp.c
copy to drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
similarity index 100%
copy from drivers/phy/qualcomm/phy-qcom-qmp.c
copy to drivers/phy/qualcomm/phy-qcom-qmp-usb.c
-- 
2.35.1

