Return-Path: <linux-arm-msm+bounces-7758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BD9835F82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 11:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2F1B1F26765
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 10:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07ED03C08D;
	Mon, 22 Jan 2024 10:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yCQhd5eJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568683B786
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 10:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705918935; cv=none; b=u6hka2p04yuwQvGURsgvkoNJxNozAZkBdqqHDss0Nm1djvhLbPGS52rb6eCG1TYfsxnj2ub77kVyKwnUhUzpEcSLvvcpO248jZnOomw8sPRig4OJeLOPbXUcygYru08bCfOmEfPxSJBD0EfD+jEf835sBUJqjAUZ0hukDYiukRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705918935; c=relaxed/simple;
	bh=WIOe11Ytzyo9Yq0ljywUwZYIxYsyWX7ldWgffEttovw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nOCyDwZX0/3PPfzxQYWa6k1Jex+HYoT+kQaciwuNZK2C6KWu4yk1VMISTIQcDzIqbFA/3miHOTR+UZ8c0sWYf4TT81SzIeauijnP7IiJdt1gAWJmvsOk2gmYOB8BcS8D1nbfTaOElZO6PNNRzEosUztpNYosUJRnP+ePncsXvM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yCQhd5eJ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-336c5b5c163so1745948f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 02:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705918932; x=1706523732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0oEOKGcE5RDVKHJLOO6pZt7g+TRP+w7zOsv5ctScyA=;
        b=yCQhd5eJ3Bt9R6Spqy/D5t5v8+cuTAcyX0oL9PJAoDwpqxgRay3VD3Nady6xbviIZd
         o9b10XOKwiWjxvbRQEYqwLRoeiizoWGrQh+6sIyZhfxFIt698MxYrMy6rud9jJDkdcHb
         iHnMqxAMyIN9ebWE6AniM+qyPgRTD7bFBfa0uidIEJib9LKCf01Ub5DDQQ3spI9+ZrIu
         /pRXcXjyjYq3uVH7F6ljjwkVNU6wzRqX+Dry6CmBZZB5p86lpqsqjRa6Z9NBzbluYpJg
         3NdXzTq1CSeUNkhZA6grbXn1YX3Q1LrXd6b57ilgS3g56qjNxiF7DUi7SfBa3ov31kx8
         yrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705918932; x=1706523732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0oEOKGcE5RDVKHJLOO6pZt7g+TRP+w7zOsv5ctScyA=;
        b=BYH2YpJgI6+68CUPInB8YCUZ3FugOyseuKPumu8hjG41yye8T5SsMt1fd/1ZKQXn0Y
         nwPIdQgqRXGtXpnGB/NcAOvc+Mjxh2lnwKc15c58xU4OENnA4xQishNWH1Y6bvOdKYFD
         G2iM09xTtytsEBsbBLMQtLl2rGucbrCzQHxRY/lkDbLdNHcDNQ7eXE9GQU5M5uXXpbaZ
         iRjeRV6IMSVaIZStO03IemNiD0bHTLhwf0ISqsDh9mJxvzOx8YRK+fBYQxn27HJKRRl3
         uSjbBRrY/dNj62goALohp8jWpbX8YF5K0nqtRW2LtM1qCCUcUP3PTPZ/rLc3jkqr1wVs
         tVKA==
X-Gm-Message-State: AOJu0YyIfn404WAiraGahvDRudMHYFXEMKlIjr9aGD8B7exm9v2cbaFr
	7Mrtm0ZvH3OM4glmTwdIqakI2w49zRLoXgEgLJnZypf6ne54H+VfsGD0MOyr950=
X-Google-Smtp-Source: AGHT+IFToqlcKaxkiS5LUPEGDrIetlUm4/CPOggDUt+GZFmVFqwX/xwX44NKNvyf8GINsBA/qvKbHg==
X-Received: by 2002:a05:6000:100b:b0:337:d8a5:32d6 with SMTP id a11-20020a056000100b00b00337d8a532d6mr1954803wrx.9.1705918932721;
        Mon, 22 Jan 2024 02:22:12 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:92a0:6172:d229:1898])
        by smtp.gmail.com with ESMTPSA id q7-20020adffec7000000b0033926505eafsm6377904wrs.32.2024.01.22.02.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 02:22:12 -0800 (PST)
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Deepti Jaggi <quic_djaggi@quicinc.com>
Subject: [RESEND PATCH v6 07/12] firmware: qcom: scm: make qcom_scm_qseecom_app_get_id() use the TZ allocator
Date: Mon, 22 Jan 2024 11:21:52 +0100
Message-Id: <20240122102157.22761-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240122102157.22761-1-brgl@bgdev.pl>
References: <20240122102157.22761-1-brgl@bgdev.pl>
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
index 11638daa2fe5..3a6cefb4eb2e 100644
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


