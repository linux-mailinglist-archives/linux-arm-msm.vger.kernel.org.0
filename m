Return-Path: <linux-arm-msm+bounces-69078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53840B25737
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 01:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 555595A6B07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 23:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2647D2FC86B;
	Wed, 13 Aug 2025 23:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kk6ofFEG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0D72FB98D
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 23:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755126441; cv=none; b=ISLapRXXLzYlXz4cG3N5EtrlzxrzrJX2q88ciS5BfjW6YXEnDJqf3mEMgpoCXYmwvkvmyfhi/ipnMpoMEV7qQYOYhxTu2VGLK1bkWMu2iSuaNljdMc4ybvMbywSzbZx/TvEcyfEg1G5vGotp/UiYtPCS2a4/JSyof8yaIcnWcGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755126441; c=relaxed/simple;
	bh=/qpjGm0i7AdI98kp/Vvxql5u9hFiHNoiTyqr2D7TQGo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=dWa2CxsxQrAjJPiefhjYLGXTREX2j3S7MK8fJMbdj5ac/reWBckxdVpvCs6CJFb/rsLgFZtacT7Ex2I+0lbOY5efv0NoCXERdV1uoA2XxomuAXfAyZJIyiD1thxs7wr3t5Ku9Gj0zOxa8Vangx1vQl+02Lzz4STSvPdRGXny6M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kk6ofFEG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b0b42d5so1926815e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 16:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755126437; x=1755731237; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1w1jD5uAhWjkLk2dF1OZgC9h1u3edFNggTts1awcIQ=;
        b=kk6ofFEGAQbqV2f9QfuvY1fOYFszjFBJrY7z+D3RZuqFVUHW7hVKITWNl1l5Cb4qHW
         qmqsd8H43xaAZ7BBrFA7tqd8mb6yllhFdN9oEOZysNa03Eyz0DOU84FFEHW9a2xR5nbs
         5w3ctgof0ow81fziQBf4xMTmE+7LStTySFToDLjGpeLzU5Mi9bdQ19otpba8jVqGFsIi
         m5DArBnd5hkLd8ie2nR90+srsZz9EXKCQJZ67OImSNLodl+vtaI0m9P8351cBBzZWd1u
         UXwl1r6e66jC9DUyeLm9P50VQ3go4nM6QWiRwhB04TP84LuRrUdwfN8l2QmS16UGzBJ8
         UY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755126437; x=1755731237;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t1w1jD5uAhWjkLk2dF1OZgC9h1u3edFNggTts1awcIQ=;
        b=j6/gv+/jOBkNdcOUyzevnBkUrEGovvyWgfPqsrNgqZ+WiN/EE6u6d59+Ivl+bu9G+e
         1/UsaJyYtZX0zCi+sY7E9BjkFFforiP/1NHblz2D9M8ejF6+VrGRdVoDKVUvFAzhZfjE
         mtbgivRG90Y8StjiYXhZl7gtTBag4Y0C3mQqzoj9yP5LcMO/gkE5FIxPI/omcNlfLefW
         Z1eqFms76UN+KHc4Pm4mepc2wt/xlIbonKqWBBuHDR3DFOwZrEWfeCp/ArgaHZSn7sD7
         Wq4YJ4V1+Ac9BEnQNiAL+NNHBohgEL/UWwQ9dNNk50jdcwCcb0bzosdPGl/sQvWjhPtL
         d16A==
X-Forwarded-Encrypted: i=1; AJvYcCWqttIKtWd1enr+IP66cPekICgczrd/+6E5FX1CjUfKNgbKdS5cOkmk7wwZIs8eJGPq5l5MMHExKHD4DahV@vger.kernel.org
X-Gm-Message-State: AOJu0YwEvDJcS7t2ZVDD/WyddBssRv3R0rkvK+xT7IRPcFa33b0bXgr/
	EZ1mrejr4nnOknDpgXvTiL132z2NihXmjyhjNdJJ93LrLXAs7zNUY5hYzbiCWRrHhtE=
