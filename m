Return-Path: <linux-arm-msm+bounces-22774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51557909E9C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2024 18:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 600491C209E6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2024 16:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E981BC57;
	Sun, 16 Jun 2024 16:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="LRYU4Ya/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5081217BA0;
	Sun, 16 Jun 2024 16:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718555970; cv=none; b=SWK/hTjJuHpnSE8ZE3hLyUeTPFsI0sM97daRM8FD/7f0Qeyk9/d7hDAgH4ElFtCyTiGivHxB6hllidFBI5LgikPiwMFZIYd1sXXolZ+Iay4rD57JNToc8VdAoT8mPNiMqU1CZVKFgvYkxwgqB0xxnlb8K17/SxNGAwM3xU5kyC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718555970; c=relaxed/simple;
	bh=Ve8yIU93CqGV39jXDILXAr1Dw2HZhuoVS9gFsFaAPjY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=V8fA+vnXFjuRBVWl5+gIc/+lJMcXHrnb23q1kQgd0Rq4/kQfQVdIErX6b5dSZp4jyPiRcWA1/fN+k1Ht+y+MgVsYu0uCfkiDXuB/hg0rGk4R4pukcX1RF6eShV5LKSsHRjbf7aAYEZq5tpwLVBP1x0lfWIxHXxTmJbiyBP230vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=LRYU4Ya/; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718555939; x=1719160739; i=markus.elfring@web.de;
	bh=wudiCjAOYzPYvYnle3vZvnR9d5fYg6NR06qnTJaJVK0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LRYU4Ya/NlKd7Ue3BC6ogTAICvgU+RRa9ZKQIFZKyE6ST0eN7mG+GQ1UXVW/5X9f
	 T2JQvdVjDcBE7uXeG3jpRDpP/kVpgUMz7Ol1bAUnvViSiah5tapnoJesX2WqTq/wU
	 zKCdtkDq7k19BiLMPyCZj0G97IMITHKS2g330UAos3y2NXzRs0vvS8wrFw0hhqPkY
	 vHfKBMxboFRt5E0mRkGifg4go1jSLaNfmd8IE9FICzmoJLgU2uuRB1dP2Fg/BBnq9
	 BcYh2J4oHr6kfmj5HTIK4A72iBe2dJd4NUrE3p6QacJ0KulLMNvekKCcRyTDKB1E1
	 rWnlWsAwxpy1884N9Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7Nmq-1sJyJD2UqS-00FC0k; Sun, 16
 Jun 2024 18:38:59 +0200
Message-ID: <6e1dd5d1-8c5d-44f5-99e8-f42cfbdeee04@web.de>
Date: Sun, 16 Jun 2024 18:38:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Banajit Goswami <bgoswami@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>
References: <20240611074557.604250-4-quic_mohs@quicinc.com>
Subject: Re: [PATCH v6 3/7] ASoC: codecs: wcd937x: add wcd937x codec driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240611074557.604250-4-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DxjFdTY6dURt0KEX55cU8ZQXbycMmIZXVImma0+UYHSWLc+e/Fp
 uofnWVfLZSwRA42OKWA49bvBypqU2bLZmL5Tm4RfVjZqJxGSma6umsikvlaSwdwT8STBOOU
 bjLAq/o/pt5Onqa0XiaTx8dR9gytaRtyQgPG73b6wYLQqpF8wC6XkfwZzgt2X9xQTxexBAl
 pzJTx6Xwd/XWG8QcYuBgQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yMyHnsAA4Lw=;9MPvPvd28adjFquP7iieLl71KLY
 hT3k0TZ40I8hMXmZBOihrEGMPtQdxP/3gRIeK2aFeBy21jjAqqdFNf4JzUm2K8F9ZZhNMUaw+
 a1y1ld9aGoEMJTeF5+R9XwoqX4+qaebaxPxH9AdFs5x7rC2MQZryUcBwuMuuqTustPY3Z30Ni
 Rp9KB1sVGS+fjKUEcU4gmdbKx/3EU4fMQTnUjAGqzXNAepC3L40LXzUIakmKQ4Uvz5vYcM0FV
 FeFjkbB2urvG7h+9yHN54jFxtYVgYQJPMKQxLM+3AadJ65jeIEw2HfgIp8miRF7UBeqFnWAfw
 w5k8SVVn7t08yvg+6G0TFeEGnCthuTl3XTOqg8rKO5vg5Jkllo1A4nJqyIhi0QOaTITdw5h/Z
 HVL7aqyDsK1w5aG3jKzsQ4IDW0pfyl86GmTsbZox3pg6vgwwEKUSuuzxIDI7rC/hYGx018pjT
 M7TKifdfxCX+PUR33Ms01abxgv9DMewmbQRqZEk/aXmtcWkPpSpwo0m6pXnrZSXHs6FGysld2
 le2swTUllZ9P4Tq9b2D9eeEurFeabzr72abDmO2hNdVIYzIhA9eZUS5KUabjqgFe9XduGKmkm
 pDmtUs7SEImSX+Gyb951McPqMj0xa/7Y0wQbr85bmiX55j3f1TXolY0tYkwZaIxdNHUpSd/at
 gXC4QYo+mA+VRKNitlQzquM2omOtvyeBEmrG8/l3irWT/KToHycR9wrWhF0a8lrhUNxOfsJlP
 fJDG4406/B50iLFYVDy96tORt3OFSlypS1v9I4MXWMdtGxCMjCnr4dF+Xr8Wo7OnjNIwB45nk
 82hlsm102bNohgtfzb/tLtxPo/ZNw1/GAIw5LSktA+tzQ=

> This patch adds basic SoundWire codec driver to support for
> WCD9370/WCD9375 TX and RX devices.
=E2=80=A6

Please improve such a change description with an imperative wording.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10-rc3#n94


=E2=80=A6
> +++ b/sound/soc/codecs/wcd937x.c
> @@ -0,0 +1,1677 @@
=E2=80=A6
> +static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *c=
omponent,
> +					    int req_volt, int micb_num)
> +{
=E2=80=A6
> +	mutex_lock(&wcd937x->micb_lock);
> +	/*
> +	 * If requested micbias voltage is same as current micbias
=E2=80=A6
> +exit:
> +	mutex_unlock(&wcd937x->micb_lock);
> +	return ret;
> +}
=E2=80=A6

Would you become interested to apply a statement like =E2=80=9Cguard(mutex=
)(&wcd937x->micb_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/mutex.h#L1=
96

Regards,
Markus

