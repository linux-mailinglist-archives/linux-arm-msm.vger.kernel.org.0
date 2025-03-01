Return-Path: <linux-arm-msm+bounces-49919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA901A4ADE6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 21:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2FAE16CD8D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 20:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544371E9901;
	Sat,  1 Mar 2025 20:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BWNQjeLG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3D91E5B99
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Mar 2025 20:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740861594; cv=none; b=iHAvinA/FIZYTzRU0usliIz2iUphvHaWAhH5xdePezYFsQYNYG7ga3pj9c0kksAqUc11b9Puf6B63ZVWzhfqZg7DiiCvhHXuc+kYtPe5WmXfJ6KJ0LCHuGHiunlH7Upil3QnonvC6X8PB/J/OJxtevt0q3cbeupahYVDS8EGbas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740861594; c=relaxed/simple;
	bh=NgOVGdCmTC+8UjqfiO/VMFR2mESsUZ4pRU644XqkABc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j8+fX71P2jk5gGxbYbP5UmZlyK4ok5yTYVB5Oy0UM+JorPnhobmVoGnJP1ZMV968rbhhorp2oZFD6q9n5UAj7moLjh2IIHRPTzrlvcWqmSnoh0MxdIvqaONj2Oex2asUmpcGGNoEAQKDHAzYW992HeDjlWJqcPLvbcvIWBCBRp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BWNQjeLG; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30613802a59so36770191fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Mar 2025 12:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740861589; x=1741466389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcEPpUecbQnXiS5K2IATdiHhzAIF4FnvVg3Y9Uy8iSM=;
        b=BWNQjeLGHWe7hS6a59HRs2Gz8jWeG5dMl9np3DJTSCs6yDmeNPxfGdMQVOvdNIjwuU
         JNz94qZWzEbDMDWVMDwECa62B0kfODjIFzN0QYpjOgIc6orsdvN3xCtv3ndQB5LVrgGX
         CvVokB2G0VaoDtHrm+nK5sUMIf8llO9j/mYzL3gkE/B9H2P5bvuE0zYMlSSSE6yMywQw
         QA8q1W4r+2mX+J2HBDrnihul7g/IAXxmPUPG9Vxh/YfQsgEZJ0j5ItmAZdXh3f9onF/w
         4Qp9+8X9zvFHccmBGSdofyM9/L1aBz5mBWUQK0vtyGyASMK95bPZzjcie9I+dG5Rq937
         BOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740861589; x=1741466389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcEPpUecbQnXiS5K2IATdiHhzAIF4FnvVg3Y9Uy8iSM=;
        b=oEUVAgvgRDbtrlH4Wb0af0jqMpIpFSj9y2A+pXDD86+q2GQH5alOSQVyEcQGPvrBuq
         cUiz8h1K/RDInhJhm62kkOsPgC6YZGl8XjUht1d9QJ8wLmlZg2bYq0taHBuHB8FflxOI
         sP9qjT6OGQVC/DcLvUF8iVLbKO5ybN6xRKG/pgjOIdpbMYsfEG258uPXDV85dUn1cP4E
         i/Ua0PkeAt9Orv+Gjn6a2PPJzgIhyN+o7KF5yHblWHjRcBatpJnwkzQXtkO2tEcsXYDQ
         Run4AqHO6YTO7NekGud3RGqBAUDyGY/0KamnLxExbEXmdofiTtSjBxdZ18dew60VVtV+
         ug8w==
X-Forwarded-Encrypted: i=1; AJvYcCXGLJ/tx/9T0meWgxw13g1spXjIUe3BLOcXBPFTfDAPUeB9zBNVR6eIhC5vOD9bFHZObSTnFOnY4hRzv1+C@vger.kernel.org
X-Gm-Message-State: AOJu0YyUrG6A8lEWvXUzv9JeECidoH3eb0V07Ql2pAf9zfZkL3m6GR80
	07tmgrkF1a6aNQ6X2/myu/Ct/Ros7gZhUYrKCmKCvzk7TF4bUKFppaDQk9YYTnk=
