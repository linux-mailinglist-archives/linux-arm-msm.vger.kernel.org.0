Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7173E5818B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 19:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239522AbiGZRlD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 13:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239528AbiGZRix (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 13:38:53 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FEB43247F
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 10:38:43 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id d65-20020a17090a6f4700b001f303a97b14so649530pjk.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 10:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=65z5UblURAWtS2HSo73KtitpLtnM0+IbS2Ko/ylefao=;
        b=JKQA2DZRhmMHgWDjn9IqsGd1TVfsl2/RxaGpJxPdD+c34DkWDAWNsu9qO/xRlhSFNz
         jTRpE4I/X989DPF2x2DVjb248ibAsnZJAf3O+WByNYpcxeOcUzjim7Qd2uty5uDE1x73
         d5LtxHUT2N3mk77hhhR51bamkKwqf1Z9L7fP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=65z5UblURAWtS2HSo73KtitpLtnM0+IbS2Ko/ylefao=;
        b=hrT/S8fL4Ud7z7Zqh8r2pmjqK0iz/uDTz2/NYfyxgSBWCcUzBApiiEuNrYhlrvh6EL
         byA8Zenu1deIFkULeO2aP30+r2iHLiRZIEcksGZqXdyd1DcQhLc4bflQRHuXDDR+oV74
         LrlZtPygKnfgI0h7c4aE3GjN0PbS0V+NTbTDkmu+CrRraRqvpsahhw7Mb16nXo79RbGm
         lXoKUxOKchUcbg/WylG0gPm57r9zVFWphjrsXBxuGTeZBInVHMuf0hHZN5QHr1kHGlVv
         wHXICJbEtoFPHdr/XWwOoiivMcQ89cxY8uwS4JexEW8OxVFh2bSLBPeaKQrniMcsa7FV
         YA/A==
X-Gm-Message-State: AJIora/x7Q65u6t1KV8oS3kebXzWA1LDff++8dpp1iZHq9peYUxbPTp1
        e5ZMOG01TBeuQFH8BMhesJOahA==
X-Google-Smtp-Source: AGRyM1vaj4AnRg3w38ziBsA+HO1alVRbJxT5BFBbzuR9W1nR9nbx4to4YrRPWTU9jI9OfC/TAk1BDg==
X-Received: by 2002:a17:902:f541:b0:16d:46f1:bd17 with SMTP id h1-20020a170902f54100b0016d46f1bd17mr18371237plf.18.1658857122699;
        Tue, 26 Jul 2022 10:38:42 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:8693:e9aa:75c0:5134])
        by smtp.gmail.com with ESMTPSA id ik29-20020a170902ab1d00b0016d9ecd71f4sm245884plb.77.2022.07.26.10.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 10:38:42 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mark Brown <broonie@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Archit Taneja <architt@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] drm/msm/dsi: Fix number of regulators for msm8996_dsi_cfg
Date:   Tue, 26 Jul 2022 10:38:18 -0700
Message-Id: <20220726103631.v2.1.I1056ee3f77f71287f333279efe4c85f88d403f65@changeid>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
In-Reply-To: <20220726173824.1166873-1-dianders@chromium.org>
References: <20220726173824.1166873-1-dianders@chromium.org>
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

3 regulators are specified listed but the number 2 is specified. Fix
it.

Fixes: 3a3ff88a0fc1 ("drm/msm/dsi: Add 8x96 info in dsi_cfg")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("Fix number of regulators for msm8996_dsi_cfg") new for v2.

 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 2c23324a2296..02000a7b7a18 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -109,7 +109,7 @@ static const char * const dsi_8996_bus_clk_names[] = {
 static const struct msm_dsi_config msm8996_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.reg_cfg = {
-		.num = 2,
+		.num = 3,
 		.regs = {
 			{"vdda", 18160, 1 },	/* 1.25 V */
 			{"vcca", 17000, 32 },	/* 0.925 V */
-- 
2.37.1.359.gd136c6c3e2-goog

