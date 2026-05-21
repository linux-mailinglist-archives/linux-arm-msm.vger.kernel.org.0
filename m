Return-Path: <linux-arm-msm+bounces-108985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMAQBRHQDmrOCQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:27:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D975A250C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14DB73082E54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD9634846A;
	Thu, 21 May 2026 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qIp2jcLT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6147634040A
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354931; cv=pass; b=on5r5rosO+WAx/WttapWXTypHf8zb9FBli2v9n3mnMzsprpB6vqnpS/UYdrQAeV676FTDIKGJKA4on6xSL0I0UMRjPjturLlNcUIz8SEoiMTIlb0Txe4oOsgYYoU1k+BFS5yl14G49EZMNdaM6pxuZ3PA4w4OCw0PmmYk27uIYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354931; c=relaxed/simple;
	bh=lUqDwdgDa0YMWrUfF7XdMU2RPWU6E1jGV1rNbVkEfIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8U8xEBowTwvDSCVRO7jwJL7MBd1YBqjOpXJsUyHH117yUhpaKhgBqCfwDeuF7WgUvfJb9d7kjBjWLHBep8jbqHG1vM65ZlbRDU08h6Y64kH3wjXUsP2OFxBHhULK5g7jmByl5/AxxTNSV4+Cs8vNwmOakG5Z49THUljvX3hD/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qIp2jcLT; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7bf1eaba464so53630487b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779354929; cv=none;
        d=google.com; s=arc-20240605;
        b=SR53lSoOn5YDcXjxjuE9SYldsDZuB7MOR02nyeT655Vn6oY+BZC+H+TT03GkuIrrNL
         UeS2WNPhQtj2kCURLJ2QNUz7ZrL2HCNjqnW1k7BelEChLNHYgAzT274kzMbMQ4u8+qTZ
         02Iy1y+c+++p56M01Ibjqsw8MWjUncxObO41ON+AFCmTetTCoAgJgrAjzAZBYpg3ootp
         vtWiENxQrpNjY5UTgiv5R/KT860hf+VCzW7vLOi0R4sS72aGMjQmNAEaWg6So8/d6/xn
         ktXyNjO4VMZTSJwrfrjY7MHFax76Xr9djQWiDQNYBwMXMYBaBhCMpqJwQU/5Pn37cEh4
         Eogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wul7PQ9dnCs3HEM15phq9RQbj4uDgc1epjsFdUT+0UI=;
        fh=IqwI0BZp3V9zCB5UHi/pqx9kGIywsEeeUbhl1U9HWm4=;
        b=Ltfk5EvcRnyXNyRY/zRSgsMJKzgFRYnpkvscsg1mqzGjmkIzE3KkZDg0MpwVsKZLGP
         Kq/Ssp0qKfFad9iX3YFYp+Bk8/SLYyonnkJ7+iQN1D78RlEhMQ8FSeE/78lds9JdV8Y7
         paUPAJjolj7QXcEjvSOqy9Gw5JYlu/M6DHVSa27TvHqJ7BlxTXKfDyja/llPk19Pqwvb
         ffXCOarRbWLfdTxCisFwpnRsklZXq025ixtB1YtPjzjqYI7DK3XHKgLiIN5dbgx3QIH3
         PCyYTbmrF66xm+JyIj0SyNhyELNg/b+cnirg/4tV0BMfbfjMDYauq32nku5pEMVBLSkx
         TUnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779354929; x=1779959729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wul7PQ9dnCs3HEM15phq9RQbj4uDgc1epjsFdUT+0UI=;
        b=qIp2jcLTAgYY1nZxrlJ9ORG8QH8FhppH62TBvQqZgPxSEvI3WEDGKjTqjXzP0pH8cc
         mD4W9Y8xYj3G6afmuT5WRAt2u7XJKccLUF9PDdWHD0Ml/GR6RHTdg7XSzI/mo273Qiwv
         XtU7Zy0T2/+MgLd+56KW05E47hg6RjS8eCWighTWjMy1uUKqyDKjdvikwMfQKeuUbUvw
         cVq2CQIoZ+N6CymH13c5Y2UpcyjI1Yi6gOUMyvn8ay+gIPXAyAs7nOZ+dl1q0XaDU8AO
         95EtfvoMWTlB5qXiUjVMwcC6UiHBJeX8iUSyIE8zmzSKg6PrxH/1T1Xfx8f8lY75dZrU
         iMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779354929; x=1779959729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wul7PQ9dnCs3HEM15phq9RQbj4uDgc1epjsFdUT+0UI=;
        b=Cti3KlFP4aZ1mzwtwegr5U/Kfj7U24OiMka1GQJZM9BOUZJlTlGmYoVUeUZn/1fe95
         k6zve89fsD6EEnA7E3tsqOglrdGlq8KO7b9tlI5OQX1ca6fucfVxBHa5dW2BFjsSkI6T
         XnK9UIo/4uRRU+qjraM3TF1DqPFfXJaKK+LNmHLdXu4WkBxGvpNzjnc75/lr/jF6OPlR
         gMe+G3/c1Q1K86BqcyDNrqtZq2I/vWXVMlW6P+A0GgYZS0jM4tS62J8JDDFup7OBa9yf
         NBzIebMoeeZPUjVpazpKVtR7/tQiOTUxWBIlHP5Y1psnMBYGTVpdUwJ3BfPwbZhxb21W
         1ijQ==
