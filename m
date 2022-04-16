Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61D11503449
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Apr 2022 07:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbiDPAjK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Apr 2022 20:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiDPAjK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Apr 2022 20:39:10 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56792AE43
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 17:36:35 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id q12so9063252pgj.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 17:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FSpeGI+AKCEsOeI+kpzi6mqwOR7Zmm4NjdrpPLaO+uk=;
        b=Xkeb/eK0YajPaB1EbwGsYvDPvezCBkZvGOWMof9W3sVXS+yjF/c/+BEHBuHJh0uiEc
         4mICmkMIxiVdXFcvEu/NVcApQsUh7LCOeMRx2Ranap89omih6ev1lFALLY2PJ7WNK4US
         Fzk9K20aHoTqVUzsmgX0711c5+pVhjiADrmuqH4Znq68D4fc/6KnxeYywreXPeUtYq1U
         oDhxcC5hcdbXGt/WiOUq997iXEIenMTo37VaOrlAqCGUu2uapa3MyTRDTN1ofnMA+//3
         XK8RJsxoftuui9aSBKyS8vCI2x6TcC0gCl4BorIr7kQsFaiu+Xs3YAopGdXBZxvpXY4W
         7JeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FSpeGI+AKCEsOeI+kpzi6mqwOR7Zmm4NjdrpPLaO+uk=;
        b=1ngDYYaaX3xWrCNOp24XbMdnNScYycQluc+P5L4vAldBcmcT+I3KaQhFvPNnR689vL
         OTBAbWV9fx9ImuX8v+Crbeu0+G1FH3IC5Ju12U7rsEEdQ1rUpWisi4DK8J10VYt0p2aL
         Q86w17UUnuL5IqXV7zIgI83MOiAp5kkYtuxuQiEf3u/O/7gt1oHZXwlxZ9xuHXS6fLx5
         OlptW16pI6GIx5vSKk29YjhS40jvokcov45tGPXy+TC/qAtKqmfwuruL1i5VWQ53gEzL
         IjosrrVNu4N2aol1vXPPCsA2qLZD1Cd1VMqDFpGdwYzNi82ShY+TFaQ4nrUEHfN/bti3
         ooiQ==
X-Gm-Message-State: AOAM5319w0RFdmj2bqNEnRFhJQbUDJ1HSUnGGMCSN37yjoyyeotg/tD/
        56Wb6umlY6y5sov3sArlIJQ=
X-Google-Smtp-Source: ABdhPJx0PBJyIcjSuMZcCKzSpC48ofRcK+Nd4E9AAl/1wQ1BLVEe4QrKJXsxg1zib5CJXZufx45ISA==
X-Received: by 2002:a05:6a00:856:b0:50a:431b:c298 with SMTP id q22-20020a056a00085600b0050a431bc298mr1521546pfk.75.1650069204901;
        Fri, 15 Apr 2022 17:33:24 -0700 (PDT)
Received: from olv-glaptop3.lan ([2601:647:4400:452:4301:d32e:a8ad:adbf])
        by smtp.gmail.com with ESMTPSA id oo17-20020a17090b1c9100b001bf0ccc59c2sm9900249pjb.16.2022.04.15.17.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 17:33:24 -0700 (PDT)
From:   Chia-I Wu <olvaffe@gmail.com>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH 1/3] drm/msm: remove explicit devfreq status reset
Date:   Fri, 15 Apr 2022 17:33:12 -0700
Message-Id: <20220416003314.59211-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It is redundant since commit 7c0ffcd40b16 ("drm/msm/gpu: Respect PM QoS
constraints") because dev_pm_qos_update_request triggers get_dev_status.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 12641616acd3..317a95d42922 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -224,7 +224,6 @@ void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
 void msm_devfreq_active(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
-	struct devfreq_dev_status status;
 	unsigned int idle_time;
 
 	if (!has_devfreq(gpu))
@@ -248,12 +247,6 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 
 	dev_pm_qos_update_request(&df->idle_freq,
 				  PM_QOS_MAX_FREQUENCY_DEFAULT_VALUE);
-
-	/*
-	 * Reset the polling interval so we aren't inconsistent
-	 * about freq vs busy/total cycles
-	 */
-	msm_devfreq_get_dev_status(&gpu->pdev->dev, &status);
 }
 
 
-- 
2.36.0.rc0.470.gd361397f0d-goog

