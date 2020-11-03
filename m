Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB5F2A49A6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 16:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728631AbgKCP3k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 10:29:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728592AbgKCP3j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 10:29:39 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8AF4C0613D1
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2020 07:29:37 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id h22so13215603wmb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2020 07:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D9HeGsxvKVawBcXNJ6v57mMay091Ux8L9MQhRC+7UxI=;
        b=entA0LCy0HsF5//YDWm2vkxB0poG10u3ZgQBM1Jzl2lAwG0ebP5AeBXBVZrj+4zWAo
         wRTUK2XgEAd5UjXxCATL7NsklTHXij7E+1PP5JhgHE+zF8XCoOs7tRVMLZo/2pO8s+cz
         Cl4vurABP3Af6zJILBkIy/0gRI6HcITUDjEUZMFIL2l1Kvvg8S7zWcxCsKlnsSvS0qu4
         bB5fJtQLHor4P3Y0dz8oD9IhMZHHnZElYXXubgk/WfNArg9AakN1aAqmQ4/biAgpUq//
         JwX4TnkAX9sTatGMvezEA5984QQ7v8Np21gAH9rkMTh2M3UgSjr94TmJVpHfZfYPG+J1
         d99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D9HeGsxvKVawBcXNJ6v57mMay091Ux8L9MQhRC+7UxI=;
        b=D3Tu3W+G2dCMEGF1uIUQdUa7H7PmSOGZRehiyfWJMHONC5Lms5EKhpndwhSZEfaxtu
         OBxM+YcSGkMWxCKuyvWrajbQonE43U9inapcbMGM4IrF5haw01FwWqCvkRvv+VWJYvXH
         B/X6FHWw8r36KzbdIemMHi1c1zVRmR+2hIeIlX81T8dsSNN+QRyqwBwqpkY74uuC53Ve
         CzqpUXIn4WT1vHKgyUhZQWRrfdbBT3yxtspDIuIYoJdGvpo+1fjuX+nUUeQCUa+eNu20
         3XKJeBN1yZqziUfQRldVPPELQWgeZexeY+Pxcd9jtgYjoMTlT2f80mxyKnorP6UvoQCK
         /V8g==
X-Gm-Message-State: AOAM530NZImCEYLqqglt3Z8IVX9tpxUYFqEXy5WpdSC9P3njbsnXLLmQ
        BSXGuUqkC2+MFQk/8qqMPsY2sg==
X-Google-Smtp-Source: ABdhPJzGiC8X3u2Fty1nH3f/cEFOA0UcOPewgB4JH/Vd/Rzcp97Okv4uL4Rqbsg0ULTsTtdBPqAXJA==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr294528wmj.49.1604417376519;
        Tue, 03 Nov 2020 07:29:36 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id j127sm3491779wma.31.2020.11.03.07.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 07:29:35 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 20/25] soc: qcom: llcc-qcom: Fix expected kernel-doc formatting
Date:   Tue,  3 Nov 2020 15:28:33 +0000
Message-Id: <20201103152838.1290217-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103152838.1290217-1-lee.jones@linaro.org>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Kernel-doc expects struct documentation to start with 'struct <name>'.

Fixes the following W=1 kernel build warning(s):

 drivers/soc/qcom/llcc-qcom.c:77: warning: cannot understand function prototype: 'struct llcc_slice_config '

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/qcom/llcc-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 40e7df1e1cbbf..96c20e673436b 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -51,7 +51,7 @@
 #define BANK_OFFSET_STRIDE	      0x80000
 
 /**
- * llcc_slice_config - Data associated with the llcc slice
+ * struct llcc_slice_config - Data associated with the llcc slice
  * @usecase_id: Unique id for the client's use case
  * @slice_id: llcc slice id for each client
  * @max_cap: The maximum capacity of the cache slice provided in KB
-- 
2.25.1

