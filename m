Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9A23D1187
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 16:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731599AbfJIOlm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 10:41:42 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37927 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731584AbfJIOll (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 10:41:41 -0400
Received: by mail-wr1-f67.google.com with SMTP id w12so3349291wro.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 07:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HkWnKjTS7NNaz0B8BlFiWfLhS4jldKU7yfNvUhiWaQM=;
        b=f7ss43sXwKeRE+g80ck8yRpx+79MpXlAU1ICqgUsyPCZ2LLoVvxA6BOR3KRt21gjwW
         kj915Hpw47CWN/pKnCTCFjdRM/v5W+s/gP8vs150QmXsqlTTQOTwS72avXQMVZWJnN7w
         zKo+Hh6J9IYLXPkRfaF7Ab76QKgZTdMr2EHbyDJ9DLBwwO7YhAOjCf8xeg7skOoPZ1nv
         ya8FNp987bJwuINtL34bTWlctIy/qGZ5UVjvTb+h2al2y5U2fwK9m3feljXXWwWmPa36
         LAFwBkOEVebcAmYlLeNYoSRxrgjlVI1E80f6VOPl5n2DSZaCAuOuebstfC8IHlKoC0RQ
         o8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HkWnKjTS7NNaz0B8BlFiWfLhS4jldKU7yfNvUhiWaQM=;
        b=ZA9/pP8k5hDalysOafDCGD2ufuqo2f5sbwduvhN6bf75cwd9/SMR/hRBLEBWIfebCO
         YBlcBkTKmpeVmz4tAcEONqaTR/aBOX1oBONej4oOJ54ttSLtwaV99UgLHSCLuL9de0TS
         SdzlCgQObyCMVZK6waz1naJ8vAR2OIkXSnE9xegF6ygJCeSurG/g565bDGV43tM0f4ZB
         LjeQhSwUPSJ86T10ykK3iMhlymA31LRh+qL63JiB0QbjJhrWIGb8aosBxJHBtu8x3nZM
         JAnZ70lVXX0l3a3k/eMIhONlcBpbJf4XPiUUieL0NcLxm1w2iv5uHXCLBo6YkJwHpbD4
         QV7g==
X-Gm-Message-State: APjAAAUf7xifP95siQZ1MVlzNN8UDtj7OD3zxvhgsNnbvyF/qiRqqm1I
        YvEhUBeq7ZW5anohaDl3Npj2xA==
X-Google-Smtp-Source: APXvYqxrW+4MKBUxqo35A6KxiZEfmmI3wiTuBUBugFCDOTeazkkMYZAnEeaq00wfCfqQUYZZKfSnrQ==
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr3238951wrn.302.1570632099807;
        Wed, 09 Oct 2019 07:41:39 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id b7sm3031770wrx.56.2019.10.09.07.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 07:41:36 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 5/5] misc: fastrpc: revert max init file size back to 2MB
Date:   Wed,  9 Oct 2019 15:41:23 +0100
Message-Id: <20191009144123.24583-6-srinivas.kandagatla@linaro.org>
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

With the integration of the mmap/unmap functionality, it is no longer
necessary to allow large memory allocations upfront since they can be
handled during runtime.

Tested on QCS404 with CDSP Neural Processing test suite.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index eef2cdc00672..b6420aae45b9 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -32,7 +32,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_CTXID_MASK (0xFF0)
-#define INIT_FILELEN_MAX (64 * 1024 * 1024)
+#define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
 #define ADSP_MMAP_ADD_PAGES 0x1000
 
-- 
2.21.0

