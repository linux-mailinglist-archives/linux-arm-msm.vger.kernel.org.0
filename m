Return-Path: <linux-arm-msm+bounces-47048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DE9A2B120
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 19:33:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED7E21887C26
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 18:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0DC1B3940;
	Thu,  6 Feb 2025 18:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="h5wM9LOj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B6E1B0F30
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 18:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866358; cv=none; b=IWL8weGgXojLFAmCPlvPlYrm2OouxTZMuDrfnbr+GbO407HMgZqwNnp6+k0cSEagodgw3kAPYXrKw+E6tkIDy3osHCZk/nqR/Q4M7d1x0rOj7w4tlslVfPxEibVPaUVaDrYJaCazn1OFEbHaRjDuzcTbRPSYHTuqE/iUmGu0HSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866358; c=relaxed/simple;
	bh=uTbVRr9HmRcaE9lgOEvUfei6saIoiU+FEhzHFnz0GRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fuTRlzoqqvSdpCJL3OUBGxHRzqTOFVBdRGCT4gsteaKvlOAbzgxEEASbRVPEk/0lJ7JBzBMpB+H4VswJroQmiE1jxyUwmQWMskL23HWlcU9i9n6EazpBjEw4gxAEMxTRNQt68haOqAbylIkM9UPSLXE3uK4NSSOIn6KRYcc1ZmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=h5wM9LOj; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dcedee4f7bso1978991a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 10:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1738866353; x=1739471153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umIOlUQI9I4kFZkwbDmguQwEHik4J61VrGH4+qh+Up0=;
        b=h5wM9LOjeXKyNgJL60MPXa9c99PxvrlLYjqollUGlJpzwCX4PrfORCL3BWmUnVktc4
         cazdVVdd4tGC4o/ICfnceYBsE9JM4BKkuKE5OgeLvrn2o19N70bZQOjb0kddGd3TML5D
         1aj89ytJIc0GV5wv7zHYMx8VsUoErGsUx2bL0Ad+KFbtf9EdxfkJp7Yo5ILg/Jbu0ww+
         FE/d9xfyQ2R53dZ44LdHDZSl9imVUuYGOFR3ZRitBYenRPDy8BUoSJewTCJPqqZWQDoG
         aP52jNdF+8y1BqbeUnBhXgkJdu6MKVAOu2jIO6sON9mPE9LvIo80Np9ewxogUl9ajJvx
         y1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866353; x=1739471153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umIOlUQI9I4kFZkwbDmguQwEHik4J61VrGH4+qh+Up0=;
        b=bije7AQQUa1vHzbOr3yOX4KYh9wqk+mT3yKKYFYYSbCY5femwGNz14nfstY1AsY367
         TpdqdQosFzMCurZEILOgAmzXj+GCH2BlzZSAtVrGaqn2ETBOuwGzptYWfeMTfZoEhIVP
         k292Ic8/doEKPaoBM5vW1oGmpl//2i7IIit9suMUHKnQew25yVTTpYiRB0e06h/gll9l
         v3n/ELF0kojW41bXKHNmMGUuz1jRroL2XR7bEFND8ALeBfIWFaLgydaC/kTCf1tjExl8
         wnWjMWoV5IGPLkX6LqVr0Y7dGn2RPv7or+CHdLqDtBv5QvQyOvTiouTAPu3YmgNgcsi5
         tRsw==
X-Forwarded-Encrypted: i=1; AJvYcCV5+PPv6HtosFdS6i+XjKkxWi2u7Pjd2cuiH945GWaY/Gnot55C4qCo0q93hmEj1p4uvvB/iNSk4GkqlYM2@vger.kernel.org
X-Gm-Message-State: AOJu0YxGnQkZRJ/O4l9MOjqSGLLWGeqIDe0rgV2x3pzqHACZX7EPUv1u
	JYXys1h8pSaBqNbv2FI2X7kRVgMlfspxUp41KU/8lR9iwp3NQ5ztI9j1z2IVsDO/9ZmJlSjEz+J
	908w0MXYjpx0zpy+1FlA4mdzAY1jfV2pr70JZjg==
