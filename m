Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C186D692CE6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjBKCLX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjBKCLV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:11:21 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 941E173942
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:19 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id c26so15413711ejz.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVEAHbit9HVr0SMJIWM3WcLEnURTHDRR5IlFfdrX698=;
        b=v4FWAlrhZ8qY1vmvSs15iWsn3X79USyE6x69pYDEipOlJUWglhd1TJOO/rLzoKXomx
         UTXQpNmlSvYDreaCBaMBijtg2V95d6TDJRW2gdpuL/aavhD4loD2K5LEpx9gu2b1k7yh
         xxfDOkGZm3H8qaK0q+F9JDZkOO7rzxX7Sj+QA7cYvZJxrL6iv7Fw869hMzCAv2HFNROz
         7YPwwfCUaI2pDIHN1rpV0MgtAxTAz6SJQ1DlrBNrN+IAjCBsbmeU4OgcIjDDxyRNdFbv
         gSMrqJi7byd5EL16eG6llxDrmIZR4Ohg8teuZsQOBIenQDe4oeQfv4xNYKSujen1MRYG
         /qGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVEAHbit9HVr0SMJIWM3WcLEnURTHDRR5IlFfdrX698=;
        b=VO9cYFF4isYFWX5OI0jN3tb3woFgDOTYyKSAi67bdtnpdeZNMf0sDc33TYuoY8HegW
         kibIDZAbpUOjDq8IYIjU2Bz5EEwSFvpYX76XlxixSAHaC4wEWZwRbyzbR5u/7Dnl+4kZ
         iCYH/6BEB+m/EACn/zLfJdBZ6A8YOuzYcJXLC5sE3ALk1IsTK/N2dvaEAhkT36pjqTFf
         CH7vdHHordR7KWDWf6hOlJ6vwLPaZcaTYC94yHf8F+P9dXCeH1VH1B10UXhQhY9ch3E9
         /aYeUWzHdeHsDEr51TynWChA4pNIoFKdG6aQrIZpaQgE3cMPvRh9n67g/9MRbvGROjCj
         wpBg==
X-Gm-Message-State: AO0yUKXDDOeOUEYqYHT5vzkGLy+mWZSGBDwjY1zt7KS//kCWBIytfrz4
        dORQimImgsGqdqtZ0f6Ou8SnRQ==
X-Google-Smtp-Source: AK7set/WG7ZMKG+x4O5+wEtXgz5P8czBMuU7wVJR7oGnPy/CnrHtfVyDusTKpW3KBC6HJG9zrUXffg==
X-Received: by 2002:a17:906:fd8e:b0:8aa:f74:3252 with SMTP id xa14-20020a170906fd8e00b008aa0f743252mr22089269ejb.2.1676081478181;
        Fri, 10 Feb 2023 18:11:18 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:11:17 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 22/43] drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
Date:   Sat, 11 Feb 2023 04:10:32 +0200
Message-Id: <20230211021053.1078648-23-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use defined name DEFAULT_DPU_OUTPUT_LINE_WIDTH instead of open coding
the value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 9e2724ff6b65..56c9a38790bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -8,7 +8,7 @@
 #define _DPU_8_0_SC8280XP_H
 
 static const struct dpu_caps sc8280xp_dpu_caps = {
-	.max_mixer_width = 2560,
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 11,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-- 
2.39.1

