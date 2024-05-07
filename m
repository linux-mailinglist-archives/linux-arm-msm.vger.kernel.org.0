Return-Path: <linux-arm-msm+bounces-19345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 083C48BE5F6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 16:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B7DC1F22C0F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 14:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0811DDF8;
	Tue,  7 May 2024 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oan4o4je"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438B59473
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 14:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715092323; cv=none; b=VXxv7tXYnv3vKusmEpX+p4CWZeFF6hSX1xmmDTv++aGh4Bnd/MJnmJQmloIyavEwUWYtu62va9NlgStnpyjtJmHZL5q2QSuVK12hVdHl0SdnGXw4MMN+BkJ9iugmqtI4u+kWpIv5oELIXW3Z1b1WaYxIqV60fEpdSOuRAiaVG3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715092323; c=relaxed/simple;
	bh=dIUOrSAIHdN021aT4jUnSjW6nNXUU6fCmRhcBGP9zbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLU/9mRMUZXOhekAYSWA3yw2DYZKPlVSuuxSuZvUaTDqPlDLuHwotTf77F77JLmz2J3F3moSs1XLHV5GtA6tXK0CIEgeR2diwOL6MJ8AtDyyBSBMsA++msNcIu7GDoLY1rpAfxKFWhvs5R4vVkdBvkFBugyKVlq6ljjdKNXCAxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oan4o4je; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6f0277767fbso1255221a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 07:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715092321; x=1715697121; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xfoakoCRXp8NuHbtuDoi6TSXe/02ySjJzEnJ69B3Tag=;
        b=oan4o4jebP5SqJqyZKftRzRdplkA8Ow1NaPhMWWetQ5Pu0Rr+/YQmptrmNVS08ugtp
         Bvnrv5VKNCknVkoWJbe/6WvV4qorPzdUCLs5xcO8g+7Blgts02qyyMS8nlnk3rXSs9W5
         bfTDxsxS84uCYEc1fvqq63COLcIG1DRnSygE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715092321; x=1715697121;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfoakoCRXp8NuHbtuDoi6TSXe/02ySjJzEnJ69B3Tag=;
        b=Z+OiUzd3MmAeSLDWq9uU4QwR0P7iWdEw9bQhko0mobReN/PQkh1fWAKXvJSYgufvqT
         AMwTOwV7LNeQIxcwnnjPs9sW0ExxkLhFCmf25Qxlwcfwj3dpHPPS2NIyxALQAJtnym5Q
         AwzGM6j+c4T1R6uF93XmfqG8u519SY7KoyPEOd5TNdLZeytbHru6HsLVQsiYr+HU3ESS
         BTPwFsmHWHwYdQ+e/Rfo8z99A6QVUFUQIq53RgTrVtI908M1jz1YhNWZ+QSyu4yxuShW
         g9hCdRu/qbwbAD3S0hUQWnvNukdL371RtLRODW2aHnDLa/s9DOfbZSIuIAThKpi05eiv
         jLFw==
X-Forwarded-Encrypted: i=1; AJvYcCXVF5CAV1E7fo82vXZk6IeT08X/zUTiLil5+x1P2poSjkedX+oMNnqsq7yhdJ5zF9LsfMhvNI/cHe6y9v0cyjEpuOh0KCtLl9yhW+4nyA==
X-Gm-Message-State: AOJu0YyH9iJqJBoSMXAnlEnD3HnLVtxfhrku135Muynul0nAz61jGpNq
	2a0orXokngi5bH+ivwGCTal9fMwmF9JTvFKM8AwoBXCbz628UL8XZuSXd3kmcXsJlqKeiPMFooU
	Qzw==
X-Google-Smtp-Source: AGHT+IEnjo9bd2wna/spgmWykvC7xwzhdI0w2QdfuuNRReN/cZB13pvWppK7s3cXlZV/YcSXnNmgzA==
X-Received: by 2002:a05:6830:a45:b0:6ee:2e07:8f72 with SMTP id g5-20020a0568300a4500b006ee2e078f72mr14651524otu.21.1715092321169;
        Tue, 07 May 2024 07:32:01 -0700 (PDT)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com. [209.85.167.176])
        by smtp.gmail.com with ESMTPSA id o10-20020a0568300aca00b006ee4db9f637sm1301639otu.52.2024.05.07.07.31.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 07:32:00 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c9691e1e78so1440784b6e.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 07:31:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnKxXOAlhqxqa/YY0e9s4Nvfpf+PAXCzPFdtSI0gpHJ2YgFp9wbc+upDwioJQGzgmKZVBfQc701dcb0AMwos/NDKEpw5+BrMyWZdr4Xg==
X-Received: by 2002:a05:6808:23cb:b0:3c9:6f9c:4abf with SMTP id
 bq11-20020a05680823cb00b003c96f9c4abfmr5962885oib.32.1715092319135; Tue, 07
 May 2024 07:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org> <20240507-cocci-flexarray-v1-6-4a421c21fd06@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v1-6-4a421c21fd06@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 7 May 2024 16:31:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCv==iq+pj18m891AqTYaq1M+QjyE0R=4NQKUK8BmSi7Qw@mail.gmail.com>
Message-ID: <CANiDSCv==iq+pj18m891AqTYaq1M+QjyE0R=4NQKUK8BmSi7Qw@mail.gmail.com>
Subject: Re: [PATCH 06/18] media: siano: Refactor struct sms_msg_data
To: Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	Andy Walls <awalls@md.metrocast.net>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi,

The CI has found a build error in ppc for this patch.

