Return-Path: <linux-arm-msm+bounces-84225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8061C9F1AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 14:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 338633A1D0C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 13:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3D021A444;
	Wed,  3 Dec 2025 13:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bu6jtpT1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1030E1E51E1
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 13:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764767884; cv=none; b=p3M2Sqxr7Hx7nvzk+ArVEjif4J7a4an4nupUeCFSTnkwEhZ2Ipdp0njBYizxMZpburP18VsqJtweon9H57bZ2CSnHaevX3gkx5WxkUB+YNIq0svWF2DtBktXh++OPvgvusNVhOvkJwOwg7d3weDndMhU3HNqOsNE91pnb+78Gfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764767884; c=relaxed/simple;
	bh=reVDA7x3hNUdYQrDUdDx+qmrjkFvJpDTrMTWj2ujyFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BwaFY1CvloZGO9lvRj8BecH3CHHWZlpAM1yYJ+f/N6uOXJdzGYvTPO6Di1zAk6+lx2Mo0z65Qy8nqNL0O5wancSLkNb0slX4auqgEbTMepvruiJ8kr/k/gIPx/FCw4h6tcWnp6zM4wk8cwTtei9fwfHFkdn3CKvz0HAowZ9ZGc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bu6jtpT1; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37b495ce059so53189211fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 05:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764767881; x=1765372681; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P5S4Rk+sFIYtI41p7btxGAQ+EtPF7agT5NetpnNswgo=;
        b=bu6jtpT1XHuAw5Ii/005poc/gbgtQ5/FF2ENiSVhpDQfJrob8+YlODIZ18NOz+wmLn
         Ohx3BOUWrJWWJOajswM4TvRCKhbifrFzAHScwQKkUAuUzBDKqsqcuMohF1h+4ji0A/1X
         W0qzeMwyX2JZiGtDl3aje3B5Wq7nGSEMH+fqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764767881; x=1765372681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5S4Rk+sFIYtI41p7btxGAQ+EtPF7agT5NetpnNswgo=;
        b=Z7i54YVQnpTZajBohnQNALO0bVuJnTR7GW30PS70Qncri8dbRiyMepBzFJDZAVlHs+
         d908wJ2QOCbg0oX5zeITP+7ngjoSWlfRRYH+S7RAalr57K2SzORzO3fnHFGXCIDeQji1
         X6zzwwnPcIGK8vtn1zGfuSflD5cJMW6Fyn7crHfwb2lbgYhLqnqoPX5QfgJZMD9I/WKm
         1jicafulI81TOaNC6k4tzn/W/806qF3K8/a6gtQSd8hfjqItSHcX4QN3cgjgjuoKyOGq
         byzyVL7Jrc6YCaNR7x+8hDKdAKav56BviTSeYN2GzpEdn20OsN1dXx0VRdGJbg36oUCr
         xR6w==
X-Forwarded-Encrypted: i=1; AJvYcCXH/nGgB57MZWmwkyNNeZdzWZHSGsaeLCuRjJhY1V0UXkD47THPIDa0HyMoXo323Gdp23jLiwZprKVdXXNq@vger.kernel.org
X-Gm-Message-State: AOJu0YxgBEroHSeTEpdZrRL//lUOJf9ww9eHZ7pl/wV4lCfZEzKNuHFK
	Qq+4vvYCBmERozm/XRZxOPhfAA+qot3Hb+P2lcWc0Zg2u5OZxd4tRpu56LkJUbt9INF+Npt+40t
	lh9y/uw==
X-Gm-Gg: ASbGnctH0XKu6XoGc1Hm1iqREtJg/9WI+fzkX9WaKg30Lghnn3aoADY1GjqpTN5bH2D
	YeCNsxkqMLLjZbYJ4AO+VcOuADUsb8M0b64Dlmlw6Ebla2+GZARdwIaY414JZzc5qLGAt3D0/vi
	jDY9I9DmvbC0t7DWyazhatC12wgexv+RZ4Lp4YQ0KL9tA9sNa3/+TI0xopKjiFCtACdNLB4bquv
	kfxDKsAcUzu9fqBYlBzhFHUhqEXghKUMkHDo2X9V7miODfZKKWsshpPm5hDziQ3UhaBkYx1ILym
	aELtnwyBxg6GkDdWID6xD4JJT5FzynLj4mbFTPYPLa/M+3uW/WdsGXOUAPqQfyNbmlyNRyABRSX
	DTNVGTHTnzoiVWIBl4uAayLGMl/O8JHRx6Kud0Q9NSt6u17vpdXQgjZm0SqU766ybW49ATdqqvw
	YPuscAKTTklrHBG9q5H5jp1JwYqVtJB3rKzoru4MDT1j5GnEMz
