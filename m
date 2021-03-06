Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F10832FADE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 14:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbhCFNhU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Mar 2021 08:37:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbhCFNhE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Mar 2021 08:37:04 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58266C06174A;
        Sat,  6 Mar 2021 05:37:04 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id q2-20020a17090a2e02b02900bee668844dso643863pjd.3;
        Sat, 06 Mar 2021 05:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=lsCQCAQNCQuZMTW5LL9WzweLlGjeyMxQVHgG7fBsL1o=;
        b=nFsDYqlu3hvsMzwin6DRWtl6v0tWFYrc9nJxNuhQ5iTqQBILNm+rFpxCEtEoCmxeb7
         b4uaQFquEQPTqYTixUg2P5JsTWq4wySzYU3biIp2sWUyeypZbhUKFKLbIyHXm+CishDs
         0/QpkLjfkeSYcXLIlBWfaidI8Ke2r0Z0kn+rRkChLlh9InnElKSrY9nkpPfuneUbRUdx
         7dcsAqcnJl27Ct6nT3eMCYTXC+PEFBzoIH5oiboKFQgGcyFrHfv7m8glQcBvtO7d4IRS
         ZmmX1roTgcOZAEAi0h9ZC/uK4Xm0wmsNtdzsN8pAvCQj1Qr/QHR5fWiJY/+Qk7r7CxrK
         N1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lsCQCAQNCQuZMTW5LL9WzweLlGjeyMxQVHgG7fBsL1o=;
        b=UhVO9sRqWZDerVR0aBZu2RBHhhPXXubrrTJthdhnF5HktfEQoy5rU0eSOiBpfsVxyB
         5wm91tKp+UfJw7MeB9RAtpx2jLjyFw0nMOBmD6CvdZDtRyEUri+49I/p9GSWO3fsFlIA
         8AnPMdxjVEEL56Z1y4JQKj8z35Rq1FL/PCtZrjq285gpCrG5BxarJ2wj6DCAUURrvzHq
         qIxyYsHLrhaNCtTq+Jw+euvGn/e3Lm6drbMeiWNhC3+FGTs2NO+G7sZvYH9luLiiUsBO
         bo5fiayqidFlFh0coqd+eL3eZyeENphRSyZqYrbN/QNYpd2iBR8rC6dAiWvxyAzbEA1L
         CGbA==
X-Gm-Message-State: AOAM531q+SbCI02nqmUeyVay3/KgI9O9o+1UhL1Y0rY6KuEzzbJHq4Wo
        6zbyy/aJhqtjDrEVHo02GLM=
X-Google-Smtp-Source: ABdhPJxQVpxRn+xLx9O/fYjYHEtlI6MKsTvwtMVL469x1+hOq1I8GH0d2vH6RLd9IarUlmPCLJazoA==
X-Received: by 2002:a17:90a:c20a:: with SMTP id e10mr14798599pjt.221.1615037824035;
        Sat, 06 Mar 2021 05:37:04 -0800 (PST)
Received: from localhost.localdomain ([45.135.186.66])
        by smtp.gmail.com with ESMTPSA id e12sm5345659pjj.23.2021.03.06.05.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 05:37:03 -0800 (PST)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] rpmsg: qcom_glink_native: fix error return code of qcom_glink_rx_data()
Date:   Sat,  6 Mar 2021 05:36:24 -0800
Message-Id: <20210306133624.17237-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When idr_find() returns NULL to intent, no error return code of
qcom_glink_rx_data() is assigned.
To fix this bug, ret is assigned with -ENOENT in this case.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/rpmsg/qcom_glink_native.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 27a05167c18c..4840886532ff 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -857,6 +857,7 @@ static int qcom_glink_rx_data(struct qcom_glink *glink, size_t avail)
 			dev_err(glink->dev,
 				"no intent found for channel %s intent %d",
 				channel->name, liid);
+			ret = -ENOENT;
 			goto advance_rx;
 		}
 	}
-- 
2.17.1

