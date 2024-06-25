Return-Path: <linux-arm-msm+bounces-24127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A699916E1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 18:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D94CF1F27F9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 16:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B8017333E;
	Tue, 25 Jun 2024 16:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kr5ItlXs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE177171E41
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 16:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719332843; cv=none; b=F4tHQZkOnfHzW9Xp32hQXZL05yddheRXrv0V67vKyVnH7a/NO1MShOvlWtLFQMRwS367Etrj+cuPpym3I4/5jmQqndqE3h4EpCgjIRKvwt2ObF1P/45qmR6RvQdcDX537zN3IlYZnvMGXc4fwyxEJzCAHtrkZkxUmSTUy8ak7l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719332843; c=relaxed/simple;
	bh=FBgM8X7N6EV6X8VIVrL7KoXestIzzEPz81jUwgaNSTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obs54zi8bLB/KojP2XzRGwxv/mUXqzNcj67Np+rCdJ9TNlGIfqLznDUiaTerE9qo3/be9FtqYzU+KoXGmH9sp6ChwMSuIzF2iTOlAm+0bZJ0W1m/zvwANcJwn5/W1WwfoHfIhZpCXhRfIga81lt4nTR4Cn+1wcuNRGv/7XPwBiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kr5ItlXs; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-79c11e92afaso473285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 09:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719332839; x=1719937639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kd5y9hhIUx6r9hI0VhGrF9yxcbBN+8LVyQQ2ESHR5Ew=;
        b=kr5ItlXssd5XHeMY3sR1Gp0Eay0spKkS7xHUCx9FGrGtfco4rexAN4zQYVzqDowoBG
         iUWcsXjztqDDRQ2qFRDMdOwQKUuyVoaxWPp0O8yq1aZeT3MW9kpvrt2xeZYjl8IiFhPd
         ROOyNnP990NW/ELwJLehH+2lpVlpdSBR970Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719332839; x=1719937639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kd5y9hhIUx6r9hI0VhGrF9yxcbBN+8LVyQQ2ESHR5Ew=;
        b=HVW119BbW+/3TPMuS+eAVwZrI0KjMbKjEHzG4IZyXZPjkzFCVPC/qKuGE2mttl9VKe
         W8ODD5a2BzSFkrbUBUVoVOSNDjee1WW0oWwehNWSbHHl10PczkowpNzEtmuiiwoiYgDn
         YzHdilAOjg6pw3CXf3qtRWZxq33T8DcmW5cS+Zp6HCkF1Ti+f88b02lBPFhfFjXwVnLX
         +nRp00K/xHARaJaP6n24W/zDXsoPVnqOg2eKxDtGNBsCzJDZjh62vLgl3A84MNPPgWbp
         fqiIv1gmfSYKEHgqMndVxUlatAmj/TpVwFEd+vwXrYLQR5Ug3me3x0HnwwsIZib9Lo3v
         cRlw==
X-Forwarded-Encrypted: i=1; AJvYcCVONgXUJxn4sDR/IAoExkOFZnUh52yrQ0T1OgChN4cg+2y3FFRcBYKxh46NHddc4HPMf73gs+I3mcsTjNDNW4UcOJDJ/Mmc+1xcUrzwMw==
X-Gm-Message-State: AOJu0YydsCQ0z2nPAOQAQnfHbtoMnvnLk2m+XB+octvgkf84ZyzJPdBJ
	jdnoq8WI9iJUjqGA8kZOASC2dzn2ZwW8IfO2wqGnnWO8VUUidY/xu57nV6ToLlW4jr/fNxmf3x0
	=
X-Google-Smtp-Source: AGHT+IHCG7ESlthrbo80gTP5PWzBlREcPHqzVY+J7I41FV1CzAFhFInrOjSyjXWxwT0mCOuRTGlHIA==
X-Received: by 2002:a05:6214:12c6:b0:6b5:148:736a with SMTP id 6a1803df08f44-6b540cee64emr78190756d6.57.1719332839211;
        Tue, 25 Jun 2024 09:27:19 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b51ef678ebsm46304096d6.132.2024.06.25.09.27.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 09:27:18 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-445022f78e1so109261cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 09:27:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOVR+UFvleOrU0EkTwzR/t5MMJlyXEX+vsovLtHTL3gCFtHm0ChxTeyaLtRN1v3pUQ/MwyYrNcrvHj+eg0bKqo6cCB6Uz+G0vkJBDWuA==
X-Received: by 2002:a05:622a:2a1a:b0:444:fe9d:7bc9 with SMTP id
 d75a77b69052e-444fe9d7f9amr1978871cf.8.1719332837590; Tue, 25 Jun 2024
 09:27:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624133135.7445-1-johan+linaro@kernel.org>
 <20240624133135.7445-2-johan+linaro@kernel.org> <CAD=FV=VZXnnbwTNc6dSqZvyCUc0=Wjg9mvBYsA1FJK3xR6bDEg@mail.gmail.com>
 <CAD=FV=UwyzA614tDoq7BntW1DWmic=DOszr+iRJVafVEYrXhpw@mail.gmail.com> <ZnraAlR9QeYhd628@hovoldconsulting.com>
In-Reply-To: <ZnraAlR9QeYhd628@hovoldconsulting.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Jun 2024 09:27:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U+D34mkDoFkmEXUm9fCAhC_RKbHnKXHsDZFQPxDaPmtg@mail.gmail.com>
Message-ID: <CAD=FV=U+D34mkDoFkmEXUm9fCAhC_RKbHnKXHsDZFQPxDaPmtg@mail.gmail.com>
Subject: Re: [PATCH 1/3] serial: qcom-geni: fix hard lockup on buffer flush
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 25, 2024 at 7:53=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Mon, Jun 24, 2024 at 01:45:17PM -0700, Doug Anderson wrote:
>
> > Also: if we're looking at quick/easy to land and just fix the hard
> > lockup, I'd vote for this (I can send a real patch, though I'm about
> > to go on vacation):
> >
> > --
> >
> > @@ -904,8 +904,8 @@ static void qcom_geni_serial_handle_tx_fifo(struct
> > uart_port *uport,
> >                 goto out_write_wakeup;
> >
> >         if (!port->tx_remaining) {
> > -               qcom_geni_serial_setup_tx(uport, pending);
> > -               port->tx_remaining =3D pending;
> > +               port->tx_remaining =3D min(avail, pending);
> > +               qcom_geni_serial_setup_tx(uport, port->tx_remaining);
> >
> >                 irq_en =3D readl(uport->membase + SE_GENI_M_IRQ_EN);
> >                 if (!(irq_en & M_TX_FIFO_WATERMARK_EN))
> >
> > --
> >
> > That will fix the hard lockup, is short and sweet, and also doesn't
> > end up outputting NUL bytes.
>
> Yeah, this might be a good stop gap even if performance suffers.

I've officially posted this as:

https://lore.kernel.org/r/20240625092440.1.Icf914852be911b95aefa9d798b6f1cd=
1a180f985@changeid

I realized that I didn't need to re-calculate "chunk" so the patch is
very slightly different than I posted above but should be effectively
the same.

-Doug

