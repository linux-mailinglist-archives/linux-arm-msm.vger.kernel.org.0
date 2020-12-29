Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761B12E6F00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 09:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbgL2IhK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 03:37:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgL2IhJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 03:37:09 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778E1C061799
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Dec 2020 00:36:29 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id qw4so17186328ejb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Dec 2020 00:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u23Upri+mVTKw2vMmpl89dQD9K1UaxJ4Tc+YMYk9PIg=;
        b=SErjQYPU5A+oo2XyoCJSFpDZfo2qTmaVq9/8EWpRec/pODtpIyJfURbDy6ulMgSB86
         Xtt2p+WjFhUwpy7xPYjp0bta7+w0FPPVYn7pSKl1hP0Sk5JdPCtw42RZ1ckb8eTkpN2o
         TNiSZ+yP9AzREM9/udYYx65CPbg31OGmtvn6P4Frgq9H9iRL1GkgdgiIucc/v/PsjAYA
         8waxkp3lTkc+bGYoXzpd1WYAoG5mza0R02yb6eaZcy0tkSBsyD8mPcNUcpsgZCMH31F6
         gIrFQFbzdiYckSJy/mWCrdgDmVpL4zEv5q5O6my+7Ic1Bllm7B1KRXjVbLGbqgjxKor5
         ZiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u23Upri+mVTKw2vMmpl89dQD9K1UaxJ4Tc+YMYk9PIg=;
        b=APIWZOc434pPF90hZooYLiNdyUe4Uiqr5NU0WfIDhAbJHW04ciS9uhaxtgmDSNRwfC
         MJefeHnOzyUG2HDlqlHfppWpi3L/yvI4ENABYJgyK6Swcue041Ie7LTgpVQ/T5syhWQ5
         o8+y3sKN2IEKZmlmY7nj3zvfVcKc1Obo0Q1Jn65IoEb3Sbwh/jyQr3YRNDQrDGmQ1eYL
         PdSDIjA75dite6KFnwXu//KVm0drLfZ98cmCfvvDm7JmhUkE3YjLjbIZbVuyFPQIWJtF
         qbRQUlc3gAegejfu2vXHFMtFmWU4pSJkMfWCKAwBkLLabotSSpYUxPUO57pqAMa/Od9A
         5XVQ==
X-Gm-Message-State: AOAM5312aWRDLn+KSxyJr9psu21hs9vUoUhr5kKshVUYrVd/AFU5HprK
        u9lwqp1I7AP1vt0QDEcfNWWjog==
X-Google-Smtp-Source: ABdhPJzQ+P5fow57/sks9hrMK80BmsIpwTAtZ7SyEkTO0E9omam99GBbGm6e34VV+GDE8I17ZGoBVw==
X-Received: by 2002:a17:906:1f07:: with SMTP id w7mr22401561ejj.519.1609230988200;
        Tue, 29 Dec 2020 00:36:28 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:6f69:290a:2b46:b9])
        by smtp.gmail.com with ESMTPSA id c23sm37265143eds.88.2020.12.29.00.36.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Dec 2020 00:36:27 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v6 03/10] mhi: pci-generic: Increase number of hardware events
Date:   Tue, 29 Dec 2020 09:43:44 +0100
Message-Id: <1609231431-10048-4-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
References: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the IPA (IP hardware accelerator) is starved of event ring elements,
the modem is crashing (SDX55). That can be prevented by setting a
larger number of events (i.e 2 x number of channel ring elements).

Tested with FN980m module.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index e3df838..13a7e4f 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -91,7 +91,7 @@ struct mhi_pci_dev_info {
 
 #define MHI_EVENT_CONFIG_HW_DATA(ev_ring, ch_num) \
 	{					\
-		.num_elements = 128,		\
+		.num_elements = 256,		\
 		.irq_moderation_ms = 5,		\
 		.irq = (ev_ring) + 1,		\
 		.priority = 1,			\
-- 
2.7.4

