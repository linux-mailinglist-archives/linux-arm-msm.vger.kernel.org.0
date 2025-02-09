Return-Path: <linux-arm-msm+bounces-47299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C35A2DD41
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 13:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFD9F1885A2A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 12:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8503A1CAA92;
	Sun,  9 Feb 2025 12:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="LMuBher9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E72243392;
	Sun,  9 Feb 2025 12:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739102848; cv=none; b=WayTvfiDz2sSlz1Byiphbils+U+nFHL/T0lIn8q/rmGWMB1ACuJH/K3bvsN0xJa1BqYS87t6XNpwZmguP9ANwrulywq5LoM6/ZIBkMd1P+puaeFiwwUlCZrtZhWLtsBMnS4uTa3mu7ClzdrK0UKnKKlkfpKxowir3U7w3AaKE0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739102848; c=relaxed/simple;
	bh=Gtms4CKjch0Kcw/gzD2wgwnJimc0N1gfVhZ3OMM6cyY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s0E9Z9DGX6XR9PjyJBPjSSv9pWUTf5sTVExOq2Ajtm63eG3TTwf50geU7WzcL9u+W5CwRIawjs4GGFtVTadrP2zURCxXey2J3fZ/V+d3UQigBbkJIKENlOearNp2R4KMGjbp5F1PEmiHjHG2L434PSXSOkgJfMqqsf6vWLTNpoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev; spf=pass smtp.mailfrom=oltmanns.dev; dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b=LMuBher9; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oltmanns.dev
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YrRKP5T2hz9ssp;
	Sun,  9 Feb 2025 13:07:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1739102841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gatSQ4BecWMvAfmUcPJQ4KXcsX2CI5vqJvqtTx8O2dU=;
	b=LMuBher9/xxErGnKounptiibwpZ7ZLKhW0NCjFevZe2PVJXHxyIdp/+VpnKFnp/ZxoEhSj
	ecd3emRjp43LBqTg81ZTM4d65CtC7SYF2ENwrWISoq0HV9dm7YMQQ2t9S1OuW3Lm5uF4R5
	5nhq+qc6O9J0y7YdepnivZWdIQyT0EZUMpDS2sL0Zc+6qjF+oZxnZzkey2RUzU+rUGsKgA
	FR5Cytvdaf/BH7spKJ1gF/2KT3cSQ9H6xb4x6y9NxsbyyAbYezZxIWjOh8EiXxtJeKFUgi
	FX4bboa1AfM0aUqealrp4vrQKkPsiRGEtwufhUZMoeULI45zXUXVeJFDdZfRrg==
From: Frank Oltmanns <frank@oltmanns.dev>
To: Steev Klimaszewski <steev@kali.org>
Cc: Bjorn Andersson <andersson@kernel.org>,  Konrad Dybcio
 <konradybcio@kernel.org>,  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
  Chris Lew <quic_clew@quicinc.com>,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Stephan Gerhold
 <stephan.gerhold@linaro.org>,  Johan Hovold <johan+linaro@kernel.org>,
  Caleb Connolly <caleb.connolly@linaro.org>,  Joel Selvaraj
 <joelselvaraj.oss@gmail.com>,  Alexey Minnekhanov
 <alexeymin@postmarketos.org>,  stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: defer probing on sdm845
