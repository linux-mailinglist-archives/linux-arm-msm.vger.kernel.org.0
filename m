Return-Path: <linux-arm-msm+bounces-25496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAF792A355
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 14:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C9761C20D82
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 12:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8E4824B5;
	Mon,  8 Jul 2024 12:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="haGMLV7W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207043FB94;
	Mon,  8 Jul 2024 12:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720443400; cv=none; b=a1kNKglvQWOgThOwClHGySobS6R4TEw9vJTNM2jB/lXBMHsAEs+uFTORan64uIZMTTZEEp2tQsB4nZ5jiQP2L6WHLcebO8WI6iH70RX6r/MjHhYwHyce2AMqI3LCqQI7yYsnR6T8Tj9RgXJQ+e68CB2kAOR0g2tsef0fyG/zyBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720443400; c=relaxed/simple;
	bh=YP6mymNlWZ5SGJixLioe0N67MG1oonmAdwvp7laxP/s=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=dAh+p1rlr5PVnTWXpJ9/mlvVf0ajYi2NPjt/ZJ7bd426nkx5VVPGlm+i6eRhrEvoETwOieUs0Op86qmdwA+nyxocqFlgmChqg0gVpNR/em9PfKYj87mNfH1muBNg9jybg0Ijt2oO2zZ2XJ0SWKsqFvugSUCmbClqYH8l3F8WTTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=haGMLV7W; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720443379; x=1721048179; i=markus.elfring@web.de;
	bh=AFsq21pzBB3I32VUxpbDobQ6NOFvMJ5Jnfv4RTcn+lg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=haGMLV7WpePPC/OB/uZldXBOHXTKR3gqAyQDLwdoq6fbbozzGgARqQYKRydYr0iX
	 R1maclf+OdSvT7riBMHknUBSLmzeSxPNVwfTuxH9+dCYNbDgDKkNmX/7IQZwkxUCu
	 M9hERWCh9Z6rl5xCNPXkYvFZ3vHBXVn6d//RYyGGx4ye5+xqswhnXaZ4qIoJiGD1p
	 XjqVnDTmSflDxPT2e24T+MpD246oB8xX5d2FNqzn5/L15ucHJc2QfbX3Jl8hWaOIg
	 VaIn8/9XDzEJRR/Jpbr820mOw3oXk+rUPvUUYFMtlWbq5ln4VU1U4sS0HKdKLGGfW
	 B/8M1VajjyrFWi1IlA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M5QqN-1sRdGI0vH3-00GwZf; Mon, 08
 Jul 2024 14:56:19 +0200
Message-ID: <10cff397-af4f-4649-994f-309203376f42@web.de>
Date: Mon, 8 Jul 2024 14:56:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 James Clark <james.clark@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mike Leach <mike.leach@linaro.org>, Rob Herring <robh@kernel.org>,
 Suzuki Poulouse <suzuki.poulose@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
 Song Chai <quic_songchai@quicinc.com>, Tao Zhang <quic_taozha@quicinc.com>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Trilok Soni <quic_tsoni@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20240705090049.1656986-4-quic_jiegan@quicinc.com>
Subject: Re: [PATCH v2 3/4] Coresight: Add Coresight Control Unit driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240705090049.1656986-4-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7WkijsB2gTSSPyJ7H+MItEif0hriT4lLW7yGijm+/aiCZZ0MUCs
 CVuqlTCqrCvtbBTPXc4qM1lmzEGG0MV+QgDYiB/ROORRAgwLVMRhlWSDXgfGdaeXZ3uye8n
 Q7ZZaC3LDw2SRpFL3V+KTfU3MEhnZdT5h7XCJ9vHD9GkpqmOasEfAEzPHzIrInpZFn8hIm7
 6n8csU9n3ACg1eahAkANQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ugSciB4Nclo=;HBZRS/QjTtROUiFS1uPzclUgXBO
 bQawFdj4sGC8o2TxnSx7i+CwMJatJL0KOh1EWSPY0K2g6+ptGqRN3Xgv9PTOAlqkDgIVcBWe6
 pqJG4ytUqen+IBiZIIVKnZSpqznGE6AidIG0mQ/Lxk5ychVXCbcmz/Kg1jEu04mzfaS9CBrx+
 HaNdkScGkcZi38+nTfOJeCBEth0nIcHMHCo88Yo3hfAoU0+fMgOK7kpQ003qXUCPqT5HX5kCh
 b49jARzMuzpEhy+NawjP7UjjiuJvm3JE5+w5VlpBFJCFEabTNfTIBlSehXR1lav6Uhbd3bT52
 RlpBK1b/3miVDAzELi195hZTiWZYAk0NZ0T7Oe46cl/+dpmEXn8qR0fEWw6pO46HhyC/WMpDc
 ViyiM1tv1cSSS6YIUBfLH/OQ+JGQCVi/wmkY9kmXtQxI94rPTXhMxRWxSUherpKJLrClDdu/d
 ro+EyCWOOqw5PUXjwFrdxA1ws2cTD6oNI6wQCDy8K0Zmov8oO9a9ylg2ISmPtrLYAhrF+mRiP
 v0Capt05sowIs12rj7DehW9QMVrZnRnbao+qotoO3/C5E1Uz8JnNuCYAsOVljFRh4IZus4FdD
 Tapl/46huPsogCUdFU4K3dkPcGbvz5pC9bEsn6X8F9zhGEHQKRO1JlWCcxMGpfDMUjeN49U4Q
 rLC7S7A/h2jKEt+JpDBS17ttpUkWPuXvn+fXp8ZZ8NZ8xZY5h6yM2JBoQMN881aPVtDeJ8UkR
 CUxYagVE+GegjVGbt7Mc1vKan7zFwNbKCnt7vKAxTAnuJR3E9Sq5l8Jvc2/ae9+pnrMLJpSB1
 mXzdodw6gXGlPV0abqJyEA/QyYF7Bb2bSZaTEWHTPqPUY=

=E2=80=A6
> Disabling source device resets the bit according to the source device's =
trace ID.

How do you think about to improve such a change description with imperativ=
e wordings?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10-rc7#n94


=E2=80=A6
> +++ b/drivers/hwtracing/coresight/coresight-ccu.c
> @@ -0,0 +1,290 @@
=E2=80=A6
> +static int __ccu_set_etr_traceid(struct coresight_device *csdev,
> +			uint32_t traceid, bool enable)
> +{
=E2=80=A6
> +	spin_lock_irqsave(&drvdata->spin_lock, flags);
> +	CS_UNLOCK(drvdata->base);
=E2=80=A6
> +	ccu_writel(drvdata, val, reg_offset);
> +
> +	CS_LOCK(drvdata->base);
> +	spin_unlock_irqrestore(&drvdata->spin_lock, flags);
> +	return 0;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&drvdata->spin_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc7/source/include/linux/spinlock.h=
#L574

Regards,
Markus

