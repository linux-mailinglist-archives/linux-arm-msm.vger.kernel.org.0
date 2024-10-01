Return-Path: <linux-arm-msm+bounces-32832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A0298B3A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 07:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05FD2282C69
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 05:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E0619306F;
	Tue,  1 Oct 2024 05:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="F8oVzqD7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BACA1E4AF;
	Tue,  1 Oct 2024 05:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727760673; cv=none; b=YKiL+5bDpSkx8eQhoiL7qLORQVHmIRCNFBfMErcIwKCrlk8mL+xW9+Vu0IsM2vFC2PXZ7GIC1eS+IH3wxpjbv8kjgOB34LoeYyRsGF58HgGTznqpibak+fELyCnt858hQlENg+VQsKvF7mtbEQv3oxYk9AoU7uPmKpQvIvU7rgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727760673; c=relaxed/simple;
	bh=pYLmbx+FZ19JAmCuhauZhS8caR5bjElCrRyacFRuTZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z9XTcm6ZxVpSDARNbLA2QXPXFDfdk7yivBy0tOQuYdo/iob4rIlO/7xPAIjw2JnPa6Bh5wuHy6fmTepg/2OuQWWe9tEt0cHL2RYn+M1N+AH9eKXrXS8QLd7TrtgcQOtqxGs8sf3/5LrZVJ194UXVxY5OztmA+vzztFHof/tvDPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=F8oVzqD7; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727760651; x=1728365451; i=markus.elfring@web.de;
	bh=5SVpNw6LD0acUoexvZiZsitCIQP0KLv0wyMBSNr47Fg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=F8oVzqD7EfCUMrB7dkey47zVAIqMss5Ejxdq/sGN5jd74ZF0v+MnFj+IYu6pAfnZ
	 46nqZSwG0SBTzYGKPQiiavPouZ79xHLzFMN5iF0v05kd5kqyB+2TzjxfBnvhtw5y4
	 euMQEfjzF/olmxDKFTZeJwAiczDDmEQh3/opvdx+EFDxZSEgJwwaEOIq2kgPyFwml
	 rnjX4w7I4q6Fyf1pfJ18pbJpU0ggcapxX+LEKh/YBlQnZjkwDa0xWIK1TdEaOKQup
	 tNyfsi2mzwTNbigwmoADVPrjwK0spvUo8ihIvK6j7a61APiFxYLwEGbz3yync8xJu
	 bvcoEZ/C1qhB4UduXg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLifk-1sdycV0qh6-00JJN4; Tue, 01
 Oct 2024 07:30:51 +0200
Message-ID: <7f11f983-236d-4d7c-bc69-87301ac0b2a3@web.de>
Date: Tue, 1 Oct 2024 07:30:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fix possible NULL Pointer Dereference in
 'asoc_qcom_lpass_cpu_platform_probe'
To: Mark Brown <broonie@kernel.org>, Zichen Xie <zichenxie0106@gmail.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Rohit kumar
 <quic_rohkumar@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Zijie Zhao <zzjas98@gmail.com>, Chenyuan Yang <chenyuan0y@gmail.com>
References: <20240930011521.26283-1-zichenxie0106@gmail.com>
 <30cfc980-3b38-4e98-a753-b149746cf93c@web.de>
 <75ec53cc-ffd7-484a-8c98-d02fdc6aa847@sirena.org.uk>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <75ec53cc-ffd7-484a-8c98-d02fdc6aa847@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OaubN+eYUNjylaKQ/D2otwSvuV/kB4bgjSB+K3vAi7RoNvezolV
 0du0+nHRqpEmTgtKi7jz3UISoSmgipkn5JkMDrCsWZrv3uvKiDwFQfPVkRae24QksUc+cb3
 J97ngquscjf05f4LdLR6LgSvnGNIubqCmxitJ5TrWKnsReF1ufo2ss6rrl7nlbojJyfGzGZ
 gURtLpgA/VGuZdWsXqTKQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:D2gBaV02g3E=;ERENqldbR/mx9bAa1rmUkNOi9Bv
 Zhq/l7zmANIeF0+hts0OLKfQtfUiQB+wEKugsNMTdeanuTCUjNu587LmPH0JLDGSDJbD8e4Dx
 OIuFI3o1ipjrp9d2/Jb7LpIKHrXpo6KgxlXrbC1wN31JA1K/w+a8oUlVp5fFqkcZNM0PEthjW
 wjUEYULz91vLroamqITINv9P7u+D0AdtK0b9jj8Nnjr9+SR+gtwDiKbnHtyet8qhY1ZcNqYBX
 D7JOywUlGZ7iP3DKkd3+j39dJAuHlE6VdtZHjGF7+uwiHUyymB0u9Tj5zc+mwA4owWyCCCNpS
 N7o053kO0L4FtScR97ZL84M+loIq/8cIs0yL8Ze7mnb3GZhjj6639vhjIPzXFUnqpt+7Ekjqk
 1gwCZJPYjmu6GjcQIWJch+gHp0/yIY9tAxMQxtTiIamH7tgRgR34KnGwA6KqmZuPfNnDQPvfs
 9lb3xGcy6jjHXl9qECgbTr1TrYT9vApccKA2+hsiaquO9yzzIDZ4ObqdIVyXiURtlvANgxhM+
 yiQg57q8I8R8LQWboZmNxoP8MCbQ4plDNGfC9uTjeI0DBoMIKjJMTqheh6cskIONG+vgCXmzg
 zrPauJvoJonT7m9CtC0Q8vdNzi2EWK8F87oLFmOtTuj+jaxDwxooywXRM9Yv82xlJuB0Ltjrm
 52N5ZWvSK8F8BJ3LFOj7QJuPYOOUJxK4aRxw+BZLL7UREEi35SZ6dkIfHPsIyuBShWt4GW1oM
 Jcp3GTRaoW7aZmOlDWCsYUDLB0hE+BU56i3qsuDmOLxm/3iavNh3tNPAh42PEWZhFfH5EMlyJ
 6PGfIHn7/nFPUAGp4YuPBfSQ==

>> How do you think about a wording variant like the following?
>
>>   The result from a call of the function =E2=80=9Cdevm_kzalloc=E2=80=9D=
 was passed to
>>   a subsequent function call without checking for a null pointer before
>>   (according to a memory allocation failure).
>>   Thus return directly after a failed devm_kzalloc() call.
>
> Feel free to ignore Markus, he has a long history of sending
> unhelpful review comments and continues to ignore repeated requests
> to stop.

30 non-merge commits were published with related subjects so far.
Can you get a more constructive view from parts of public software develop=
ment history?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?h=
=3Dv6.12-rc1&qt=3Dgrep&q=3DReturn+directly+after+a+failed

Regards,
Markus

