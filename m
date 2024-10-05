Return-Path: <linux-arm-msm+bounces-33186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D189917E3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 17:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB3371C21333
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 15:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7081547D5;
	Sat,  5 Oct 2024 15:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="FVAI0//E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D1A1537C3;
	Sat,  5 Oct 2024 15:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728142894; cv=none; b=RkOkJxfGQzYg9NxdR03rRLilYHCB5pOlBRLwxAEihXxPGoJ9KXHSc585pb+pzhiCUYp5Wl1uDCoaxzrjPZaIaaYt/fIGtq4PoPFAMbG+AqmxZvd9Q+k507mo1u/2SbC2/r4HX2N2MQ0jyujhb7k9kgwb8rgq7OcovPPolZ/B5r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728142894; c=relaxed/simple;
	bh=AA1s0Ci9ozC3WMvOPZhiXoxjx8/13qajUfnk+TtR2Dw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=SCHdZxfsO2EgWqaebbVzn0M9QET40Db11JW4ZLo5RLDK04cqGbjHam8sfRtdsilq+gpC9jqocZBTlo7eZ0doZf/aZT/Z2j0xoYCuASyy3VbCehoiEXnr7XzvNIztGhvCRCVDKmneqyvcMP7+48xD7NsCAqf1OfYDeZvMmZqScFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FVAI0//E; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728142854; x=1728747654; i=markus.elfring@web.de;
	bh=Oix7kgCYIxahefd/lUj+gnr1RHpaKFan/VSKFUUttN8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FVAI0//ER12gz1M7bLVJ/lh4FsxIyFag9DguyOlhqNQ+fwfW1OUcCfcGv2ZnhiaF
	 UHppkjlpbFDYfwNl4f1u+hODZsjpquibgzXWkxtqnr08fLzpv7jBEgNkMdUMdK2HP
	 zOL1pcwU06YBNtSCUSOzAB0bY6s7NV91EFB4Hxgag4uh+SSm5zY2RSkN/5TBBAZ0T
	 DQTc/tKcuoYJvZ8OhfryRkq2RH5GbSgAbRa42dPoxg1IXcIau286GhocJoA1Ok10W
	 nMcRRs6t2bLUNHokMxsBe5ch2MP1bpOU0TkzM2LBeGaKna6ASqgf6FCZujl+22SfB
	 P2OXGaueW441TC7AFA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7Nii-1t4mPS0pQ4-007G3r; Sat, 05
 Oct 2024 17:40:54 +0200
Message-ID: <ee94b16a-baa7-471c-997e-f1bf17b074b8@web.de>
Date: Sat, 5 Oct 2024 17:40:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zichen Xie <zichenxie0106@gmail.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Chenyuan Yang <chenyuan0y@gmail.com>, Zijie Zhao <zzjas98@gmail.com>
References: <20241003152739.9650-1-zichenxie0106@gmail.com>
Subject: Re: [PATCH] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241003152739.9650-1-zichenxie0106@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FT4PekDjmBCyGrkec/hi9y9+Vtd7tCvznDoAvaVISprcWUYWco5
 dJbyXoyXbt2zGk67OyaHeIwv/Xb144QRPihS/t4Yl9apcFWPRdSKd/+93kPyVXvSYx3XhS4
 a6sk+QiMEFj2cKaa9jgLqGnQJev9X2aPIOZx8vO/D6eEWZtvG9XkN/RJeWXfWqS0Acz8g4o
 c/TG5MdrUGOBS7nSQ4dBw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bfneBKFioX0=;dvCX7e3cyPK+wwLkUpKtVO0gFQ0
 siD6L3fS2j0Zb3oimAznmc/nfvTKyk/4/0mzI7hUAIynBqh3QQLuxquVN0W5YumtrYP97/xSu
 Lz2Rd1igxLGRhyCdU36y/SWMpzQGy1pfctepFpQ+LL9mFRAyu/PnspTfc1u18QtJc8aaSwbpf
 t6SpJpn5bxHcG7I8ZUKdPlCDOhKzNBVtUMWLVLPAPyw/PdflZ4cwX2lmdGY9Vi3QhCJq7blqk
 Hbaj3XFWTEa2MgVlSKNx4GUDgqLDseRSQvGz0ZlZpQgDIVE5NS9o6Ow4J85QRt1V2Yimo6H//
 4OLJrzyCNRiKHakvbhYjTBtnB3MpD5FnvigR+3o8bd2ynR3kL/2/CfjSbuedwFpGs1+wfRYWM
 owVEEN33midnIq39gsQu40dJI2CNVwDjAcx8Hp+7NuXF7aNyDYSAI5/WwTFLfA5yRLnrH3/im
 1cjC1OG+tDRRwClImt/X9XbMQ8LeXwWF/KYjPdNe0wC3mVIATOqQLtDNH841Mh9+yhvUy+VI8
 QWUkSf79DAyBxYAyyzPur42txXj6dV1JbKmQZEUa1p9dJ+rjimhB5lt+nMmpgXMkZUrsp+9Cg
 gg39e7mO07RCcdy3IaQbfhnkZdrnNpsm1TLoHGKTMCjkpGHciFlO9b1v9bdC2dS36k9IGw9nI
 p7C/Xgtp4mFPwj43gUcpag2bl6m8SLqjLk+7Sd8wqL9LcgBF2Ps4GeEM8Viq3/FixODrwOO9h
 JXhiKZqhf41YjWYzXUutiW3aIJLzXeh2qNM+Nwsyy9nvv1pwgFLVCl1mrCNGDTs6lqkW49CE3
 VpYU9fC6mRGcd18rfJBTz92Cymf58hJwsnr2Nnxuv+/DU=

> A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could

                   call?


> possibly return NULL pointer. NULL Pointer Dereference may be
> triggerred without addtional check.
=E2=80=A6

* How do you think about to use the term =E2=80=9Cnull pointer dereference=
=E2=80=9D
  for the final commit message (including the summary phrase)?

* Would you like to avoid any typos here?


=E2=80=A6
> ---
>  sound/soc/qcom/lpass-cpu.c | 2 ++

Did you overlook to add a version description behind the marker line?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12-rc1#n723

Regards,
Markus

