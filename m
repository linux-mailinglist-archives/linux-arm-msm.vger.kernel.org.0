Return-Path: <linux-arm-msm+bounces-16750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D1F89B6EF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 06:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D274E1C209C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 04:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B6618C22;
	Mon,  8 Apr 2024 04:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oprSFMRv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643BE7482
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 04:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712550659; cv=none; b=Y1WlhRZM6i1iRpy3oXpeas3NPk1y55R8lnh3+5Nfu7hZCQy9swow6p6YCCW5DgusY6WHyzLJYeF7Sdiy63+ED+8UxgxqmJx27VlSuW+a7oOUFUVtR8sWWcovH0/mc98k9AUwbVOVADE+p5Ux0sNVXXZ/NaDDI//B/ZNAzU7cYAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712550659; c=relaxed/simple;
	bh=AiMHop6LtWh5la59tUhjUjvEK/UQiD8uM+1Bb2RGdcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GLT6/Hl92gu7UzrY5f2u7GFDMDzy2czdYBPRkwzWa1hMOMifw357cB9w1MJF0X4pyeQzZomxiF8065H0neZwiu084nswVjyoMBumL0p4rMpG+eNDN8JB/3KeSD7/9Azy4g6UvuiPOaGkCdnQidkw483IFqLE3HJsjC9rk9iUzKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oprSFMRv; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d8863d8a6eso13253781fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Apr 2024 21:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712550655; x=1713155455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWjHFP4FIwQxUWAPVoONDZq/MeuxzTLfwG/YafjPU/Y=;
        b=oprSFMRvTiJHEr15KFMeVH6QzEY8VIK5o6rXJOV9drS8/jr/Gcat7RmxgnQUw0r8f9
         /ZAMr3XUYmuMQT9hkqRvrG0XaLmDchMZq6+d1DwLGF/073mgvM36Fl9lChwudvr7D+yI
         ScKMSgyXvEemCk53MIdRWoAPAobSemwSEW5QMbpxKAV66wIxmxu5wz6fbHzQ1/1KSGtj
         onoBRaExBfQN8PBMRF0oQadN7tmFpvT/ty3cxSxhWMbIqTT/DMGw8lUfiGJKTI5hUB2I
         KgBZVjOuApNDR0nm5GLtNmFKAbI10fakqP/SktnJ7Qzac95mz+2oXsjfQhAz88DUeeIt
         VxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712550655; x=1713155455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWjHFP4FIwQxUWAPVoONDZq/MeuxzTLfwG/YafjPU/Y=;
        b=Rq7z7cHdDs4tZBf0xEYHg3ZnUfpn8d3ERid07wRtrnKS0TmoHM0qXZe3ICJDf9Fz9O
         kA6f6NmnuJkmPeUtpk9VpW1BYk9BTONo1iqyLGszqUfahIzTneNn3fKnYL6L7JLbUD3Z
         CZqGKZKEoJZ+ZgBdLAaa4wK3uN0igVeAeYpP4QWgRMa21hm0DpXHEA9TGacc3lVwhsmg
         9q6dYLQu9J5CzttQKu8yLhOA+4u+IlhQkFqukHLhflEjMv8lJFeSPhbiGFHL6YQcmdY8
         Md1WNlvHN7wRD7pBlgaPNtnKVHF4hK2yQ38B+1r6BPCHrIMM0V2Dqv0xRNzBtWJGworw
         ucGw==
X-Forwarded-Encrypted: i=1; AJvYcCW1VDVjldLimvM5kAq0q+vLTiRvtca1bBZsPn+RUxqK0TVmmUDP12Ln589h3Ns1GN+khr3EWzW2r31PDIuSLknOzTZNfWtTXZoeUvGe9w==
X-Gm-Message-State: AOJu0YwIH1fyJ8fnZFoXtE7idO0OtDTBjdUAUIt/cyc1zNRFLR9Jg1Bm
	RLXhv36Kg4x4+XZcS0VxRS1jSsWfxnPOCJ45LJMguGu4bGgT5RA8NFwd1+d3Dfg=