X-Gm-Gg: ASbGncsoheJdX57TDFlddgWs8LAlfai4Yz6EImSowfnFfCm/OaPvZZujO9C5an0El8Z
	tLJ9Z33V0vWHHRO4FQuLE0rIynzROrqlHxzJESIhByZHw/amKpDR5StkBVbGEgP2nQG6m8+mZBB
	28aHMRGybvEeO5+j3Yp3+6Mt6SBRQCnjT2zylRvKNLF6b7LoQsZhhZG/CwotGtmwe6o7zQoFbWW
	EG/JfItMW5TS01dZ2uHLlG4Ws8pgpaWtS9P1A9xkqHLj26A4IIwPFsSEUCydHo4AKiGto/QTJjh
	r8UV0YdD3pDNAw4g0zMYVV0fXeXKNKc9ecPI3Pt8fspSsoCaz59AAf3gpLTgucRHGSnr6p2/Ail
	xxji8dQE/TdEBY1oQmDSkjOp8Jms=
X-Google-Smtp-Source: AGHT+IHLYhRGc4JYIFTUPFhdxnROSBPBG4POVhF8NCo8fac7mqIyrnBrDgT2tDgDmUZXysWtmKuWyQ==
X-Received: by 2002:a05:600c:354e:b0:456:1442:86e with SMTP id 5b1f17b1804b1-45a1b66929dmr3241165e9.21.1755126437430;
        Wed, 13 Aug 2025 16:07:17 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:7f3a:5ab2:26aa:831f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a541788sm17732825e9.30.2025.08.13.16.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 16:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 Aug 2025 00:07:16 +0100
Message-Id: <DC1OE9UIUPON.2DOURP7NEQS54@linaro.org>
Subject: Re: [PATCH v2 2/3] ASoC: codecs: add new pm4125 audio codec driver
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>, "Srinivas
 Kandagatla" <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>
Cc: "Lee Jones" <lee@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org>
 <20250711-pm4125_audio_codec_v1-v2-2-13e6f835677a@linaro.org>
 <87a56d1e-2bbd-4abf-91c8-5129835d8d87@oss.qualcomm.com>
In-Reply-To: <87a56d1e-2bbd-4abf-91c8-5129835d8d87@oss.qualcomm.com>

