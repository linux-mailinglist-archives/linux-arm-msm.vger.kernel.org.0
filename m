Return-Path: <linux-arm-msm+bounces-1145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2067F143E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 14:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8781D2820C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 13:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F53A1B274;
	Mon, 20 Nov 2023 13:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0fkW4OSB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F1219A
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 05:21:32 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40790b0a224so14376285e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 05:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700486491; x=1701091291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkxpnfZSZT5EN0UFZSvV8zs0Wwv4/j6hiBpdKDk1HxA=;
        b=0fkW4OSBCt98iLavL9DAiH0a3/5HVqWub5s4juyv57+6oMjTjRTRtDfRnqtipPQ8RJ
         1WLGRB3KAC5z1c6xjdfcIds8FwRXbnZXDtLSBgTq33TjlUYfsgMIzUrMVkfBNosWYmx3
         TNwvtqE7FjxGrXOCyFFNVRkCE27bCOJrYQSIQhxSu/xGzVG3jfJQ8I1n1QkV2nuM1xaD
         xDIzKxXPN+Xi97EDWYCuyqzZyF2U8pIeajugm4Xrh6pFhId8a5XLD+Eg1USxXyctG2d7
         u+KVxZWb74CSbYO2oIaI7YCYwhTQs8pmkCw7wyj+/iC7BBaYuobciiFEwti6mJ0jkWGq
         x/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700486491; x=1701091291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkxpnfZSZT5EN0UFZSvV8zs0Wwv4/j6hiBpdKDk1HxA=;
        b=rCJdnSDzvwXwpNPzazdViOmND1ls0W/GzQmXeYob92dRAMUm3t1+gv/A0WrVpPC9pI
         vEbT9ZwlOgEmKo5Zqqr3+i3xkOB2lMwe/+OTYADRUcK/iOewTRGKszva7bprz1Z8h0fe
         McXv2x8KF1mN9DeEcTt+sAqQg9IEtZIW/Qqb8WdGTviHnSiGVCjC6Kj4srTRGkB8RGOI
         vjCYFa6I+1QV5kyTlRFAkanPPmgdpFAjh8pAU/dI/nmaR7IBBUi+kYhNtUOtVmqJw+tb
         XOB9pddi5UbsizqGWWTZhZaC3Vq5GjcoRCAHRUJ7H0mAz58WdYkr4GIpkPTYWpKmUR+M
         0giw==
X-Gm-Message-State: AOJu0YysGmgLyTdDpESr38oPuekL7k2uZD2SP21FVV7Kd2Oho/5RC1Ic
	ZfGQzVGZDpLxGnQYexqRE51vFA==
X-Google-Smtp-Source: AGHT+IFm/Mr8qVWYLC8Ecyaod4ToK4uO5bpR7HrYGKe9vH3BqQvjYxq1eycOb42ikhp42B/Ccx7p/w==
X-Received: by 2002:a05:600c:3b8c:b0:408:37aa:4766 with SMTP id n12-20020a05600c3b8c00b0040837aa4766mr6455184wms.5.1700486491352;
        Mon, 20 Nov 2023 05:21:31 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c590:a7ce:883:eba3])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c0b5200b004065e235417sm17329192wmr.21.2023.11.20.05.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:21:30 -0800 (PST)
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
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RESEND PATCH v5 07/12] firmware: qcom: scm: make qcom_scm_qseecom_app_get_id() use the TZ allocator
Date: Mon, 20 Nov 2023 14:21:13 +0100
Message-Id: <20231120132118.30473-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120132118.30473-1-brgl@bgdev.pl>
References: <20231120132118.30473-1-brgl@bgdev.pl>
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


