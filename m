Return-Path: <linux-arm-msm+bounces-39337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD719DA9A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 15:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52D08B231AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 14:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173591FDE13;
	Wed, 27 Nov 2024 14:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iserlLWp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FFD1FDE0F
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 14:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732716335; cv=none; b=LkgK7eFK9LWG+0F33mr9E+D2f/WKNZkuMdo2Ms5AVGPx8qsSgT9xOHH4AxxEwDgFYlrNqZsBbFzAhYXujavkAWCG4gnFng8hyHpRCeNs+wOR9EhPTpMbeQXPvP2kpsj9UimBfq7LC7vNliqyw7TtrkCgFqiyxRLr9Njz9TxNsMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732716335; c=relaxed/simple;
	bh=Jun+TNcIcdGqyR9m9r70xX2+3XMcbqQf7N5g2lHQI8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tcNw66xF/A7nTpXms2f/jiPEAnPphcblTa3RZoAkrchANMcfx3B0Umliul2ore8tOFMSElwG2fLv73vivybrzjKJVIVKSeCglx+TmV8/9+NY/05OSvcaqLVdQFT9v+TT+dV1Ua8hiW5/7PtbVicHp/Poz2RaKd1qQs721QI6Jys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iserlLWp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43494a20379so34568365e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 06:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732716331; x=1733321131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkyjHovVhF2za/eO844TdXiyUkiQq2AjnkVKs/psESc=;
        b=iserlLWpn/i5h0MWrpI/B1lR8seCSXu2f+8AGYD1EORvWu5VLGH+ldOUTMCjasjyqW
         TFpU0LB0E5h3MxT/ivZBiLf+F7H4P41Mr1SrfbDEz+A0UUsQeHK9bNFJb+z/GUvAf5Oq
         qo+rm/WG9poXvCs2Cw5AAiRTYeqwhZQANpidFswgoLo1bO2LHBg918RryBDXzZ3g/jRN
         keoJLIfMY5wxcVmjnLTOWpN3EkSGeWdONGL8aQIfu4UbcjNO0sf0U3GAeRO1D3ncWm+I
         BAmhFqrij3c2Chd7atlJejC2B1i9f4aLVa5iDQBgdyXjDI90yudOY5ki0YQXL8KszMrh
         ndlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732716331; x=1733321131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkyjHovVhF2za/eO844TdXiyUkiQq2AjnkVKs/psESc=;
        b=k03Rq8sFqMLF1LYkt6QP9A1H4CQ8LKIP8BshSWbRUMFBdiIhFv8hb5WCH0/jnWdrqA
         lI9T6NPGDti/mN9e5ZKJMR9u92+zRsRFVxq53Y4BQH+ddTfc1x4IGF7lVJxc8s4F93L4
         s7vTIvJyWjVeDHkmzwCDgaq9GBueLW/kTbRh/3UDHglqXcRYByr/+Z1RuQT34qZodMK5
         PeSfmj681NojWCcTbdyViLC/5XHWulO1+oHxJTV0F1KzCZy0JcZIFimNRxk3G6lZu0B8
         Y5a4PNdVuqoAPXw9nVrwWsKfF/L3ZFkNoM0sKb/9JAFv/mU5xHgfOY8ehj4XvxFOQyDm
         RZFg==
X-Forwarded-Encrypted: i=1; AJvYcCXkT0k3F4o1Nm0NhapPsjb+fV9ujCSe8hzRz1gvmyBehYn1ATXmSpUYLfqN9jNTu+V1+1u8ZI98ZskBLoDS@vger.kernel.org
X-Gm-Message-State: AOJu0YylUx/VGWombye5bHhvYG2DWHsCOciVOf+hKpCzZfqMvF6mhykZ
	fDk38KsqZPK/XAlhhpkbnPMr4ZpNti2iU4akiKWQOoaERPLKtKUc2cT9Wyo6l71qgpwWbOPj2oE
	YfWE=
X-Gm-Gg: ASbGncsb+asFX63nouRtvltCrDCOh+B7TCXVgdBAozGhTudHc4I43PERsKI6RVVyGcM
	+9m5orI/iDKwnd+em6QWL0aN2Ut2sPbXEuJ4fNYrKPpPXr2rofz0miGbv4cYS2ArqEUqMtYSTjs
	G3ukZoUiH/kZOhg0gKW/tklMDURPBiuy//bnjXPGItFjuehbGqHlobl03mznR1rzATJA4LrGkjt
	8dO/QBjHNwTf4fmEEOhgI0vibNW13J4nElxv6b4XJFhWAO7e5mLoyngybc=
X-Google-Smtp-Source: AGHT+IF+evUzX0S8G+s/qBLrp0Ga3c5Qz719qieeSbz4B54bkNLs3TgSrjjpGZtLuEOmAL0xZLK/gQ==
X-Received: by 2002:a05:600c:3aca:b0:434:9e1d:7626 with SMTP id 5b1f17b1804b1-434a9df6a16mr25687795e9.25.1732716318018;
        Wed, 27 Nov 2024 06:05:18 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad6436sm16442335f8f.13.2024.11.27.06.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 06:05:15 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 27 Nov 2024 14:05:12 +0000
Subject: [PATCH v3 1/3] media: venus: Add support for static video
 encoder/decoder declarations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v3-1-ef6bd25e98db@linaro.org>
References: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v3-0-ef6bd25e98db@linaro.org>
In-Reply-To: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v3-0-ef6bd25e98db@linaro.org>
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

This change relies on of_changeset() API as a result select OF_DYNAMIC will
be added to venus/Kconfig

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/Kconfig |  1 +
 drivers/media/platform/qcom/venus/core.c  | 56 +++++++++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h  |  2 ++
 3 files changed, 59 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/Kconfig b/drivers/media/platform/qcom/venus/Kconfig
index bfd50e8f34219db8a1de7960d7ea93b20db2982a..f7085ec65a9206078ce60c70dff70c7fb0f27e91 100644
--- a/drivers/media/platform/qcom/venus/Kconfig
+++ b/drivers/media/platform/qcom/venus/Kconfig
@@ -3,6 +3,7 @@ config VIDEO_QCOM_VENUS
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV && QCOM_SMEM
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
+	select OF_DYNAMIC
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select QCOM_SCM
 	select VIDEOBUF2_DMA_CONTIG
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


