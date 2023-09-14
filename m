Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 884C179F9D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Sep 2023 07:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbjINFH0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 01:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234685AbjINFHX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 01:07:23 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB16193
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 22:07:18 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2bceca8a41aso8254861fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 22:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694668037; x=1695272837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+ElypKjl4wELftF/izO87eGZQ97psAyEtB73ZqIcSw=;
        b=Qx2rInoKV3IRZGSQUxst0Dr+Fakr8rrLQApLX+KgIDwOUUp7txqM1J4lRu5gSKcVMe
         syqPhdi50Vy9x6KinC9hB+zTe5TPSE+6JK/jsQvIg3I7CWQqwzBGHTu1mYsIOOHY2zV/
         HNnPC4JDQ65EQro3YkqLURX+7h2JdpA3C/FzDHQTPIy/RE6+LVOkCD7co2xO7G/aw97r
         pxG4D/f1IlGZWGbK/ygR3xWuI1NiqIDxtarJ8YlODvYFd0qzOLNjmbT7jByOEBuboxwQ
         LH7u8TvSAquS1HLCZ4Y8wOW3ZQAKBmr15Wh5MuVm5GDHocp2Wv9ChZ38l7z0fYVQyTtx
         AOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694668037; x=1695272837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+ElypKjl4wELftF/izO87eGZQ97psAyEtB73ZqIcSw=;
        b=YdzKunB0UMEuMAAFvAoxHeTSwEW7zkz5rywUA0KwZRlb3msVM1U6K2h1BfI+qQOsw7
         xl7o4WNwLlQDSGHhDYDcsn+sA0TQqXLRwRYT/g9cMH3y0xjv4Q3fMLgh9K+hOXnZAmqi
         9y9vqzwu0JvwEBTUAOiXM4Yu0lNKU5yqrTDoYW9m2kQZbG9qjiLIiHYkkTPwq4dOL4IL
         lhAK1spZ3CRjaZUXBTmZhZo8hmMvGiGdqi1NyEGr3wbtoJwyZQgTFd4uhIdefEfWuqO7
         st2gvHh5SEVOs3KCrA3SsQKdl09ZAotXMNc9S0V47eaeglwn0kdDeQ3kjNsysGRQ5l9V
         C8uA==
X-Gm-Message-State: AOJu0Yz4lZwxnA8LNadJ+yOBOo7mjdxPu0VOT8lpC77rXxkBvapOww5T
        Dr37eHWi45ZiZ/qfDJcf3BCizw==
X-Google-Smtp-Source: AGHT+IEDvGPbRT0zik7IRli68fky9NvvKjzdqsnQ+BZwMjAN/mQsiDTBxTpnFEPlqykiPZEsZjgGjg==
X-Received: by 2002:a2e:9dc5:0:b0:2bc:b557:cee9 with SMTP id x5-20020a2e9dc5000000b002bcb557cee9mr4196700ljj.43.1694668036891;
        Wed, 13 Sep 2023 22:07:16 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 22:07:16 -0700 (PDT)
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
Subject: [PATCH v3 12/12] drm/msm/dpu: include SSPP allocation state into the dumped state
Date:   Thu, 14 Sep 2023 08:07:06 +0300
Message-Id: <20230914050706.1058620-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make dpu_rm_print_state() also output the SSPP allocation state.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 1b0166bc9bee..e7c142bebab1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -773,4 +773,12 @@ void dpu_rm_print_state(struct drm_printer *p,
 		else
 			drm_puts(p, " -,");
 	drm_puts(p, "\n");
+
+	drm_puts(p, "sspp:");
+	for (i = 0; i < ARRAY_SIZE(global_state->sspp_to_crtc_id); i++)
+		if (rm->hw_sspp[i])
+			drm_printf(p, " %d,", global_state->sspp_to_crtc_id[i]);
+		else
+			drm_puts(p, " -,");
+	drm_puts(p, "\n");
 }
-- 
2.39.2

