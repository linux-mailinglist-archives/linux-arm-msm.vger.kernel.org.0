Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE7C1AEB1A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2020 11:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgDRJLY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Apr 2020 05:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725950AbgDRJLX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Apr 2020 05:11:23 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADFFC061A0C
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2020 02:11:23 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id j3so4483564ljg.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2020 02:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=1+0lxBk92Z4FV+tuRf6x7090CWSvwjw8uGCZ8vNaets=;
        b=XFsyyjgUyNwmjpheTqxW9aYsSQYJ0lDOzuKTUzlVAn2MmCPhJDf4AYtrnJ5n8dLHEQ
         9SSh8T7G+R8Z7OIjaIVm3hDS/o1/b+2tE6Ae3uSkU4ARcNccdDvnK2YsELvKFu/CtRIE
         Z0EPEbA1ZLdARCMDttcWceZMjCTreljTP02DMeUfoy3TFq55oSiT+5KkUGvuN17FmajN
         Z5PI/PH6HrURbRxJ5u7UNS54wM+fIbG9r4lmRekbviiN0m5O+LyIyWsUmmGev+6rf8g7
         9GYKz6YDH1wFHcVEimSZ7fyXizRVTMwaq2OqsiNK91LBcYzizguXPsKmwhM/XemtYWgM
         vTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1+0lxBk92Z4FV+tuRf6x7090CWSvwjw8uGCZ8vNaets=;
        b=Vs+UlKdsZs/HBE3mmXX3OxS2ftqciOaUkk4muJtfsy4/ogDFKFYgz2711F7v1SqH8V
         F8n/MnysCjZz47GHPZxlaiFvN4dfU/Iy9ha7pE/G66BDODRXsZJ5GqJpfz+5PURSCYnZ
         kATOHl3PN5UT+hv/hkI7xaWsyOPmeSInY0EiybVTcTGMjeMhz+onZ/9hwWuZxk0VTSVZ
         VNXuekX4nVua81j4bmrbocSUphIm+RcxY+BeZWtKerD3ay6+A90IXGTBYOt07JxQvokE
         hbQM89MXk2KF5U6XCteVdZFJ+NnzPIUxm5cXg3qtArq2ENfdDbIjkKaMJwf9oWI6yMI1
         NDCA==
X-Gm-Message-State: AGi0PubovAZdkuyMWwEqFXyNr1zQiTvGlt85XiDG2weZ8sNFKXXk5KFD
        fZI7ctyd4Uw+Lv3ljZym6DcZLA==
X-Google-Smtp-Source: APiQypK1l4oogJYB1BPqNzQ+g7PTmKPPdbmtyfUaVP+asaNbzm1SJrR5TaagxWdlGFz7rLKSu9ndtQ==
X-Received: by 2002:a2e:6a0e:: with SMTP id f14mr4577280ljc.102.1587201081939;
        Sat, 18 Apr 2020 02:11:21 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-142.ip.btc-net.bg. [212.5.158.142])
        by smtp.gmail.com with ESMTPSA id 25sm20114469lft.68.2020.04.18.02.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 02:11:21 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: venc,vdec: Return EBUSY on S_FMT while streaming
Date:   Sat, 18 Apr 2020 12:11:06 +0300
Message-Id: <20200418091106.28370-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

According to the v4l spec s_fmt must return EBUSY while the
particular queue is streaming. Add such check in encoder and
decoder s_fmt methods.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 8 ++++++++
 drivers/media/platform/qcom/venus/venc.c | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 527944c822b5..7c4c483d5438 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -276,6 +276,14 @@ static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	const struct venus_format *fmt;
 	struct v4l2_format format;
 	u32 pixfmt_out = 0, pixfmt_cap = 0;
+	struct vb2_queue *q;
+
+	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
+	if (!q)
+		return -EINVAL;
+
+	if (vb2_is_busy(q))
+		return -EBUSY;
 
 	orig_pixmp = *pixmp;
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 3d8431dc14c4..feed648550d1 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -357,6 +357,14 @@ static int venc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	const struct venus_format *fmt;
 	struct v4l2_format format;
 	u32 pixfmt_out = 0, pixfmt_cap = 0;
+	struct vb2_queue *q;
+
+	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
+	if (!q)
+		return -EINVAL;
+
+	if (vb2_is_busy(q))
+		return -EBUSY;
 
 	orig_pixmp = *pixmp;
 
-- 
2.17.1

