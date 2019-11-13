Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 686FAFAD6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2019 10:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfKMJqb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Nov 2019 04:46:31 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39128 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfKMJqb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Nov 2019 04:46:31 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAD9jDjB087645;
        Wed, 13 Nov 2019 03:45:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573638313;
        bh=GHNUseg5evFt6Y9KnNI8MJPhCUDouBqew70akAkrOqk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=JYo0pdS3kolpcA+44t+Ffl4kaArBrSdtmER7HI2jty0aKvk2DZ9/rG0Wccph9tKZ3
         XV06/5rF2PgaEkSphPs1InSXym87b4eeRzRaGXjiOC17cGgJfcyZQQ8fPlbb29fk7J
         xUoqwBJY3F2bUk+k7jB/6tkxCpuXUkMjS1oRz/zA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAD9jD0e089011
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 13 Nov 2019 03:45:13 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 13
 Nov 2019 03:44:55 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 13 Nov 2019 03:44:55 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAD9j2KC078225;
        Wed, 13 Nov 2019 03:45:09 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <gregkh@linuxfoundation.org>, <linux@armlinux.org.uk>,
        <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <ldewangan@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <vkoul@kernel.org>, <jslaby@suse.com>,
        <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH 2/3] tty: serial: msm_serial: Use dma_request_chan() directly for channel request
Date:   Wed, 13 Nov 2019 11:46:17 +0200
Message-ID: <20191113094618.1725-3-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113094618.1725-1-peter.ujfalusi@ti.com>
References: <20191113094618.1725-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dma_request_slave_channel_reason() is:
#define dma_request_slave_channel_reason(dev, name) \
	dma_request_chan(dev, name)

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/tty/serial/msm_serial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 00964b6e4ac1..1cbae0768b1f 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -301,7 +301,7 @@ static void msm_request_tx_dma(struct msm_port *msm_port, resource_size_t base)
 	dma = &msm_port->tx_dma;
 
 	/* allocate DMA resources, if available */
-	dma->chan = dma_request_slave_channel_reason(dev, "tx");
+	dma->chan = dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->chan))
 		goto no_tx;
 
@@ -344,7 +344,7 @@ static void msm_request_rx_dma(struct msm_port *msm_port, resource_size_t base)
 	dma = &msm_port->rx_dma;
 
 	/* allocate DMA resources, if available */
-	dma->chan = dma_request_slave_channel_reason(dev, "rx");
+	dma->chan = dma_request_chan(dev, "rx");
 	if (IS_ERR(dma->chan))
 		goto no_rx;
 
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

