Return-Path: <linux-arm-msm+bounces-33369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2850992CEA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A91A91F22B56
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 13:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0641D416B;
	Mon,  7 Oct 2024 13:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="DxLrCZaH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5AC1D4152;
	Mon,  7 Oct 2024 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728307012; cv=none; b=gpzgwfebuSyaiZ36zCGW5/NvtV7jYss9ee0OEXhx4e9O61GpCNxnwceYO86D+R/Ndj13jJ8nQvqySez6eUU0HmQSfqYNX2ZA8afTJLegJRHac5s8PVejHOaQo9JvxxpWFYzAkxvUIVTT6OwRmqfpnyjjLtS00w3474oexjr6q28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728307012; c=relaxed/simple;
	bh=FNqFbT+e3g5173pqoULGRwQfOV5dySeZGQTKTolzwsg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=SSXYK0yuOtBtNZjALjD7Imo340++cfzZgM57yrarki+6PfPFu17sazke6jnHPQlBX09plguMYP3EMXPtnKL5wcngfAx+Y2xTBxcvdsBzX1kAcDdvvGVyBYsR7fr41Wamu51Aai5LymZ/+vpWNr0eaKCO00uRAIaZwQ5jt/DWEFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=DxLrCZaH; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728306989; x=1728911789; i=markus.elfring@web.de;
	bh=mQy4pPjNTV885xcZQDMYohl8lP4cbtjvUxvu3rApYuA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DxLrCZaHDeGLYEOiK8c2Vk30Mb4LR41XlVeZPpFEZNEm2BQyq/N64dm11+A5gPwm
	 ILaBAZbKjUvPDj64PYZScrz/AXWHAAmiTefvgvro69jQxDNx+a2IW5RvIASdjkEYQ
	 9k9JJ/nZpJcveaDSUQSrCQDSZ5X5j9W/f2aZvYCJUS3O1QpWP0H4j17wG6gsXMltR
	 nxYW3ZzHfEypI2PfEXvI+dUnInU/7797UKTBlOrmvpenTnW3QlMgLNskyGO9ZAROK
	 z/G1CP5tDWZ7rF3GqGkL1ucBy6WNNHom5QGtvThYaVFEVPGpN81RGMgtOzdbWGcld
	 pLpQ10E6xgv/zFsBAQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQPdr-1tJR5Y1CwT-00QCqm; Mon, 07
 Oct 2024 15:16:29 +0200
Message-ID: <9be6b874-0c4d-4100-887f-0aa693985715@web.de>
Date: Mon, 7 Oct 2024 15:16:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zichen Xie <zichenxie0106@gmail.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Chenyuan Yang <chenyuan0y@gmail.com>, Zijie Zhao <zzjas98@gmail.com>
References: <20241006205737.8829-1-zichenxie0106@gmail.com>
Subject: Re: [PATCH v3] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241006205737.8829-1-zichenxie0106@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WzU7w3XWp2SXhsmOcZlwNr9fvxw31LHhoiTmrXcKpjBjfriuBTH
 5DdRFP+RsFEHaM5xcmf4Gi9u/S9FSD1+MgOY8Ed6IQYUMMhIHuCeeKirIcvboDzOB8v8IdP
 nrqKGMVB6z6jT9WFby3ak1nYQ579QC2d/4ogrHjn5B0Z6ve3FEI2OJTlW5zZfpQ7keBjUD2
 /HcSsvvEUJGC9Mbe/gX7Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y2fzS37A3z4=;s4W91ovM4BXEgiIKlmPKd8AZ6cI
 e0qes1dg4h+z2fEe8D1jWmbzYEEgzUMQBYVmuHyo2+g18qqnBzdVL/VINWQAcHvIYiiTIGAR7
 YHB+VFjC0ULlXE5lwB+ry0wfBcpZBs7b5GGtNc6hTIttu5ml4E5OvYdkEhpWpZratfvOgBDAC
 edTGLcynkIzLF2HQQfSNew5A8cduGpHFb2SZSQfwLnzgBf8OVHqViD2YTVphYCseq2zcxg9dl
 eUCMFE2gg72hvz8NNdsDAAldFhAyxXO5EhRMHvnnIiFMq2VNeDJ6vrbZjjdQxV06BgmF9pUBk
 DTCYdiFxt8PzfwT48LBTcmlkFveEGaSm0SWSdqwY3uf8SSnki0sdpV4CAIYb3urkwLPyLw5ML
 Vd3an7N9zngKJnncoXYh6EL9yUX6xcPxxpGPKNtU8wFmU43C66B2HGrs/4F8ZlD8TYwsHfiBv
 oOV04fq1uZJl+HSLNyoBaYIxLvU+koRPCfu4TW+oN/xhOzDGXYKRB85mb8CvFNV064YA8XlZq
 XxrdohwVRVW1BAD/GR51P/xKK9enRixRpWkTkFJYQAqRDr/cU1XDGsaSsFRhkZ3uCUYiTiFdj
 20Rh1iOOXvQqjtvqNCRO8GkXmx5W8wPhF6XtzFecw9MPBAYCVlcvqeJibox3MAPvFSRTMSvx0
 c4HOJwweQRLEYUTm3YUFW9j4DMRDMUk3JfUt2ghoP/mgL3B39jsDG2hwT6BpulLkWrh/yRlol
 5PT+xn3iq/dL+xjFIX911fLkipiwqffhySHcxAdfUYQytkFF+s4DA8RaIxRNwEn4F+0FyFq32
 KxXS3g9/8TLWiJ2Nl78beDGA==

> A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could

                   call?


> possibly return NULL pointer. NULL Pointer Dereference may be

Can the term =E2=80=9Cnull pointer dereference=E2=80=9D be applied for
the final commit message (including the summary phrase)?


> triggerred without addtional check.

  triggered?         additional?


Regards,
Markus

