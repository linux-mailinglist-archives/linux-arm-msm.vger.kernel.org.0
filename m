Return-Path: <linux-arm-msm+bounces-66268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BC6B0F0E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4923D17C5ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 11:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38842DC32B;
	Wed, 23 Jul 2025 11:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lH0nf79q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFAC222564
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753268979; cv=none; b=Nx/jpkCIFEYDitQ6KAT7qdK0kObLFekY05dEXLO1iBtlhl3Yi2BfZGG6hcDcg7pfs/9Z86/0VU0WBfVq4GMLG+sU6VLT8llPbz6xBgt9zF3wgp6KatwxomXxYsykzIJZKtchJkrPUWpxLlAVXDMZzmgvZE18JW+UxaLhudrNUBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753268979; c=relaxed/simple;
	bh=RI4f/Z3SE/X4N72vDIGv1owBAPo8cR1uNdwgSgPfEhU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=u8hA5okNQSorCfSEsDbMdhVZoNEHTuoyWp+0UjkYhvR5VoHsquTcTf052uAyqLMjb8jiwfncB+C2Edn+yk3zHTrKFr8ApjVy0uSfl3NRzcwh3LsD/YBZIYN0rng1oVyV6Cgl7EHuFB+O+VGkw6v4m6awl8iKVpzkDAuHB3rqARA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lH0nf79q; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-ae0de0c03e9so972590166b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 04:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753268976; x=1753873776; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3R+RLDGTGe3/dGYkfQsVctb8blA4LBzgoSO+v6ujHY=;
        b=lH0nf79q/KYhIRIi45N+vnmNP3b96ibkAJBkFIgfXPJjsMaSODNwST0V/AG3aQxJ3e
         FeGVrhZ20jk1u3yWxc/27UenH7HjHSyulUvKEinc1xUWggHiwMO9bbaBDvddOq3F/VPx
         JGf3Q4ZFanq3VyjyT3kZDPJKjCp1kFiPzhtexs6eApuvqWSDofiiZqRcMx2EMaVJBLRB
         /OZnG/IEMv9Un14BPiREjjLhA9QJXw0ds5wbqA0JmFofDWyisSne5C4Az4ffNzDfJrKm
         xgomlw5+qF8Ea9887re6EVOp4BIrBlVwyjrtjoqKr8pvaCpfiBxzoaMJyx7Ko3LB/rEO
         0LuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753268976; x=1753873776;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g3R+RLDGTGe3/dGYkfQsVctb8blA4LBzgoSO+v6ujHY=;
        b=POkjaZUHzG9dO65ObDhHqKIgk4Jo8LKh0Sd4puvA9YIFmsGfy+CUjS5oDuhPX86COI
         F9e0zLXcsd5n3ecwgeziaOQlS0nxOI7ArNYY87n8/xs07ov5TmoOmVuqOjykDoeuIOlN
         6t7D8gImAUPVxeRTJYujPtifv8DSVLbacv1FhEwaIwuZ23K0A7l05VEBdKSiVSoMUowi
         oReH3am/OVIWKV+PIwgUBM4OWIaYhFF7yKyBP4/BtQ/aCJdWohvRtikhE84In5F8+N/t
         gTxN9yoPiQLvARlHQ9BK2i5A+276XtgrNK3IwVaGnJt+fKX4gjhC+xbWCe9u2aOjWvNc
         utzg==
X-Forwarded-Encrypted: i=1; AJvYcCUl/yNGDtTA2Ss1YCEjvM+otTJ40C74719H/cuFJrvz7ZTzntCPB0myRmjzEI7GEm1hwhSgPIJIlL1oVxfx@vger.kernel.org
X-Gm-Message-State: AOJu0YxAmT6QEuujk/eK/H8SPo44JFD1Xhcqs5JocPUlqmwjWmBsAt7M
	fcBr7rdOlo1ox/6gbmuBxAgwq4Ko5zJkKSM/O1lVJxwYEDGSEZFghCtvaBtAO5eejEo=
