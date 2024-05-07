Return-Path: <linux-arm-msm+bounces-19368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2820F8BE926
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 18:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DE9CB26773
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 16:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B911816D9CA;
	Tue,  7 May 2024 16:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lxo11x3g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1FE16D4D6
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 16:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099237; cv=none; b=io4lFuz+ulTN7wlMJ0/bSXeGwUd1P87EBMNaIfghyOJStw/JMY703TgfPFaKpfTd/XS8z4K1z8OYIJ0PInEj0geNcFBqMeT8lJ+qv6X/yqcz0/kf5Rtm573kePFE/Td49VBSkt8g5hhgn+Or3uHip28y8jXcgOD9SHX0d5rgaQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099237; c=relaxed/simple;
	bh=TBNCx1gGrBDy9NxmrHPxnzPFvK9qlBkf27idsj7B9Cw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c9SIwXmcG3l7yYcg9B//5Ou2oxSuGyEJUMHqLNac3YndiGcdHAVf52YYkL2IiMuJOhD0JVgzCMh53bYcVBXwtDA9Yj78UF1LrMOH2J/U0ZlmL21FXfxoj7/GOVEqnBOsXi0x8RWGUmf6/G6nO0hruFONT0zgquOWperpHVuN8pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lxo11x3g; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3c98042b297so318649b6e.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099235; x=1715704035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckyXB1RMjwvOvAxa8fnxheCGm68/C6yK7+APpHNPb5E=;
        b=lxo11x3ghsc929qK2ouDhbNp1XXSubGQ+xHrF3xRV61eMhBUSy3MO6hDwDntJQOWMa
         vdp6uuLnm2lQOAiI4C4IQouaPHpNPj9Hth+LlKxEZUeUHUCj3t7C2L3C+t7FU+GiiPH1
         cGBeGjqXE+dC33Km/zbjEksoo3JwB7aT5AhvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099235; x=1715704035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckyXB1RMjwvOvAxa8fnxheCGm68/C6yK7+APpHNPb5E=;
        b=Tvdm5BQlawPmiXIv515OPlcrVpbTfV88nskoifxgShvY8iyoAKWiftgTRMyQQkdDGV
         yq/+nyo7iJLlO7c9PV64mKhlq2l1zzoJe9aU8KP9has3b1fOq/4pCwPFkjwKNB0ul1sz
         kZh7M/A58EfSnuodo40bhj4lOCq5HWMXX7iWCymdZLGJ7uncQH5Ur+IcmTNSfcsN0J6w
         ZwFaNO66OQZhQZrCf3rlaHoki2AkA/qsO8JtF+WQz79dERJ+CfwrXrfAW5sgj0zMLrwW
         qrUWDBzCAz4hAJQl0E7IYEBZ/HIU/oLCueKsAQlHGXhfadtoko1ewk5XS6NnzinxiRFk
         xDmA==
X-Forwarded-Encrypted: i=1; AJvYcCWzm8e4NIyYvvCdECaTMFU2ujIu8YFeML4TTQ3FbwudtrPQprK1e0U3fAsNTZsyD2tiCxYsrj22GceYZqAqw/SwQbrs2Zufj1n4XYroiQ==
X-Gm-Message-State: AOJu0YyHvJR4MrFFJuW+/P836ZX3PzkRMGsOmr+Rph6Imj4SlWvX/NYG
	NneavfL5T5QWteg2EW87PUhtcI7GM1A7ny7yKxo/p1e4iJheafbE8x4Mb551qQ==
X-Google-Smtp-Source: AGHT+IHK8MR0ETZCa+Cso9ZcR2kzwzSwWzWxtW7LPWutI3GEHlRvYRnkrjbzVhChzSF546k9ojGUqQ==
X-Received: by 2002:a05:6808:2ca:b0:3c7:3d8f:7ef1 with SMTP id 5614622812f47-3c9852be83bmr64772b6e.17.1715099234965;
        Tue, 07 May 2024 09:27:14 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:11 +0000
Subject: [PATCH v2 06/18] media: siano: Refactor struct sms_msg_data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-6-7aea262cf065@chromium.org>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
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
2.45.0.rc1.225.g2a3ae87e7f-goog


