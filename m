Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 474C79AC73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 12:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391937AbfHWKHB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 06:07:01 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35025 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391899AbfHWKHB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 06:07:01 -0400
Received: by mail-wr1-f65.google.com with SMTP id k2so8111950wrq.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2019 03:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v2Fx0Pb0mc0UlpujkGqHHioGa7pg7ML7uA9l5iVY0Do=;
        b=GWT3zdvdMQpqxhTsdSyx5rYZ7r7eIIXimBJr7ZlqJJ5t47imk0nWYlAn1gNSED9B3r
         E7s/CvY4Indt8y3xgghgQ7D+78yw7yWehSfvJp/wOa9sgq7U9Kmj7bQpeIwe1yyEf54o
         sx7DX55kGrcVQHnmYinDMa9gM+IrZvDvOMHJpOmMbrK3uT2H0wUxZfGKnDoVnHMAztdR
         GfFDR2vU56i5sk3POxaEEbUAKsmrYCUFzq3RIuNO/LZ4NUXHKH9epCKD6Qw/gn4yD0Hw
         IMjVYH33eGd8swVydp+e4Xwtk/O6E3nbwmAdZVmr762o0lhyC/YmyLNoxmFydIoASpZH
         tr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v2Fx0Pb0mc0UlpujkGqHHioGa7pg7ML7uA9l5iVY0Do=;
        b=ep6BU/DqUy/ixWzR1gb29t8a/RmH8FbAaLqaw1SFaNRqo/vyFHllxp2YFckyHIL5Km
         TApnBOJv6DN2HR+nubMzp5jwCdeVx+brqcYJnNZFGxN3fEZRPJeJy9RMGbyIDsf3xR47
         m+bibtntJv3xt8hZ+B4YzcDB8XnKqooOoDYYwqUttnWAOR2FmM5I6tBm6gpN/KeTH5l6
         Al6+ZVR31Bf6wo7hKS2Ev9QJ5YbULAZX929rFcaoitJzBNDkBvpmYWJ24CyHkXdiaW7u
         Lr/tPgT/ZZ2b76L9VtZ/OB3AetzYOV6vTlmvlQRszM4ppY0kGFiojGska86+vYL5GUL9
         6S6w==
X-Gm-Message-State: APjAAAWETZmuVkO6SxWFcWYd/eXd/ar+EbmxN+ZVWTHo11D5OXvHOIuQ
        EqP3Wu1mqLMkWnImzRoNxsNAdw==
X-Google-Smtp-Source: APXvYqws3QSflBFeDgNUBiFdOfNkzoR6ZaMTG5i+APCnxUptHlfDifDRBjd52c1x8Z7GPzfIpmKUSg==
X-Received: by 2002:a5d:4205:: with SMTP id n5mr4175583wrq.52.1566554819104;
        Fri, 23 Aug 2019 03:06:59 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id q124sm2058048wma.33.2019.08.23.03.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 03:06:58 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     arnd@arndb.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Abhinav Asati <asatiabhi@codeaurora.org>,
        Vamsi Singamsetty <vamssi@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 3/5] misc: fastrpc: remove unused definition
Date:   Fri, 23 Aug 2019 11:06:20 +0100
Message-Id: <20190823100622.3892-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823100622.3892-1-srinivas.kandagatla@linaro.org>
References: <20190823100622.3892-1-srinivas.kandagatla@linaro.org>
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

