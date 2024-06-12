Return-Path: <linux-arm-msm+bounces-22440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D154590531A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 15:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFBB71C21203
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 13:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DE416F0D0;
	Wed, 12 Jun 2024 13:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="JPrjh55L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BF51D54B;
	Wed, 12 Jun 2024 13:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718197296; cv=none; b=LSagSaK23LoISOVq+k6fOLMegbx8/3vrl5NRi8Un5mA4Yvo325dAmNqTjAcENt5RIir+V0kCeO4PCSVA5HU9yNWzE4Tkv32BflLIK+UvyQvSm5MDIrNmd1UbCACZPIdnORfeDboNvymDR7Iu9owmw16V32tdQ+4+0Tog2K+PFbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718197296; c=relaxed/simple;
	bh=zvAIszmpcFoCCqGgeL8SEkY+l0lBODeG5GimiUkldMo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=B6JSFXi5m+Ydkalf1E/e0law1VDceLVnRNDmwLchVr8cHlUVpBpD62zFQF7aaFK2pKRt/DrZx6QTxFmoPwO1hDwrIKouXcrCET2sp9ofvEXDLKe29ndj/bmYJAeFJidPB9cbBvwsAxiOuWNgSkJhXdVagXSguJaucfG6lGb9ld0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=JPrjh55L; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718197276; x=1718802076; i=markus.elfring@web.de;
	bh=BwY4nSRSiX50ju27Za2AyFCW3MElQCLsQ6xaBJsijxc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=JPrjh55LO+dxTZjj21wMYg3xiu9w7RBOaSXLfnU8bIPCA0VqTfIQ185bYvtM1iol
	 mZFUzLMC3cDGVHI5dqYYgMkcYSnW3kD/kq31g6gXL07VsgZwuMEoGmmKs63YDPVZN
	 uo677SeOwfawn5f2neNjn7pfG0DeBxlkZ0CfaO+I5irzZDMyXFk3gCcn6rckDoQCA
	 2taw6N8uPZEJZuseOrLOS+qI774N5Stk3RNiRiwygX1mvoU8S9WMhoxIuKHAYCkql
	 7j2QucVAs/0yb/qXI+1YcNhvbPw7SROVkxIb8ilT93Pkp90WTJdCk9TAc5wcMxbjZ
	 8yqcHFOB+VOkQg+H0Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MrOdp-1snQpn1h8Z-00hTcV; Wed, 12
 Jun 2024 15:01:16 +0200
Message-ID: <deaa2a50-9e16-4f23-8c13-34947ba4e4e0@web.de>
Date: Wed, 12 Jun 2024 15:01:13 +0200
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
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20240522-fd-hdmi-hpd-v2-13-c30bdb7c5c7e@linaro.org>
Subject: Re: [PATCH v2 13/14] drm/msm/hdmi: ensure that HDMI is one if HPD is
 requested
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-13-c30bdb7c5c7e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JRdxdNTKqwkPpdYHwCiY6ep2u1eBuqO1NgxxppYIp17AjPPBzuw
 cvqSW4biK6afYfDJpAkcryzdJtThijQ/JmvKbJRmezyhqvnUcIjpJSh8Awvl64YzN/R/3da
 waq4hkAI1Xf2TglE8x/iW6MjZZWDv66lVCbSXpS2wDBXJbbEJG494ssoeZElM/tVoWisAoN
 6tosNrlDwndP8zHuhDfLA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AJCm5eap5Ig=;9lGpNi+gbaFG6EiXvJ3wkCk7JXB
 T2+R0qkNEqqg81INQJBDAzc9TSAO47fxhO0vnWNfYf19zyHQqgdtTRlEaUQGtYhq1CSzAkxU6
 WZzQEjLw8gkTnWmIGF8/Ypg8NPoG3TdQACVMeTlCCbtcNc2ip+QmfZ7rku4gFtkaZOyiny54+
 UxdxASOVNoXDesCEb14JpxDU2Idfyo3NSjIeB6uA9AKV8n90ffJM3CH3yuRsfRQ5NT29zg4EQ
 EyLWgTQ425+W7OkoXa3TSgtUBcYFylHCkyKH4ApXmZmaXz3ArSqOUFMHbbMI6SlXq1YcZjzXG
 ThzCIf1wUAyhqjHJA5jEqE3MkOVhvK2mmyVh8J2n21NCZFL1ArJd0txyow8OUibdDe8Ww9aF/
 UZut3GM9bUzmMnGThnHy/A2LkGdttUdrCL6uwJPoz23Mr+RqZqsfzI9cvBG3yccr371vPMziF
 /GBbX0xRP7zlkIx41ARhf3+3VhRg2+sLIq3offXuFE/GZitTT00q0FCRjNUsmRPj2mxICQ9sh
 8vngs5FfbP7V9PMthLyu0d7bZFFlalsYq9Wijda/1nA5UTKF9j5onWyhnLF9/Gt7fpbj1zHCm
 Th7j5l+u22XxNJ0f/VovXpt6P0YndPYKUEiOshlwSRzJrTZ14TEanxpGcm//h2K3djxGDSrA+
 TkTyu4xswONWjFNlCyJTpQUt+qcjrmK8tlPJSQCOSjjPQtcX0CWZARFEtH98pR+icUTNsMZvg
 lgXIvCvMe7oZzl+9584Rr8pdQvHNawvukYTyXPNmGO8czg3pv7Z6L/vDp+ea9xV7f8zLJFX85
 PdP124xy8JCE/ujW1BYwiXaevsFJknGRTVsEG6GEyk3As=

=E2=80=A6
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -117,11 +117,13 @@ static void msm_hdmi_bridge_atomic_pre_enable(stru=
ct drm_bridge *bridge,
>
>  	DBG("power up");
>
> +	mutex_lock(&hdmi->state_mutex);
>  	if (!hdmi->power_on) {
=E2=80=A6
>  	}
> +	mutex_unlock(&hdmi->state_mutex);
>
>  	if (hdmi->hdmi_mode) {
>  		msm_hdmi_config_avi_infoframe(hdmi);
=E2=80=A6

Would you become interested to apply a statement like =E2=80=9Cguard(mutex=
)(&hdmi->state_mutex);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/mutex.h#L1=
96

Regards,
Markus

