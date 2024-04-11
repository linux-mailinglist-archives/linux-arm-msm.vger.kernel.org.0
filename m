Return-Path: <linux-arm-msm+bounces-17163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD5E8A0753
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 06:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C3DC1C236ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 04:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A2713C918;
	Thu, 11 Apr 2024 04:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yqRJLHdQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48F513C818
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 04:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712811006; cv=none; b=HZ9zvHz9eH4RPVjKkwr/8HKt3heT3hht1YrtQaLqMxpXhWlxoM0Snsid+V97HAMSisTFF5zXo5NSg7KWK6bHEepgH+cMH89LQNLS5McwtmHJtg/IMAgpQ0pGFhZWofcecNzfF/tZE92u2oIW11XfafetlvAmGCqMeeqVN67caAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712811006; c=relaxed/simple;
	bh=u4jDQO/0VgtW95lOQWBbsTeV5DQ/5FtzVIksyRFfWk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OPxaPe1FmbtqcVsXvsC+7ApDRRkpjin44RVEq3GYX14NTJXxToQPJZdGsz7KiGrTUWmUTidrTDs019Jd3xWBcnGZhmhEnkFKI3tcjXakZsj0g6EpmnXH7OD5T7Pbm98vyeqlyakjMCDnZKaDIi5poVeHfo7D0ttgsXVFGYnJBWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yqRJLHdQ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so8280460a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 21:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712811003; x=1713415803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbmZnNz7wfcYRQ4tunBdMeZpxGP9080ZCBcMGoX6drU=;
        b=yqRJLHdQzjU00g6ZMoOfvBwOfHbG5DqdhIbQC+QUhcV0hUZVQfNyDNXs0FXwfDLSLg
         dnKh/jGE+A3Igh84/un+m0L9yXb2Xx1YztVyZMcBLMKf77xP7NZ7nlD4kEvOzqVpSdYg
         yjq8CD4YR6Xv85hxXwYsHmR/zk/rghsCjOrt61y9PQZ5tPmuhybFAgBWJEeRFkzteJpF
         4xM+ZHHWn5BT6U3JaTwwK7ZiS8El7ZrYBP3bRpJ1hm8puEDv9OA5SY57iDAwGBs28svl
         p9dXEPz7cfYch3WejEZitPcR1hIaHilui87Zvs1+fNv73QL2+7BDO8SeZS4J31ETYN4g
         4TvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712811003; x=1713415803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbmZnNz7wfcYRQ4tunBdMeZpxGP9080ZCBcMGoX6drU=;
        b=D3yTIHb3SwAKX4e9chLRJOpY8ZSgLL2rcrKvIMtS6311sqcBHi5miXNYJU7tulU/Bn
         HF1NiUL7EL3MfmLePAeufMhvgz+mgzsH2baEWM7CqYoNjcZU/u4gUOEPz2XAoLYoKSyq
         qjayrwdSROKqcwMPg7oBq0S8GUhNVfOxlDkynMdHk0dIebfF1sJVKtCfGqdeKYeNaoZz
         9LEkMrwJSJQy8o2Iajwvsh6xis3WLQtvv7OblW6ct1luOOp3/BHasPhhipUBS2bUo1y2
         i0n20Z16PMnJPFp3cFtWR0iZ8hmH3RXiCbx4E8iog4y5Pv8Swnij8ufK/2NKiyi5j9l/
         jQ2w==
X-Forwarded-Encrypted: i=1; AJvYcCWI4YyV9ETz1xUIkEeWz3msuvro5gtb4bM2IXbbw1KFPIZ7gpLfyjWYWEXgQsSrxQ18Bmy0uAIwfCjB2EGrOCu4rchbsJ+ynzy8JCtFAw==
X-Gm-Message-State: AOJu0YzLF6MGLhqIZE5Y11B7P36rkFSwGt4GFKo5k11Am5Q06hKogsUS
	kX1cKrHwa17M8+Wi2o0AqN2H6cxymtwRik8YjCMB2sI/hNEkFFagOLhSzGcIO/Q=
X-Google-Smtp-Source: AGHT+IGwim/1leSiJmZtZ8mYj3dH/Ok7T2kMgKqWGmEz9ndiADGBSUnqAi2n7SIJ8+QbqZ+s2RtLxg==
X-Received: by 2002:a17:907:7e84:b0:a4e:24af:d8a4 with SMTP id qb4-20020a1709077e8400b00a4e24afd8a4mr2043984ejc.28.1712811003083;
        Wed, 10 Apr 2024 21:50:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id dm11-20020a170907948b00b00a51eed4f0d7sm364899ejc.130.2024.04.10.21.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 21:50:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Apr 2024 07:49:56 +0300
Subject: [PATCH v2 4/5] usb: typec: ucsi: add update_connector callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-ucsi-orient-aware-v2-4-d4b1cb22a33f@linaro.org>
References: <20240411-ucsi-orient-aware-v2-0-d4b1cb22a33f@linaro.org>
In-Reply-To: <20240411-ucsi-orient-aware-v2-0-d4b1cb22a33f@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=u4jDQO/0VgtW95lOQWBbsTeV5DQ/5FtzVIksyRFfWk8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5p49tepFmkxUwtOv5uxnVvo6Yxt3zL3TVyzb2qq3qPsH
 Bsp3q3hnYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYyK8f7H/FGLbFvJY8E/hg
 7xr23IPJyvFetqlJD7VzM/sYJrCqsD6zlOkWrfkjnOiT7beaf/V6zTfuzH17vzy2+fdD4gar3lo
 LrfxzC9M2tK5l9lkrIutUws2880RswBNNNZ/dbDpNIR9e7nq4dtHMWXFGOYVqgUmsRrXxSVdqNS
 JE02rWJM3obKn9fPHNbD1OSwEF+2gzqePlpjmFux7POue3WqvG7ZaY226G9leT+KMZhIwjQ/TeP
 MyJ+3dcZ8utUgO9H3FWvzO4r/b/sjv73pUpY2J60WrvvjWeC8X32s3dn/U26ZXdu16LZ5X3l+op
 WNtLSEnME3oYVi0/7T5LbMzswzZF56v7zVqO7MzKTAwHAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add a callback to allow glue drivers to update the connector before
registering corresponding power supply and Type-C port. In particular
this is useful if glue drivers want to touch the connector's Type-C
capabilities structure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 3 +++
 drivers/usb/typec/ucsi/ucsi.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 7ad544c968e4..57e73b823a4c 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1559,6 +1559,9 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
 
+	if (ucsi->ops->update_connector)
+		ucsi->ops->update_connector(con);
+
 	ret = ucsi_register_port_psy(con);
 	if (ret)
 		goto out;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 3e1241e38f3c..c4d103db9d0f 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -60,6 +60,7 @@ struct dentry;
  * @sync_write: Blocking write operation
  * @async_write: Non-blocking write operation
  * @update_altmodes: Squashes duplicate DP altmodes
+ * @update_connector: Update connector capabilities before registering
  * @connector_status: Updates connector status, called holding connector lock
  *
  * Read and write routines for UCSI interface. @sync_write must wait for the
@@ -75,6 +76,7 @@ struct ucsi_operations {
 			   const void *val, size_t val_len);
 	bool (*update_altmodes)(struct ucsi *ucsi, struct ucsi_altmode *orig,
 				struct ucsi_altmode *updated);
+	void (*update_connector)(struct ucsi_connector *con);
 	void (*connector_status)(struct ucsi_connector *con);
 };
 

-- 
2.39.2


