Return-Path: <linux-arm-msm+bounces-52953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0859A7785B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 12:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46A12188F4E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 10:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78AD31EEA32;
	Tue,  1 Apr 2025 10:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Ac2JgVIP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128E51E8331;
	Tue,  1 Apr 2025 10:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743501649; cv=none; b=H1pMGlWJmedCJDIQCsmBFlW6upbp/gGWEx2ZO+Pz0ic/5k40tj1P9ciUaGEcWm77wRdFOzn5ItcOERaN5TtVlfV+TlNLBGItvljw3w4izlhhrXCK+O1OCm3UvYrsuQdAcDJdK/buzppgaKB4XDRla6kzIpAEq2tnCuZAZG71Fd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743501649; c=relaxed/simple;
	bh=zBPWvShGsz3leAu6Y0uLFozF8YQ/77KSEBnmMoIjePs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XzARnM+NdgiSQElnsSxXEj4O9OUdVNe3W5GCqLSzbpPgyvOx8HW8DGAITag8l8QChkBmchbjt337UMaDydxSdTN6y1hcKDB72STR0bGKI6YysWNeJqxQbHfZ09hfKigp0q0TmMq8Ldws/4Z9yWPDtD4NjngyswgPU1ejDJTzEck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Ac2JgVIP; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743501615; x=1744106415; i=markus.elfring@web.de;
	bh=zYUg14mNyqc4q2rrOlc4nM8Ni46h/sIA41//bM4zIxo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Ac2JgVIPM2MTN/AVOsB3V3bpdFdtAQfecP/c2rqnga0WnGNK+HcuJ/tLlAub+Fu5
	 vszT8YyNmOSaiKJ9PR+3jeIWkE7JgbthUM7/ElwwQaCh73VfSIgcubRt34rd5OHZE
	 SHw4s9k8AdJGF/hgagckoVQGha6EvleBr+E4BnJEU7HegrQ/P60tNRRB5yRqDWEcB
	 etPiI1nUwe1cE9bF3m+NvDr1Fvb/Y/CmvZH8ctQP4Lip6P+kqzBcIm/GGDzRY+PIY
	 ic04hGpefFolb0ULQoCiUFM1Z9y3K8IJpTb3X6pvwjkSlQfNVTRVQmCbwrQBLiR1D
	 TtuUXRgw+dLuqxMQoQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.54]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Melaj-1tR30c0cKL-00dXs6; Tue, 01
 Apr 2025 12:00:15 +0200
Message-ID: <383c933a-2316-40a4-ae82-f4b64e53b62c@web.de>
Date: Tue, 1 Apr 2025 12:00:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4?] backlight: pm8941: Add NULL check in wled_configure()
To: Daniel Thompson <danielt@kernel.org>,
 Henry Martin <bsdhenrymartin@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Helge Deller <deller@gmx.de>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee@kernel.org>
