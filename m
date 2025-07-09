Return-Path: <linux-arm-msm+bounces-64268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65582AFEC7A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 16:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36EAB1892ACC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CC41E492;
	Wed,  9 Jul 2025 14:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="edPuFj6j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7144D298996
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 14:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072458; cv=none; b=Oru3YyMcZddyBrEKBXLd9GoTisfCYy+6CTJBUzf+81A9FB0bC2WpabvovuXQmSJd3daV75nmsDBevhJrTL9gxc9Ycu/SXV4ldKox/xMLIy5/0odLyheayOiyM8fYdiTlAUGSzdAllX3TjgNcRMl/P8/0sf1JwkdcNUVsMXvu+kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072458; c=relaxed/simple;
	bh=q33ce8+frqKgGaRpVRO1z08J/7tP+j9aTiTDexbSRLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TGZp1FELOtEgf30Uudz6zU9i2//Yx7wlKFs5wLyb6QVlVJiJJMNvsGi7HA5GrgtZtW54KhgWwGCT3A6YMG3qwDy7jeTAf37nHvCHABjhfUQJ8t7QwzQTuu/I8RlJyvsRGm3cOJoJzp4o94Pi88aBLZOk6yFS+wzEn82YxRz19rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=edPuFj6j; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4f379662cso27447f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 07:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752072456; x=1752677256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4NtH0feHwwUczaaFj41kCVHxJaG2GKZc+XLPiyiigkw=;
        b=edPuFj6jJg/2IGwu8uMXKqZtKJbnOxl+5C7jzkYK8z8FN/NboDPBDjDf+7OiR2qEZF
         O37UcZesOkkJpKoZy+6+Ipan7jYIFmMMAae5HUoMtbZbZIw5aNSY0u+7mCDxY0gFjNM7
         5zHcbcZqr+J4yX+GGZFVA9hc0UIj6dCDAc3xN7G9sWvwyySv6hspk614jisM9ceh1cGL
         ThiKc3OiT4wcF2dLDj6JMDvlQKs12/NRRPO5On2U4IvA9wvhvhRyKT+NQJUe6B/svSp0
         1GgtJwT3feFH4MoJAfDoxi2Ed/7H20WeSAjHEBqUC5jI8aoTW2l59JwaxwR/Er2neUiE
         oLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752072456; x=1752677256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NtH0feHwwUczaaFj41kCVHxJaG2GKZc+XLPiyiigkw=;
        b=N8qsWTEKVtp7Z2H3GzFNw8stezz6Z132Z+kiz/Nm4BdVfhT7sf6lXN8i0O5g30HXDC
         UeB4crCz/0L77dzFYRfZNGBau8jVmkPCioQFiWdp8WoLqY5hnYc8/+1Xlghejd6oaV3c
         HwBiRHIbzS/HyqjEW7felPD5nwNXswq3rYwU7jE3RoLhfVku1dB7nOCRZRqyQ9xw/tSS
         PboARbw16oH8PaAiPHyd1EMlm1Z5iGzQO1vRltt0g4aNlTCFhnYEF592ws8XKGlJmnbu
         GrpZGwVw+qj7UbSufRNYgmkpAZFODvNRs6d1hbUI8WYNYTqtNX9eEzNbm8YrczBYQWyX
         xoNg==
X-Forwarded-Encrypted: i=1; AJvYcCViN3xjtJkuXgkz/sGevOrTetgjVebjct+av2JXe7KCuFK/HkEhdE2gpfibSELCRZG74/ee6LHvxyMw3u8q@vger.kernel.org
X-Gm-Message-State: AOJu0YwhdSf1YyWIL1GaiWq/72BRmnm7162pu+xf1F0a12jVceqRW6Nn
	va3C1uB/olUy1qfpfts9d3RGr5uuGf34gkcIBCsKv0MQOW5ndO8/95rJlTFFwZYyMDw=
X-Gm-Gg: ASbGncv4OnIz2aJgt4t83t8vZY4GF24iR0zGmh7FHSD3sO1gAjnzWdCF/qDR4bDTX1C
	3ibAuA7yIF9ZTdg+jbUFEf6EHEZBC2iS4rG+7pPLgUtTABn/86eHCY7jPCLQk5mx287NoP9Yfnn
	w/jX6OKTbpc17XPlXxtP62gzlH4IzQ8UX/3NFTmoWGQmM+sgOZ1BFZ39wfET6X7aDqEKEBZ6NoK
	rkHV6l/95dVxegjkMkqEU7rtPvb9dpFRd7M+lGXIFYQgIHJ8uuGqPbXM84LWTSvLW2NG7hK6T4v
	aqGq0gBc45CHfzRLuhOCZsJ7FC0+E400HXTvarXFgTdXUxthPL382a1PrjZQiQg=
X-Google-Smtp-Source: AGHT+IEUE8tMaPDZZaKY17LAPbD4MKLwoSLGBEVWhrKQhzPLWiq+YuKvyeMKc71elZ017y0Pb2Lzbg==
X-Received: by 2002:a05:6000:705:b0:3b3:9c75:a4fb with SMTP id ffacd0b85a97d-3b5e4522093mr2562948f8f.33.1752072455658;
        Wed, 09 Jul 2025 07:47:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285c90esm16243899f8f.91.2025.07.09.07.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:47:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: Shuai Zhang <quic_shuaz@quicinc.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-bluetooth@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2] MAINTAINERS: add a sub-entry for the Qualcomm bluetooth driver
Date: Wed,  9 Jul 2025 16:47:28 +0200
Message-ID: <20250709144728.43313-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches modifying drivers/bluetooth/hci_qca.c should be Cc'ed to the
linux-arm-msm mailing list so that Qualcomm maintainers and reviewers
can get notified about proposed changes to it. Add a sub-entry that adds
the mailing list to the list of addresses returned by get_maintainer.pl.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- add remaining QCA files (Dmitry)

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efba8922744a3..d018923ddd3eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20464,6 +20464,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
 F:	drivers/net/wwan/qcom_bam_dmux.c
 
+QUALCOMM BLUETOOTH DRIVER
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	drivers/bluetooth/btqca.[ch]
+F:	drivers/bluetooth/btqcomsmd.c
+F:	drivers/bluetooth/hci_qca.c
+
 QUALCOMM CAMERA SUBSYSTEM DRIVER
 M:	Robert Foss <rfoss@kernel.org>
 M:	Todor Tomov <todor.too@gmail.com>
-- 
2.48.1


