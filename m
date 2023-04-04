Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 768FC6D61D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 15:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234777AbjDDNIh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 09:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234768AbjDDNIg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 09:08:36 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DD410F2
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 06:08:35 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id q14so33755379ljm.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 06:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680613714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qlq2CcjX+64dAVi3fffS9Y0yWKzAzk7GtHyqF7vlWXk=;
        b=fKCCwitSRRxnTyCs7cpdRwFRQ2T/QGHzCYi3wn1vhRZOeyO8YFyGQeKo4dTjqKPXfO
         ss1eN0XFNOl1m7oQvqkW2Wvo9EbB+FTRqzay6uS/QosVMK+xBVaivQUCF8zY7C/i2Ue3
         S7UwX4SGCoSZvaySYeOLIqm6sxr2F1EXbn3CoOzp+MwFyAHObDutkp0H9HOexXWki424
         r+RzHL0kz2E21FLOGZThmg9bo9ji24JB9k4J2G4NpFaOBxrPb7pybUYfBhi5wI6rCc9Q
         5ZFLrUbQClakBBMPR+YXKwSepnGV3kXriI3jEZyMtxIS9STArpkWCRf6dz5cz2HTL/6j
         0Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680613714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qlq2CcjX+64dAVi3fffS9Y0yWKzAzk7GtHyqF7vlWXk=;
        b=kpIt4Jtd/ZbxcNdVAVCgffvEAnE8IGljqOjgbNsVb3LD76ioZeq7iS0di0n9+6ZaVy
         e2lqxBOXaLnx6kK/LFArduQr8uzd8oDICzV9fAnQXKOBlVG59WsB547XTXLCJCeavvv0
         Y9fs9QnEO4NmXQPaLIMdxVRhmQxZdBU6c2Cbx0eRAbZX8WGlkrmqjOlu7jYjW0nHvVA4
         91H+DDE0oHdW03F1m1T10Hon6Pdx+IWEo+vt2/4TCmnvIlSZLJa5D1cveG+leQseEd33
         gxKLYIBzjsTifm4SKpkQ/1QFqjEuaXpxOycLPLykyrJ5SXC3IWABYWy8b2EdbYsBaWxp
         bxeQ==
X-Gm-Message-State: AAQBX9cnG+IolQGiVccIehMO01Ga3y6W+KLApEeOGvATSZQIHMIMd5vA
        PabNxYciEaHEMJ8hEscgVHGaMg==
X-Google-Smtp-Source: AKy350ayL0RRNHo4rc1WzTq3/p1G+DcUwn+FLVGXrZOBvZkh/V/B6aweawTDIV8xQvh72HKvl9AxEw==
X-Received: by 2002:a2e:b0c5:0:b0:298:a7a7:47e with SMTP id g5-20020a2eb0c5000000b00298a7a7047emr987406ljl.19.1680613713797;
        Tue, 04 Apr 2023 06:08:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
        by smtp.gmail.com with ESMTPSA id c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 06:08:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 01/42] drm/msm/dpu: use CTL_SC7280_MASK for sm8450's ctl_0
Date:   Tue,  4 Apr 2023 16:05:41 +0300
Message-Id: <20230404130622.509628-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On sm8450 platform the CTL_0 doesn't differ from the rest of CTL blocks,
so switch it to CTL_SC7280_MASK too.

Some background: original commit 100d7ef6995d ("drm/msm/dpu: add support
for SM8450") had all (relevant at that time) bit spelled individually.
Then commit 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog"),
despite being a mismerge, correctly changed all other CTL entries to use
CTL_SC7280_MASK, except CTL_0.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6840b22a4159..83f8f83e2b29 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -975,7 +975,7 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x204,
-	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
-- 
2.39.2

