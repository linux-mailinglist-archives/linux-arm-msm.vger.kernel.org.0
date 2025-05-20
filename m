Return-Path: <linux-arm-msm+bounces-58596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA21FABCEE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 08:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5419918931B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 06:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF1825C80A;
	Tue, 20 May 2025 06:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UGKfhYR6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D13D25A645
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 06:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747721004; cv=none; b=d2qEd4pJUVfcqp5wb4KVoJrgmaCNyapMYtv0Q6lWc7lVloknsVIX31GI2K+HAjHPFDEIXuX8UcZV0k9jEWiCdM7tWDPkaQ/Ft7fZXvwLEE/Q37SuTI2QFvyxJmi8jQTG+QYKps3f+i9q1LGtgR9J7gWohshIgGjoSCBFbXINvqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747721004; c=relaxed/simple;
	bh=DZbQskVeons0NorsuwZ0YqSabJYXDDW8Ct+WnN0IZD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VgQ+gKKP8qGG4PfX2MLweduYQsL6VzuKQ0plWswpp2VYSPQy8hfjY7mT+89CnuyufGc9hTDuyu/0cEcFqen9qv015bDpbsbH0KOZ0Cvus+nhfpOJsPgGC8hqEW/4gsFcYqN92wyEIIvK98W42Rs6c6Ki6PVHPbNjzZ5B9Fmrl4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UGKfhYR6; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60169001e0cso710243a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 23:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747721001; x=1748325801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HrDJUB5JJwJAoxIbZ/HoqYoHpcv1RHV6h9tUt7sC9w=;
        b=UGKfhYR6+AEsXpULIh4pbzxFj6SSd5aqNbM+JLAxi/aGHSkK2jo1i4n5p7O/3h12ZF
         LwbOh7BfS2RPD6YQ2EsOrKEumEZbOZAadbAAvMVQ7Qk0KlAp7riGHN3lzwG/mxqwZRdJ
         mbGiB5xIGpy8D1xNgnyGnh5ENyiQTKQbETKPxaDxhH7JxZSAJD5ZfBReafd9oYSw8kDT
         fSgo6ib0MCG0g7IKRULeOJpz5LjKvGhyoA1jv4C9hW9ulqkvkM9Vu2NgelIr0dkq522s
         BTmP9jKuk57w+ADF/krQnmYR12nb+9fLcTIgz3fnDUmmKzdecd56pNBv9uogz17GpP+P
         ivKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747721001; x=1748325801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HrDJUB5JJwJAoxIbZ/HoqYoHpcv1RHV6h9tUt7sC9w=;
        b=dNTceZ0ZjzmIYVoHZUpaTT42RU5BIannwx2n+Fof88C25wYEJsQH4bWhq/u3bZ8OK5
         +Tl2QV3CxPnLU1XLnw5VG2IsAi2yCIb3heT5wHzICM6ElykDys09EiDOyMSvLEyqdzAE
         M8cwOsIZ09gwyp388aS+hU+weYK/YtXdSbvzngKKOeSCHbvrQjwpdSySxyLYWY+3azuz
         7f58X/8UD0S92NSj2to8F4yXo+g0j7c6y9ppzepG7j0yx6cRBJQvf91OiCgStbUMa7fd
         mA6zQ9UVfb77XQV53Ev6n80JWBcvRw2cgg2gQvNt4mQtyAH+1NrtKjgvj/Ilx+atWjwB
         Jx8A==
X-Forwarded-Encrypted: i=1; AJvYcCXbUrF5V+mpJUXkzCxu+RX1tviN4LY+rNEw/xtYtU+JwPx0wQ080dnIOcv3LooQZgaFVMtrfpOh4fVb4U7V@vger.kernel.org
X-Gm-Message-State: AOJu0Yxie4ErY1xiMc2ZR3BdhnZh/VVHOgYSkrzXXDaYraw8kFVIIuk8
	YjYv2bLJwNML7pOcn8LGkZc1UES0Htx0qdJQ1cY9l/Oz+0QOG8MeSqLldCktoIlNMkY=
