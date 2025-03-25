Return-Path: <linux-arm-msm+bounces-52447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D11EA6F46F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 12:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B3FF3AE751
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 11:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9955256C98;
	Tue, 25 Mar 2025 11:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="usKXiX65"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799002561D6
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 11:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742902870; cv=none; b=mjhG+ps/SXU5tVSzUqAVIFeC7JpXq+ojE2DHzWmr2SvTBnapXbELj9NGitqynPLW/qHa2Ko7e2D9EISTjCjE4eiHxhZi/p0+8BPp7WqfWJqidzlGS9z1IVUbeMJ6vwQveBd2lnF/DPmHfbqs7E6gCYf3/JdnfSgvVj+8sB8hDDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742902870; c=relaxed/simple;
	bh=5X1aPO2z0jUPOmAmxxbRnG88+AZ4I5yT718/OM1HQtE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r75UgJQ4daBTk/OMia1VXIIqJrKsi2nzXF1tJkeQTTiATM9GYGqMz5Msx3A9ShzR9NqOG/UTsCOi+KO6So8jdtUIzIRNmYEESWP43HSO6l6o+NcF9uSeIvGw8kL1DIfiZbPMxpJMQ1SnwZeKgzxHdxGo2JcarsfOC//nWpT3Cd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=usKXiX65; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3912baafc58so4338107f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 04:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742902865; x=1743507665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPfdok1uXbCV3fbB68Oh0kuMKD9EmCqvBmSN9d5b64A=;
        b=usKXiX65vIWe7q2d7htqljwhlLNAbcNC8d+RPpW0XIPTuELCE68RrY/B7D0vW3fIU0
         HR5a93xtJBjJRre9zzsTSbTA+JOPmc08bAVizY1fVVD8CEvo25qR7kTk3iDndWEm9trn
         NbF/Bquob1YR23U3anxQ4jKhoGuB+NIOhXraQWoRL70luThMNDKWJafMMvpOVtVsTtQx
         QMR0I5eChNE9dl2wSy19R8u9W9yeSaIWlyjCuzYUTGPYf5PUc9+VifBc0teGazFPUXzc
         DhlglhqJWE3+CSQs5fr8drisvfzv8oQf/m+6uAWHEDuZ0L/fvm+G1k+R+IOrIc1EgQL5
         f+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742902865; x=1743507665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPfdok1uXbCV3fbB68Oh0kuMKD9EmCqvBmSN9d5b64A=;
        b=vwYjZODr/SSXRo38iplZqiY5LwaFjzprOoBEznVX0hqKXoY34jEnvukU3ECcDxxc5g
         6sBWi6dSLauN2ZcIihvAis8iQbF6TMpTqYVJc3+t8qlNASQX9t6r+JfceFBQ7sMa3brM
         hTDVqQCdptgDsjtVI08tXeU7BJgciCc2wCc5koEouckkiB4XSOtlTDjowg77aTk76px4
         Ux5shB0xmyQqBIin1uAnalImHwCa/yMWXcqZQWaHo/bhjO0ZEuGvVJ43doe4rQ+A6/9D
         ZT2d/oHauz9cICM1Cz9OD05xqx+amn/PvnsQcRN3c/H8Sh5CIiB54B+rLOK2dOTrAho7
         0XVg==
X-Forwarded-Encrypted: i=1; AJvYcCUD7jYZPrhHHebz4Mw607EI6jYLTWqXts76JiXdAhbK9wV/BebbZ2GojEN5lPXI+wgy8el4B/yhR5+gyS5L@vger.kernel.org
X-Gm-Message-State: AOJu0YzdyPlwV+uA4Kgemz8B/e8BtI0kTvZ4ckojmzpu75Fp+vxjS1pk
	geLaX73NvAuxfLKsveHw+kXyLpXxP0vLjmvlWPmf2+egsP6zM3K5Q8BQO+UqV00=
X-Gm-Gg: ASbGnctwa/Y0Q3aWEpY2K41MCneAEAqisbHAPBpeYsXOyNHfCevWrDHXB7jo80gkJvG
	bDVETTj2kYicSUWlaVw4k1q7FeF4Q866y9T92ueOGGFt752D5l7vt+m0VzuWaozjW+8dDIdHLWT
	NUU00DCax3bAWffAZf3TG1X4RCS9i1vv98LdSUVZ7zSsi69TFU2dsf8/hjUoRCkw7+12eXLc/6b
	Wf5ZOq+b9ZbHAPTOQj5oxA5SIJLGuMmYWJ0OJdl8/f6nrt6SltCB6My3LN64qL4wVaiCdkxuoIb
	iwCituVccAJBAJtMpak3Dg/9EjfGzK1QNOAC4x2lShNudzxgUAWXE/9iryFIH1py7qxh2A==
X-Google-Smtp-Source: AGHT+IGX+E1xFo91m0AYrkO4kkEoY2JQnq0F/cboQi3QOCvL7ex9DY7qp1H7fIxNEBp+thnIa9ixkA==
X-Received: by 2002:a5d:648e:0:b0:390:ee01:68fa with SMTP id ffacd0b85a97d-3997f91287emr14148949f8f.24.1742902865471;
        Tue, 25 Mar 2025 04:41:05 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13213330f8f.29.2025.03.25.04.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:41:04 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Christopher Obbard <christopher.obbard@linaro.org>
Subject: [PATCH v5 2/6] mux: gpio: add optional regulator support
Date: Tue, 25 Mar 2025 11:40:54 +0000
Message-Id: <20250325114058.12083-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
References: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Some of the external muxes needs powering up using a regulator.
This is the case with Lenovo T14s laptop which has a external audio mux
to handle US/EURO headsets.

Add support to the driver to handle this optional regulator.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 drivers/mux/gpio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
index cc5f2c1861d4..d1607f287755 100644
--- a/drivers/mux/gpio.c
+++ b/drivers/mux/gpio.c
@@ -15,6 +15,7 @@
 #include <linux/mux/driver.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/regulator/consumer.h>
 
 struct mux_gpio {
 	struct gpio_descs *gpios;
@@ -82,6 +83,10 @@ static int mux_gpio_probe(struct platform_device *pdev)
 		mux_chip->mux->idle_state = idle_state;
 	}
 
+	ret = devm_regulator_get_enable_optional(dev, "mux");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "Couldn't retrieve/enable gpio mux supply\n");
+
 	ret = devm_mux_chip_register(dev, mux_chip);
 	if (ret < 0)
 		return ret;
-- 
2.39.5


