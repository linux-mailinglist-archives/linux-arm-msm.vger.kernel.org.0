Return-Path: <linux-arm-msm+bounces-74061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D531CB83E91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 11:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7EEA64E0663
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 09:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B881C2D593D;
	Thu, 18 Sep 2025 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cm3gFDaL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D062BE7A3
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 09:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758189033; cv=none; b=jheBvHjHDG+OiugAOOgn9VTkxGx+5uts0lY07iYz8d8WpQ95hHn3B7xE+xvR2G2OhpKGRdWzOTYBWeZg+KMaRXDNN8PMOvrTvTsAuzS6jHV+lKh1v+AitnlwD63XK98k6+QQEE8GyMRCv83cIai9oowM16QZeB5xUfiZAsQnUPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758189033; c=relaxed/simple;
	bh=qHLJX/TtpVtJetIsYqyBWRD9Yy9lM9oH0njdixetFrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j6FFrNM2Nc97yDxasSg0PyHK+CnKAJd4+4KjYGPWIyWjQwc6LWxQYSWXcZWYHKXyTf7sukLfAgCyCVWO24CXtbnQdPYeujyB3sODM8i7SQra+WA6D/tCBBIBa2g9PvnhQb9vvOddp55gpruuwnrypl+JPiTQ1sZfsivEa6h8+KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cm3gFDaL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ec4d6ba0cdso547388f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 02:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758189030; x=1758793830; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQwKqTQzxVu8vPTkPS6AVCaGBlFPjm0mxCJ88MPBe7I=;
        b=cm3gFDaL0oJjGb4Xa0O12OWm/ZzkJJkpTchRc9XSNEEJ5168AitPEYTZ9qx2o+JwZd
         7RBIwOka/wkQCsAlYtbCIIBftfAlh0vey9KBFPKllUZ/Z1aLPei0elc78W3zC+1zWBgS
         /j+Ypdpr/gxDpgzQ6q/MN3ii18TXCQWm4dIz5Zzz9eZ0jX5FallIpoNldIIJH60RfYug
         N0yH0DFaOeTGPnv70Jq8USf8GQF+fU3zuQhjXbZgcaZobO7oxMoQnZDblht5HHk3RzpO
         GGDO1IuNZ3V0Cd9OOOOxTTbmO6u7vAypoos5ojI65P2QQENXYRoVV7Dytm1N/Nk6ExE/
         mmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189030; x=1758793830;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQwKqTQzxVu8vPTkPS6AVCaGBlFPjm0mxCJ88MPBe7I=;
        b=UBFklNC1n0C5QId/gyxCeoJJ02Z4rx2a3WPyATfTh4uSN8IOnwhzGe+a0dfS580ngV
         VGzZmD1lB3zHrg2lUMjGogzypfOdViHEgIp9kTuwJkDIjTmOZCi0hyS8jyufemTDF6yU
         fQ0PjNX1yKynzaoykdOeYfEvUf6/qSG5D27bjWAqJnG+jxPNlIn2AOwCOyUr7DiTUt5G
         BddWlr0S/eD+zZu1s+RixMR+zUl+27U5gcFezPe6SHHbBnC8tk5WMrXbP4iwcG3CaJHX
         7vyyp2tc23kMdzYnLG3vQ+M0h05pDmSGJAwrvClY8QF5yIbVJR2jP24Tlhs51f7m7x6e
         AxkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMoLs24kjk5MJA8fVpGYWI5TzUdQ/26GuUt9fe9eepgi+P4HDGG4sPmlhiMRc2mI+qZ5gfORJRnX3Wp2BZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwSPYo7Tq2u3wXEx3xVx8mWWbdJ2mFjCO9HA1bAdt9QMKbWm/cY
	8LevWZXkPk03b1B5qcwkEmc14enjkuAFjfjsujLFlA5kJYsjQmTJRQnwOQ8w7h5q+wg=
X-Gm-Gg: ASbGncuh9kUWMWAxoanwYPf1NvD35yixRUFGQRQ3Q6MikLytLNhLch1Wc0IS6TEMNZ0
	K4BeGMn3VtxvJtamQzSKkNeryrFCRLml7UjSCUJs0uVeqPP86p6CZqB9k4hu7XxqSOxIQm/vNOL
	CdrDFZ8H1YT9g0NNF6vo+hYL8Zu3JSJX9uJOkNla7rxqj729NON4suTFry4Rmhk1DvXbGI6Av0h
	hZN8s63FJ/IEGtZEgdB3ysG2232rBP9ym1yi7xnSu3ENWuOgheBz5S597yxh8Xsr2LpVuxlZjPp
	Ye4Txz0WoOvp2W9tMux+Q8w4Hnj2Jx7LBFI3pDKY7iZrl2SRv7LYgl3ZYMN9hgdZbz2+vuP1md/
	Y85wgS+1UpAYafeDKWLe7MP+FlO7mrr5F6wcSgwuFgyFKPQ==
X-Google-Smtp-Source: AGHT+IGoCMIZSYVGVdr+LonBDIWcYYTv19TLhpipu3kLj9HY+JsSF6G9ZNs6lLtq6lsBFQeD0PjV6w==
X-Received: by 2002:a05:6000:1a8e:b0:3e7:ff70:1b41 with SMTP id ffacd0b85a97d-3ecdf9c9fc7mr4630089f8f.25.1758189030108;
        Thu, 18 Sep 2025 02:50:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbc7107sm3078259f8f.30.2025.09.18.02.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:50:29 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:50:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] tee: qcom: prevent potential off by one read
Message-ID: <aMvV4kK386Sni10i@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Re-order these checks to check if "i" is a valid array index before using
it.  This prevents a potential off by one read access.

Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/tee/qcomtee/call.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index cc17a48d0ab7..ac134452cc9c 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -308,7 +308,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
 	}
 
 	/* Release any IO and OO objects not processed. */
-	for (; u[i].type && i < num_params; i++) {
+	for (; i < num_params && u[i].type; i++) {
 		if (u[i].type == QCOMTEE_ARG_TYPE_OO ||
 		    u[i].type == QCOMTEE_ARG_TYPE_IO)
 			qcomtee_object_put(u[i].o);
-- 
2.51.0