X-Gm-Gg: ASbGnctB8DlKFftlTMkoY69TxSeaR8YhgMBxmr/CNQt4MUXbsTiOaUZF45gmCQWWNn9
	Bf08rQSq6JvM9rWDBpGqz14f5NAvFh/NuAmTgIWmyW7Vz5E0pX3WiLP1zgZvoLhrrouC1eW+cpG
	O7LNLpWWPN367UMgEyD6Q4mbLWFiSf07yNXqrk9DhYg6/zPUTZkpgIPudLhKO6NWw2afTFu4kQ0
	n2gYZ4aqnptLUt1YytxmqBm9N4jN/hletfDjEInXrWPa1d8Vx5eLd7yTHVG/LQJzituLintR8sr
	8Jj5Ev7WzVhcUrNgtOSG8PO6dOi4LG2XMQ2B2TRotmUWg21e7O7zY6qAM2VBEA==
X-Google-Smtp-Source: AGHT+IF8OzqBM3xVT4nkPx2ZTvbLkjSAuLNSKizhNcCPOIftNNp2xbVDSEk1ozogfoVDaP654m79JQ==
X-Received: by 2002:aa7:d1ce:0:b0:600:afe5:8e7 with SMTP id 4fb4d7f45d1cf-600afe509e4mr4344075a12.3.1747721001153;
        Mon, 19 May 2025 23:03:21 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac33a88sm6698710a12.51.2025.05.19.23.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:03:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] media: qcom: camss: csid: Stop spamming logs with version
Date: Tue, 20 May 2025 08:03:12 +0200
Message-ID: <20250520060310.7543-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250520060310.7543-4-krzysztof.kozlowski@linaro.org>
References: <20250520060310.7543-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6952; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=DZbQskVeons0NorsuwZ0YqSabJYXDDW8Ct+WnN0IZD0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoLBsixr5xFy0uT8RCUNmqNwiZvW2jp6Tp4fPio
 ZdSKDuPxHuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCwbIgAKCRDBN2bmhouD
 12tbD/9pyx+GApx7tNOyvfkkotuNrGZgDuhplsCuDDlotbXRR/rZ5l8Z5xHqxTTH6dduOYhbOdB
 UPGP0At0cVCljEuClnm9ifobWLO1EkIlHTF8iKpJ36WO+lVTEfOzxUs1RIo9RUji+wtkvnKspdy
 YfQryYCmuRiKimQPeGTDwo5IgrA3xHf5q26wIDv3nePv0mZHpSw6sdt9SAueGUPc/+T1bWd86xG
 48NrT6srCR4LzL1jKLKTIU/oeZ5cYHtAC0vgehPZX85yGhcxRdPHk4fWT+HXr8kBIl3LHYABLnF
 5Fa5CLhLnrFOpBd+tCdT98gtgaKaK81O0SXBOpMG2vbzzqpMjc7d/lMQ+xDqS6yJu9ApmI8aEw6
 E7mw6raImgDAvtYkRts8xo7wCF+Qw+xFqxntsU8XErcr13tjwM1irLBlppi+3RFnZ0K0NAiP6bF
 LUu7hzbFnMiaoipdEsrJHt76qEUZswKw58a5ojwSNAFcIi2o7JSi9AZu9t4G5+zkfNkm4tWDzjB
 /ojtO29AVlORWT20F9vUFg/aWc/WLYMZQ3oPpYOJbZaJ95apEgAjcJ1LmdIsQZxuBTXEZTashft
 5HE6ri+8NmlHOUHz7VGFe2sGqd6KA9CLroi0yWDNQ1dJeCb2kjD8wL0sRSYG1VsGfbFjrdcc8OT pEFJYPHcZ7eb7OA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Camss drivers spam kernel dmesg with 64 useless messages during boot:

  qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
  qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0

All of these messages are the same, so it makes no sense to print same
information 32 times.

