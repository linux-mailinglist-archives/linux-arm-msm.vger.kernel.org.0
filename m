Return-Path: <linux-arm-msm+bounces-6742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D76C828506
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 12:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B3F51F2596A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 11:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6491D37167;
	Tue,  9 Jan 2024 11:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jRE56T1L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D064536B1A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 11:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-555bd21f9fdso3189893a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jan 2024 03:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1704799675; x=1705404475; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKel/uL1tajPej7Kr+Y3gD2pm0Q/5wlP7q9l4+pRLR8=;
        b=jRE56T1LeQJAkA6mhHCrJJdZN4io3r5Q1w3lsA3Q5ln52EOtCaCvigxk9b1bKXV0Uc
         l02SqWOBEwm2aDRxLaY9990nhiSA5bCCcG82N5iXrasCHFLvI//xbMgDEnSApTFTwaIz
         MSl0tgwuDXnJQAxEyB5RBX4efzT5xCnxG+Eq5WBttWGmroJWSwIZBIRj7t2TRe0e0ToY
         Qpf93VqfghWjBWrSvIfCg6iHEtX9UAjbvMz4htxGj8R9rgG+Sj0OWoQT1E2nnwbujJxN
         hFnH3jAgeYx3+0Tlt26MUmgT40Lr3b2vukLkIF832pMOPF7wvUB2JSeGSCXx++3SEnj/
         0xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704799675; x=1705404475;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oKel/uL1tajPej7Kr+Y3gD2pm0Q/5wlP7q9l4+pRLR8=;
        b=e9KdmeGW4uC5xQNdNVw/8jM7yTC87KGfAwmc9gJxNd6ztXp65TQmLfCQqvE7HHoMXZ
         +hEAPLfshXUZnsROBahwFd1RrIfVZBzOZahSgjBLH2u4rDrU1uCL+FKlruzRzLNaEOjs
         vRlZF8QXATJ9UEMuwKpyfPLYYtVxPryg9cwpHGG4O/s56HvqcVu5gSPxe2di4nGWrOTg
         EsJhkTCT0kp62YnrRUncW31v9jNtKpbbYgT3FQv5jQ3X0fs6y8lMTqXd71q1S6bpBMIf
         on4dcK/p/qnvfTc4+7AEtC3sQ4dT/OvnnsPSjECZZA5Va8nUywpg4rRoW8Wm+m19HqPq
         riqA==
X-Gm-Message-State: AOJu0YyEtZFvwvL/mwVrr0ee3igrosAA2ZScRluOE4B/Kqk5csdBA/bj
	7GkrkU3PtN6wF2IDZVio/vfb0wAPOcuSJw==
X-Google-Smtp-Source: AGHT+IFLDOEYrnaFAb1pvyYayLgZLIaQwOsuzV7aIZuufvzjoaHL+sD2wiqnSgjHvZSMG2kvOL3hGg==
X-Received: by 2002:a50:bb2f:0:b0:557:188b:eccb with SMTP id y44-20020a50bb2f000000b00557188beccbmr2752722ede.84.1704799675115;
        Tue, 09 Jan 2024 03:27:55 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id b6-20020a0564021f0600b0055678085e27sm847587edb.20.2024.01.09.03.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 03:27:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jan 2024 12:27:54 +0100
Message-Id: <CYA51QMVFQZF.3NEPC3R2QY2VM@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Andy Gross"
 <agross@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Thara
 Gopinath" <thara.gopinath@gmail.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Rob Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bhupesh Sharma" <bhupesh.sharma@linaro.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] Add Crypto Engine support for SM6350
X-Mailer: aerc 0.15.2
References: <20240105-sm6350-qce-v1-0-416e5c7319ac@fairphone.com>
 <c3e82c7a-fc03-44c6-bf83-97dffaf22dba@linaro.org>
In-Reply-To: <c3e82c7a-fc03-44c6-bf83-97dffaf22dba@linaro.org>

On Mon Jan 8, 2024 at 1:40 PM CET, Konrad Dybcio wrote:
> On 5.01.2024 17:15, Luca Weiss wrote:
> > Add the compatible and nodes for the QCE found on SM6350 SoC.
> >=20
> > Not completely sure how to fully test it but "kcapi-speed --all" shows
> > no issues. Let me know if I can/should test this more.
>
> I think I used `cryptsetup benchmark` with and without the ICE enabled
> a couple years back. IIRC the CPU should be faaar faster but also chug
> power while at it.

Are you sure you mean QCE here (which this patch is about) and not ICE?

I'm not aware of them working together somehow but I wouldn't be
surprised if there's something since I don't know much of this area at
all.

Regards
Luca

>
> Konrad


