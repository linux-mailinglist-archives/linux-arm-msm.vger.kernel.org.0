Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5699F515240
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 19:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379666AbiD2RfR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 13:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379682AbiD2RfP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 13:35:15 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A29B1DA72
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 10:31:55 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bq30so15281666lfb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 10:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N0kkFtjr8AAODbzY6xXTEuPCKSjxOceWVMdgDTFE29s=;
        b=mgIC9mziFYsMyFAHOYErUONAUawV3Zg6+lF8pT/M6IY7fvSpudmNbt4xMfL1Vd2RZx
         GRbqYgrUPkpUb1qIgmFCl6xJfsXc+8QBV/bZoVyuCFU9lyvOvItgw59wlPOkLOyEx1eF
         NBBZ6U0kEq0EsOP1AclJls1dMXQKtiyFRh/C0aj18X2kqqSZfC5FI+dlQF6XC7Lnst0D
         GVthXsYt+FAc9t+OJroj/dn/jrsfrIz35QU/yHkVBuNOUt7r5YqIBqhYCUWp2leSjIGF
         AXZ0AZePI0Yg/9Yp6om1xQ5NmkFLw6YKQZQtDp/u5C92+dDSXqKCEwCSytQZPNLzqGNl
         2jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N0kkFtjr8AAODbzY6xXTEuPCKSjxOceWVMdgDTFE29s=;
        b=mjVaTULMUN/pZwpNoq7ad3jxHxi1s+/AlduwRxpkn0aUjJZo2FpLgYfFThw/x0z642
         IGJLlPVSeBaSJ0Pdj7yxt9NpnbdSEmBILmzpCBwSQ1B10y0TuVngBhaFXHSoNmOBp0yi
         ehz5WpCcnnEUyjeiztP1CmjPnFYrwXvqAYoNA1iCFXPGKUUYqeTRow5lbZXIzId3eH5K
         XWltASDQm+LcHf3G2wGSy6fG9tCF+4OV3SJ5HKAahnWWzr3l8+pQ+kiUkyE1JLQuzEx8
         tTNzf9lpE8HjWC+U/WUxK6VRlb2KsuU+BHds1eDGISFzVpETliDZVyepTXuiC7qfT2kW
         OEGw==
X-Gm-Message-State: AOAM530nfYR3NiHhnzx1wTDIsDVl2/t2v8wRwuozxVqNQpJHnCO5xZ5t
        bpVD37N2VNh36l944M4LDfOzibltPKJp7Q==
X-Google-Smtp-Source: ABdhPJw8gix5aeuUfeN7PkSk0yv5kUFc9OzEkRCT9VAiDCM3AZPANunBQCFwT38GwbnX95LzdG/twg==
X-Received: by 2002:a05:6512:3052:b0:472:7f8:f344 with SMTP id b18-20020a056512305200b0047207f8f344mr222161lfb.380.1651253513254;
        Fri, 29 Apr 2022 10:31:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h7-20020ac24d27000000b004720819b691sm284731lfk.130.2022.04.29.10.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 10:31:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add Dmitry as MSM DRM driver co-maintainer
Date:   Fri, 29 Apr 2022 20:31:51 +0300
Message-Id: <20220429173151.3645415-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For the past several releases I have been assisting Rob by writing,
collecting, testing and integrating patches for non-GPU and non-core
parts of MSM DRM driver, while Rob is more interested in improving the
GPU-related part. Let's note this in the MAINTAINERS file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61d9f114c37f..3d7c7d6b0346 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6255,6 +6255,7 @@ F:	drivers/gpu/drm/tiny/panel-mipi-dbi.c
 DRM DRIVER FOR MSM ADRENO GPU
 M:	Rob Clark <robdclark@gmail.com>
 M:	Sean Paul <sean@poorly.run>
+M:	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
-- 
2.35.1

