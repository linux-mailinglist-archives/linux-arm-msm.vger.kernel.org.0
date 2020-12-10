Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF02A2D57BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 10:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729017AbgLJJ51 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 04:57:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgLJJ5P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 04:57:15 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F46DC0619D2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 01:56:04 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id t16so4791643wra.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 01:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Vy3kHN/RH9Hn9YIWVAkL+Zg6LjG+ZIJ8mxuwdFWNQ2I=;
        b=RE9ZZvPwITq5QOzbA+sWlPaxbfDQzTBgzEC/rCEDg+m96HtV9uGUcLQgvz5vaAnOrJ
         4yM+yJIW55KktODZPGwHz2+i55eNhaBEWsZfYRNwikO+UQA1nBQrssUPVE8T5b6FHcvJ
         QfVOEwY++hSCAIpyuF5iBlI9z/9EN8vDRw7sFdTTmMraQpu0d4FcIFfNnPVieUEbpOGM
         SONbZMNbjahVmrBENXXJ84dhRGAcqeCurKqlDBAGZOevIqyXuosQrQ/2soEbHKyePdgN
         qsSsYabFRAUZ3Hk5pvQMDAsADYdeKBc0zieamlp+2Imqse2kZaCblEOz8Ch9lfnaVni2
         bpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Vy3kHN/RH9Hn9YIWVAkL+Zg6LjG+ZIJ8mxuwdFWNQ2I=;
        b=HeICdtSD5xr+zrsAFtcyQYk4Un5hLoxbEiAL9h8O86FE5nY8dodetHKg7GRbzZLt8A
         7ff0MXqxdKPr67Ykb8Zvpzi2Arx4u11sUexTeqxKvSrGL2EsWLLZUnetzyODQcfm0Bvz
         hJwgW91cRmvopfczzhOC0X4woDsAmXMnH7lSgqtd2tcO72szCyFZi3my+SnjM17NRf6A
         bLlm7h6MnCWHwf7V7UWFd+drEt1GfrFulN0No76h+fvz9Kru9NjgVQ15nIZTeqhivqpa
         xXyPz4GjjrBTL2IqXcrpUwmm+afBobCMInUYzQyghMR7tjaXn9/aAhMBi7OFTohpTj++
         olAw==
X-Gm-Message-State: AOAM533VcBwwO3pHQoF1kqYZMrP3K+VpOyc8WQOFb+WQ7m/P2Hh6jyho
        YBFIgdSicwTfDqjwd7sYPvvcgQ==
X-Google-Smtp-Source: ABdhPJz0xLkWIK1XrJp+7LhoRvYAxnhC3B9C6WfUNdWermTMsqwGO1m7+lbLuBm5/m9xLRI4fqe+jw==
X-Received: by 2002:a5d:4e8c:: with SMTP id e12mr7054572wru.321.1607594163376;
        Thu, 10 Dec 2020 01:56:03 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:4468:1cc2:be0c:233f])
        by smtp.gmail.com with ESMTPSA id l16sm9043721wrx.5.2020.12.10.01.56.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 01:56:03 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v4 09/10] mhi: pci_generic: Increase controller timeout value
Date:   Thu, 10 Dec 2020 11:02:54 +0100
Message-Id: <1607594575-31590-10-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
References: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On cold boot, device can take slightly more than 5 seconds to start.
Increase the timeout to prevent MHI power-up issues.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index b427d34..0c48884 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -160,7 +160,7 @@ static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
 
 static const struct mhi_controller_config modem_qcom_v1_mhiv_config = {
 	.max_channels = 128,
-	.timeout_ms = 5000,
+	.timeout_ms = 8000,
 	.num_channels = ARRAY_SIZE(modem_qcom_v1_mhi_channels),
 	.ch_cfg = modem_qcom_v1_mhi_channels,
 	.num_events = ARRAY_SIZE(modem_qcom_v1_mhi_events),
-- 
2.7.4

