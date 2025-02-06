Return-Path: <linux-arm-msm+bounces-46990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFCAA29E04
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 01:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFE287A3160
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 00:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB97F14F98;
	Thu,  6 Feb 2025 00:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ei3yaTOF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF20F38385
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 00:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738802663; cv=none; b=LYnm0NFGHz8rJFsYmzAHbkkM/IpVvD0ravih8C6HaJ+mRkkD6LMEkGFxV79HsUkq41qRT36cKvslLDK1wtX31pNybUfyi7Lfh1SdLdHjte/x7oIdN4Vo2Mqhdbnxq+x6K5e2qsel184pPhuEmyaRwpfPq8djeCrT3peBOeRrHjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738802663; c=relaxed/simple;
	bh=EQQLrFGQsq4JhGA/+QDYNiDVoTwbaEef9lSVoItJWRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HSSUA9FsgThFZmiVsBxeBEUDYyqyguDdItmAQXTK4gDWorHi7dS4vkBKj/RtTIswDqlRnnqwqC3OCf8jXzsoDHOj/gZCk9S1+taAgEIFj8g/w7WXjz8ebhLIMqx+AeA7Zk5PVUmuhYjuK/4LTB37w8VLv7OGxB38h2Qf/fyZYRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ei3yaTOF; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6f98dc0d923so3012737b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 16:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738802660; x=1739407460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLFXL5qxaklKeOm2DkSpNNYxp/l7tGeiPRy2dgmV3sA=;
        b=Ei3yaTOFc52QEHloJ5SIF9H2W5KU9U1fGtVMRJBp+7t6axowdOipZ13O6okP4I2eXZ
         +SgVEmOOXdtTe2wzqyjVvJiqnRfB6f/jyNOu7lAsJqC/XSy+nwHa5XRHS9wQ/UnAf0yb
         +m3YupNyn8+4m9LY1GTjUWux/2OLynuke3Ildk14gt0PnJfWLuVByrQcnic2DjbadL7P
         ZT8UUa+hxXEtAkzHE0+SFK1TzRXWkavWMw3mAemABhH6Yhy1bk/KDVR2mNm/XQu59NWf
         RVefn4iK5KqM0VakHAOpdsT+91tVuBKKLCt75Kg7aUQ3UAZyoMdF745sF7iNY48oF00w
         9uYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738802660; x=1739407460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLFXL5qxaklKeOm2DkSpNNYxp/l7tGeiPRy2dgmV3sA=;
        b=dB3saIlFzz09opi7TBzCWpDxemohg1gmhYCfgGmjX8Fv0hQstvQs0zyYS7fkW9jkeX
         5hrwjCf3Gk2qZIum7jOwxekiYzhk+QXuPxnCGsVNZapuuA4yz0x3euWRQ4SMW+dRndDQ
         iZ/mlCbx9wTobJ+z7GIY4g7xiZKVi4ZIzCaLejA6KQ9uPVNoEVugWV25Q9HWB7rvTV6q
         PlWUTuY1S8BmWioV6S6e2xrvWgYkWLzhMigT1k5FlU+/EEwx6EboIsB88RloDz3FmLbV
         YLs1b4ILuShDqQ+havlXvSwNjWdg+UdpmZ7MVSWI+QidJrVBsTmxAn0oalNfx7NvFO2z
         NpjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH4sFOgv263Ar8eyfV24AeklccrUyT0I2r5/KJFEG7wG6Tja1C3X2D41vSRXX1BHkd3RByx59MMnqWwQN9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ZCsA3kgQXMgxTEuh+8fhikp2SKUUGhydirJS9r936rgixJtP
	sHJG7VV5M2VEtYx1Djqaw10XTDTMv2V5WJykZorBomEif7JmudfOJ2dVAk6DnjrNdfEn1PokXwq
	y9sH01JjcdPD5L1njuPtw6IDXPw9fgaqBz5W4UGSHOwSA5fcbjWE=