On Fri Jul 11, 2025 at 2:32 PM BST, Srinivas Kandagatla wrote:
> On 7/11/25 4:00 AM, Alexey Klimov wrote:
>> The audio codec is found in Qualcomm PM2250/PM4125 PMICs and is used on
>> platforms like Qualcomm QCM2290. It has soundwire interface and
>> corresponding RX and TX slave devices.
>>=20
>> It has only two input channels: HPH left and right. The line output (LO)
>> is linked to HPHL so the hardware has some limitations regarding concurr=
ent
>> playback via HPH and LO for instance.
>>=20
>> The codec driver also uses WCD MBCH framework. The MBHC functionality is
>> implemented in a minimalistic way to enable IRQs and avoid different
>> issues with IRQs.
>>=20
>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.c=
om>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com=
>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>
> Thanks for doing this Alexey,
>
> I have tested Headset playback, headset recording and Lineout.
>
> While testing I have noticed one issue with the places where enable_irq
> is being used, there is a possiblity of things going wrong in some cases.
>
>
>> ---
>>  sound/soc/codecs/Kconfig      |   18 +
>>  sound/soc/codecs/Makefile     |    8 +
>>  sound/soc/codecs/pm4125-sdw.c |  546 +++++++++++++
>>  sound/soc/codecs/pm4125.c     | 1767 ++++++++++++++++++++++++++++++++++=
+++++++
>>  sound/soc/codecs/pm4125.h     |  314 ++++++++
>>  5 files changed, 2653 insertions(+)
>>=20
>
> ...
>> +static int pm4125_codec_enable_lo_pa(struct snd_soc_dapm_widget *w,
>> +				     struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->d=
apm);
>> +	struct pm4125_priv *pm4125 =3D snd_soc_component_get_drvdata(component=
);
>> +
>> +	switch (event) {
>> +	case SND_SOC_DAPM_PRE_PMU:
>> +		snd_soc_component_update_bits(component, PM4125_ANA_COMBOPA_CTL_5, 0x=
04, 0x00);
>> +		usleep_range(1000, 1010);
>> +		snd_soc_component_update_bits(component, PM4125_ANA_COMBOPA_CTL_4, 0x=
0F, 0x0F);
>> +		usleep_range(1000, 1010);
>> +		snd_soc_component_write_field(component, PM4125_ANA_COMBOPA_CTL,
>> +					      PM4125_ANA_COMBO_PA_SELECT_MASK,
>> +					      PM4125_ANA_COMBO_PA_SELECT_LO);
>> +		snd_soc_component_write_field(component, PM4125_DIG_SWR_PDM_WD_CTL0,
>> +					      PM4125_WDT_ENABLE_MASK,
>> +					      (PM4125_WDT_ENABLE_RX0_M | PM4125_WDT_ENABLE_RX0_L));
>> +		break;
>> +	case SND_SOC_DAPM_POST_PMU:
>> +		usleep_range(5000, 5010);
>> +		snd_soc_component_update_bits(component, PM4125_ANA_COMBOPA_CTL_4, 0x=
0F, 0x04);
>> +		enable_irq(pm4125->hphl_pdm_wd_int);
>
> if headset playback dapm widgets are powered up or active and you try to
> play on lineout you would get below splat:
>
> [ 1181.352762] ------------[ cut here ]------------
> [ 1181.357435] Unbalanced enable for IRQ 156
> [ 1181.361489] WARNING: CPU: 1 PID: 877 at kernel/irq/manage.c:753
> __enable_irq+0x4c/0x7c
> ...
>
> [ 1181.483541] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS
> BTYPE=3D--)
> [ 1181.490534] pc : __enable_irq+0x4c/0x7c
> [ 1181.494405] lr : __enable_irq+0x4c/0x7c
> [ 1181.498278] sp : ffff8000840ab8a0
> [ 1181.501618] x29: ffff8000840ab8a0 x28: ffffd79b9725d588 x27:
> ffff8000840ab948
> [ 1181.508796] x26: 000000000000309b x25: 0000000000000080 x24:
> 0000000000000080
> [ 1181.515980] x23: ffffd79b9698f250 x22: 0000000000000000 x21:
> 0000000000000000
> [ 1181.523153] x20: 000000000000009c x19: ffff23c347fd9400 x18:
> 0000000000000006
> [ 1181.530335] x17: 0000000000000001 x16: ffffd79b94dbcce8 x15:
> ffff8000840ab46f
> [ 1181.537508] x14: 0000000000000000 x13: 3635312051524920 x12:
> ffffd79b96d96768
> [ 1181.544691] x11: 0000000000000058 x10: 0000000000000018 x9 :
> ffffd79b96d96768
> [ 1181.551862] x8 : 000000000000024f x7 : ffffd79b96dee768 x6 :
> ffffd79b96dee768
> [ 1181.559044] x5 : ffff23c3bbbb8508 x4 : 0000000000000000 x3 :
> 0000000000000027
> [ 1181.566217] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
> ffff23c35a0a4600
> [ 1181.573392] Call trace:
> [ 1181.575871]  __enable_irq+0x4c/0x7c (P)
> [ 1181.579748]  enable_irq+0x60/0xd8
> [ 1181.583098]  pm4125_codec_enable_lo_pa+0x6c/0x1a0 [snd_soc_pm4125]
> [ 1181.589319]  dapm_seq_check_event+0x11c/0x144
> [ 1181.593720]  dapm_seq_run_coalesced+0x130/0x1d0
> [ 1181.598286]  dapm_seq_run+0x264/0x374
> [ 1181.601991]  dapm_power_widgets+0x664/0x900
> [ 1181.606212]  snd_soc_dapm_stream_event+0xf4/0x178
> [ 1181.610957]  __soc_pcm_prepare+0x64/0x120
> [ 1181.614998]  dpcm_be_dai_prepare+0x120/0x168
> [ 1181.619299]  dpcm_fe_dai_prepare+0x94/0x178
> [ 1181.623517]  snd_pcm_do_prepare+0x30/0x50
> [ 1181.627567]  snd_pcm_action_single+0x48/0xa4
> [ 1181.631872]  snd_pcm_action_nonatomic+0x94/0xb0
> [ 1181.636435]  snd_pcm_prepare+0x7c/0xe0
> [ 1181.640222]  snd_pcm_common_ioctl+0xca4/0x16e0
> [ 1181.644705]  snd_pcm_ioctl+0x34/0x4c
> [ 1181.648315]  __arm64_sys_ioctl+0xac/0x104
> [ 1181.652355]  invoke_syscall+0x48/0x104
> [ 1181.656147]  el0_svc_common.constprop.0+0x40/0xe0
> [ 1181.660892]  do_el0_svc+0x1c/0x28
> [ 1181.664242]  el0_svc+0x30/0xcc
> [ 1181.667340]  el0t_64_sync_handler+0x10c/0x138
> [ 1181.671737]  el0t_64_sync+0x198/0x19c
> [ 1181.675430] ---[ end trace 0000000000000000 ]---


Yep, I noticed that one time only but was puzzled how to reproduce.
As you suggested during out of email list discussion I will move handling
of IRQs into separate widget.

Thank you,
Alexey


