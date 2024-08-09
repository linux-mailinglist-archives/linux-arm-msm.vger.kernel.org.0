Return-Path: <linux-arm-msm+bounces-28230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2734494CD06
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 11:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2B531F21A46
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 09:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E29191F6E;
	Fri,  9 Aug 2024 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TTD+G6Sg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F963191F69
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Aug 2024 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723194761; cv=none; b=NPgK/05GlLzRMlbWn444iw+5Bshh6bpb8Xjje8GkaeYIdk9o8+5IB9mfONST6Q8lfktoPAvU+RpeTXnxDcgTimq5FZwYYWj+CGs3R0Bu78fYwXSKLPAzSV3a1VxVyq9O8ngqInIyNdVmmkWOJC1flr+/TAYlpPc2DUdoR3vnuk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723194761; c=relaxed/simple;
	bh=iLzGfAYReosnIhXCk1VOcUKl/i0/LVKCJemQ52zsYcY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=E2LmItXvORkyIB+rVWNFBQflxJzvX5vvopp2mM5YtpnMqeKt+AbhjM5vxOds35ZeJM5dxmKiq7klQaZEQMm9LJTb0E3JNxhRsb8xwQAlAhMvHV4TyU/LJKFpLqEtOZb3Ol5bJ6qzyyqxsS7GqqNYcV1QXnXtEmdx94Xpcrfqono=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TTD+G6Sg; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5a10bb7bcd0so2336700a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Aug 2024 02:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1723194757; x=1723799557; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/g1EWdSRyPvJJ8eyFtdobneAEkMnKZn9VHRowDdqkMs=;
        b=TTD+G6Sg3RkVbYTiP0xWzcz2Umah3VWczSIWqQrpWtNGpvN4Q42O1oVtNdE0DBoEIV
         WE5eMozONdAzBkHVl+DXF6agpKGNuX6CyTKhEcWsqenYUAEj+3RQxY3yIaeGuLu9NBjK
         d4IKcB5k+FIKEEN1CJxrR/iovo8J4+3BMmB/q43tjPl+D1iye4ub1B+fU1Q+dwtUfdbw
         G5L2GwsXPNBHfN/DO7IOX2wZCE3BXr9qsWgmJ40hIKr6G5rGTACyb6TRBGmV38cLfI6H
         mNUHnbWtLLU6XIAhQowqM26wNjY8TZelBdS/MO0DVjwXhROSYjc0Rri3VA7L1vjGg3Fd
         qBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723194757; x=1723799557;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/g1EWdSRyPvJJ8eyFtdobneAEkMnKZn9VHRowDdqkMs=;
        b=qliflAutJ/gG/tONca/U+HcLDHBTjjMgAVDN7FLod6CvU1IjBel2vLAZQszz0nGH4t
         Zer3rEXDTDEmkLiSXHpevSpgOW+E+7WcvaIg0a31qOLSNjFJknnK01r8J9nFJUuBRK/U
         P85EniJdBLwc6pF7bKcifF/VVvPA3VTxVLS7bZ5pszTl2rPzK1ZKBrOEuTwbPKlV8yCe
         ukLx5MTycbKs00Ny7bW1QCEmadm48Tba8dG4W6A1kMs3pZ01e0YyCPTs2UR3WfPwW8nH
         BENw8SmliFVikjUE6i5QGnDcMVTzRZQjL2vPk+WuoNJs92dnEL7I8yUx03amxU+r7bur
         Ic1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHJCrPljAZPFWyuMQe5hxZSw7Gn9cXUBZUBjyFCBnld/ob4Bz7AvSRfhUYrGh8Q/ljZFmWh/jnoLX+zOT68fiwEBTjNak3AhiZ5QoTrw==
X-Gm-Message-State: AOJu0YxkvJxQmFH1t6GCj543XUOKjuspEZX27EW8WW4igiQsNdOgmDuT
	RRcyAy8FKqXAePx0dO1S9lkHdV9fVF906rB6I8hI4ByxSVwdkRVjZXtBC/j38uY=
X-Google-Smtp-Source: AGHT+IHDUZDs7bOcbUASgJVPa4IcEoa+TGubCNTDd+aHDQmy+MvrocMHlvfzwk/Wi4ksiDbfFd9BVQ==
X-Received: by 2002:a05:6402:42c6:b0:5a2:ec88:de7a with SMTP id 4fb4d7f45d1cf-5bd0a6dc52cmr695902a12.33.1723194756675;
        Fri, 09 Aug 2024 02:12:36 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c4b5f2sm1358221a12.45.2024.08.09.02.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 02:12:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Aug 2024 11:12:35 +0200
Message-Id: <D3B9K69AAWNT.2KIHAZRFNB8NP@fairphone.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: qcom,sm8250: Add generic QCM6490
 sound card
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Srinivas Kandagatla"
 <srinivas.kandagatla@linaro.org>, "Banajit Goswami" <bgoswami@quicinc.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
 <20240809-fp5-dp-sound-v1-1-d7ba2c24f6b9@fairphone.com>
 <e8a24709-de96-4d09-ba00-1e084a656c68@kernel.org>
In-Reply-To: <e8a24709-de96-4d09-ba00-1e084a656c68@kernel.org>

On Fri Aug 9, 2024 at 11:09 AM CEST, Krzysztof Kozlowski wrote:
> On 09/08/2024 10:33, Luca Weiss wrote:
> > Document the bindings for the Qualcomm QCM6490 sound card.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b=
/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > index c9076dcd44c1..0a31be6d917f 100644
> > --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > @@ -31,6 +31,7 @@ properties:
> >            - qcom,apq8096-sndcard
> >            - qcom,msm8916-qdsp6-sndcard
> >            - qcom,qcm6490-idp-sndcard
> > +          - qcom,qcm6490-sndcard
>
> I think it would be better to make it a board-compatible and also
> followed by qcom,qcm6490-idp-sndcard fallback, thus no need for driver
> changes.

Hi Krzysztof,

So that we get "fairphone,fp5-sndcard", "qcom,qcm6490-idp-sndcard"?

I can change it to that in v2.

Regards
Luca

>
> Best regards,
> Krzysztof