https://gitlab.freedesktop.org/linux-media/media-staging/-/pipelines/1171798/test_report?job_name=build

Will send a v2 shortly

On Tue, 7 May 2024 at 15:18, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Replace a single element array with a single element field.
>
> This fixes the following cocci warning:
> drivers/media/common/siano/smscoreapi.h:619:5-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/common/siano/smscoreapi.c  | 10 +++++-----
>  drivers/media/common/siano/smscoreapi.h  |  2 +-
>  drivers/media/common/siano/smsdvb-main.c |  4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
> index 7ebcb10126c9..b6f1eb5dbbdf 100644
> --- a/drivers/media/common/siano/smscoreapi.c
> +++ b/drivers/media/common/siano/smscoreapi.c
> @@ -839,7 +839,7 @@ static int smscore_configure_board(struct smscore_device_t *coredev)
>                 mtu_msg.x_msg_header.msg_flags = 0;
>                 mtu_msg.x_msg_header.msg_type = MSG_SMS_SET_MAX_TX_MSG_LEN_REQ;
>                 mtu_msg.x_msg_header.msg_length = sizeof(mtu_msg);
> -               mtu_msg.msg_data[0] = board->mtu;
> +               mtu_msg.msg_data = board->mtu;
>
>                 coredev->sendrequest_handler(coredev->context, &mtu_msg,
>                                              sizeof(mtu_msg));
> @@ -852,7 +852,7 @@ static int smscore_configure_board(struct smscore_device_t *coredev)
>                 SMS_INIT_MSG(&crys_msg.x_msg_header,
>                                 MSG_SMS_NEW_CRYSTAL_REQ,
>                                 sizeof(crys_msg));
> -               crys_msg.msg_data[0] = board->crystal;
> +               crys_msg.msg_data = board->crystal;
>
>                 coredev->sendrequest_handler(coredev->context, &crys_msg,
>                                              sizeof(crys_msg));
> @@ -1306,7 +1306,7 @@ static int smscore_init_device(struct smscore_device_t *coredev, int mode)
>         msg = (struct sms_msg_data *)SMS_ALIGN_ADDRESS(buffer);
>         SMS_INIT_MSG(&msg->x_msg_header, MSG_SMS_INIT_DEVICE_REQ,
>                         sizeof(struct sms_msg_data));
> -       msg->msg_data[0] = mode;
> +       msg->msg_data = mode;
>
>         rc = smscore_sendrequest_and_wait(coredev, msg,
>                         msg->x_msg_header. msg_length,
> @@ -1394,7 +1394,7 @@ int smscore_set_device_mode(struct smscore_device_t *coredev, int mode)
>
>                         SMS_INIT_MSG(&msg->x_msg_header, MSG_SMS_INIT_DEVICE_REQ,
>                                      sizeof(struct sms_msg_data));
> -                       msg->msg_data[0] = mode;
> +                       msg->msg_data = mode;
>
>                         rc = smscore_sendrequest_and_wait(
>                                 coredev, msg, msg->x_msg_header.msg_length,
> @@ -1554,7 +1554,7 @@ void smscore_onresponse(struct smscore_device_t *coredev,
>                         struct sms_msg_data *validity = (struct sms_msg_data *) phdr;
>
>                         pr_debug("MSG_SMS_DATA_VALIDITY_RES, checksum = 0x%x\n",
> -                               validity->msg_data[0]);
> +                               validity->msg_data);
>                         complete(&coredev->data_validity_done);
>                         break;
>                 }
> diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
> index f8789ee0d554..46dc74ac9318 100644
> --- a/drivers/media/common/siano/smscoreapi.h
> +++ b/drivers/media/common/siano/smscoreapi.h
> @@ -616,7 +616,7 @@ struct sms_msg_hdr {
>
>  struct sms_msg_data {
>         struct sms_msg_hdr x_msg_header;
> -       u32 msg_data[1];
> +       u32 msg_data;
>  };
>
>  struct sms_msg_data2 {
> diff --git a/drivers/media/common/siano/smsdvb-main.c b/drivers/media/common/siano/smsdvb-main.c
> index d893a0e4672b..44d8fe8b220e 100644
> --- a/drivers/media/common/siano/smsdvb-main.c
> +++ b/drivers/media/common/siano/smsdvb-main.c
> @@ -689,7 +689,7 @@ static int smsdvb_start_feed(struct dvb_demux_feed *feed)
>         pid_msg.x_msg_header.msg_flags = 0;
>         pid_msg.x_msg_header.msg_type  = MSG_SMS_ADD_PID_FILTER_REQ;
>         pid_msg.x_msg_header.msg_length = sizeof(pid_msg);
> -       pid_msg.msg_data[0] = feed->pid;
> +       pid_msg.msg_data = feed->pid;
>
>         return smsclient_sendrequest(client->smsclient,
>                                      &pid_msg, sizeof(pid_msg));
> @@ -711,7 +711,7 @@ static int smsdvb_stop_feed(struct dvb_demux_feed *feed)
>         pid_msg.x_msg_header.msg_flags = 0;
>         pid_msg.x_msg_header.msg_type  = MSG_SMS_REMOVE_PID_FILTER_REQ;
>         pid_msg.x_msg_header.msg_length = sizeof(pid_msg);
> -       pid_msg.msg_data[0] = feed->pid;
> +       pid_msg.msg_data = feed->pid;
>
>         return smsclient_sendrequest(client->smsclient,
>                                      &pid_msg, sizeof(pid_msg));
>
> --
> 2.45.0.rc1.225.g2a3ae87e7f-goog
>


-- 
Ricardo Ribalda

