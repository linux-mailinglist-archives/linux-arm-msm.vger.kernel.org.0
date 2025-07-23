Return-Path: <linux-arm-msm+bounces-66291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB95B0F260
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 14:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D14697AFD48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E354B2E5B3C;
	Wed, 23 Jul 2025 12:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Q46Jvvlp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138142DAFDB
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 12:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753274140; cv=none; b=H0+tRzpPjbDasZxdl425tcLbPVnIHJXVCsN2DyolYxN+K9wEKEgXEiPsK0ZfQgDsVE0PbDXA4VOZgoqFdsyRy+j9isBM5CMb4sqBGIta+5nqf+m4czAC5ngkTthPI+d2Pav3wAyazsyQmw66PtlK2frt8Bj9xYa+u8oWF8eSwzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753274140; c=relaxed/simple;
	bh=0EFY2t7da13tTNsn0kil1sRIUFA9tzt2B90v+UiI8vw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=ESV7J3fCI5fV82lST521HvF6RZumytQg9Ja9UmsKYaRCS6s3xgb9kW0S+Le9aUkAiqcgAoJkcnNhq3itcGY1LkNF7652nDXwi6SnOgU5Czq6N8X2LaHpHQ3rLx4AQvJYibv+JTos2iGRAl3w9Wusdbe1sD7wFhfXYvt8O+2KexQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Q46Jvvlp; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo10276602a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 05:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753274137; x=1753878937; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+L8u4oiexjWpNgCligb/vTUSVa660rSwO8FUFGgqs0=;
        b=Q46JvvlphqQ3wb249gRqcxWSAE5qFicgBvNrgzFqq8cWqrqvmhLJVqITQf74A/I91K
         001QS+vxKAkNmjGOhTHzBrF+jTsnClICVLkoPQU6jmkp+TDIQIIHdT20Uj2LWFSefGT6
         sV87Tf6ZU36xpQ37iXH7HxmWAnvKFMaFs1Kbrxoy8/VUIs/09PkiVOk9r6vnWBmIez0G
         KY4WCQzWW9cg3Q731ZYzI5aRC3HfYD0sBwdv7aYkCo/m9BnNL6cRVNfUTP01mhqzfY5o
         YsDp2KS8dJd5dK1zzpxpp7oIb4omo+VHvZDHvGGFucHuThdmjqsIIeQfqcyE6EFZ6XAB
         HNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753274137; x=1753878937;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+L8u4oiexjWpNgCligb/vTUSVa660rSwO8FUFGgqs0=;
        b=Mv65T781tJxin7jth2l6QTuOOnydAhO5a+3XGahztK26XuLt3afymq3fsxm9vqLDdC
         WiuWdhQ/IDj8KdfGMLhNia3RDyJYUK/rptiyXIniTPIcsSuHtxM4BFKl6a+J05nQp6y/
         Z+HXO8hQl+sVAaaSxwj4dHSX5dBw8u5i8VOA4hjJICYYXrcmXuwX86Dr0QmNRoMsZski
         z+bbwgPDjkwcp8fChWyn3OL4vp8/L0dFtzLfuRKEcKJmjJrOg5ZpvH9I8+ZYCz83MzjD
         lqyuyLAPTChLjM09VsiuOMAjYziA2y9uvLWKbl5sVkgvPqkVcHskjryD/jpECYV8S1PO
         Ytrw==
X-Forwarded-Encrypted: i=1; AJvYcCWm60b/foaIh4ntEazCz3SNMWh551/x3qsaesAPcy4Tnfz0ibkBfWp31zxbHHZhfvSN0wIAWXo9b9rNeKRU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt2vIdovhPrS2ZHok1REi1dcxe2dsm7aJgA14N18Z/P31pnRUE
	U1Gfh1CZxvzNOZuO4D0DMqchyBWWjQgAxq3S4EFgSD2j+Vgh11MoH2psqIkCDSIF9G4=
X-Gm-Gg: ASbGncuTVipg8AX4Pzn/Qj9bVVUVUxFcFq9sCaqE/T2tyBjjFVvfy6q8OyaK0rrCdVa
	qPFQyP4rrp8F3EfY+6NPONl/GplxndBrlu9gE/JlirAVl5CkFhhzsQhTYY1gU2yyzQRkigaHJbw
	HpzpEJgAY+IFsE2mU8ZOb5CM0LDjU+/+EZYI/SI0jjbc7n/I8GBZ57VJQtZTSM00XxIu8WQkPvu
	f+nxlvh9foIyAvlIyg4eo2flFCyljnSJHJaC3NpoX48CXGJSOrD8TH0rwaLo8Zh8350YPkmd6y9
	FQaOY/ffuitIWnxtH2upc559PK8/dfqiWw5E0C6CcYqpuRc0Ut73sBi7SCA5cE4FMIkS8TaLXUe
	9qJOp/0ofW5MypBKk4yIAG9yRCMtqIao+0LknMXVKu1/jacp564ErJ6i1eDpHcO/2utQ=
X-Google-Smtp-Source: AGHT+IHiFY0lG9mRPneADgyis/AcrbOpYfn7ovZrGfkcXUWNCou+f8RDQqROv1F9QSh2mViYt+ozOQ==
X-Received: by 2002:a17:906:9fc6:b0:ae3:4f99:a5aa with SMTP id a640c23a62f3a-af2f64bcdf5mr272122666b.4.1753274137382;
        Wed, 23 Jul 2025 05:35:37 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca817b7sm1038885766b.135.2025.07.23.05.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 05:35:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 14:35:36 +0200
Message-Id: <DBJFT72B59MC.RIRP9YSHOX98@fairphone.com>
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
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
 <DBDAPORDD5IM.1BHXPK225E2PP@fairphone.com>
 <DBHIM4SA3OIK.PXX6HMDE93B8@fairphone.com>
 <ac3f1eb2-5830-4bda-bc57-c4d29c22aba0@sirena.org.uk>
 <DBJDZBYHR94V.1QGVALCL60M1X@fairphone.com>
 <00c2ac7c-763f-467f-8199-76de9f5d71b0@sirena.org.uk>
In-Reply-To: <00c2ac7c-763f-467f-8199-76de9f5d71b0@sirena.org.uk>

On Wed Jul 23, 2025 at 2:19 PM CEST, Mark Brown wrote:
> On Wed, Jul 23, 2025 at 01:09:35PM +0200, Luca Weiss wrote:
>> On Wed Jul 23, 2025 at 12:57 PM CEST, Mark Brown wrote:
>
>> > As previously discussed they won't apply until after the merge window.
>
>> Sorry about that, I thought the conflict was for the 6.16 merge window,
>> not 6.17?
>
> There is a conflict.  You could check this yourself...

I see now where the conflict is, due to an updated previous patch.

I will send a v3 shortly with that resolved. Then it applies on your
for-next branch cleanly.

Regards
Luca

