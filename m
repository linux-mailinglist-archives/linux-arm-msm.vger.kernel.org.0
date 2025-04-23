Return-Path: <linux-arm-msm+bounces-55089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA2CA9838E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 10:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CADC3BFC71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 08:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7B028935B;
	Wed, 23 Apr 2025 08:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j4NijQWT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BDF289358
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 08:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396641; cv=none; b=JboMV9phU1/w0liPCQcOIUzsI45lv7GxdhZYdCvejMIsAJVdsihTWGy9sxC4V5XqjmgBPCdPWkOG5Tq45zXPMKNtcTCJuICHs8TA/wSdZiDGKDe3LtsXiP5G6As2R+wZz3CyYk0hKKmdniXGRXFK0E6WV7EoWMoZkcD5yta/fpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396641; c=relaxed/simple;
	bh=9AoM/AIPb3N4elSC5sH2DHMkFgmxak1AJlaKm7usVmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AjEJODZClq0+Paxldg5KtAFXp+uoW0XfhYVeSSUWA0FbhFVIuEm9dWwOoyxw4f1SSECC0M2qi1yE+gffZu9OfIZG+0aGUvbvnMsSu6gh4dTdIP9kQQPIpv57vuKJJosyRp1J1yWCMm5i1CZ/NOaK/8Kx9H8SbY45HscAwRtIXf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j4NijQWT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso51325825e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 01:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745396638; x=1746001438; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y01SW2UsKHrmSkBJiFRdXdGr5Bt5eDkwEO8sgbkacPw=;
        b=j4NijQWT3Gg1tDJocMoFEem4SPvLpQNMi3fnLglvwIhwRm06Ip/qae0ZxWvzzh55Gh
         EhYRxQzZj90KqHQ4+Ae07w+kCu0BAZEj4+VdXZg35PXNGRzV3miI6t6OIRWnbU+bQkJR
         ABNtMCpXYSdB6g1bEQdzWBJTbSXW0Q+xtlxCSDaegFVTC+d6rN6N3xopJEBu25/7tveI
         UMfl4ksJpz5FTbqR9+UfCqTlGh4Oey1A8XHo5/EwBCV3XJ8gLgYwvS0mRs6OfWJUZJei
         TdfG8elIZnZswCnnVM0OCBXUrxPZCwnLHWHFO8qdoJ+Oe0CqXcMi8tYdW8luSz5OLmSK
         vhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396638; x=1746001438;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y01SW2UsKHrmSkBJiFRdXdGr5Bt5eDkwEO8sgbkacPw=;
        b=iW7BqbcCf4VCLEVA3I0pGZh38nO8mgb4BfnY5HGYkxgi3uIJfI6Z20ESxd8JouX8iI
         SCcLKUdeL8kDZMdvyk68YBpjvxzXNSqOYfCQclelDZp3GTc+DhF5ia19AQvb9VZwkiQv
         KA0d8+QjPbmP/rKudJa6TR+t6QXGYWiThJxLYNWyVlgSGTuhuZlzYUqtdchjn3mU+upV
         UWJlnXQmTYiuDu+U1wtsZbQwAxMpXNjJtnql3JPrtFktmrv33k+NDR6GtTklYFvq15XK
         6+NDcAG7/cJ+yTGGO7IamaixfdxIWNJt0u/U+L2/AQCg1ITCo6HA0KAzAPoX3r/wkU8D
         t4Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWJqx6cObbp5v/MBUN2NmX/lbZJKEfiZenN8CCobBGbx2J6iLfOwUPr0mL184H0/abpFIa07FCz268BLCsN@vger.kernel.org
X-Gm-Message-State: AOJu0YwyqQjJUWvO1lO1Xh9lRAVkoDzwGmWly2B/G4CIbAU4XMwaVIaU
	6wEmP5ZfuTJRD1sZs4OHXRUUq6OVlqyC++THxqmrai4rdYC13llPG4OwcwvUSEY=
X-Gm-Gg: ASbGnctQWgXJ8vDiSwGCE8zad61cTLHXgAdfOXP7zahJRl4AblBG+0xSMagA5SZNfkH
	tdJOHZZrTDtsol5IZvA2pxjlc66J3MMEoOKoPqm0MsWti+/KIGCLSrIdjM8ss5H0ljVxB/v6Y/P
	iE3dZByBIt7X9RD1V5q/z2pfzCVccUjq41/K5p71WH2LHC+0ak0+f4Ed/OTl4LEnupaUxsygAkv
	wUNserU8sl5KkzgE6lTLZQL9w7A7fxBkNx+/1BzXE+epw5LXzJRj5IBnwx7aFsoWAD1XLXdA6lF
	PMwJEdtFD+vy35YmPOgB/aOHXyshAv6nQZqVGiuDLJ0iHeqtRRTTYsEn
X-Google-Smtp-Source: AGHT+IECPr27/stUCSI1PWk+UsjbUIKYWkA1fnIwKTwVRmawMohMG5diVeFjOVyCEZb5VbXMG1aMDA==
X-Received: by 2002:a05:600c:4e52:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-4408efbaebemr33514505e9.26.1745396637683;
        Wed, 23 Apr 2025 01:23:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092b0a52asm17463555e9.0.2025.04.23.01.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:23:57 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:23:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] usb: dwc3: qcom: Fix error handling in probe
Message-ID: <aAijmfAph0FlTqg6@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There are two issues:
1) Return -EINVAL if platform_get_resource() fails.  Don't return
   success.
2) The devm_ioremap() function doesn't return error pointers, it returns
   NULL.  Update the check.

Fixes: 1881a32fe14d ("usb: dwc3: qcom: Transition to flattened model")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index d512002e1e88..b63fcaf823aa 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -740,15 +740,17 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	}
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r)
+	if (!r) {
+		ret = -EINVAL;
 		goto clk_disable;
+	}
 	res = *r;
 	res.end = res.start + SDM845_QSCRATCH_BASE_OFFSET;
 
 	qcom->qscratch_base = devm_ioremap(dev, res.end, SDM845_QSCRATCH_SIZE);
-	if (IS_ERR(qcom->qscratch_base)) {
-		dev_err(dev, "failed to map qscratch region: %pe\n", qcom->qscratch_base);
-		ret = PTR_ERR(qcom->qscratch_base);
+	if (!qcom->qscratch_base) {
+		dev_err(dev, "failed to map qscratch region\n");
+		ret = -ENOMEM;
 		goto clk_disable;
 	}
 
-- 
2.47.2


