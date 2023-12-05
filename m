Return-Path: <linux-arm-msm+bounces-3434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E18805196
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 12:09:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C94DC1C20B20
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 11:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916C954BF4;
	Tue,  5 Dec 2023 11:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jWKEf0Ve"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBFFE9A
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Dec 2023 03:09:13 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c0a074e71so21386585e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Dec 2023 03:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701774552; x=1702379352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QEX8g9ws8pSAca/CRdznAgAd77RiybUJhIDkQ8ekvP4=;
        b=jWKEf0VeXDkMSYAdZy1IKtXAT0G3ERckDws1B66P7aBJaQW8NSj5myftgwYuV4JetS
         aaObN9fFWVJnWpoHgI0pGLz2IN9gvYeSLuAfZGL7xaJNC0jwspPftZ3yDDU1WymFm4WK
         vcDYN+BMgTw0vwcxZ08d2EYBvVHrq/QDbAu6uF+OeGynKJQyHQMfWfZWO0phRg5j2vCL
         phf5EiRfwexzAqzKT+aFGulJaRMWsvMJT17+ek8xXW4tUyr6NFE2ZA+NqljowmuSgztq
         AldNhrI2a1eOGbcyOWBeOXnDQn0aY5pZprcboAzrPfTO6VsHu+3WVeck8K8yjRPsBrxO
         LTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701774552; x=1702379352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEX8g9ws8pSAca/CRdznAgAd77RiybUJhIDkQ8ekvP4=;
        b=JGxhpn9954gdmzhB0ZKpjZ73+nm5k7yuvbUmkyknkgjwmYfG5F/tbW3VkPAYfeayyr
         t4R1qUKKVNm1RTlRZalrU0z8hu6NzqOq8T/QdpKVX8qvPUuorx6Yv0vfcfs7CdH4TwH0
         PiieuqGoaN+k6MMmZy9gaziu1K/IVgcejI+8yJ3ZG5zaMrFI6tRrMLCt2mJC6nKIn6E9
         yyuQ5xU26iyI+oScRSFTBk1Cjye4rcdaJHsF0s3H/pc5MY6flS7Doguu/wtvwukkaXaW
         jfHUn7tC9JtKoxu++7kiMw0EtkGbf0ql3jps/1ySgrHLCF5vbGIJkoyGqeIblW4d3a0p
         9eqA==
X-Gm-Message-State: AOJu0Yyuix5XceytFOv8sExrypS349IbFA8xnjwaPJwIYtftSk2OwWJh
	gk5zALRJr/nVPA6UamtBIaIBSg==
X-Google-Smtp-Source: AGHT+IFsmkGKbKmqRWIAo7hIqZj481lJ2ZLH43Zbo45JEUbbEWAXMQs+nOh6tadL86/0jGr3nEynVQ==
X-Received: by 2002:a05:600c:4506:b0:40b:37ef:3671 with SMTP id t6-20020a05600c450600b0040b37ef3671mr4501417wmo.38.1701774552298;
        Tue, 05 Dec 2023 03:09:12 -0800 (PST)
Received: from brgl-build.home ([2a01:cb1d:334:ac00:2efb:ffdf:fa22:d5ee])
        by smtp.gmail.com with ESMTPSA id o18-20020a05600c4fd200b0040b45282f88sm21798166wmq.36.2023.12.05.03.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 03:09:11 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] Bluetooth: qca: add regulators for QCA6390
Date: Tue,  5 Dec 2023 12:09:02 +0100
Message-Id: <20231205110903.68898-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add regulators for the QCA6390 module present on the Qualcomm RB5 board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 35f74f209d1f..7f25931a946e 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2044,7 +2044,15 @@ static const struct qca_device_data qca_soc_data_qca2066 __maybe_unused = {
 
 static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused = {
 	.soc_type = QCA_QCA6390,
-	.num_vregs = 0,
+	.vregs = (struct qca_vreg []) {
+		{ "vddio", 20000 },
+		{ "vddaon", 100000 },
+		{ "vddpmu", 1250000 },
+		{ "vddrfa1", 200000 },
+		{ "vddrfa2", 400000 },
+		{ "vddrfa3", 400000 },
+	},
+	.num_vregs = 6,
 };
 
 static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused = {
-- 
2.40.1


