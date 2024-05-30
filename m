Return-Path: <linux-arm-msm+bounces-21104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A368D4C2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 15:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7840B21F26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 13:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C6218306D;
	Thu, 30 May 2024 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BPFm7jZ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537CF17F4E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717074010; cv=none; b=Jkz/Ag4qDe+XnigQlSeOEv1qg+RFoj0IB7xST0QVKHQ7e/e3a3Oaw7YZxa0BQnNhIZIDQt88KIn/FPRgcY+royQI5AqqUQCy0DUs7ho5Ck8xAGE4kvJSJ5H+L697yDXAdP7AeJwHn3fBKqcCX8B3JUsOCiI5ZtTDC1X9nTEzflU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717074010; c=relaxed/simple;
	bh=pj0nrIN3Qs7jpx+J/3Wt1XvGRkbyRR2Eq5pw8utiL9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W5d8rPLgyM8Lwbn3fIFqTK8p7nvvF1lMvOiMm5TK4gfCfH5YjyXLe1IAjwxKij5O8ZsxmJR6KgYrtSP7VAtGUnjGkJrrWUfqKhcFyRHTPzNSGlzPYlkl17sGAk+2BwfMarap7v3dsHxnlrgQ+xoE868di2Fzl17fskqBL0aPFWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BPFm7jZ8; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6ad935156fdso4049046d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717074008; x=1717678808; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oTphgebvOjeWdN1xBiIRxM6zg0yoJ4DRfXlzkZveD5Q=;
        b=BPFm7jZ8iwTN6GKQVwcHISC/uJ2N0SQeG+hGjiz9dyOBYu7e5nTbhBfgMSAWAiBrnW
         Ltktjl1RMpOfaT2+NORMxbqtzvXrZCzllN2Zo8ubgJalE7YOh8Vf4y3OSZiE+issBB+y
         g1BHRyB/JDCWXB0scTZfsxZFap45fdNIztMjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717074008; x=1717678808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTphgebvOjeWdN1xBiIRxM6zg0yoJ4DRfXlzkZveD5Q=;
        b=JoWVabzCPJdMYQ0hc9okGYEY3avIrOEXmGMJqqZMuLMXluaS+6aDhrpPixXaRmB+Yb
         aZrJCgGCAd16rh8AlBhjsYSgqFww2XEyPPA9+UaG4XwMJJ2ar7OtIRWlfEzwK/RY+BNy
         bl80H3TmUNgw/ZJIftuG3GvmZzMS+Z6EkFMjAEbliGOCShco/9RVuotKSunQvYp9pZSO
         t2BHKmTo+zTAoMuojeXzTSjHudKgCDxTmYAFqA4yEp8mwYXLghY78SB2ODQJx7o75x8n
         3O1W8lNc++A1kkCJ4bov/UX0M4/UlRs8CyiDQNgxmhE5xh1DjcjcUt3lNvmV7FFiZfAQ
         Et7w==
X-Forwarded-Encrypted: i=1; AJvYcCV2l48uzL0Z2SWuhowja+5M7zqowJcLDVtOur/htTXZyn8hAxwNFKtKPZCyQLXwMIfBAVNGq6BkXzGr2CrtlwAfLpzofhyle73dfbXFLg==
X-Gm-Message-State: AOJu0YzGeMRcTSaC6PM8xECG4VIgKd5zSkfiT7B+7A+o9W/1MjNaK1LV
	H80JCrF2iDY0hDIPF/5yFcCu2VS1Iys3y1cNopB278CgcEaBTd6pSKnqXlV5Ap7o31FmV3zhyLX
	t+Q==
X-Google-Smtp-Source: AGHT+IGz3hrRfWreBYgMmSCwAjF+opkNj4sg1mwyaYSV6ZVUDqc9QW6sGh45ekGbMSfEja9Ig2GpoQ==
X-Received: by 2002:a05:6214:398b:b0:6a0:c962:a2be with SMTP id 6a1803df08f44-6ae0cb5a65dmr21626346d6.39.1717074007601;
        Thu, 30 May 2024 06:00:07 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43fb17fa357sm65703821cf.45.2024.05.30.06.00.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 06:00:06 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6ae0bf069f3so4095446d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 06:00:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULeDTOfXhDwlfI/m8YcUUlcWSf/PWeTIW5EwBRMbO3EMcHH53eRQDd2mXxLdqXa1YkCvXJ6LZ1bFmJjYkStRnTepy+JozqagRTc01VaQ==