X-Google-Smtp-Source: AGHT+IFIO6xNYoZfEPFKmXNYH/a6iz/UGLcCNim2Ck9xD7LkNwZBRVFMJ1PDf5p1BbUMWec2ZXfO4A==
X-Received: by 2002:a19:644e:0:b0:513:aef9:7159 with SMTP id b14-20020a19644e000000b00513aef97159mr5407151lfj.39.1712550655691;
        Sun, 07 Apr 2024 21:30:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g13-20020ac2538d000000b005132f12ee7asm1033207lfh.174.2024.04.07.21.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 21:30:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 08 Apr 2024 07:30:52 +0300
Subject: [PATCH 4/5] usb: typec: ucsi: make it orientation-aware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-ucsi-orient-aware-v1-4-95a74a163a10@linaro.org>
References: <20240408-ucsi-orient-aware-v1-0-95a74a163a10@linaro.org>
In-Reply-To: <20240408-ucsi-orient-aware-v1-0-95a74a163a10@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AiMHop6LtWh5la59tUhjUjvEK/UQiD8uM+1Bb2RGdcc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmE3L7IPs4Dy2cixnuxh6PbWMygAc34bJSsBTiS
 g87Qu8asz6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhNy+wAKCRCLPIo+Aiko
 1Wx+B/wL9D5rVVtyDGr8tJVBflDFYn+l/8QkHU+8lO8IayWT9KG+uOtsC1LnOmRspt6imRaDueZ
 JhbpbaOf6eL12HEDTo1MdSVR17h7wlk2hOaR4eBhVmbHocM50U7svsxLYiQ3GQFIQc7z+fBZJLk
 R7rf5B/Jt3TmYSG/ccUI4k6N8fK3QBLZJNPypICKqxXJmSjiol0fTJV+fH01FioNAA/f+YtFUnW
 mbzFsQid+kMnK7VL3ETL8JrCDzX8BciHnn4feM+b+h+d4bY1RurXYkwXX8lKLz6WV7eyEiydsJg
 Hp6tpehb5SQJcETvzry2zv3gtbe5SA3MGnxwc7QNWKIOQbFr
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The UCSI 1.0 is not orientation aware. Only UCSI 2.0 has added
orientation status to GET_CONNECTOR_STATUS data. However the glue code
can be able to detect cable orientation on its own (and report it via
corresponding typec API). Add a flag to let UCSI mark registered ports
as orientation aware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 ++
 drivers/usb/typec/ucsi/ucsi.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 7ad544c968e4..6f5adc335980 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1551,6 +1551,8 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	cap->svdm_version = SVDM_VER_2_0;
 	cap->prefer_role = TYPEC_NO_PREFERRED_ROLE;
 
+	cap->orientation_aware = !!(ucsi->quirks & UCSI_ORIENTATION_AWARE);
+
 	if (con->cap.op_mode & UCSI_CONCAP_OPMODE_AUDIO_ACCESSORY)
 		*accessory++ = TYPEC_ACCESSORY_AUDIO;
 	if (con->cap.op_mode & UCSI_CONCAP_OPMODE_DEBUG_ACCESSORY)
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 6599fbd09bee..e92be45e4c1c 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -410,6 +410,7 @@ struct ucsi {
 	unsigned long quirks;
 #define UCSI_NO_PARTNER_PDOS	BIT(0)	/* Don't read partner's PDOs */
 #define UCSI_DELAY_DEVICE_PDOS	BIT(1)	/* Reading PDOs fails until the parter is in PD mode */
+#define UCSI_ORIENTATION_AWARE	BIT(2)	/* UCSI is orientation aware */
 };
 
 #define UCSI_MAX_SVID		5

-- 
2.39.2


