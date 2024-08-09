Return-Path: <linux-arm-msm+bounces-28258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 188CC94D755
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 21:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DE791C2146A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 19:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86CAF381AD;
	Fri,  9 Aug 2024 19:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNQiG746"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3CBA41;
	Fri,  9 Aug 2024 19:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723231921; cv=none; b=S9bhfTspnyxhXZGlbJnznfYmWMncFzBWC0v+hYomGWMFv+rIjTjywjdv0v8C3kzDFxqG27cqucmUX4Eq2deuh6vzWoLjqC+pO4WWGCpb+zN456D/8DIne/L3hlpxRVMizje0Bef34JWwKHlVtxc+frAOy9dzj7rUrh299n9SsAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723231921; c=relaxed/simple;
	bh=Z8Bptl+71weUnjMsyHX2MTnzwIckzoc5DzXu0D3tp6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MUeI2k8JCHpQLNSt1t4O8IKrbHTf1MF43vInoRFy+Lm+5xkdPNuUchi+X+886iK0ibONEP7+NWWN+DGB2I9bkCIWVuJp2NBrDn6KfzG1DsDM1NO8Z7URN9juRTrgykKB6kg9dX/Gu9mshRrcCpWoT+hcJWeYNTp9tXFsxvE4r6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNQiG746; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52f04b4abdcso3527582e87.2;
        Fri, 09 Aug 2024 12:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723231918; x=1723836718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VITcg2JB4ebTYpwzqfOR5OkOphumGh3Os/L25Fs1FSk=;
        b=GNQiG746aSMF5qfBiY2ShN5pmmwHI2G7cMWu7JwR08Q8zo+OksQnor3P30M7EWzfqj
         BUZW/E8n+B/rg0MZGHm3JX/Xq4gdWJ3kWEnK4kAt/CDVfNuqLhf7Izw7SINg5VooLukn
         CpjZHRc/hjC+gp0JkA3GXSblko0zzKChBZDihcp5HzEl9652nS9xPC2mht+ZpJWtFuF/
         3NY7J/suMau7I9XwXfBPYo7U1Yuupoyttv/Rk8pu1HX8AJ5TDow8vHDbTM8AAcKKJBPP
         gX172wmX0HcWTQ5JmbOurogndSpfUfCi3U+GbQQBat1AK3F0JZliEcz9bokn1VMXtpDu
         3FNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723231918; x=1723836718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VITcg2JB4ebTYpwzqfOR5OkOphumGh3Os/L25Fs1FSk=;
        b=rZw/cI8kYalaBz76E+YYhI/0RUd9BFaCGLWL+qmsWO33AdhIbtXX9r/VLWsZWBblZ7
         xlUsy7FzdZto+fkwbBcIKcT247iCZqFNZun9LeBUOfNjgjIGFZtVe6vBYYx/800PHyj/
         VzPCacrMRszf6obDeLYEyeCF1p9tLaOZcahBMLObpHb1qIbYcyIuPyVphXm/nFnUupX8
         6NksHDq1rwpr5BnZRW8zNgbpcdf2VQyTfoYpl2GSO3S6/dJf+Cf9nsZoPADa+UN0DBRL
         Uf9/ECKiWMtc9ROrdSL9cIR6qbL/sqh5RooeZdn8jiKP4Yb5kAg+QOSc8oxqOW2TMSra
         tkNg==
X-Forwarded-Encrypted: i=1; AJvYcCXnGfZTrr91HHnkCl5RzyR2pO6YrNocyOgSFsakOd7JBsRHvr+e2B2rXiz/Ymsk78ALUrIN6vwW2z2OfBZVsYdeGBDGj0EF4WT/rRdXFG0IH86j2cvroH6nENqMa7f4s/rHdSFr7Qqoc4u8RtlR+RlidiTvWGmPLNmIFQV/WeET6u7y9ZHt58sgYS0Mrp8Qu/Buw59VmY0yrZoZ/0p3V3Xf9OuDHw==
X-Gm-Message-State: AOJu0YyhnzAGOkXyR2W4JFiNtibUtcdKTY4vZuI+7uex2206M9D6vExV
	hC7GgP0zES58bDVlgpjcWcKRsxbVLMB+qwNbdMGxzkzMSiDgS0iu
X-Google-Smtp-Source: AGHT+IEZZsOEzp4Al5LE7fCwp/ly55/+1pBPiX1vVF7xSc8+G0b5Ei5+RKBJQUfEphDPas9pOvnYiw==
X-Received: by 2002:a05:6512:3989:b0:52e:9382:a36 with SMTP id 2adb3069b0e04-530ee993e35mr1936647e87.30.1723231917565;
        Fri, 09 Aug 2024 12:31:57 -0700 (PDT)
Received: from [192.168.42.76] (public-gprs548729.centertel.pl. [37.225.6.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200f3602bsm12316e87.239.2024.08.09.12.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 12:31:56 -0700 (PDT)
Message-ID: <a109d7a3-bfc8-49ea-8ca1-c7b1c517fa4f@gmail.com>
Date: Fri, 9 Aug 2024 21:31:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] ASoC: qcom: apq8016_sbc: Add support for msm8953
 SoC
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-6-163f23c3a28d@gmail.com>
 <ZqtnyWAXTsSGAg0i@linaro.org>
Content-Language: en-US
From: Adam Skladowski <a39.skl@gmail.com>
In-Reply-To: <ZqtnyWAXTsSGAg0i@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 8/1/24 12:47, Stephan Gerhold wrote:
> On Wed, Jul 31, 2024 at 05:25:30PM +0200, Adam Skladowski wrote:
>> From: Vladimir Lypak <vladimir.lypak@gmail.com>
>>
>> Introduce support for audio card on MSM8953 platform.
>> Main difference between MSM8953 and MSM8916 is Q6AFE CLK API
>> supported by firmware which influence way we set codec clocks.
>> SoCs shipping on at least msm-3.18 should use v2 clocks.
>>
>> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
>> [Adam: rename functions, add msg]
>> Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
>> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
>> ---
>>  sound/soc/qcom/apq8016_sbc.c | 43 +++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
>> index 5a29adbd3f82..3ed35beb671a 100644
>> --- a/sound/soc/qcom/apq8016_sbc.c
>> +++ b/sound/soc/qcom/apq8016_sbc.c
>> @@ -22,6 +22,11 @@
>>  
> Is there a particular reason why you decided to hardcode the
> q6afe_clk_ver for the SoCs rather than finishing up the dynamic
> detection Otto proposed [1]?
>
> This works for MSM8953 but there are a few SoCs like MSM8909 where
> both clock API versions exist (depending on the firmware versions).
> If we want to support them at some point, we will need the dynamic
> detection anyway. It would be nice to finish up that patch set.
>
> Thanks,
> Stephan
>
> [1]: https://lore.kernel.org/linux-arm-msm/20231029165716.69878-1-otto.pflueger@abscue.de/
This probably sound obvious but i don't understand takes Srinivas
had on these patches.
On top i don't feel good sending code i don't understand much.
On a note i managed to slightly modify fallback commit
and provide match table translating new clks into v1.
In theory if we want we can drop snd_soc_component_set_sysclk()
from soundcard driver and use devm_clk_get/clk_set_rate/clk_prepare_enable
to manage clocks provided by q6afe_clocks.
Biggest issue for me is lack of people who i can even discuss with about,
even here i fail to see much feedback.

