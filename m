Return-Path: <linux-arm-msm+bounces-20652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D938D0F11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 23:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C3902832F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 21:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B33169AC1;
	Mon, 27 May 2024 21:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y5dxmb8z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4A8168C15
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 21:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716844143; cv=none; b=YTNVX0hefCBbTq6sbENqbeWRKhcXNT2z/GiCw5GdBndwsBJ7D9fzH5XMNK59ZCaDLlAauXksewRDAbfUgp6aalqR2LgBBGSKFiAhEQvD9u0oG8bkJ9AZhmAMFOYAcWBKs23zeAqAiTFRzag5NzXuVie+/1xm6d9lbJn3Ob1G2AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716844143; c=relaxed/simple;
	bh=tZqX6JK7jkHsbyvqklmYMlf9uW/lwEDCI8QNWvC7mcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NMPPSx5yT34ncJ3j5HqDQr9DJ/D9aEkx4IuxynIpnWebyQiT6sunmB+8cz52q6CCmIUXKzV09psfFJzgAJ2ATeRUJT+s44GbzsX5r/Lmd90TzUfEUpcApc35P54cNY81E0kgLYYnpPiQTVj8xtB9QXT06CM1T/tDu/rJhtu+Ot4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y5dxmb8z; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6ab9d00f727so743136d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 14:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716844141; x=1717448941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxyMD7+SOcIzrSiBs+HrUXuQ7E3uLSGINL6mw8MkAf4=;
        b=Y5dxmb8zWtG6sA5x/Gd3ME7YwVRFquek1t251hKvOzWq82EuEWYnJLQlp9JoqrqhAs
         ej/6XPAtlSkuOnvCLCoPSSeVXPrzYttCqcepsYnjQoZ5ml6noU8ChF88Hexnj9gxRwy9
         bGx7MmU/kC/ok3Sk+hhX5GTPcAd8qGsT05h3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716844141; x=1717448941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JxyMD7+SOcIzrSiBs+HrUXuQ7E3uLSGINL6mw8MkAf4=;
        b=KCaiRclEFA1P3mMLqNbkGkYydi46ANO7syfLWgMRIh8k/HY2MrkvPmRRg81+LbA/gI
         PwzDoAynUiQMwvwWBq+ejzsay3xsEwMoPGTiNHojINxHz+QLXPW5ybA3uHM9CGuHp0cf
         FXm6ormHx32aQqgkTwEvGVth88hNVyF6AnycF1zyM0Jx4GNnlVv+Fw7BBEg8y26sVj2h
         gdt/OmO7mWB7qMDCDkKSGGcQl8wm577nSSdr557NVwe9HeKNRDnNIpOuX+hwfWvRBxmf
         lENJSWdX/OoXntfsqNqZpLKCG5u5Pd9dPngG63Jq/eMzoTsueww+ySNhR3dVXnFlmTRF
         /2KQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8YtDMhTFf3yAY2POHiY+1AdO5IBDWlXSnJ8jcG707kNfNfAe3TIiLWZ3Rbr1ZDqxb93GSCU4WVoU+ZRBvzivWbOybVAEf17EvswXKMg==
X-Gm-Message-State: AOJu0YxQJiWmKMbUsIVH4t2+Uu0gOTw6Lb9JvyEb+dHlUp5vDoVvZ7qZ
	jjsBwr3upL19ThAPWBjaqVXSAr3wSkv/1LjoVGic3VZj533V/TJuLQFjLo5uPQ==
X-Google-Smtp-Source: AGHT+IHE71X9+mt3p9eZinGz4YAfmZNgkJZyXT70W1JDZtffA6gSeDLWsm8n9IcJH7Rxix/i8dP0xg==
X-Received: by 2002:a05:6214:4687:b0:6ad:8e56:cb37 with SMTP id 6a1803df08f44-6ad8e56d3camr11195106d6.55.1716844140657;
        Mon, 27 May 2024 14:09:00 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad850a6dc7sm9511866d6.93.2024.05.27.14.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 14:09:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 21:08:56 +0000
Subject: [PATCH v3 06/18] media: siano: Refactor struct sms_msg_data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-cocci-flexarray-v3-6-cda09c535816@chromium.org>
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
In-Reply-To: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
To: Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Replace a single element array with a single element field.

The endianness conversion code seems to support multiple elements. To
avoid changing behavior a pointer to the single element has been used.

This is safer than moving to a flex array, because in that case the
structure size changes.

This fixes the following cocci warning:
drivers/media/common/siano/smscoreapi.h:619:5-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/siano/smscoreapi.c  | 10 +++++-----
 drivers/media/common/siano/smscoreapi.h  |  2 +-
 drivers/media/common/siano/smsdvb-main.c |  4 ++--
 drivers/media/common/siano/smsendian.c   |  8 +++++---
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
index 7ebcb10126c9..b6f1eb5dbbdf 100644
--- a/drivers/media/common/siano/smscoreapi.c
+++ b/drivers/media/common/siano/smscoreapi.c
@@ -839,7 +839,7 @@ static int smscore_configure_board(struct smscore_device_t *coredev)
 		mtu_msg.x_msg_header.msg_flags = 0;
 		mtu_msg.x_msg_header.msg_type = MSG_SMS_SET_MAX_TX_MSG_LEN_REQ;
 		mtu_msg.x_msg_header.msg_length = sizeof(mtu_msg);
-		mtu_msg.msg_data[0] = board->mtu;
+		mtu_msg.msg_data = board->mtu;
 
 		coredev->sendrequest_handler(coredev->context, &mtu_msg,
 					     sizeof(mtu_msg));
