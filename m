Return-Path: <linux-arm-msm+bounces-43319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 966349FC68B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 21:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 249921621FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 20:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506171B6D04;
	Wed, 25 Dec 2024 20:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AxsQaMnh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE70199384
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Dec 2024 20:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735160282; cv=none; b=gt/bxLO/P93IDDYcjhXS1ZrCkyfSFAyVCQLMREoxyyZOxbc2ij3JiBV02ir9ERN7QGn0WwKYtyeGImberwOOsV/wWiGk4vKgk9EOiTaOrvT5W4cDuoJRsU7njeNK24iyni8OS+5oy1RrrImqSiv2oytHHV7y7I6CqQyYl6gYlzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735160282; c=relaxed/simple;
	bh=tKRDSnC2nlg2l7Ad14hsSIh5dsoRvC1O+P9aPGCrtJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DVrENvBSFR6veSQrHuobn6T8dy9vjcI9EQCUn3J5RQvzk1emBFZeXmnF+Qtv9mUb78ARmATXaGoyfsEUKDEQlt/TWPXHSIuXCw1qowMXC5XfPVGO3Tozzo8lsshTlMk0NjLNK8lDXHKryaCbEfMd89itqYbCYajOeDRDDxQNgR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AxsQaMnh; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-303548a9332so4922361fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Dec 2024 12:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735160278; x=1735765078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i9idfFu5/8BzRE60oTYq1vhpua2UecsWay4yBXE7pyk=;
        b=AxsQaMnhw26AyFeDCnTlMWiV+oiNRegtUqi4sO5QVoX0iD8UMJ+XDj0qRsmzhOl5I6
         eonmO7WoiXxWBdB/dJeX2E3DedY73hQWkPWv7BotQj3XFB/YrX4OBc28hq/GbGkuk5gD
         L3yj4dMrbRCpKInKFuP8evncyR6j5Rq9oKHp6X5hylYmhLmID0ZeyBks+qG9oht0Q/qO
         Ok04jgfkJgalGudsqTQh5V+d8f7FGQzHGP9PU63fFn5Cmrpueal+Z0AHx4HDn4lHm+HY
         pDsIB5TId6wSaR2KI4+yJF8SZb0tRqVFSedx/Mcto5EL8NHBkXDyJVirK9T82IMbCR92
         AmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735160278; x=1735765078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9idfFu5/8BzRE60oTYq1vhpua2UecsWay4yBXE7pyk=;
        b=h8TYtdmyfz2Cg5JW3BDeUO9yR5MuHWJTgE6sbuMQP2vMJvna2jF6FNlVKRIinbVNWY
         v15MHvA+r2pATVMyoMT4WzQElb7Ltj4fRsQQ/Nlabnsobho6E7wHWwE7xIMFV5hUl8cw
         TqXpGnutM1OgUAQRI5u+FD4GbOpjA5XWefYHUMnpc8cXtWBcwnwuR/dymI4SI6WoBWjW
         fnEr/ZrHU8pk0HZJRSozUMyITeJoiGjEqMJ0PpoDN1yZ6TtJdEQZJG23HjTCE1Ixoq32
         +KqrMXcx0RJyiJFtB9STlPl5n0NcSBm0btfys3tL+FsNeZKiYvRu0r5v9/QqRSCeSU7V
         fIMg==
X-Forwarded-Encrypted: i=1; AJvYcCU0SWhA7WSNK24ScFiT2xh5kIQQBSVZSWCoaEnR32o9ieRCHvVlmmOwn9EoanfChnl5p5RSAL+ejzT/7eLo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1YunE32HmD91xHGgPEPScC4rguYE9j2bTWtSWPeJN47WArpRW
	Rry8vWlzlL3/lw6agI1JeFlyo+Wa+LTGTSZBEkCU1yVDB7TzSWrBQHoWpNcvztM=
X-Gm-Gg: ASbGnctgDC8YSz8cfiNSLnB2dv97M0vkd/c09/IM7ODWbJLmiGlnoeiU1N1CgTyZi3B
	cFvLyfaV4T2vdtIQoZpUEcgSzR342mjWmB/UBIOaaekwv+wSoNXnkiSXqa2k8woT0hXglUXA+kP
	fiBGhzazeHQtctmH0M47txBMsI9MADg4N8thDzrxR3dPcmbPQo+rtEjZ6Y8AtvxoykvYFMgA0ch
	FCfjZ3PmfRK4FadBkKQ1Sm1Zo3JX8Vv+4H4E3gYvNNumxqgeD8QT2ihe8XHcAOEN4CZ1qSx8CNP
	7ujwx4rIDpSpobZPixlZqwYVe6s3z3+L7GI0O98nYTe+YQ==
