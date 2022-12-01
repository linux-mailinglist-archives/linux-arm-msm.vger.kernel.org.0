Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C047163FBB2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 00:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbiLAXLE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 18:11:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231609AbiLAXKd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 18:10:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D34A9BF649
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 15:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669936140;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BtaH/R2U9H/FSCFeNcuszPREFemDGP9fQpdb/KT1ZL4=;
        b=iS9QIA0NoHrNEmxnkrx8RMEYZRasgwABiPvgRDiDN73fYYitKyOjm6DJKxF/3d9CxvjkTS
        MwR+C1qBhZf880BnPr9N7jssCD7MnrJQrKrZ2wxB7Lck3ZFKD3q/h5yJ6AkFC4MU4YFuD6
        +/9DHtFzKN0TDQstf7rzDPdBOno7S6A=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-R0o8K08OM3eC3a58MTVouw-1; Thu, 01 Dec 2022 18:08:59 -0500
X-MC-Unique: R0o8K08OM3eC3a58MTVouw-1
Received: by mail-oo1-f71.google.com with SMTP id x6-20020a4a2a46000000b0049ca27b1507so1020499oox.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 15:08:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtaH/R2U9H/FSCFeNcuszPREFemDGP9fQpdb/KT1ZL4=;
        b=EXoGCq90ZHezhFWj9TSVJPqDJKlLj6NaOYTn9myQKl7OlyDIWdbX9Sg6gq9LsH2Ver
         8rL/IhsvKqtTokkYOL+TDDeEs4qXkv7Yf9dqpBSsyRmnwrgpTHFQDj/+kMxAOxDob20b
         hIcMdnYkB/s6dbIjXFWbrcc09kwDcJGAxilYQ66Ur1c31KzQF2K90F+BFwfJVDjpNQFn
         IsXCgF9GgMKhMZMm6FtrfLKmeCbQaq/QopYkyvrXTohsxr5Xd6KfPF3rWGHcsr35Z3BA
         8GpYIAWPHQDcfGsquESQZ1ogEgxIfQE+TCnVrGyCImEGwOAt3XPchwXj6KAwEqBVoQqB
         BhXw==
X-Gm-Message-State: ANoB5pk2wPUtNOlLfCgAcRzvUQoxxv0xrU3DFa+hUh+U2L59VRnt77kP
        +HH6glf9j4aoyK96XbAZWNxQbmqcBaXZeWBf5OkGMMYlpOaNspvsMjEZqnNmle5M51lTybaWbgw
        ut14zkAMsphTy02wFvv1xdEEqmQ==
X-Received: by 2002:a9d:5e0f:0:b0:662:2458:3ef7 with SMTP id d15-20020a9d5e0f000000b0066224583ef7mr34467972oti.150.1669936138147;
        Thu, 01 Dec 2022 15:08:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4FWPZZankvHjzPShxqKODxxCGji+P/F1OE5U+lA5qQYWnteysMV+IlrH+/g7Gxh0abel9IMg==
X-Received: by 2002:a9d:5e0f:0:b0:662:2458:3ef7 with SMTP id d15-20020a9d5e0f000000b0066224583ef7mr34467958oti.150.1669936137925;
        Thu, 01 Dec 2022 15:08:57 -0800 (PST)
Received: from halaney-x13s.redhat.com ([2600:1700:1ff0:d0e0::41])
        by smtp.gmail.com with ESMTPSA id y22-20020a4ade16000000b0049fb2a96de4sm2320393oot.0.2022.12.01.15.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 15:08:57 -0800 (PST)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     andersson@kernel.org
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, jejb@linux.ibm.com,
        martin.petersen@oracle.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH 4/4] scsi: ufs: ufs-qcom: Use dev_err() where possible
Date:   Thu,  1 Dec 2022 17:08:10 -0600
Message-Id: <20221201230810.1019834-5-ahalaney@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201230810.1019834-1-ahalaney@redhat.com>
References: <20221201230810.1019834-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dev_err() statements are better to use than pr_err(), so switch to
those.

In a similar vein, the check on the dev_req_params pointer here is
not needed, the two places this function is called never pass in a
NULL pointer, so instead of using dev_err() there just remove it.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/ufs/host/ufs-qcom.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index b1fcff1fad0c..4350c44a6fc7 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -680,12 +680,6 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 	struct ufs_dev_params ufs_qcom_cap;
 	int ret = 0;
 
-	if (!dev_req_params) {
-		pr_err("%s: incoming dev_req_params is NULL\n", __func__);
-		ret = -EINVAL;
-		goto out;
-	}
-
 	switch (status) {
 	case PRE_CHANGE:
 		ufshcd_init_pwr_dev_param(&ufs_qcom_cap);
@@ -709,7 +703,7 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 					       dev_max_params,
 					       dev_req_params);
 		if (ret) {
-			pr_err("%s: failed to determine capabilities\n",
+			dev_err(hba->dev, "%s: failed to determine capabilities\n",
 					__func__);
 			goto out;
 		}
-- 
2.38.1

