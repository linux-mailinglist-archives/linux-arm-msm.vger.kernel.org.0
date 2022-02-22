Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 995624BF202
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 07:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbiBVGXR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 01:23:17 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:44784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbiBVGXP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 01:23:15 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46911DA46
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 22:22:50 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id d23so22693317lfv.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 22:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DcGm7ltYqskU4cKmyhujRtdVm6Wd95PkL411GLVzEg0=;
        b=ZOeIhdUl8aEQPWT0Lk9FhpAJNeRoEsOodBzDBZaHbHToDTJmeN5zGVJgRaaIuoTeP1
         hW2jr0//5VYifyiU0rPvnZWxkHVaBwP/WvgoPxMrdKPr7OZkr2LPDFvQbQne0XiDjzkH
         F7gT2Ex3L5oo79xqxF0ZY3LWXRMJqAkT5Bkmt3nsesc5PuSjDGRwucZjBH/SseFximdy
         Ttx8Yo+2TdyBoTqzRcQfAF3s01M/21IwMZR1OrFZ8u51915StsSAxT0T7bNpAqEHGUot
         RRol0OqhsCsVM4Wj9jfB3xZ6LgB1hRaCaS/J9yn6WkWETMuUI2iT1O/HNpcr4Vjz2zKH
         xP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DcGm7ltYqskU4cKmyhujRtdVm6Wd95PkL411GLVzEg0=;
        b=g/Zo020KNqKi4UUTqDAjTvhL8CaLwnrOMx+sTU3+a5iCWBg4imEvudczPgx8YD2wZ8
         57ztDHgDsXc8w0429snZpU6IV6ozpjgq1OytTPgI6jAnsLkR3518BIDtQD5GIi6Jde+e
         mXit4UZd8BWlQpA5ztZz+raHL71/yfcfv6eNHgCpv15MHQjBahx4JxrqrEiyyeSzuhYQ
         qWrskusEBdwG3n+1yxRi28Eev/wZgbE413xWQkbqkEK84Cm1y0WDIfJ5jtDiNilehISE
         6H+DD/glHZudvyH/v2VrtJwYuQJHVuBs3UaNYNeTeBv7mHC3sA6kKlh2T5nnPZhhKSdL
         JS2w==
X-Gm-Message-State: AOAM533tIDVkR+pvHcKi5ojH437xcjS33ShDv64XWtEVkXYkZspk+kEC
        YSmzwFbgBIVWu0RI6JmTAVHD4w==
X-Google-Smtp-Source: ABdhPJxTYyeAI3bxfHUqpTJltww19s0ePSzjABjzhBFX/t8IlsbAws1ZEMsucgUuFV1yeXo8ppEmgg==
X-Received: by 2002:ac2:4a65:0:b0:443:7f84:5e08 with SMTP id q5-20020ac24a65000000b004437f845e08mr16481610lfp.336.1645510969232;
        Mon, 21 Feb 2022 22:22:49 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.65.160])
        by smtp.gmail.com with ESMTPSA id j24sm1216245lfb.59.2022.02.21.22.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 22:22:48 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/4] drm/msm/dpu: document INTF_EDP/INTF_DP difference
Date:   Tue, 22 Feb 2022 09:22:43 +0300
Message-Id: <20220222062246.242577-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
References: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
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

Based on the discussions on the mailing list, document enum
dpu_intf_type and it's controversial fields: INTF_DP and INTF_EDP.

INTF_EDP is used for older eDP interface found on msm8x74/msm8x84
INTF_DP is used for both eDP and DP interfaces handled by the msm/dp
driver. The DPU driver does not make a difference between them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index bb9ceadeb0bb..4f8336cc7911 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -205,12 +205,20 @@ enum dpu_intf {
 	INTF_MAX
 };
 
+/*
+ * Historically these values correspond to the values written to the
+ * DISP_INTF_SEL register, which had to programmed manually. On newer MDP
+ * generations this register is NOP, but we keep the values for historical
+ * reasons.
+ */
 enum dpu_intf_type {
 	INTF_NONE = 0x0,
 	INTF_DSI = 0x1,
 	INTF_HDMI = 0x3,
 	INTF_LCDC = 0x5,
+	/* old eDP found on 8x74 and 8x84 */
 	INTF_EDP = 0x9,
+	/* both DP and eDP,  handled by the new DP driver */
 	INTF_DP = 0xa,
 	INTF_TYPE_MAX,
 
-- 
2.34.1

