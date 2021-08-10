Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDCC43E5868
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 12:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239840AbhHJKeL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 06:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239837AbhHJKeL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 06:34:11 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 494D6C061799
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 03:33:49 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id n12so5628365edx.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 03:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2bWdJTFdBT7N/3z85xLhwFZMuV51xWxicxyG3tsUzjw=;
        b=mvRdNz7Vkqu05ilLJvoACACdnCvcJVMLUYbUPaNL+3cTjW8wY+HilTjVlloB12hcjI
         yNPsqL0wpi/DPfdBJaTRQSA/Z/OXF/3HRwgz8r2m8Bk2Az9xwlkYHEDEOww+autydtzl
         LaQpPjigXb1VmNTxp/aX1ZfywweB05/o0TdJVH4lo2KYT8V5avgSKQ+/cGixrLNxrokA
         pUyfrpxCKKQ/mY/grrCBvthFm7dIvkX6y4Zo0LezTqRRJxucIQTMIVB9UffGbkvKN36F
         S6myo1MSwbFKIbsjwYFH8e80i98Fnjs1LgefWogL3H735N+hAHCE0dcYyVyeUB7CN5eI
         5KZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2bWdJTFdBT7N/3z85xLhwFZMuV51xWxicxyG3tsUzjw=;
        b=iSMfeQLiT/OMd1oukrOdDjqjyzpbo36gDfBDKbsuW2Fp4WP58ESwoSH6Tm7dcHUQlZ
         9wr6qWJjcAdsGVf+67S/J4C1iqSjWls29SsZShpn5WgM7kznQP/+Jwjm3gAr1dAoLlcx
         9PYXdjLQSUe/127COrteruyC4aHqLw+2SomuKDIgJWo93VYIaZdx5hMMYGyRc/lelk5T
         JNqENSHAjK4a4cZJ1eVhqQo/ujNpLYcQgdW3xb5JeUfrpYmVCKFdQ1JxVtCvSH/0nYaQ
         vhuFGzjy+CBYPIpYIuR+RVwVCRvLxP1vkFxfLlJ2/2dN5WzHNeSCK9ZY/MZF7FpTL0fS
         cSWA==
X-Gm-Message-State: AOAM530sbwM3zLG0atYokoV3ySAOMpwGCOWYth0qr1MPfPbwN2jSoLSR
        6n2J/kkB4Zra+MxdZvNB+YbOWA==
X-Google-Smtp-Source: ABdhPJxiLVIU11HvVdNnI2iELiZO60AhTBUyY3vP00BKXYrVDzdn9NnZgBQmBGqb+uqTc39BQya0IQ==
X-Received: by 2002:a05:6402:4387:: with SMTP id o7mr4085082edc.204.1628591627769;
        Tue, 10 Aug 2021 03:33:47 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:6e3b:3620:e85a:7152])
        by smtp.gmail.com with ESMTPSA id e7sm9518357edk.3.2021.08.10.03.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 03:33:47 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v1] media: camss: vfe: Don't use vfe->base before it's assigned
Date:   Tue, 10 Aug 2021 12:33:36 +0200
Message-Id: <20210810103336.114077-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

vfe->ops->hw_version(vfe) being called before vfe->base has been assigned
is incorrect and causes crashes.

Fixes: b10b5334528a9 ("media: camss: vfe: Don't read hardware version needlessly")

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 6b2f33fc9be22..1c8d2f0f81207 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1299,7 +1299,6 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		return -EINVAL;
 	}
 	vfe->ops->subdev_init(dev, vfe);
-	vfe->ops->hw_version(vfe);
 
 	/* Memory */
 
@@ -1309,6 +1308,8 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		return PTR_ERR(vfe->base);
 	}
 
+	vfe->ops->hw_version(vfe);
+
 	/* Interrupt */
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_IRQ,
-- 
2.30.2

