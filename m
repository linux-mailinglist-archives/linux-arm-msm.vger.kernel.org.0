Return-Path: <linux-arm-msm+bounces-13174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F6F86F5AB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Mar 2024 16:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 337CEB237A8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Mar 2024 15:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3375169E06;
	Sun,  3 Mar 2024 15:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PV1L2Sxa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D75692E1
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Mar 2024 15:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709478093; cv=none; b=R2qZF5Wu0S2yXOs3fm7yQYjHrvhW00AbtsBluEvif9S9ItSe4FRfDp1WW4DKmFy1lpzlxz4+o1zxOCmmJDg5RoWrRCOvt5n0LCQqUIh9HvIeaHv2eprcMyU7dSAfNyJLfSQX/D7pHSiaVd7yQqJXy6CEM4/rPhXm6iwrS5LODpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709478093; c=relaxed/simple;
	bh=yG+TshWtjJCiqqxLLFxJZ8WZUu8dYiNTiWAwfrTaYNc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PkRLAJ6w7LwUim/QW/PTHk0tQdcladKBbLHPw0oh3av5fTwKUAPN0lHPYuteIhYv/5ZI9fLz29YoDj4e1VNqGQn5U0mTAydBSmzbY/OUM5Eb5Lc2j6HR7m5PJjPdj7nUe/ER7J4IyPjKgPjOqcH23JlGNQwXkab5mdYIi8sXJA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PV1L2Sxa; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a28a6cef709so596280966b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Mar 2024 07:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709478090; x=1710082890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=objFWYLJTsCFID4bxkiF8sYIttYlyjZ7w2ytPsMa/co=;
        b=PV1L2SxaGWMjzKvuMU/ATUwTE6U90rh2YWO5O8AlPCkVrhggKuaERoWyGDLSHsjQZx
         TctV+Od8GHTI8U8kyQxsnD3bg/z6sGDFDd00Zq9DMaRDTw7731zEADItsS8Qtj2LiS1O
         b9bLxK4nkCjrV8sNlUhFs2XnL+b8yRj8HN1X1Ar85a//kYJMk/1RvnUipZkkrdLsEW15
         S/k63qFN+De4f4a1D4WRzDLsorwgLpPlqIa66uwB5RnniHFvyXPvjwZt/Mhlz1umnGIx
         OfwbFnzjnZN5cQ/Yu9E42vUAiXxQ/gPqetQH58NRYL3yuUFeDbsKpVWwmbOGtKpC8PAS
         sK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709478090; x=1710082890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=objFWYLJTsCFID4bxkiF8sYIttYlyjZ7w2ytPsMa/co=;
        b=NNP3GyzJjXg0XIkyyc2owRjYpnr2vayDQ2AMi6o+6dSlYecifjJh78LqTeiyvZFEwS
         mdn46B2oH2GFHl6ewjWXXKdDf2RTa9c0lvTDNuwdjVpk7MtH/Q9VWHsdslMknPLXB27Z
         0DuaxsDNSTDXp8OjNhWAbO9uufwrLlWvTvAbj99y9fBzdm+ecT6NjEPBL0VL3bUGTYRM
         oCbb9K0FjyiCQfej9/URlbQpxPAs48jsEDn7EG8RLm052jp0sXD1Q8g4Urkwz0kFjuDd
         W6LYGmAK3zQKdryKdmJCv2KxWpNPi5McyXoDb1icM/+fw5sNfskdMAFMfgjmJuygw775
         1Ccg==
X-Gm-Message-State: AOJu0YytE6nINfsvFf2ynFdp9uGCRp1/VMXPamvMZK+42THfdVDIcslq
	r+q5XxwKAYUcfi0HlU29OnpHFGIozl9cXjJZ2n5csTMMPk0vXM63c9ZXN/xo8MU=
X-Google-Smtp-Source: AGHT+IEgUKslhbCFFA9X8FIivCaFHvZzj0Mw+hoRLlezgDrkKgO3aZB7DIdSuQrBqwbWWHQQ4Gcy0w==
X-Received: by 2002:a17:906:f355:b0:a3f:da1c:ae4c with SMTP id hg21-20020a170906f35500b00a3fda1cae4cmr5201250ejb.54.1709478090047;
        Sun, 03 Mar 2024 07:01:30 -0800 (PST)
Received: from brgl-uxlite.. ([77.241.232.10])
        by smtp.gmail.com with ESMTPSA id ch14-20020a170906c2ce00b00a42ea946917sm3740293ejb.130.2024.03.03.07.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 07:01:29 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Deepti Jaggi <quic_djaggi@quicinc.com>
Subject: [PATCH v8 07/12] firmware: qcom: scm: make qcom_scm_qseecom_app_get_id() use the TZ allocator
Date: Sun,  3 Mar 2024 16:01:10 +0100
Message-Id: <20240303150115.133633-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240303150115.133633-1-brgl@bgdev.pl>
References: <20240303150115.133633-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Let's use the new TZ memory allocator to obtain a buffer for this call
instead of manually kmalloc()ing it and then mapping to physical space.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Maximilian Luz <luzmaximilian@gmail.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index ed2600bbd4eb..b0fc0727d090 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1525,37 +1525,27 @@ int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id)
 	unsigned long app_name_len = strlen(app_name);
 	struct qcom_scm_desc desc = {};
 	struct qcom_scm_qseecom_resp res = {};
-	dma_addr_t name_buf_phys;
-	char *name_buf;
 	int status;
 
 	if (app_name_len >= name_buf_size)
 		return -EINVAL;
 
-	name_buf = kzalloc(name_buf_size, GFP_KERNEL);
+	char *name_buf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+							     name_buf_size,
+							     GFP_KERNEL);
 	if (!name_buf)
 		return -ENOMEM;
 
 	memcpy(name_buf, app_name, app_name_len);
 
-	name_buf_phys = dma_map_single(__scm->dev, name_buf, name_buf_size, DMA_TO_DEVICE);
-	status = dma_mapping_error(__scm->dev, name_buf_phys);
-	if (status) {
-		kfree(name_buf);
-		dev_err(__scm->dev, "qseecom: failed to map dma address\n");
-		return status;
-	}
-
 	desc.owner = QSEECOM_TZ_OWNER_QSEE_OS;
 	desc.svc = QSEECOM_TZ_SVC_APP_MGR;
 	desc.cmd = QSEECOM_TZ_CMD_APP_LOOKUP;
 	desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_RW, QCOM_SCM_VAL);
-	desc.args[0] = name_buf_phys;
+	desc.args[0] = qcom_tzmem_to_phys(name_buf);
 	desc.args[1] = app_name_len;
 
 	status = qcom_scm_qseecom_call(&desc, &res);
-	dma_unmap_single(__scm->dev, name_buf_phys, name_buf_size, DMA_TO_DEVICE);
-	kfree(name_buf);
 
 	if (status)
 		return status;
-- 
2.40.1