X-Gm-Gg: ASbGncurpNT/ctahnJbySK6MAOkHUxQVynzhgqCktOA8MKesFl2LgkmPhWLDc69IowS
	JNBxXc7TnTZByz/N+DWtQQ4D5nyxO7m54mY7X6GaBVk/zX477McnUssLITYnP7kVFXD+1A/aa2z
	jRjx/BdXdH35Li6hpLp959Kjv/L7HhrHcK+xG7KUw33Etc2Qny5wNWazE3AsWqkueutd4rO097L
	PmbZXxUA7wRu+siQWhFv+CXsZAWJ282k84fSFB5yHUIp5tVXWi00L4yr8x7VkbsCM4Z1J+VERXD
	rC12ImWK3AP6yTYa5igv83L2qeiRBrUjGn4MJcfYU3AlYkHKqH/LO1X+6c1FXEXP4WxsGTfZUDX
	UmDVJ96qy9N5kmnmQALpP0vXJQ9i8X9H+q9lPD5tOhzc87ztQ3wZ7QkRwSOHNwiEkhLw=
X-Google-Smtp-Source: AGHT+IEnlnbgewz5ArcfCq7ZHFS6Ryv2VXYRZKE9xkEMAwJ9/yNzgZ0lkdiJuTPpFfnJ3XOTmn+y8A==
X-Received: by 2002:a17:907:c26:b0:ae0:ca8e:5561 with SMTP id a640c23a62f3a-af2f6915e5amr241315066b.13.1753268976160;
        Wed, 23 Jul 2025 04:09:36 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2eb90sm1033906466b.90.2025.07.23.04.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 04:09:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 13:09:35 +0200
Message-Id: <DBJDZBYHR94V.1QGVALCL60M1X@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Mark Brown" <broonie@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Felipe Balbi" <balbi@kernel.org>, "Srinivas
 Kandagatla" <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Wesley Cheng" <quic_wcheng@quicinc.com>,
 "Stephan Gerhold" <stephan.gerhold@linaro.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] Enable USB audio offloading on Fairphone 4
 smartphone
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
 <DBDAPORDD5IM.1BHXPK225E2PP@fairphone.com>
 <DBHIM4SA3OIK.PXX6HMDE93B8@fairphone.com>
 <ac3f1eb2-5830-4bda-bc57-c4d29c22aba0@sirena.org.uk>
In-Reply-To: <ac3f1eb2-5830-4bda-bc57-c4d29c22aba0@sirena.org.uk>

Hi Mark,

On Wed Jul 23, 2025 at 12:57 PM CEST, Mark Brown wrote:
> On Mon, Jul 21, 2025 at 08:22:06AM +0200, Luca Weiss wrote:
>> On Wed Jul 16, 2025 at 9:19 AM CEST, Luca Weiss wrote:
>
>> > All dependencies for the patches have been applied already, so this
>> > series can land as well!
>
>> Is it still possible to pick up the sound patches (1-3) for 6.17? Dts
>> has been applied already.
>
> As previously discussed they won't apply until after the merge window.

Sorry about that, I thought the conflict was for the 6.16 merge window,
not 6.17?

The patches this depends on have been applied by you on 2025-06-09:
https://lore.kernel.org/linux-arm-msm/174950282564.277844.46348045130952041=
60.b4-ty@kernel.org/

So I'm not aware of another conflict, that's why I was asking in the
first place.

Regards
Luca

>
> Please don't send content free pings and please allow a reasonable time
> for review.  People get busy, go on holiday, attend conferences and so=20
> on so unless there is some reason for urgency (like critical bug fixes)
> please allow at least a couple of weeks for review.  If there have been
> review comments then people may be waiting for those to be addressed.
>
> Sending content free pings adds to the mail volume (if they are seen at
> all) which is often the problem and since they can't be reviewed
> directly if something has gone wrong you'll have to resend the patches
> anyway, so sending again is generally a better approach though there are
> some other maintainers who like them - if in doubt look at how patches
> for the subsystem are normally handled.