X-Gm-Gg: ASbGncsNBjgR5JlVAJUtCTXaxFBUTJM4plK/7Yhv4BRv1VWJvazdDNvH+LnkfWYHJl8
	7enBNg9rhOdCu3GfvKpbkVv81yA8kDr6dvUiRsKEwD2J+Ry91whJPkV5JYncVk0/jk2PaycoNkA
	==
X-Google-Smtp-Source: AGHT+IGO8fwSChqfHd13AIoiOr7pGRWpla+UsKPwkQJFjq7D1HYM29qUkX0UjZ3owsyPwMnf+NOx2F+H24+FdRjmMMo=
X-Received: by 2002:a05:6402:3907:b0:5d0:b925:a8a with SMTP id
 4fb4d7f45d1cf-5de45019b56mr522264a12.16.1738866353189; Thu, 06 Feb 2025
 10:25:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205-qcom_pdm_defer-v1-1-a2e9a39ea9b9@oltmanns.dev>
 <2vfwtuiorefq64ood4k7y7ukt34ubdomyezfebkeu2wu5omvkb@c5h2sbqs47ya>
 <87y0yj1up1.fsf@oltmanns.dev> <87msez1sim.fsf@oltmanns.dev>
In-Reply-To: <87msez1sim.fsf@oltmanns.dev>
From: Steev Klimaszewski <steev@kali.org>
Date: Thu, 6 Feb 2025 12:25:41 -0600
X-Gm-Features: AWEUYZlKE6RVwjh_7DuupfwDsJO0_9pBO3UZQQci9sRQ8RYIreZU9JU_j3WffGE
Message-ID: <CAKXuJqhuNh1mV-40LpO3bffoGSOiFLkRB+uZ8+5+0eThctm+-g@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: pd-mapper: defer probing on sdm845
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Chris Lew <quic_clew@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Joel Selvaraj <joelselvaraj.oss@gmail.com>, 
	Alexey Minnekhanov <alexeymin@postmarketos.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

On Thu, Feb 6, 2025 at 12:45=E2=80=AFAM Frank Oltmanns <frank@oltmanns.dev>=
 wrote:
>
> Hi again,
>
> On 2025-02-06 at 06:57:46 +0100, Frank Oltmanns <frank@oltmanns.dev> wrot=
e:
> > On 2025-02-05 at 20:54:53 -0600, Bjorn Andersson <andersson@kernel.org>=
 wrote:
> >> On Wed, Feb 05, 2025 at 10:57:11PM +0100, Frank Oltmanns wrote:
> >>> On xiaomi-beryllium and oneplus-enchilada audio does not work reliabl=
y
> >>> with the in-kernel pd-mapper. Deferring the probe solves these issues=
.
> >>> Specifically, audio only works reliably with the in-kernel pd-mapper,=
 if
