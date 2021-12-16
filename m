Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B598A476B84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 09:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234759AbhLPIMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Dec 2021 03:12:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234756AbhLPIMy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Dec 2021 03:12:54 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0189C06173E
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 00:12:53 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id r130so23047398pfc.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 00:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yWUSbQkUZgDm9ckwYIe35qZ3PIrJiDFyNemu6s/fd2E=;
        b=FRXhyJuBoTMxVd5LAWqdvfUzkDyN+7jzR/O+GywEVib83JRPY8vjpaiNycyhx6wHA1
         ot+4hMRW2qzeG2dpe+T6fapQdm1Js1mBEVshNj5dVqbjpiQawDLGHZLTGT9NRpmJvVrZ
         RhAQREdlIarlL01nCA3gJ0ClMJbIxQ+RjEtiKtwNe9m86E0cItzs0h1h1WDgTbRo1Toh
         zHteh9kVymtEuXP/Nz+21YmjIREHqj+CCMIA9rMNhaHNWVQ976A+0o1bBQqAQjkEVaId
         3x3X9h4d86z+pHrfaELJwyMMxH32/k2T4hWEc+7M3EY7563b/+oh+jfAkJL3m0jd8rka
         62zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yWUSbQkUZgDm9ckwYIe35qZ3PIrJiDFyNemu6s/fd2E=;
        b=SFOueBWnIOnQrVFoJooELqjiBff0aBE8DKSdaNAtfXAzcJ33UhXPdXJkoOHKDRAsP0
         k3y5MMbtdu8yF/49WXkonY0vYaCYjzuQ9/d/3Ro+1D3O9nMCgYiI9nq1qgDIWzdHNe88
         LQvfsV5tN4qj69Ra9ClqObcnrBmq6tV/WWNuJ4RoVzDOD7lgMpDuxJYJvBw8Xji+Z7l6
         FqkzcTbzKckTJaXIA5yhBk7i6OkRkhoSi0jscE3yX724irtReOWJfM9Tz2tpxbOXmd4U
         pxlguYWjrLvgfMtAGsYppZGjeP1WlecfkVfAwtrCxU+rF8xjDza61klsifenMkkyXQNA
         YZ+Q==
X-Gm-Message-State: AOAM530JOC5ug9LUbSqrSP5XxNVc/VhJPNLzCFoKvg+CmF4oI8UX0SZd
        ABGgW9Mhk3qak2jxdUtZSm8u
X-Google-Smtp-Source: ABdhPJxRZZowfM5tExkh5SMVDVfPFBEzU7WF1rUQGWy6g6uuTEUjLFGt3HKVAme2I4cnunfcbAECLw==
X-Received: by 2002:a05:6a00:2405:b0:4a8:3294:743e with SMTP id z5-20020a056a00240500b004a83294743emr12772894pfh.61.1639642373351;
        Thu, 16 Dec 2021 00:12:53 -0800 (PST)
Received: from localhost.localdomain ([117.193.208.121])
        by smtp.gmail.com with ESMTPSA id u38sm326835pfg.4.2021.12.16.00.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 00:12:52 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     mhi@lists.linux.dev, hemantk@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, thomas.perrot@bootlin.com,
        aleksander@aleksander.es, slark_xiao@163.com,
        christophe.jaillet@wanadoo.fr, keescook@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 01/10] bus: mhi: pci_generic: Add new device ID support for T99W175
Date:   Thu, 16 Dec 2021 13:42:18 +0530
Message-Id: <20211216081227.237749-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216081227.237749-1-manivannan.sadhasivam@linaro.org>
References: <20211216081227.237749-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Slark Xiao <slark_xiao@163.com>

Add new device ID 0xe0bf for T99W175.
This device ID is created because it is using Qualcomm SDX55 new base line.

Test evidence as below:
root@jbd-ThinkPad-P1-Gen-4:/dev# lspci -nn | grep Foxconn
0000:08:00.0 Wireless controller [0d40]: Foxconn International, Inc. Device [105b:e0bf]
root@jbd-ThinkPad-P1-Gen-4:/dev# cat wwan0at0 & echo -ne "ati\r" > wwan0at0
[2] 2977
root@jbd-ThinkPad-P1-Gen-4:/dev# ati
Manufacturer: Qualcomm
Model: T99W175
Revision: T99W175.F0.6.0.0.6.CC.005  1  [Oct 21 2021 10:00:00]
IMEI:
+GCAP: +CGSM

OK

Signed-off-by: Slark Xiao <slark_xiao@163.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Link: https://lore.kernel.org/r/20211029104918.3976-1-slark_xiao@163.com
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 59a4896a8030..94d8aa9c2eae 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -423,6 +423,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* DW5930e (sdx55), Non-eSIM, It's also T99W175 */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b1),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
+	/* T99W175 (sdx55), Based on Qualcomm new baseline */
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0bf),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
 	/* MV31-W (Cinterion) */
 	{ PCI_DEVICE(0x1269, 0x00b3),
 		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
-- 
2.25.1

