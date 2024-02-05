Return-Path: <linux-arm-msm+bounces-9847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1477384A25C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 19:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E985EB22BA2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 18:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D1C53E0D;
	Mon,  5 Feb 2024 18:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gBscFNh0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4CC52F86
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Feb 2024 18:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707157713; cv=none; b=D0WeDnVoOl/xuUcMH1Mtbd7cusSayyt/P9Q3L/ljtqQ9cQ+E/Zz82Y9/VNNdHnI3LilrCi3dwDSLvfBhqo9CWE/NxA3HIAGEteZHt3Cr+ogsbAHncmiw7IOsCCOJOWE6gRr1Mu+mHJHXwqVyO7YFXjkIg2P0xaG7SMguZksu+b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707157713; c=relaxed/simple;
	bh=U+4HezcWsbb7llafjQRKtk8zIHDgxKZxXttkNtDpa9M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YdN5lZZVu2FmdqtcKojuAM75aALv7N9iKf/dnAgyE8mhLsh5xwkylo630h9/8dz7KijXRHEconM1eiHnqnaq1QlRsIfOnUhicwo3Kz2IRZ1fwLHPmwOY2/G2xxDf44RIxeFAOgS0ELGlJQODzqfAvcOhS0hiD1MPrCaDACKGQ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gBscFNh0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40fd55c7f93so16194505e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Feb 2024 10:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707157710; x=1707762510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ES7ecXlXJM4Un4rzG7GFObnKvctiGb4CfffnKCJdG4=;
        b=gBscFNh0pNmUz5jIJci6F7x9pigepi6taqLWIh4I2U9dWrloPgUMuhqbkFC6P6EIyL
         Mp82OIXncnIbZx9x5pyTqnSg77P7YpL6aA2zH8AmuC7vkhS4CUKmOqPq8T0dJnPSM0N6
         kAQdFWVJw4ehLjy4eHsARGPgA5mT/fBYKYMnt+VN9ghIKh7u7fwUE9rZ2XbfoxB4qJ3w
         5SVFotoR9pDnb1cQuhXCM3PSYNG85olLyvi9OXsAJqKKf+pTtmvsFpvjv29owqdzmS6I
         dm3tBW+2ytMmcohLg8givG/1tuz0BMaHy6tYxlpcwAbO0l8Zyew71YnRZ9TD6L0ul10i
         CJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707157710; x=1707762510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ES7ecXlXJM4Un4rzG7GFObnKvctiGb4CfffnKCJdG4=;
        b=A/fdMiZwC+66zbL4e7Ls+c99A3P+XtOBD9couehHW/qBMg/d9rJbbReDFXBKc4gLIw
         VFjpUmymNzpFozzXBx0XXIntTIs2ckpAbKIH5SwfNyJo26whunOE3whDckF4Zj/BXa1C
         hl29tDrkHKeHijdTkluHgPijn/Q0Yk8giwVgoQsK+xRNLTvD7jJxmOhGKAC6wA8wd986
         WHifcI5tjuDZqQTQsLsR43e0+V4cPZWk+MKcFZg0YNE5dWfWNf9LdTOFlrhPe21nkDMD
         YPFGjqPoYbxfRM+uTEugpIDKQFUhwa2JmGuSruIp/J0mktdWJ49gx9jtjJNV80OE8cyw
         3QqA==
X-Gm-Message-State: AOJu0YxwDI/PlZZVfQZmAA5W39Mr4+hnNexXUfAt+4IwOMlo7ReXHqw4
	tlmgP4X+Vl/WUNcL7b5vjsKK/2y8+kbf5livtmb5Bu3bdG58aBKtTI9Lt9OPlElQjiMIRkxmpRw
	2
