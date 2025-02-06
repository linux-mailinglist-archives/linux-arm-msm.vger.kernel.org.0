Return-Path: <linux-arm-msm+bounces-47003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E012CA2A126
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 07:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B663D1887AD0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 06:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEAC9224882;
	Thu,  6 Feb 2025 06:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="Rfrt9CYS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73852248BB;
	Thu,  6 Feb 2025 06:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738824304; cv=none; b=juqb18MWrUdYghKqf5B/dVOaUHk5/BFrlgWqGbUV24fXP5cchrw8OwXH2eMB7DTPvX1KKKRHueZ1e7kjVexmf0bx/AOjRxAOzJaF5j4VCKwOYNvuayuTfi+PvwAKTQ/uhmWxNLSZV+DzCOPE5v6xH7gLW5H99S48KGTBP7bCe8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738824304; c=relaxed/simple;
	bh=YPubFNTNHiTO9oEaYaMjlzDAJl3LULtoi0tNf6Ahtes=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RGPDkTWe4cJyvPcJmT3ipCCqEzVU4wctdoFbAnjj5XxinQFe3uns/5yZen7F7EhNUGYY4g1J7+HTY0kdVCJz7unuyJr6YaFrwGO8oAvj3PlQY/CJhM+qbikuHgrKU50ZvlB6qbKxoUvr0unclrVH6cjsxoHKUDfMEK3EcwhkI/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev; spf=pass smtp.mailfrom=oltmanns.dev; dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b=Rfrt9CYS; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oltmanns.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YpSJj1XK3z9t6q;
	Thu,  6 Feb 2025 07:44:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1738824293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ngSjQ97qz0oyQvdkcgXvSO4Yt/j9uwxw/AxvaFeID7I=;
	b=Rfrt9CYSCef0OItKwZRY65sHbw+p6DMMyzdhoxcB+mmplPtklE5mPffccbwR4naEcE+sxx
	1YyYv5kOxdW+ziYtcOn2DaogDu0mHihyCj0+Z6wFSqeajV+1vl5BuC/lmG+uLw/tUJAdxJ
	9DZbP7sJ1tsekU0DkIzR0ShdGGM5i0M4SK6wC/3iEgHBHW5e2MqDqDIM6Kmnwlz23WnxBE
	sYVeprzel9fRZ/kVsyAXkq0wrhicpMqHTbbW+fAYuIkzmx2hL2KkebxPaFdow5pe9THjfY
	unN+jBVuT36RkMHhxdLY7hh40G2U5NMJ0GtxBQh6+f2XSFE1xCzoXrYqjt67VQ==
From: Frank Oltmanns <frank@oltmanns.dev>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,  Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,  Chris Lew <quic_clew@quicinc.com>,
  linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org,  Stephan
 Gerhold <stephan.gerhold@linaro.org>,  Johan Hovold
 <johan+linaro@kernel.org>,  Caleb Connolly <caleb.connolly@linaro.org>,
  Joel Selvaraj <joelselvaraj.oss@gmail.com>,  Alexey Minnekhanov
 <alexeymin@postmarketos.org>,  stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: defer probing on sdm845
