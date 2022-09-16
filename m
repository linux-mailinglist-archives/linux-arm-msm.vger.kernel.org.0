Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B80BD5BB060
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Sep 2022 17:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiIPPlR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Sep 2022 11:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiIPPlQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Sep 2022 11:41:16 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4B8AA35C
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 08:41:13 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id lc7so50378150ejb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 08:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=kxBxk/FS8Ye3931pbgmBAinP+pm8Dft1BNPYaalgjn8=;
        b=XpGod5if9uC7o02Z34foFiY5WFMt3IJ8vUAGJ9vlBrCOa3/bhN58HspiClsd0EorpP
         hhaUrWLE+qDSCcFzqqGcQ/c6JWJTr3jlWk1BOcBccdrxguwRZ80d7jeS6zXtWIQJ0uuE
         HsHVY8Jhx4akCvGmBKJx40gEKbdjaVcFOQJ110l6cp3HAmy+RiRNIT2YMu6rE9QY+lkn
         DRXkVlrCp9lsMcc7II5BGF6rxUgRYmeHNZwab04Tx5yD5M3fLt1rGAm9XpWRkj1T6Orm
         8kDO4tHTYmiym1wMHyx9s5XqvwTUbWBso/Kqh0O9ACnxIn0chSyVBaaRXWEO7GC0gQjm
         7GRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=kxBxk/FS8Ye3931pbgmBAinP+pm8Dft1BNPYaalgjn8=;
        b=pX/iJpQnGw6aEaHuEEmiGuYeNXhhbMxvRlDOi1GPif019tlhUaPfpuTbHC2bIm1glH
         QVy73rI9SLZsUN5MNAgoAkw1CL7CAEYRaAk7vDcWBNJ5QTzDQr/jbJNo/nde5Quuybfy
         yEzG6Qgir1kS5hSyoQ93niwP6aY12tKSriAC5dPClmlHWISfXVcDZMTO1KuPP+SYLRQM
         k++3AiWm8w7cnFrSXQizEnd8S/iMvG4oTmRptgL0LIbkeN2Zn1DoiQhUNhAg/sfpdr3W
         cACppSTWWwQnIljHsGLKfqzIuihnMPtziBW9xF2TaL8wgqZHPU0NznBOjYVByZVmYxAH
         W6Ng==
X-Gm-Message-State: ACrzQf1Pk6f1E7uYlkZD0BuvXGtHuv6Bcp9KvjqeSg7hQK4puCjjsFPL
        5/8qZrZu2Jzt0Scojk4IYaOSB4dlNNGpXg==
X-Google-Smtp-Source: AMsMyM5D443CO/pdwkmSTEVQ/XQcZA2rdT13onApRX9AyGTq/FbbiC3lbH883U0goL5e2Q7O215UFg==
X-Received: by 2002:a17:907:86a0:b0:780:33d8:ef83 with SMTP id qa32-20020a17090786a000b0078033d8ef83mr4066810ejc.667.1663342872280;
        Fri, 16 Sep 2022 08:41:12 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id e10-20020a1709062c0a00b0073d638a7a89sm10567707ejh.99.2022.09.16.08.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 08:41:10 -0700 (PDT)
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
Subject: [PATCH v4 0/9] misc: fastrpc: Add audiopd support
Date:   Fri, 16 Sep 2022 18:40:53 +0300
Message-Id: <20220916154102.1768088-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds audiopd support to fastrpc.

This relies on the following patchset being merged first:
https://lore.kernel.org/all/20220902151423.3351414-1-abel.vesa@linaro.org/

Here is the v3:
https://lore.kernel.org/all/20220909133938.3518520-1-abel.vesa@linaro.org/

Changes since v3:
 * Added fastrpc_buf_free on rpmsg remove, as pointed out by Srinivas
 * Dropped extra newline in fastrpc_internal_invoke.
 * Dropped dt-bindings patch no. 3 since it was already merged by Rob

Abel Vesa (9):
  misc: fastrpc: Rename audio protection domain to root
  misc: fastrpc: Add reserved mem support
  misc: fastrpc: Add fastrpc_remote_heap_alloc
  misc: fastrpc: Use fastrpc_map_put in fastrpc_map_create on fail
  misc: fastrpc: Rework fastrpc_req_munmap
  misc: fastrpc: Add support for audiopd
  misc: fastrpc: Safekeep mmaps on interrupted invoke
  misc: fastrpc: Add mmap request assigning for static PD pool
  misc: fastrpc: Add dma_mask to fastrpc_channel_ctx

 drivers/misc/fastrpc.c      | 261 +++++++++++++++++++++++++++++++-----
 include/uapi/misc/fastrpc.h |   7 +
 2 files changed, 236 insertions(+), 32 deletions(-)

-- 
2.34.1

