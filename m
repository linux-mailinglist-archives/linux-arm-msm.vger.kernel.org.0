Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E855650A08B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 15:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbiDUNSR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 09:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbiDUNSO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 09:18:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5352A6394
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 06:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650546924;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=XJ+q4BlTQtZT3BUqYMUruPECm6TJtmAxu5VYqnXrhVE=;
        b=imFRFsHqsMJADd0OsMPidiHix4gRk4rp5tRMM8CM3q3YYaEHqAov0gNpeNOI5hqZW95xR3
        LCtUwfdbj3RAiviFeTgG8Jm3HNxDAnVNFFTr2MQnCYX1B0+K4b9MKGwdcMd/WhNdu9RsIh
        oDHV4Dd8RBGqMp5b0qfF5zYbrQhy0rk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-7Ji04Ht3OxKblFIzxZDVsA-1; Thu, 21 Apr 2022 09:15:21 -0400
X-MC-Unique: 7Ji04Ht3OxKblFIzxZDVsA-1
Received: by mail-qk1-f200.google.com with SMTP id bj2-20020a05620a190200b005084968bb24so3257685qkb.23
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 06:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XJ+q4BlTQtZT3BUqYMUruPECm6TJtmAxu5VYqnXrhVE=;
        b=FJVZHG/8tv4urAo4hVVNEhbQ/777xEWyqQZ3+ZJXl3nCSNDBmlTx7TphFioZSvW8yc
         O6LoEcz34nCxAGYPDIaUC39gxIeJMIQyXoMAKDPAbwZ/QvwI3nTaOACCQc4/La0Ymf/y
         gidB04WrYurBjqGep636OGPfscRM7lMPlhjo77/h4natbLVGpr6dcTl4JEYsZdLag1km
         2WmCkXaZq6JaKEaWJxYzdhToaJtNBs3wZj+TWGs+i5eThbm4Ma6wXlaUjvFdgTLpuil0
         F9+iN2EAG8dIh5LZaa+Ad2OZD1KYWIq1bGtZUi/P+OQucVv5p0PZDe94Ix9DFrbQmo12
         T3Ag==
X-Gm-Message-State: AOAM5323iM4vlXY5T8s86U3XVFEfVfdRDDPT1bR7A5F4vMRIAoVb0GPh
        yjocyOX+yPJtMEDxs5NVGFTbd2ZXSN59lC0TebTcq0YtMAFjaweHF/yo3iYNmy0sUCJ2aqE0cpu
        liSHFBodzwMXGWQ7PAnupW6LI0A==
X-Received: by 2002:a05:620a:4093:b0:69c:fda:3cf2 with SMTP id f19-20020a05620a409300b0069c0fda3cf2mr15404145qko.245.1650546920744;
        Thu, 21 Apr 2022 06:15:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1p460pSQsriY5we0lc7aVE2SA3Un1gDznPdW1XSStmWduRojaJ0UnG57Ylk7u7lLp/dyJdg==
X-Received: by 2002:a05:620a:4093:b0:69c:fda:3cf2 with SMTP id f19-20020a05620a409300b0069c0fda3cf2mr15404128qko.245.1650546920553;
        Thu, 21 Apr 2022 06:15:20 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id v3-20020a05622a014300b002e1dcd4cfa9sm3868302qtw.64.2022.04.21.06.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 06:15:19 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     robdclark@gmail.com, sean@poorly.run, quic_abhinavk@quicinc.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/msm: change msm_sched_ops from global to static
Date:   Thu, 21 Apr 2022 09:15:07 -0400
Message-Id: <20220421131507.1557667-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Smatch reports this issue
msm_ringbuffer.c:43:36: warning: symbol 'msm_sched_ops' was not declared. Should it be static?

msm_sched_ops is only used in msm_ringbuffer.c so change its
storage-class specifier to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/msm/msm_ringbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 367a6aaa3a20..66f4ec09ef67 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -40,7 +40,7 @@ static void msm_job_free(struct drm_sched_job *job)
 	msm_gem_submit_put(submit);
 }
 
-const struct drm_sched_backend_ops msm_sched_ops = {
+static const struct drm_sched_backend_ops msm_sched_ops = {
 	.run_job = msm_job_run,
 	.free_job = msm_job_free
 };
-- 
2.27.0

