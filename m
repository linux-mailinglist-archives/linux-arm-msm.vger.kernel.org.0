Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C56C478922E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Aug 2023 01:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbjHYXBf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 19:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbjHYXBQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 19:01:16 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697631FD7
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 16:01:13 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bc8a2f71eeso11147945ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693004473; x=1693609273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IRTyWDBK1um2dub2uCRhljhMZPNFPjV3AO6WOp/mvBA=;
        b=jhsR+9LbG+Ou958P7E+9XQk3NWBxZyvL08H58dOJFMpUbywkYDZuTJiRYqvl6aRWuZ
         ZWu9s/VR8KOtt4TmPta7k9Ii0sbMJEWVEX92p3BZ5Q3axWxD0EJaGZ+Q2g5QflyiOCdz
         K6TFEGZnXS0pu/yaXvvYJN1OTOVbmRLoP1Lcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693004473; x=1693609273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRTyWDBK1um2dub2uCRhljhMZPNFPjV3AO6WOp/mvBA=;
        b=MSfhkhWRnDcSjM/yeIuSdm83UQ3DgO13+TkIiRH4bfEq730IX3uHMHm98hdedULtAl
         9KUHY7ZCjrwKPPfDloIsMLFDTkS4RYzNlc/WH9/Z+xs0fZmflsYPt1rmSgwuWCwHkNR5
         GT2DVIrVMACVMRYGu7OAeBjQVn39nmWb6gumTAxXoBXGJxh7I1bXAhqlkGd3j7owNNBM
         euLlXG0cSAD+HOdX7daKAD7r356cIJDc8liH/vQj0D4n3S22GOIxyzZZDg+5HOU2wg0h
         olK9zDA9eU2HFs6RRkpmiR6oZhcGf3nDSHkXdnz2wamEi+H6b4/gABYmYC48JttXAjPO
         1BWA==
X-Gm-Message-State: AOJu0YybYivuI7bg8pgjvR7Y3rys53u9M1XrHV7zuC1tPLy6om794nn+
        twl630Uh6N61IGULZikLzTecNA==
X-Google-Smtp-Source: AGHT+IFzWclzxaj4YjkShuNK7rHT+Q1ZnPtkApoHCwgpQ4ybP7Ay3vwlvDyjy6qd5fa/B4Eoo/zG4Q==
X-Received: by 2002:a17:903:32c6:b0:1c0:a8cb:b61d with SMTP id i6-20020a17090332c600b001c0a8cbb61dmr11484872plr.34.1693004472806;
        Fri, 25 Aug 2023 16:01:12 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:d711:d7a0:fa61:8f24])
        by smtp.gmail.com with ESMTPSA id z12-20020a1709027e8c00b001bf044dc1a6sm2330059pla.39.2023.08.25.16.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 16:01:12 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Subject: [PATCH] drm/msm/dp: Add newlines to debug printks
Date:   Fri, 25 Aug 2023 16:01:08 -0700
Message-ID: <20230825230109.2264345-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These debug printks are missing newlines, causing drm debug logs to be
hard to read. Add newlines so that the messages are on their own line.

Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_link.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 42427129acea..6375daaeb98e 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1090,7 +1090,7 @@ int dp_link_process_request(struct dp_link *dp_link)
 	} else if (dp_link_read_psr_error_status(link)) {
 		DRM_ERROR("PSR IRQ_HPD received\n");
 	} else if (dp_link_psr_capability_changed(link)) {
-		drm_dbg_dp(link->drm_dev, "PSR Capability changed");
+		drm_dbg_dp(link->drm_dev, "PSR Capability changed\n");
 	} else {
 		ret = dp_link_process_link_status_update(link);
 		if (!ret) {
@@ -1107,7 +1107,7 @@ int dp_link_process_request(struct dp_link *dp_link)
 		}
 	}
 
-	drm_dbg_dp(link->drm_dev, "sink request=%#x",
+	drm_dbg_dp(link->drm_dev, "sink request=%#x\n",
 				dp_link->sink_request);
 	return ret;
 }

base-commit: 706a741595047797872e669b3101429ab8d378ef
-- 
https://chromeos.dev