X-Gm-Gg: ASbGncuKDvobImrH0cUhzlxCHLYdAgxSajRXeKLOi6jO6OJgLdoo5Y5oKLl1uRRX3kV
	pVS9PwgDgvRj/SIF7or7JAehSpZPy9tA4s0aRqbJIupvky1oXfaUNIP676ZaJ2Gup4QxlCXNMLr
	qwT4SsURvdMaNUuYyF3oGT5LbawJbuZvQRNwdPREg0wBad0QiFG/pmLmbo1J+mjj1qMRXU3WiQp
	L338Hoye3F3YpzEPmzKd4NM4T/QpFvLX6DRf4rU1NJbC6o/ZXbW4PMFudR9SC6riVvbZUASxWUk
	hMa0slDbYCIGszOzy3UzHIdtdx16sjHW5gd9unTcsi5uIZbv62A4
X-Google-Smtp-Source: AGHT+IFbIBFxy1B6SY0xD2HgvbsOY0hx7R3yAueDBbzal97DNmUgO5PzUJvmVDdNOItvYmjbpnMuQw==
X-Received: by 2002:a05:651c:503:b0:30b:b28d:f0a7 with SMTP id 38308e7fff4ca-30bb28df324mr1085351fa.18.1740861589428;
        Sat, 01 Mar 2025 12:39:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b931524efsm6668921fa.60.2025.03.01.12.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 12:39:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Mar 2025 22:39:36 +0200
Subject: [PATCH RFC v2 1/7] drm/display: dp: implement new access helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-drm-rework-dpcd-access-v2-1-4d92602fc7cd@linaro.org>
References: <20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org>
In-Reply-To: <20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org>
To: Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6615;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NgOVGdCmTC+8UjqfiO/VMFR2mESsUZ4pRU644XqkABc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnw3CPwOBSZDyus3kp03MXdqlegNWQAa4zwNzmJ
 0cZIAcuGLOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8NwjwAKCRCLPIo+Aiko
 1aRvB/99tG7xDSt1Yr4yCrGCTSBYNU9Ye0p7gfAblguluBCoNXaduaIX+1zoQzVkeZ+GVrzK/Xc
 4pdDdnxddbCt3Vm6yoKmAVR0v5tgM5iCnS9Tgt8b22zgZCPf3GFQyDpHWSPNpaOAcCxPYntqFUq
 AfWvGTmt7fszWiM1wFvlZJ6cZtMJuLhaCth1m64pfwIOJQzTfSphoJyIKTq4Zvgdc8g5ZKkXeEQ
 tfRrv3yAPq0duIxh/WY3hAcuFRkupFNc5D4HaDIr9I7Fp4FBhV2FeaCrTPmDkpa5M2vu6s0d27E
 1EkuVR1kj5ocWPst+uTg+zoz7U6QawXu8BwJMs/N1+znS1Xq
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Existing DPCD access functions return an error code or the number of
bytes being read / write in case of partial access. However a lot of
drivers either (incorrectly) ignore partial access or mishandle error
codes. In other cases this results in a boilerplate code which compares
returned value with the size.

Implement new set of DPCD access helpers, which ignore partial access,
always return 0 or an error code.

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c |  4 ++
 include/drm/display/drm_dp_helper.h     | 92 ++++++++++++++++++++++++++++++++-
 2 files changed, 94 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index dbce1c3f49691fc687fee2404b723c73d533f23d..e43a8f4a252dae22eeaae1f4ca94da064303033d 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -704,6 +704,8 @@ EXPORT_SYMBOL(drm_dp_dpcd_set_powered);
  * function returns -EPROTO. Errors from the underlying AUX channel transfer
  * function, with the exception of -EBUSY (which causes the transaction to
  * be retried), are propagated to the caller.
+ *
+ * In most of the cases you want to use drm_dp_dpcd_read_data() instead.
  */
 ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 			 void *buffer, size_t size)
@@ -752,6 +754,8 @@ EXPORT_SYMBOL(drm_dp_dpcd_read);
  * function returns -EPROTO. Errors from the underlying AUX channel transfer
  * function, with the exception of -EBUSY (which causes the transaction to
  * be retried), are propagated to the caller.
+ *
+ * In most of the cases you want to use drm_dp_dpcd_write_data() instead.
  */
 ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
 			  void *buffer, size_t size)
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 5ae4241959f24e2c1fb581d7c7d770485d603099..c5be44d72c9a04474f6c795e03bf02bf08f5eaef 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -527,6 +527,64 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
 			  void *buffer, size_t size);
 