X-Gm-Gg: ASbGncuBGJr5oIYj+zpdD6RptooM8MO9/OUby3o9kY4IHyjx3/wF43j9KWwV2UaTupj
	BTYOz2JyZMkZ5Didt+g3m6Yt6QnfZPUZe/tRz0ZnLDE9h5yVKU7ka03ErRC0vxFiS0ygpdGc=
X-Google-Smtp-Source: AGHT+IHcArC22rfqV9GebXmnmZNJ+EWmMMIkRH5PCP2+Qr1gXB1p0Gq1CcX1OR7QdPrsne22h0eM6VZtTAH26gmOUn4=
X-Received: by 2002:a05:690c:4a09:b0:6f9:47ad:f5f1 with SMTP id
 00721157ae682-6f99a61905cmr12637167b3.17.1738802660585; Wed, 05 Feb 2025
 16:44:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205-qcom_pdm_defer-v1-1-a2e9a39ea9b9@oltmanns.dev>
In-Reply-To: <20250205-qcom_pdm_defer-v1-1-a2e9a39ea9b9@oltmanns.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Feb 2025 02:44:09 +0200
X-Gm-Features: AWEUYZlnbtqe34pgwwJQThD_POqE1_KtQaDmPFa5m-khspJzxbaTVlA3b0RflWs
Message-ID: <CAA8EJpqiv5116E_dW4CB6Az3zuOeQ+nPnOp+icYREjJSSQTX=Q@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: pd-mapper: defer probing on sdm845
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Chris Lew <quic_clew@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, Caleb Connolly <caleb.connolly@linaro.org>, 
	Joel Selvaraj <joelselvaraj.oss@gmail.com>, 
	Alexey Minnekhanov <alexeymin@postmarketos.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Feb 2025 at 23:57, Frank Oltmanns <frank@oltmanns.dev> wrote:
>
> On xiaomi-beryllium and oneplus-enchilada audio does not work reliably
> with the in-kernel pd-mapper. Deferring the probe solves these issues.
> Specifically, audio only works reliably with the in-kernel pd-mapper, if
> the probe succeeds when remoteproc3 triggers the first successful probe.
> I.e., probes from remoteproc0, 1, and 2 need to be deferred until
> remoteproc3 has been probed.

The cause for such issues also must be identified. I mean, in-kernel
pd-mapper uncovered a lot of issues that were not noticed because
usually the starting order was a bit different. But we need to
understand how to actually fix those issues instead of working them
around.

