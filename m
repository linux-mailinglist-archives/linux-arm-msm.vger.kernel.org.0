Return-Path: <linux-arm-msm+bounces-31031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9067296E6C8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 02:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FCC31C22406
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 00:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B6DC8FF;
	Fri,  6 Sep 2024 00:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rc92PhVl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09BA16415
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 00:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725582342; cv=none; b=E0UuqPxFmtertMW1Wkk7umsQfNtHea0WZOdK7ZpgaGPNk92rgMqr7CKCf8FwcuDBHixZUgcwMpAknRcSj87IBkdsCPzIC0ROR21TgcnFrCrDl1K2LyRwky3Oyd1xt7UuhuO2d+xNq7YTTA/Us/fLBIC4qbEccrqlqWafS2o6q6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725582342; c=relaxed/simple;
	bh=xeoEgQHWnJv9aAUQ7kLmifOvd3ou+ngyzhfdJVGfNH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-type; b=TEcwOsP85dmYZEK2dEnxUNmhVqpr8MJmigtPFrAxCqLkASei0usaeQMCKN9XDvZGiFjtc3YzXlwOC3kv8H4giVO92fkD03SltkSI7WFJ1R/4OIZDwhL/pUXMOzkvf2ybwXAfrs1/KJfWBXnnezhMx/C398RWj9K515jMNx7nQ/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rc92PhVl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725582339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:  content-type:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zFmgUYgQ8XPCtLmWU1gSlO7qvWg2iDsHAEghO13whZ4=;
	b=Rc92PhVl/bw6xrZ0HQoGYlbT28K0u0n3uxY4V6ByX5jUROIfJLJXyUh6JQI+VJON7p0jBx
	7lQ4FqEgx5JvWan50aV1pL9Qf6tgHCAHG0hTbm0d6Hoh5Fcry1P4CWFFwkgvRjj5YIbulv
	NkIJ5cWJjQ9K4iYZ8fraMJbwceUJjCA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-W1YHWdwhMCOSEk7BS8Cnnw-1; Thu, 05 Sep 2024 20:25:38 -0400
X-MC-Unique: W1YHWdwhMCOSEk7BS8Cnnw-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7a9607064cfso253855785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 17:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725582338; x=1726187138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFmgUYgQ8XPCtLmWU1gSlO7qvWg2iDsHAEghO13whZ4=;
        b=uIUviKozf+/aqJ+9ynuios5HbOYtpwqMTJz8ny5viKxu0xmbF99WgfuL9P6OAT4JGF
         5+X5VfLr0Bm9MxNqeh8nMXUpg+NDmz1ol4VyrUGNiJfTYUj96cGLH+Wb+J3AFmHunVPT
         E/cQxGJVYK2pJHQxpeV6kzBi7Su0jfomwe2cq/RGDQnzidi49c0SLqKIyYH0s9fUYly3
         LQlLzz5XPCCOH670pvDB7VWu7xABRF7XSrLYQAizF6mBlWxswrpQf8nb2alcoBT2pSQx
         2nH2Y8vZIREWjZLe3c4++X4oIR3GoA3GMf+yQzM45JiI24QWaIc0tiKD+e238k60rJhz
         O9Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVz5z3c+CMG4CjSmZd2+JZmJKoNY054p4ypRn9mgeyGR5kh4jKRHKTXM0Fmt+ZLVOlzN19dp4tfJ1liB6xS@vger.kernel.org
X-Gm-Message-State: AOJu0YzGmnnU5m0ufGCzGG6Vu7L12QWR/2PxIcsPyMH+Wzldf78JEsw7
	vj12PY5sx2Mqfah+EX+m+XrBV/ZxrzZUBNvl8qX5ivxaGCA8oAO861BuUMb89/kE42K/mEuFpol
	q4p6awzAMEzGA4ABqBmcWQbfA0/4+ZZLxe5S1JbXDLWeoIxsQSzpBpbRmHyNm3H4=
X-Received: by 2002:a05:620a:2891:b0:79d:6d7d:e5b3 with SMTP id af79cd13be357-7a8041f4696mr3047811385a.42.1725582338085;
        Thu, 05 Sep 2024 17:25:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYQx7/fvvOSNZf5EqatDNkGRptl/2APlKW+uDWTwN3cDQR0sw3Wju0jKTNyuHCb5DTaeJ5tg==
X-Received: by 2002:a05:620a:2891:b0:79d:6d7d:e5b3 with SMTP id af79cd13be357-7a8041f4696mr3047809285a.42.1725582337498;
        Thu, 05 Sep 2024 17:25:37 -0700 (PDT)
Received: from x1.redhat.com (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a98f026309sm120779185a.128.2024.09.05.17.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 17:25:35 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: herbert@gondor.apana.org.au
Cc: davem@davemloft.net,
	quic_omprsing@quicinc.com,
	neil.armstrong@linaro.org,
	quic_bjorande@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ernesto.mnd.fernandez@gmail.com,
	quic_jhugo@quicinc.com
Subject: [PATCH v3 1/2] crypto: qcom-rng: fix support for ACPI-based systems
Date: Thu,  5 Sep 2024 20:25:20 -0400
Message-ID: <20240906002521.1163311-2-bmasney@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906002521.1163311-1-bmasney@redhat.com>
References: <20240906002521.1163311-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit

The qcom-rng driver supports both ACPI and device tree-based systems.
ACPI support was broken when the hw_random interface support was added.
Let's go ahead and fix this by adding the appropriate driver data to the
ACPI match table, and change the of_device_get_match_data() call to
device_get_match_data() so that it will also work on ACPI-based systems.

This fix was boot tested on a Qualcomm Amberwing server (ACPI based) and
on a Qualcomm SA8775p Automotive Development Board (DT based). I also
verified that qcom-rng shows up in /proc/crypto on both systems.

Fixes: f29cd5bb64c2 ("crypto: qcom-rng - Add hw_random interface support")
Reported-by: Ernesto A. Fernández <ernesto.mnd.fernandez@gmail.com>
Closes: https://lore.kernel.org/linux-arm-msm/20240828184019.GA21181@eaf/
Cc: stable@vger.kernel.org
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/crypto/qcom-rng.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
index c670d7d0c11e..6496b075a48d 100644
--- a/drivers/crypto/qcom-rng.c
+++ b/drivers/crypto/qcom-rng.c
@@ -196,7 +196,7 @@ static int qcom_rng_probe(struct platform_device *pdev)
 	if (IS_ERR(rng->clk))
 		return PTR_ERR(rng->clk);
 
-	rng->of_data = (struct qcom_rng_of_data *)of_device_get_match_data(&pdev->dev);
+	rng->of_data = (struct qcom_rng_of_data *)device_get_match_data(&pdev->dev);
 
 	qcom_rng_dev = rng;
 	ret = crypto_register_rng(&qcom_rng_alg);
@@ -247,7 +247,7 @@ static struct qcom_rng_of_data qcom_trng_of_data = {
 };
 
 static const struct acpi_device_id __maybe_unused qcom_rng_acpi_match[] = {
-	{ .id = "QCOM8160", .driver_data = 1 },
+	{ .id = "QCOM8160", .driver_data = (kernel_ulong_t)&qcom_prng_ee_of_data },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, qcom_rng_acpi_match);
-- 
2.46.0


