Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CC4352968
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 12:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234783AbhDBKFn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 06:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234902AbhDBKFg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 06:05:36 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DBF4C0617AB
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 03:05:34 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id b9so4302812wrt.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 03:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=71AYT/dhjnU5ojKUj2fRrnlRuQ44LYMjxMdvoAXboUM=;
        b=c8tek5g8hUMygOAsHDoLz672nfpqYIcMeZBUeO7slAlFUTedUuy4OD5QlkbYfTdBDA
         6o4a7Ybaf/OLmNG/TswYmqIEe85/DTNJLcctI6QHhOb7K+b2poo+5b5u4v3+gUylhq61
         x/kAH7YPLhYzswz+tHlKiHa11vRBoFlpoL1UD/ao496KIX1U+VsCGxRxYdajVSSsrU5p
         aLz0G/9fRwNlsD5HjOlJBfjOV/YzTcMt04BZ/QnDmvDNqttJO0UVztdmUmOI++N3/kTZ
         OV+AgI+jfLeUdYRG/yoJTA+u5Rxsaq9k9TxThKHBSz9ti4qGzCyUDIWW87fdCwCrlviS
         vnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=71AYT/dhjnU5ojKUj2fRrnlRuQ44LYMjxMdvoAXboUM=;
        b=YAJPGB/AXSK6XWaj5zRV7nzUNDSByTLWjVMlY7Gh6DdFzdoGfaCcmpyixZWSXcv2NH
         zOjexgWbOp3FY3xVWRQKREn8QQ0Yz0bOAZ27rhCwg5t2qEAEVpFUBqSBiN7o2MuNNTCn
         JNSKmafDKJXPlb2R4E3TRcdfLGLURCv+lGV2xXybapmGMX63ebaG+VsABj4Yx5wCLR22
         YVTEZ5GZutfWstBy/LcuOuKFY2Aq1gegkT6pEtnts7PdqioDGlWMb2FNXe1+e1H/Tgmw
         XPT9GOPSKNX4pGmZG0doJaNsLds4av10NrURJQglp19HPlp5up2SH3ZzibZS9ZemUio2
         TC/A==
X-Gm-Message-State: AOAM530NHi1jO/u+0NUyjR+BxIyXv1UipPJJlQ+wvsJWkmSYS2lqYHEx
        pSYXA+dW+bXwi1ADGvc7Q7c5kA==
X-Google-Smtp-Source: ABdhPJwG2/NVaXrpTWLuqjPPS40D4FXyj5cFZmjApNy0veyXDDQk5linTg4TxwGmZOoRdAga7ikAgQ==
X-Received: by 2002:adf:9261:: with SMTP id 88mr14135510wrj.270.1617357933148;
        Fri, 02 Apr 2021 03:05:33 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:32 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 16/25] media: venus: pm: Hook 6xx pm ops into 4xx pm ops
Date:   Fri,  2 Apr 2021 11:06:39 +0100
Message-Id: <20210402100648.1815854-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

At this time there is no need to differentiate between the two, we can
reuse the 4xx pm ops callback structure for 6xx.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index ccbbac2036d2..a23e490b6139 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -1122,6 +1122,7 @@ const struct venus_pm_ops *venus_pm_get(enum hfi_version version)
 	case HFI_VERSION_3XX:
 		return &pm_ops_v3;
 	case HFI_VERSION_4XX:
+	case HFI_VERSION_6XX:
 		return &pm_ops_v4;
 	}
 
-- 
2.30.1

