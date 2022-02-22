Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86EB24BF206
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 07:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbiBVGXS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 01:23:18 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:44980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbiBVGXS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 01:23:18 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21943F41
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 22:22:53 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id v28so10416249ljv.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 22:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I+FUp1ylyZlTVPkOMx/YuQtPRcxSfUwrG3pZ+XT0maY=;
        b=zQeIan6symQMv3r+UD42j3SgZ2JFsvBjw1DG0LvEciJ5Z1K+pGe3OqhD0A/kM8RYVr
         EdVQTW2GwHmSOVRFhctzRn4/akdowswU0dGitnRCv2+KjJ/Kbo1EbDsgdGcaTidcMrPK
         NMQd5N0H6iljAsJLwnPD1Hnx+MqL0smsxuXS1/0K8yO54U7dGJbs4IM/QR8rNW+a949P
         5juysvL4ZCh4uz9KCF8ViLBZp5tw2H3RCTmX7AxkuW0Hlab464jwlsIMW1P9a2SCwwX2
         7hfnwVCk3EsxjszAnWrSC2kvfIEBkS5AzWgPN04wP99IW3uRKYRzcqeb2KsIQLZS4ZL4
         72Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I+FUp1ylyZlTVPkOMx/YuQtPRcxSfUwrG3pZ+XT0maY=;
        b=qZHbZuKlMDFXK7F3Wh2IQ2aEQLf5mDGgHAXD7Whm+n5vifEyK4L0n148tdmtK0wik0
         qrLmXFB1JvOhCpFd8NdIlNiXPPUf6q89oNavzG9kCzst6eCcIs3u2CkAm44BRkgqm9RA
         KNn7KhfwhR792o9zDyTrJqyDwbuK8ORB9lTRqI8TtowG+Sfu7fPOGRfwyuoMHo1g7k1c
         npJODGe4LGYUSoqBJXKPNW4hZv4zlFequpb2pIato6gg2r0Xui4RbYOffRrnnTCrvOfK
         BxgllmNrTAFzXJk5OOo+I3M2aEhWsAIZG027HSrxCTfexX8ioRkz7QBzjR4V3j8y/MQh
         VMKg==
X-Gm-Message-State: AOAM532PRT1a9vd2x44sIvaba85uy4myGE+v9zuKq2GM/oOSvUP1EwOX
        R/oTwGpGdMXMsB2S5MJJEJGfnA==
X-Google-Smtp-Source: ABdhPJzJoRJqP/Yv4E6j+hUnelgIm577kvPPgf8vanDn4VQyGhibwSQ0Ee1CugqNUKC1i8A1ZDN56g==
X-Received: by 2002:a2e:9cd5:0:b0:246:3ec0:7505 with SMTP id g21-20020a2e9cd5000000b002463ec07505mr6092017ljj.434.1645510971535;
        Mon, 21 Feb 2022 22:22:51 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.65.160])
        by smtp.gmail.com with ESMTPSA id j24sm1216245lfb.59.2022.02.21.22.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 22:22:51 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 3/4] drm/msm/dpu: drop obsolete INTF_EDP comment
Date:   Tue, 22 Feb 2022 09:22:45 +0300
Message-Id: <20220222062246.242577-4-dmitry.baryshkov@linaro.org>
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

DPU driver never supported INTF_EDP, so let's drop the obsolete comment.
If at some point 8x74/8x84's INTF_EDP is ported to DPU driver,
corresponding handling will have to be ported too. Until that time, the
comment serves no purpose.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index f49f42e70b29..478a608ba7f2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -91,17 +91,6 @@ static void drm_mode_to_intf_timing_params(
 		timing->vsync_polarity = 0;
 	}
 
-	/*
-	 * For edp only:
-	 * DISPLAY_V_START = (VBP * HCYCLE) + HBP
-	 * DISPLAY_V_END = (VBP + VACTIVE) * HCYCLE - 1 - HFP
-	 */
-	/*
-	 * if (vid_enc->hw->cap->type == INTF_EDP) {
-	 * display_v_start += mode->htotal - mode->hsync_start;
-	 * display_v_end -= mode->hsync_start - mode->hdisplay;
-	 * }
-	 */
 	/* for DP/EDP, Shift timings to align it to bottom right */
 	if ((phys_enc->hw_intf->cap->type == INTF_DP) ||
 		(phys_enc->hw_intf->cap->type == INTF_EDP)) {
-- 
2.34.1

