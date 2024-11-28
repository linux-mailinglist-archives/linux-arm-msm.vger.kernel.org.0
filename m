Return-Path: <linux-arm-msm+bounces-39478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A4F9DBB27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 17:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19C991643F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 16:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6739F1BFE0D;
	Thu, 28 Nov 2024 16:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cMZ/3rWr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6EF1BD9DB
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 16:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732810915; cv=none; b=FvEf3YcgpeAiPLtyrzi8bwz7zqigeEPWzCQYL1b9OqPF3zxTjHT2C2bEfpTt4kQ6RGyOO3uQn4zogOed1L5gSe+uhogwqhcVDm4I7aNQDwnp+CGNZwTtUPk9UpWI28uwQGsO/7lQskSlilLZElrqK2HSeGi2F2kvLoOOrEJ3ezs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732810915; c=relaxed/simple;
	bh=QBlvh42wEu8WJ3ZX0DLU3rSfBDhhQkJ+tEIxBMvq6eQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hn1h2czP6VIxruPyp17nUYCcB95M+Wvtz9URJm1fVia9Ng5dhObz1x6fisYQXrMdTqoutC4/R/V8d0eGdCLy3u0GG4Gtl5VzmV/msVY0thOPFbppeJcxg6Vym8TSX3byGEc2HxHN37QIcSH53QH/X3/hdGgvQq3G7XRbvGoCsEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cMZ/3rWr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434a099ba95so9036685e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 08:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732810912; x=1733415712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3cXlSbMt2J53GNfeBwFHks7qn8zy+yq2dkUxzhw6rc=;
        b=cMZ/3rWrM5hzwXPdRJPk5DvjgPFztXNKX90/Ls51MeZrztLulwgFdWVZGk9DuBv/fo
         JXlvuoFpb/s/tMa50XRPhviOudUrzutH7LFkuQWc/onYAHklo5AFdnxl6v4m5fmcyLt7
         QaR7Vq3UU6M106K77PtcR+FhGUmEw/7oRGmjjSrravCGt6yaldkZIrP0GeTbZeFafo/p
         BqKpGiz8baxnfmGuKJ4PEKZlx/hGjibRkH9La0G9SfOwAEEd45lQAFXiHiT0EBSdVoB8
         GChnUj7GVu6fZg2241OVD6oVvkWGMn4ojV6CVncwsqWZ8neDowXNOC48VjrWOtMKv8Xh
         ZW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732810912; x=1733415712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3cXlSbMt2J53GNfeBwFHks7qn8zy+yq2dkUxzhw6rc=;
        b=imDplaZ7B1YBAGNR1VUGiO2YpyhlqLWO0fzXRdNEdM8xlI1bwmue5qC7/sxU3eSRm8
         Q5oICJRswqTvs7A9M7driGzUX5FK2mC5X82nlkMpJ9D1jkTHN0H6O45s3gWLV7tC2/Cn
         vD5Dcyrng7VNVCD9B1i7W5baY1mCW6Vwbvr1MVYRcWdQGuDJSFM5rqxnFurTk4aOxm/L
         9gl7hoa6V0rMYNpGNz3XaSOtczeZvMcGfW4O2Joj8kOZCHuXBFnoCniC/ixMZItCrDmu
         EKc5NoltsZIU6qyeHC/namAYPz8oDk3CLINAq3Tmu+WjrXIz+8P3kqqrp4Y7AJ4/drbt
         mmNg==
X-Forwarded-Encrypted: i=1; AJvYcCV27T95Vhlg9d5AJEihYxhx3p5iAq8Hgnif1ivj4s5jO5PreiO3IkTCle3atyojZBjlD7IJ5BbHNz42WQZX@vger.kernel.org
X-Gm-Message-State: AOJu0YwmeBXDqfteqrsJ9jAju2IenoYL7TdW6frGH5MOFYg7fUTbh5uy
	DeR1Ovj1dpTTEe7+Hnv11GL8XHc0vHUwJgsymPtBMF9zIWjm7dDBIq9xAeCJw9I=
X-Gm-Gg: ASbGncsa8V7iTq6d38BhrJpMcMnOoRCNQZsFtrIVoW7umnOkLMxs4qiQFEj/UMSoJHH
	lxgaIpR4INKZ+V/7Cs8jR3Aj2CWtlNwpwXaeSsouw0ApEPL1E/8Sqfgq3L3tNR+rWHaMojeq1vp
	UgTcf7b8KrVkx20wJoSjltp/gIItrdCknacaIVlsPRJUs/7GiJ8r3E6HmLhaWbn4t+s9teU+x+4
	pqc4o7uloxB3BbdHLXGpPEkNXkrf/0NiDKDU1W/GHtHmn4N/igKhrFi/dQ=
