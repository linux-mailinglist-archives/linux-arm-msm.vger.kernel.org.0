Return-Path: <linux-arm-msm+bounces-83761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D75C91D70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 397F4351B31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63D93112AD;
	Fri, 28 Nov 2025 11:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pzL9HvFp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3586530FC35
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330262; cv=none; b=F0N+65BqzSE7uBzH1PPM46J7zJPvoTMjT4zH4l95XjHlvXoIvq/LgS57wHQnHr38mvWiCOz+1BVpMk8cM+IBkTyqFbpGb9bjxlVwl8GoT5yIl4QQFzxGREFlLppS1+VwUgcZ4KPnwx7dkiseZBJUUqqjTRAJl3SwRKCO02YMLR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330262; c=relaxed/simple;
	bh=84A4UM4OHcdSHSGFGPDI4qnvzgVV3Vm9nHDZmA6wQK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N5incvQlU6E6vr7LvEPuF2h3VD5UqI7ztQan81YZSGTPYee7Adqy02J/TCivICkVmHuqWk4PVM9uL56R4gO/BclAoTCKFWlV/sxfXz3peuezhlcwXw1SYkPA+pYe8a0/cpg5kvX0IIBgSIMQ6k3Upysy/Mv5nBA8hMLcWRg6N14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pzL9HvFp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779d47be12so14205585e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764330258; x=1764935058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJwBtHuhRdjkrm3XUVZe8PT8VCWUl331/NsK1Seo3b4=;
        b=pzL9HvFpueDKZd9+BRTvEQWyRKEbO+zVg8z0qunCmQyAgoi410pv8klSLQF6UXowoC
         pMzxGlb8k+DxEq3DTR9Rl3bUL5Fl0/6quF0HNRpGKb+iWGl5ZjEbPMDtODKYnJ67eAJO
         UjJOqOZaJ9PzTU3Fwq1oYUy7Rg5Db787VWgjQ2Ult/FRwUezCCFRxjaa1qqg5KdtPWSc
         QJ2pyVz0ZRgfVQn+SPRdSkaj3i8ZiOjQt82jT1j4gTdhVxizvuAZXZID+QMnPkqXwhDj
         USk0+bj/Zk0WtU63YIVupiPaIOGzHDAtKmYMEN02vq2I4Hwpne7Zl6PTCdzYQmyVax4T
         X6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330258; x=1764935058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DJwBtHuhRdjkrm3XUVZe8PT8VCWUl331/NsK1Seo3b4=;
        b=ZBHgMRmtl+lSTtVfiJAcZ1Bra5gw3vcSJt1Lc8xx4jFPhnAt88gQLfVH9aR4rt1Y9J
         6702awBxN8A5nHY4iMvnYLT+aJeQ/yIyh8QlY8qGWxtO94Bny3jVI8nbCeDZUK+OUut2
         VSN+sqEjBmZoOzYNTrtMJ5BqX1jk+Ua/KdIHNufxAtbe5J3ftviHSLkoBF59jKk9rapb
         6txnKWO7yLzb57NKZ3xwWNzChWfX4AeDu0oJmcWCKZrs7B8Soq5PkGjifJ85Br8HTh3e
         zA7Iwc0n8NUH3yEI/iEBsGHI5Gpx9qNoSOltvfl8AFxY784+8Yw0Ya4LR8NS/x/bda2y
         tbqw==
X-Forwarded-Encrypted: i=1; AJvYcCXvLY1oTHSNVkHt9BOAXktnx9v8fiDpUyPdOOH+d1Cw2/QJ8KqaNKUJqJqoiYsNIBf5xTFpvg2Cd+yB9IV3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/g/EPEWPTm+H3aADmqsPDtZ4hNlXBXRIC4CX1cukgL/LbDwyv
	cuiehPnsBrFOGUufZaaNRcqaG/HpDeQ9QwaIq7NAPlyfbrR8skPTYKb/ftQR00lXxXM=