X-Google-Smtp-Source: AGHT+IHRaxer47lLsNPzE1lYerxnHDOmXIYeuKvwusAuZfA0G+ZPa72Q9c/tVaihsJD/QECD4k3d6w==
X-Received: by 2002:a05:600c:4ed4:b0:40f:cd96:31b7 with SMTP id g20-20020a05600c4ed400b0040fcd9631b7mr397542wmq.30.1707157709934;
        Mon, 05 Feb 2024 10:28:29 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXG4NRUGyz5H1DuEu3Wfk/Kz0AdLGb+zwwdX27Og5B0V7rIfarK16JLITSBQM/V9KeyyGchkFjLnJq7U9cX0GxpZtXosrAMPWWfYMFs2+/fLe50BF/hxsFGhKKOp5F8+jYV4rKyLp0BybdCDhPtJKBwg1kDXd5I7XZn7Ko+ZaZCmi+v09BUiOiXYpBYizzi8cxavpe2SlviXaovcaQ0daNEOl8C2LrqSGm8VmzkN7W6y0LBquZ4jJSFwbd1rJmxp36ubDgFfauUaTaDSLzg7bAd6aIYf/6ntYPSPjJavzU+u5k+8+nbEF4XDQNXTxMHlMT54VwjsqfzelEQ6Q2W8ONCV6f9xuhtNWVCflicS/5XDLAaSa0vZrqlkWncoMrtQIm4jF4DVfq/rRvHGqhOGTI/rrOV6v0IFM3Nhb1jCljYOT9hOBDfaQf43NaWgg4wIAFYdivbD449bwQme8kwM7SK9u5nvaGTmxR9G0oWfTqBt2JmMV5+EyPJZ2snVWBc7BW/BRXExustKITp2ztgqUsNnw5stbn8kNEPc/RBuaCEXpbWIIDpet1nkCZWLxDkMus=
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d678f000000b0033b17e18df8sm203229wru.12.2024.02.05.10.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 10:28:29 -0800 (PST)
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
Subject: [PATCH v7 09/12] firmware: qcom: scm: add support for SHM bridge operations
Date: Mon,  5 Feb 2024 19:28:07 +0100
Message-Id: <20240205182810.58382-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240205182810.58382-1-brgl@bgdev.pl>
References: <20240205182810.58382-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add low-level primitives for enabling SHM bridge support as well as
creating and destroying SHM bridge pools to qcom-scm.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Acked-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 60 ++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |  3 ++
 include/linux/firmware/qcom/qcom_scm.h |  6 +++
 3 files changed, 69 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 318d7d398e5f..839773270a21 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1323,6 +1323,66 @@ bool qcom_scm_lmh_dcvsh_available(void)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh_available);
 
+int qcom_scm_shm_bridge_enable(void)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_SHM_BRIDGE_ENABLE,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+
+	struct qcom_scm_res res;
+
+	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_MP,
+					  QCOM_SCM_MP_SHM_BRIDGE_ENABLE))
+		return -EOPNOTSUPP;
+
+	return qcom_scm_call(__scm->dev, &desc, &res) ?: res.result[0];
+}
+EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
+
+int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
+			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
+			       u64 ns_vmids, u64 *handle)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_SHM_BRIDGE_CREATE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+		.args[0] = pfn_and_ns_perm_flags,
+		.args[1] = ipfn_and_s_perm_flags,
+		.args[2] = size_and_flags,
+		.args[3] = ns_vmids,
+		.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_VAL, QCOM_SCM_VAL,
+					 QCOM_SCM_VAL, QCOM_SCM_VAL),
+	};
+
+	struct qcom_scm_res res;
+	int ret;
+
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+
+	if (handle && !ret)
+		*handle = res.result[1];
+
+	return ret ?: res.result[0];
+}
+EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_create);
+
+int qcom_scm_shm_bridge_delete(struct device *dev, u64 handle)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_SHM_BRIDGE_DELETE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+		.args[0] = handle,
+		.arginfo = QCOM_SCM_ARGS(1, QCOM_SCM_VAL),
+	};
+
+	return qcom_scm_call(__scm->dev, &desc, NULL);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_delete);
+
 int qcom_scm_lmh_profile_change(u32 profile_id)
 {
 	struct qcom_scm_desc desc = {
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index aa7d06939f8e..cb7273aa0a5e 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -116,6 +116,9 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
 #define QCOM_SCM_MP_IOMMU_SET_CP_POOL_SIZE	0x05
 #define QCOM_SCM_MP_VIDEO_VAR			0x08
 #define QCOM_SCM_MP_ASSIGN			0x16
+#define QCOM_SCM_MP_SHM_BRIDGE_ENABLE		0x1c
+#define QCOM_SCM_MP_SHM_BRIDGE_DELETE		0x1d
+#define QCOM_SCM_MP_SHM_BRIDGE_CREATE		0x1e
 
 #define QCOM_SCM_SVC_OCMEM		0x0f
 #define QCOM_SCM_OCMEM_LOCK_CMD		0x01
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index ccaf28846054..9b6054813f59 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -115,6 +115,12 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 int qcom_scm_lmh_profile_change(u32 profile_id);
 bool qcom_scm_lmh_dcvsh_available(void);
 
+int qcom_scm_shm_bridge_enable(void);
+int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
+			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
+			       u64 ns_vmids, u64 *handle);
+int qcom_scm_shm_bridge_delete(struct device *dev, u64 handle);
+
 #ifdef CONFIG_QCOM_QSEECOM
 
 int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id);
-- 
2.40.1


