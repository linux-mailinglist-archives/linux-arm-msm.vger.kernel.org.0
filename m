Return-Path: <linux-arm-msm+bounces-15444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8CF88EDEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 19:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E89B29CBDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 18:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5DE214F9F6;
	Wed, 27 Mar 2024 18:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KqQr7cX5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAA1154BE9
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 18:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562969; cv=none; b=peL8lZren/FnPKBxkX7dxsjcNGe8IBJLHWoumW1J+f5/5Ch8/U16UDJWYGybxNpikbdvRSbIhRaebSxwhqQfDTjhONOqOlO07bJd8SaLaCuN1bVy3DbztvoKyNnJripcdRwpGMN7uV+ASIulyilMd6atgJgdewk7jKlEFOoRyFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562969; c=relaxed/simple;
	bh=3qglLyapUHx3u+l/QabEvMvzkmj10BvUO0XdDxR56GM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j/esBL4WucuZNKB2qqGaXv1B5qwd6BYVclfwpy/9wPdN4DXvWGjlJkcPnKaFMpSKakKnsrGmexFo+QSdzjXI6NWNmkJsK+CD2NIM/spye2PuK5p5so5dX+JTt/oSjpA3K3Rskhv9nnRsUVTlODOTZmQ2BPbvUFvA4IoTTRgHYCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KqQr7cX5; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-515b3077d09so25791e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 11:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711562965; x=1712167765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ny0RW5yHEK6S0vsSjArXEVaJzkIsrNf4sgwhXeVchD4=;
        b=KqQr7cX5GNzc8hL1on3VS21JEi2s0dCnyZw7z6ps7O2HI/ESB7VeChm+aQR6+WGS2l
         T6/KgYlTNBdcDxxUshh6aQJ85fMYfilfbDDyG3Dc/rR4IpOVdQEKyH+5l0hPFG5K6Zj7
         G90wsvE1LwLpOpGNExVX6W4Onyoa2kK3wfbikuJUBpmmfA8ha0UKX85Q2A5hzraF0pcm
         LsjNwzH7G4wRYorLY6e5LOm382uWn6hgTGonpkS5h06JH3XNJ3pFgR53RrJbI2z89yIU
         ErBQbGZyCqauLR2IiCnKUcDMA/P8Axb0zDBziYQaujVVy4+OBFA7LrgXYGdn+rceOqBX
         ZdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562965; x=1712167765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ny0RW5yHEK6S0vsSjArXEVaJzkIsrNf4sgwhXeVchD4=;
        b=m/oWaU9imNuZN3LhT7BlrXyYCiXIUpkblx+0qlsK1T2ReIF0+kdE9PQTDXN5ts23bS
         Eo5r+FaCR5cK4+KFo4GDwrH/iUi8KnH7a2Oq3PAnIrw/8zPxM8ZDMhNkTB3ko0tR1ThI
         kp5MljJOg9joWJzTkL/11QK95RfyGDp4Gzpdm5n2vrlQKzewpvSEeAURRAUb/pG8zpN6
         E9jnObCgk5JOg5DRn6Ec3as5vb6lJ4Vl+Te4o+AnUPvJ2GBCfUNsYrliMkat7j3SE7sD
         BbmnqN3nQWwR9lMEmP/nyMv598g7QdsAqOwxdmqlhCODwB+uWh2WpJphk8MkRBJFiXll
         ZrKA==
X-Forwarded-Encrypted: i=1; AJvYcCWtHWfZ8Fd6Pytw27Mrwn4uHybInmGtMScx3wBXgB5zTlYFQctBOEzIztXB1umSWrIs2UncmX0DHw0iu/7bo/I1esRdLq870lQ88UeJAw==
X-Gm-Message-State: AOJu0YyKSLZBZ2XLwoXxFHbM4D/7uC4hvV7q003xReZFqiBO30Lu6qDO
	XjnlGHnwDKpWZnCxQBeKV4WuWoch9h/jt+pbXE6uTvR0GMAmuQWJ/Xp7lzQPaN0=
