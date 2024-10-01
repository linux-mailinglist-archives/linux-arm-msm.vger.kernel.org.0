Return-Path: <linux-arm-msm+bounces-32871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 335E298BCA3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 14:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF1ECB21111
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 12:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665151BFDF4;
	Tue,  1 Oct 2024 12:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="CoqBzj7R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AE1188000;
	Tue,  1 Oct 2024 12:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727786990; cv=none; b=S5JN2REjtEYmV5aA1y+7WseoxNdSc6Bn632Cbr9tj7VDvmZtfMgd2WAQH+g+fHRLIcBz8CFRV76DfgOFbXhbobfVSsMR/4yb1JLa21Ft5hZlr5h6x37Nr1CqBnpGAjh+vQrCfBDKSsXLKgUZxApJpaKFiNbxEi6t8boOtX3L3E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727786990; c=relaxed/simple;
	bh=C1GxrTMdMgyH4i6ibDNBr8CN76TltxJajy1u/h2xRrY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=rBP/79i4WxEs+pEN8qZ5mmMZLe6eVgbT7hna1igZZLgP+sV2Ph7JSY4V6lbrWSGdDs/fX5FcNW7/IhnvrhM3sOwSM9QFpwJVN4bJyR4VIP4AP8R0YJxneARvSeuEhCxV/ziBYw5n81E5CXvj84Zw7Ng28XXF4xDK6V+4bLby8qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=CoqBzj7R; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727786937; x=1728391737; i=markus.elfring@web.de;
	bh=C1GxrTMdMgyH4i6ibDNBr8CN76TltxJajy1u/h2xRrY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CoqBzj7RF2VoyGhF6Is3MZfuwKV/+wjuNAm/NjFvX/Ef6jB75sJSXPTgi7h8ETtY
	 ggPK6+l/QLd1/333YQUzowyndXa1y3NT59nzeYFKvAR+0uiMxcPKDcDZAiU7HP7ZT
	 L9hgyNM4EjsURo84UO3dayUxqRLocP1qJlbnh0n/g6Bc3n7KP3rzQpXJmMDAjMzDQ
	 Z+yAqnUWNfHHG1jibSSjgK+zwbg3W47EWCB/iNulGDTPbAjfvUaL20XWlbbUev0ZP
	 bbCIwxi/2/9dHC/jyo9yp1w5nI/C0k6SXpUKnMdl0soqUNPE+eXVwAue2v7PBfG7r
	 STuZD94yY1B34zXuLQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MzCEB-1rzP353xnX-00wkp6; Tue, 01
 Oct 2024 14:48:57 +0200
Message-ID: <cf8e2da5-818d-4783-a3c4-bb6aa62088f2@web.de>
Date: Tue, 1 Oct 2024 14:48:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Andersson <quic_bjorande@quicinc.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Chenyuan Yang
 <chenyuan0y@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, Zichen Xie <zichenxie0106@gmail.com>,
 Zijie Zhao <zzjas98@gmail.com>
References: <Zvrb+q28S/C4z2eH@hu-bjorande-lv.qualcomm.com>
Subject: Re: [PATCH] Fix possible NULL Pointer Dereference in
 'asoc_qcom_lpass_cpu_platform_probe'
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <Zvrb+q28S/C4z2eH@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6RS/61IPs8STPgbSd4NjVx+ZRebW5ZZ6w3gCMtCC36jAYYYQHPy
 WGJRJ7dHAdyvt1qYKNY4G0Vgz2c1/H/wapvItuVoPECFxGVc52jjTtSEfemdRAXiJuZUcS9
 X8eiLN9QIKE3x0Zgq/USLFN89rhQNZ7eWY0POtD/DGGzKY8UP70KwEShxFhIqMRbyABqxiA
 1Zu43/cXWb07oPLWqeslA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fSEJ+7CUxLE=;V8oHVkOVUPLueYJUsJA7ZHqDo6S
 iKmS2pGNWbNJ7JpV3XBzizhkYiDL531mqEZg7ZjqSH5Um6H9sGvNlgk9K7Lf4vIL1YvP7l9cd
 CYbHGlKJRdpmYmKuApz/UIk9d38yh9wUJdCMstv3B7CreVuMjpEoC18Q+Gyv2N/JSouXbRLSD
 wXoSBTZLsun90IMvnoJm/K3iEpRxuNhKYdcPXMKC7Z+JU8NNNrweXJRkBBxV1iVU4tUHUGlsI
 HCqVxjSOghRkEhwO9JXXA/AYMfn/25pbkO8HGSV4AtHmj7g4W57ZvJbF9DhLTt9iGZmQyGzwx
 rnV8iBeevxn+2bdR1sxyqIlTnes8BHCVUoVK7lEzDppMLwRB00eVv2Eud5CUPtB1ZItFK40N1
 w1f5ngQHugyDmFL0t2ZvGQGNjtQ9rqrac2uxmHHBQYJlmVGOCHrIY7+SsARwWKxAlFeirX22u
 1y8k18RtkGQ9kQcA8DPsBjWLhTIc44zpPgbUbAkOOANp6/n+ILJaAVbrFFPaQDdiCkf0BZJq6
 bvAxpICYvX2Qmvcq6xpG1vDl40L56qVwDmOf+hAOBJGaTKJmAEli/AVYIIjqxUMuSBGu+DCRj
 oJkjurh9W4HHptU1cFpSBC41GIij9jEG4jZgE1Ct2+Sba5nXK8HBwFAtKks04COjb8nOcdg94
 KFge43tXotWB952giYgEWPqKVUSslZW656qqPEDEZVSvmvIvTydbBcGrPAv+cUpEzwaTyHQ3C
 UEiRaGSiE1XyzMtRH7s0wJZj2+tJyFocXWFFuNmc8NveLvhMnwaqqLmfVrkkqnFBqa3Iyfpwt
 RPzdRyFhYUQk+B+SR0pu6Zxw==

> > A 'devm_kzalloc' in 'asoc_qcom_lpass_cpu_platform_probe' could possibl=
y return NULL pointer.
> > NULL Pointer Dereference may be triggerred in 'asoc_qcom_lpass_cpu_pla=
tform_probe' without addtional check.
> > Add a null check for the returned pointer.
>
> Your description and patch looks good to me.

Interesting =E2=80=9Cview=E2=80=9D =E2=80=A6


> But please run git log on the changed file and add a prefix to your
> subject to match other changes to this file, and please wrap your commit
> message at 75 characters.

* How does your initial information fit to this patch review advice?

* Would you like to =E2=80=9Ctolerate=E2=80=9D any typos (at the first gla=
nce)?


Regards,
Markus

