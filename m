Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE7B871F09B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 19:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232758AbjFARWs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 13:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232772AbjFARWq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 13:22:46 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80AF7F2
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 10:22:44 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f4f89f71b8so1485921e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 10:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685640163; x=1688232163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MtIaxJ4PUhcGBAFctjRDDdgRFYtSIe62a5qWw/jOYE=;
        b=GZoEGlBN5DrqgLVsmpL0o0uFDbYhy/UigoIZSonUmzIiEK1RM2xofAW+kDazNzJXWN
         n+XAi56uMjjjj3bgA8HfgBnGP6dbLCPICaejH3NUWlZj9pdaETQDe6RABDFdKZq5tsHJ
         HZI1/8qgp32DfpjZxnB5ZCALeKjjEfSL9qBefk6L0Vdjys2cCNhdsPm5o0haHcthRmhZ
         6Ijcr93MZN7Ir7aluPOmyQJzSRNcP9/anVhROjB4f2AcbsqxHfeNtVEvlTTOYJmwRwSo
         VLYBogp9NuUMu+2XeTOTKB0mxTwdhXRiTGcBxFdzAT5Pxq1zgrzVzH2Dp2Skhj3TaSWA
         oM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685640163; x=1688232163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MtIaxJ4PUhcGBAFctjRDDdgRFYtSIe62a5qWw/jOYE=;
        b=Zjrd946huU9RisptKKDvTYgTzlVBAahboh/z6VeegpW7C4hnHqCVUj9f4H8nSgUABS
         CIxYDUVsN7uFg+bMETm/fDdHKvke7A0RzaAAEDXm6J2GaGDx0P0TRTEQtytrnfJjQxlf
         aApgjH+G6Ts8Ml/EMUtJ5UggrPJxqjPQu+wd//GgW97sbKe0SRAhkc5GrOkmrHSp7xFL
         AfleF6ncoKX0xbuI26/nHrhZjUlptuCdpQVy+OtqtUemzTCqCpQLHafWuUOG7Ovz/H8Z
         crGEj8Ms3k9IXkpibGhXmwGcBhCVUok9s/WKD8eukAz1llPP5hvIAB93j+b1kFkGi3Pe
         h5ug==
X-Gm-Message-State: AC+VfDznsLJpjeKAa8oinaGe3zNbXGq65uGbpRGa2WoAQYdePIA0jNa9
        11AcG9UvNs+9stqBUN1aK61VbQ==
X-Google-Smtp-Source: ACHHUZ61FEoT5l7OKH6D3WR4UkstEn3XUiIKpSlyIClFBUt+l4Rjci50qcW10WOuk+tDI1QaYI1CVQ==
X-Received: by 2002:ac2:5a1e:0:b0:4f1:2180:5683 with SMTP id q30-20020ac25a1e000000b004f121805683mr419466lfn.41.1685640162782;
        Thu, 01 Jun 2023 10:22:42 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b25-20020ac25e99000000b004eb2f35045bsm1145739lfq.269.2023.06.01.10.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 10:22:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 6/7] drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
Date:   Thu,  1 Jun 2023 20:22:35 +0300
Message-Id: <20230601172236.564445-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
References: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
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

There is no need to assign a result to temp varable just to return it
two lines below. Drop the temporary variable.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 2cc6b0cd2710..4f8c9187f76d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -756,15 +756,13 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
 	struct dpu_encoder_phys_cmd *cmd_enc = NULL;
-	int ret = 0;
 
 	DPU_DEBUG("intf\n");
 
 	cmd_enc = kzalloc(sizeof(*cmd_enc), GFP_KERNEL);
 	if (!cmd_enc) {
-		ret = -ENOMEM;
 		DPU_ERROR("failed to allocate\n");
-		return ERR_PTR(ret);
+		return ERR_PTR(-ENOMEM);
 	}
 	phys_enc = &cmd_enc->base;
 
-- 
2.39.2

