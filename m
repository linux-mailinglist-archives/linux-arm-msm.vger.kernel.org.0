Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E84514237F0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 08:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhJFG1u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 02:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhJFG1u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 02:27:50 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B599CC06174E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 23:25:58 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id w11so952522plz.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 23:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A2eL6Am/QXcfEf6wpEEXp2eqrb76XKvsxOHtLunB81E=;
        b=w1p4S9zAl0cmnFFEkqs1653lpUpyT6XR7Co+b9FhBs/GH7fcytAorgcpR6arYy43AY
         30L4x2hzdq5ypwIeeWBDRKPoFPSCiDpYA4UksAAGIPSo52N2U+X+tDxZUKHdKO9L15sq
         DV08D7c+36c/yiMnVBprOHJkj7HnEFG7GfLGaLJv2J/QaYok/9cZuZcWZ7lMYxdcIW6d
         V8z5KB28mZL7icfbsa2AftBuCI3/zyiJsMsBTcEtgpNLRptnQQmBHV5KJQckXhqe52RL
         cR/w5xQwnhqn5bmU+Q3rV1uVN5G5t8e2u6xQoI0N2SsbY/ZsC3Orr2n0cFTKuS2PjYNr
         OsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A2eL6Am/QXcfEf6wpEEXp2eqrb76XKvsxOHtLunB81E=;
        b=svbZBCQMN+1Vj25yUJoOLn07ZVIT2S6pdMqYis0w+X9G4dXfiZopyxHbOAicS8trnF
         8EpF302jTOo1QGDdoC39cYk5M0i4KSwyGVDaUJ1n9DO6sRGdS4uabaG/Tk3TfJbJwDiV
         ctiKRA5wkTxKrOWugqKwojLLdeTx8PPb6n0myXTNFDNYsPD76DxNsmfJoUdTMUN4hagz
         AfDNZUMbyxQ5asMo8jtoB/4O+tN382pnXDsZzi5EgZztjlckl4xy405InT3TYDNSv6uU
         lr25HNPBD+Arh45InZvB02qHFTf3txFbII+zHM/71idacWBPoY77AlgsIpyCOyTJ67BU
         pPwA==
X-Gm-Message-State: AOAM532NyFYuPEKBa0HAEMkTMSJ2zxLUauwvd9KLNGnzA+/mgGb1Mbif
        s3vIldLQwBiXd3SNoDU+LmQf
X-Google-Smtp-Source: ABdhPJzM4FZ5kRlWkBgGu9JmRikyxvCpUWH1ohdFMA1Yvh2k0znv139DvEd2ubKDZ5wjyYrL3wYCYw==
X-Received: by 2002:a17:90a:67c1:: with SMTP id g1mr9178172pjm.177.1633501558060;
        Tue, 05 Oct 2021 23:25:58 -0700 (PDT)
Received: from localhost.localdomain ([117.217.176.215])
        by smtp.gmail.com with ESMTPSA id p18sm19329361pgk.28.2021.10.05.23.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 23:25:57 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] MAINTAINERS: Update the entry for MHI bus
Date:   Wed,  6 Oct 2021 11:55:45 +0530
Message-Id: <20211006062545.34429-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since Hemant is not carrying out any maintainership duties let's make
him as a dedicated reviewer. Also add the new mailing lists dedicated
for MHI in subspace mailing list server.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index eeb4c70b3d5b..8ae357d746c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12191,7 +12191,8 @@ F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
 
 MHI BUS
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
-M:	Hemant Kumar <hemantk@codeaurora.org>
+R:	Hemant Kumar <hemantk@codeaurora.org>
+L:	mhi@lists.linux.dev
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
-- 
2.25.1

