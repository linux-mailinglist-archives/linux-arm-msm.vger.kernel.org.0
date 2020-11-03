Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415812A49BD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 16:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728585AbgKCP3h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 10:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728559AbgKCP3f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 10:29:35 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EBE0C061A4A
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2020 07:29:34 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id y12so18997150wrp.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2020 07:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=05S3ru4tW4mcaDRoeFk8QLKhxybxsfGcFNjhW6F8wDA=;
        b=mUHzgMDhCaONSYhvmw/ALRA7QndQYhUnZgTu7ZoaTFh5kihM3G/YdksvozD0IgEffI
         pkycfuihbdujTsBIL5+VnxXSwLlDtyR9KW9IE8011+Gz/K0CGkTgsLoTj5OJwGeufpQK
         sJ5F5ouNBch0vfaJcEjAGYFUC1L/b7DEHtGLSCKtVfhzVnTnG12d8pLPOp3fYtBjcTaI
         hAnquaFCoxWyZ7cWArrkiChK3XacR3l2bcrfUn1J5rokQhVfW8aCmLYwS6fZNeTLOZLx
         cLW5WTrrJxIVyg8kqBeOJVjYH9wz2Gt0OSb4rzGbC2teSbTZosg+WsN/Xvu76fExJZch
         EVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=05S3ru4tW4mcaDRoeFk8QLKhxybxsfGcFNjhW6F8wDA=;
        b=uGK3EWujdPCy4E28a8Ux/r2D2rIfdllgzNrIDDvek0xTfzHmDF8T9vFodgmhds4MyX
         HWyJ37hQXTFk2tQNw0l5qTLG4Xir3LJ0Rr325N6typfKLPjALeW2KE8eVkNijtMrNRlF
         LhGrsKREjEKMtWikFeoY7cLm3raGmdisIt3jN7RsnmmfqW0ZZxYPcPGKflVf0hRJ3ghZ
         vNfiITo1y4a2h69Ab+P/hbeoTVjmZu0m19xvBJ7t1zMCMIUeAM07wddYVbY+Wi3syYWB
         RiVXX7N+tyXjXPJEweHwmSdmQZ7wU3CqkxTvX6hm0dCrMoUJHziE84gU9HOyK/A3cZws
         dKSA==
X-Gm-Message-State: AOAM533XZbNgFW6Cj3IEzVAcsFZMBWmPcPIAkh3EJoY3tJ4ge5J/5Fsd
        EoMEzV6E4eEX+4JqEg/GlllyXg==
X-Google-Smtp-Source: ABdhPJzDNOQApkc32dJ66+dO6QtsCwF2WE0kOXaJCzV+lWdTifAu4mloBHleqsSF6TcNi+erSSQq7w==
X-Received: by 2002:a5d:4ccd:: with SMTP id c13mr26793520wrt.221.1604417372710;
        Tue, 03 Nov 2020 07:29:32 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id j127sm3491779wma.31.2020.11.03.07.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 07:29:31 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 17/25] soc: qcom: smsm: Fix some kernel-doc formatting and naming problems
Date:   Tue,  3 Nov 2020 15:28:30 +0000
Message-Id: <20201103152838.1290217-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103152838.1290217-1-lee.jones@linaro.org>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/soc/qcom/smsm.c:140: warning: Function parameter or member 'mask' not described in 'smsm_update_bits'
 drivers/soc/qcom/smsm.c:140: warning: Excess function parameter 'offset' description in 'smsm_update_bits'
 drivers/soc/qcom/smsm.c:257: warning: bad line:
 drivers/soc/qcom/smsm.c:260: warning: bad line:

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/qcom/smsm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/smsm.c b/drivers/soc/qcom/smsm.c
index 70c3c90b997c9..1d3d5e3ec2b07 100644
--- a/drivers/soc/qcom/smsm.c
+++ b/drivers/soc/qcom/smsm.c
@@ -130,7 +130,7 @@ struct smsm_host {
 /**
  * smsm_update_bits() - change bit in outgoing entry and inform subscribers
  * @data:	smsm context pointer
- * @offset:	bit in the entry
+ * @mask:	value mask
  * @value:	new value
  *
  * Used to set and clear the bits in the outgoing/local entry and inform
@@ -254,10 +254,8 @@ static void smsm_mask_irq(struct irq_data *irqd)
  * smsm_unmask_irq() - subscribe to cascades of IRQs of a certain status bit
  * @irqd:	IRQ handle to be unmasked
  *
-
  * This subscribes the local CPU to interrupts upon changes to the defined
  * status bit. The bit is also marked for cascading.
-
  */
 static void smsm_unmask_irq(struct irq_data *irqd)
 {
-- 
2.25.1

