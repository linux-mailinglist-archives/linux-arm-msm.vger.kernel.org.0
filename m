Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC33F131F87
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 06:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgAGFr5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 00:47:57 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43139 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbgAGFr5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 00:47:57 -0500
Received: by mail-pf1-f194.google.com with SMTP id x6so26939016pfo.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 21:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a5znaXZKlBTVMs68+b0GTeS4YJ7CQCUkofQQyekYzV4=;
        b=oC97eC5TLPVr7Jrsjlrnmc83ooVvbjeUIh3ZiqGqLoKtjrO4Ij8a1NAl9kCzOIwEYi
         6QeOXid2yQ70AjpokUwCI3BpCoRzJMahrUsFwLSC5xjTzfsNgMSolD8NCiEm9Vc3H2St
         ue4nnXeoi3Kbj+VXtdxCV0QwUbhqMSAj6tWsxwDwsHM67piQHOz98uWvEGo37Fetg33f
         W6k/zzB9NE6gCR3VKPVP9cQEcNnCUfYu8nY28qAnCKerlVIjSa4TeoYkvzF40FQvhOg+
         X8DFm1JQSs5iTA6seyPXtPnMDI8t0rUvSu9nNkHqLitJfH9/qIaWrVrBwTJUesTuEBX6
         EH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a5znaXZKlBTVMs68+b0GTeS4YJ7CQCUkofQQyekYzV4=;
        b=SxGsGBIdsa9zIDUnp7nLEWL6eKh3jdfkpVWKOznhfK3KIsJjDag0EWXHK7JUVmkggm
         9NpgC5EeapnzLBSGo9fuMd6Z7rnjTtNjGRyVUpyOGzS3xSws6Apyo+EEwrb7GQcuCO38
         gSKvsN1FZ9q3HiUpvtzJjTHjUYQ52z41KRAm/0jxfJw+dJoO0iQ0pfwRpPjWBgFoNDP5
         b44P9oHOVhi5duKioV4skuJN23Hr1MUryjpEuFBHgOtHi+PxBeznmI0TgUoXOI6Ny/rG
         T91McaWzdGrUT8AcHHObOdBsUE+gh38C5IsMPND3MZfoMVIi1ysxwGqT6cZpzMzO0MYz
         zwnw==
X-Gm-Message-State: APjAAAUukgh2idW0YJBCoepU4VsopEeQaiAe2Rr3M2PpSMQPb3JyouWI
        WlrbvOE6dThV/nkaQ1qDBE271Q==
X-Google-Smtp-Source: APXvYqy2leZLuc9tAwF1AB/pqhfsi3mK/YIK7ZOzGsgaxNOLvQ9JQ/qFXE8LAge+Av32D8Bq/3Tvww==
X-Received: by 2002:aa7:9115:: with SMTP id 21mr81653278pfh.224.1578376076558;
        Mon, 06 Jan 2020 21:47:56 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k21sm67129177pfa.63.2020.01.06.21.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 21:47:55 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Chris Lew <clew@codeaurora.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/5] QRTR flow control improvements
Date:   Mon,  6 Jan 2020 21:47:08 -0800
Message-Id: <20200107054713.3909260-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to prevent overconsumption of resources on the remote side QRTR
implements a flow control mechanism.

Move the handling of the incoming confirm_rx to the receiving process to
ensure incoming flow is controlled. Then implement outgoing flow
control, using the recommended algorithm of counting outstanding
non-confirmed messages and blocking when hitting a limit. The last three
patches refactors the node assignment and port lookup, in order to
remove the worker in the receive path.

Bjorn Andersson (5):
  net: qrtr: Move resume-tx transmission to recvmsg
  net: qrtr: Implement outgoing flow control
  net: qrtr: Migrate node lookup tree to spinlock
  net: qrtr: Make qrtr_port_lookup() use RCU
  net: qrtr: Remove receive worker

 net/qrtr/qrtr.c | 314 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 242 insertions(+), 72 deletions(-)

-- 
2.24.0

