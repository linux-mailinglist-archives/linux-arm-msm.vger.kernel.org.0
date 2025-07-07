Return-Path: <linux-arm-msm+bounces-63934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83183AFB802
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 17:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 165A216F866
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 15:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04772116E7;
	Mon,  7 Jul 2025 15:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="CxrWI4uP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E52920B215;
	Mon,  7 Jul 2025 15:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751903540; cv=none; b=DhiqvVEyktWXgogeWq6+D/lIxGT2YczpSHBKJXLvQtIp6A7LlCVuOSgqFN481mPWQU4h5sGgFmjVNZGBlyEbz10DU8SEH4B9Tc82Nrfx3+2CudvjMiYfw40XpUY5/VkOyBRsfE3z8TcZVP2XxETCyjgF7ghN57BsSvKEeDQuvLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751903540; c=relaxed/simple;
	bh=WOYH2WVXKCFmx3sT48e2VzIxCSs3naav41v/IxkJFw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZL0NJuUlyjxnNCt9LFVCYArNuSSUdq2ItKE/i0ULcMttkvQH50AqvUBzvq6JX/qJANTAKeEBQ2i9cGovV06m1aF+llqCTY+55Ub+ZgzL0/qFxAI0OIzV2yOsRjGwvWAC+zoqANk0nWVhfRLayX0fmJPEdfc2RIJi35K4o2ZDfLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=CxrWI4uP; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1751903528; bh=WOYH2WVXKCFmx3sT48e2VzIxCSs3naav41v/IxkJFw0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CxrWI4uPSs+Plme+tQ42p1o7N6K/3CYgq1B74Nbbwjvtx+joytqArMikGeLVm9AVo
	 4AliM5NtWhkgXxK3IcM8XHeP8dAUejyX+ZfxPC/g+eE8RMVF9v0S1ri1vz3FhTeAW/
	 kdgeK1Bitfskwn9pNVPkrae30cdrxriyAXFjEH6k=
Message-ID: <cb84e711-1169-4c12-b866-9dd4f06ea3d3@lucaweiss.eu>
Date: Mon, 7 Jul 2025 17:52:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] ASoC: codecs: Add Awinic AW8898 amplifier driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Weidong Wang <wangweidong.a@awinic.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250705-aw8898-v2-0-9c3adb1fc1a2@lucaweiss.eu>
 <20250705-aw8898-v2-2-9c3adb1fc1a2@lucaweiss.eu>
 <57472ea1-a9c1-472b-a178-eae1cb207468@sirena.org.uk>
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <57472ea1-a9c1-472b-a178-eae1cb207468@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mark,

On 07-07-2025 2:02 p.m., Mark Brown wrote:
> On Sat, Jul 05, 2025 at 02:03:06PM +0200, Luca Weiss wrote:
> 
>> +static void aw8898_update_dev_mode(struct aw8898 *aw8898)
>> +{
>> +	unsigned int mode = AW8898_SYSCTRL_SPK_MODE;
>> +
>> +	if (aw8898->dev_mode == AW8898_RECEIVER)
>> +		mode = AW8898_SYSCTRL_RCV_MODE;
>> +
>> +	regmap_update_bits(aw8898->regmap, AW8898_SYSCTRL,
>> +			   AW8898_SYSCTRL_MODE_MASK,
>> +			   FIELD_PREP(AW8898_SYSCTRL_MODE_MASK, mode));
>> +}
> 
> Why is this open coded rather than just being a standard enum?  AFAICT
> we never reference dev_mode outside of here or the _get() and put()
> callbacks.  You might be looking for a _VALUE_ENUM?

Thanks for the reference, I'll take a look!

> 
>> +	if (!fw) {
>> +		dev_err(&aw8898->client->dev, "Failed to load firmware\n");
>> +		return;
>> +	}
>> +
>> +	dev_dbg(&aw8898->client->dev, "Loaded %s - size: %zu\n", AW8898_CFG_NAME, fw->size);
> 
> We print the firmware name we were looking for if we loaded it, but not
> if we failed to load it when it's probably more useful.

I can remove the debug print, I think if the firmware fails to load 
we'll also get an error print from the driver core with the file name? 
But I can double check it.

> 
>> +	aw8898_cfg_write(aw8898, aw8898_cfg);
> 
> The "firmware" here is just a list of arbatrary register writes with no
> validation of addresses or anything...

Yes... Got any suggestions how to make it better? This "firmware" file 
is the one that's also usable with the original driver from the 
amplifier vendor.

I honestly haven't really checked whether all the registers that are 
written there are documented well enough in the datasheet I have, so 
that this sequence could be replaced by proper DT values. But for sure 
already I know that some registers which are used and functional, are 
not documented at all unfortunately.

> 
>> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>> +	case SND_SOC_DAIFMT_I2S:
>> +		if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK)
>> +				!= SND_SOC_DAIFMT_CBC_CFC) {
>> +			dev_err(component->dev, "Invalid codec master mode: %d\n",
> 
> Clock provider mode.

Sure, will update.

> 
>> +static int aw8898_startup(struct snd_pcm_substream *substream,
>> +               struct snd_soc_dai *dai)
>> +{
>> +	struct aw8898 *aw8898 = snd_soc_component_get_drvdata(dai->component);
>> +	unsigned int val;
>> +	int err;
>> +
>> +	err = regmap_read_poll_timeout(aw8898->regmap, AW8898_SYSST,
>> +				       val, val & AW8898_SYSST_PLLS,
>> +				       2000, 1 * USEC_PER_SEC);
> 
> What's this actually checking?  You shouldn't rely on I2S being clocked
> prior to trigger...

I've also taken this from the original driver, so I do not know the 
original purpose of it.

The register description is "System Status Register" "PLL locked status. 
1: locked, 0: unlocked", so presumably waiting for the amplifier itself 
to get ready for playing audio.

Regards
Luca

