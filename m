Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 606762E9632
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 14:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbhADNmw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 08:42:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbhADNmw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 08:42:52 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84992C061795
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 05:42:11 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id i9so32215684wrc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 05:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u23Upri+mVTKw2vMmpl89dQD9K1UaxJ4Tc+YMYk9PIg=;
        b=KdU/z2W/BC4a5O6/Op7jOih0OZdWuuJUciuhR0WccvXslPnct5zHgkojzX+DB/08+9
         8OF5Bn4TAma4uAjk6ljvi6OSnlsV8xayQ+fT0SHYjamZWnIUWVVm6nsPKEZRYZ3b9O1l
         8JANatH70Zw18LikmuH9GPIX2cuPELzzQ/DrM7eLm/4bZt0nildSQdRZdRuPUYoA/8UC
         6Fa9HcE9aCsQM2BkRUjXXD45VVtDQ0f555MT+5eTdd1aITZO3xzBrjmT39u5MZs98UI+
         BZF7oEfuvd028wahT6J/aOD2/HfxUFUmE+jfijYbmWe7g7lL7VFuwata/0+dhCkwj74L
         twwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u23Upri+mVTKw2vMmpl89dQD9K1UaxJ4Tc+YMYk9PIg=;
        b=IFMjdqYdJp9lHnGE3ngf7gJ6g8XxK9W3YGvzwPMdgCN5VSOCK8qk+E6SAgzonlR+sz
         5TTPSYd9epslfYT6gkKtyihBC/vI9UsIcOaXULZW5Q/Dx9n8b3W59ltzkN5q0LwCueuk
         FQX2tKBr2C9iCZY+Z0pn5mAUcmuIkc0Js4XSQ08LwYHXBrcUUZrb7EYoUf59ubCXPd3q
         XbPIoH3GkTyW0a71WaToryidRAxzkZQXmIOM3NePy0v+uTh5o8oJVRhfnCdqYAwrqKMT
         Ek7gDSt6KC+QiIFSrwvt+JP174SOoqic2EjMt3m28PKI2YvJjeIZ9+kdlngJqfclfUFQ
         gb7w==
X-Gm-Message-State: AOAM53180qGjKBLGXZBiWRWuYArt9ArPqpV1ezh+i3UPamQChWVtktiI
        mEDsT/sjwKgjnqA5W8cDwxEuOQ==
X-Google-Smtp-Source: ABdhPJzOWeGr/Vphx6WAQ8EQENrbykKhtxs+TUTTxIKaSeJgftfZYyv32YvzMBkgj2SZQgIApHn6yA==
X-Received: by 2002:a5d:4b4c:: with SMTP id w12mr79135226wrs.402.1609767730299;
        Mon, 04 Jan 2021 05:42:10 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id w4sm34042968wmc.13.2021.01.04.05.42.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 05:42:09 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v7 02/10] mhi: pci-generic: Increase number of hardware events
Date:   Mon,  4 Jan 2021 14:49:31 +0100
Message-Id: <1609768179-10132-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
References: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
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

