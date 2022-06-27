Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9373D55DD04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239849AbiF0RFV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 13:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235533AbiF0RFU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 13:05:20 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15FAB15713
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 10:05:20 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id e131so13626300oif.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hiy6+iiLMeGDFL3yjWewYCuuYeu2rtEHRH1Mk/XtDns=;
        b=QyMvNo8m4T4TgwC1HpgS28kutB5bX/froVFu40QZNr8jKdGTdFzyVD0Eho8FO90ag6
         b9PdDHM8MvcHpcDYzcGhJLRYWlCSfwv0JEO9m4YwDjiM70RE/SY9DYTsVTol0wEl4oj4
         y+rJU6jj4JNSYVaaDRSsIuTl92Jf5FV1LIhBxyOy0GhjOLS8S16EqNjLjq+u3/FxSB7N
         xZnfg2lS2BkhbtVMXoI/4p2sjmgnSrwquLhrO0kstzVdFaO9twKcFerIbX2zxSQ4NsZo
         pq5KOIMlue1YiiqONpRWXmDpwDlNf5eJuwTajSGUoJCP/jT4p4BnPoweMItLaYxbb3/d
         wrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hiy6+iiLMeGDFL3yjWewYCuuYeu2rtEHRH1Mk/XtDns=;
        b=q2FDjDONNAbVXbutPF2AIO/DlbRqCkw5xVOCF0DyRVXmbSsDmJvjoac9FE9QDl5NGY
         /M0qSoBblfoMICxxF0Y2Z0oa7JVnLBczBmeBEs+YY697PG0PkpcK9tEwR8SwCy4KNxQk
         VrvgTYsi7WEGTk5rTtSBuC+ZCBNs7iQzeL8M7oO7gkjRTSwndYqkXBKA8SViO4u78Snq
         nh8C0oppoYHyuJkyVV9PCbdzJqzHn0dXTWTTtNYdPLNuV6Jfduorm9I9n7ejwokfkcdY
         Dhr9F3tTr6JdYCYaVok6tWecTH+XYC2QzZaWD+4vv6ksis294wIuJ/z0O+aYjIF1DgSo
         wNNw==
X-Gm-Message-State: AJIora8vshgrQtFLwmll4Mb02sCKWMFRMvt9RFowAxZVuXbpq+77/7iI
        3OetcumffxG3GxGUNhGPHcAh4w==
X-Google-Smtp-Source: AGRyM1sY/DvE1sLhaZz0G6NJ4ve3bOkQmSv9AL7zpQxIJqIY3FhpZKQIVsCNUjWlNP6i46JvXnLxJw==
X-Received: by 2002:a05:6808:2111:b0:335:510c:eee4 with SMTP id r17-20020a056808211100b00335510ceee4mr8161509oiw.151.1656349519431;
        Mon, 27 Jun 2022 10:05:19 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a12-20020a056870d60c00b000f30837129esm7303175oaq.55.2022.06.27.10.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 10:05:18 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Hemant Kumar <quic_hemantk@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Loic Poulain <loic.poulain@linaro.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] bus: mhi: host: pci_generic: Add another Foxconn T99W175
Date:   Mon, 27 Jun 2022 10:07:17 -0700
Message-Id: <20220627170717.2252335-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Foxconn e0c3 device identifies itself as a T99W175 X55, add support
for this to the pci_generic driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/bus/mhi/host/pci_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 57d5f611a979..bf82d90f9ca9 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -571,6 +571,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* T99W175 (sdx55), Based on Qualcomm new baseline */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0bf),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
+	/* T99W175 (sdx55) */
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0c3),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
 	/* T99W368 (sdx65) */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0d8),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
-- 
2.35.1