X-Google-Smtp-Source: AGHT+IH2A1CDE5JVKe2dwzhkvr1V3p3l2bc+Lvq2Hf+xEtxIj89SkyS/KZUYVEcdsfpAcDDhdX6+DQ==
X-Received: by 2002:a05:600c:4f85:b0:426:647b:1bfc with SMTP id 5b1f17b1804b1-434a9df22c0mr81950115e9.30.1732810911693;
        Thu, 28 Nov 2024 08:21:51 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f70d9csm27004545e9.38.2024.11.28.08.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 08:21:51 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 28 Nov 2024 16:21:49 +0000
Subject: [PATCH v4 1/3] media: venus: Add support for static video
 encoder/decoder declarations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-media-staging-24-11-25-rb3-hw-compat-string-v4-1-fd062b399374@linaro.org>
References: <20241128-media-staging-24-11-25-rb3-hw-compat-string-v4-0-fd062b399374@linaro.org>
In-Reply-To: <20241128-media-staging-24-11-25-rb3-hw-compat-string-v4-0-fd062b399374@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com, 
 quic_dikshita@quicinc.com, konradybcio@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

This change relies on of_changeset() API as a result select OF_DYNAMIC will
be added to venus/Kconfig

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/Kconfig |  1 +
 drivers/media/platform/qcom/venus/core.c  | 90 +++++++++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h  |  4 ++
 3 files changed, 95 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/Kconfig b/drivers/media/platform/qcom/venus/Kconfig
index bfd50e8f34219db8a1de7960d7ea93b20db2982a..bc2e410b29cb415a36540a4f98709eae44f4ec35 100644
--- a/drivers/media/platform/qcom/venus/Kconfig
+++ b/drivers/media/platform/qcom/venus/Kconfig
@@ -3,6 +3,7 @@ config VIDEO_QCOM_VENUS
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV && QCOM_SMEM
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
+	select OF_DYNAMIC if ARCH_QCOM
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select QCOM_SCM
 	select VIDEOBUF2_DMA_CONTIG
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 4e26b18790537885a77d66c1917a4e7a146eaf57..8a085611443cfda89ae71496e320dfc1f02ade88 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -286,6 +286,89 @@ static irqreturn_t venus_isr_thread(int irq, void *dev_id)
 	return ret;
 }
 
+#if defined(CONFIG_OF_DYNAMIC)
+static int venus_add_video_core(struct venus_core *core, const char *node_name,
+				const char *compat)
+{
+	struct of_changeset *ocs = core->ocs;
+	struct device *dev = core->dev;
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
+static int venus_add_dynamic_nodes(struct venus_core *core)
+{
+	struct device *dev = core->dev;
+	int ret;
+
+	core->ocs = kmalloc(sizeof(*core->ocs), GFP_KERNEL);
+	if (!core->ocs)
+		return -ENOMEM;
+
+	of_changeset_init(core->ocs);
+
+	ret = venus_add_video_core(core, core->res->dec_nodename, "venus-decoder");
+	if (ret)
+		goto err;
+
+	ret = venus_add_video_core(core, core->res->enc_nodename, "venus-encoder");
+	if (ret)
+		goto err;
+
+	ret = of_changeset_apply(core->ocs);
+	if (ret) {
+		dev_err(dev, "applying changeset fail ret %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+err:
+	of_changeset_destroy(core->ocs);
+	kfree(core->ocs);
+	core->ocs = NULL;
+	return ret;
+}
+
+static void venus_remove_dynamic_nodes(struct venus_core *core)
+{
+	if (core->ocs) {
+		of_changeset_revert(core->ocs);
+		of_changeset_destroy(core->ocs);
+		kfree(core->ocs);
+	}
+}
+#else
+static int venus_add_dynamic_nodes(struct venus_core *core)
+{
+	return 0;
+}
+
+static void venus_remove_dynamic_nodes(struct venus_core *core) {}
+#endif
+
 static int venus_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -365,6 +448,11 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_runtime_disable;
 
+	if (core->res->dec_nodename || core->res->enc_nodename) {
+		if (venus_add_dynamic_nodes(core))
+			goto err_runtime_disable;
+	}
+
 	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
 	if (ret)
 		goto err_runtime_disable;
@@ -443,6 +531,8 @@ static void venus_remove(struct platform_device *pdev)
 
 	venus_firmware_deinit(core);
 
+	venus_remove_dynamic_nodes(core);
+
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 27784fd7082c321222b23ca4b2902a04c49e19ca..306231b4f7d0201175974b4a42574f30d23e08f0 100644
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
@@ -171,6 +173,7 @@ struct venus_format {
  * @root:	debugfs root directory
  * @venus_ver:	the venus firmware version
  * @dump_core:	a flag indicating that a core dump is required
+ * @ocs:	OF changeset pointer
  */
 struct venus_core {
 	void __iomem *base;
@@ -235,6 +238,7 @@ struct venus_core {
 		u32 rev;
 	} venus_ver;
 	unsigned long dump_core;
+	struct of_changeset *ocs;
 };
 
 struct vdec_controls {

-- 
2.47.1


