Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A28F918F4A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 13:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbgCWMb2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 08:31:28 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39297 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727380AbgCWMb1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 08:31:27 -0400
Received: by mail-pg1-f196.google.com with SMTP id b22so7125020pgb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2020 05:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0WVYi5XJp4WaCaddQcy1HjEAG2je/Kk0d1P+LoVF1LU=;
        b=pOe+nKChsCyDxA3kKu+UWucseGJUAw5AqsBo7ljLGWVFFRYvte4WaO9LHFWE0Jg6oq
         bkTNuHlS3gKm4K6znOjFupC/LjpnV+C5RpZZcXDjI4cWKhdl5+gHpBHd9y11kEG1rH+v
         7vpghAnkih8eRYbO8cIvU2LvMJKEedxIzaa2CuOrrsDrjKQuq8RW4osafGvRKxl8Fb2N
         OOk/TF5UB2rG1Fkv60/+Iy3gFh5vQ201ZQ3Ejlqoy48orCYMTWCUC0Iyb+PV2jUceTDq
         12T7QH3YbFRn+A9B8Xw/7ktl8sU2ZwiDc/4c5ikpW/ACjbAMdCkfAXUgHxeI6meWMa0C
         iiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0WVYi5XJp4WaCaddQcy1HjEAG2je/Kk0d1P+LoVF1LU=;
        b=S2AKO0lHL1K/9d0Gpb9qbFYG1sznzjIh7lp/b9b/h1bxUuY/aF6mtBk7nPO1ZzdlSl
         1vCXvIZH9AYJyf/jLx+Xwmrqn6XNyCholiKaQFRpQOJR9fSfob6bbxOQ4IwxIzQStwYe
         VdB3e0aKr2JjNEW1wkbrn5ypi87LZdXq2CM06wgs535bQI6RlrRGjIDgzyubX68r7il7
         Z4zHyJQeDhyffh3k8P1NGuK/Ax0pUMf/C2g416X7vMMsLKzvJghvhSOKfJCEw3VzRbD/
         2Dpl9Zy8bbUY3hMo8aqAh+L68xlcXHMAPJ7u0S8HErBU2+d05ven5wYQ7zs75dXKn8/l
         HSDA==
X-Gm-Message-State: ANhLgQ3GTJ7w7bRlgNl2X5+WMmJZHt+h8bPRf9r40lQ3U62BSWPtxuZW
        2KVpS9Wl2+qxtWEmNNOkbfqu
X-Google-Smtp-Source: ADFU+vt3DTLu/I5B2gbgbMVEzZd8OJT3CGLsgKm677pDzpkf1N2Iny5qvULAmixEzxzWgEH+t3ThnA==
X-Received: by 2002:a63:a55d:: with SMTP id r29mr4326673pgu.248.1584966686708;
        Mon, 23 Mar 2020 05:31:26 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id 144sm3590131pgd.29.2020.03.23.05.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 05:31:25 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, davem@davemloft.net
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 4/7] bus: mhi: core: Drop the references to mhi_dev in mhi_destroy_device()
Date:   Mon, 23 Mar 2020 18:00:59 +0530
Message-Id: <20200323123102.13992-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323123102.13992-1-manivannan.sadhasivam@linaro.org>
References: <20200323123102.13992-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For some scenarios like controller suspend and resume, mhi_destroy_device()
will get called without mhi_unregister_controller(). In that case, the
references to the mhi_dev created for the channels will not be dropped
but the channels will be destroyed as per the spec. This will cause issue
during resume as the channels will not be created due to the fact that
mhi_dev is not NULL.

Hence, this change decrements the refcount for mhi_dev in
mhi_destroy_device() for concerned channels and also sets mhi_dev to NULL
in release_device().

Reported-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 12 ++++++++++++
 drivers/bus/mhi/core/main.c | 13 +++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index f6e3c16225a7..b38359c480ea 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1028,6 +1028,18 @@ static void mhi_release_device(struct device *dev)
 {
 	struct mhi_device *mhi_dev = to_mhi_device(dev);
 
+	/*
+	 * We need to set the mhi_chan->mhi_dev to NULL here since the MHI
+	 * devices for the channels will only get created if the mhi_dev
+	 * associated with it is NULL. This scenario will happen during the
+	 * controller suspend and resume.
+	 */
+	if (mhi_dev->ul_chan)
+		mhi_dev->ul_chan->mhi_dev = NULL;
+
+	if (mhi_dev->dl_chan)
+		mhi_dev->dl_chan->mhi_dev = NULL;
+
 	kfree(mhi_dev);
 }
 
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index fa1c9000fc6c..eb4256b81406 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -244,6 +244,19 @@ int mhi_destroy_device(struct device *dev, void *data)
 	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
 		return 0;
 
+	/*
+	 * For the suspend and resume case, this function will get called
+	 * without mhi_unregister_controller(). Hence, we need to drop the
+	 * references to mhi_dev created for ul and dl channels. We can
+	 * be sure that there will be no instances of mhi_dev left after
+	 * this.
+	 */
+	if (mhi_dev->ul_chan)
+		put_device(&mhi_dev->ul_chan->mhi_dev->dev);
+
+	if (mhi_dev->dl_chan)
+		put_device(&mhi_dev->dl_chan->mhi_dev->dev);
+
 	dev_dbg(&mhi_cntrl->mhi_dev->dev, "destroy device for chan:%s\n",
 		 mhi_dev->chan_name);
 
-- 
2.17.1

