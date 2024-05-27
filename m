Return-Path: <linux-arm-msm+bounces-20614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8318D00AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 14:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBDAB1F24976
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 12:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A0C15FCFE;
	Mon, 27 May 2024 12:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="foLsXYh4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC37A15FA7C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814615; cv=none; b=fitJa35e8TwP4T4emw8asl/9QhfFDQ1SZMppn+oM5q0Q/jMwJl/7yX5Z9zb/SU/cM5U9PD9Ciam/bdiYSlSzMt4UgMjFIyQa+X+hm30rmDj00YAxtJjaf685ppUF0CheDubarn7E3CO5sBR/VKfj4fo6oUhIsT84xgz3bqf4HgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814615; c=relaxed/simple;
	bh=xxgI/UhyMB82C1qEQSVaAP1WaTAgpbIjZv3NAezsLC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LGHT9/O27NMqrud/jWpfkIO5avjuCCWUHQgqvWwwxQiWbzB28Kk8wbjjVAQmQpOlBV6gX25gwgjXCUih5QtW8Jz9Nv8kvRDnsWO70IpBuaryGhUswJeCyGgHruKMexqlhtPWH4tyRASqNRbT3zd8xInxz5mf/0iumc8oQxxNIgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=foLsXYh4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-420180b58c3so84805415e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 05:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716814612; x=1717419412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+c046Bdr0ynwyOgSln2Tc+VCr+O70Cxi2mOC+fx0Sgc=;
        b=foLsXYh4qFueGRrI2AVY9dAgXBFEqs1JYFS9sw5e0ChsqNObqtoburIyEOwb+Nurjd
         EPC1JMqHQO22zHraQqq3EAUhby+uooZvjjUk2HH5Q5Ou4P3NmeN+AUVHVFgaPNvrOrk1
         2BkGq/6sDWeJhYdBmvCLYZIfTWIyuWR1S+HpC1UJMGcRrnFiBdooBdutpxpYQ0HmGOOe
         73bpD4owKKl3q5pGHGAwCXi+spyN19wXR7x+YVfGmMFuYwwxtILxhUvL23vVy6lsWk1l
         yLfCsB4mn7XTDb8CaZPoEeoGTbg3jfAJbfcUh0hF7ZRmuAHxcoFiIK8y5bxxG9nWSEc/
         8pPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814612; x=1717419412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+c046Bdr0ynwyOgSln2Tc+VCr+O70Cxi2mOC+fx0Sgc=;
        b=DVMEPnSy6zmWYTDDAmSOdXaAczlScqyXQT8h68QguimDC+DaOQKSRuTGPEg8P/oBJ7
         tbBmLO9hUdBjGhtoBpsjydrAaVn3fWAefkb7znhmq1HjW66j5JitfedvlwA/Pz4IFnrQ
         5RFN9xQPRSibWNqihfzRfvLyQEmvb3kvFmqgTT5caClI5Sj0QhLhXJm+jTBltiFqKrYt
         Ys4F0wQ5cSNgAhVk67Y4t1U9fB7CMUSoAUjmSWXHuSGv7ya9BQtyW6SasnHi3dsMtZU8
         7G7jICEfTYKsv2uKrzyEk1n1V6oc94KQyTStOWKlp3wVLQDU7w+ECoEXSg3F3puivcwW
         mkeQ==
X-Gm-Message-State: AOJu0YzXnCRcCDelLHY0ViCcgGx+/S+fb3rtXJaU8AHqAyRin6ySMNdJ
	JijCyGerq0LJowcxzMctU+EnusTKN+YuBoEZpx5YDpkIWVN4xCKOGDoBhZx1Fq4=
X-Google-Smtp-Source: AGHT+IE2gTcbDyOT3LtBhlMuLEGMxzOENkdyS3LSefkGRJfYypqkDhxXggWJr/I1ETWNNNhg0wfS3g==
X-Received: by 2002:a05:600c:4f03:b0:41b:a8e8:3ff6 with SMTP id 5b1f17b1804b1-42108a59341mr74758545e9.11.1716814612385;
        Mon, 27 May 2024 05:56:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f64f98sm138753635e9.24.2024.05.27.05.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:56:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 14:54:58 +0200
Subject: [PATCH v10 08/15] firmware: qcom: scm: make
 qcom_scm_qseecom_app_get_id() use the TZ allocator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-shm-bridge-v10-8-ce7afaa58d3a@linaro.org>
References: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
In-Reply-To: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, Elliot Berman <quic_eberman@quicinc.com>, 
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@quicinc.com, Andrew Halaney <ahalaney@redhat.com>, 
 Deepti Jaggi <quic_djaggi@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2227;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7umXsYKArEL0srTFmXFqr8mt5W7AHZJF369g+7+Tqjc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVIMJTRxwS+kt5btO67A4DzS6y415jXXLTKO3i
 6DJkEALlKOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlSDCQAKCRARpy6gFHHX
 cmjKEACGXQSfVd+6Go42DHvh1gdSwWk+C2H12J4YBJDJAr9wtyrvDLFn/Ogl1RERoQgeHloq2kE
 cacBTADkSTFBZ9b4HRa8Bi7fgUO/E78XqzVQI/P4CDT6mh5oTVTdFdblcjEu0WqkaefaXkbmdFQ
 6L9poeuuKB1Zo7wFHADzjGOovexLfNFw3MwuxAcpnz3gyhGypZal0/+BXSxvh7URKEIR0kPOdpD
 4orKX/PLU0Rh5NGQNCKXoVSOFsAX7ByxbIwA/cdDa+Dsb04iAoxrFt0o4j+Dck+OdVE96t8DZD7
 KixZ3PwCM7y7oRiyQOonBjBKCL+7nmN7cnhvAjGUa4mVtR0XbmpNJ4xDtuhP9OWgalKE6KXRxaG
 T35nBF5EsSR9IkPkIrxrRBX+ATQLg0My5SPZAxlKSNMQnbfwwAbO8tBzIjDDE7h7D0gBex996xO
 AOEbvu/onr9YO5iw/oRnZBod4SGIvQn/PlhRvwqhBOOwF9U5zkh++Kbzzq03V+XJ8se2TvMhAQq
 f1xrOCk7wgxjERoavj6FsEj+Tm/iSTK0g/WVDzPgQXIw5aNEPu3CpsYZL/kTuY/cIWArpSwnqAZ
 dDL0i9ET4YALX3RO9d/Y2wbAAZmSgkl008XTsbvUr0smoiY2eeZRW7Blor96VGIT5hmP3MfJm66
 6b+WcP2CuQYEbRA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

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
index 431c279df12b..1b64a4f4d07d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1546,37 +1546,27 @@ int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id)
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
2.43.0


