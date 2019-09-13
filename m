Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5B99B234E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2019 17:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391346AbfIMPZs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Sep 2019 11:25:48 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46308 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403855AbfIMPZp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Sep 2019 11:25:45 -0400
Received: by mail-wr1-f67.google.com with SMTP id o18so1290490wrv.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2019 08:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YR/vHc0/aYOgQ7htuSAKCOpYZUSwbX4XADi3ha+KA8Q=;
        b=Leu/DrQJjKKYfvqHogFl3YpcT43VdEBKD/+N9xaZ5aX1MwS8dy5gsahY0TJNorpYbj
         RCM87o79r3lSZplmrXS7UrRD6815d9/SoKwUkCjFRlnYWOrDccnYMBMOP/LZQ2sCY/Sd
         XVdH/57tU+/Oh19meKnLhqO3VPgF/2Ob1PKAPKmvhbIbkr6gplGq24WEvwL7ekeu7bYh
         c1H3omILP/rlmpUkgQkyAarA4r4hlL+byuhBCLJ3Us5c4oY2LnWwh05rO3TQDL5yA4za
         p/jZNguN1Tr1Z09DdtxeI3uGrpp5XCyGPCGiajOWr+3JV9Jj7tcMTH9jSaTQo1yIrybV
         W5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YR/vHc0/aYOgQ7htuSAKCOpYZUSwbX4XADi3ha+KA8Q=;
        b=IIm2P/NdssoW1GZJu6RcEs/EvGwl9vA8kcF3ZDPI21mYlNK2EHaZ7pJQWPrsG7WWzT
         eN9q/UR8fMSQZTe6st1PuDY/8WMFK+i4EXSBn1Uy4+NEoVMfIa8iol3rc6jC01WnJbfN
         vyNOsIQtFn1jjhSLnHZ4UtdHgtUJaqhPhuYWQrr+Sp5grRNunT6S3239m2aSIJBH4/co
         KIYC7tPS59Dqu4VGsCSuNr6eeMwoa+pd5+vNd16ECSxA/uVcnyJ8DcsA6lymG8s8GeRm
         WmDSMTHeslEz34F0sB/nq9e1ysPAfBpEqwv5fEEOCgw1tJSAp3L5Yn3kX0cJNkul8Qrt
         N9yg==
X-Gm-Message-State: APjAAAXVjHaVZ1Qg1O+bPiSekek6BhrhrqZW52d8QhwaSiRcehM6UnCg
        BoY+7Ti7Y10Ekh6BCDfWB4GGEQ==
X-Google-Smtp-Source: APXvYqx5KIGVhI6Q2FBF3QcxBYLhi5+KVQWIxV06imlRDiMLqZKuoCLmV2QR4gmgFC/+mTzjSt9zxg==
X-Received: by 2002:adf:bb0a:: with SMTP id r10mr28521700wrg.13.1568388342113;
        Fri, 13 Sep 2019 08:25:42 -0700 (PDT)
Received: from localhost.localdomain (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id d9sm48717728wrc.44.2019.09.13.08.25.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 13 Sep 2019 08:25:41 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, gregkh@linuxfoundation.org,
        arnd@arndb.de, srinivas.kandagatla@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 5/5] misc: fastrpc: revert max init file size back to 2MB
Date:   Fri, 13 Sep 2019 17:25:32 +0200
Message-Id: <20190913152532.24484-6-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913152532.24484-1-jorge.ramirez-ortiz@linaro.org>
References: <20190913152532.24484-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With the integration of the mmap/unmap functionality, it is no longer
necessary to allow large memory allocations upfront since they can be
handled during runtime.

Tested on QCS404 with CDSP Neural Processing test suite.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 40b48db032b5..ee6de5d9993d 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -32,7 +32,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_CTXID_MASK (0xFF0)
-#define INIT_FILELEN_MAX (64 * 1024 * 1024)
+#define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_MEMLEN_MAX  (8 * 1024 * 1024)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
 #define ADSP_MMAP_ADD_PAGES 0x1000
-- 
2.23.0

