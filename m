Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D15EEA14F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 11:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfH2J3k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 05:29:40 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54309 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727045AbfH2J3k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 05:29:40 -0400
Received: by mail-wm1-f66.google.com with SMTP id k2so1505520wmj.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 02:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v2Fx0Pb0mc0UlpujkGqHHioGa7pg7ML7uA9l5iVY0Do=;
        b=KdOAkYx4mUlEdOHRKmFg/Ohrw/cqTc8SxCG5fhUGBqFGvGPkr0MsZW1RTy99SSeksl
         DNDorcOie2Sf0FP5HI46t83xZtN20WwtU66qUQz2B+4y+zGoh9G745lhiJ7MxTJAlArB
         aRt2FRFjKd04Eu9HEfSgIrOnSTG6WlSqhL3TOsl8Ulm4d57y+cCTFmzDWkyG9igZVwHz
         I7n51NEHrGNiUH53mxrK4p+B2aNdN7xobvVCyWBSg5KNr076w2JuiLJ5/SEyvXNMMjs2
         GkbqqSyP2HV2TltnILXR9Rvg8fizFYt5C2gChLXRARQKW02NK95+iY0cFNBqXbDv18Mp
         CbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v2Fx0Pb0mc0UlpujkGqHHioGa7pg7ML7uA9l5iVY0Do=;
        b=Zi44Ajy8LZAQyKBOVD8T+7eKBqBXlpm2PbJzKJ5yO4UTH58ajeAti3ZtZIT2ZKWPFz
         f6q0BOd5roMw5+/rlbWMIxrpswoztCMdsMLrHYfxqagf4frJrA1jXGqVNWjPzxbMgwnq
         c8wPQlmNDZEHFuUeu9jwEe0saJ6fnulkDzhNa9Is1emmjPcawZl8dF7WtZg+ZHp2344z
         dNjmMk1dg7KUN9hct9FJcH65vU/9Pltc+OPZJrn0irqvxn6mbtqPSorBHM/nmGJu3QWx
         r/15DvBPjemqApMNKFfdB7fSuNPgTHd3zII2vcVLTU5a9Sy0WFQ8Kgd9REpyuRDNds3U
         Kw6Q==
X-Gm-Message-State: APjAAAXbG+B8G03rYi4Yjn+5BP0jlsd26enI4CKUILPmWYD6Pr9jHaaN
        GWCEf6YVBEjl7+vrCRbwXWNvhQ==
X-Google-Smtp-Source: APXvYqyu0QQoJV7ZRy9TThXqikuqUKf8hLMAyzYv+K80I5bIT4qhqGE/sAIKKMP5yPM72AF7eLZLNA==
X-Received: by 2002:a1c:356:: with SMTP id 83mr10609179wmd.40.1567070977941;
        Thu, 29 Aug 2019 02:29:37 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id f197sm3609512wme.22.2019.08.29.02.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 02:29:37 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     arnd@arndb.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Abhinav Asati <asatiabhi@codeaurora.org>,
        Vamsi Singamsetty <vamssi@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 3/5] misc: fastrpc: remove unused definition
Date:   Thu, 29 Aug 2019 10:29:24 +0100
Message-Id: <20190829092926.12037-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829092926.12037-1-srinivas.kandagatla@linaro.org>
References: <20190829092926.12037-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Remove unused INIT_MEMLEN_MAX define.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Abhinav Asati <asatiabhi@codeaurora.org>
Signed-off-by: Vamsi Singamsetty <vamssi@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 59ee6de26229..38829fa74f28 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -33,7 +33,6 @@
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_CTXID_MASK (0xFF0)
 #define INIT_FILELEN_MAX (64 * 1024 * 1024)
-#define INIT_MEMLEN_MAX  (8 * 1024 * 1024)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
 
 /* Retrives number of input buffers from the scalars parameter */
-- 
2.21.0

