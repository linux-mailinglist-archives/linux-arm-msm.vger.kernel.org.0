Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 558693F7B12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 19:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbhHYRCz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 13:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhHYRCz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 13:02:55 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58BE7C061757;
        Wed, 25 Aug 2021 10:02:09 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id j2so10294106pll.1;
        Wed, 25 Aug 2021 10:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=POcht6CHbp2CZIpdQFDWcjSRWs4gNTIoROE88NDtLaU=;
        b=PbWx+/kOtFrcOUy0RL0VEVKbZmZbUXoC1E/bC96WWgoYZQKUIOZ26aYqNUehNO5Cn9
         6jCvMJu33EwYDi5Oly5T+3GkiJzDEGCDnvJkhuZwyJpWjl2ahLt0bdKpMZKeZZUshQbc
         5BPAWZVN5uiLuJ4IJHMftYvZ2xHR14sJ73MtVJbR/+FIu0smKn+G8VHWv5DIU1Bg3DPj
         sCEaDLei0l9FdhD87Sch3e50tTzeaJOk0vIuHg8p3dU+W2Vknl/IADp4Oof74B1/LluM
         F/9Bj2YUUyfyFSND4BN85Ipbra5M3JcYWZizQrjiC8vug9hxvvAgoKLDnLrCDvfSIDBd
         l5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=POcht6CHbp2CZIpdQFDWcjSRWs4gNTIoROE88NDtLaU=;
        b=k6prtACs/vXXfAoiS3mw9l+kzOKypJZTSc+QvUukc51eZJUHI4k3sviemEEcNGSY/w
         IYLYQdrLf4Sn5rSzE54BOZkXuAIKLL9Tcw1K5oIINaz51G5ZCZQnoTgr/koj+DKyY0Lk
         +xwJ7h9o0fHhJ9u/kVMqExYX89kHbfTFglNM3rXVOMmxa+P/TOPSW83pFRL5gBAKNx47
         RHKbnAP3ZRVrkGZF+vygx93WvSDcDiyBpsNkg5k6KsqjCLZ2fg0K+DEmeDDgpQ2OvYq5
         uRT87CHfqlBJW+UpU7R3H68Xj0TRPC+SbBLvbzOtarzbw8Fl0d0S/FsptC0GfGvMiWRQ
         Z1YA==
X-Gm-Message-State: AOAM531i88GLuwJ+fBjk6/Ev1sjTCtaaEV4XKg2VVxm3WqeFtDsdxfAz
        LKk8A1GcLUz23+mBjxTwBTU=
X-Google-Smtp-Source: ABdhPJybDLgDLK5ufGR7DRr6c2T3zfE/EgKB6DQcUA9EzY6vl0ugv9n7m2YaNqJ4bY4wCvtHahtQCg==
X-Received: by 2002:a17:90b:1c8e:: with SMTP id oo14mr11709165pjb.108.1629910928271;
        Wed, 25 Aug 2021 10:02:08 -0700 (PDT)
Received: from skynet-linux.local ([106.201.63.141])
        by smtp.googlemail.com with ESMTPSA id y3sm529387pgc.67.2021.08.25.10.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 10:02:07 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     sireeshkodali1@gmail.com
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/4] soc: qcom: smd-rpm: Add compatible for MSM8953 SoC
Date:   Wed, 25 Aug 2021 22:31:51 +0530
Message-Id: <20210825170151.19698-1-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210825165251.18358-1-sireeshkodali1@gmail.com>
References: <20210825165251.18358-1-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add a compatible for MSM8953

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Signed-off-by: Adam Skladowski <a_skl39@protonmail.com>
Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
---
 drivers/soc/qcom/smd-rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index dfdd4f20f5fd..fb4896d7a9a7 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -236,6 +236,7 @@ static const struct of_device_id qcom_smd_rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-msm8226" },
 	{ .compatible = "qcom,rpm-msm8916" },
 	{ .compatible = "qcom,rpm-msm8936" },
+	{ .compatible = "qcom,rpm-msm8953" },
 	{ .compatible = "qcom,rpm-msm8974" },
 	{ .compatible = "qcom,rpm-msm8976" },
 	{ .compatible = "qcom,rpm-msm8994" },
-- 
2.33.0

