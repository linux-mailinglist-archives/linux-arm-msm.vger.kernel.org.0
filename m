Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B38B985D89
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 10:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731335AbfHHI4Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 04:56:25 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47432 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730994AbfHHI4Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 04:56:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 01DAB60ACE; Thu,  8 Aug 2019 08:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565254584;
        bh=Y+2QB4aoSFsqaUPUgzBQ38gP8PQyfwGd5fA5HXDy7U0=;
        h=From:To:Cc:Subject:Date:From;
        b=KNzv1lscO7Af/3pEGUXX93EcSCYfsU+ICY7BZE1qvdP3x5o0A0/AQtk3Z/SAP2sLo
         oNG6zghA1f/8vICbrREIiW/ICzqbZ9K9AwIqOcPXeMQJc7TlQO1+4t5rei9F1/1FuN
         MMIhPy+hqLKT+NthcHmIp5+ouATCD78WCYn3S5Mk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from bgodavar-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D40B4604D4;
        Thu,  8 Aug 2019 08:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565254582;
        bh=Y+2QB4aoSFsqaUPUgzBQ38gP8PQyfwGd5fA5HXDy7U0=;
        h=From:To:Cc:Subject:Date:From;
        b=YhCeaA/RPHlVcly8bEnUlJLRRFTU+gWoErOAazeJCn4aREC76NrozO0EjfrP+VALG
         ry54YFZdJdOaLieuOgw/cJE+9v09ocVMwQGJQKegtVDtKphsJ3f9GNMdGSDXCKPulu
         Z89ZOBJfjpI1dGzp84z0wPBFdxXQWWxtGvgMkfGc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D40B4604D4
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=bgodavar@codeaurora.org
From:   Balakrishna Godavarthi <bgodavar@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com, mka@chromium.org
Cc:     linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, rjliao@codeaurora.org,
        c_hbandi@codeaurora.org, tientzu@chromium.org,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>
Subject: [PATCH v2] Bluetooth: btqca: Reset download type to default
Date:   Thu,  8 Aug 2019 14:26:08 +0530
Message-Id: <20190808085608.18010-1-bgodavar@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch will reset the download flag to default value
before retrieving the download mode type.

Fixes: 32646db8cc28 ("Bluetooth: btqca: inject command complete event during fw download")
Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
---
v2: 
  * add fix tag.

---
 drivers/bluetooth/btqca.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 2221935fac7e..9fb247c10855 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -140,6 +140,7 @@ static void qca_tlv_check_data(struct rome_config *config,
 	BT_DBG("Length\t\t : %d bytes", length);
 
 	config->dnld_mode = ROME_SKIP_EVT_NONE;
+	config->dnld_type = ROME_SKIP_EVT_NONE;
 
 	switch (config->type) {
 	case TLV_TYPE_PATCH:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