In-Reply-To: <CAKXuJqhuNh1mV-40LpO3bffoGSOiFLkRB+uZ8+5+0eThctm+-g@mail.gmail.com>
	(Steev Klimaszewski's message of "Thu, 6 Feb 2025 12:25:41 -0600")
References: <20250205-qcom_pdm_defer-v1-1-a2e9a39ea9b9@oltmanns.dev>
	<2vfwtuiorefq64ood4k7y7ukt34ubdomyezfebkeu2wu5omvkb@c5h2sbqs47ya>
	<87y0yj1up1.fsf@oltmanns.dev> <87msez1sim.fsf@oltmanns.dev>
	<CAKXuJqhuNh1mV-40LpO3bffoGSOiFLkRB+uZ8+5+0eThctm+-g@mail.gmail.com>
Date: Sun, 09 Feb 2025 13:07:19 +0100
Message-ID: <87msev9v9k.fsf@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-02-06 at 12:25:41 -0600, Steev Klimaszewski <steev@kali.org> wrote:
Hi Steev,

> Hi Frank,
>
> On Thu, Feb 6, 2025 at 12:45=E2=80=AFAM Frank Oltmanns <frank@oltmanns.de=
v> wrote:
>>
>> Hi again,
>>
>> On 2025-02-06 at 06:57:46 +0100, Frank Oltmanns <frank@oltmanns.dev> wro=
te:
>> > On 2025-02-05 at 20:54:53 -0600, Bjorn Andersson <andersson@kernel.org=
> wrote:
>> >> On Wed, Feb 05, 2025 at 10:57:11PM +0100, Frank Oltmanns wrote:
>> >>> On xiaomi-beryllium and oneplus-enchilada audio does not work reliab=
ly
>> >>> with the in-kernel pd-mapper. Deferring the probe solves these issue=
s.
>> >>> Specifically, audio only works reliably with the in-kernel pd-mapper=
, if
>> >>> the probe succeeds when remoteproc3 triggers the first successful pr=
obe.
>> >>> I.e., probes from remoteproc0, 1, and 2 need to be deferred until
>> >>> remoteproc3 has been probed.
>> >>>
>> >>> Introduce a device specific quirk that lists the first auxdev for wh=
ich
>> >>> the probe must be executed. Until then, defer probes from other auxd=
evs.
>> >>>
>> >>> Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
>> >>> Cc: stable@vger.kernel.org
>> >>> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
>> >>> ---
>> >>> The in-kernel pd-mapper has been causing audio issues on sdm845
>> >>> devices (specifically, xiaomi-beryllium and oneplus-enchilada). I
>> >>> observed that Stephan=E2=80=99s approach [1] - which defers module p=
robing by
>> >>> blocklisting the module and triggering a later probe - works reliabl=
y.
>> >>>
>> >>> Inspired by this, I experimented with delaying the probe within the
>> >>> module itself by returning -EPROBE_DEFER in qcom_pdm_probe() until a
>> >>> certain time (13.9 seconds after boot, based on ktime_get()) had
>> >>> elapsed. This method also restored audio functionality.
>> >>>
>> >>> Further logging of auxdev->id in qcom_pdm_probe() led to an interest=
ing
>> >>> discovery: audio only works reliably with the in-kernel pd-mapper wh=
en
>> >>> the first successful probe is triggered by remoteproc3. In other wor=
ds,
>> >>> probes from remoteproc0, 1, and 2 must be deferred until remoteproc3=
 has
>> >>> been probed.
>> >>>
>> >>
>> >> The remoteproc numbering is assigned at the time of registering each
>> >> remoteproc driver, and does not necessarily relate to the order in wh=
ich
>> >> they are launched. That said, it sounds like what you're saying is th=
at
>> >> is that audio only works if we launch the pd-mapper after the
>> >> remoteprocs has started?
>> >
>> > Almost, but not quite. You are right, that remoteproc3 in my setup is
>> > always the last one that probes the pd-mapper.
>> >
>> > However, when experimenting with different timings I saw that the
>> > pd-mapper really do has to respond to the probe from remoteproc3 (I'm
>> > not sure I'm using the right terminology here, but I hope my intent
>> > comes across). If the pd-mapper responds to remoteproc3's probe with
>> > -EPROBE_DEFER there will again be subsequent probes from the other
>> > remoteprocs. If we act on those probes, there is a chance that audio
>> > (mic in my case) does not work. So, my conclusion was that remoteproc3=
's
>> > probe has to be answered first before responding to the other probes.
>> >
>> > Further note that in my experiments remoteproc1 was always the first to
>> > do the probing, followed by either remoteproc0 or remoteproc2.
>> > remoteproc3 was always the last.
>> >
>> >> Can you please confirm which remoteproc is which in your numbering? (=
In
>> >> particular, which remoteproc instance is the audio DSP?)
>> >
>> > remoteproc0: adsp
>> > remoteproc1: cdsp
>> > remoteproc2: slpi
>> > remoteproc3: 4080000.remoteproc
>>
>> I'm sorry but there's one additional thing that I really should have
>> mentioned earlier: My issue is specifically with *call* audio.
>>
>> Call audio is only available using out-of-tree patches. The ones I'm
>> currently using are here:
>> https://gitlab.com/sdm845-mainline/linux/-/commits/sdm845-6.13-rc2-r2?re=
f_type=3Dtags
>>
>> Best regards,
>>   Frank
>>
>> >
>> > (I took them from the kernel messages "remoteproc remoteproc<X>: <xyz>
>> > is available".)
>> >
>> >>> To address this, I propose introducing a quirk table (which currently
>> >>> only contains sdm845) to defer probing until the correct auxiliary
>> >>> device (remoteproc3) initiates the probe.
>> >>>
>> >>> I look forward to your feedback.
>> >>>
>> >>
>> >> I don't think the proposed workaround is our path forward, but I very
>> >> much appreciate your initiative and the insights it provides!
>> >
>> > Thank you! I was hoping that somebody with more experience in the QCOM
>> > universe can draw further conclusions from this.
>> >
>> >> Seems to
>> >> me that we have a race-condition in the pdr helper.
>> >
>> > If you need further experimenting or can give me rough guidance on whe=
re
>> > to look next, I'll be glad to help.
>> >
>> > Thanks again,
>> >   Frank
>> >
>> >>
>> >> Regards,
>> >> Bjorn
>> >>
>> >>> Thanks,
>> >>>   Frank
>> >>>
>> >>> [1]: https://lore.kernel.org/linux-arm-msm/Zwj3jDhc9fRoCCn6@linaro.o=
rg/
>> >>> ---
>> >>>  drivers/soc/qcom/qcom_pd_mapper.c | 43 ++++++++++++++++++++++++++++=
+++++++++++
>> >>>  1 file changed, 43 insertions(+)
>> >>>
>> >>> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qc=
om_pd_mapper.c
>> >>> index 154ca5beb47160cc404a46a27840818fe3187420..34b26df665a888ac4872=
f56e948e73b561ae3b6b 100644
>> >>> --- a/drivers/soc/qcom/qcom_pd_mapper.c
>> >>> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
>> >>> @@ -46,6 +46,11 @@ struct qcom_pdm_data {
>> >>>     struct list_head services;
>> >>>  };
>> >>>
>> >>> +struct qcom_pdm_probe_first_dev_quirk {
>> >>> +   const char *name;
>> >>> +   u32 id;
>> >>> +};
>> >>> +
>> >>>  static DEFINE_MUTEX(qcom_pdm_mutex); /* protects __qcom_pdm_data */
>> >>>  static struct qcom_pdm_data *__qcom_pdm_data;
>> >>>
>> >>> @@ -526,6 +531,11 @@ static const struct qcom_pdm_domain_data *x1e80=
100_domains[] =3D {
>> >>>     NULL,
>> >>>  };
>> >>>
>> >>> +static const struct qcom_pdm_probe_first_dev_quirk first_dev_remote=
proc3 =3D {
>> >>> +   .id =3D 3,
>> >>> +   .name =3D "pd-mapper"
>> >>> +};
>> >>> +
>> >>>  static const struct of_device_id qcom_pdm_domains[] __maybe_unused =
=3D {
>> >>>     { .compatible =3D "qcom,apq8016", .data =3D NULL, },
>> >>>     { .compatible =3D "qcom,apq8064", .data =3D NULL, },
>> >>> @@ -566,6 +576,10 @@ static const struct of_device_id qcom_pdm_domai=
ns[] __maybe_unused =3D {
>> >>>     {},
>> >>>  };
>> >>>
>> >>> +static const struct of_device_id qcom_pdm_defer[] __maybe_unused =
=3D {
>> >>> +   { .compatible =3D "qcom,sdm845", .data =3D &first_dev_remoteproc=
3, },
>> >>> +   {},
>> >>> +};
>> >>>  static void qcom_pdm_stop(struct qcom_pdm_data *data)
>> >>>  {
>> >>>     qcom_pdm_free_domains(data);
>> >>> @@ -637,6 +651,25 @@ static struct qcom_pdm_data *qcom_pdm_start(voi=
d)
>> >>>     return ERR_PTR(ret);
>> >>>  }
>> >>>
>> >>> +static bool qcom_pdm_ready(struct auxiliary_device *auxdev)
>> >>> +{
>> >>> +   const struct of_device_id *match;
>> >>> +   struct device_node *root;
>> >>> +   struct qcom_pdm_probe_first_dev_quirk *first_dev;
>> >>> +
>> >>> +   root =3D of_find_node_by_path("/");
>> >>> +   if (!root)
>> >>> +           return true;
>> >>> +
>> >>> +   match =3D of_match_node(qcom_pdm_defer, root);
>> >>> +   of_node_put(root);
>> >>> +   if (!match)
>> >>> +           return true;
>> >>> +
>> >>> +   first_dev =3D (struct qcom_pdm_probe_first_dev_quirk *) match->d=
ata;
>> >>> +   return (auxdev->id =3D=3D first_dev->id) && !strcmp(auxdev->name=
, first_dev->name);
>> >>> +}
>> >>> +
>> >>>  static int qcom_pdm_probe(struct auxiliary_device *auxdev,
>> >>>                       const struct auxiliary_device_id *id)
>> >>>
>> >>> @@ -647,6 +680,15 @@ static int qcom_pdm_probe(struct auxiliary_devi=
ce *auxdev,
>> >>>     mutex_lock(&qcom_pdm_mutex);
>> >>>
>> >>>     if (!__qcom_pdm_data) {
>> >>> +           if (!qcom_pdm_ready(auxdev)) {
>> >>> +                   pr_debug("%s: Deferring probe for device %s (id:=
 %u)\n",
>> >>> +                           __func__, auxdev->name, auxdev->id);
>> >>> +                   ret =3D -EPROBE_DEFER;
>> >>> +                   goto probe_stop;
>> >>> +           }
>> >>> +           pr_debug("%s: Probing for device %s (id: %u), starting p=
dm\n",
>> >>> +                   __func__, auxdev->name, auxdev->id);
>> >>> +
>> >>>             data =3D qcom_pdm_start();
>> >>>
>> >>>             if (IS_ERR(data))
>> >>> @@ -659,6 +701,7 @@ static int qcom_pdm_probe(struct auxiliary_devic=
e *auxdev,
>> >>>
>> >>>     auxiliary_set_drvdata(auxdev, __qcom_pdm_data);
>> >>>
>> >>> +probe_stop:
>> >>>     mutex_unlock(&qcom_pdm_mutex);
>> >>>
>> >>>     return ret;
>> >>>
>> >>> ---
>> >>> base-commit: 7f048b202333b967782a98aa21bb3354dc379bbf
>> >>> change-id: 20250205-qcom_pdm_defer-3dc1271d74d9
>> >>>
>> >>> Best regards,
>> >>> --
>> >>> Frank Oltmanns <frank@oltmanns.dev>
>> >>>
>>
>
> I know that Bjorn already said this change is a no, but I wanted to
> mention that I have a Lenovo Yoga C630 (WOS) device here that is also
> an sdm845, and with this patch applied, it has the opposite effect and
> breaks audio on it.

Interesting! Just so that I get a better understanding: Is remoteproc3
loaded at all? Can you please send me the output of:

$ dmesg | grep "remoteproc.: .* is available"

and

$ dmesg | grep "remoteproc.: .* is now up"

(no need to apply the patch for that)

Thanks,
  Frank

>
> -- steev

