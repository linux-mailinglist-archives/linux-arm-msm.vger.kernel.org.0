Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6790B4F4BE6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 03:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1455157AbiDEXHB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 19:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443713AbiDEPkL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 11:40:11 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B210114FB8E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 06:58:18 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id a16-20020a17090a6d9000b001c7d6c1bb13so2722255pjk.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 06:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o7h/xULvdyEDh2cXrTeUDNp6mCbC3SZGRAjjX+CJOmc=;
        b=dX0TBgiFesGZPye+ce1FhcnwVtnDLeUGtAPAJXbw/QgVQ8VZTPFXJ5JUdy5/PWkCXT
         KZ/WEiTSd0AI2vEcTxCUGe3Z9yDE4v8BshFb0/gQEpSZiSysL7rKri+BqcstrvDUVzlz
         CfHonLoXFbyqRHwTdCRpIXmdCfo9p1/+ubusexSSGDoqnV5k+62M85RKjm4ibgQvc28F
         IWv0B2m60eJn8o3I6yKgeJFn1Bvyytg+yiEyWzI6xkwvplFHw/rHqQKG8n78L3p3qau9
         vJKrFLoVpav4beD21/hofdoax1BBoZ4xMihQfCdY6MUTfQaZaOLGsrnZmvUXEX0L5fTN
         tD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o7h/xULvdyEDh2cXrTeUDNp6mCbC3SZGRAjjX+CJOmc=;
        b=fKVUUWGNXjJFEZ9bnSctNlbBfK95YWgSVEgVZ8j4Illw09bIMir10grigusyW4CrAY
         LxL6RGd3G6ECyzhKqpIGJXjtk8KqO/eVYvYXb8ptmh4zytecCbZQwJ6onaFdr49SN/mF
         ds0vxyd1ATFDGtN0fLrBkpMpWnYrby1VwUd+jrJQHAD+/zjr2kEaMga7qkghmW2R+eNv
         2sV9IwOiMEOIZFYUS/nErk8McNfKaYuBQPcYh94Ge1Kj+TN+3UfkDFN5/FYNprBQbE0Z
         TfM5ax2/tNxqnufxIwZX3t4iG1UFvSvdMNsR7p3QpIeh1GIRgKaQN2RGc+S8GjwMtMyV
         lxEg==
X-Gm-Message-State: AOAM53043O04uMtVNk+ezXvwxPPByuINdik/W9/+UZM09jEdoDAGVW7K
        9LvJ8bjx9g0Y6mwNIL+A9+Y6
X-Google-Smtp-Source: ABdhPJwHDO18XPklWopbOJZUuwxh8xW73IX9pwkmyAAdLbfexOBpzjvC11TSQLRT14t90ZQHDwrrZA==
X-Received: by 2002:a17:90a:454a:b0:1ca:91c7:df66 with SMTP id r10-20020a17090a454a00b001ca91c7df66mr4265256pjm.186.1649167098090;
        Tue, 05 Apr 2022 06:58:18 -0700 (PDT)
Received: from localhost.localdomain ([59.92.98.98])
        by smtp.gmail.com with ESMTPSA id u14-20020a056a00124e00b004fab8f3245fsm16785402pfi.149.2022.04.05.06.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 06:58:17 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        elder@linaro.org, mhi@lists.linux.dev, quic_hemantk@quicinc.com,
        quic_bbhatt@quicinc.com, quic_jhugo@quicinc.com,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 03/18] bus: mhi: ep: Add support for creating and destroying MHI EP devices
Date:   Tue,  5 Apr 2022 19:27:39 +0530
Message-Id: <20220405135754.6622-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405135754.6622-1-manivannan.sadhasivam@linaro.org>
References: <20220405135754.6622-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds support for creating and destroying MHI endpoint devices.
The MHI endpoint devices binds to the MHI endpoint channels and are used
to transfer data between MHI host and endpoint device.

There is a single MHI EP device for each channel pair. The devices will be
created when the corresponding channels has been started by the host and
will be destroyed during MHI EP power down and reset.

Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 83 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index f7d5f75fc083..6c64745e8a06 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -68,6 +68,89 @@ static struct mhi_ep_device *mhi_ep_alloc_device(struct mhi_ep_cntrl *mhi_cntrl,
 	return mhi_dev;
 }
 
+/*
+ * MHI channels are always defined in pairs with UL as the even numbered
+ * channel and DL as odd numbered one. This function gets UL channel (primary)
+ * as the ch_id and always looks after the next entry in channel list for
+ * the corresponding DL channel (secondary).
+ */
+static int mhi_ep_create_device(struct mhi_ep_cntrl *mhi_cntrl, u32 ch_id)
+{
+	struct mhi_ep_chan *mhi_chan = &mhi_cntrl->mhi_chan[ch_id];
+	struct device *dev = mhi_cntrl->cntrl_dev;
+	struct mhi_ep_device *mhi_dev;
+	int ret;
+
+	/* Check if the channel name is same for both UL and DL */
+	if (strcmp(mhi_chan->name, mhi_chan[1].name)) {
+		dev_err(dev, "UL and DL channel names are not same: (%s) != (%s)\n",
+			mhi_chan->name, mhi_chan[1].name);
+		return -EINVAL;
+	}
+
+	mhi_dev = mhi_ep_alloc_device(mhi_cntrl, MHI_DEVICE_XFER);
+	if (IS_ERR(mhi_dev))
+		return PTR_ERR(mhi_dev);
+
+	/* Configure primary channel */
+	mhi_dev->ul_chan = mhi_chan;
+	get_device(&mhi_dev->dev);
+	mhi_chan->mhi_dev = mhi_dev;
+
+	/* Configure secondary channel as well */
+	mhi_chan++;
+	mhi_dev->dl_chan = mhi_chan;
+	get_device(&mhi_dev->dev);
+	mhi_chan->mhi_dev = mhi_dev;
+
+	/* Channel name is same for both UL and DL */
+	mhi_dev->name = mhi_chan->name;
+	dev_set_name(&mhi_dev->dev, "%s_%s",
+		     dev_name(&mhi_cntrl->mhi_dev->dev),
+		     mhi_dev->name);
+
+	ret = device_add(&mhi_dev->dev);
+	if (ret)
+		put_device(&mhi_dev->dev);
+
+	return ret;
+}
+
+static int mhi_ep_destroy_device(struct device *dev, void *data)
+{
+	struct mhi_ep_device *mhi_dev;
+	struct mhi_ep_cntrl *mhi_cntrl;
+	struct mhi_ep_chan *ul_chan, *dl_chan;
+
+	if (dev->bus != &mhi_ep_bus_type)
+		return 0;
+
+	mhi_dev = to_mhi_ep_device(dev);
+	mhi_cntrl = mhi_dev->mhi_cntrl;
+
+	/* Only destroy devices created for channels */
+	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
+		return 0;
+
+	ul_chan = mhi_dev->ul_chan;
+	dl_chan = mhi_dev->dl_chan;
+
+	if (ul_chan)
+		put_device(&ul_chan->mhi_dev->dev);
+
+	if (dl_chan)
+		put_device(&dl_chan->mhi_dev->dev);
+
+	dev_dbg(&mhi_cntrl->mhi_dev->dev, "Destroying device for chan:%s\n",
+		 mhi_dev->name);
+
+	/* Notify the client and remove the device from MHI bus */
+	device_del(dev);
+	put_device(dev);
+
+	return 0;
+}
+
 static int mhi_ep_chan_init(struct mhi_ep_cntrl *mhi_cntrl,
 			    const struct mhi_ep_cntrl_config *config)
 {
-- 
2.25.1

