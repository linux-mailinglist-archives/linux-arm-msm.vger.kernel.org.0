Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A95093D54C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 10:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232762AbhGZHVF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 03:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232295AbhGZHVF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 03:21:05 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F878C061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 01:01:34 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id l4-20020a05600c1d04b02902506f89ad2dso1620218wms.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 01:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XVU7ml1tVdiZFg6w+28rjELN1plpC5pGFmNpVPCTBNY=;
        b=pDUI+baGvQhmx8t1mPXkz7Joiv/BQk/c7tVLlGPQgUBLWm8kIYc9t2fVXRPYOjKKdA
         ZMKekfpBtpH4b8wkyuMKxPQiqDqld1Il1anFrMAytJQrDFwiFQ3YW5bWp5BXxJjxQ+hQ
         MEs9OmTTU6YOCAijyRnyRD3SnQa7uPhQU3885bOu0CNREjcfclNxVosgEDZmgV7GzC4L
         MxbmxG/R6s90T6ZhP2Kb8Vx0BW9i9NBvgin3XT0BzsHwGD0pv66Akga/0PBNfrcVEqb1
         1NlhGK9ksrrYl4W5fNmaFwCfifjCeMDVa6NIQfUPrrxk9Mabfx0SEemj5ThIAZuxLAJ7
         jtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XVU7ml1tVdiZFg6w+28rjELN1plpC5pGFmNpVPCTBNY=;
        b=JSRjTKYvehi1l93v5s6b2myxyqpRuRGH49ptUZpdP/CPoIwypYueSsMbEmJp5v5hC4
         5qaWGb+8cJjusqOI7qHb/loS9jZ7BEzSGmghUuUlctu1TAH115aEGCuQtVhWqivxfv0w
         lOaLDNtNKUjNw+SNiAZiPqtzOnhNQczq6h/FMDwP2G33huqGSBfkfQ0j39Ku7jIDI0U5
         JPPG6M86TD4LihCevlpYtRoll5I/DaHSOSk2T08kHUdpNfn0dsJVWzloIRzzz4P34dOF
         PB2ZPx1uAC4qjwyYnZz8R0F460x0T4kEWk+/6y8LTySGopFFFzoe/26PMc10XFnH6J9q
         HuxQ==
X-Gm-Message-State: AOAM532zYsAPQ8YZev//HJ3/cQGiTPb94Sb6U1DzNC1NhSDNyCGBdHcZ
        7BFWLnVObhrO59QzkNxIdzmI1A==
X-Google-Smtp-Source: ABdhPJwGe95SjsyV3ok6otq8qcS4k4naip4HHCx6v+2rDaT3YGyB8YtSNy8gnaVxV/+LJT+S5oeLdA==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr15858978wmh.151.1627286492553;
        Mon, 26 Jul 2021 01:01:32 -0700 (PDT)
Received: from qcom-hackbox.linaro.org.net (163-172-5-244.rev.poneytelecom.eu. [163.172.5.244])
        by smtp.gmail.com with ESMTPSA id n8sm460600wrx.46.2021.07.26.01.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 01:01:32 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v1 1/4] media: camss: vfe: Don't read hardware version needlessly
Date:   Mon, 26 Jul 2021 10:01:10 +0200
Message-Id: <20210726080113.8378-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

vfe_set_power() is invoced a few times, which causes a lot of
VFE HW version prints.

Secondly there is no real reason for calling hw_version_read() from
this location specifically, since it does nothing more than print
the VFE HW version.

A better location for the hw_version_read() call would be somewhere
which is only executed once per VFE unit.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index e0f3a36f3f3f..f6e889c1598e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -713,8 +713,6 @@ static int vfe_set_power(struct v4l2_subdev *sd, int on)
 		ret = vfe_get(vfe);
 		if (ret < 0)
 			return ret;
-
-		vfe->ops->hw_version_read(vfe, vfe->camss->dev);
 	} else {
 		vfe_put(vfe);
 	}
@@ -1301,6 +1299,7 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		return -EINVAL;
 	}
 	vfe->ops->subdev_init(dev, vfe);
+	vfe->ops->hw_version_read(vfe, dev);
 
 	/* Memory */
 
-- 
2.29.2

