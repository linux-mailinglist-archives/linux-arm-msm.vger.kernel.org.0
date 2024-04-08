Return-Path: <linux-arm-msm+bounces-16764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B8E89B95E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 09:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 479AA283EFE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 07:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655E93BB55;
	Mon,  8 Apr 2024 07:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1ZHkJbeT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C143BB22
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 07:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712562606; cv=none; b=L9UdTLNPP22mXUN7DvQHYZ+CBEP6iwC9HxdA790b0UXcxiZZR7PdSA8MR5TvC5jGWV+guY/zYlQrrWUAbHwJQ9drErj8eGH6wr9HNRrJn7p0DT5uZ3EjHdk7eSfBSJXv63jA5DCorbDssaV7+Y0xrEV8cqVPPP5zd2zMs9h2SvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712562606; c=relaxed/simple;
	bh=62vWMyM9ah8wOO+7CU7SyM0WhITWK9lt/sA4APfNOvo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=mNRr77CO7NfLuFtRnmfPO1sPxFBr+6EEN5EIxYE4mP6hhQS+0NNOofXx2jqm8XMdjFWBY4Jha0md7RYSqIFOEQRWRE9Jfji8FWCrDzJ0FD/AImiPt69oCMCU5ZcjWz4ZraOCULVqvX7cNyLWr4pbtOKEEfCeqLY25bTIoFYm9GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1ZHkJbeT; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a4644bde1d4so575586666b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Apr 2024 00:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1712562601; x=1713167401; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfgzFQr5Wn5nGNjOjmePsm1TRI//Puj9xojQkt54LHE=;
        b=1ZHkJbeTpAz+gh+CUHHOfINR/SX3pJAR9hMbB3wxyRUDRunYDfG5g+qzkRZouNpLqk
         aTF1FfFqY8BKsi2XpEnNPnJ6x2+CV+yLBlbY3xd1v2peLrEuGRKa0l7FNdUwuCdnFq4c
         /H4p479Zf+MLLQRzbBDDQvI67NAYI4Po7SGL3i7haDNQyck77d2+j5cNiHzA1rN6sGi4
         akb2fHCVe2nSgsABZJIWiu+Q0W43T0UWPE1ysyMTji2NAUUqGt+D5t+/N6Dm/HJmpR/I
         enscToTqvko6SQtq9IegujD9dIiX6JybwwlQCXpivGQOTCySGKZhuqEqiNyINuwpkadA
         NJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712562601; x=1713167401;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KfgzFQr5Wn5nGNjOjmePsm1TRI//Puj9xojQkt54LHE=;
        b=ctZNcM60pvBFDyYq3WwaU0jEtVfmwmc+L1o4R4ajKeMgUHqojYrlJRPZnC2r+YNsBK
         YJ4vd/4nOKUhFWoANofKNSQQEE1p0aWQJebV0Y9DDIoVVPzghdEayBLoslZTcyXAKApV
         ZVBL26bNuQFEq7pwdhgoDKaWPr3Ef6s0KufxuL/TLPjEPqXKaKX/8scaeZbT0ZsOAv/m
         hJ1ZoBB1xsufllEe99mJlsnTfFJ44i0N3DXmzhHjPyMfFFLWFQ4+zkETzGf2hLgiz6MV
         NRTPT5uvIITlxhdXwjGg4b+lJ9bQRgs4jB6+lR+rAyHZ8aGlCcN4fjZEs2/okgVv88sE
         eilA==
X-Forwarded-Encrypted: i=1; AJvYcCWcQ1m5azV4fN5kFFaAHh/oMEOoknjeyReaB+Rymz4TJ5h4i5VdZ1RURTC0CwRMfyFNkSqhUGmaDiExvmdKbC8hkA4HimCRXgW6cthZjA==
X-Gm-Message-State: AOJu0YykG7XmEnB78Lr0zgaWbBpQhC7slp3RXwc1Np9QmgU8vLCnLb8A
	pT8MeCwIiKYBLWaCcSDIMlC91/Pmue7UnDHRHgol27agRp93fgflVwjUyGmzXy4=
