Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA5C148ADE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jan 2022 13:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239933AbiAKMuO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jan 2022 07:50:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239921AbiAKMuM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jan 2022 07:50:12 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A50FC061757
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 04:50:12 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id c126-20020a1c9a84000000b00346f9ebee43so1738684wme.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 04:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dNqGcUsdmcRhL2qBo94c5F4kwjUDaPqQbHn1/VWcNsk=;
        b=d5zXphNT5LOWG9e+hJq+/JGoZZ59sE58qo6IL/EgqOy3rfSBLeGODBIPf/Jq0LEPDA
         k9rmy9yYeVcA6Rj2VpFo+gGtK/ffUV3tRPNoWnxNnpi+KwvZ6bevcna3w1+yf+9DIf/h
         40mt19aAYUc2DIwxAqzcLayOEbGYi1MxGkiump58a8JcSBcxqkkinlQ87SCwfHmUYl/z
         4Q0EOzcvosWXaT9tVWFwvE84eFf9tip/4C/CF0oe8QsKZ794wolvQRYIDhx6PDSLOK6X
         4sFIa3jKJOSwtbg3b0f7qGp98KFmqBTFH7rY61fto4XRjp0dMCX3zlGSgMo5p5AU71X0
         /0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dNqGcUsdmcRhL2qBo94c5F4kwjUDaPqQbHn1/VWcNsk=;
        b=yTaLrw9/Y+iWoNfYh5Q3THi/fjn3RomHCCB6/4mmQJ2ZLa9UVvKZ2L8FXSVLrvtl9M
         FuFkQOkne9sUdhhbO4VySpGCnVoeViPU4uPhZBsXocELvxtZNHHLcVK5V3QYY1yVpfJc
         ci9X99+LhwyWYUZTYJmhi2I89Fyp6v1GJ3jmtzyJPUm/gl462BxOYyliEyXnLXK7taja
         xoFVah/4M7JZ+4MLdh94VMuf1WFM+lJdxC4XK4iyQCCMcRfWKuHdAugpTE2TdLhGApcU
         jTIM+WtX4Glp5ytcxCKuyh3l74clhNFQXc3dNCtJSfWrZLU4gvZD86BhKibLQfd2UOMQ
         qdIw==
X-Gm-Message-State: AOAM532qlp9XUx/LlKvqq67c9cDOWqkFvNlA/v703AnmQGjtjKtCS8gL
        GZtbmyViOaUPi16A/Oixl2T435kEZ5emiA==
X-Google-Smtp-Source: ABdhPJzhFraG1OX3/MpomQO9humBNE4DNX/SuHyhktCdLAJWC2PN9+oDiamv+ZdcJAk/gc/zyBTQ+Q==
X-Received: by 2002:a05:600c:354c:: with SMTP id i12mr2361486wmq.139.1641905410781;
        Tue, 11 Jan 2022 04:50:10 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bg19sm1915252wmb.47.2022.01.11.04.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 04:50:10 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 7/8] media: camss: Point sdm845 at the correct vdda regulators
Date:   Tue, 11 Jan 2022 12:52:11 +0000
Message-Id: <20220111125212.2343184-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
References: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewing the RB3 schematic its clear that we have missed out on defining
one of the power-rails associated with the CSI PHY.

Other PHYs such as the UFS, PCIe and USB connect to these rails and define
each regulator individually.

This means if we were to switch off the other various PHYs which enable
these rails, the CAMSS would not appropriately power-on the CSI PHY.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index dcb37a739c95b..859b397912cc8 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -543,7 +543,7 @@ static const struct resources csiphy_res_845[] = {
 static const struct resources csid_res_845[] = {
 	/* CSID0 */
 	{
-		.regulators = { NULL },
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe0", "vfe0_src",
 				"vfe0_cphy_rx", "csi0",
@@ -563,7 +563,7 @@ static const struct resources csid_res_845[] = {
 
 	/* CSID1 */
 	{
-		.regulators = { NULL },
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe1", "vfe1_src",
 				"vfe1_cphy_rx", "csi1",
@@ -583,7 +583,7 @@ static const struct resources csid_res_845[] = {
 
 	/* CSID2 */
 	{
-		.regulators = { NULL },
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe_lite", "vfe_lite_src",
 				"vfe_lite_cphy_rx", "csi2",
-- 
2.33.0