X-Google-Smtp-Source: AGHT+IE5z2swCqOEkWJ5NH4RRuDcAJMsE93KfFlTChp7DQItkOqXk0SBQgHxXexv3q3sJSVrgX7qDw==
X-Received: by 2002:a2e:bc06:0:b0:302:1cfa:2460 with SMTP id 38308e7fff4ca-304685080b9mr25963381fa.3.1735160277984;
        Wed, 25 Dec 2024 12:57:57 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adad4fesm20674521fa.61.2024.12.25.12.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2024 12:57:56 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] media: qcom: camss: switch CSID to defined MIPI CSI data type IDs
Date: Wed, 25 Dec 2024 22:57:48 +0200
Message-ID: <20241225205748.1515251-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redefined image data type IDs taken directly from the MIPI CSI-2
specification. Non-functional change.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../media/platform/qcom/camss/camss-csid.c    | 121 +++++++++---------
 .../media/platform/qcom/camss/camss-csid.h    |  23 ----
 2 files changed, 61 insertions(+), 83 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 858db5d4ca75..d1c51cbe376c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -17,6 +17,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <media/media-entity.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-subdev.h>
@@ -48,119 +49,119 @@ const char * const csid_testgen_modes[] = {
 static const struct csid_format_info formats_4_1[] = {
 	{
 		MEDIA_BUS_FMT_UYVY8_1X16,
-		DATA_TYPE_YUV422_8BIT,
+		MIPI_CSI2_DT_YUV422_8B,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
 		MEDIA_BUS_FMT_VYUY8_1X16,
-		DATA_TYPE_YUV422_8BIT,
+		MIPI_CSI2_DT_YUV422_8B,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
 		MEDIA_BUS_FMT_YUYV8_1X16,
-		DATA_TYPE_YUV422_8BIT,
+		MIPI_CSI2_DT_YUV422_8B,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
 		MEDIA_BUS_FMT_YVYU8_1X16,
-		DATA_TYPE_YUV422_8BIT,
+		MIPI_CSI2_DT_YUV422_8B,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
 		MEDIA_BUS_FMT_SBGGR8_1X8,
-		DATA_TYPE_RAW_8BIT,
+		MIPI_CSI2_DT_RAW8,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGBRG8_1X8,
-		DATA_TYPE_RAW_8BIT,
+		MIPI_CSI2_DT_RAW8,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGRBG8_1X8,
-		DATA_TYPE_RAW_8BIT,
+		MIPI_CSI2_DT_RAW8,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SRGGB8_1X8,
-		DATA_TYPE_RAW_8BIT,
+		MIPI_CSI2_DT_RAW8,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SBGGR10_1X10,
-		DATA_TYPE_RAW_10BIT,
+		MIPI_CSI2_DT_RAW10,
 		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
 		10,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGBRG10_1X10,
-		DATA_TYPE_RAW_10BIT,
+		MIPI_CSI2_DT_RAW10,
 		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
 		10,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGRBG10_1X10,
-		DATA_TYPE_RAW_10BIT,
+		MIPI_CSI2_DT_RAW10,
 		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
 		10,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SRGGB10_1X10,
-		DATA_TYPE_RAW_10BIT,
+		MIPI_CSI2_DT_RAW10,
 		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
 		10,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SBGGR12_1X12,
-		DATA_TYPE_RAW_12BIT,
+		MIPI_CSI2_DT_RAW12,
 		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
 		12,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGBRG12_1X12,
-		DATA_TYPE_RAW_12BIT,
+		MIPI_CSI2_DT_RAW12,
 		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
 		12,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGRBG12_1X12,
-		DATA_TYPE_RAW_12BIT,
+		MIPI_CSI2_DT_RAW12,
 		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
 		12,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SRGGB12_1X12,
-		DATA_TYPE_RAW_12BIT,
+		MIPI_CSI2_DT_RAW12,
 		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
 		12,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_Y10_1X10,
-		DATA_TYPE_RAW_10BIT,
+		MIPI_CSI2_DT_RAW10,
 		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
 		10,
 		1,
@@ -170,147 +171,147 @@ static const struct csid_format_info formats_4_1[] = {
 static const struct csid_format_info formats_4_7[] = {
 	{
 		MEDIA_BUS_FMT_UYVY8_1X16,
-		DATA_TYPE_YUV422_8BIT,
+		MIPI_CSI2_DT_YUV422_8B,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
 		MEDIA_BUS_FMT_VYUY8_1X16,
-		DATA_TYPE_YUV422_8BIT,
+		MIPI_CSI2_DT_YUV422_8B,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
 		MEDIA_BUS_FMT_YUYV8_1X16,
-		DATA_TYPE_YUV422_8BIT,
+		MIPI_CSI2_DT_YUV422_8B,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
 		MEDIA_BUS_FMT_YVYU8_1X16,
-		DATA_TYPE_YUV422_8BIT,
+		MIPI_CSI2_DT_YUV422_8B,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
 		MEDIA_BUS_FMT_SBGGR8_1X8,
-		DATA_TYPE_RAW_8BIT,
+		MIPI_CSI2_DT_RAW8,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGBRG8_1X8,
-		DATA_TYPE_RAW_8BIT,
+		MIPI_CSI2_DT_RAW8,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGRBG8_1X8,
-		DATA_TYPE_RAW_8BIT,
+		MIPI_CSI2_DT_RAW8,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SRGGB8_1X8,
-		DATA_TYPE_RAW_8BIT,
+		MIPI_CSI2_DT_RAW8,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SBGGR10_1X10,
-		DATA_TYPE_RAW_10BIT,
+		MIPI_CSI2_DT_RAW10,
 		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
 		10,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGBRG10_1X10,
-		DATA_TYPE_RAW_10BIT,
+		MIPI_CSI2_DT_RAW10,
 		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
 		10,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGRBG10_1X10,
-		DATA_TYPE_RAW_10BIT,
+		MIPI_CSI2_DT_RAW10,
 		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
 		10,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SRGGB10_1X10,
-		DATA_TYPE_RAW_10BIT,
+		MIPI_CSI2_DT_RAW10,
 		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
 		10,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SBGGR12_1X12,
-		DATA_TYPE_RAW_12BIT,
+		MIPI_CSI2_DT_RAW12,
 		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
 		12,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGBRG12_1X12,
-		DATA_TYPE_RAW_12BIT,
+		MIPI_CSI2_DT_RAW12,
 		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
 		12,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGRBG12_1X12,
-		DATA_TYPE_RAW_12BIT,
+		MIPI_CSI2_DT_RAW12,
 		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
 		12,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SRGGB12_1X12,
-		DATA_TYPE_RAW_12BIT,
+		MIPI_CSI2_DT_RAW12,
 		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
 		12,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SBGGR14_1X14,
-		DATA_TYPE_RAW_14BIT,
+		MIPI_CSI2_DT_RAW14,
 		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
 		14,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGBRG14_1X14,
-		DATA_TYPE_RAW_14BIT,
+		MIPI_CSI2_DT_RAW14,
 		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
 		14,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGRBG14_1X14,
-		DATA_TYPE_RAW_14BIT,
+		MIPI_CSI2_DT_RAW14,
 		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
 		14,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SRGGB14_1X14,
-		DATA_TYPE_RAW_14BIT,
+		MIPI_CSI2_DT_RAW14,
 		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
 		14,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_Y10_1X10,
-		DATA_TYPE_RAW_10BIT,
+		MIPI_CSI2_DT_RAW10,
 		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
 		10,
 		1,
@@ -320,154 +321,154 @@ static const struct csid_format_info formats_4_7[] = {
 static const struct csid_format_info formats_gen2[] = {
 	{
 		MEDIA_BUS_FMT_UYVY8_1X16,
-		DATA_TYPE_YUV422_8BIT,
+		MIPI_CSI2_DT_YUV422_8B,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
 		MEDIA_BUS_FMT_VYUY8_1X16,
-		DATA_TYPE_YUV422_8BIT,
+		MIPI_CSI2_DT_YUV422_8B,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
 		MEDIA_BUS_FMT_YUYV8_1X16,
-		DATA_TYPE_YUV422_8BIT,
+		MIPI_CSI2_DT_YUV422_8B,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
 		MEDIA_BUS_FMT_YVYU8_1X16,
-		DATA_TYPE_YUV422_8BIT,
+		MIPI_CSI2_DT_YUV422_8B,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		2,
 	},
 	{
 		MEDIA_BUS_FMT_SBGGR8_1X8,
-		DATA_TYPE_RAW_8BIT,
+		MIPI_CSI2_DT_RAW8,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGBRG8_1X8,
-		DATA_TYPE_RAW_8BIT,
+		MIPI_CSI2_DT_RAW8,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGRBG8_1X8,
-		DATA_TYPE_RAW_8BIT,
+		MIPI_CSI2_DT_RAW8,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SRGGB8_1X8,
-		DATA_TYPE_RAW_8BIT,
+		MIPI_CSI2_DT_RAW8,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SBGGR10_1X10,
-		DATA_TYPE_RAW_10BIT,
+		MIPI_CSI2_DT_RAW10,
 		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
 		10,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGBRG10_1X10,
-		DATA_TYPE_RAW_10BIT,
+		MIPI_CSI2_DT_RAW10,
 		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
 		10,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGRBG10_1X10,
-		DATA_TYPE_RAW_10BIT,
+		MIPI_CSI2_DT_RAW10,
 		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
 		10,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SRGGB10_1X10,
-		DATA_TYPE_RAW_10BIT,
+		MIPI_CSI2_DT_RAW10,
 		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
 		10,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_Y8_1X8,
-		DATA_TYPE_RAW_8BIT,
+		MIPI_CSI2_DT_RAW8,
 		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
 		8,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_Y10_1X10,
-		DATA_TYPE_RAW_10BIT,
+		MIPI_CSI2_DT_RAW10,
 		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
 		10,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SBGGR12_1X12,
-		DATA_TYPE_RAW_12BIT,
+		MIPI_CSI2_DT_RAW12,
 		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
 		12,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGBRG12_1X12,
-		DATA_TYPE_RAW_12BIT,
+		MIPI_CSI2_DT_RAW12,
 		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
 		12,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGRBG12_1X12,
-		DATA_TYPE_RAW_12BIT,
+		MIPI_CSI2_DT_RAW12,
 		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
 		12,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SRGGB12_1X12,
-		DATA_TYPE_RAW_12BIT,
+		MIPI_CSI2_DT_RAW12,
 		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
 		12,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SBGGR14_1X14,
-		DATA_TYPE_RAW_14BIT,
+		MIPI_CSI2_DT_RAW14,
 		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
 		14,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGBRG14_1X14,
-		DATA_TYPE_RAW_14BIT,
+		MIPI_CSI2_DT_RAW14,
 		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
 		14,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SGRBG14_1X14,
-		DATA_TYPE_RAW_14BIT,
+		MIPI_CSI2_DT_RAW14,
 		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
 		14,
 		1,
 	},
 	{
 		MEDIA_BUS_FMT_SRGGB14_1X14,
-		DATA_TYPE_RAW_14BIT,
+		MIPI_CSI2_DT_RAW14,
 		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
 		14,
 		1,
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 8cdae98e4dca..72f85e0d70ca 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -27,29 +27,6 @@
 /* CSID hardware can demultiplex up to 4 outputs */
 #define MSM_CSID_MAX_SRC_STREAMS	4
 
-#define DATA_TYPE_EMBEDDED_DATA_8BIT	0x12
-#define DATA_TYPE_YUV420_8BIT		0x18
-#define DATA_TYPE_YUV420_10BIT		0x19
-#define DATA_TYPE_YUV420_8BIT_LEGACY	0x1a
-#define DATA_TYPE_YUV420_8BIT_SHIFTED	0x1c /* Chroma Shifted Pixel Sampling */
-#define DATA_TYPE_YUV420_10BIT_SHIFTED	0x1d /* Chroma Shifted Pixel Sampling */
-#define DATA_TYPE_YUV422_8BIT		0x1e
-#define DATA_TYPE_YUV422_10BIT		0x1f
-#define DATA_TYPE_RGB444		0x20
-#define DATA_TYPE_RGB555		0x21
-#define DATA_TYPE_RGB565		0x22
-#define DATA_TYPE_RGB666		0x23
-#define DATA_TYPE_RGB888		0x24
-#define DATA_TYPE_RAW_24BIT		0x27
-#define DATA_TYPE_RAW_6BIT		0x28
-#define DATA_TYPE_RAW_7BIT		0x29
-#define DATA_TYPE_RAW_8BIT		0x2a
-#define DATA_TYPE_RAW_10BIT		0x2b
-#define DATA_TYPE_RAW_12BIT		0x2c
-#define DATA_TYPE_RAW_14BIT		0x2d
-#define DATA_TYPE_RAW_16BIT		0x2e
-#define DATA_TYPE_RAW_20BIT		0x2f
-
 #define CSID_RESET_TIMEOUT_MS 500
 
 enum csid_testgen_mode {
-- 
2.45.2


