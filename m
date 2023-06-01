Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B290D71A1C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 17:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233767AbjFAPE1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 11:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233670AbjFAPED (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 11:04:03 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC52E5C
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 08:02:59 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b01d912a76so4292285ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 08:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685631689; x=1688223689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvBjA4f+x+l+Skjyvt+2SPWzkMrr8PFd+q36DPYPr/I=;
        b=bzJ4jU0WClHtjcePctYLLq8ptSRv1RNXiiFih+6jn8u6dAn0GwxEzEoTjfe8hYywDP
         MT9F04ejf8olI6bDjNZSpQIf1sajyAIBDxy3cgUWzb9ONtdA8bmFlP4WWD3CDovKJ5Dx
         AhBadsTI5LF6NxThu992XqO7lFo3WI7stz/+b+8xSkhTfVIJ9hx8GLXzRNsKcYXiP2Y2
         xu130Bag9YCqv1SpfiJxFcOEItltZxCDr/NCXosuobZJosQh8EhaS7Rqbcz92LB+uf0u
         /HsAB1oLqi8ObKn1V4bUgVYp2O3Zy8LFLOtvzDLTP2ogKy756oU7uTwkI6seXvTffIOo
         pCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685631689; x=1688223689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvBjA4f+x+l+Skjyvt+2SPWzkMrr8PFd+q36DPYPr/I=;
        b=HslaxUZzelu4YESj5eTwGvJtAFDwSCivwXDRUSN1ve2FJ5HPBxuz5UE8FeGUwNmbJo
         gtKy+na5Oax7QxY+ApoIudfO4L9Kv3YJIPIFohRUaxI0FXc3r33pZBejAYpw7guFfEwj
         7md2PZuf0nxNIJLYJeL6rhoZgQjXYsAA7EWp+hkfm3GygTgf7IIJJsuSv47/omLyRWno
         R+rwZGXhSR9Y3WYooNvFNBB13ZQfj8YqJKH7sNhFNHU8uapVVHYIEiSAKNokMaxctBBY
         SIk+l+EsNthEGIAUaeaFXwT0FL/6E4AgJobNorHq4MHn3ZehR1WaZbzaCbdp78jlPCCD
         N2qQ==
X-Gm-Message-State: AC+VfDxdGLi9LtonHrIc+eixO9VxFw1PqwtSj0ENO2QceI7oQZOurbcm
        xMkZDgpEg8hdiWBrlbHYKxWrNhjxtK7pld1siQ==
X-Google-Smtp-Source: ACHHUZ6MTf2zs1nPSgalZc/iisRLp3EZNGNRCGEUNzi0Xt0DrPoxh8pKEnqC5CDMe9snGvbMyFQCvg==
X-Received: by 2002:a17:902:6b05:b0:1b0:5e0f:16a5 with SMTP id o5-20020a1709026b0500b001b05e0f16a5mr4913488plk.11.1685631689682;
        Thu, 01 Jun 2023 08:01:29 -0700 (PDT)
Received: from localhost.localdomain ([117.217.186.123])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902dac700b001b0499bee11sm3595480plx.240.2023.06.01.08.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 08:01:29 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com
Cc:     kishon@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [RESEND PATCH v5 3/9] PCI: endpoint: Warn and return if EPC is started/stopped multiple times
Date:   Thu,  1 Jun 2023 20:30:57 +0530
Message-Id: <20230601150103.12755-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230601150103.12755-1-manivannan.sadhasivam@linaro.org>
References: <20230601150103.12755-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When the EPC is started or stopped multiple times from configfs, just emit
a once time warning and return. There is no need to call the EPC start/stop
functions in those cases.

Reviewed-by: Kishon Vijay Abraham I <kishon@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/pci-ep-cfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/endpoint/pci-ep-cfs.c b/drivers/pci/endpoint/pci-ep-cfs.c
index 4b8ac0ac84d5..62c8e09c59f4 100644
--- a/drivers/pci/endpoint/pci-ep-cfs.c
+++ b/drivers/pci/endpoint/pci-ep-cfs.c
@@ -178,6 +178,9 @@ static ssize_t pci_epc_start_store(struct config_item *item, const char *page,
 	if (kstrtobool(page, &start) < 0)
 		return -EINVAL;
 
+	if (WARN_ON_ONCE(start == epc_group->start))
+		return 0;
+
 	if (!start) {
 		pci_epc_stop(epc);
 		epc_group->start = 0;
-- 
2.25.1

