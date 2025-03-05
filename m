Return-Path: <linux-arm-msm+bounces-50377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 042E8A503E8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 16:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FA5F17344A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 15:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34EFA2505AC;
	Wed,  5 Mar 2025 15:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rFCUIxZj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582CC2505B2
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 15:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741190013; cv=none; b=I3r7DJdo8nMnOPJ3ysYYjbAyK7oswC1kuDetjQ74ICV4PFhCVITabwe67qTGL0fy4Ye/TcRF1WmSGhVdgJ6a98O7228JB6V/39NTYja3stZgUrl+0aY47m241YqI/JJbH53cGzDkjoPcEpMnCoLLe+azlfnuuO2D5J+o4g6HQ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741190013; c=relaxed/simple;
	bh=7pugq9Q0HrD0WFy5Cy7xHVcUHRDsYuQl+Ilp5KZtAgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C1R26GZErANGb+tLr4Ypw68tz6ERRJVuLBK50Kp1IMOGgAHIFDb9k66uatx3V303RioLVLXTeinwybwkZb6/qGVSf8e7GAvH+xMtm2c63tH2bZcINufni4rkm04AQj3t+JlMG6uRSwNNveIWNEoUAoCe6HxYwC12Itq0eWBsS9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rFCUIxZj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43bd5644de8so8397665e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 07:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741190009; x=1741794809; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=95chebkxx5uPpuk8Hf/uN1bb/WBC6Ds7j8DqJcXx7/c=;
        b=rFCUIxZjwzGncw+CJ8ac0yOnBxwosI+HlPG4hdlWTffVVOJ2Y9HKgp/qgGnFUDUwRE
         CB8w+WHFjdGDAJoXgep8bFA0Yw40X8jbbjQ0+SVzMn9MaQ8WVSwEW9CwUCTKvIgvFHsl
         7Wxc7WCH80enkOsVwm1RJ8Q8eL8OlvDMReiHYr14RfWCZb+IJGZbaHx7NMO5fC4LbnSk
         o2gLZrHAS00uk2UHuhlfhBazO4AjzZHswfxQW39OQhLhNScoVY3ruSNJ2byJGN/I4W95
         Pv4+KPOnBjRmw8cjxm5JWY+MaYe5RuBkXVHnpLJUJdphZqzG+e1tLK0PjY3ASL5h6oMO
         pbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190009; x=1741794809;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=95chebkxx5uPpuk8Hf/uN1bb/WBC6Ds7j8DqJcXx7/c=;
        b=BgDs2ni80fA999A3b93esm1CBWwuUgLJEctdu0sb55hp7EvflvoaYn3lRObEQ3GQQ4
         v0BHnwKft8SCKRjDQdc6hwjhsRCzkNM2rOSgW2b4rciIfsVrrjRCTwot/UBHwAa4acvH
         31Hjxjd8MU9Db2yMwz6Tiw0MyLQEIP7RFZTagp3vVocGg3KxiFHLgFSZ9jUGcHFlgCC7
         Tc3d7jQbfOEy2Axt03WcXjFX+KuUFLzYZytjOuG8X+GnsdUHkRri0BSLNHAg39Z8mNLz
         NLHsiWPfpFQM1jBGwUWHGoD98DOR0RIpnLXiNiUPVgVYbg/npe8d6VjwlGT4zUvalPOj
         rk/A==
X-Forwarded-Encrypted: i=1; AJvYcCV1dyqRT02ZG3+lYTht1JazyhkLAAz/y7xd5etwKUY5w+K16+tt6VyCggOM72yw4qI8taCbD5VKdInMX2Op@vger.kernel.org
X-Gm-Message-State: AOJu0YzAwfWlGdOyL/ONbBCgh3zHY16AOg7QrcnZ8FiE7AmbZINC32Hq
	6ULxn9U093ReJVCba/2BZJj+kmU2YQRspmpScASZYHFlQpYb8QyckoJJC3FQMRE=
X-Gm-Gg: ASbGncsNx2846+w9lQxtTKiigu0v9HJwxgSjXX+JEaOt+/1NE5fTL/fn6VwII0QHrDZ
	PZ6H9YW8kNqdIoT27axle2/QDM8q69ZOb33tvwV5HPSqHZ75uhLpxBAf+8BItZ3iPRSRDYkaLEa
	tngWIJLvZs/UCAPt5gGNczYYio+u5N4tuchd1v8d7l1j25MwqFcfPvZ0yJwCX/wrZEaGq23Pvvh
	Qu65aKyF/vj01K9dynSfMMsBP3FBzbP16H1FsJhvYBEIMiuqhuXzjuDt2W1WE9mv50ZZ7ZpdP+K
	k/A5rQ2g2kNyF9sYPT6mZxAAVbMa7RphrtbJnu6uSiCgMaxogw==
X-Google-Smtp-Source: AGHT+IG46qG9NZg5asWLlzpx5UNbKVYGM9zYolGfR5W2sKaY9Lf5cmP+PeNKMAFOBaBivIz2363Meg==
X-Received: by 2002:a05:600c:198f:b0:439:9ee1:86bf with SMTP id 5b1f17b1804b1-43bd294309bmr36486625e9.7.1741190009583;
        Wed, 05 Mar 2025 07:53:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bd4291ffbsm21180345e9.15.2025.03.05.07.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:53:29 -0800 (PST)
Date: Wed, 5 Mar 2025 18:53:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] accel/qaic: Fix integer overflow in qaic_validate_req()
Message-ID: <820aed99-4417-4e4b-bf80-fd23c7a09dbb@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These are u64 variables that come from the user via
qaic_attach_slice_bo_ioctl().  Ensure that the math doesn't have an
integer wrapping bug.

Cc: stable@vger.kernel.org
Fixes: ff13be830333 ("accel/qaic: Add datapath")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/accel/qaic/qaic_data.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index c20eb63750f5..cd5a31edba66 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -563,7 +563,8 @@ static int qaic_validate_req(struct qaic_device *qdev, struct qaic_attach_slice_
 		      invalid_sem(&slice_ent[i].sem2) || invalid_sem(&slice_ent[i].sem3))
 			return -EINVAL;
 
-		if (slice_ent[i].offset + slice_ent[i].size > total_size)
+		if (slice_ent[i].offset > U64_MAX - slice_ent[i].size ||
+		    slice_ent[i].offset + slice_ent[i].size > total_size)
 			return -EINVAL;
 	}
 
-- 
2.47.2