X-Gm-Gg: ASbGncuSl2PidxKz2N7xZ52ykt4ase6WOGaK1Fj3U+szHKmMPByUL1y2+gGhtvc9LTT
	R3Yky0yGWz4uNCvLjqWZf4oaL8bc5gQEsUX+xnc+mEaExFXPchV8npHe1RAXhdB6tDrW99iyWwL
	FtikbYGpYgESplDBzBI+tIK7Gp54tY9yB92YLIvOxJm/UjIK5icE2iHUtEAYwXz2gmNXJkpXFDV
	v8BOmictGdKX9lVrwzyP0KUgffIdG9CVueRX/PmrTFql68qLxkWXLcjtwEqvfHYg0yRf5ecgD6i
	8GE63iUv6HunlWcG5zV3KAQs8L0sro4tq/DR6Jv0MyZxpqYKUwVqsyJok13BBjldtvulHgJAZEf
	qIjtP7/SPiOF0dBUgck4dcdLLdPYnH0C14NeW5cxjgqNhA/7K/0bUthfeNxVF2Ir2DuWLP3TjeU
	DGZcLgyg==
X-Google-Smtp-Source: AGHT+IFTOBJT7pHAwTMbeZCPeiB3+NHv9oPpD2M5uIuFasAqIeDNAusPDzasOmA93IWJ3yHpCovGDA==
X-Received: by 2002:a05:600c:354b:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-477c0184c45mr260135565e9.9.1764330258412;
        Fri, 28 Nov 2025 03:44:18 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3c6:aa54:79d2:8979])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47906cb1f60sm89888445e9.1.2025.11.28.03.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:44:17 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Nov 2025 12:44:02 +0100
Subject: [PATCH v9 04/11] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-qcom-qce-cmd-descr-v9-4-9a5f72b89722@linaro.org>
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
In-Reply-To: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Udit Tiwari <quic_utiwari@quicinc.com>, 
 Daniel Perez-Zoghbi <dperezzo@quicinc.com>, 
 Md Sadre Alam <mdalam@qti.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MwEAo2zVjW4LaqEinbRBgEzAJEbwJ4zGCvUL4X/EaY4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpKYsImdOYAaVGAXSkPbpMt54/G8pWwJHzmmyJR
 zljuE4RAayJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaSmLCAAKCRAFnS7L/zaE
 w2eTD/0Yy3+1s6f5XVN9U8Wi3hXyMxzXXHGS3zVhnFuOk1UZwKAcurXooswdmXThO1ZApRlbDc3
 33fabtlfpkMV5dOqDl4ljeO4RAZ0Gbfco6HJvKgV77MUlRlQLGNdpLnHmoF23a0fXZgm6QSgTtE
 nkepxAzYRJ/5DscpCvDLmhbjZgpWG/crYqtUpsO9WhI6NvhdVkw07wRS1M6nhxZAHhhW4qyMx6H
 wzIZ6lC3e9lDFnA0muabebaoxl1xPl2qfqCh+neNUtWG7SVH1sfEtRyYDJ5ziiqDFn49pUVZbS9
 yMR6BufRHhSll6ERVH4FDNFKxKYwFIibAvH4FhuO2gMOxtlu17j7Ul7Yhgj76IXXNAbbM5ZWFxc
 6qZSdnACVmoEEfUK4grpbIHovoWY0mXfIjXzhGxuQAmenQq6luDYZaQcqqMNgjLrdnWJ8wLnkjo
 t4j0hXeicnOHTtJcls3akv2Q8rl63oKa2+IaMVccs8yojHIhyxzXoiZxq+Wgw6sdyk5HbDy5gkA
 suFBhTTzZ8jMi4SEFCqrsBiNtp4b6QkTNUyXxmLHdRkfov1U+0g3bm1A+Le7cj4tKSeMkVooz4n
 FYy9GSdNaPIGin0fi8qFTJmG/XV9jv0yRAczxxqo7c1kLazkDgttdQZpth7hV18LtgBfk5t6w7d
 7JmdZlG9qY89I+Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The header defines a struct embedding struct crypto_queue whose size
needs to be known and which is defined in crypto/algapi.h. Move the
inclusion from core.c to core.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7de8d2a8f6707397a34aa4facdc4ac..65205100c3df961ffaa4b7bc9e217e8d3e08ed57 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -13,7 +13,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
-#include <crypto/algapi.h>
 #include <crypto/internal/hash.h>
 
 #include "core.h"
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..f092ce2d3b04a936a37805c20ac5ba78d8fdd2df 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
+#include <crypto/algapi.h>
 
 #include "dma.h"
 

-- 
2.51.0


