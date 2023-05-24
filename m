Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC9CA70EAE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 03:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234277AbjEXBhv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 21:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236502AbjEXBhv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 21:37:51 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1678A184
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 18:37:49 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-64d604cc0aaso195106b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 18:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684892268; x=1687484268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zCzvrQaL+ZK8VN+OcuUjeLDq59sA2AvqOzpryPavW3w=;
        b=MRTAIbQSVAmZzKFAGMU+rSDjFetQ6Q8oMvlfyKznyj8uiEE9HXTq7huwXaoUArQLIB
         nceN1wjym22ODNiT8IxPMqNxNUhFctm+rc0CKZ6Tluwx6RW+vFQgxfRIJfBGy8kzJ00S
         upI9V7rK2KvpYLnlDW9fPmbmZputwD43RhMt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684892268; x=1687484268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCzvrQaL+ZK8VN+OcuUjeLDq59sA2AvqOzpryPavW3w=;
        b=UXfGkvnc7+LOTvm2WSYq43IOcbWU2DTcdguV7wewdneMdX2n7ukfpwJNnJYbGeswcy
         MAY8dwD56RkLjYMSnQr0j9x9bCADkNe4ESNv6FrYXtvQupYmBKRCEH5fSXssBYmZw+yj
         cg/6EmWPmCu6aflRVhSHf7Nh7r8k7u2iyja4xyXkDKed3wcIx4cAPshd/HjOOgIeBTIw
         zkPIOSJC8NTYtb2toV1H4Jwjqyz3PQfbkLaJohnuN2lzpbmTJsNJg3Ubgdvb6snW/r1m
         g+p9HL0IeKm1SsMc+K9UTRJhaavEYetaT2omRAYd77zreYNXfQFvQYF9j1P/fqBtCQnk
         35NA==
X-Gm-Message-State: AC+VfDzUFdRlJ2vGW6F8YPBpiBctcRkGQsktTC8WvQ2qw06G1HHr1lRR
        /cbI9ni7YjXFqJ9vWh9/xuUoEJWFFRkPUX9kcJQ=
X-Google-Smtp-Source: ACHHUZ5htJ/9VW+/8ZIPtOotneIBtDOl+h9mtHjeqD5fcHt4Mb8XS+WkB5hJ/yCAB6DfqyXelyQ+Qg==
X-Received: by 2002:a05:6a00:1746:b0:64f:49ee:1a61 with SMTP id j6-20020a056a00174600b0064f49ee1a61mr1398469pfc.34.1684892268496;
        Tue, 23 May 2023 18:37:48 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:9a0f:9704:f5b2:168b])
        by smtp.gmail.com with ESMTPSA id c17-20020aa78811000000b0063f00898245sm6231619pfo.146.2023.05.23.18.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 18:37:47 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] media: venus: provide video device lock
Date:   Wed, 24 May 2023 10:36:57 +0900
Message-ID: <20230524013732.2503561-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Video device has to provide ->lock so that __video_do_ioctl()
can serialize IOCTL calls.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 1 +
 drivers/media/platform/qcom/venus/venc.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 51a53bf82bd3..90b359074c35 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1767,6 +1767,7 @@ static int vdec_probe(struct platform_device *pdev)
 	vdev->vfl_dir = VFL_DIR_M2M;
 	vdev->v4l2_dev = &core->v4l2_dev;
 	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+	vdev->lock = &core->lock;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret)
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 4666f42feea3..e6b63ff5bc0e 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1565,6 +1565,7 @@ static int venc_probe(struct platform_device *pdev)
 	vdev->vfl_dir = VFL_DIR_M2M;
 	vdev->v4l2_dev = &core->v4l2_dev;
 	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+	vdev->lock = &core->lock;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret)
-- 
2.40.1.698.g37aff9b760-goog

