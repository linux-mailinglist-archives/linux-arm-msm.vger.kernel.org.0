Return-Path: <linux-arm-msm+bounces-31368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0213E9721FF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 20:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CFAC1F25155
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 18:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E781F189B81;
	Mon,  9 Sep 2024 18:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Wyc/9orw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3CC1891D1
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 18:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725907159; cv=none; b=QmF/gtN6n/trV3/dkBMDAWfe765923ebnU586oX8ezPe31Qo3sbbz2tSzhhxC1earexLJ/PcYzjxYPKlhyJzA+VSR6jEY1YgitzhAqkmd8+Ol4deWSJhgSRV0cUdgPhwJTdSs9rdstDEcOmmQKL3GHFuBcxoLHr2HAB4kzKgJiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725907159; c=relaxed/simple;
	bh=4oSE+jnyWPvoY/e4qr9MxIJOiXeRnEt0PZyjDb42b0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rHseac6OB/hllH0YIboTW82kgrDidLP1ZtAZcc9j80SGMy66yuuNpDOJAZcoXnnWrlDX8ib49KKj9OTUdrR2hDLNVDvTE54dq1J5eVU4MN0I9Xn3CI7o/DndghP+bBqvR6HiJ/RL4rakW5+DBHTRl60hGQMoGnopCUF66twuQMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Wyc/9orw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42ca573fd5aso30241835e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2024 11:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725907156; x=1726511956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yg6+XBiIXxH7nJe9SH21mXCwMnJz2G3XE7vtQ8YyjJM=;
        b=Wyc/9orwlTJ2MyhCtjAbu2ScBdaimflb41Vrv0n8n2SuSY5IrOcus8o0lpzreULcsu
         xBaE7bXuFV4/Mvs44luS/3rKOgma2NECFUwMIYKz/e7CGmCB0/h+GVFXgCg3n8bBzt0m
         +YXwvVg8mtssp13/r5murB4sEB6g/urG2WMJMCFxD2sCUEO2xNAEP3KCr+hdOE3zKJM7
         CEAnS3+lkBKpu+RoPmVaFZAKJp82GMaFFsed7fI4N1nYM+v2xNqDLHPnekXblZbI+ik5
         CqG545k0BDR5L/i75hQqeg3imA7m3MLFyDGgvAeuhu3xiPo0rjCZRgsVKgzJAhYOsRhV
         AsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725907156; x=1726511956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yg6+XBiIXxH7nJe9SH21mXCwMnJz2G3XE7vtQ8YyjJM=;
        b=quiWSKC8LBMXeVc+pgWxOYRohPsgAykygWIj2dZ8xHgvdjJhkHe7RNY45GhiI00YIe
         HGNJIOa+g8OwUj8SOZdJ7RWiCHaXyvUIFOSnJbhyh6oTh783z2Qopu8TCAvWWlhaX6CO
         ZwizytD5PoM5jiaAYoVyTrAu2yCDrPVdfUZ8yh8YjkrK9LuLCDcOZXa0vicNrhFfb5aJ
         bJsGQY8n9emTAX3tVL4NVoN5WyubHGdn5xJRzCiLpdEYrW7E5mDR0+ObhkXNBLLbg3kW
         JVs4y6ybqHlft7NdLXskSAzq04NfEtzeKfpZIyp0L0gLcoMc1FgtKHbdE1jnlQzuh1Wa
         lDkw==
X-Gm-Message-State: AOJu0YyG8cxUyptf8YSkiiT2UspmHokPGtmHUSaJt4NuJZ0FL9GVdKVJ
	E2O+LPXLXnDKC2kejHIbW+MST0nHW55yUSmDhhF2ucKWmyXf/9CwFSg+ILB60yM=
X-Google-Smtp-Source: AGHT+IGrIS5RcF1gAShFPX5ZbNkp3oKw0MHQbEpkHH3hFT/uNyMtvuNztNFI/o7WaBbsdaWCSQIpSw==
X-Received: by 2002:a05:600c:35ce:b0:42b:8a35:1ade with SMTP id 5b1f17b1804b1-42c9f9d648dmr72352375e9.27.1725907154835;
        Mon, 09 Sep 2024 11:39:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9c15:247b:9be3:37a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956653b0sm6731721f8f.44.2024.09.09.11.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 11:39:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 09 Sep 2024 20:38:45 +0200
