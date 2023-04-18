Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9670E6E6CE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Apr 2023 21:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbjDRTWe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Apr 2023 15:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbjDRTWL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Apr 2023 15:22:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D79B8A60
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 12:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681845655;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=aai1WHo4fg1sxKcLX3kD4BGAw1PP+pR+m3nWfdfcZTU=;
        b=IMwuRS40DczLIM+KnKHkEzEMNf3N2WP7SWT89gE9LH4TkZ68SyB3Jf8nTXSfYhKWV/JlpG
        +DpwaJA2Iz5gp4qL7LJ/FNDwOCdgzmD+xBEAms4pVAxdwt10TwOOjwTp/8LzR0XFU8XLrb
        erSFX51A7rmNbw9DG5sRWuAoBPSiNTQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-e-hVYzC2Phis-JZsEIQejA-1; Tue, 18 Apr 2023 15:20:54 -0400
X-MC-Unique: e-hVYzC2Phis-JZsEIQejA-1
Received: by mail-qt1-f200.google.com with SMTP id s42-20020a05622a1aaa00b003e99419b127so11628286qtc.17
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 12:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681845654; x=1684437654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aai1WHo4fg1sxKcLX3kD4BGAw1PP+pR+m3nWfdfcZTU=;
        b=Ay2zE/46XxOGVBlJFa3fJBEib9nBkWIUQnEyxnl+R6zAWDlUermNO4Wask9tJMCxHR
         FJ6BMQROEz67gEUj0bopTJNlwKaqvSVZBLcdTKRdBVoypj8cKJTSGc1xkWno9isviRyP
         P5oKQKlReDzITut4fjtPfSRCzdsI32oiGs9oB/mAIEeSQFbWJqDW/1t2SdJj8VbN59vo
         3+PTIGKhkSouKfIRRjmS/FAUcQj1IuHDDQ0fOb03S1OlmnscNU+/Or8JtlDiENX5jT9j
         pEYFvdvRK7d5MoTpVTAA5UnXy4jJeFlUEsgnYQI0+d0ACvUjQj+MIDsTAvN5JJCGVQ5f
         bqqw==
X-Gm-Message-State: AAQBX9dvcugojsbB5sK+QwySSptudcTzjkPhkXXMn8gQD9uUL8JzS3r8
        5Z1X3ieFq4eHTK3p6GscnwSm99mO+cty0sNbc3ELQRH4TQFCO93wGVRZRMdJXE7bTHt7YDWVaKQ
        Bzxvq2UVQIppOksC8oZDh2csVuQ==
X-Received: by 2002:a05:6214:410:b0:56c:13cc:d21f with SMTP id z16-20020a056214041000b0056c13ccd21fmr25855302qvx.50.1681845654142;
        Tue, 18 Apr 2023 12:20:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZFUZ7JQR9xbohdXv2IbnkoRfbUviweblbnyFfC0N6wmvnsGUN3xBE3c2IZkXBZ0ZSdmAywfQ==
X-Received: by 2002:a05:6214:410:b0:56c:13cc:d21f with SMTP id z16-20020a056214041000b0056c13ccd21fmr25855272qvx.50.1681845653894;
        Tue, 18 Apr 2023 12:20:53 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 7-20020a370c07000000b0074df3f7e14esm1709609qkm.67.2023.04.18.12.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 12:20:53 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     quic_jhugo@quicinc.com, ogabbay@kernel.org, nathan@kernel.org,
        ndesaulniers@google.com, jacek.lawrynowicz@linux.intel.com,
        quic_carlv@quicinc.com, stanislaw.gruszka@linux.intel.com,
        quic_pkanojiy@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] accel/qaic: initialize ret variable to 0
Date:   Tue, 18 Apr 2023 15:20:46 -0400
Message-Id: <20230418192046.3235870-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

clang static analysis reports
drivers/accel/qaic/qaic_data.c:610:2: warning: Undefined or garbage
  value returned to caller [core.uninitialized.UndefReturn]
        return ret;
        ^~~~~~~~~~

The ret variable is only set some of the time but is always returned.
So initialize ret to 0.

Fixes: ff13be830333 ("accel/qaic: Add datapath")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/accel/qaic/qaic_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index c0a574cd1b35..b46a16fb3080 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -591,7 +591,7 @@ static int qaic_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
 	struct qaic_bo *bo = to_qaic_bo(obj);
 	unsigned long offset = 0;
 	struct scatterlist *sg;
-	int ret;
+	int ret = 0;
 
 	if (obj->import_attach)
 		return -EINVAL;
-- 
2.27.0

