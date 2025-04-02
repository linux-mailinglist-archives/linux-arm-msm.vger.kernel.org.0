Return-Path: <linux-arm-msm+bounces-53024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DC9A78CBF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 13:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 370BF16E582
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 11:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACBA237180;
	Wed,  2 Apr 2025 10:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iizv5asM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC6236A6D
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 10:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743591597; cv=none; b=WNGWTrD/vTthE/39qBNXFCP7eKTxMxwNiUbcJjZTke+6Kac0USV+TmQVT0xGoCrzLIKk6Jq0qH38vfnNHjwRTI0tNAvxUBO1rvMVKKZXDs1w81mQ5SagLSxTtpEq4UZ4sqREyqbhn5pm2mknDddthGd2FG2bJEyDQE24isGC5hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743591597; c=relaxed/simple;
	bh=9yLicTejlhArWUH0AESaCnDBxMtBvX2kpvdlV6B/8A8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XqVwYcOMRezCQGd7DQV+zeFS93ivEh6EKrJ8EBzfdI6K4EQ2ciQsKxVkCpE5GbmlvkMxI5BnZXOvmLU/gZwhPr18uwzAH/06V9a54htQ3Qzxmc3pXXHZzHqnzN7uf35AQozCE4nnoFcHQCpLLcPsTkWHClx5ZSYBAhKr5bTEW5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iizv5asM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso62783665e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 03:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743591594; x=1744196394; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GTwEOtU7c1REAcQAM15r5ogMxhu3BYdLhsrAnf1aryQ=;
        b=Iizv5asMiua2B/rjAMbI9R+nt0nkTUhtyFlelshY2Wc1P0HyQqOnqQzk+Mv/hyzObm
         Dc8jqEE89lm1+yJAAh1rfPd7s7zUhHqbMbljqbfqwxWmpIBhMszoHJ8BBd96HqE9aA0u
         Ai94zMpUf4M9K3Do1o1hM6ps3SX/sz9b4h2Gu+2X+SBVPTzyiYD38cd87+mCKp/LQpi/
         yuNqP+1DdQjILH0I3BOArl/Bsnu2OrWbBC0pMBejLPbb88zMn+j8dX+on6K4RgwJ41HT
         W92fHWDaTUae5NCiXX2h/wlVrYFSX05BU7GZaJpUxX+eBZWhW8gWZW5N1S0mHfRXbaqE
         7psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591594; x=1744196394;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTwEOtU7c1REAcQAM15r5ogMxhu3BYdLhsrAnf1aryQ=;
        b=GLpkUvYD2TbAkKEjXX3cTnmPv1ePDcRgJvHm2fMIcBUyoRzat4iR0vMmrKmgrUlwOl
         H0vmK/1cXNhO7YmIe6pgIctl34yRairU65k4g3iWSyMjSBHC2iv9xqRTNjmwPYh0Z8wg
         5w3cHkfTCmHZ0arC1ZxHjQu1xLulWIqoRDYrQJD7C/MZ22vuyra1p4evDAG9JYfIKdLK
         Ka0HwCVGnlHJfqFoyueOH9M/RckhKtz0oSaUarYo57iGAlgIsag2+36rXHnHpaZ8UktB
         g0V7WQSuwnCKhF2kGK2jXSZtNmbKtsa68RKBTpR3zGBuYFyVEWp9RxFb/r0F5Ld1w9vv
         okLw==
X-Forwarded-Encrypted: i=1; AJvYcCXhDwBNaZHhC8i9zNQDnYSo2OaHWZkmMILMiKFxidz3DGbkeLUv4nHNdTvJuL+PA+gmHYtx/daIOkvWNjmi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Bz9BYXjujCC/vFotFIf0YQQD9D46djAdJ04ZP+GAekLg/Dbh
	ozUqe2PoGuV/jwoiGBlK8Lp3+Jkdw3fJ4Mexwi8vQ8VLNX3c+ykWqAi6KPIZG+4=
X-Gm-Gg: ASbGncv5PtIFzpRHpbnCpdctb/Ah/D094vQN1EvEFz3drzlhBXk2cq+wz4WY8maoVGG
	mVeY020PN9CdIvNsai/oWK0+Xi7MPuXpZPQB9MQ33eNb9bjLkG/xhvxcSIXamFSnc+H7f90BvoO
	5HeKwsDKvq/qtV/OfLActaz0QxCz5HIyd4JoaIFWYJqDziMXA9cSOY+aDoqB8qMLopnmSdst9VZ
	c8ubu9D+5DSfSMoSKMCbYPXvOgH2Con+jeuaM62nz3GHqJrVRrAJ+adQgk6iES0E7/CIVvuCr1H
	7QIZsnB4fGsvS3QrEMZfrOIzGmVrdrEtrBGI0hlXKepRdmwjyA==
X-Google-Smtp-Source: AGHT+IGo7cTRo8kiQ/h++DgBA8RW5r2euHnxHw/uTOTKv4yUHsRawjSowGFkmPkzcA245vQdY6nlTQ==
X-Received: by 2002:a05:600c:46d1:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-43db624aed9mr150397785e9.18.1743591594310;
        Wed, 02 Apr 2025 03:59:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43eb60d3627sm16842805e9.24.2025.04.02.03.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 03:59:53 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:59:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] remoteproc: qcom_wcnss_iris: Add missing put_device() on
 error in probe
Message-ID: <4604f7e0-3217-4095-b28a-3ff8b5afad3a@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The device_del() call matches with the device_add() but we also need
to call put_device() to trigger the qcom_iris_release().

Fixes: 1fcef985c8bd ("remoteproc: qcom: wcnss: Fix race with iris probe")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This patch is based on static analysis and has not been tested.  Please
review carefully, etc.  Another option would be to call device_unregister()

 drivers/remoteproc/qcom_wcnss_iris.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
index b989718776bd..2b52b403eb3f 100644
--- a/drivers/remoteproc/qcom_wcnss_iris.c
+++ b/drivers/remoteproc/qcom_wcnss_iris.c
@@ -196,6 +196,7 @@ struct qcom_iris *qcom_iris_probe(struct device *parent, bool *use_48mhz_xo)
 
 err_device_del:
 	device_del(&iris->dev);
+	put_device(&iris->dev);
 
 	return ERR_PTR(ret);
 }
@@ -203,4 +204,5 @@ struct qcom_iris *qcom_iris_probe(struct device *parent, bool *use_48mhz_xo)
 void qcom_iris_remove(struct qcom_iris *iris)
 {
 	device_del(&iris->dev);
+	put_device(&iris->dev);
 }
-- 
2.47.2


