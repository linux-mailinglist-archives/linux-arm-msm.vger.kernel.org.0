Return-Path: <linux-arm-msm+bounces-39301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 824729DA6FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 12:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F950165D45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 11:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5D31F940C;
	Wed, 27 Nov 2024 11:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BI3fWVAh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E49D1F8EFA
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 11:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732707868; cv=none; b=tE1pXZSg/FXhBeURLUJ7GisSq43iFllAc2ixls1fYB4zswhskkTv56gS9KW3lugOjX8qeGj0RdQ8KVYC01MxR06nGxDvTfb0V2R9OsS0Obx0EhDNgXBKsXHzDJ0yE0oNMA2ImpnvWlLtUQA233g0lYUlAtNtGNznHtEYWU3SiL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732707868; c=relaxed/simple;
	bh=mPLzIOsMXumVzsSYo04I9Sy6D3KL3+6b4VayfdBVWQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T2S0iLde9RNWlzwnq9EOWQBrsst2p2fOj0/nGHgOGFiE9itVBOloUiOKDUQRr3W0vbpE1b1p0dAumaa5t01xYjrIWRePZFv1frW/z3z8KOh01+zRjF+MB+8Bqky0AWjijj1XYNsR4ixmSezcdA9APYCPZklZ1o5/I01GMghwGQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BI3fWVAh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434ab114753so3758105e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 03:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732707864; x=1733312664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgRvASRnNGPqVsywLIM5NoewkMzzRPcFogNk/blUYTY=;
        b=BI3fWVAhl9tdbMu/sBydbAuiH8nI8haGo7E1YSDLROVu4SskmkgfDTyrUyE/sr2R9C
         1mEqQvSH3tq0igsunNy24Owi6GfRpwUFdBSJRZnaQ4mCfs+OG++v5mCrC+G2h5PMSS12
         tkCVr83AIcm8jtRVgMARaLnwoSW4FP/l2mlcR5cHW6272GC0j8x50CH+6oxXhiE5B1Ui
         +hA2pN6mgqG//xsP9wYXXgno175CH7F7dzeLditey78ibHVy5sZrCJnKNuSJpGgqNKFP
         y2egmFH+g4hSM1jorQIeCJtnSngo9k6eelcWHNLnchBkbDivQ00As33W/feMZB2I9Jfi
         h/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732707864; x=1733312664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgRvASRnNGPqVsywLIM5NoewkMzzRPcFogNk/blUYTY=;
        b=cB77Bo2dzlSmeISk1WFmzcXKWlEGlc/LvbumqsxfYwzsor8u5q48Og6eAnFWYzm9+B
         u/F3panlCad23m3IfqKepHjY0eDiel5he6ED9pw8NauNk1ksc/g6ETqXmlYQRMRX8Nlp
         mdGwaSedlXD32QI5dvzfttOWs2CbPjYY1th9pTi3yETEzpm86WRgggVxjmLh3ZXDC2Yn
         lS/fJyjIMQAGyLy9gfU+/LZez1cFLc72leEf0FigwPO/MTURYQZZiSkbSbwo+K6BYW5o
         L32uMzjfUuj0M1JH38uW423KMKiYJq6dmTyMa4nH2fwvhlzAarrVufS/wojVSyI6wP5L
         rp1A==
X-Forwarded-Encrypted: i=1; AJvYcCU9FI5Bv7jWLV+nezP2/iuWiTit9RWWF5oNDy6wCqy/6/kmV0lOYZeKbHvEEF2xJZ3Eifq1tgUEuPeZv9PX@vger.kernel.org
X-Gm-Message-State: AOJu0YzUqpQxriqSfGp0MgL5PHZt6+6rfvIYDSZ2xD1oV/MtgsPVEi4I
	M3sSETYAAyEnOGS2g/OQXuUJAz9Gl1wSovY2kv8Yh3+OBJlBiBku2e/8ZPrACIJOBPr0yF9b3my
	kCEs=
X-Gm-Gg: ASbGncsemulGh5kYMYqzaGL9OGWwSL3/Fp+riEzHCbBmI9Gpt73fO05VMVF/tfgsPPq
	ltip4bOXFgY2m8mW4Jvv2BEQELTgLuRIBNQiDNpxxPMsWMrbNgJRTAr3Z5j+vdUYdyKezoB9ZYC
	vMv1wLB29goMEng+mZX8W5DPOHOUVq4xeHk3CS2kbwD70vpQCPQhp9IlsoHYsvSM2pworNaeOdU
	NpS7HsvImM4NDe7yHEL+qhOnFtqMTm6e3YfLiOBZ2OnYnMyVfeEc8BXM0I=
