Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE39A5BB06F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Sep 2022 17:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiIPPlp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Sep 2022 11:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiIPPlk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Sep 2022 11:41:40 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2182AF0C6
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 08:41:30 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id l14so50314519eja.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 08:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=no7tB6bV0ki3w63AwdNBLJM9I4TS3ao6JAtYcR5QLHI=;
        b=MkX1LmCiFNkymAw7/cm0E87wHSpBIjlKLh2pS+wk9Dx1VDw/5ZesX+dbkQhSYsvqas
         DKO7XpcpcdTx5hf1VKi6ZKQjc7bk8rjqMLk9f1j7ksbv93kAt8IoBrMYVo6G/fvAWTtf
         X7wnjvn0XVp6cO7wswwEv/wQTrqby7mtcFcwHCOtJvU8peajX9CMVPZ+9Ba0gVLRBSWq
         XroAAGLgUm5F0tcH5ZKO2eOAXrfZO+3U7+xixHgt11WClddvAfNEsusNULrW0fD0v2SL
         5VNyNtLRA3u7AsyVzVoMMwDs+sZIquTpDeitbCpNRSVwong/GPTVYgnGq9scPtP01Bke
         E+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=no7tB6bV0ki3w63AwdNBLJM9I4TS3ao6JAtYcR5QLHI=;
        b=jUCYjpXLMk8WiGVUARAavhmgL/4EllHdE08bfob4PCpNgDWnk5UbMg4dqYtVrpV5bz
         5fosOXD3krjzNsp133jo5TRaAW5++L51lOotC8akkYUaCYNaUYbVerLY+vFCahR4/rve
         1P00qZq18JqCFQioKOQmBBm+DOFsWiG0bG4mApcolawlxQJIqrqRpkpYJcrhp/jIPaLY
         fM3chXH2kS4LL4SADylh3eVg4De4lgcAlm2GsTjOE1is1pwVEYFwx2TINVs1aAVaGipe
         PdVUHr/c1YIoMDhAg8swUW2kkCR3kPWD9J4aSELuWiv8dwhCWq0FOMeTYixp0y0uEiUm
         KyFA==
X-Gm-Message-State: ACrzQf1yI0QoEi4X1GH06bzPPKpK1EUic8FeG9hJbMy5WbNp0eKGOEVE
        ASwzRoMAuJ3szMR8ngxqV+MlfQ==
X-Google-Smtp-Source: AMsMyM4sDY5qZ/oOMrDS/0nBCG8jebVhHBkD1sEZ6NjuBfIhyE3Svh4iUuAcg4sWS4LsvubNN+6g9g==
X-Received: by 2002:a17:907:2ccb:b0:77b:bdab:674a with SMTP id hg11-20020a1709072ccb00b0077bbdab674amr3998341ejc.241.1663342889922;
        Fri, 16 Sep 2022 08:41:29 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id e10-20020a1709062c0a00b0073d638a7a89sm10567707ejh.99.2022.09.16.08.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 08:41:28 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Himateja Reddy <hmreddy@quicinc.com>,
        Anirudh Raghavendra <araghave@quicinc.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 9/9] misc: fastrpc: Add dma_mask to fastrpc_channel_ctx
Date:   Fri, 16 Sep 2022 18:41:02 +0300
Message-Id: <20220916154102.1768088-10-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916154102.1768088-1-abel.vesa@linaro.org>
References: <20220916154102.1768088-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dma_set_mask_and_coherent only updates the mask to which the device
dma_mask pointer points to. Add a dma_mask to the channel ctx and set
the device dma_mask to point to that, otherwise the dma_set_mask will
return an error and the dma_set_coherent_mask will be skipped too.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/misc/fastrpc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index b45f1285317a..c39eae8b26c7 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -278,6 +278,7 @@ struct fastrpc_channel_ctx {
 	struct list_head invoke_interrupted_mmaps;
 	bool secure;
 	bool unsigned_support;
+	u64 dma_mask;
 };
 
 struct fastrpc_device {
@@ -2305,6 +2306,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	kref_init(&data->refcount);
 
 	dev_set_drvdata(&rpdev->dev, data);
+	rdev->dma_mask = &data->dma_mask;
 	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
 	INIT_LIST_HEAD(&data->users);
 	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
-- 
2.34.1

