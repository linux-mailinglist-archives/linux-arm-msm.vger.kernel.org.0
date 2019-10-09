Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB17BD1184
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 16:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729471AbfJIOlg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 10:41:36 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41688 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731434AbfJIOlf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 10:41:35 -0400
Received: by mail-wr1-f68.google.com with SMTP id q9so3345678wrm.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kcLlMzjMsysWETgQh91f6OPcWKj+qkhd5X668mmqw/Q=;
        b=GWaEyzGql51eoXnd1+9HbztdXoU4S+/WAXkpE3JiLjoAdSXYFfOCdRlo8ka9teKRo+
         qctTklxUCgnX3HTAEi1A/qI8zu4jpaZ8Gpl0WdfdlypBR0CL9S2J6Kf/MT1h2byvXceh
         QK/dtGGW0CV4g99zEJvCwYenJUQLXrnwtV6F3uoN4j3DxmWgw7W3Io/JU8KvRo5Pcp8L
         Hdk2SNOFCK/hZLLxkSTEnvE8/h6YMePlmmSNE9eLQk3bWmnXbJspBYFqHiU7dmQb1xOs
         SHODCutnrqaEqWbryPH3ZYsK4fGW2F3TBYA3Lwu0I1O9fZWYurW1/M2EpF/1Bj4zKuMj
         H6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kcLlMzjMsysWETgQh91f6OPcWKj+qkhd5X668mmqw/Q=;
        b=fF1lMfOsYSbWxvzGU6bQmOZeLCNKzO0poLaac9gnjuEiF5zV20i33SuKhQgVKxnHm/
         vSXAb166COrTscJ+A5klXffXCXnxGwUXYdZTlr9RzU7FK3lr5OEhnp4B+DWcHB/8jaAr
         tK9ylaDNAZun4vv3n8yDBc9SOhyIEpRyRBoCun2FeLDkyZZkg0kUVCSYU6DhYT97WaKK
         xnmUkelb0nBCoatsx2tiLPjrsJICEv8j2bdV/SPEdpxQX4SrIZgpO0V9pAzgStQGJD4d
         OCQK0a6IooiIIBk4hmD1Sv1RiQC77YJaS39nQXnBOBpYlhGrARPWTjJRXOf6X2JoU2Qf
         4eBw==
X-Gm-Message-State: APjAAAV1nnNswLLGx+pvFPy5k54tEu+gtvp0tPdK/KKWIUj/biyHoB1X
        mSmvtK0SJwurd6o9Q8BYYMX21g==
X-Google-Smtp-Source: APXvYqxydnAiNuYi21zzjBXjR+z8z1rVa1I47B0cpHpyMgSL01A5yw7XriPlERbrOpW2hLnh+ZYe3Q==
X-Received: by 2002:adf:de85:: with SMTP id w5mr3185456wrl.278.1570632093491;
        Wed, 09 Oct 2019 07:41:33 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id b7sm3031770wrx.56.2019.10.09.07.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 07:41:32 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 3/5] misc: fastrpc: do not interrupt kernel calls
Date:   Wed,  9 Oct 2019 15:41:21 +0100
Message-Id: <20191009144123.24583-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191009144123.24583-1-srinivas.kandagatla@linaro.org>
References: <20191009144123.24583-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

the DSP firmware requires some calls to be held until processing has
completed: this is to guarantee that memory continues to be
accessible.

Nevertheless, the fastrpc driver chooses not support the case were
requests need to be held for unbounded amounts of time. If such a
use-case becomes necessary, this timeout will need to be revisited.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index c0fe3419c685..666c431380ce 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -959,8 +959,13 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	if (err)
 		goto bail;
 
-	/* Wait for remote dsp to respond or time out */
-	err = wait_for_completion_interruptible(&ctx->work);
+	if (kernel) {
+		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
+			err = -ETIMEDOUT;
+	} else {
+		err = wait_for_completion_interruptible(&ctx->work);
+	}
+
 	if (err)
 		goto bail;
 
-- 
2.21.0