> >>> the probe succeeds when remoteproc3 triggers the first successful pro=
be.
> >>> I.e., probes from remoteproc0, 1, and 2 need to be deferred until
> >>> remoteproc3 has been probed.
> >>>
> >>> Introduce a device specific quirk that lists the first auxdev for whi=
ch
> >>> the probe must be executed. Until then, defer probes from other auxde=
vs.
> >>>
> >>> Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
> >>> Cc: stable@vger.kernel.org
> >>> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> >>> ---
> >>> The in-kernel pd-mapper has been causing audio issues on sdm845
> >>> devices (specifically, xiaomi-beryllium and oneplus-enchilada). I
> >>> observed that Stephan=E2=80=99s approach [1] - which defers module pr=
obing by
> >>> blocklisting the module and triggering a later probe - works reliably=
.
> >>>
> >>> Inspired by this, I experimented with delaying the probe within the
> >>> module itself by returning -EPROBE_DEFER in qcom_pdm_probe() until a
> >>> certain time (13.9 seconds after boot, based on ktime_get()) had
> >>> elapsed. This method also restored audio functionality.
> >>>
> >>> Further logging of auxdev->id in qcom_pdm_probe() led to an interesti=
ng
> >>> discovery: audio only works reliably with the in-kernel pd-mapper whe=
n
> >>> the first successful probe is triggered by remoteproc3. In other word=
s,
> >>> probes from remoteproc0, 1, and 2 must be deferred until remoteproc3 =
has
> >>> been probed.
> >>>
> >>
> >> The remoteproc numbering is assigned at the time of registering each
> >> remoteproc driver, and does not necessarily relate to the order in whi=
ch
> >> they are launched. That said, it sounds like what you're saying is tha=
t
> >> is that audio only works if we launch the pd-mapper after the
> >> remoteprocs has started?
> >
> > Almost, but not quite. You are right, that remoteproc3 in my setup is
> > always the last one that probes the pd-mapper.
> >
> > However, when experimenting with different timings I saw that the
> > pd-mapper really do has to respond to the probe from remoteproc3 (I'm
> > not sure I'm using the right terminology here, but I hope my intent
> > comes across). If the pd-mapper responds to remoteproc3's probe with
> > -EPROBE_DEFER there will again be subsequent probes from the other
> > remoteprocs. If we act on those probes, there is a chance that audio
> > (mic in my case) does not work. So, my conclusion was that remoteproc3'=
s
> > probe has to be answered first before responding to the other probes.
> >
> > Further note that in my experiments remoteproc1 was always the first to
> > do the probing, followed by either remoteproc0 or remoteproc2.
> > remoteproc3 was always the last.
> >
> >> Can you please confirm which remoteproc is which in your numbering? (I=
n
> >> particular, which remoteproc instance is the audio DSP?)
> >
> > remoteproc0: adsp
> > remoteproc1: cdsp
> > remoteproc2: slpi
> > remoteproc3: 4080000.remoteproc
>
> I'm sorry but there's one additional thing that I really should have
> mentioned earlier: My issue is specifically with *call* audio.
>
> Call audio is only available using out-of-tree patches. The ones I'm
> currently using are here:
> https://gitlab.com/sdm845-mainline/linux/-/commits/sdm845-6.13-rc2-r2?ref=
_type=3Dtags
>
> Best regards,
>   Frank
>
> >
> > (I took them from the kernel messages "remoteproc remoteproc<X>: <xyz>
> > is available".)
> >
> >>> To address this, I propose introducing a quirk table (which currently
> >>> only contains sdm845) to defer probing until the correct auxiliary
> >>> device (remoteproc3) initiates the probe.
> >>>
> >>> I look forward to your feedback.
> >>>
> >>
> >> I don't think the proposed workaround is our path forward, but I very
> >> much appreciate your initiative and the insights it provides!
> >
> > Thank you! I was hoping that somebody with more experience in the QCOM
> > universe can draw further conclusions from this.
> >
> >> Seems to
> >> me that we have a race-condition in the pdr helper.
> >
> > If you need further experimenting or can give me rough guidance on wher=
e
> > to look next, I'll be glad to help.
> >
> > Thanks again,
> >   Frank
> >
> >>
> >> Regards,
> >> Bjorn
> >>
> >>> Thanks,
> >>>   Frank
> >>>
> >>> [1]: https://lore.kernel.org/linux-arm-msm/Zwj3jDhc9fRoCCn6@linaro.or=
g/
> >>> ---
> >>>  drivers/soc/qcom/qcom_pd_mapper.c | 43 +++++++++++++++++++++++++++++=
++++++++++
> >>>  1 file changed, 43 insertions(+)
> >>>
> >>> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qco=
m_pd_mapper.c
> >>> index 154ca5beb47160cc404a46a27840818fe3187420..34b26df665a888ac4872f=
56e948e73b561ae3b6b 100644
> >>> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> >>> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> >>> @@ -46,6 +46,11 @@ struct qcom_pdm_data {
> >>>     struct list_head services;
> >>>  };
> >>>
> >>> +struct qcom_pdm_probe_first_dev_quirk {
> >>> +   const char *name;
> >>> +   u32 id;
> >>> +};
> >>> +
> >>>  static DEFINE_MUTEX(qcom_pdm_mutex); /* protects __qcom_pdm_data */
> >>>  static struct qcom_pdm_data *__qcom_pdm_data;
> >>>
> >>> @@ -526,6 +531,11 @@ static const struct qcom_pdm_domain_data *x1e801=
00_domains[] =3D {
> >>>     NULL,
> >>>  };
> >>>
> >>> +static const struct qcom_pdm_probe_first_dev_quirk first_dev_remotep=
roc3 =3D {
> >>> +   .id =3D 3,
> >>> +   .name =3D "pd-mapper"
> >>> +};
> >>> +
> >>>  static const struct of_device_id qcom_pdm_domains[] __maybe_unused =
=3D {
> >>>     { .compatible =3D "qcom,apq8016", .data =3D NULL, },
> >>>     { .compatible =3D "qcom,apq8064", .data =3D NULL, },
> >>> @@ -566,6 +576,10 @@ static const struct of_device_id qcom_pdm_domain=
s[] __maybe_unused =3D {
> >>>     {},
> >>>  };
> >>>
> >>> +static const struct of_device_id qcom_pdm_defer[] __maybe_unused =3D=
 {
> >>> +   { .compatible =3D "qcom,sdm845", .data =3D &first_dev_remoteproc3=
, },
> >>> +   {},
> >>> +};
> >>>  static void qcom_pdm_stop(struct qcom_pdm_data *data)
> >>>  {
> >>>     qcom_pdm_free_domains(data);
> >>> @@ -637,6 +651,25 @@ static struct qcom_pdm_data *qcom_pdm_start(void=
)
> >>>     return ERR_PTR(ret);
> >>>  }
> >>>
> >>> +static bool qcom_pdm_ready(struct auxiliary_device *auxdev)
> >>> +{
> >>> +   const struct of_device_id *match;
> >>> +   struct device_node *root;
> >>> +   struct qcom_pdm_probe_first_dev_quirk *first_dev;
> >>> +
> >>> +   root =3D of_find_node_by_path("/");
> >>> +   if (!root)
> >>> +           return true;
> >>> +
> >>> +   match =3D of_match_node(qcom_pdm_defer, root);
> >>> +   of_node_put(root);
> >>> +   if (!match)
> >>> +           return true;
> >>> +
> >>> +   first_dev =3D (struct qcom_pdm_probe_first_dev_quirk *) match->da=
ta;
> >>> +   return (auxdev->id =3D=3D first_dev->id) && !strcmp(auxdev->name,=
 first_dev->name);
> >>> +}
> >>> +
> >>>  static int qcom_pdm_probe(struct auxiliary_device *auxdev,
> >>>                       const struct auxiliary_device_id *id)
> >>>
> >>> @@ -647,6 +680,15 @@ static int qcom_pdm_probe(struct auxiliary_devic=
e *auxdev,
> >>>     mutex_lock(&qcom_pdm_mutex);
> >>>
> >>>     if (!__qcom_pdm_data) {
> >>> +           if (!qcom_pdm_ready(auxdev)) {
> >>> +                   pr_debug("%s: Deferring probe for device %s (id: =
%u)\n",
> >>> +                           __func__, auxdev->name, auxdev->id);
> >>> +                   ret =3D -EPROBE_DEFER;
> >>> +                   goto probe_stop;
> >>> +           }
> >>> +           pr_debug("%s: Probing for device %s (id: %u), starting pd=
m\n",
> >>> +                   __func__, auxdev->name, auxdev->id);
> >>> +
> >>>             data =3D qcom_pdm_start();
> >>>
> >>>             if (IS_ERR(data))
> >>> @@ -659,6 +701,7 @@ static int qcom_pdm_probe(struct auxiliary_device=
 *auxdev,
> >>>
> >>>     auxiliary_set_drvdata(auxdev, __qcom_pdm_data);
> >>>
> >>> +probe_stop:
> >>>     mutex_unlock(&qcom_pdm_mutex);
> >>>
> >>>     return ret;
> >>>
> >>> ---
> >>> base-commit: 7f048b202333b967782a98aa21bb3354dc379bbf
> >>> change-id: 20250205-qcom_pdm_defer-3dc1271d74d9
> >>>
> >>> Best regards,
> >>> --
> >>> Frank Oltmanns <frank@oltmanns.dev>
> >>>
>

I know that Bjorn already said this change is a no, but I wanted to
mention that I have a Lenovo Yoga C630 (WOS) device here that is also
an sdm845, and with this patch applied, it has the opposite effect and
breaks audio on it.

-- steev

