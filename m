Return-Path: <linux-arm-msm+bounces-32794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6744898A9DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 18:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE4211F23785
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 16:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2867192D66;
	Mon, 30 Sep 2024 16:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="AL0vjq+X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB613BB24;
	Mon, 30 Sep 2024 16:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727714061; cv=none; b=U49Gbscijxh5Esl4qWraztG6VpfHTx3vWfWS29bqJ1h65FAmVaSSyP8pmjDJF7BYzlUL13Ke5nyWv9l4vql/pfjazwKxyeHckL2CzU3+aine+bzWeLivA/m2xuBexEiC5vpZl/uwFzwllEzeDIfIuD4O2C0bizfn90el6vSqAHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727714061; c=relaxed/simple;
	bh=Qf8w32+ianb/P6mmXXQkfYYDksr3EPluaIRN2UzchLU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=qsrhSqicmISPxAAx267mc4mCHyw+yFbO53pD377VQuChVvLG2FEEDxhYi8W90+zqRwdudD//MAcgACa9DBYqLXJ5HE5AChzOWMrGVWDlceaxKfGXGk3aXw7IxWw38RWyA0WCAEi1+PXTZIyNIxv17MUPcVFhWIFGpnJN6ed30eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=AL0vjq+X; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727714031; x=1728318831; i=markus.elfring@web.de;
	bh=Elp8feHwzLHEvNgI9yMIUjekemWT/zzJtyACfJwiUIQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AL0vjq+XrUYRdIJT+vEufYJR9dYtYtRZlbH5uqFxSWi0lw7kVHlmzquoYI24nrUc
	 0tEbu+Rtsa1kp8WXhB5iVN9Gc4MIZNu1X7Y62Mwu57QTdvGZ8KnQxDJC/+Jn0zI6f
	 bUwis5dxTBV9jwYCT2zshkxzn0xz+3YR1eUwU0LZYn4NbG1sYbjWtqz4uqR4r9ham
	 5VM0N8+WPjTHxivXyv60d274xnLXyyb+M5K+9m+5r/d96qZxZk5LK2ivgLwSzKhTx
	 PKyoa9UGsJ3SFrZNRAAtuBqzw7zdkNE6hz75SAL3n0ght8O5y0+WNv3A7U7AjGs8Y
	 VRJd8EbUmdIJes8ngg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MK574-1sc0Iq3iiE-00QFXj; Mon, 30
 Sep 2024 18:33:50 +0200
Message-ID: <30cfc980-3b38-4e98-a753-b149746cf93c@web.de>
Date: Mon, 30 Sep 2024 18:33:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zichen Xie <zichenxie0106@gmail.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Zijie Zhao <zzjas98@gmail.com>,
 Chenyuan Yang <chenyuan0y@gmail.com>
References: <20240930011521.26283-1-zichenxie0106@gmail.com>
Subject: Re: [PATCH] Fix possible NULL Pointer Dereference in
 'asoc_qcom_lpass_cpu_platform_probe'
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240930011521.26283-1-zichenxie0106@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wWPrxVgNAW89ZtYL7yCE9yBsQPQ1CEh6dTzMElmw1CIQYjlLjDi
 ymQyan+7h+OEOJdXyAPBfl2phLYm2KCFUzaFzczAomXzFIp3KGtBDMx771osuQmjqEYJytv
 G9WUQXWTgqahgur6IolnNTAUmBCQcHVduPyRX1blabpKy8+UQxZUgcajxym9t/Yqnw5ZMar
 wpa8ptkxJxxV+iHzQQD6A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:X4rV4JRbJeA=;IsqwtxPmorxf/jI/87t0I20eQn9
 KC2pSZVTtF3/v8Kx2qyOpJQC4H/WrXQKfe2pPvygbpBBdsF8jHLeRdIcPkvGpVje7bCCKNEqm
 NsIMp3qcdGQWYY4Li5H9sD2au6WT4whXrB8yppJWKFZJxJbE+FFq1y6vINs2zQZ6kZBcfVERd
 5kthtfAO6YG2Myyx4suCKzZFiZZBOFG2Xz1ud0D38xF6/9Au0q0jDhRGY5b+gBnofK6lDuGN8
 /Ef1FJ0JRvIK8lwV68PYYpLRx/zOZLX+2oxGQzaHOHQcwpviqy0uTC8FyHtlrYw0yNvyLtWP0
 dnHXDn4dqiutTmgYCRPW1kr0tAH/fmRadfh80ak/Pjmq9z5n3SdjlydpVUJ8GHY05AeDQiN5b
 TZBttdld9R4Frz7nIkGJN3+W4+Il8Z7sUF5B+l8eE3YsvDfjIxUl7sLMgkOl6/KP8haMDX2HE
 7fS4zVk+b9GEw/UGMIVGu5E241GW5K/ycsvrxvyvybFlBp5tAAfVzBQ6odUg4CXTIr8V1RhL2
 8Nm3/agphLLjDRDQfTuBQGPEUxT2G4EFp3sjuFi58lPFA+NmhXyRITWuf4e+IccVyt+V7gDDX
 9AbKqY6cOopzkdv8bdF0s+I3xYvQuCI8XlAa7s5PxzUnwbQYVA4xUr7GVJtKViVcVFlxRvTZI
 ycg2K2hxZmUOCGwFK6GnNRJp0phAF+KjNrYR2Mg2R7Iv8Yyg9qdBhALLpYtsdZFKIf+bABoTx
 qP/plC1DTegxmOKesvo8lCfiLXx01e7Fetspzv/imT/ufgR6H9EEBbjudbtDVTRcBcVfG6pOj
 vWjUakkgumCEpbCz3XlYbwJw==

> A 'devm_kzalloc' in 'asoc_qcom_lpass_cpu_platform_probe' could possibly =
return NULL pointer.
> NULL Pointer Dereference may be triggerred in 'asoc_qcom_lpass_cpu_platf=
orm_probe' without addtional check.
> Add a null check for the returned pointer.

How do you think about a wording variant like the following?

  The result from a call of the function =E2=80=9Cdevm_kzalloc=E2=80=9D wa=
s passed to
  a subsequent function call without checking for a null pointer before
  (according to a memory allocation failure).
  Thus return directly after a failed devm_kzalloc() call.


=E2=80=A6
> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> Reported-by: Zichen Xie <zichenxie0106@gmail.com>
=E2=80=A6

How good does such a tag combination fit together for the same person?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12-rc1#n525


Can a subject like =E2=80=9C[PATCH] ASoC: qcom: lpass-cpu: Return directly=
 after a failed devm_kzalloc() call
in asoc_qcom_lpass_cpu_platform_probe()=E2=80=9D be more appropriate?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12-rc1#n613


=E2=80=A6
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -1243,6 +1243,9 @@ int asoc_qcom_lpass_cpu_platform_probe(struct plat=
form_device *pdev)
>  	drvdata->i2sctl =3D devm_kzalloc(&pdev->dev, sizeof(struct lpaif_i2sct=
l),
>  					GFP_KERNEL);
>
> +	if (!drvdata->i2sctl)
> +		return -ENOMEM;
=E2=80=A6

I suggest to omit a blank line here.


By the way:
Would you become interested to omit the label =E2=80=9Cerr=E2=80=9D from t=
his function implementation finally?

Regards,
Markus