X-Google-Smtp-Source: AGHT+IHqACPaFAaxruo9TR3lJj0Md9Eg11jQTX9vNf4np+dj3QDhLTs6KMShKGdLl9uNDRr1Oq/wvA==
X-Received: by 2002:a05:6000:4819:b0:382:35e8:9818 with SMTP id ffacd0b85a97d-385c6eb7688mr2091643f8f.23.1732707863698;
        Wed, 27 Nov 2024 03:44:23 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3531sm16463586f8f.80.2024.11.27.03.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:44:23 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 27 Nov 2024 11:44:20 +0000
Subject: [PATCH v2 1/3] media: venus: Add support for static video
 encoder/decoder declarations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v2-1-c010fd45f7ff@linaro.org>
References: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v2-0-c010fd45f7ff@linaro.org>
In-Reply-To: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v2-0-c010fd45f7ff@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com, 
 quic_dikshita@quicinc.com, konradybcio@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

Add resource structure data and probe() logic to support static
declarations of encoder and decoder.

Right now we rely on video encoder/decoder selection happening in the dtb
but, this goes against the remit of device tree which is supposed to
describe hardware, not select functional logic in Linux drivers.

Provide two strings in the venus resource structure enc_nodename and
dec_nodename.

When set the venus driver will create an OF entry in-memory consistent
with:

dec_nodename {
    compat = "video-decoder";
};

and/or

enc_nodename {
    compat = "video-encoder";
};

This will allow us to reuse the existing driver scheme of relying on compat
names maintaining compatibility with old dtb files.

dec_nodename can be "video-decoder" or "video0"
enc_nodename can be "video-encoder" or "video1"

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 56 ++++++++++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h |  2 ++
 2 files changed, 58 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 4e26b18790537885a77d66c1917a4e7a146eaf57..17506d547a6172b89acb77879337750c22f993cf 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -286,6 +286,36 @@ static irqreturn_t venus_isr_thread(int irq, void *dev_id)
 	return ret;
 }
 
+static int venus_add_video_core(struct device *dev, struct of_changeset *ocs,
+				const char *node_name, const char *compat)
+{
+	struct device_node *np, *enp;
+	int ret;
+
+	if (!node_name)
+		return 0;
+
+	enp = of_find_node_by_name(dev->of_node, node_name);
+	if (enp) {
+		of_node_put(enp);
+		return 0;
+	}
+
+	np = of_changeset_create_node(ocs, dev->of_node, node_name);
+	if (!np) {
+		dev_err(dev, "Unable to create new node\n");
+		return -ENODEV;
+	}
+
+	ret = of_changeset_add_prop_string(ocs, np, "compatible", compat);
+	if (ret)
+		dev_err(dev, "unable to add %s\n", compat);
+
+	of_node_put(np);
+
+	return ret;
+}
+
 static int venus_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -365,6 +395,32 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_runtime_disable;
 
+	if (core->res->dec_nodename || core->res->enc_nodename) {
+		struct of_changeset *ocs;
+
+		ocs = devm_kmalloc(dev, sizeof(*ocs), GFP_KERNEL);
+		if (!ocs) {
+			ret = -ENOMEM;
+			goto err_runtime_disable;
+		}
+
+		of_changeset_init(ocs);
+
+		ret = venus_add_video_core(dev, ocs, core->res->dec_nodename, "venus-decoder");
+		if (ret)
+			goto err_runtime_disable;
+
+		ret = venus_add_video_core(dev, ocs, core->res->enc_nodename, "venus-encoder");
+		if (ret)
+			goto err_runtime_disable;
+
+		ret = of_changeset_apply(ocs);
+		if (ret) {
+			dev_err(dev, "applying changeset fail ret %d\n", ret);
+			goto err_runtime_disable;
+		}
+	}
+
 	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
 	if (ret)
 		goto err_runtime_disable;
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 27784fd7082c321222b23ca4b2902a04c49e19ca..4ce98a3ef186823a57ac40e2e8e42b08fafed575 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -90,6 +90,8 @@ struct venus_resources {
 	u32 cp_nonpixel_start;
 	u32 cp_nonpixel_size;
 	const char *fwname;
+	const char *enc_nodename;
+	const char *dec_nodename;
 };
 
 enum venus_fmt {

-- 
2.47.0