X-Google-Smtp-Source: AGHT+IGr8pV0It2QpBVSB+Pd9tNgUL6Wc/gDbqEM/BPqbtguUMYzdOlXaG/lV8H4AQF8cjX7mO3v2w==
X-Received: by 2002:ac2:47e3:0:b0:515:ad59:d46a with SMTP id b3-20020ac247e3000000b00515ad59d46amr184301lfp.21.1711562965051;
        Wed, 27 Mar 2024 11:09:25 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709060be200b00a45f2dc6795sm5702733ejg.137.2024.03.27.11.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:09:24 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 27 Mar 2024 19:08:57 +0100
Subject: [PATCH v3 19/19] media: venus: pm_helpers: Use reset_bulk API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v3-19-79f23b81c261@linaro.org>
References: <20230911-topic-mars-v3-0-79f23b81c261@linaro.org>
In-Reply-To: <20230911-topic-mars-v3-0-79f23b81c261@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711562924; l=3507;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3qglLyapUHx3u+l/QabEvMvzkmj10BvUO0XdDxR56GM=;
 b=7CWOWi2OztLdyQck6jwMllwgs6Ti7I20v4+82giroq/8iguIMd2hwLCi1bm402+/K/9ReYDt8
 CtycxK0Qi43ABsCBsfUanSiexz7VGGmQiNhGh7FWiEdu5GvKpUlGAFC
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

All of the resets are toggled together. Use the bulk api to save on some
code complexity.

The delay between resets is now correctly determined by the reset
framework.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c       | 15 ++++++++++-----
 drivers/media/platform/qcom/venus/core.h       |  4 ++--
 drivers/media/platform/qcom/venus/pm_helpers.c | 15 +++------------
 3 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 6914fa991efb..f1762c725a11 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -328,11 +328,16 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	for (i = 0; i < res->resets_num; i++) {
-		core->resets[i] = devm_reset_control_get_exclusive(dev, res->resets[i]);
-		if (IS_ERR(core->resets[i]))
-			return PTR_ERR(core->resets[i]);
-	}
+	core->resets = devm_kcalloc(dev, res->resets_num, sizeof(*core->resets), GFP_KERNEL);
+	if (res->resets_num && !core->resets)
+		return -ENOMEM;
+
+	for (i = 0; i < res->resets_num; i++)
+		core->resets[i].id = res->resets[i];
+
+	ret = devm_reset_control_bulk_get_exclusive(dev, res->resets_num, core->resets);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get resets\n");
 
 	ret = venus_get_resources(core);
 	if (ret)
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index b4c41dc0f8c7..287bcf905057 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -130,7 +130,7 @@ struct venus_format {
  * @pmdomains:	a pointer to a list of pmdomains
  * @opp_dl_venus: an device-link for device OPP
  * @opp_pmdomain: an OPP power-domain
- * @resets: an array of reset signals
+ * @resets: a reset_control_bulk_data array of hardware reset signals
  * @vdev_dec:	a reference to video device structure for decoder instances
  * @vdev_enc:	a reference to video device structure for encoder instances
  * @v4l2_dev:	a holder for v4l2 device structure
@@ -183,7 +183,7 @@ struct venus_core {
 	struct dev_pm_domain_list *pmdomains;
 	struct device_link *opp_dl_venus;
 	struct device *opp_pmdomain;
-	struct reset_control *resets[VIDC_RESETS_NUM_MAX];
+	struct reset_control_bulk_data *resets;
 	struct video_device *vdev_dec;
 	struct video_device *vdev_enc;
 	struct v4l2_device v4l2_dev;
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 5d174b83926b..7690f66d1184 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -865,21 +865,12 @@ void vcodec_domains_put(struct venus_core *core)
 static int core_resets_reset(struct venus_core *core)
 {
 	const struct venus_resources *res = core->res;
-	unsigned int i;
 	int ret;
 
-	for (i = 0; i < res->resets_num; i++) {
-		ret = reset_control_assert(core->resets[i]);
-		if (ret)
-			goto err;
-
-		usleep_range(150, 250);
-		ret = reset_control_deassert(core->resets[i]);
-		if (ret)
-			goto err;
-	}
+	ret = reset_control_bulk_reset(res->resets_num, core->resets);
+	if (ret)
+		dev_err(core->dev, "Failed to toggle resets: %d\n", ret);
 
-err:
 	return ret;
 }
 

-- 
2.44.0


