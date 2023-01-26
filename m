Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C96267C74A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 10:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236733AbjAZJ3Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 04:29:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236836AbjAZJ3P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 04:29:15 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 042F29EFB;
        Thu, 26 Jan 2023 01:29:15 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id m14so650332wrg.13;
        Thu, 26 Jan 2023 01:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2TMGf0x6Yj1FSsXabSbdX1Eb3jJ9xtPHTfrzgF7BXbM=;
        b=Z/LwmRDVP2Z01bmql6t+8rD5RN+E4ElNyGI+HN7i1RsXrokHBqZDly19xfnLfZuyK9
         WeHLimaxuQnpirzi6fsRffYTgPhfeXeVobZN4pxh8slmzePsLin85mhjgTEVnXMYb3eD
         d+7innz7fd+KKCCYqlxUId0YRmBbBA2wWvVT/4DwksnhpsiS0jw7etJ4akdgnyOyV3S/
         va+dnKtYWMYoZoqG3+bnW7Ke6FU1H7WwUzza3MwzVh5eP9ilmsnCZCu52v0/yeTr3yeB
         OQO3ilbuh4m5kUGai2/7I8kS7k3W/eo+E7fqQA0AgbfpOeTIZifPIKbBJyXLcXbVrwNM
         F2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2TMGf0x6Yj1FSsXabSbdX1Eb3jJ9xtPHTfrzgF7BXbM=;
        b=PKEVoQe+Ql1jJ1KBEsWyrqd5l55TALIkaY4S37D9LNpLmsmg/KzXmQy46JD+I72WuZ
         PcmKmoEKcHxXg6bCyZYhhMne9xwaWrlpWX2cfjw8NKmPysIBvLl8HZwgh64b132VQAtx
         Hhsk+lTUbbFZUsQiiGUaSYyh+1zcbK4wg0Tah1EqlVC7PhqT2EsVD8tJYcYDH1luG4QD
         IdZPFlMr3VxR9Bryd80kk0IgO1KKpJzgb+CS+UQSLQIp0KRvidlwJ2v3AazoxJohMqI8
         +Tt42I4WDzxEkfNPI99zVQ7WzgA87JrapwoDZSKEJVFgH0lkPlUsTRCUrwG5CkuY1coG
         6bdw==
X-Gm-Message-State: AO0yUKXM6jqph+ECLv6nCI2c14taSSiQYEIj2mBWuoSLoj75shieP98v
        r4rtdNW10HxIzyC2udUxY7ALUOBI7rJvCQ==
X-Google-Smtp-Source: AK7set8YapJdyyMzZYPyaW5m8mk0iBf7Sf+RNWhXX9zD2B3BOK4diZmPVtm63Vv6D3DY8DFjyPYg0Q==
X-Received: by 2002:a5d:6e05:0:b0:2bf:b92b:8a8a with SMTP id h5-20020a5d6e05000000b002bfb92b8a8amr4837241wrz.7.1674725353522;
        Thu, 26 Jan 2023 01:29:13 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t4-20020a05600001c400b002bdcce37d31sm873136wrx.99.2023.01.26.01.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 01:29:13 -0800 (PST)
Date:   Thu, 26 Jan 2023 12:29:10 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Alex Elder <elder@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] bus: mhi: ep: Fix off by one in  mhi_ep_process_cmd_ring()
Message-ID: <Y9JH5sudiZWvbODv@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The > comparison should be changed to >= to prevent an out of bounds
access into the mhi_cntrl->mhi_chan[] array.  The mhi_cntrl->mhi_chan[]
array is allocated in mhi_ep_chan_init() and has mhi_cntrl->max_chan
elements.

Fixes: 2527ad44ddb2 ("bus: mhi: ep: Check if the channel is supported by the controller")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/bus/mhi/ep/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index bcaaba97ef63..be2d56e7f392 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -125,7 +125,7 @@ static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_ele
 	ch_id = MHI_TRE_GET_CMD_CHID(el);
 
 	/* Check if the channel is supported by the controller */
-	if ((ch_id > mhi_cntrl->max_chan) || !mhi_cntrl->mhi_chan[ch_id].name) {
+	if ((ch_id >= mhi_cntrl->max_chan) || !mhi_cntrl->mhi_chan[ch_id].name) {
 		dev_err(dev, "Channel (%u) not supported!\n", ch_id);
 		return -ENODEV;
 	}
-- 
2.35.1

