Return-Path: <linux-arm-msm+bounces-10978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C4E85455B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 10:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 081DA1F2E054
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 09:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2831B12E41;
	Wed, 14 Feb 2024 09:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CdWzJOE0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C39A12B6D
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 09:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707903212; cv=none; b=XG2EvJOAVluSFN+toI4TalXXN2R6a0eeOWdpyDPekDnu0RVjGNu5/vlhCuQX/3QCIqMciihCX9jd2NE0ZqOsHfDvO5EJMMsZ3FBt/X5rlvDYz5mxB4KLVMnW+H7jtl3UMTWrg2a0dvJxkMRknuTkLqv/HQIXpPTGop3B9ikGugE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707903212; c=relaxed/simple;
	bh=rParxD7MSmTIPuF9yhnH2con+bob1Z/ZNYunjoILQDA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GFif5uYHZKdI0Wfl5NB7j6qliJjzzd3Ou30HN+AZ7JNQI1niaZzwYN3D/bosX4fAi5AmX8836E+sJVXRESptln6Uh70pFvqtEwoeedPAip3V2UiY/DqluRg0LzA3Qoaba4fcKyFWbCmlGZG+oFzXUR0VSa6Ov2iHtb5vCyuCy5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CdWzJOE0; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5600d950442so6140260a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 01:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1707903208; x=1708508008; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1H+RbnkYc3zoaPoYaNe9aVZ44yhL+DMNkqp98qfzc4=;
        b=CdWzJOE0bXqjIF409/80iw0r/HxApUfU3iBWltdsI3GrxSvIT6a7RA/zeuVNRbrBQy
         QB47L4NL7B1tsA1iDZLs6scb5llK9fu655QrosrD0lVf/Aa8nF+GUWcisBaUBs+VMtA/
         SSEBwQRZ89KF3XFhDtUP6vmW41op6LxafOLNDwtzkgBQm6XpwWE6ALz+VQOBC56xkYXL
         vdcBEjNrHVXpmba9WMH7i7UBJqI/BaCwe/8nYGxviAWlGe8rYwAunrLNoBB2rqAD6F7/
         7cgkiz7bzz1zog2vPSH02An2pMJXTrz8Xl2wNijFFfMCmLg/yAtsVWpdnKxa7m/TqYOs
         MIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707903208; x=1708508008;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p1H+RbnkYc3zoaPoYaNe9aVZ44yhL+DMNkqp98qfzc4=;
        b=Q3queShlLSjl37PSZ1pCi7VmzBG7D4tGBtSLUB8Z72O2TGLOBAgJmkXMYmxenAtBio
         Lqshmru7pkhNN6y28ynQmrKVD5srp/mht+9WSNSzpVEhAIGz4WMiZ8fK8Op8x+XZmaPi
         b05WVS+noPXBsgLTc89i4r2UHypbAvTDBfd8mXacZx7DoUNBI5mqxBtN5ZZ3zGtrsbVY
         Rfha4D1vEY+x9JKe+ws80M3u+bxigZjqD3oLg2NLvWIjqEtXg5V+COKprY5yEjNITfvE
         8b8mC/4UbjQpYN84vRPFyjZbHTE5rYQCgEpWFTeA7J1geeLMKJBgx76CpOnhACTxtWvL
         bDuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwPvZ6BsbKdz+HFeVEitC/H9S1kFT4eSzfpSXgkuyR7cWF65Iom1rR0LhIjHx/WRUs8WFpBbeDHjSbrEwKT4IlEG4+ltxB6gXlEsq0dg==
X-Gm-Message-State: AOJu0Yx1Tr3rUK2ivsu+Msidy7OQ4P9LLqjdwZkYglT93hxW1CVFFcC+
	BcGQmOMzCH6ThcaFnrkaGoqSxryDZ7ej7wr8nZzOdexSo8JtvXSJgqglm8SVPj0=
