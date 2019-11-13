Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DADF6FAD74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2019 10:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbfKMJqh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Nov 2019 04:46:37 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57768 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfKMJqg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Nov 2019 04:46:36 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAD9j6pL064778;
        Wed, 13 Nov 2019 03:45:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573638306;
        bh=oyPsIbZi0qnZFmN2PaTCXCyTAhZJdbqDlEEeX5wsMno=;
        h=From:To:CC:Subject:Date;
        b=MCvja4NFv9U1J76VG9/k7hm/UT+ME2Uj3gh5QLA6DokBvw9uALLeGYsG0pB0xGSl8
         qxkI1qR4I9OExzvzIjQjKlHWn7wGfLE/Tqhgtt1LtEb0evY288Z/5a9r47HQ39V6wU
         cFlk29GDVtLLFMqW01eVQzMCcStoQKeO4s0fCA6k=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAD9j6aB085225
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 13 Nov 2019 03:45:06 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 13
 Nov 2019 03:44:48 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 13 Nov 2019 03:44:48 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAD9j2KA078225;
        Wed, 13 Nov 2019 03:45:02 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <gregkh@linuxfoundation.org>, <linux@armlinux.org.uk>,
        <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <ldewangan@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <vkoul@kernel.org>, <jslaby@suse.com>,
        <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH 0/3] tty: serial: Use dma_request_chan() directly for channel request
Date:   Wed, 13 Nov 2019 11:46:15 +0200
Message-ID: <20191113094618.1725-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

I'm going through the tree to remove dma_request_slave_channel_reason() as it
is just:
#define dma_request_slave_channel_reason(dev, name) \
	dma_request_chan(dev, name)

Regards,
Peter
---
Peter Ujfalusi (3):
  tty: serial: amba-pl011: Use dma_request_chan() directly for channel
    request
  tty: serial: msm_serial: Use dma_request_chan() directly for channel
    request
  tty: serial: tegra: Use dma_request_chan() directly for channel
    request

 drivers/tty/serial/amba-pl011.c   | 2 +-
 drivers/tty/serial/msm_serial.c   | 4 ++--
 drivers/tty/serial/serial-tegra.c | 3 +--
 3 files changed, 4 insertions(+), 5 deletions(-)

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

