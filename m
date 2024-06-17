Return-Path: <linux-arm-msm+bounces-22852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF6090ADFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 14:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 699991C2173B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 12:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833B61940BD;
	Mon, 17 Jun 2024 12:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="C897/DBW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A7F8836;
	Mon, 17 Jun 2024 12:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718627564; cv=none; b=TXDQ0QniKIh2WQtAHUSI/pMZA5IWYFnBgqeGrTJPCbU8mipPaURvgwFb5YLFVdXsMm9lZcihuorcHImG4sAsAcUlkJkfhkr4zyKjzltRsapcO3qH2nbYBSMqbw6fWsw59By7OjumquRlmlnS7hEZRUZpmyDoGOXbUTuUsS1F5QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718627564; c=relaxed/simple;
	bh=SZu+21b3EOadKSJGfSaiut50TflCHmgMEiyIEWkOcys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+sUb1lHRuZAosv/ZU6PEN6eWAv7ApU+kc52+LgpAcKp6lqkFp2ghHRFFqE83XqcB2mF1OAmrCxsXHa/tDlsAvbiQOS9ogpIuMKGMx0sOmwH1Ev80CLWfBp5BJqyNcmv6lkvsjvdqXqw6/AFbTPv8ZJ1POMZMk20iLK45IoGKGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=C897/DBW; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718627543; x=1719232343; i=markus.elfring@web.de;
	bh=SZu+21b3EOadKSJGfSaiut50TflCHmgMEiyIEWkOcys=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=C897/DBWZf1CbuvUCm5dAxJ9NPEVeHtsXU29NX/+eMumtMjGnJJ7Wp6HuVzQAq40
	 Wiu81HXcYrjpcDpccoFpEGHJfR4KiuA4KVwsewC63ogy8KloBcVm6AlTUamov/EFr
	 HvSdrAygEjibnlT0lfrw0jZrB2CmENTj60JUcgyMXygW7FtdDNf7x+4flTJ4RbXFs
	 6xscsA4pT03Z67Nr4J6uwyH0IJg3UOlriA6LUJZUHgVhH9rxP64u13EmOBLcjyWKe
	 SVGCe2MP9s6CkNwmfI+4EJGP2SX2vLQShjoWgW+8LKgjLExaJXvAeTX3pt3oJo8Ct
	 oKPBPKH6i7yScmVjXA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MZB07-1roiM21AYL-00OQmw; Mon, 17
 Jun 2024 14:32:23 +0200
Message-ID: <919c9f61-f884-4aae-9dca-9e0d863c34a8@web.de>
Date: Mon, 17 Jun 2024 14:32:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 3/7] ASoC: codecs: wcd937x: add wcd937x codec driver
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
 Banajit Goswami <bgoswami@quicinc.com>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>
References: <20240611074557.604250-4-quic_mohs@quicinc.com>
 <6e1dd5d1-8c5d-44f5-99e8-f42cfbdeee04@web.de>
 <a6d17f27-51f4-47a5-8798-37bcdf3b103d@sirena.org.uk>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <a6d17f27-51f4-47a5-8798-37bcdf3b103d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oDEJkjUPAIlsV7AVUDwOgL/buRmui/li+1rQnY3ZUutBcaSilQa
 2PfoBEenwXHssLsnbrpNbLdar/Mh6Eyngc73oReWAS965iNWMFL8SBi3iVl0l87RkJz+kS6
 ctOUUlfrXcboE7cb8AVxQj4+PTqAN+UwCfe/7LIgsXEgWjBWtAnqpC2ostWXFjToXgEjSJM
 5v4DO/wWq0aITpIRWIBcw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4GwFPzN+sU0=;S6bpsAzm4afugR5kRmJsyhi4MIJ
 n1RZ4mG0AsibYjNbATV4nsOoT25bKJS5170HqLLv0LLZBk10lDjvgU8LJJAFZdCeFtDUxyY7t
 wtM/XUhgAz4G8YX5A4doawtftrHLxkuB0gbw9mCP90sK/2IamTq/E48T0E/jkP4YZtv1qLrrA
 yEdDTCIkPEe0AEjm2l0grxbF8SqMKIquUD+8UevdHBk8HW/0cztWcYD0WK98UzddwivzXdrP3
 XCiUoxIHZU7FsLFIDG1a9aE1IdN+25v/pNO7HRPMU4hhq/F9OW5GIzKdGFknqYshV0wgoHROL
 77G6uHZTMyexC5BoE1cL50Wd4ni7Ty/Ok6rWUbvgoA8LiKSQslhu7Za7evqNlpcfT35jgqORX
 olGEsb9DdFat/UNzy79AWCjtMWI9cxh6/8YMrnoFW5BpKPmhn57MVTOEIOi8d/fJp3jvVv27r
 TnBM8cS/XMrAKX9D3EGIPZNoa8s6vL3zBTrs4IppxxsesONmlO55aZiNGYzyuHK+Q1UJMValC
 3jRpGJoNxmhf8ia54hZhs2/MkO+rK3Ebq4ZbRbmySIP8WDvTGVCQz5/uPRnZmimrbMydkT7rW
 AoUe2wRX5VF77w6Z6rYVpZ8KeARR6vUJBLA64HdakIaLOrZQOnwFRDPkO8IWSl3sVHGpTco5m
 y+JeUuyv1toUR/CWEH+XAakZ6mBkB2DIVbIgu+AxHtaT3kSJXo9xEtzAjxoOaQSxjMppzkXVn
 46KSqGnSxiRBZflddVv9HIXTPgPtu6DEU2BNsAVfiQ9h1umsmJ3ApumRj3jX0Zv/ew4+ncYzB
 C0auqCReTkzFbFksOdhFdZBg0qyVOJlhXRwdFvWfuGFEU=

>>> This patch adds basic SoundWire codec driver to support for
>>> WCD9370/WCD9375 TX and RX devices.
>> =E2=80=A6
>>
>> Please improve such a change description with an imperative wording.
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.10-rc3#n94
>
> Feel free to ignore Markus, he has a long history of sending
> unhelpful review comments and continues to ignore repeated requests
> to stop.

Does such feedback indicate that you find advice from the referenced infor=
mation source
also questionable anyhow?

Regards,
Markus

