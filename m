Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87DB87C4514
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 00:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbjJJWwe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 18:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234090AbjJJWwe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 18:52:34 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA1192
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 15:52:32 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50325ce89e9so8155893e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 15:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978351; x=1697583151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xH3JTlYLfu1lrgQDYNOeSk2pxNRl1vKQGAR++5/WjFk=;
        b=b+yaOhBRlgPLbhti2xRCxgMMzaF2tksXksIgfu7gnwNrKuluv4+PuiunBKJUkMaJsS
         in5X6bctIDAiEckRbol7E+dkAK9F94YFn8k2vCCShr53/LUiNrJLGHENM0rYxhZR7utZ
         WqP0E2PuunBkU1ctTkX8LfQNJTQQFaw8LEJZGUCCgO/tZRRmrS8YbGNlPEUda2bqRi5r
         TN3XOeLMoT6oLiSL9aC7dUAdXtxTddKWswSD5kq3Whb5VGIikIgzxcshNLKDkPNWy+16
         lPQchnUOo/sZxi0+Vi+N2mHsAdUnjqHVmwQeDEZANciIvT3Olw/gQbB3tJXLEKjsqI9Y
         G0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978351; x=1697583151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xH3JTlYLfu1lrgQDYNOeSk2pxNRl1vKQGAR++5/WjFk=;
        b=WL5WIdJZ447VTvOhldizD6goWkHq6md7LUQdAX+SW8DQ+H8ifiqmc3Wi17zlhibXYQ
         rDU74GS5GXyKQznXX940KANTpprhA8boh8uhoLT7onMwxvuKCkjkd6UuBUp17If8BWdd
         1v2G4CzDlWeMn7++Dum4LfDr4FJdONnuF5A8KRbCmA7y/1qo5Kfc3EER5lIulrqYW8cj
         zFOk1GELIHaFne30X0DnztLVasLhC3E7/6W2lMXmX2Bd+drHmE7+LZ84yUwG+eVKJz5C
         pTO8exzrd5wLy7ofGc0x3xCicAqjsEvXbviFFwnYL803CEtvU7le/4DXOxLCtGqBAXwm
         D0HA==
X-Gm-Message-State: AOJu0Yw7oUct93FKlqDIupbIN6w1fYFgAXExbniBgQPtsJyXGHRvai1v
        bTFR67kvhu6hgdTHyK2NWjDB1g==
X-Google-Smtp-Source: AGHT+IHfk6VCKksN4Igx3bmkbaZopWpKwJo0WHSqUsFC/05mZuF8oO3Ub7CcEBTaWPPWuQrXUtGzRA==
X-Received: by 2002:a19:ca17:0:b0:500:9b7d:ee3c with SMTP id a23-20020a19ca17000000b005009b7dee3cmr14696545lfg.7.1696978350783;
        Tue, 10 Oct 2023 15:52:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a22-20020a19f816000000b00501ccebeaf6sm1974481lff.88.2023.10.10.15.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:52:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Simon Ser <contact@emersion.fr>
Subject: [PATCH] soc: qcom: pmic_glink: fix connector type to be DisplayPort
Date:   Wed, 11 Oct 2023 01:52:29 +0300
Message-Id: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As it was pointed out by Simon Ser, the DRM_MODE_CONNECTOR_USB connector
is reserved for the GUD devices. Other drivers (i915, amdgpu) use
DRM_MODE_CONNECTOR_DisplayPort even if the DP stream is handled by the
USB-C altmode. While we are still working on implementing the proper way
to let userspace know that the DP is wrapped into USB-C, change
connector type to be DRM_MODE_CONNECTOR_DisplayPort.

Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
Cc: Simon Ser <contact@emersion.fr>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 9569d999391d..6f8b2f7ae3cc 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -467,7 +467,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 		alt_port->bridge.funcs = &pmic_glink_altmode_bridge_funcs;
 		alt_port->bridge.of_node = to_of_node(fwnode);
 		alt_port->bridge.ops = DRM_BRIDGE_OP_HPD;
-		alt_port->bridge.type = DRM_MODE_CONNECTOR_USB;
+		alt_port->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 
 		ret = devm_drm_bridge_add(dev, &alt_port->bridge);
 		if (ret) {
-- 
2.39.2