X-Forwarded-Encrypted: i=1; AFNElJ+HWI3Qk0ls9C/LdYQquIMrlAz0O2vy1jw7eMqZiS2aAyETfZ0ozdvqTK4hepdIJFgcckmCQafNy+vZSLRA@vger.kernel.org
X-Gm-Message-State: AOJu0YzwKIpgYS9mAEH2QT9LtLWFeMl7/D6qtWy8A/h+Xk9GbeVKHR4t
	XyLYao9IQERCH4KltZkXVxFzPGOfzjhFCTl/Et69U3QYz87YBf5gi9nIrt63ip623zL72XL7K4v
	HyvFv1nC6plm5fYaIu8apGf2WmsPyuYIo4TuDYBpkyg==
X-Gm-Gg: Acq92OGU8VE57Zv4pEjlhoC28eJ7t5+wDgQU+F3nxNRLFn72PqTco0DoadVHKuvFzsK
	/tEutEjfkHlXJ6lj0+8z/c1jNKSwIOVwcv4eBluEEVVtGYyOISjwOEALXltN0sosSyIXfsnFbE1
	LN7tdlcm9R6X8uyErnk4tA4x6dVcgayXv0uj80tIVjc8TCNlnulsFFAh0dbHSHfvUU9miFapdLl
	Xw/HN+J44RwWh9y4cR3SCrUmrJAKxuMR2C5sWZ1b8vVs5+/zihOh6LQiBoKVDmPOU/4Zo51lAAT
	7f5MsVgS2Kc=
X-Received: by 2002:a05:690c:660d:b0:79f:4e02:50cc with SMTP id
 00721157ae682-7d20d9f3d3bmr20146567b3.42.1779354929128; Thu, 21 May 2026
 02:15:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415-msm-next-quad-pipe-split-v20-1-bc1fdf140b81@linaro.org>
 <177928444226.2567181.13284983255649878415.b4-ty@b4> <a2gwkgdnbwp2wfunhmdhm5mwqolzm6fgb4ex6khkzy2jh356tp@dcauzez4445x>
In-Reply-To: <a2gwkgdnbwp2wfunhmdhm5mwqolzm6fgb4ex6khkzy2jh356tp@dcauzez4445x>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 21 May 2026 17:15:18 +0800
X-Gm-Features: AVHnY4L0d_ItiLs4Y4z4W88ffXwh8R1wfpZ0M3uA1qn4tDTMEcskSsbWmMbTgng
Message-ID: <CABymUCMqto2namFoSfqgLyoAUwva8xHw93yUUJBqLrZg6+Avhg@mail.gmail.com>
Subject: Re: [PATCH v20] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108985-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 65D975A250C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
5=E6=9C=8821=E6=97=A5=E5=91=A8=E5=9B=9B 01:41=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, May 20, 2026 at 04:41:29PM +0300, Dmitry Baryshkov wrote:
> > On Wed, 15 Apr 2026 11:15:11 +0800, Jun Nie wrote:
> > > To support high-resolution cases that exceed the width constrain
> > > or scenarios that surpass the maximum MDP clock rate, additional
> > > pipes are necessary to enable parallel data processing within
> > > the width constraints and MDP clock rate.
> > >
> > > Expand pipe array size to 4. Request 4 mixers and 4 DSCs for
> > > high-resolution cases where dual interfaces are enabled for virtual
> > > plane case. More use cases can be incorporated later if quad-pipe
> > > capabilities are required.
> > >
> > > [...]
> >
> > Applied to msm-next, thanks!
> >
> > [1/1] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
> >       https://gitlab.freedesktop.org/lumag/msm/-/commit/218eb06a72bf
>
> And I'm going to drop it again.
>
> I tested on the SDM845, it tried enabling QUAD_PIPE for the follwing
> mode, which then broke the display.
>
>         mode: "3840x2160": 30 297000 3840 4016 4104 4400 2160 2168 2178 2=
250 0x40 0x5
>
What's the platform? To enable QUAD_PIPE, both virtual plane feature and 2
real time RT interfaces are needed besides width exceeding the constrain.
If all conditions in the dpu_crtc_get_topology() are met, why QUAD_PIPE
cannot be enabled on this platform, any other condition shall be added?

Regards,
Jun

