Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4A3B588469
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Aug 2022 00:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234593AbiHBWhy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 18:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235439AbiHBWhx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 18:37:53 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E521839F
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 15:37:52 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id p14-20020a17090a74ce00b001f4d04492faso178807pjl.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 15:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=RdEXt6lST7n+LoKcJt89muoRfgacXACJbMNMi2diRZw=;
        b=meEnV6SKRxCATViJTGiI8yRisfitA/Ifcie2bONs0hT2imac/Ft1IIspNYJbX9Mesy
         AnXseRu1Y2GlCbGVQG+OMnMhtPuxW/Hi9yVjBpMAsTPuykC0AcVBPE4NtgnN0tIoHnUE
         9nDDRaQpVrMjnff9i0Puon7FVq++R7V4cSP/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=RdEXt6lST7n+LoKcJt89muoRfgacXACJbMNMi2diRZw=;
        b=yUMulbeNwMFRfB/rBIfZlcCLkK7g2jWaidmI6Bc3J3QQnzIQqp9/MXyrapqi9LhiFL
         IQB3SvshyIBYmbwHcNAv8ecFHsTMuOIglnKkzCHtx5l/isKrHBuuc53xKmb+9xQbPodb
         g+VpWbwjEMtG1aB90rxXiC1o2+K0NsIgwvyRfALx7M2FtIIgmwDY9Z1v63NRoqTX+o0i
         a/PNUGsyE91iWSghg2rdVixlq3hvuddVXpZdh7uMuy+aeXXmSbuN43mDOx/SO/3NB1NW
         bCnO58LtmL6efEP4iksYL7rs2HxbB+uIvuIgY/OAILMU/e9eXgli5ptRi6uIU9HPOAw+
         LByw==
X-Gm-Message-State: ACgBeo3/qguVBgklXc8EAUbzuVAE1KfM9sLXl8L4nJgpknAkeBSlxUqz
        7iJNnDn0z6ERegSFF5ke/ZNFCA==
X-Google-Smtp-Source: AA6agR6kwuvP8bBPDHcReSHv/U+3Fz0f7n7zbRA+IblQ1fr4TmASpT5VeILMORInZ9BsNAd5WoxSOQ==
X-Received: by 2002:a17:90b:1e08:b0:1f5:1f0d:3736 with SMTP id pg8-20020a17090b1e0800b001f51f0d3736mr1776097pjb.58.1659479871969;
        Tue, 02 Aug 2022 15:37:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:31c9:9937:c6bb:62f5])
        by smtp.gmail.com with ESMTPSA id x185-20020a6263c2000000b00528c066678csm11353030pfb.72.2022.08.02.15.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 15:37:51 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] drm/msm/dsi: Fix number of regulators for SDM660
Date:   Tue,  2 Aug 2022 15:37:34 -0700
Message-Id: <20220802153434.v3.2.I94b3c3e412b7c208061349f05659e126483171b1@changeid>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
In-Reply-To: <20220802223738.898592-1-dianders@chromium.org>
References: <20220802223738.898592-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

1 regulators is specified listed but the number 2 is specified. This
presumably means we try to get a regulator with no name. Fix it.

Fixes: 033f47f7f121 ("drm/msm/dsi: Add DSI configuration for SDM660")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- ("Fix number of regulators for SDM660") new for v2.

 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 02000a7b7a18..72c018e26f47 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -148,7 +148,7 @@ static const char * const dsi_sdm660_bus_clk_names[] = {
 static const struct msm_dsi_config sdm660_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.reg_cfg = {
-		.num = 2,
+		.num = 1,
 		.regs = {
 			{"vdda", 12560, 4 },	/* 1.2 V */
 		},
-- 
2.37.1.455.g008518b4e5-goog

