Return-Path: <linux-arm-msm+bounces-31243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ED39711BC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 10:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 408C62852C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 08:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA64C1B29DC;
	Mon,  9 Sep 2024 08:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="K/vMGdv0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619DB1B29DA;
	Mon,  9 Sep 2024 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725869997; cv=none; b=rKhMviqUtsiScpqZ7m4hf6KJ2mwvwlQTccld0VkrzaLfZ9LNLbBj4aDt/SVFc0MWPW0gSt/5Tdq2XNfPPajE+J+6tAKFgfd+QWSKyS9TgXQEFZQm633xrwBQoG96LYgO2Y7iOIHgPSNI2d1HnMzI36w8139lb4PXVX1X3IXA5Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725869997; c=relaxed/simple;
	bh=2CTXy3pQZc+jrcIdhOaF5pTK7snMtqcb5qWOBHOUbRs=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=I1HRfC9wo45Em5OTw2kWKOoE8oXg2GgkHbgFjQ5gNB0NWB2Dvyd//XkPJCRcDAlHrn6wTxRXVxgjWCxonE+/RJVP2yNIYXA13TurQsUrGTVnM+AwQbeufHyghquu4adFw4Hn8dcKCBJ2bj/tTQKHsb6OAUCSnAlvCSpiVvvRLFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=K/vMGdv0; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1725869965; x=1726474765; i=markus.elfring@web.de;
	bh=2CTXy3pQZc+jrcIdhOaF5pTK7snMtqcb5qWOBHOUbRs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=K/vMGdv0XhNPubD2ccDGkVtWjdeomeNXNBEO/6ySiJrHLcVTzfLcP2lnkkK0s0cz
	 GK1Fe2zjgqDYWulHRbFDxHgafz+YLbS8p9FX7C+FFQS6MZUIrIbyXQ9ahKCPpHtl6
	 3gZpGPtaMtI94cXm9K23FxhlzZnsnDltj9GIITDMFi0PBbMO3asSNZphxnSf1+/dl
	 h/RalLe/+ATDE9L/ti+U7BRYyKUFl33owU4mJ3xLTHnVA0KuVj1ecq8c9vcSv0m53
	 jt3xsLGQPWDe+oiz7naA/28XuZJxPeakRkOb7IbfjFC5lle8Cgsigg8+Yy5Br91sw
	 ShuVRrMTj07hQiP7Jw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MCogm-1swL3l2CCO-008Iys; Mon, 09
 Sep 2024 10:19:25 +0200
Message-ID: <7dc0f974-6d6a-48ce-9ed0-dadc2b539594@web.de>
Date: Mon, 9 Sep 2024 10:18:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, David Airlie <airlied@gmail.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240908-adreno-fix-cpas-v1-1-57697a0d747f@linaro.org>
Subject: Re: [PATCH] drm/msm: allow returning NULL from crete_address_space
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240908-adreno-fix-cpas-v1-1-57697a0d747f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r7YYzx6/kEfBr5P0nJO9YBYawcEGaoJc4R4lhPYRN4o2x/S8rTV
 ZOTZw9sOPKZiduK3/64SsjSOvM0qH2P6JUriC8407L0O3wADbVM3RBKAlyRBZOlrpFB6esv
 S015R8swT/0pthFa0V4kxj3ufCERSx0WbbUKPMZWIgu2N9pwVXxtSjMJ90qPa+7daLGDxwk
 gGuBYtbx/d+/3fgIeLxDA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+SmSPCo4juk=;trXMCsYiw4iQgUEYKG7Pqafgp29
 eq4xltywTcPgaAb9upI+n0N1WjOAeq/c2y1b9JVV3BARBw5tGw4tL8dCC2gYkqU7klN5hIXvD
 SshbFvc8Y1mFp1ioYHbFnmhsec8EvMg4g4y67itJGjD1p/HLysVbN/mhHJSNw0qtZQX05AX6g
 HgEbtBGQNLSmJeKq0Yzs/PIz8oaAKbZZZs+657qdMt6QsOOenU+WMy+6+2GozBP6RyrvvAivR
 pVYY5o2AiYPyNXClD3J/nlBXsUN9MvyQq79lC7Rv0dsOTTJz1uMa923Imfv3M/jnTB2CVdusV
 dDRrVnVWf/L9vY8X13R2qspfLC7zmkcp4jO79p8mCE6PHLJczGk+oMGe6P8GwX+3ywmx1oZfU
 lXYYUVJXJnyV0fT3sabt6Ith+jrLC0dEEHYd2YLdq2ab5UccSk61yCUEZSY5AWIMIVI707USW
 +Xev0APq+OjwmTCUzQtWNFHN+bW3KbBF1zs53ZnLh5+2hHg3RPllsX8gE3Yt0l+THkxz1aDu0
 EBFpBNe6w2sGF1Bv/M7aR5V6LO8IYR03/I0dKQTkAiiMRjlCo0+e6f7eYf88InonQ7j9nulnW
 siKiEP5jPox6nQe/RnS00NTpRpsRKLjEXek1V9I/lNM87VC9GH4dimDbwyIPO3HmGs+btOzIJ
 iHeD6ZaZQEPzv2jLEBRJ4WJwflac7eU71d9FJOTzoMUnfTJWdIWvo9mMaTwETJdWsqfFWWiaS
 AWgwuxm8G7sHM2ksU1EitHWCgMjNWy7nRvR6eCVP4AtXgUNuR+bQdtBte4RhOojFbsqVrhKf5
 p8ZHkXWW1u0bJ6P21eBMHhQA==

> Under some circumstances it might be required to return NULL from the
> create_address_space callback, meaning that the driver should use global
> address space. =E2=80=A6

Please avoid a typo in the summary phrase.

Regards,
Markus

