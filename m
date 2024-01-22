Return-Path: <linux-arm-msm+bounces-7769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6B58361F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 12:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67A3F1F25C7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 11:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8293D3FB32;
	Mon, 22 Jan 2024 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vlCUKnsh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31BE3B29A
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922862; cv=none; b=rfWcJcSs5YBPOxwdcz+5EjwRBWwHt55+klfzuNAvhp0Lg9HWxLiCsPAg3vBwm4jre4SsFBDLfzW1XbKRZ6+//4DVIo4UqcyR7NE2Yjlb8145zK11rqdLTr4edzLbKMBwPSstzOWm7XxuGS1qn3q1LpCetgsgs6fcfGzSZhsdM2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922862; c=relaxed/simple;
	bh=1/YALr6F0ESKpBAGOERlcLO4YyaHn1XV7HKiN2JojMQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GLk3S0QtPeoG7XX2aAZw8OmfKwBs2yMAh4+1IZT4TLe5RUvU2mVHLbcL/B7tnyQ+ulMKIZ3MMq+o0d5tHvEZyAMAPi1IpjyIrc5S8j5ufZHLQcrw5+7F2ebzryPvscpxXrJjGtEBPy13am1K8URPz/4lzplS3ygbkeOxFZEx4+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vlCUKnsh; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a308db01df6so21364066b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 03:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1705922859; x=1706527659; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIgV/QMkOZJ0bf7IGnZFc3jEnAkXvM5i+7Bl0Lz57H0=;
        b=vlCUKnshZ6oqYxu+ZjhrB1+/WDo+nslor1Aw1PRTzc0KP+tU4hufZmPe0RSl7/vh1S
         lFumDICxwtcqJLUf0lieaIULeKNRmN8JHltw54m6AQjUXlPuO617aJLV+6XzeyLLLAAM
         8vhkGL7c+/ag4k19yeDSjqyGzXXH+QKXhEa+9e6xM5FwqzCV8HlfBJsEDdI0oJIQwTah
         MG2kh+zMZdGbRVa+VoX0rfZLG9B8TW4BC7xcHt9/GxvS5dzabYCU9NCTFimbTZmC7jLD
         v13ghABKakH5Fwri/sSgfiafKtwZIxDaqfaW+8Q7U71zfKgYAV7TdQfJU7g3fWVd2AuJ
         TL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922859; x=1706527659;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WIgV/QMkOZJ0bf7IGnZFc3jEnAkXvM5i+7Bl0Lz57H0=;
        b=Vd7yKnXzTcLerjhBSu08TlYSi7M55lukncgjhlphDL4TPDBKCOp5+7/zMy+Kv8t+W6
         c4FLhgCmkXyyX4ZucBRhbKQnrCxPT3C7tKKeZwVPk1gpK9Zu7NakD3cdASvlh8CvqMdj
         SrC2woDe8XAJ9Qgqjbf3osKLHsPZAiXHoKV4BqWIgTcQpqExWAYsEaH7Q+1CHqwJP5yC
         qRc80iGoqhvXaTXJHcKmqIHVf2wk+PI3mXMOTkD4YNsFR9HCLrB/zHddPrDF7nVF3/ja
         24OqEjhxkV56HdRdVYUEkL5MKvk10RxA/Pdb0C4SK4Dl/eRV04i/uGWi2EkFKFt+F/7P
         5YAA==
X-Gm-Message-State: AOJu0YzX2afRrEKINSuMdVNpwOPdicU/TnpCz3xrkaxNQzruF615lT+W
	IDtZlIWMByzX5U3Rx7TYQp3d7esfw0QRVbruGrQ2b4/Sll6jlCdFMslALVJF/Y4=
X-Google-Smtp-Source: AGHT+IFNlq6X29oAt8M85jJiLwH2VUAOWjj165S6OihyHQSXyUfaN5CoDfj1ih9bZ1mSWEGWyb48sg==
X-Received: by 2002:a17:906:6c85:b0:a2a:35fd:d48b with SMTP id s5-20020a1709066c8500b00a2a35fdd48bmr1037397ejr.266.1705922859113;
        Mon, 22 Jan 2024 03:27:39 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id d14-20020a170906c20e00b00a298e2f6b3csm13247972ejz.213.2024.01.22.03.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 03:27:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jan 2024 12:27:38 +0100
Message-Id: <CYL76M5KT424.G3BC6JX74XVN@fairphone.com>
Cc: "Jessica Zhang" <quic_jesszhan@quicinc.com>, "Sam Ravnborg"
 <sam@ravnborg.org>, "David Airlie" <airlied@gmail.com>, "Daniel Vetter"
 <daniel@ffwll.ch>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@linaro.org>, "Andy Gross" <agross@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for DJN HX83112A LCD panel
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <neil.armstrong@linaro.org>, "Linus Walleij" <linus.walleij@linaro.org>
X-Mailer: aerc 0.15.2
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
 <20240110-fp4-panel-v2-2-8ad11174f65b@fairphone.com>
 <CACRpkdaWTfPDCin_L6pefHsokjNyO8Mo6hWPdzPLLi1EUkKUuA@mail.gmail.com>
 <CYBZEZ4IM6IL.VR04W7933VI@fairphone.com>
 <CACRpkdZQbVXfBa70nhDOqfWPbsh-6DgX-uvZOxr19pzMmF2giQ@mail.gmail.com>
 <CYCLSCKPPBOC.1B1MP3VOOC0Q8@fairphone.com>
 <cdc18e2a-b7eb-4b54-a513-481148fb3b0d@linaro.org>
 <CYCMVXHYVDCI.HVH1TR8MWEUK@fairphone.com>
 <CACRpkdacS9ojXUuogygkz6xxCf3mMq6GG_75sze8ukUu=rxVyw@mail.gmail.com>
 <f99d363c-d4a6-44b3-8057-3925f8dac1d5@linaro.org>
In-Reply-To: <f99d363c-d4a6-44b3-8057-3925f8dac1d5@linaro.org>

On Fri Jan 12, 2024 at 11:26 AM CET,  wrote:
> On 12/01/2024 11:23, Linus Walleij wrote:
> > On Fri, Jan 12, 2024 at 10:52=E2=80=AFAM Luca Weiss <luca.weiss@fairpho=
ne.com> wrote:
> >=20
> >> Since there's zero indication Truly is involved in this panel in my
> >> documentation - much less the number 5P65 - I'm not going to add that.
>
> Ack
>
> >=20
> > OK then, I fold, thanks for looking into it.
> > Keep the Himax hx83112a file name and symbols.
> >=20
> >> So in short this panel is the model 9A-3R063-1102B from DJN, which use=
s
> >> a Himax HX83112A driver IC.
> >=20
> > So compatible =3D "djn,9a-3r063-1102b" since the setup sequences for
> > hx83112a are clearly for this one display?
>
> Yep let's settle on that!

It's clear to me to use "djn,9a-3r063-1102b" in the driver now but what
about dts?

Currently here in v2 we have this:
compatible =3D "fairphone,fp4-hx83112a-djn", "himax,hx83112a";

Should this just become this?
compatible =3D "djn,9a-3r063-1102b";

Or e.g. this?
compatible =3D "djn,9a-3r063-1102b", "himax,hx83112a";

Or something else completely? Do we have some documentation / best
practises around this maybe?

Regards
Luca

>
> Thanks,
> Neil
>
> >=20
> > Yours,
> > Linus Walleij