X-Google-Smtp-Source: AGHT+IFJUfdSA6v/lBANNp6iDa2JuX8w0cZ5BpDfKTm0N9EV+TTWcWipmjmt3PpztCVgiHFVkU3nzA==
X-Received: by 2002:a17:906:ac7:b0:a4e:5a23:24d with SMTP id z7-20020a1709060ac700b00a4e5a23024dmr5000388ejf.38.1712562601498;
        Mon, 08 Apr 2024 00:50:01 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id lx26-20020a170906af1a00b00a4e440989f5sm4079452ejb.159.2024.04.08.00.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 00:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Apr 2024 09:50:00 +0200
Message-Id: <D0EKRXT8JJCG.DJW8LMIPMWX5@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] arm64: dts: qcom: add USB-C orientation GPIOs
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.15.2
References: <20240408-hdk-orientation-gpios-v1-0-8064ba43e52a@linaro.org>
 <D0EJR77G6HF0.2LUJ3XY1YFG65@fairphone.com>
 <CAA8EJpqUz8anQ9V_Ht67DMrMXw49u9R01mHKDMxnGf-UpXrrUw@mail.gmail.com>
 <D0EJTA1YFZRW.3LWBWJC0QYQ62@fairphone.com>
In-Reply-To: <D0EJTA1YFZRW.3LWBWJC0QYQ62@fairphone.com>

On Mon Apr 8, 2024 at 9:04 AM CEST, Luca Weiss wrote:
> On Mon Apr 8, 2024 at 9:03 AM CEST, Dmitry Baryshkov wrote:
> > On Mon, 8 Apr 2024 at 10:02, Luca Weiss <luca.weiss@fairphone.com> wrot=
e:
> > >
> > > On Mon Apr 8, 2024 at 4:33 AM CEST, Dmitry Baryshkov wrote:
> > > > Populate orientation GPIOs for some of the PMIC-GLINK-based devices=
.
> > > > This leaves only FairPhone5, RB3Gen2, SC8180X Primus and SC8280XP C=
RD
> > > > without the orientation GPIOs declared.
> > >
> > > Hi Dmitry,
> > >
> > > How would I find this GPIO on the schematics, or downstream devicetre=
e?
> > > I scanned over some relevant areas but nothing jumped out at me excep=
t
> > > for the USB_PHY_PS signal coming from PM7250B CC_OUT and going into
> > > GPIO_140 of the QCM6490 - but I'm guessing this is something else?
> >
> > It is exactly that GPIO.
>
> Great, thanks! The PM7250B datasheet and my limited USB-C knowledge
> didn't help me there much ;)
>
> I'll send a patch to add it.

One thing I've noticed now is that the dt schema currently explicitly
disallows orientation-gpios for anything that's not sm8450, sm8550 or
x1e80100.

  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: pmic-glink: orientati=
on-gpios: False schema does not allow [[84, 140, 0]]
          from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,pmic=
-glink.yaml#

So I'd think also this series will cause some extra validation errors if
the schema is not adjusted? Are you planning to do that?

Regards
Luca

>
> Regards
> Luca
>
> >
> > >
> > > Regards
> > > Luca
> > >
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > > Dmitry Baryshkov (4):
> > > >       arm64: dts: qcom: sm8350-hdk: add USB-C orientation GPIO
> > > >       arm64: dts: qcom: sm8450-hdk: add USB-C orientation GPIO
> > > >       arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: add USB-C or=
ientation GPIOs
> > > >       arm64: dts: qcom: sc8180x-lenovo-flex-5g: add USB-C orientati=
on GPIOs
> > > >
> > > >  arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts        | 2 ++
> > > >  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 ++
> > > >  arch/arm64/boot/dts/qcom/sm8350-hdk.dts                    | 1 +
> > > >  arch/arm64/boot/dts/qcom/sm8450-hdk.dts                    | 1 +
> > > >  4 files changed, 6 insertions(+)
> > > > ---
> > > > base-commit: 8568bb2ccc278f344e6ac44af6ed010a90aa88dc
> > > > change-id: 20240408-hdk-orientation-gpios-141bc7fd247d
> > > >
> > > > Best regards,
> > >