@@ -852,7 +852,7 @@ static int smscore_configure_board(struct smscore_device_t *coredev)
 		SMS_INIT_MSG(&crys_msg.x_msg_header,
 				MSG_SMS_NEW_CRYSTAL_REQ,
 				sizeof(crys_msg));
-		crys_msg.msg_data[0] = board->crystal;
+		crys_msg.msg_data = board->crystal;
 
 		coredev->sendrequest_handler(coredev->context, &crys_msg,
 					     sizeof(crys_msg));
@@ -1306,7 +1306,7 @@ static int smscore_init_device(struct smscore_device_t *coredev, int mode)
 	msg = (struct sms_msg_data *)SMS_ALIGN_ADDRESS(buffer);
 	SMS_INIT_MSG(&msg->x_msg_header, MSG_SMS_INIT_DEVICE_REQ,
 			sizeof(struct sms_msg_data));
-	msg->msg_data[0] = mode;
+	msg->msg_data = mode;
 
 	rc = smscore_sendrequest_and_wait(coredev, msg,
 			msg->x_msg_header. msg_length,
@@ -1394,7 +1394,7 @@ int smscore_set_device_mode(struct smscore_device_t *coredev, int mode)
 
 			SMS_INIT_MSG(&msg->x_msg_header, MSG_SMS_INIT_DEVICE_REQ,
 				     sizeof(struct sms_msg_data));
-			msg->msg_data[0] = mode;
+			msg->msg_data = mode;
 
 			rc = smscore_sendrequest_and_wait(
 				coredev, msg, msg->x_msg_header.msg_length,
@@ -1554,7 +1554,7 @@ void smscore_onresponse(struct smscore_device_t *coredev,
 			struct sms_msg_data *validity = (struct sms_msg_data *) phdr;
 
 			pr_debug("MSG_SMS_DATA_VALIDITY_RES, checksum = 0x%x\n",
-				validity->msg_data[0]);
+				validity->msg_data);
 			complete(&coredev->data_validity_done);
 			break;
 		}
diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
index f8789ee0d554..46dc74ac9318 100644
--- a/drivers/media/common/siano/smscoreapi.h
+++ b/drivers/media/common/siano/smscoreapi.h
@@ -616,7 +616,7 @@ struct sms_msg_hdr {
 
 struct sms_msg_data {
 	struct sms_msg_hdr x_msg_header;
-	u32 msg_data[1];
+	u32 msg_data;
 };
 
 struct sms_msg_data2 {
diff --git a/drivers/media/common/siano/smsdvb-main.c b/drivers/media/common/siano/smsdvb-main.c
index d893a0e4672b..44d8fe8b220e 100644
--- a/drivers/media/common/siano/smsdvb-main.c
+++ b/drivers/media/common/siano/smsdvb-main.c
@@ -689,7 +689,7 @@ static int smsdvb_start_feed(struct dvb_demux_feed *feed)
 	pid_msg.x_msg_header.msg_flags = 0;
 	pid_msg.x_msg_header.msg_type  = MSG_SMS_ADD_PID_FILTER_REQ;
 	pid_msg.x_msg_header.msg_length = sizeof(pid_msg);
-	pid_msg.msg_data[0] = feed->pid;
+	pid_msg.msg_data = feed->pid;
 
 	return smsclient_sendrequest(client->smsclient,
 				     &pid_msg, sizeof(pid_msg));
@@ -711,7 +711,7 @@ static int smsdvb_stop_feed(struct dvb_demux_feed *feed)
 	pid_msg.x_msg_header.msg_flags = 0;
 	pid_msg.x_msg_header.msg_type  = MSG_SMS_REMOVE_PID_FILTER_REQ;
 	pid_msg.x_msg_header.msg_length = sizeof(pid_msg);
-	pid_msg.msg_data[0] = feed->pid;
+	pid_msg.msg_data = feed->pid;
 
 	return smsclient_sendrequest(client->smsclient,
 				     &pid_msg, sizeof(pid_msg));
diff --git a/drivers/media/common/siano/smsendian.c b/drivers/media/common/siano/smsendian.c
index a3573814919b..b957970c7d97 100644
--- a/drivers/media/common/siano/smsendian.c
+++ b/drivers/media/common/siano/smsendian.c
@@ -20,11 +20,12 @@ void smsendian_handle_tx_message(void *buffer)
 	struct sms_msg_data *msg = buffer;
 	int i;
 	int msg_words;
+	u32 *msg_data = &msg->msg_data;
 
 	switch (msg->x_msg_header.msg_type) {
 	case MSG_SMS_DATA_DOWNLOAD_REQ:
 	{
-		msg->msg_data[0] = le32_to_cpu((__force __le32)(msg->msg_data[0]));
+		msg->msg_data = le32_to_cpu((__force __le32)(msg->msg_data));
 		break;
 	}
 
@@ -33,7 +34,7 @@ void smsendian_handle_tx_message(void *buffer)
 				sizeof(struct sms_msg_hdr))/4;
 
 		for (i = 0; i < msg_words; i++)
-			msg->msg_data[i] = le32_to_cpu((__force __le32)msg->msg_data[i]);
+			msg_data[i] = le32_to_cpu((__force __le32)msg_data[i]);
 
 		break;
 	}
@@ -66,11 +67,12 @@ void smsendian_handle_rx_message(void *buffer)
 
 	default:
 	{
+		u32 *msg_data = &msg->msg_data;
 		msg_words = (msg->x_msg_header.msg_length -
 				sizeof(struct sms_msg_hdr))/4;
 
 		for (i = 0; i < msg_words; i++)
-			msg->msg_data[i] = le32_to_cpu((__force __le32)msg->msg_data[i]);
+			msg_data[i] = le32_to_cpu((__force __le32)msg_data[i]);
 
 		break;
 	}

-- 
2.45.1.288.g0e0cd299f1-goog


