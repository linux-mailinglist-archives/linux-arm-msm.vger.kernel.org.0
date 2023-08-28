Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0638E78B85E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 21:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233411AbjH1T2B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 15:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233302AbjH1T1b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 15:27:31 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA334CC9
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 12:27:08 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31adc5c899fso3201555f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 12:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693250827; x=1693855627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9IIbmqeXUEZrQQd9nJYDsQR20cl+CEuhTdfBNfLqNk=;
        b=U2c+D7W/DluCXF1TF7FZqcriMIZUK3c7RhavvfomxvpcFpDf8yDsO+W/TNBct8qfUV
         gAJqZGyE7rdbDYxbl+y3xmAYAP1l257zDnWa04rZZMlTwQzTGJeeHwfTeAXpSFVA+AoO
         +7vOphBP2vq2jqyVzTaaKWpF7XaUvqQ1RG5GY3jK5npXW2NnI31oKQ6YbZoo2gpbUgE0
         d+GkWEDpPGi15djFRVH1GJCygrAE9ylq89zKIvKuq3sEDbMUIHE7SvcIS94/xP15JIzb
         PTB1TS6WF8wDllBXS0UfrL0VF7d1YHoMz6RGHU+H7XThrSmFLeITvkAen7ZEQ2ERJtFI
         YmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693250827; x=1693855627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9IIbmqeXUEZrQQd9nJYDsQR20cl+CEuhTdfBNfLqNk=;
        b=idOk8bbALz9eH89fLZQ1sXtLvurayQgWWCFsYm5+zNl+5X0s7Cy0H85rz7eBlVPhZK
         KNpCYUlML2NAz7C7B1uO0jFOpaDyr+4VusqwAMcvr94LglztDIi4HbFKP1CTFXY7sPZ/
         qhZX6j1Kl808xv7BAa6fM1/LXtrJ70z+/0T/TzSHZDog37b59gpp+m/JwG94Fcw09acu
         BgSQ+3RyMdeKx1M8Lv/DVVPxhWgE9dJgs5FRhi88oJNIEhZSrcEsuexSId6z/xsYCXTM
         CzWwi3BCZQ9gKe3BaL6SG3OtV07dCnPdaNdCosI3EFOF0DkITxtYMAWXlbn7J2fk9KrN
         iCGw==
X-Gm-Message-State: AOJu0Yxkzho3OM00QJRsLBl2CMqUKLNBFZKN5ILSXS0hccVyFbElMMK7
        MBvZeoOA/Ev6apNSl55muCQcRA==
X-Google-Smtp-Source: AGHT+IGELnRw3OVm+F5lO+SlIxnQc7iifWQmxaW6b93Q/z2oVixC1dvmEOehQrkSCMkjDmlRE7oFiA==
X-Received: by 2002:adf:ea10:0:b0:31a:ed75:75e9 with SMTP id q16-20020adfea10000000b0031aed7575e9mr20375035wrm.13.1693250827195;
        Mon, 28 Aug 2023 12:27:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8bd:7f16:d368:115f])
        by smtp.gmail.com with ESMTPSA id i20-20020a5d5234000000b003141f96ed36sm11435319wra.0.2023.08.28.12.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 12:27:06 -0700 (PDT)
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 04/11] firmware: qcom-scm: add support for SHM bridge operations
Date:   Mon, 28 Aug 2023 21:25:00 +0200
Message-Id: <20230828192507.117334-5-bartosz.golaszewski@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230828192507.117334-1-bartosz.golaszewski@linaro.org>
References: <20230828192507.117334-1-bartosz.golaszewski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add low-level primitives for enabling SHM bridge support, creating SHM
bridge pools and testing the availability of SHM bridges to qcom-scm. We
don't yet provide a way to destroy the bridges as the first user will
not require it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom_scm.c            | 83 ++++++++++++++++++++++++++
 drivers/firmware/qcom_scm.h            |  3 +
 include/linux/firmware/qcom/qcom_scm.h |  8 +++
 3 files changed, 94 insertions(+)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 422de70faff8..f45d5a424424 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -31,6 +31,8 @@ module_param(download_mode, bool, 0);
 #define SCM_HAS_IFACE_CLK	BIT(1)
 #define SCM_HAS_BUS_CLK		BIT(2)
 
