Return-Path: <linux-arm-msm+bounces-10393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACCE84FE74
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8107E1F240EB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 21:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E7A4204B;
	Fri,  9 Feb 2024 21:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KefW0spb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2E63F8F4
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 21:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707513018; cv=none; b=aD0s3xWQNPv1ZwcNsZKc3BMjchROS0EutC/Mc90nD6bDWTdyR6ddsXZ4c+7LSkUNulkMJK0r+HmU+tFB7pwM/hHMdp+//8+bv58riaQlzQSnJCT1CgurcqdcBOo82H2taRtaiQSoApMizsOBjuBOCTl99VoZAoEODNSnP8zA7Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707513018; c=relaxed/simple;
	bh=SxDGgEUtWHupji3kWcgwRwlcQnOElKd5P7BQasbPYTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gEXnCfPZGuUjdQjOEKPsxXqbPl8P8IwvASsXkNzMK7lBYH2OahzfI4URyhPW1SC6m6IkeEt6ns8Tu3riRNK7wKksgK1iVfpqNAvJTueB/Btz0ZGQm6xpbqvSoJ46pA8vvCbAeRQIyMMY9Ee6ZMtuYaD1Kk5k3ZRoknxUgpBCeLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KefW0spb; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a28a6cef709so188657566b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 13:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707513014; x=1708117814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SA9Lb59KC+nISC8BTRPiv1Z4bw8dFbjLbRpUOcP2HoY=;
        b=KefW0spbhRtS7VxOPjB3UkOU5CxHOAjIGudtxwHXuAYkdhTR8gOstfZfNsGbfG7wbW
         15hi8QrgAjZDQNKWQTRXQJnfA3JuUfAN/q7L+VzzvXAi2tW9BSWdRp8uuyVtgkyZQjv0
         RQ1G98qHpv9efYPcMTHNit5EsHVwgiU4m8x9X+ui/P/0sJBruTfy/8FDC51yJyVSbLDP
         6NUGVdiu30B8EZaJZnAfEiwO5F9/ihb+HjDhWLVof4FdGdmBSrkfoPsio1f1f3jdm+8q
         E+hXnQdjlhV4e8mYdFWkjJPJtwY75X2ox5j326NJcW/wx7nGE3nWyC9iwyofcFCibeHB
         9wUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707513014; x=1708117814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SA9Lb59KC+nISC8BTRPiv1Z4bw8dFbjLbRpUOcP2HoY=;
        b=EVCQQ6Bxo7bpcvP4Xm9lxhDNOtKo1xmppeCrF+bv7BtXsg3IHwAMXa3kOitd4JmSNK
         y8beZ5eErDR5K+xdLsxISn84PV4ZqiWW8NaDqZE6PcbyaGz8xRZSrFKnHasw6Bp5t84t
         9YJK5hsztQLNcdVoqydHVJ7LDI/yz+WzQ/7+SnbhmvehP5YF8PbN8gTFTNsHdoeiiobo
         autbqgNUi8aAZ0FmfArUAeo+tuglfRGRULJoMLzr6INwHVyveS1ixnq485A0HRaDfyZT
         pi+FGl1AjMp3aU/+5gJ1IUazLaT4RIhrvOcWpJskcte9fyU00m6RoG88qoB7xGbThgo/
         K8yg==
X-Gm-Message-State: AOJu0Yx8aIZa1sHnk6mrWoIj0jJY0Y9idYzQpoIMGs4mV4LQUxYpHQUK
	WpkIJRF01YuACYXSlpkiJUybvjb7PijqFwqvbs8SbscXmMKjp83Mldeh0FFoEmg2t80X6/2EMev
	c
X-Google-Smtp-Source: AGHT+IHicqWilmWSII5rZ1Re/aDm6w+5uwDxEUNhIEGKLnMpzX+wfwnWXZUpp5H1cOVgVxUri2sAKw==
X-Received: by 2002:a17:906:3552:b0:a3b:fe76:d666 with SMTP id s18-20020a170906355200b00a3bfe76d666mr225304eja.0.1707513014654;
        Fri, 09 Feb 2024 13:10:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+m0k+l+lLW+83FALDzJXW1dXJI4jsvzqwreFZQ5MH667zVDGstHsy4UTD4EFsHT6dNShE9GcWOjcbij7kGMGJraEryqx+6dkdMAiT1jxCGrK/e8hAsph/JYu4X3WXYix4CiQLvFUyN+P/KelycXipHdG3FonRteFaevQ17ZoVOU2YLTQxKWW8Ts2IBAMzMk19ypMLoXN5iLfJHCBwD6I6R+CTXO2W1oil9DKrhzT8Rw6Ke46Gw584uJOYs4F5kEuqAGdF34w5eUGizX3VFOYngJ10UYzetDoaq9IrRGQsQRM5dVUkULxAZw3evOFVvVlHBmJA8eJj5Y1AsSYz+3JeT56bd45K4+gGFK0hxEv076PGAqukmTP0pyuNg19ehwP6MW4PLSM841Xd3SwAJFfdefnGxVlonOF1fVuZrEJ4NWx7LLYVi9jnfp9VMD8kRqWLTOWkXN1VR/X6EYO5IgNZT96JZmoZeTEJi8XyutDRv3vmyH9YbewVYmzGYF17TpmljQ==
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id vo5-20020a170907a80500b00a3be3b27d0bsm1056517ejc.49.2024.02.09.13.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:10:14 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 09 Feb 2024 22:09:59 +0100
Subject: [PATCH v2 15/20] media: venus: core: Define a pointer to core->res
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v2-15-3dac84b88c4b@linaro.org>
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707512986; l=1808;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=SxDGgEUtWHupji3kWcgwRwlcQnOElKd5P7BQasbPYTE=;
 b=JlVCMhjWXh7JcvSS6od2SXkwsAUSLCX2191XVANLu17F3Xf11AmPRtaUq8Hx0hUpKs8M5UI07
 owAZMrHdJIXAPWy19gsvnVrXxeJHsIThsUFMbF9qiw6KLapNOngONvH
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

To make the code more concise, define a new variable 'res' pointing to
the abundantly referenced core->res.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 666adc5aac38..70c3c9dc49c6 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -285,6 +285,7 @@ static irqreturn_t venus_isr_thread(int irq, void *dev_id)
 
 static int venus_probe(struct platform_device *pdev)
 {
+	const struct venus_resources *res;
 	struct device *dev = &pdev->dev;
 	struct venus_core *core;
 	int i, ret;
@@ -315,9 +316,11 @@ static int venus_probe(struct platform_device *pdev)
 	if (!core->res)
 		return -ENODEV;
 
+	res = core->res;
+
 	mutex_init(&core->pm_lock);
 
-	core->pm_ops = venus_pm_get(core->res->hfi_version);
+	core->pm_ops = venus_pm_get(res->hfi_version);
 	if (!core->pm_ops)
 		return -ENODEV;
 
@@ -325,8 +328,8 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	for (i = 0; i < core->res->resets_num; i++) {
-		core->resets[i] = devm_reset_control_get_exclusive(dev, core->res->resets[i]);
+	for (i = 0; i < res->resets_num; i++) {
+		core->resets[i] = devm_reset_control_get_exclusive(dev, res->resets[i]);
 		if (IS_ERR(core->resets[i]))
 			return PTR_ERR(core->resets[i]);
 	}
@@ -337,7 +340,7 @@ static int venus_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
+	ret = dma_set_mask_and_coherent(dev, res->dma_mask);
 	if (ret)
 		goto err_core_put;
 

-- 
2.43.0