X-Google-Smtp-Source: AGHT+IEatlolFCha/dGqTgMBXL/PkSjIIxMddjai+lA/nCGphXQSuC7TZiInGSIK3rtrHGslXhjy8g==
X-Received: by 2002:a05:651c:4399:10b0:37b:b140:e512 with SMTP id 38308e7fff4ca-37e63704bbamr7441241fa.10.1764767880773;
        Wed, 03 Dec 2025 05:18:00 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d2368e40csm42967491fa.5.2025.12.03.05.17.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 05:17:59 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5957c929a5eso9777207e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 05:17:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURb02ib36ftAAzfLZ9r0kRSWsBV3YkjoYfrfcBCUXOtQ+xe23f/kq4hEKmhh2quNNBe5y1UwZ3is7s6TsC@vger.kernel.org
X-Received: by 2002:a05:6512:2354:b0:595:83f5:c33f with SMTP id
 2adb3069b0e04-597d3f729fdmr900528e87.19.1764767878697; Wed, 03 Dec 2025
 05:17:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
 <20251203-warnings-6-19-v1-2-25308e136bca@chromium.org> <20251203091649.GA13064@pendragon.ideasonboard.com>
In-Reply-To: <20251203091649.GA13064@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 3 Dec 2025 14:17:45 +0100
X-Gmail-Original-Message-ID: <CANiDSCvbZ+kUCCYV0OKEBXha5Mfpk4-vkhSWcnvjzh89LfLufQ@mail.gmail.com>
X-Gm-Features: AWmQ_blUSRjZVyg4YIgU-ywSdUHU1lQSr3F3WW-ElU_ZLNp7Yz4ryrusstxNQOs
Message-ID: <CANiDSCvbZ+kUCCYV0OKEBXha5Mfpk4-vkhSWcnvjzh89LfLufQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: iris: Document difference in size during allocation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Keke Li <keke.li@amlogic.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent



On Wed, 3 Dec 2025 at 10:17, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Dec 03, 2025 at 08:55:35AM +0000, Ricardo Ribalda wrote:
> > As we get ready for kzalloc checking for invalid sizes, let's add
> > documentation for the cases where the size is different but valid.
> >
> > This patch fixes this cocci warning:
> > ./platform/qcom/iris/iris_hfi_gen2_command.c:1215:9-25: WARNING: casting value returned by memory allocation function to (struct iris_inst *) is useless.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> > index f9129553209922fda548ca320494ae6ae797854c..ab91afd0597045bd876d0411b08b5a3421b12c70 100644
> > --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> > +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> > @@ -1212,5 +1212,13 @@ void iris_hfi_gen2_command_ops_init(struct iris_core *core)
> >
> >  struct iris_inst *iris_hfi_gen2_get_instance(void)
> >  {
> > -     return (struct iris_inst *)kzalloc(sizeof(struct iris_inst_hfi_gen2), GFP_KERNEL);
> > +     struct iris_inst_hfi_gen2 *out;
> > +
> > +     /*
> > +      * The allocation is intentionally larger. The first member of
> > +      * struct iris_hfi_gen2 is struct iris_inst.
> > +      */
> > +     out = kzalloc(sizeof(*out), GFP_KERNEL);
> > +
> > +     return (struct iris_inst *)out;
>
>         return &out->inst;
>
> would be more readable. You can then drop the comment.

It looks better, and it is more robust. Thanks

I prefer to leave a small comment though:

+       struct iris_inst_hfi_gen2 *out;
+
+       /* The allocation is intentionally larger than struct iris_inst. */
+       out = kzalloc(sizeof(*out), GFP_KERNEL);
+
+       return &out->inst;


Regards

>
> >  }
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