>
> Introduce a device specific quirk that lists the first auxdev for which
> the probe must be executed. Until then, defer probes from other auxdevs.
>
> Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> ---
> The in-kernel pd-mapper has been causing audio issues on sdm845
> devices (specifically, xiaomi-beryllium and oneplus-enchilada). I
> observed that Stephan=E2=80=99s approach [1] - which defers module probin=
g by
> blocklisting the module and triggering a later probe - works reliably.
>
> Inspired by this, I experimented with delaying the probe within the
> module itself by returning -EPROBE_DEFER in qcom_pdm_probe() until a
> certain time (13.9 seconds after boot, based on ktime_get()) had
> elapsed. This method also restored audio functionality.
>
> Further logging of auxdev->id in qcom_pdm_probe() led to an interesting
> discovery: audio only works reliably with the in-kernel pd-mapper when
> the first successful probe is triggered by remoteproc3. In other words,
> probes from remoteproc0, 1, and 2 must be deferred until remoteproc3 has
> been probed.
>
> To address this, I propose introducing a quirk table (which currently
> only contains sdm845) to defer probing until the correct auxiliary
> device (remoteproc3) initiates the probe.
>
> I look forward to your feedback.
>
> Thanks,
>   Frank
>
> [1]: https://lore.kernel.org/linux-arm-msm/Zwj3jDhc9fRoCCn6@linaro.org/
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 43 +++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd=
_mapper.c
> index 154ca5beb47160cc404a46a27840818fe3187420..34b26df665a888ac4872f56e9=
48e73b561ae3b6b 100644
> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> @@ -46,6 +46,11 @@ struct qcom_pdm_data {
>         struct list_head services;
>  };
>
> +struct qcom_pdm_probe_first_dev_quirk {
> +       const char *name;
> +       u32 id;
> +};
> +
>  static DEFINE_MUTEX(qcom_pdm_mutex); /* protects __qcom_pdm_data */
>  static struct qcom_pdm_data *__qcom_pdm_data;
>
> @@ -526,6 +531,11 @@ static const struct qcom_pdm_domain_data *x1e80100_d=
omains[] =3D {
>         NULL,
>  };
>
> +static const struct qcom_pdm_probe_first_dev_quirk first_dev_remoteproc3=
 =3D {
> +       .id =3D 3,
> +       .name =3D "pd-mapper"
> +};
> +
>  static const struct of_device_id qcom_pdm_domains[] __maybe_unused =3D {
>         { .compatible =3D "qcom,apq8016", .data =3D NULL, },
>         { .compatible =3D "qcom,apq8064", .data =3D NULL, },
> @@ -566,6 +576,10 @@ static const struct of_device_id qcom_pdm_domains[] =
__maybe_unused =3D {
>         {},
>  };
>
> +static const struct of_device_id qcom_pdm_defer[] __maybe_unused =3D {
> +       { .compatible =3D "qcom,sdm845", .data =3D &first_dev_remoteproc3=
, },
> +       {},
> +};
>  static void qcom_pdm_stop(struct qcom_pdm_data *data)
>  {
>         qcom_pdm_free_domains(data);
> @@ -637,6 +651,25 @@ static struct qcom_pdm_data *qcom_pdm_start(void)
>         return ERR_PTR(ret);
>  }
>
> +static bool qcom_pdm_ready(struct auxiliary_device *auxdev)
> +{
> +       const struct of_device_id *match;
> +       struct device_node *root;
> +       struct qcom_pdm_probe_first_dev_quirk *first_dev;
> +
> +       root =3D of_find_node_by_path("/");
> +       if (!root)
> +               return true;
> +
> +       match =3D of_match_node(qcom_pdm_defer, root);
> +       of_node_put(root);
> +       if (!match)
> +               return true;
> +
> +       first_dev =3D (struct qcom_pdm_probe_first_dev_quirk *) match->da=
ta;
> +       return (auxdev->id =3D=3D first_dev->id) && !strcmp(auxdev->name,=
 first_dev->name);
> +}
> +
>  static int qcom_pdm_probe(struct auxiliary_device *auxdev,
>                           const struct auxiliary_device_id *id)
>
> @@ -647,6 +680,15 @@ static int qcom_pdm_probe(struct auxiliary_device *a=
uxdev,
>         mutex_lock(&qcom_pdm_mutex);
>
>         if (!__qcom_pdm_data) {
> +               if (!qcom_pdm_ready(auxdev)) {
> +                       pr_debug("%s: Deferring probe for device %s (id: =
%u)\n",
> +                               __func__, auxdev->name, auxdev->id);
> +                       ret =3D -EPROBE_DEFER;
> +                       goto probe_stop;
> +               }
> +               pr_debug("%s: Probing for device %s (id: %u), starting pd=
m\n",
> +                       __func__, auxdev->name, auxdev->id);
> +
>                 data =3D qcom_pdm_start();
>
>                 if (IS_ERR(data))
> @@ -659,6 +701,7 @@ static int qcom_pdm_probe(struct auxiliary_device *au=
xdev,
>
>         auxiliary_set_drvdata(auxdev, __qcom_pdm_data);
>
> +probe_stop:
>         mutex_unlock(&qcom_pdm_mutex);
>
>         return ret;
>
> ---
> base-commit: 7f048b202333b967782a98aa21bb3354dc379bbf
> change-id: 20250205-qcom_pdm_defer-3dc1271d74d9
>
> Best regards,
> --
> Frank Oltmanns <frank@oltmanns.dev>
>


--=20
With best wishes
Dmitry

