Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA8DE175219
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2020 04:26:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgCBD0x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Mar 2020 22:26:53 -0500
Received: from mail-pg1-f173.google.com ([209.85.215.173]:44513 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgCBD0x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Mar 2020 22:26:53 -0500
Received: by mail-pg1-f173.google.com with SMTP id a14so4679648pgb.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2020 19:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w6YjYn6BXH7WqeHF++GS4XYMLYZO97EPFGU0VNZwjrk=;
        b=QWFVFaE6EG6SzUe0Eu0/AJopy/tBy+E4KaLiOzNNnKDZ+InzFBBH6d9y6oXDD1p0Bk
         DgRZhCPdjmnoHC8gJaeesBnfg7WTslxgGn6qMciqVrInUGxjgpZySbK6vkhgMsZ3EnRL
         I27zVPc6LFKVi3tlMz4jQenxam2h8nEcUqVDEylc2vfVbf4axxkPx7w3AIbHg6aOFmXk
         xFf29JGE2Bj4iK3+StRMju+AvC8PpmQ2TqWeZoQCDR2MuD5JlK6snBGaWrXEjHzmvVjj
         fFA4D4vA/AWXGU/711864Di+GJWxN4xSdx1IYcdAEgsQK89Tt/Wbbzjc+mroftqd3ome
         65Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w6YjYn6BXH7WqeHF++GS4XYMLYZO97EPFGU0VNZwjrk=;
        b=c0MdDHoFZrxWqjLj/0oFWh9l6l3T636/K9OXXEmgeXjUSedxFuAjKQnGtAVCRGNgy4
         uTGSwDbz171TfkPA7Zvfo9NaV1YVEbXiciCLBezTcu/mN6cL0tnd8VWEHDHtXBCbN78e
         wt9o3X4891M1w8V6ioz2BnGxyY1K79u6N9DgIp5ZM/4ANu8GiYao6A0ONHHXb6vhzY/U
         lwq65FJ8cT/jDfdXJSa7K3YTcc25n33GoCVwKzr/yALTUxnaqKRYQEJIJvZ6rhYmRAxc
         OYOmsfPJB8rdNsIleEtiHTt+Q84wS7Nb2OdCbox5bxxeFdLscaYOz8IwE0UHnTed9E2i
         ADzQ==
X-Gm-Message-State: APjAAAXvPbpLSsTiMuHteg1v4t3G/NBxgtF2VU9TwqIShX+xnkzc469R
        FpNiU03Il515x3NGoWj5xTcSXQ==
X-Google-Smtp-Source: APXvYqzRu+CHaA3CEuPwT7EdTKcOZjp9SVoiuWVf99F/1ddFKSnoeTCu88q2tC0vX+g7emLnpfHBFQ==
X-Received: by 2002:a63:3744:: with SMTP id g4mr17835545pgn.424.1583119612278;
        Sun, 01 Mar 2020 19:26:52 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b133sm18435739pga.43.2020.03.01.19.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 19:26:51 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] net: qrtr: Nameserver fixes
Date:   Sun,  1 Mar 2020 19:25:25 -0800
Message-Id: <20200302032527.552916-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The need to respond to the HELLO message from the firmware was lost in the
translation from the user space implementation of the nameserver. Fixing this
also means we can remove the FIXME related to launching the ns.

Bjorn Andersson (2):
  net: qrtr: Respond to HELLO message
  net: qrtr: Fix FIXME related to qrtr_ns_init()

 net/qrtr/ns.c   | 56 +++++++++++++++++++++++++++----------------------
 net/qrtr/qrtr.c |  6 +-----
 net/qrtr/qrtr.h |  2 +-
 3 files changed, 33 insertions(+), 31 deletions(-)

-- 
2.24.0

