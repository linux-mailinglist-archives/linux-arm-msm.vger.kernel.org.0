Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF5634CEDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 13:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbhC2L0B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 07:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232830AbhC2LZq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 07:25:46 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD86EC061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 04:25:45 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id y2so4237526plg.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 04:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hUS6XWlxd1Q+CLzsY1/tXz0C+ZIPBegHTsG3xd92fpE=;
        b=Y7CX6WL9SN/y3euXN46ybiNVuzMrLqXXNKzinTQAnkVgPan3AEVQFtHeTNPZ+P9Y7E
         rM9pPYhLJAm2/aAJ/oghaUkrlELsvUObO5glZbv04VfvB3NQ6lIRq/Zkxs8e47pdoE0y
         md8W1aPaOdFsomyEl7IjpxIh+i/bX5VdEq2Y4PWaIMMJL1lsE9DMTDbPjAjSDPHK0BFr
         Ue0i8Tyaz9nrJpx+p0W8dURX3ehhK427oqIeb9chqEY4xPAdKiWvY4TloPEOnG5cvN2Q
         ZKtu6jsZVq2SAED1EeyPsABdAwQi9GlCLJHDT2p9A5jRzJVNuUHMl+kWTypIKHzTENlh
         jt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hUS6XWlxd1Q+CLzsY1/tXz0C+ZIPBegHTsG3xd92fpE=;
        b=TRfCCeQhAS56qsdSLqLZ9Btgi6fVAoYVP1RceecU5tyKmGq3VL/6ofssrX28e6Sbpg
         MpYmHBVISjU1m10+daLv8HvN8AU6Pia1jFUwG6964IqsujgilGMJrsUb6xuog+xP2jyI
         OprMcH/UItwtXk0Pym5vwT4E9z61aUcpktrgt1Lf8bCUU1LdLtdQZ+rracElKJ5K92jD
         Ht05Yu3QWv6BLS2zF2QcLZAtmc12Kyoru8p8lAzba6H41HKEas7AAEG7Zffw4O+oG578
         EB9FPLEWBqcp+/yXFfW5QA/v1OcIvqQ/QSn9aExfACoRvxurXOhh//hGlYhDUzHOqoe9
         fTKg==
X-Gm-Message-State: AOAM533r7aY2pPlR/YT4XMQiNl/CbvfaMBWk2Unk1Qu+tvk8kSSPcL6b
        QrQZPb2Ja5XZFTAYnwcaGDTf
X-Google-Smtp-Source: ABdhPJzsuDPA0Iwb2cwfhsru/pWHb+lO6Y8pmy6JAB7qYIu1DRHmuxc1AkYn7QVhLblfK2wphvjQ1g==
X-Received: by 2002:a17:90a:1696:: with SMTP id o22mr25301990pja.0.1617017145238;
        Mon, 29 Mar 2021 04:25:45 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.146])
        by smtp.gmail.com with ESMTPSA id w26sm17364452pfj.58.2021.03.29.04.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 04:25:44 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     netdev@vger.kernel.org, gregkh@linuxfoundation.org,
        willy@infradead.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, loic.poulain@linaro.org,
        ducheng2@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] MAINTAINERS: Add entry for Qualcomm IPC Router (QRTR) driver
Date:   Mon, 29 Mar 2021 16:55:37 +0530
Message-Id: <20210329112537.2587-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MAINTAINERS entry for Qualcomm IPC Router (QRTR) driver.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d92f85ca831d..441e1607db53 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14856,6 +14856,14 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	drivers/iommu/arm/arm-smmu/qcom_iommu.c
 
+QUALCOMM IPC ROUTER (QRTR) DRIVER
+M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	include/trace/events/qrtr.h
+F:	include/uapi/linux/qrtr.h
+F:	net/qrtr/
+
 QUALCOMM IPCC MAILBOX DRIVER
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 L:	linux-arm-msm@vger.kernel.org
-- 
2.25.1

