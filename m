Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35DEA70B708
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 09:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbjEVHvP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 03:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231996AbjEVHux (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 03:50:53 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8F41BF6
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 00:49:08 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f6042d60b5so8451305e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 00:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684741686; x=1687333686;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7XMgaZJPGsrQVomCNqgAU3/ENZApSDLqMYm/e5VaXxw=;
        b=o1KZiUY0+94ILPWC9thOe+05sNJsT9m47nDU9niy/0e+Elik++Sfj78+DVBL89cSHw
         pw4lEj5H243X8aAV66ocyCPQNAYaUgr9QOYT+kLkLWdwbY6nWhoNBY26yB3ODLy4RA6J
         7HaK5wNYk0LPiIeKAoo913TUJO/NwBPRJ/JYKqZWPDdr5rM/YQ/bLo8HHP9BRwlnAy5R
         9bIiARG8Khqs/BCjGKx9oiNwBwegb4HHHLZeiCEZkkBhRyC8c9ek0znXbEUY4jgNyu6g
         kga1xHYITtKp7GVxEhCjlR4KFZAATp/jP5I+KiiX/ktmxA3QN1m6A+G5dMeEwEOL8+Nv
         9Itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684741686; x=1687333686;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7XMgaZJPGsrQVomCNqgAU3/ENZApSDLqMYm/e5VaXxw=;
        b=NPDzGA9l7T2tLvqM14OtF2J8OUrf0I+a+4LLq3utyiejMRzmr6XSb5J9SPqEkH4M6R
         V5F0I7djATJq+b1myHa+o4kdIaE5O1iT4q+yN8oWJ0GKu2jy5hBjqCR8LENOxRDhuTa3
         iSDPGqou0QyL95c5K/J9RAGxYtwIy3hLqhWd1IPnb0RQU5/BR7J5n1ZBOoL0RY323kVT
         aft+fIOx5LQ8FG2S0pUVgHcZVTJYeWqvyKwE7MfnAoD+TwBUGR4THJh4gy0ZlURxo+kA
         3k2JY4iQUOjPYGFq94R5CDsvgkczFaOgyuhM7D1naYRufijWkFeldZrxXv5nucsmdJlE
         Q/1g==
X-Gm-Message-State: AC+VfDzXslJ+Q/ai744RAgyFFpbR5XfHEhfIaHn8wgEPtZ1VYQaIWaW3
        jTxKZw++tO2qfLAml9+sCNu/4w==
X-Google-Smtp-Source: ACHHUZ45kpDtJdUknRe4eZfAOKeBPDqYXozusnHk6IjXHiCBaDluwN8/yjIW82K5hNfL27FxQcI/UQ==
X-Received: by 2002:a1c:7512:0:b0:3f1:789d:ad32 with SMTP id o18-20020a1c7512000000b003f1789dad32mr6942704wmc.11.1684741686242;
        Mon, 22 May 2023 00:48:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m13-20020a7bca4d000000b003f4dde07956sm10636763wml.42.2023.05.22.00.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:48:04 -0700 (PDT)
Date:   Mon, 22 May 2023 10:48:01 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeykumar Sankaran <jsanka@codeaurora.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Archit Taneja <architt@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: signedness bug in
 dpu_encoder_phys_cmd_tearcheck_config()
Message-ID: <897779a0-1a1f-4193-9dd3-bc4f87e73e3c@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "vsync_hz" variable is used to store negative error codes so it
needs to be signed for the error checking to work correctly.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 74470d068622..b29e6d1ba7f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -320,7 +320,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	struct dpu_hw_tear_check tc_cfg = { 0 };
 	struct drm_display_mode *mode;
 	bool tc_enable = true;
-	u32 vsync_hz;
+	int vsync_hz;
 	struct dpu_kms *dpu_kms;
 
 	if (!phys_enc->hw_pp) {
-- 
2.39.2

