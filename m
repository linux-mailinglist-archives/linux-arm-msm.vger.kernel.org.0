Return-Path: <linux-arm-msm+bounces-50627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 285F0A562B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 09:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19A593A8BF1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 08:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34EBA1C861C;
	Fri,  7 Mar 2025 08:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jrvDyhFs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627241A83FB
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741336916; cv=none; b=Llz/QWczQZ985bI9vuFhgrfoH5J42Wccf7d4h00Nhfji9J5qSsYyLfiG0FVHz+C8K08WSmRvhoFKMKZ8Zn274bYzMBJdDhKmOMAZbfJL4KkkDDgmP6c2q7cOg3uxyU82IvG+UELIwFXDDbXvkYpxYf4ZDccvNg9b9O/fYCaNfcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741336916; c=relaxed/simple;
	bh=a8OMihBwCzHSd0Lvzlm95VVhIx7Ja/KJZMqjMUoCLBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GIYwS52v+IERugvK4RmT4OJsQpsT6NVs54zXHbPw9phXGollmUm2dPDRd+VgZMQOCaBHloi31VxKC2cO6hDbbM33HsgBgHDlSdzH+Pxy2AXG1AcCPLp3XTpYlPLfrrg+uYm1mxCk5Xm9hNnwEPPk/TGz9aGEQtOLg5wukf8zItk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jrvDyhFs; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43bc6a6aaf7so12171165e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Mar 2025 00:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741336913; x=1741941713; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=61P5O7FM4Ars9KAhbX4e1GUUuxK+iGoXonO6kXuEFR8=;
        b=jrvDyhFsQEcIS2z5qBEjFxNWGdd3/Qpm7Q8StKbUwg3x+sSO9QovCEKZRvxc6t6OvH
         qxu24OskFN+DnQfK9L1Y6sxoUPimqiYuVr5EhY25w5/KH0szeQ/9mywq59KMaHDtzR0U
         Bm49OxAGp2izKSjC46AdIDkonL0BqMjSeKMtww+TENgCWwH2/w7pdWlJA6bm6vjJ0H56
         igK4Kt//SIRKmLK+vzlXpx7snp9Mub1xYB8Mqwz0kZ42ZsSycid8emgOLlj7DLdEkw3P
         4U2LU3wOdmbNWWFj5fqPUTFoPTWcMDAKJ8a5TEzdDsDuye55mU+V5rnawFLwPVxq67k9
         H1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741336913; x=1741941713;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=61P5O7FM4Ars9KAhbX4e1GUUuxK+iGoXonO6kXuEFR8=;
        b=ADRji8B6yf6x40/q26R4G64TFbehHzR+1FslOHzZ91nuNnf0vLMwIp7KuzzR5CY386
         3ngVAYELjvmQQJbZXyTfAI0ZhvGs8SVGTXiIsKjoU4uBTxSrFynpOKB9amzYX8sA3pAX
         lt5qDcJJlshEQ16+ZmervvCRHHeP+MT67M6+ghPPOQsw5JD3S0g5S0GZnv6Vw7LmyKRa
         7moSbgQ1KIWAXOtw+KUM8Z4F2EIJgzgmOWQrudVq2IJumxtzlz2t2zT23EWKECWlWkLM
         8u9KfmWye/jGh/Z3+j9abbbHyQ9wcCrUQIAWAW42uv2gy68tKZ/cBv4cFFu6higevRJ2
         J+sw==
X-Forwarded-Encrypted: i=1; AJvYcCW3brHvKjxJuNgp+LcFcBh/S1J072UcDG5GBGVFVIkAE99MGcUcopVAvBoSN2Qac9DBhJVRZXJ6d70Y+XUm@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ/rwgeFeF5DUjH3yd46x+X5cHSXUE5NXjeHVV7kgBm2YbqHNa
	4fCyCKzpeUhP5UdsINFzPY6I+ky4unkFlycO2pGO+puYlBEnP3FsMCDXPOKYDY0=
X-Gm-Gg: ASbGnctX6KQ/aULYa126pfFZgEP3wC/JFPoMYelihY5T09V0wHr+3SVCO/vv/cQYzFJ
	zOCg32vnL7/bU2K9i+Qt10h+j4TbR2HlRAqpOKA3GM2sj2GRl78uqtIGIIWoQBtbTMG6H/kzBKD
	tsa2Gh5IYNcjyThGub30K7hcdscmcYIOCF1rqFdvYOnQLFcv91B1+/Cu5viIMUHRZzaeE4XTwgi
	rIhwYO0RhC252zd5aqY8Nj2e2b07qlfJkXVLZAw0gxlnx8mAr+87GjeZ2X849Psgjmmj1jVq550
	SSnLW1ceJjxsFiWQmmlvQplUczsyYvR0DCDJhQCsYYDDmZ0ypA==
X-Google-Smtp-Source: AGHT+IGbfL4bBdca2EaHCrCPhox+++ms3htL1SxrfFW81lxG6BAaIMYQupukozaB6u/ZExtXcwAGFg==
X-Received: by 2002:a05:600c:4f87:b0:43b:d025:76a6 with SMTP id 5b1f17b1804b1-43c5a60a0edmr17752515e9.15.1741336912663;
        Fri, 07 Mar 2025 00:41:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c10437dsm4722937f8f.99.2025.03.07.00.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 00:41:52 -0800 (PST)
Date: Fri, 7 Mar 2025 11:41:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] accel/qaic: Fix integer overflow in qaic_validate_req()
Message-ID: <176388fa-40fe-4cb4-9aeb-2c91c22130bd@stanley.mountain>
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
qaic_attach_slice_bo_ioctl().  Use check_add_overflow() to ensure that
the math doesn't have an integer wrapping bug.

Cc: stable@vger.kernel.org
Fixes: ff13be830333 ("accel/qaic: Add datapath")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: use check_add_overflow() instead of open coding a check

 drivers/accel/qaic/qaic_data.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index c20eb63750f5..631e401fbe4a 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -554,6 +554,7 @@ static bool invalid_sem(struct qaic_sem *sem)
 static int qaic_validate_req(struct qaic_device *qdev, struct qaic_attach_slice_entry *slice_ent,
 			     u32 count, u64 total_size)
 {
+	u64 total;
 	int i;
 
 	for (i = 0; i < count; i++) {
@@ -563,7 +564,8 @@ static int qaic_validate_req(struct qaic_device *qdev, struct qaic_attach_slice_
 		      invalid_sem(&slice_ent[i].sem2) || invalid_sem(&slice_ent[i].sem3))
 			return -EINVAL;
 
-		if (slice_ent[i].offset + slice_ent[i].size > total_size)
+		if (check_add_overflow(slice_ent[i].offset, slice_ent[i].size, &total) ||
+		    total > total_size)
 			return -EINVAL;
 	}
 
-- 
2.47.2


