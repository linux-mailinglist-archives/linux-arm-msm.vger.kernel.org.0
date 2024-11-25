Return-Path: <linux-arm-msm+bounces-39133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4679D8C55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 19:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F7DC1690DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 18:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF761B87F2;
	Mon, 25 Nov 2024 18:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="qvOqs+gp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DCE1B652B;
	Mon, 25 Nov 2024 18:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732559998; cv=none; b=aL1OVE62ZQdSVSz8DZ7jyTHTiztDCWeE60QZV35YAsHix+LEyV7uTiTWAjVCcpG/kQ+Y02x59smXAT1BvYp1zijlEpjWfaElm5el98abUJ4XPvRcnhNBy4eRvT/JCb3mHy5ZJ5Atc2crpZiVz+m4Y0s4QeMolbM6f8thF7T0lY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732559998; c=relaxed/simple;
	bh=QTNUyu6bIK6b/Q2YSqfwYB4dNsbfycYWitzeCgC22W4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KnyhWx4AhFK5N8S4l+0tMOvMto6W0Wnpn8l9Fl+D/1K3KRDs6wgZ460HjcpewZ6umIZrMNKOFIdS5+BiFygYF1P1r8TdSxls4jD+NIVop9zY43TVnhnGknuDqLdIkoLQ8cZyHKAcqi2AfFEamrMnKkpEexIccsnRyCSOL1wNUNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=qvOqs+gp; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1732559988; x=1733164788;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=gnJiQRYs6QwmyqD9t2RNLsEiCy/YJhARjRjeHI7aWpo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qvOqs+gpOxDAAfsnnl29IgJ9+IUlCE51mEWPJVTPvdY+NlwOk3njBLdML3yfLlf6
	 JaMJmXuYoVowRknaI7Ynjqf5W8n15UIbAFeANMBzuR/yScGckF7wFmdXpSI0HEtae
	 Ac+KI8C4nLYgx2Qyn7VUABu6Xj1L3ahbzOhDaNsFKeF5QWVlusKSrlz1hUdhIGVCq
	 MZ8GjBMwFSo3r/E9bFh4l0mIL0FaN8rXA7tKvVU2U5L4EfDMR1NGyOymRinbDd2FB
	 +l6snq+qlU27a+VKFdg0DPNQbcKC92BzuTUZr7i9U58H8THxRw3ITfxgYYHCM0yTF
	 ThPDvFkXx3pqPz9XfQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.128] ([84.175.94.57]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N0nOF-1tad4i38WD-014thg; Mon, 25 Nov 2024 19:25:41 +0100
Message-ID: <562bdcfd-1595-422a-884b-09c36db72737@oldschoolsolutions.biz>
Date: Mon, 25 Nov 2024 19:25:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/panel-edp: Add unknown BOE panel for HP Omnibook
 X14
To: Doug Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz>
 <20241124-hp-omnibook-x14-v1-3-e4262f0254fa@oldschoolsolutions.biz>
 <CAD=FV=V2JhWsK4-gHL72ttXdNA0U2p6YojN+DXtWxNSOjD-ZSw@mail.gmail.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <CAD=FV=V2JhWsK4-gHL72ttXdNA0U2p6YojN+DXtWxNSOjD-ZSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4Rp+He4zRJWJsM20vMzGBIK+m1xvgdFn8GRdJEwqYwor5a0x0dT
 muFVYQg/AFDhGZylCTr83u0vV58aHi/Q3SEz7ZVVyqVgYY3ij1MCenKds50zoZ3eWdkj0mA
 +yCxQEY0braBwijbRkEbHVu8xnerxqkGM/WA7l8NOKTvkj3yBkRW7IKyOHA2MMhKhUm8PoC
 OZsMOlHf2ohZZquptc2CA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gHXC/Afb5ww=;DhcZEeJtIif2fug0ZyZybrBlaWU
 VS03m8oZCAZ+kszH8zjF7VDzByZVKT4ZJy/pc2mtZnMaR9woQVSW4JMEHhew8Wq8c8XlwHJr4
 MkoF2rcLT83exY7M6kSDb8SDIGaMGJ1HCQXLjdmat158GvOBUU5k2Nu0tDv6csiSm3fhIpYSo
 u5QUycc02R2yvEOHO0bgBvlreaNPusLgLRWurOgUIl+cLmfESrQv6kxZ9d95D2k9QBysSB+DI
 fb/MxclzKczwCsKFFsjPlMHUuumZtWYcnBWPwZoh1ylielLiBQk0TNH3IsD+ht2J2SoZMRHDp
 Oblms67oDsfdZoyHqwJgcxuS6O8s8FiTA6ou64kHgOMP6Ij8zxUJupO9/exJG95dqaaz57nyf
 J0XEFcRrbnN3iuX5M045yEFYaWk3QMccBbGOyqR5ioCfa828kxZdAPUgHuUg1HpphVSdvdRQ+
 VKRqdRyZ+4PBheDL0vJ7ioUqBohPDC1KZo+vhiu4cB9y6XiZuWWnblLbb9qBjOSZ/xhSrNCU9
 0izuCfjpY+ndjyspolA1Ps1ZM5Vu6SVgAKi6B+Tib+EcprXDFQMrJt2xR7ciiCcBSEMoEYd2O
 SsCQOcilGgrfu/8mHGrzV3AvunF/xc9rME+rCWlwwbQlKh6HC8ler98Tn9knGwoBjgjbEfiZb
 YcrIZcxrHuk5Q2yd3rtbWklu/QKTaYrogB2jChHi3Ve001ZEqm0h9VZC2iGkeZ8yDz1V6fbza
 UmQwLU9IPsxbpi3u20+DaCylrDiCgnInIoDhK96Rs/xaVZ6DKJTVbcqxJnzo8kOaWrCC0IKXz
 DoTNntMxGx8XYsh0JxUyq0EL2sZl3E6Z8Dxe/Gk2SBgT8t++InsuT1GZ+nCXhkEe/7

Hi Doug,

On 25.11.24 18:53, Doug Anderson wrote:
> Hi,
>
> On Sun, Nov 24, 2024 at 5:20=E2=80=AFAM Jens Glathe via B4 Relay
> <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> wrote:
>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>
>> [...]
>>
>> There are no timings in it, sadly.
> Yeah, and like other BOE panels also no model info in the EDID. Sigh.
> I guess "Unknown" it is until someone can officially add it.
>
>
>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> ---
>>   drivers/gpu/drm/panel/panel-edp.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/=
panel-edp.c
>> index 8566e9cf2f82a..403679e506fa4 100644
>> --- a/drivers/gpu/drm/panel/panel-edp.c
>> +++ b/drivers/gpu/drm/panel/panel-edp.c
>> @@ -1915,6 +1915,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>>          EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT=
140FHM-N47"),
>>          EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "N=
T116WHM-N44"),
>>          EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV=
116WHM-A4D"),
>> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Un=
known"),
> This is sorted incorrectly. I'll fix it for you this time while
> applying, but in the future make sure you sort numerically. 0x0c93
> should be before 0x0cb6.
>
Thank you, haven't seen it. I would have reordered it in V2, but now it
stays that way. Yay!

with best regards

Jens

> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Pushed to drm-misc-next:
>
> [3/4] drm/panel-edp: Add unknown BOE panel for HP Omnibook X14
>        commit: c1bae6802ee9c8ad8e3c1df7ca3174d6b4b260e5

