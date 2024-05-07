Return-Path: <linux-arm-msm+bounces-19323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D61748BE3C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 15:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D7991F22252
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 13:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77F616D4E2;
	Tue,  7 May 2024 13:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LD5VbC3C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CAF16C85E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 13:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087918; cv=none; b=pV2GSu1jusxtNULKNeBBj4F7PHmIYt3wWnQ7zDW8QngYhQ7Qzc49b4C+yjc1D+QXZqGFRI3FAQHv6bOtY/6WG7q3X9A90l0e70VZcGpHJZgMC8Nh8jcYnkWhqfhRpeAJdkBGWt6KK3DL9LCYWG2GygfXTPjKHipjtPdvPGAZp+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087918; c=relaxed/simple;
	bh=ijopITI+g400QtGKLS59fnNFa/e12FntTcMx7Nqpa5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JsnFaIgN/d0nWGDK0ukXgmSjNFus/aeDlOXFqtcftmj9FS5MS+uks4ucFhZC9TB80UDOpIlXGHaFk0A2ACSKzkwY3MMhVy99R5DPZGTSoF0cg6+S2+7XAo9qu2Y+B5o66gCb1j4bN6sSj/NZewKm/YK+ywHtCj1Ysqyma9KQLw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LD5VbC3C; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6a04bb4f6d5so20313446d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 06:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087915; x=1715692715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/4oby1OzvPbisoZWbigQhOZs4utcCTPvU7cAHaoXZY=;
        b=LD5VbC3C62AUAa2nR4KgWdm3kuYSzH9cbgMdt+/EVWnIHtdeJhzm/pLWCTqlIr94s5
         k//uu2AJywfQVcHVCDhQOnXA3nLl2zoNVOjqwAB6ruv252JzcGJDdWqz8+ucS08O9+2J
         L8glmdsq1N3jN6F/2zDjH6He4XIB4FhwDLO6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087915; x=1715692715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/4oby1OzvPbisoZWbigQhOZs4utcCTPvU7cAHaoXZY=;
        b=egvvPU6onWY42pl3ecZvJ+0zHtRZ9RQZK7QxD6Si0sCeV/x7bIdz6j61fcwOJkGy+a
         qkc+6I3beOezcGx6tUY1qncTYVHixZ4lzapMvPCBLgaInKnOEJEG57UDOagcem+pyXBU
         g9vqjstjY1IHpQVygvkTj04d1QLxPDnAuAlVu8H1DwoU7X2fdLZg04PCY9OJKttObI8C
         3rZdE2h14pHTG7itgjox3Q0kOen2TkWbF3Cryn/XmkhhSMDbQcE9et5I1z5KtXHWJR+A
         S4IvWyL+syjYTmnsKdKxGKGGNG2fjUpbsQLewKKeIIxIymRwcD6jq1u3HGg1tHyjcuhN
         K8Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVNea1TzR8bKM/gBqdLdU9LinY/JwlV2qdOdVjXqD721fYZz1l3o1Mb89NV4IQ9BxF+cVe55zDU7e7m4Pi75blAJelkXrEqmRfweP57hA==
X-Gm-Message-State: AOJu0YzBxQ9TOj9OKYGZJlYnKYSGMwjKmgSf3ZM7Mf+o7zh+i27Golvy
	WbDV/1O8f9M+zUf+beZvkMUdQkmQE/bDvdT5hCFQCQxzQ0K/5o2wmmosWqtO0Q==
X-Google-Smtp-Source: AGHT+IEwGqKCP2RodY96Q7BvikThgfGTcpEIa62+nhVbtzbMCCA4jSL8KZCOlBJ4ow7E8ohEtntOvA==
X-Received: by 2002:a05:6214:2401:b0:6a0:cd2a:8ae2 with SMTP id fv1-20020a056214240100b006a0cd2a8ae2mr15077797qvb.21.1715087915445;
        Tue, 07 May 2024 06:18:35 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:35 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 13:18:32 +0000
Subject: [PATCH 06/18] media: siano: Refactor struct sms_msg_data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v1-6-4a421c21fd06@chromium.org>
References: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
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

This fixes the following cocci warning:
drivers/media/common/siano/smscoreapi.h:619:5-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/siano/smscoreapi.c  | 10 +++++-----
 drivers/media/common/siano/smscoreapi.h  |  2 +-
 drivers/media/common/siano/smsdvb-main.c |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

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

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


