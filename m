Return-Path: <linux-arm-msm+bounces-7364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 259A482F031
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 15:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C3A52831B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 14:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39FF21BF27;
	Tue, 16 Jan 2024 14:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QRsSnLfA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF571BF24
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 14:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-a2dd05e02ffso218297866b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 06:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1705413810; x=1706018610; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9h/dGqfHWg+QB7S7VecCh/3Jo3Pb/vuBb+hs8ql8+Y=;
        b=QRsSnLfAihAwcIxzviXTEjRwcMz56JlMPqqE2pUFmrfJxAK0FDVdlykfouzLI2rwfO
         VuYDBtriz//NCV//ga9Mmzq8JNNPDnrv+3U0c3koGUQ14zJAszVu85oFBM4jX/lEVj10
         sLySTqc++dhih4uEKTGFLMFRDDlc44sIwvhzauvXY0mbbXejIMi1R3cFAgs7jYtjz4H7
         XQBbi7wGVeONwkIf8dST1DbIKE0lm1eeRZsYqehJQ+k/6GPvZ5DY5NdzL/eBV2VEmbsX
         erJv7hL8JztrueK7Yap12yWdZIGIIWz2SLxqGK0cT3R9E693GwEVrBuIdw/VJL1JaQxk
         AhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705413810; x=1706018610;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s9h/dGqfHWg+QB7S7VecCh/3Jo3Pb/vuBb+hs8ql8+Y=;
        b=j8gQCX16fxVQ6fs3uSLVBbOHvqm7uDPcmOALKmrDDkLJFWJ8Ef18JCoDYEt55TGxHR
         +wCTX8dT8bjA6Vn3kElrwas9jhlWEsIZ4ADQnvWvzUZ7C/YSdilUSVcobqsNoz3KQOg8
         EbMd9RN4Bs54orgyRxLDajhjg1+zIMdD1oleQFCgpZlSRmz4fld658cMdfgb7A9ehzZZ
         texSfiymKf4X7VLD36++dapUDjX94d0QdvyquU+RTdOY2WVeoM212VhPBOAIIWLUo50B
         Op693R2uVRb4sqxeY9ZNLmlLdrsjlZjE0w7Tst3WJkButpP6/0pJraCuNyVe8df7AxOg
         BDWw==
X-Gm-Message-State: AOJu0YzvBl/QJiv17u8ajbnKpv1niwkeD62r94UNplm7vzu1FL4MmZDt
	siGWauOmO3FXn4RS5CiUqgDA2UAk1ZafXw==
X-Google-Smtp-Source: AGHT+IFEDa0MaDz6ZHdzGscGw0QC7obdM3/JIwdpJYmwytZODaQdfo18v9kwdKCmuUlYcDZDhoG8Pg==
X-Received: by 2002:a17:907:a782:b0:a2c:e2a4:17b3 with SMTP id vx2-20020a170907a78200b00a2ce2a417b3mr2612345ejc.120.1705413810545;
        Tue, 16 Jan 2024 06:03:30 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id vb8-20020a170907d04800b00a2d5d42ac39sm3791779ejc.136.2024.01.16.06.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 06:03:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jan 2024 15:03:29 +0100
Message-Id: <CYG6QOFYOX79.2ROURJ8FK446C@fairphone.com>
To: "Daniel Lezcano" <daniel.lezcano@linaro.org>, <andersson@kernel.org>
Cc: "Amit Pundir" <amit.pundir@linaro.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "open list:ARM/QUALCOMM SUPPORT"
 <linux-arm-msm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Fix wild reboot during Antutu
 test
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.15.2
References: <20240116115921.804185-1-daniel.lezcano@linaro.org>
 <CYG4WTCOBTG2.11PA7Q4A3H93H@fairphone.com>
 <5db88d48-4868-49f0-b702-6eea14400e5b@linaro.org>
In-Reply-To: <5db88d48-4868-49f0-b702-6eea14400e5b@linaro.org>

On Tue Jan 16, 2024 at 1:51 PM CET, Daniel Lezcano wrote:
> On 16/01/2024 13:37, Luca Weiss wrote:
> > On Tue Jan 16, 2024 at 12:59 PM CET, Daniel Lezcano wrote:
> >> Running an Antutu benchmark makes the board to do a hard reboot.
> >>
> >> Cause: it appears the gpu-bottom and gpu-top temperature sensors are s=
howing
> >> too high temperatures, above 115=C2=B0C.
> >>
> >> Out of tree configuratons show the gpu thermal zone is configured to
> >> be mitigated at 85=C2=B0C with devfreq.
> >>
> >> Add the DT snippet to enable the thermal mitigation on the sdm845
> >> based board.
> >>
> >> Fixes: c79800103eb18 ("arm64: dts: sdm845: Add gpu and gmu device node=
s")
> >> Cc: Amit Pundir <amit.pundir@linaro.org>
> >> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> >=20
> > A part of this is already included with this patch:
> > https://lore.kernel.org/linux-arm-msm/20240102-topic-gpu_cooling-v1-4-f=
da30c57e353@linaro.org/
> >=20
> > Maybe rebase on top of that one and add the 85degC trip point or
> > something?
>
> Actually, I think the patch is wrong.

I recommend telling Konrad in that patch then, not me :)

>
> The cooling effect does not operate on 'hot' trip point type as it is=20
> considered as a critical trip point. The governor is not invoked, so no=
=20
> mitigation happen. The 'hot' trip point type results in sending a=20
> notification to userspace to give the last chance to do something before=
=20
> 'critical' is reached where the system is shut down.
>
> I suggest to revert it and pick the one I proposed.

It hasn't been applied yet so it can be fixed in v2 there.

Regards
Luca