References: <d5f2aa49-27e2-4cc1-91be-4e195ed5249e@web.de>
 <20250401082950.21698-1-bsdhenrymartin@gmail.com>
 <Z-uqpxcge0J99IPI@aspen.lan>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <Z-uqpxcge0J99IPI@aspen.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:35Y86OrRspHmbZbOtY2dnh8M6H40It4ODRJuL/gWp3eBhefzQMm
 QL31oQeB8VJK0AOdK1JgZ1l/rQGcKeEzXH1EpbYJWbH/lq8kvhxCGbw+3C4/zQmI/T26d5E
 Kx+3q2xqMjVs/gC2q5ALd0Czm5duoi2A59KXnw3LMa1H1fpKQN+6GrJk/GriMQbc5ULWAzt
 qGAZHq1Tvbuv0ftV2TbLw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wncKC41epd8=;N1azTlu8pf5G2YwIj7RFt5yG/NN
 Yw3zGOs6DrvEz8vZVr6hgb+sDCtYJUUBFyFwZsrZLsGPPz7Ib403bGW8zHv0+8pbzWIr2AJOw
 ijf0Vg6Jysbs77CL7ZPu9uBX40nGKHQpo0lkUKixbY2LD/ZYSycnVwlorifJ8773Z9DdJthwf
 7lQZX4wma0re1QtTkitRp88tQMN1+Nkt7jVoF3E6acTyUtKO7LeIS+sCCKTdJeDbQgB6YNTVG
 mVmeL0Wb0Mp2KW8Pi4YZJsqmEX5RKA1V1/13InL8IaiwY6b1srQbupO6ZjByHnMMLPmfimaYJ
 4D23dWVFji+Uan21kw8F9qdBE2YmFgs/ee/dfq+ZUxIPnuUTUYmbKF75E6Rb/IXwnG6mQ1HHJ
 znuBVfPz5iGmAXNKhwKMoworiKYSqlf6JxFOg3mSw0dPdneK5CDQz4JWDlN0GWowvlxd9ZP9c
 Ecl8cLidxgjdt8T/yXOrsPdSLgiJMrkypwuykE9kTRtZuu6wwy/ttGzJAyCz1xYdf9pvr+ETi
 tWuksO1HQAX4zHe6hDiTzobkUlPJyZ33D3cgSeGDeGZMMqAwAc2eANbwTS0fKqwZSdMPSjrz2
 dqBS+ulZEA81zYFkMYLnIP9qI7u4bQpTNwBMrdJ3o4rU//nsYB0qbqkcYLK98QRTTXGsgWSiu
 J5TlwsZsUx40Fh1nQbO/+wfuCuB9RV1D7fHgF4vv6cTi0bm7KgSJdUJcEFiWJrVGXiURMomL2
 tdBRsqflNe1c5eqyS6yXHSSm0dqlE1YXRPiS93xFWgtKC65/BJfqhHwUycwrDNbgJpPW2J6ns
 mkk1cuUZhz34VQAdpsWXgAKGhuWu8rCy7bvxq0lRXSJ8Y4PDA1APch8SNgRbRUTngh7yFPgg6
 GQg9OS0Jzxi/glR+O57U6wsgX4qTHUBr5iKyjaOxuVtg/95HN0fp5hjcbQ3qJgLnWqEFBj/Yo
 KZMESmyY1M++xtp1XrxLwTf6Ib51ZUuhd1gOcGBvfFjmslOXFhoXPKucmtajMmo0200/PMsbE
 8QRH3Mtck/k5zEVpjwxpRSJ//wP3VWseEx6JxLTnDSgayy7sjRXnbwY7yobM+gEPbHWUpzUhX
 WhFpM3kHFZ5Yjvi6QkPp9g+KHqIoEI/4aVk32v/ubRsT1jkm3RAkyGEi+guOpAKFqbHrwganH
 rvLXfTvPulUD1d/ILhP1MEbo9Xl49JHBbgAW+O9NF2ZKvGvPsOtB8rmCLeSqCGTgxq3yXmxFL
 e0DmH1G4dxFd0Gxj3FF+hNg5H0vBHSOl6sLQWL7RUkH/bn78IUQkJMqSbyGEvgfkwwYTq63ra
 5UsJVH2oxXqoumEcjjYf8L1nIQcaDCgBvNHdr+MPYMBogf2VGlupmGiNdAJPsokEb/ljbtBb3
 SGj41c4eC71xqfguelTENoSTA2rL/39vW9wYe+nRN2WvF1P8WNRoUq/AU6r9WToKtkKgfC44v
 E2xTN2soAViFL6h+59TcfCYeAgYEmOwQlQhrFZ2SepCSXLsvrcv4mwsPmCxS15110Y1/Qcw==

=E2=80=A6
>    patch description ;-). I think the original v3 was better worded.
=E2=80=A6

Can you find the mentioning of adjustments helpful for better error handli=
ng?

Regards,
Markus