In-Reply-To: <87y0yj1up1.fsf@oltmanns.dev> (Frank Oltmanns's message of "Thu,
	06 Feb 2025 06:57:46 +0100")
References: <20250205-qcom_pdm_defer-v1-1-a2e9a39ea9b9@oltmanns.dev>
	<2vfwtuiorefq64ood4k7y7ukt34ubdomyezfebkeu2wu5omvkb@c5h2sbqs47ya>
	<87y0yj1up1.fsf@oltmanns.dev>
Date: Thu, 06 Feb 2025 07:44:49 +0100
Message-ID: <87msez1sim.fsf@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4YpSJj1XK3z9t6q

Hi again,

On 2025-02-06 at 06:57:46 +0100, Frank Oltmanns <frank@oltmanns.dev> wrote:
> On 2025-02-05 at 20:54:53 -0600, Bjorn Andersson <andersson@kernel.org> w=
rote:
>> On Wed, Feb 05, 2025 at 10:57:11PM +0100, Frank Oltmanns wrote:
>>> On xiaomi-beryllium and oneplus-enchilada audio does not work reliably
>>> with the in-kernel pd-mapper. Deferring the probe solves these issues.
>>> Specifically, audio only works reliably with the in-kernel pd-mapper, if
>>> the probe succeeds when remoteproc3 triggers the first successful probe.
>>> I.e., probes from remoteproc0, 1, and 2 need to be deferred until
>>> remoteproc3 has been probed.
>>>
>>> Introduce a device specific quirk that lists the first auxdev for which
>>> the probe must be executed. Until then, defer probes from other auxdevs.
>>>
>>> Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
>>> ---
>>> The in-kernel pd-mapper has been causing audio issues on sdm845
>>> devices (specifically, xiaomi-beryllium and oneplus-enchilada). I
>>> observed that Stephan=E2=80=99s approach [1] - which defers module prob=
ing by
>>> blocklisting the module and triggering a later probe - works reliably.
>>>
>>> Inspired by this, I experimented with delaying the probe within the
>>> module itself by returning -EPROBE_DEFER in qcom_pdm_probe() until a
>>> certain time (13.9 seconds after boot, based on ktime_get()) had
>>> elapsed. This method also restored audio functionality.
>>>
>>> Further logging of auxdev->id in qcom_pdm_probe() led to an interesting
>>> discovery: audio only works reliably with the in-kernel pd-mapper when
>>> the first successful probe is triggered by remoteproc3. In other words,
>>> probes from remoteproc0, 1, and 2 must be deferred until remoteproc3 has
>>> been probed.
>>>
>>
>> The remoteproc numbering is assigned at the time of registering each
>> remoteproc driver, and does not necessarily relate to the order in which
>> they are launched. That said, it sounds like what you're saying is that
>> is that audio only works if we launch the pd-mapper after the
>> remoteprocs has started?
>
> Almost, but not quite. You are right, that remoteproc3 in my setup is
> always the last one that probes the pd-mapper.
>
> However, when experimenting with different timings I saw that the
> pd-mapper really do has to respond to the probe from remoteproc3 (I'm
> not sure I'm using the right terminology here, but I hope my intent
> comes across). If the pd-mapper responds to remoteproc3's probe with
> -EPROBE_DEFER there will again be subsequent probes from the other
> remoteprocs. If we act on those probes, there is a chance that audio
> (mic in my case) does not work. So, my conclusion was that remoteproc3's
> probe has to be answered first before responding to the other probes.
>
> Further note that in my experiments remoteproc1 was always the first to
> do the probing, followed by either remoteproc0 or remoteproc2.
> remoteproc3 was always the last.
>
>> Can you please confirm which remoteproc is which in your numbering? (In
>> particular, which remoteproc instance is the audio DSP?)
>
> remoteproc0: adsp
> remoteproc1: cdsp
> remoteproc2: slpi
> remoteproc3: 4080000.remoteproc

I'm sorry but there's one additional thing that I really should have
mentioned earlier: My issue is specifically with *call* audio.

Call audio is only available using out-of-tree patches. The ones I'm
currently using are here:
https://gitlab.com/sdm845-mainline/linux/-/commits/sdm845-6.13-rc2-r2?ref_t=
ype=3Dtags

Best regards,
  Frank

>
> (I took them from the kernel messages "remoteproc remoteproc<X>: <xyz>
> is available".)
>
>>> To address this, I propose introducing a quirk table (which currently
>>> only contains sdm845) to defer probing until the correct auxiliary
>>> device (remoteproc3) initiates the probe.
>>>
>>> I look forward to your feedback.
>>>
>>
>> I don't think the proposed workaround is our path forward, but I very
>> much appreciate your initiative and the insights it provides!
>
> Thank you! I was hoping that somebody with more experience in the QCOM
> universe can draw further conclusions from this.
>
>> Seems to
>> me that we have a race-condition in the pdr helper.
>
> If you need further experimenting or can give me rough guidance on where
> to look next, I'll be glad to help.
>
> Thanks again,
>   Frank
>
>>
>> Regards,
>> Bjorn
>>
>>> Thanks,
>>>   Frank
>>>
>>> [1]: https://lore.kernel.org/linux-arm-msm/Zwj3jDhc9fRoCCn6@linaro.org/
>>> ---
>>>  drivers/soc/qcom/qcom_pd_mapper.c | 43 +++++++++++++++++++++++++++++++=
++++++++
>>>  1 file changed, 43 insertions(+)
>>>
>>> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_=
pd_mapper.c
>>> index 154ca5beb47160cc404a46a27840818fe3187420..34b26df665a888ac4872f56=
e948e73b561ae3b6b 100644
>>> --- a/drivers/soc/qcom/qcom_pd_mapper.c
>>> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
>>> @@ -46,6 +46,11 @@ struct qcom_pdm_data {
>>>  	struct list_head services;
>>>  };
>>>
>>> +struct qcom_pdm_probe_first_dev_quirk {
>>> +	const char *name;
>>> +	u32 id;
>>> +};
>>> +
>>>  static DEFINE_MUTEX(qcom_pdm_mutex); /* protects __qcom_pdm_data */
>>>  static struct qcom_pdm_data *__qcom_pdm_data;
>>>
>>> @@ -526,6 +531,11 @@ static const struct qcom_pdm_domain_data *x1e80100=
_domains[] =3D {
>>>  	NULL,
>>>  };
>>>
>>> +static const struct qcom_pdm_probe_first_dev_quirk first_dev_remotepro=
c3 =3D {
>>> +	.id =3D 3,
>>> +	.name =3D "pd-mapper"
>>> +};
>>> +
>>>  static const struct of_device_id qcom_pdm_domains[] __maybe_unused =3D=
 {
>>>  	{ .compatible =3D "qcom,apq8016", .data =3D NULL, },
>>>  	{ .compatible =3D "qcom,apq8064", .data =3D NULL, },
>>> @@ -566,6 +576,10 @@ static const struct of_device_id qcom_pdm_domains[=
] __maybe_unused =3D {
>>>  	{},
>>>  };
>>>
>>> +static const struct of_device_id qcom_pdm_defer[] __maybe_unused =3D {
>>> +	{ .compatible =3D "qcom,sdm845", .data =3D &first_dev_remoteproc3, },
>>> +	{},
>>> +};
>>>  static void qcom_pdm_stop(struct qcom_pdm_data *data)
>>>  {
>>>  	qcom_pdm_free_domains(data);
>>> @@ -637,6 +651,25 @@ static struct qcom_pdm_data *qcom_pdm_start(void)
>>>  	return ERR_PTR(ret);
>>>  }
>>>
>>> +static bool qcom_pdm_ready(struct auxiliary_device *auxdev)
>>> +{
>>> +	const struct of_device_id *match;
>>> +	struct device_node *root;
>>> +	struct qcom_pdm_probe_first_dev_quirk *first_dev;
>>> +
>>> +	root =3D of_find_node_by_path("/");
>>> +	if (!root)
>>> +		return true;
>>> +
>>> +	match =3D of_match_node(qcom_pdm_defer, root);
>>> +	of_node_put(root);
>>> +	if (!match)
>>> +		return true;
>>> +
>>> +	first_dev =3D (struct qcom_pdm_probe_first_dev_quirk *) match->data;
>>> +	return (auxdev->id =3D=3D first_dev->id) && !strcmp(auxdev->name, fir=
st_dev->name);
>>> +}
>>> +
>>>  static int qcom_pdm_probe(struct auxiliary_device *auxdev,
>>>  			  const struct auxiliary_device_id *id)
>>>
>>> @@ -647,6 +680,15 @@ static int qcom_pdm_probe(struct auxiliary_device =
*auxdev,
>>>  	mutex_lock(&qcom_pdm_mutex);
>>>
>>>  	if (!__qcom_pdm_data) {
>>> +		if (!qcom_pdm_ready(auxdev)) {
>>> +			pr_debug("%s: Deferring probe for device %s (id: %u)\n",
>>> +				__func__, auxdev->name, auxdev->id);
>>> +			ret =3D -EPROBE_DEFER;
>>> +			goto probe_stop;
>>> +		}
>>> +		pr_debug("%s: Probing for device %s (id: %u), starting pdm\n",
>>> +			__func__, auxdev->name, auxdev->id);
>>> +
>>>  		data =3D qcom_pdm_start();
>>>
>>>  		if (IS_ERR(data))
>>> @@ -659,6 +701,7 @@ static int qcom_pdm_probe(struct auxiliary_device *=
auxdev,
>>>
>>>  	auxiliary_set_drvdata(auxdev, __qcom_pdm_data);
>>>
>>> +probe_stop:
>>>  	mutex_unlock(&qcom_pdm_mutex);
>>>
>>>  	return ret;
>>>
>>> ---
>>> base-commit: 7f048b202333b967782a98aa21bb3354dc379bbf
>>> change-id: 20250205-qcom_pdm_defer-3dc1271d74d9
>>>
>>> Best regards,
>>> --
>>> Frank Oltmanns <frank@oltmanns.dev>
>>>