Subject: [PATCH 2/2] firmware: qcom: scm: fall back to kcalloc() for no SCM
 device bound
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-tzmem-null-ptr-v1-2-96526c421bac@linaro.org>
References: <20240909-tzmem-null-ptr-v1-0-96526c421bac@linaro.org>
In-Reply-To: <20240909-tzmem-null-ptr-v1-0-96526c421bac@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Andrew Halaney <ahalaney@redhat.com>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2752;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lHZMPhLJloTJCWEomY4zq8XA0jpQwZflYR5ZjRe6Ibs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBm30DQM9mZTCNoFEepkkZEa8k8ve6ZB9MBGOGQV
 GfBunyDzrGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZt9A0AAKCRARpy6gFHHX
 ckpBD/9RvVSC1BDheeE3u4dL48Uq/gegv+sOwQlU2od56faoicTrDtYNJ+oSiodF+D1T/3A6ues
 sb58YKvMD75LyWVbAJReNOfxZHLqZAwLkA3heH5wHKKnCQcBEc01sIwJy1HzhwLXiXRey1sHSXb
 t79YHSDtL7LjlskurS5rHX410l3IneaD4sgwhsZww1PR/noIABUAuxh9/UjrrLJ+ZXwMrVNAw2P
 LdP0HpVhit6Zr8ug06XI1/GW+yhpiTFabtjkYe3tkr+7ZEQB7gIzm75esElpY1qOt2tUswkReWZ
 63MXnoVqujpT7BBDH+6hiIIaM7K51R3VKjV3F+Gjzhur+nxEUvYXQQ7N0DA0HuGhgJd6hHW+EMn
 +8SwUv6ULxIMn1CqPfqabUTuw2x26dOgBV6VCsPQIwbRn8j50e4VeyBn+s/0A0rWWLEBwqm5agA
 vXYHpJyj6hi5ao938moSFz61uOMLO4Pc7/ZTzu9Ew64qspBezCuWADGSL58uqyAvd1sRQJVFFav
 haqK5U8yhYK0C7yRawq5hlSJW87wdpBQxYBAOvItEWNZ4kX+Xk9ZJrUcV4sBhTYeaTC81ubN79X
 c0eqVCS4pY74hLwoJzYK45eVNNBx3sa/usEXDbWwwmOeNe8LYvL35SRfSFUV87LpWVf+Qx3oOSX
 BKuISd1+VkpJZuw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Older platforms don't have an actual SCM device tied into the driver
model and so there's no struct device which to use with the TZ Mem API.
We need to fall-back to kcalloc() when allocating the buffer for
additional SMC arguments on such platforms which don't even probe the SCM
driver and never create the TZMem pool.

Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
Reported-by: Rudraksha Gupta <guptarud@gmail.com>
Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com/<S-Del>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm-smc.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index 2b4c2826f572..13f72541033c 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -147,6 +147,15 @@ static int __scm_smc_do(struct device *dev, struct arm_smccc_args *smc,
 	return 0;
 }
 
+static void smc_args_free(void *ptr)
+{
+	if (qcom_scm_get_tzmem_pool())
+		qcom_tzmem_free(ptr);
+	else
+		kfree(ptr);
+}
+
+DEFINE_FREE(smc_args, void *, if (!IS_ERR_OR_NULL(_T)) smc_args_free(_T));
 
 int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 		   enum qcom_scm_convention qcom_convention,
@@ -155,7 +164,7 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 	struct qcom_tzmem_pool *mempool = qcom_scm_get_tzmem_pool();
 	int arglen = desc->arginfo & 0xf;
 	int i, ret;
-	void *args_virt __free(qcom_tzmem) = NULL;
+	void *args_virt __free(smc_args) = NULL;
 	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
 	u32 smccc_call_type = atomic ? ARM_SMCCC_FAST_CALL : ARM_SMCCC_STD_CALL;
 	u32 qcom_smccc_convention = (qcom_convention == SMC_CONVENTION_ARM_32) ?
@@ -173,9 +182,20 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 		smc.args[i + SCM_SMC_FIRST_REG_IDX] = desc->args[i];
 
 	if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
-		args_virt = qcom_tzmem_alloc(mempool,
-					     SCM_SMC_N_EXT_ARGS * sizeof(u64),
-					     flag);
+		/*
+		 * Older platforms don't have an entry for SCM in device-tree
+		 * and so no device is bound to the SCM driver. This means there
+		 * is no struct device for the TZ Mem API. Fall back to
+		 * kcalloc() on such platforms.
+		 */
+		if (mempool)
+			args_virt = qcom_tzmem_alloc(
+					mempool,
+					SCM_SMC_N_EXT_ARGS * sizeof(u64),
+					flag);
+		else
+			args_virt = kcalloc(SCM_SMC_N_EXT_ARGS, sizeof(u64),
+					    flag);
 		if (!args_virt)
 			return -ENOMEM;
 

-- 
2.43.0