The driver does not use read version at all, so if it was needed for any
real debugging purpose it would be provided via debugfs interface.
However even then printing this is pointless, because version of
hardware block is deducible from the compatible.  Fix the code to adhere
to Linux kernel coding style: being silent on success.  For the same
reasons this should not be even dbg message (see driver development
debug guide: "In almost all cases the debug statements shouldn't be
upstreamed").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Extend commit msg, because apparently coding style and debug guide
   has to be reminded in commit msg, otherwise rules don't apply.
---
 .../platform/qcom/camss/camss-csid-4-1.c      |  1 -
 .../platform/qcom/camss/camss-csid-4-7.c      |  1 -
 .../platform/qcom/camss/camss-csid-680.c      |  1 -
 .../platform/qcom/camss/camss-csid-780.c      |  1 -
 .../platform/qcom/camss/camss-csid-gen2.c     |  1 -
 .../media/platform/qcom/camss/camss-csid.c    | 25 -------------------
 .../media/platform/qcom/camss/camss-csid.h    | 14 -----------
 7 files changed, 44 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-4-1.c b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
index 6998e1c52895..8771e20d2a44 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
@@ -179,7 +179,6 @@ static void csid_subdev_init(struct csid_device *csid)
 const struct csid_hw_ops csid_ops_4_1 = {
 	.configure_stream = csid_configure_stream,
 	.configure_testgen_pattern = csid_configure_testgen_pattern,
-	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
 	.src_pad_code = csid_src_pad_code,
diff --git a/drivers/media/platform/qcom/camss/camss-csid-4-7.c b/drivers/media/platform/qcom/camss/camss-csid-4-7.c
index 66054d4872e6..80135e63c595 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-4-7.c
@@ -204,7 +204,6 @@ static void csid_subdev_init(struct csid_device *csid)
 const struct csid_hw_ops csid_ops_4_7 = {
 	.configure_stream = csid_configure_stream,
 	.configure_testgen_pattern = csid_configure_testgen_pattern,
-	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
 	.src_pad_code = csid_src_pad_code,
diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 3ad3a174bcfb..6eb9a5efa96a 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -413,7 +413,6 @@ static void csid_subdev_init(struct csid_device *csid) {}
 const struct csid_hw_ops csid_ops_680 = {
 	.configure_testgen_pattern = NULL,
 	.configure_stream = csid_configure_stream,
-	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
 	.src_pad_code = csid_src_pad_code,
diff --git a/drivers/media/platform/qcom/camss/camss-csid-780.c b/drivers/media/platform/qcom/camss/camss-csid-780.c
index 4c720d177731..8a8999747905 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-780.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-780.c
@@ -328,7 +328,6 @@ static void csid_subdev_init(struct csid_device *csid)
 const struct csid_hw_ops csid_ops_780 = {
 	.configure_stream = csid_configure_stream,
 	.configure_testgen_pattern = csid_configure_testgen_pattern,
-	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
 	.src_pad_code = csid_src_pad_code,
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 2a1746dcc1c5..9607ebd7fa3c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -424,7 +424,6 @@ static void csid_subdev_init(struct csid_device *csid)
 const struct csid_hw_ops csid_ops_gen2 = {
 	.configure_stream = csid_configure_stream,
 	.configure_testgen_pattern = csid_configure_testgen_pattern,
-	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
 	.src_pad_code = csid_src_pad_code,
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 5284b5857368..2f5058b681dc 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -596,29 +596,6 @@ static int csid_set_clock_rates(struct csid_device *csid)
 	return 0;
 }
 
-/*
- * csid_hw_version - CSID hardware version query
- * @csid: CSID device
- *
- * Return HW version or error
- */
-u32 csid_hw_version(struct csid_device *csid)
-{
-	u32 hw_version;
-	u32 hw_gen;
-	u32 hw_rev;
-	u32 hw_step;
-
-	hw_version = readl_relaxed(csid->base + CSID_HW_VERSION);
-	hw_gen = (hw_version >> HW_VERSION_GENERATION) & 0xF;
-	hw_rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
-	hw_step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
-	dev_dbg(csid->camss->dev, "CSID:%d HW Version = %u.%u.%u\n",
-		csid->id, hw_gen, hw_rev, hw_step);
-
-	return hw_version;
-}
-
 /*
  * csid_src_pad_code - Pick an output/src format based on the input/sink format
  * @csid: CSID device
@@ -732,8 +709,6 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
-
-		csid->res->hw_ops->hw_version(csid);
 	} else {
 		disable_irq(csid->irq);
 		camss_disable_clocks(csid->nclocks, csid->clock);
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 9dc826d8c8f6..4b003ec1519c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -88,12 +88,6 @@ struct csid_hw_ops {
 	 */
 	int (*configure_testgen_pattern)(struct csid_device *csid, s32 val);
 
-	/*
-	 * hw_version - Read hardware version register from hardware
-	 * @csid: CSID device
-	 */
-	u32 (*hw_version)(struct csid_device *csid);
-
 	/*
 	 * isr - CSID module interrupt service routine
 	 * @irq: Interrupt line
@@ -225,14 +219,6 @@ extern const struct csid_hw_ops csid_ops_780;
  */
 bool csid_is_lite(struct csid_device *csid);
 
-/*
- * csid_hw_version - CSID hardware version query
- * @csid: CSID device
- *
- * Return HW version or error
- */
-u32 csid_hw_version(struct csid_device *csid);
-
 /*
  * csid_src_pad_code - Pick an output/src format based on the input/sink format
  * @csid: CSID device
-- 
2.45.2