+/**
+ * drm_dp_dpcd_read_data() - read a series of bytes from the DPCD
+ * @aux: DisplayPort AUX channel (SST or MST)
+ * @offset: address of the (first) register to read
+ * @buffer: buffer to store the register values
+ * @size: number of bytes in @buffer
+ *
+ * Returns zero (0) on success, or a negative error
+ * code on failure. -EIO is returned if the request was NAKed by the sink or
+ * if the retry count was exceeded. If not all bytes were transferred, this
+ * function returns -EPROTO. Errors from the underlying AUX channel transfer
+ * function, with the exception of -EBUSY (which causes the transaction to
+ * be retried), are propagated to the caller.
+ */
+static inline int drm_dp_dpcd_read_data(struct drm_dp_aux *aux,
+					unsigned int offset,
+					void *buffer, size_t size)
+{
+	int ret;
+
+	ret = drm_dp_dpcd_read(aux, offset, buffer, size);
+	if (ret < 0)
+		return ret;
+	if (ret < size)
+		return -EPROTO;
+
+	return 0;
+}
+
+/**
+ * drm_dp_dpcd_write_data() - write a series of bytes to the DPCD
+ * @aux: DisplayPort AUX channel (SST or MST)
+ * @offset: address of the (first) register to write
+ * @buffer: buffer containing the values to write
+ * @size: number of bytes in @buffer
+ *
+ * Returns zero (0) on success, or a negative error
+ * code on failure. -EIO is returned if the request was NAKed by the sink or
+ * if the retry count was exceeded. If not all bytes were transferred, this
+ * function returns -EPROTO. Errors from the underlying AUX channel transfer
+ * function, with the exception of -EBUSY (which causes the transaction to
+ * be retried), are propagated to the caller.
+ */
+static inline int drm_dp_dpcd_write_data(struct drm_dp_aux *aux,
+					 unsigned int offset,
+					 void *buffer, size_t size)
+{
+	int ret;
+
+	ret = drm_dp_dpcd_write(aux, offset, buffer, size);
+	if (ret < 0)
+		return ret;
+	if (ret < size)
+		return -EPROTO;
+
+	return 0;
+}
+
 /**
  * drm_dp_dpcd_readb() - read a single byte from the DPCD
  * @aux: DisplayPort AUX channel
@@ -534,7 +592,8 @@ ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
  * @valuep: location where the value of the register will be stored
  *
  * Returns the number of bytes transferred (1) on success, or a negative
- * error code on failure.
+ * error code on failure. In most of the cases you should be using
+ * drm_dp_dpcd_read_byte() instead
  */
 static inline ssize_t drm_dp_dpcd_readb(struct drm_dp_aux *aux,
 					unsigned int offset, u8 *valuep)
@@ -549,7 +608,8 @@ static inline ssize_t drm_dp_dpcd_readb(struct drm_dp_aux *aux,
  * @value: value to write to the register
  *
  * Returns the number of bytes transferred (1) on success, or a negative
- * error code on failure.
+ * error code on failure. In most of the cases you should be using
+ * drm_dp_dpcd_write_byte() instead
  */
 static inline ssize_t drm_dp_dpcd_writeb(struct drm_dp_aux *aux,
 					 unsigned int offset, u8 value)
@@ -557,6 +617,34 @@ static inline ssize_t drm_dp_dpcd_writeb(struct drm_dp_aux *aux,
 	return drm_dp_dpcd_write(aux, offset, &value, 1);
 }
 
+/**
+ * drm_dp_dpcd_read_byte() - read a single byte from the DPCD
+ * @aux: DisplayPort AUX channel
+ * @offset: address of the register to read
+ * @valuep: location where the value of the register will be stored
+ *
+ * Returns zero (0) on success, or a negative error code on failure.
+ */
+static inline int drm_dp_dpcd_read_byte(struct drm_dp_aux *aux,
+					unsigned int offset, u8 *valuep)
+{
+	return drm_dp_dpcd_read_data(aux, offset, valuep, 1);
+}
+
+/**
+ * drm_dp_dpcd_write_byte() - write a single byte to the DPCD
+ * @aux: DisplayPort AUX channel
+ * @offset: address of the register to write
+ * @value: value to write to the register
+ *
+ * Returns zero (0) on success, or a negative error code on failure.
+ */
+static inline int drm_dp_dpcd_write_byte(struct drm_dp_aux *aux,
+					 unsigned int offset, u8 value)
+{
+	return drm_dp_dpcd_write_data(aux, offset, &value, 1);
+}
+
 int drm_dp_read_dpcd_caps(struct drm_dp_aux *aux,
 			  u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 

-- 
2.39.5