X-Received: by 2002:a05:6214:3b82:b0:6ae:5b:c181 with SMTP id
 6a1803df08f44-6ae0cce1c83mr25263506d6.63.1717074003733; Thu, 30 May 2024
 06:00:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
 <20240527-cocci-flexarray-v3-3-cda09c535816@chromium.org> <6823bc58-9461-4a54-b5b3-7ea5c46fc68b@xs4all.nl>
In-Reply-To: <6823bc58-9461-4a54-b5b3-7ea5c46fc68b@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 30 May 2024 14:59:47 +0200
X-Gmail-Original-Message-ID: <CANiDSCt0PXTP63=dkNpUvH6mYSJ2_mr5xiOd9=RpLqVoD4YY_g@mail.gmail.com>
Message-ID: <CANiDSCt0PXTP63=dkNpUvH6mYSJ2_mr5xiOd9=RpLqVoD4YY_g@mail.gmail.com>
Subject: Re: [PATCH v3 03/18] media: dvb-frontend/mxl5xx: Refactor struct MBIN_FILE_T
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	Andy Walls <awalls@md.metrocast.net>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Thu, 30 May 2024 at 14:33, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 27/05/2024 23:08, Ricardo Ribalda wrote:
> > Replace a single element array, with a single element field.
> >
> > The following cocci warning is fixed:
> > drivers/media/dvb-frontends/mxl5xx_defs.h:171:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/dvb-frontends/mxl5xx.c      | 2 +-
> >  drivers/media/dvb-frontends/mxl5xx_defs.h | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/dvb-frontends/mxl5xx.c b/drivers/media/dvb-frontends/mxl5xx.c
> > index 91e9c378397c..a15c0438b07a 100644
> > --- a/drivers/media/dvb-frontends/mxl5xx.c
> > +++ b/drivers/media/dvb-frontends/mxl5xx.c
> > @@ -893,7 +893,7 @@ static int do_firmware_download(struct mxl *state, u8 *mbin_buffer_ptr,
> >       status = write_register(state, FW_DL_SIGN_ADDR, 0);
> >       if (status)
> >               return status;
> > -     segment_ptr = (struct MBIN_SEGMENT_T *) (&mbin_ptr->data[0]);
> > +     segment_ptr = (struct MBIN_SEGMENT_T *)(&mbin_ptr->data);
> >       for (index = 0; index < mbin_ptr->header.num_segments; index++) {
> >               if (segment_ptr->header.id != MBIN_SEGMENT_HEADER_ID) {
> >                       dev_err(state->i2cdev, "%s: Invalid segment header ID (%c)\n",
> > diff --git a/drivers/media/dvb-frontends/mxl5xx_defs.h b/drivers/media/dvb-frontends/mxl5xx_defs.h
> > index 097271f73740..3c5d75ed8fea 100644
> > --- a/drivers/media/dvb-frontends/mxl5xx_defs.h
> > +++ b/drivers/media/dvb-frontends/mxl5xx_defs.h
> > @@ -168,7 +168,7 @@ struct MBIN_FILE_HEADER_T {
> >
> >  struct MBIN_FILE_T {
> >       struct MBIN_FILE_HEADER_T header;
> > -     u8 data[1];
> > +     u8 data;
>
> From what I can tell, shouldn't this be 'data[]'? It really appears to be a flexible array.

The field is mainly used to ease the data parsing. There was only
data[0] used, so I decided to make it into a single element array to
avoid changing the size of the structure....

But you are correct, it looks more clear as a flex array and there is
no allocation or sizeof() so I think it is safe to change its size.

Will squash with the MBIN_SEGMENT_T patch also

Thanks!


>
> Regards,
>
>         Hans
>
> >  };
> >
> >  struct MBIN_SEGMENT_HEADER_T {
> >
>


-- 
Ricardo Ribalda

