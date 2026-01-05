Return-Path: <linux-arm-msm+bounces-87377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F31ECF22EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 08:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 274B23014AD7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 07:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564B02857FC;
	Mon,  5 Jan 2026 07:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbHDMcCT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2807127E056;
	Mon,  5 Jan 2026 07:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767597645; cv=none; b=RVGBUHFgKn0Bzikh1h7cosyclDazh/Vz4pyRM6Emyr2AmxTgPSS33gX2UcDe+l8BdejJX6BCjLSISt6rd97IxwyYuSIlNtGQyhWtZlSX2nESoPsaQupGFlyif05PZ45kjDJeQXRIEeyM1X/JoMJm5o6g0MjuHC3UKxZJTGS9sFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767597645; c=relaxed/simple;
	bh=2KDTUXMjhxn5Kz+O4XewKViYOEewr+IPihm7nCoKuqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AGy98OqSqrr0zAU6JjDFf6ekLl+FzQFwOxqaeWdsY7EyRd89dAjiaxonMH9clnDTF5iJ5Dm/rvbi50TBVN8BPGtkIo6gfuQWUMSwuiwWIhnmYj10w4HrP7BsWfEFO7BDCPW8ljsjO5FUL/FwY2fZV4SVdz56vBcm/170N/2VPXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbHDMcCT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B50BCC116D0;
	Mon,  5 Jan 2026 07:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767597644;
	bh=2KDTUXMjhxn5Kz+O4XewKViYOEewr+IPihm7nCoKuqo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JbHDMcCTu6NBFw9JxoJ5akDx9RTcTjhV39qqX0fT2DOOZn3Rc8uUM9IuGTHEUiiTv
	 jwOVt/COgp1XNujJKp8KVn1MH24BKBIfXMvskPUyMM+jseKowoKJaxYAh+lHPfTxzz
	 CsLaOedKxiH5DKm+U1NCj7hWNm7MMHiLyxh0uCKydpfo5azEGwbRA/Mv8uTFDjyjkN
	 qM0B9vsHUrhqUj86QVxSe4Y3aHhMBXbdOfC3iDLFxa8wEW1268pfV3DJCJpm/EdZrh
	 kGQyH2yXWvvVvEsUIg4WJprzSsaCI8u7MwCB+5HjNeJvp9l0TN5h6zmc9EPvz9dilp
	 GQcIQ8OSiTwRQ==
Message-ID: <922a12da-eb4b-46f2-b203-f13c9577f3f7@kernel.org>
Date: Mon, 5 Jan 2026 07:20:35 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] ASoC: qcom: q6dsp-lpass-ports: Expand sampling
 rate and PCM format constraints
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
 mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20251210065157.2775514-1-ravi.hothi@oss.qualcomm.com>
 <DEUL786WEYBY.3502XZKMTYTN3@linaro.org>
 <370a9d69-1706-438a-bb36-01a22e5cf540@oss.qualcomm.com>
 <DF0GN7VV4R2W.2E3U1LMOF0JPG@linaro.org>
 <d9e64bd0-7ccf-490c-a6be-d9cc9484475d@oss.qualcomm.com>
 <DF4GKIYJPDKA.DTLON4U0AZHB@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <DF4GKIYJPDKA.DTLON4U0AZHB@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/22/25 4:25 AM, Alexey Klimov wrote:
> On Wed Dec 17, 2025 at 12:56 PM GMT, Srinivas Kandagatla wrote:
>>
>>
>> On 12/17/25 11:38 AM, Alexey Klimov wrote:
>>> On Mon Dec 15, 2025 at 7:29 AM GMT, Ravi Hothi wrote:
>>>>
>>>>
>>>> On 12/10/2025 7:26 PM, Alexey Klimov wrote:
>>>>> On Wed Dec 10, 2025 at 6:51 AM GMT, Ravi Hothi wrote:
>>>>>> This patch series expands the existing constraints in
>>>>>> the q6dsp-lpass-ports driver to improve compatibility
>>>>>> and flexibility for audio stream configurations.
>>>>>>
>>>>>> The first patch extends the supported sampling rates to cover a wider
>>>>>> range, from 8000 Hz to 192000 Hz, ensuring better compatibility with
>>>>>> diverse audio hardware and allowing more flexible audio stream setups.
>>>>>>
>>>>>> The second patch adds support for the 32-bit PCM format
>>>>>> (SNDRV_PCM_FMTBIT_S32_LE) alongside the existing 16-bit
>>>>>> and 24-bit formats, enabling handling of high-resolution
>>>>>> audio streams and improving audio quality for supported hardware.
>>>>>
>>>>> Is q6dsp-lpass-ports involved in compress offloaded playback on
>>>>> existing devices? If yes, then how is it gonna play with
>>>>> explicitly setting format/sampling rate to s16le/48k in sndcards drivers?
>>
>> be_hw_params_fixup callback in machine drivers can select any format
>> that fits the usecase. currently this is hardcoded for s16le samples and
>> 48K rate, but its not limited to this. This patch is expanding the
>> allowed range in the dais so that machine drivers should be able to
>> select other options, ex: for HDMI its better to be at S24LE or S32LE.
> 
> Yes. Exactly.
> So, should we add kcontrols to machine driver to handle these usecases like
> selecting s24le instead of s16le? Or what's the plan?
We can always do that if that is how things are wired up at the platform
level on case by case basis.

--srini>
>>>> Support for s16le/48k is already available; these patch will expand the 
>>>> existing constraint so that customers can use a wider range.
>>>
>>> Unfortunately, you didn't answer any of my questions or answered
>>> a different one.
>>>
>>> Perhaps the main one: is q6dsp-lpass-ports involved in compress offloaded
>>> playback on existing devices?
>>
>> lpass-ports are the Backend DAI ports, So yes, they will be involved in
>> all the usecases that deal with handling sinks or sources irrespective
>> of pcm or compressed content.
> 
> Thanks,
> Alexey
> 


