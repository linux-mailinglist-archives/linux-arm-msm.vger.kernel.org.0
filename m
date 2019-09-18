Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3F7FB68DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2019 19:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732127AbfIRRTZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 13:19:25 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40547 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732114AbfIRRTY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 13:19:24 -0400
Received: by mail-pg1-f196.google.com with SMTP id w10so215791pgj.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2019 10:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j0roT+o44pSB3MM7mlqj6crjaHtjbvUFCdPy0FOZOMU=;
        b=O4JEUjWNfJnoTHf3Kz89DjXTVO8W5+rzHM+ls2mRU28W2FV8b8nZpi6L4cqrkJ3F9M
         YNXjD36ZsIeuhFahMECAXywua8oqYrxpt1YatcxAwxFJK9o8yNXSuTbqI2vXKYbh9p6N
         m6cO55tIKUoEWfQv6zUtFnHHhSEaHEkcJ9GU5jj8LdOugJZpZqqSyw4shaBwj57pe2vE
         d4kyc4biEk89OMh2r0LCFn+HzKVVH0MLLffXz+uCuT8rhq7ATBdYujE5awZYqY1PKdfZ
         ZdaThZ6464sjkSOeHGmwdi2hbFJGRoV9AsQs0ByhiPZzcpKm6rrL7HIXmoiFAxGyDUqs
         bklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j0roT+o44pSB3MM7mlqj6crjaHtjbvUFCdPy0FOZOMU=;
        b=GMx6sVnCbs4uxWbJjzSciEbUhGZwjvSV4c3T6u++CpnEzDuolBcDaXydcChf+q6BnZ
         E/WNVoo6q1MMNN6O0hoHh/EGfoZiXFOHJfDo6PffmChdxKR14wJmhaWbJNMv54Yjjqy8
         ws26Sahds/K6kBp0vM28XEYd/1daDgBg6lcYF068Zb+Iha73aDq9Sr7qHAxY6vWjMvIf
         urX8APAstuBunvIRaHiWp6tMbx9KAQYM1EmvH2NzlVYM79p6gYOK+koyF6NyRcBwq1jt
         w+soCrSCVffYwD5C4V0zLcBwOMr5DIMMYIjtWSb/AtLMCu/8Ugfefe4pztTOmAwZgIQJ
         8qBA==
X-Gm-Message-State: APjAAAXFsdAkeDiYKpzwXET5noM5rU4wQyx4ARLaVqmUvgP/9o+ozwnL
        YspUHIyy6X5Umw46zOxqENPaEg==
X-Google-Smtp-Source: APXvYqwVomWFERAJsR0i2p38N1YgsQl9AebCgv0yamF8m+dfqfnKfuGtvgkfx1j4kW4Dvf22Wl7mrQ==
X-Received: by 2002:aa7:9216:: with SMTP id 22mr5574508pfo.214.1568827162439;
        Wed, 18 Sep 2019 10:19:22 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y4sm2614981pjn.19.2019.09.18.10.19.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 10:19:21 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 2/6] rpmsg: glink: Fix use after free in open_ack TIMEOUT case
Date:   Wed, 18 Sep 2019 10:19:12 -0700
Message-Id: <20190918171916.4039-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190918171916.4039-1-bjorn.andersson@linaro.org>
References: <20190918171916.4039-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Arun Kumar Neelakantam <aneela@codeaurora.org>

Extra channel reference put when remote sending OPEN_ACK after timeout
causes use-after-free while handling next remote CLOSE command.

Remove extra reference put in timeout case to avoid use-after-free.

Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_glink_native.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 9355ce26fd98..72ed671f5dcd 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1103,13 +1103,12 @@ static int qcom_glink_create_remote(struct qcom_glink *glink,
 close_link:
 	/*
 	 * Send a close request to "undo" our open-ack. The close-ack will
-	 * release the last reference.
+	 * release qcom_glink_send_open_req() reference and the last reference
+	 * will be relesed after receiving remote_close or transport unregister
+	 * by calling qcom_glink_native_remove().
 	 */
 	qcom_glink_send_close_req(glink, channel);
 
-	/* Release qcom_glink_send_open_req() reference */
-	kref_put(&channel->refcount, qcom_glink_channel_release);
-
 	return ret;
 }
 
-- 
2.18.0

