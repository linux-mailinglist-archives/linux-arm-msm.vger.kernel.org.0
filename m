Return-Path: <linux-arm-msm+bounces-29815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E235962F09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 19:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B17551C2192B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 17:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10621A706D;
	Wed, 28 Aug 2024 17:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="b1jmHD6h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C941E611E;
	Wed, 28 Aug 2024 17:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724867574; cv=none; b=alFykV+1RDggWBfjZb9Ijc4SpKnIQrTYkPxUeg2nDbnyHFvhvG3ZZPvYR3GnvMgAma4Wu1IPXSQvTK+cdzdqaeMgJQhzQm8+A7qmq9TvAHYa/UTXlU+cyuRW6QOeW2c7wK1hRjZcnL/vvGfyFXUZ6bc5EhEfg58RG/MjQqLqqQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724867574; c=relaxed/simple;
	bh=/+xEV1s8pa3qhVql4gBdH5NqGH17G6AkQLZZCqV3jnw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=fP5KVimdTEaN2J0ZapaBHy6lMGah8PM/aocUm9twfmIpqv2Qnv289iFCQHXgPjV+rvsRldw5/fsGlmsu68XVWSnPK7C054yuY9sVF0WEkyB4ypmOxuInM2P3e10w6TeGDLhgDvDxgMcaITtY6ZGE6G69+T2nxhqAu98SK7Su5bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=b1jmHD6h; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724867531; x=1725472331; i=markus.elfring@web.de;
	bh=cWUC/Z3aG3WTiZLoE9HJ1x7Ols2sRq6uGOw77LkVo9U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=b1jmHD6hIaox9rfvqbbDG+U6TB0MhdO+wgDixGLC7fsPMW1qcJYfRP75b4eIVh55
	 jYikd7nQ7NoaWBTNM7d76DnK/oEFXhlPU0u9CfWBKIwGk/bjpu2Ug8hh+qkcZxg5I
	 w17mU5DDLatYS3TeW+eje/wC1TJxuhgKJnSh+YWdVXK3Sr2GNbJmlqZIRdeFtpiCO
	 0owF0P4yDCDijT5T2YqulQQgY7YgZXjVuCpedGvm0+74A+B9CVMifNdpMCcRHl6YP
	 AShNlvw0PiVjl/+XO3I29MxIOqHXumiKZLrLqu8ltdvhjkB+wjpMEydJx4tQvOyV3
	 FtoMpoBvnX/fwNvDMg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MODiX-1sTeJ018ob-00Ox9r; Wed, 28
 Aug 2024 19:52:11 +0200
Message-ID: <95cea320-4c47-4399-a615-295fc1129c04@web.de>
Date: Wed, 28 Aug 2024 19:52:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>, coresight@lists.linaro.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 James Clark <james.clark@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mike Leach <mike.leach@linaro.org>, Rob Herring <robh@kernel.org>,
 Suzuki Poulouse <suzuki.poulose@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, Song Chai
 <quic_songchai@quicinc.com>, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20240828012706.543605-5-quic_jiegan@quicinc.com>
Subject: Re: [PATCH v4 4/5] Coresight: Add Coresight TMC Control Unit driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240828012706.543605-5-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:B9MR2feQ+JQx+jGIkuoKQcLqjmbU63G9N5x9hY9ft8p2QcpjDGc
 jemUaRSRxROvOWhzJeq1PdJ7QVq5kpFPhngfEeRH7LcRbcL1HMOt6yS21ZvOjhTBBFdmQB3
 PmKQ28Jv76H++NfYkvG0FUkICIPwqKe+dx44zj1hV/03Dt8Os+89C+CDMRQoAGAzkejqrWQ
 kGVHEuY2g7Msio08n1C0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QrupnjinL4M=;McIiekfMC/E/uMXRZiCSjeWhmgZ
 tmBRMk6HspsXsXPcDnSNtWn5P1XNzG8m9BHNolksEbnbGNdpJMMPMTKc1J/4MnxwEpcoiVcjZ
 8PRHgWdzEIpTWyaWYE+gYqA8RAJ9Y4/wxNe4DOWTK3zoaGpsNFSNPFpyFPfVWv+RqqdmqUiCK
 xtIyeKhvBavVbcPpg+RdzovsqXVa2eDwEfFIkPCr9TYUjysdjZ7wIUaZ5rPnQmDCpm8aYNhla
 x/zqsaC/gCDQhV5QbJI/aIVZRslUNMozKVaWwLlLNo4pN/KmWsVpdTY2/0+/VZjb4Wf/OZw9Y
 4lVdv8ziQx29+TA2Y/sI6k2/1DfWNti0ILLhbpIcbw2hzObhovHt3R+TH2stp/tsmtQwvJV1m
 OqYMnNRmBt0yDyJovpEvsUeRlwFBRzeYsN9YCw/mfUeRhAk1VQwrjZ40+eR+JoxRSJ29NdQpm
 E11yDnAggzX252F+Jv6B9W/A0zsOLumm0ZE6E/BVHldeTycMtJJUtYwvW81E46fxB1nFsWr+3
 3weT+X6LUnQHBR+m0aHUHCRMOvUDgYDvurTixm/Fnwb8Vu7obl7YAaq9TdH9rYQWi6xEfDeV4
 Ha84qPlZP/EtQIrwqyi4pdqx2oI6MYVT/L/434YRE1N1vfXiRoPG3aDoJs6o+I/dxMIe1Ds+n
 osk1rmWSX4jAQFzfn2PpzXznffT0Yq9A/JsWTC3be4X0LZd/B6jjzOiUve1v3mOLiQY59MQ8X
 eNl80K4d1Cl3wqemrOeL5UZ6lMP79WaiLECUcDz9hjUYdiINd4GC+4u/bmlzxpWzR9EoEAgiM
 rJqbHb2dLD7S3FryJjFQVSuw==

=E2=80=A6
> +++ b/drivers/hwtracing/coresight/coresight-ctcu.c
> @@ -0,0 +1,292 @@
=E2=80=A6
> +static int __ctcu_set_etr_traceid(struct coresight_device *csdev,
> +				  u8 traceid,
> +				  int port_num,
> +				  bool enable)
> +{
=E2=80=A6
> +	spin_lock_irqsave(&drvdata->spin_lock, flags);
> +	CS_UNLOCK(drvdata->base);
=E2=80=A6
> +	CS_LOCK(drvdata->base);
> +	spin_unlock_irqrestore(&drvdata->spin_lock, flags);
> +
> +	return 0;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&drvdata->spin_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.11-rc5/source/include/linux/spinlock.h=
#L572

Regards,
Markus