+#define SCM_SHM_BRIDGE_NOTSUPP	4
+
 struct qcom_scm {
 	struct device *dev;
 	struct clk *core_clk;
@@ -45,6 +47,8 @@ struct qcom_scm {
 	int scm_vote_count;
 
 	u64 dload_mode_addr;
+
+	bool shm_bridge_enabled;
 };
 
 struct qcom_scm_current_perm_info {
@@ -1248,6 +1252,85 @@ bool qcom_scm_lmh_dcvsh_available(void)
 }
 EXPORT_SYMBOL(qcom_scm_lmh_dcvsh_available);
 
+bool qcom_scm_shm_bridge_available(void)
+{
+	if (!qcom_scm_is_available())
+		return false;
+
+	return READ_ONCE(__scm->shm_bridge_enabled);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_available);
+
+/*
+ * Must not be called unless qcom_scm_shm_bridge_available() returned true
+ * first.
+ */
+int qcom_scm_enable_shm_bridge(void)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_SHM_BRIDGE_ENABLE,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+
+	struct qcom_scm_res res;
+	int ret;
+
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	if (!ret && !res.result[0])
+		WRITE_ONCE(__scm->shm_bridge_enabled, true);
+
+	if (res.result[0] == SCM_SHM_BRIDGE_NOTSUPP)
+		ret = -EOPNOTSUPP;
+
+	return ret ?: res.result[0];
+}
+EXPORT_SYMBOL_GPL(qcom_scm_enable_shm_bridge);
+
+int qcom_scm_create_shm_bridge(struct device *dev, u64 pfn_and_ns_perm_flags,
+			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
+			       u64 ns_vmids, u64 *handle)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_SHM_BRDIGE_CREATE,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+
+	struct qcom_scm_res res;
+	int ret;
+
+	desc.args[0] = pfn_and_ns_perm_flags;
+	desc.args[1] = ipfn_and_s_perm_flags;
+	desc.args[2] = size_and_flags;
+	desc.args[3] = ns_vmids;
+
+	desc.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_VAL, QCOM_SCM_VAL,
+				     QCOM_SCM_VAL, QCOM_SCM_VAL);
+
+	ret = qcom_scm_call(dev ?: __scm->dev, &desc, &res);
+
+	if (handle && !ret)
+		*handle = res.result[1];
+
+	return ret ?: res.result[0];
+}
+EXPORT_SYMBOL_GPL(qcom_scm_create_shm_bridge);
+
+int qcom_scm_delete_shm_bridge(struct device *dev, u64 handle)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_SHM_BRIDGE_DELETE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+		.args[0] = handle,
+		.arginfo = QCOM_SCM_ARGS(1, QCOM_SCM_VAL),
+	};
+
+	return qcom_scm_call(dev ?: __scm->dev, &desc, NULL);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_delete_shm_bridge);
+
 int qcom_scm_lmh_profile_change(u32 profile_id)
 {
 	struct qcom_scm_desc desc = {
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index e6e512bd57d1..44d60d06344b 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -111,6 +111,9 @@ extern int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 #define QCOM_SCM_MP_IOMMU_SET_CP_POOL_SIZE	0x05
 #define QCOM_SCM_MP_VIDEO_VAR			0x08
 #define QCOM_SCM_MP_ASSIGN			0x16
+#define QCOM_SCM_MP_SHM_BRIDGE_ENABLE		0x1c
+#define QCOM_SCM_MP_SHM_BRIDGE_DELETE		0x1d
+#define QCOM_SCM_MP_SHM_BRDIGE_CREATE		0x1e
 
 #define QCOM_SCM_SVC_OCMEM		0x0f
 #define QCOM_SCM_OCMEM_LOCK_CMD		0x01
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 0187fc54249e..100770380d97 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -5,6 +5,7 @@
 #ifndef __QCOM_SCM_H
 #define __QCOM_SCM_H
 
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/types.h>
 #include <linux/cpumask.h>
@@ -117,4 +118,11 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 int qcom_scm_lmh_profile_change(u32 profile_id);
 bool qcom_scm_lmh_dcvsh_available(void);
 
+bool qcom_scm_shm_bridge_available(void);
+int qcom_scm_enable_shm_bridge(void);
+int qcom_scm_create_shm_bridge(struct device *dev, u64 pfn_and_ns_perm_flags,
+			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
+			       u64 ns_vmids, u64 *handle);
+int qcom_scm_delete_shm_bridge(struct device *dev, u64 handle);
+
 #endif
-- 
2.39.2