X-Google-Smtp-Source: AGHT+IE5RliiqJKbx9DWE91a06gP6Z6BpTtnEhp0spNaqevUBISwb6Co5h0JMWGdSNBnVoGj3hQ8Lg==
X-Received: by 2002:a05:6402:2034:b0:560:5e65:c0cc with SMTP id ay20-20020a056402203400b005605e65c0ccmr1809735edb.11.1707903208504;
        Wed, 14 Feb 2024 01:33:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqnResp9fHEq+XlncB3w71pHFrU5kun5X1hoiWzf5VrgsXxTYZhJunSapt4u/QPXHDwWFN14FhD/abHg6kkTvDR78EO8aMghQdqwEHuUSdQ4KcBszD5Pann374nViCOjyfID7BNfC2zQLsZrrgHhduf5HYVMvO4vOQCwDWwHX/hWdWU+A2dYgnGeSIbbp3Tlioz4ZyX8JB7Fy36L9L+cRdsp2CEvoe9v6oafXXc/l1I0gEcQxH7kLYY1fyzi0vdog3GCD8B2grIa7PmYUv75Zl4glfmRrwSVxqmZEv+NiZLeSjZqCLhZ4YR3fw4Uj+NdQY47rEdsDx1PIMtG7C87sosKe83Vb0CfpNegFtsbOiAwDeML5vrn17E9AXMJIytZveh/1KltxRC5FWnAqaxXTzfsb3rkklqr8yf3dej8n6r8o9XHHwc7CzSU0px72WCNJfDPTsYYVhBOhcBuzYOEGCLQHW8XTkdWplxy1SnrXahPbnBb6dN1+IMd7C+1TfFrVfhW3CSydBLZtezYnjPtroHv7dxGfkx36IF4HgNmuVweXZaJ1p7LH8txiwtIfjm1vEy9gayy9KGTKAO8dUVyJUDULpLf+A0W+beNI1cI3WOymFFGfMwXwEZED+OZ7nneg1/VTYqpei06LPNQPIm+60ldBwn5tS//RTG649ObIeeTIPzFTODRjtl1h4rXDyOe4EZ8dk26N3qWRPI5NsMMVeGR51gV/YVUR6ko4QUL/6735o
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id fe9-20020a056402390900b00561ffe7adb2sm1155036edb.1.2024.02.14.01.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 01:33:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Feb 2024 10:33:27 +0100
Message-Id: <CZ4P5PWJTODV.3UJ89H6M8W07H@fairphone.com>
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
To: "Luca Weiss" <luca.weiss@fairphone.com>, <neil.armstrong@linaro.org>,
 "Linus Walleij" <linus.walleij@linaro.org>
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
 <CYL76M5KT424.G3BC6JX74XVN@fairphone.com>
In-Reply-To: <CYL76M5KT424.G3BC6JX74XVN@fairphone.com>

On Mon Jan 22, 2024 at 12:27 PM CET, Luca Weiss wrote:
> On Fri Jan 12, 2024 at 11:26 AM CET,  wrote:
> > On 12/01/2024 11:23, Linus Walleij wrote:
> > > On Fri, Jan 12, 2024 at 10:52=E2=80=AFAM Luca Weiss <luca.weiss@fairp=
hone.com> wrote:
> > >=20
> > >> Since there's zero indication Truly is involved in this panel in my
> > >> documentation - much less the number 5P65 - I'm not going to add tha=
t.
> >
> > Ack
> >
> > >=20
> > > OK then, I fold, thanks for looking into it.
> > > Keep the Himax hx83112a file name and symbols.
> > >=20
> > >> So in short this panel is the model 9A-3R063-1102B from DJN, which u=
ses
> > >> a Himax HX83112A driver IC.
> > >=20
> > > So compatible =3D "djn,9a-3r063-1102b" since the setup sequences for
> > > hx83112a are clearly for this one display?
> >
> > Yep let's settle on that!
>

Hi Neil and Linus,

Any feedback about the below question?

Regards
Luca

> It's clear to me to use "djn,9a-3r063-1102b" in the driver now but what
> about dts?
>
> Currently here in v2 we have this:
> compatible =3D "fairphone,fp4-hx83112a-djn", "himax,hx83112a";
>
> Should this just become this?
> compatible =3D "djn,9a-3r063-1102b";
>
> Or e.g. this?
> compatible =3D "djn,9a-3r063-1102b", "himax,hx83112a";
>
> Or something else completely? Do we have some documentation / best
> practises around this maybe?
>
> Regards
> Luca
>
> >
> > Thanks,
> > Neil
> >
> > >=20
> > > Yours,
> > > Linus Walleij


