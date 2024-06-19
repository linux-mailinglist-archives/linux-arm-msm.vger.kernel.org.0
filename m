Return-Path: <linux-arm-msm+bounces-23289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7FC90F7B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 22:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DC612845D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 20:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DAF615AD99;
	Wed, 19 Jun 2024 20:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="k/LdAn48"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr [80.12.242.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A019015A875;
	Wed, 19 Jun 2024 20:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718829944; cv=none; b=YymmAfXa6mMF9N+/ResEmJqx+Suds6mzyuVzpxzxgjpn2Rscm/lUGjhesdHlkPIaI1K1BQFtp9IQ4bubDSt9H4AFD7FesfSbm4/Wymh6yY+8biLl1r0GumvFsKHdng8wXgbWI4GGGDfzJBQWnPB9Pl8oJdzpWDFKb3ctrv9kGqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718829944; c=relaxed/simple;
	bh=pS8lzvJ4CpcgfQaJff8VtAHN+nKsoV7ysP4T1j49V98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KVKMKN73nKoY074w6Z81ydWVs1NNcJAwDidcBV0I3SVlvfuCC31e3Vr5F+O+CmccaiHk3BBIrIE15BGLZETMxUaPtI6sRslIC9J/pDbtdpWS8NqfFuIs2Vjg0zmgMy2TLVCDUqQ9XZJ+iRjzMrSCdIiiFbthnvW5RTP5Ykk3A0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=k/LdAn48; arc=none smtp.client-ip=80.12.242.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id K2BMsLovPJk5EK2BMsLlKP; Wed, 19 Jun 2024 22:45:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1718829934;
	bh=BI0l24CYzwU9Qjet60SgYpejzTHPgIlrhe+10WvNaFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=k/LdAn48yWPg8B7gd4Cxhb1A7xM1ogt+/vJr9adNiZzIhxMLmNNnIfMZj4x5U8NY9
	 Xx3AijbEKUXvpXbt/pO94zr54rcpzJbMffEDBKMkHdrlvd08gzw0zTxiMjuOpgP1AC
	 rOrucKgnfER/GYheAN9nuUHjGpTddoHgkjC5VDq5ClmneN5YVpsneJzIer5LowCajM
	 UZhKy/yaBDj+m058Ruqc1snQc2k7uTPDGiNCzvqHlEDr++PrHANAmkLXXqShLr0KDn
	 ZWVOMu2iGceZlwq/rWcwjNornvarIBKBpwzsf81JSuePZcKt43v//hceCZDmLI3X9V
	 qqCEEyPbkp9Ug==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 19 Jun 2024 22:45:34 +0200
X-ME-IP: 86.243.222.230
Message-ID: <09ea3565-9a0d-45ea-b12c-de79d3fb5efb@wanadoo.fr>
Date: Wed, 19 Jun 2024 22:45:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] ASoC: codecs: wcd937x: add wcd937x codec driver
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_rohkumar@quicinc.com, quic_pkumpatl@quicinc.com,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240611074557.604250-1-quic_mohs@quicinc.com>
 <20240611074557.604250-4-quic_mohs@quicinc.com>
 <2b92c0f9-2595-4b73-8015-1abb825a61a1@wanadoo.fr>
 <f741630e-f9e8-45e1-b3e2-4866f0baeac2@sirena.org.uk>
 <288156b9-2f72-6929-3422-c3aecb9c2c07@quicinc.com>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <288156b9-2f72-6929-3422-c3aecb9c2c07@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 19/06/2024 à 13:02, Mohammad Rafi Shaik a écrit :
> On 6/17/2024 5:25 PM, Mark Brown wrote:
>> On Sun, Jun 16, 2024 at 04:54:58PM +0200, Christophe JAILLET wrote:
>>> Le 11/06/2024 à 09:45, Mohammad Rafi Shaik a écrit :
>>
>>>> +static void wcd937x_soc_codec_remove(struct snd_soc_component 
>>>> *component)
>>>> +{
>>>> +    struct wcd937x_priv *wcd937x = 
>>>> snd_soc_component_get_drvdata(component);
>>>> +
>>>> +    wcd937x_mbhc_deinit(component);
>>>> +    free_irq(wcd937x->aux_pdm_wd_int, wcd937x);
>>>> +    free_irq(wcd937x->hphl_pdm_wd_int, wcd937x);
>>>> +    free_irq(wcd937x->hphr_pdm_wd_int, wcd937x);
>>
>>> These irq have been requested wth devm_request_threaded_irq(), so either
>>> this free_irq should be removed, or devm_free_irq() should be used if 
>>> the
>>> order is important.
>>
>> Yes, this should be fixed.
> 
> okay, will check and provide the fix.
> 
> 
> Thanks & Regards,
> Rafi.
> 
> 

Hi,

just to make things explicit, in case you missed it: I sent 2 comments 
in 2 different mails.

   - the one above: 
https://lore.kernel.org/all/2b92c0f9-2595-4b73-8015-1abb825a61a1@wanadoo.fr/

   - and another one: 
https://lore.kernel.org/all/834d31cc-f4bc-4db7-a25b-f9869e550eb6@wanadoo.fr/

If you give it a look, could you please also check the 2nd one?

CJ

