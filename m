Return-Path: <linux-arm-msm+bounces-55940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B84A9F7AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 19:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B4AF16154E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 17:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B75A26A0E3;
	Mon, 28 Apr 2025 17:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ems+49sF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA724AEE2;
	Mon, 28 Apr 2025 17:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745862535; cv=none; b=b44YCknkXNB77UKKYAUkwG11uFTcivbbA4KBLczHMoAIZQwx0Gzse27yoHhRlBvrIlx65gga5V+u4l+MTJHbA5pmUulTYm1zAOOOqJRVv3W20l0TFejHM05Of2H0P9eJyxKLu6sXB5QktBVzRMP6NJlWAHaxgIfxNUYuO4eECZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745862535; c=relaxed/simple;
	bh=aaZVB+aDpBymAkd6Y7OtgM+QVFrwZS+gg1+NpH1ktaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/6bDSkFgBx8z2wGqYgZNPPRB+dUBYyOWT46M/RXqLQCZhAnmfJo5FQyqMrW3n8fSqUMzrCVOoln7b7likgS/cy/az2E1ebDQEbdLZpnIBaDsqaX8tUPTn+rhsU3TP7R11vKrQLbSd1aO7U3JxGCUIWGplFre8L6LnCYtyFux9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ems+49sF; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so7980076a12.1;
        Mon, 28 Apr 2025 10:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745862531; x=1746467331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Vf/mI66Rv8XzHy9E+ZX7qvMAU+JZA/4MEEE+2e0H/k=;
        b=Ems+49sFUWh2UXpBDE9/RG0abUTBdxIYUS82zB9nmRfasRLkUGHwm81zAlUApqLPhV
         iDgdbbHq2AKwK7TM/gHMzKYCEOPNTPQPxrwHhdRBUi9yQltChR3iLhGNoKn+HcncZdwH
         AdP/RibBrYlDTEvvcJ/V4J4OJA+opiVLZdrU+0htjttFZVZZsB+4Sr6byPg92MxG82lo
         7/5S1q4QLJkBrm78BkLFBmuaa4ciXxZPmWOYCAT4UCqQwFZS7WbaduAKfJ9RVUyDpcWk
         dHo/GgWQjfbKRYnu0/c0q59pQXdMCrewmsbNm9HhL+ZjdkB7Aiy/0lqyqyvpwZAsxtNY
         6zmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862531; x=1746467331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Vf/mI66Rv8XzHy9E+ZX7qvMAU+JZA/4MEEE+2e0H/k=;
        b=CjSwu9hDlPvKXSBboKR5ib7fxZfPDtIdmswBdT7RMkdEoFmE15CyQ2sLqukn+4WB0h
         T/mu5wQiBqTIKn2CYzIso9AWZvKCxfh7Ppliv914b1vr5GuNLjqa9QbGufyNxwQ3v7P9
         C2w1dARk3GtsPqYcqA/BbAeLIljEEo7qo5Z7sKvfEMaOkbkkttc81ZXAQDloIE84r5Y1
         dIv0SMaGrz5oZ4ye0bZVqLSruuMEMgOzTynBYW1ch8qPJ275+dB+d7EMx2p3XWMzSX79
         k3LjC0s6HMJ9NLfSGVqieoOXCtkZhCZXmxIxtpOC04+xO/ZzrBFCp7fnLMAeL0UnsFzt
         RH2A==
X-Forwarded-Encrypted: i=1; AJvYcCUz/WcJtRa4EIxTWTlpBtQPz7L1HwzAgGrLU23PiqKZ5uGSM/bYDmv7GaQSkBP/TpYd8PbpAWUf+rRJcdqF2Q==@vger.kernel.org, AJvYcCVSRdqTS8p3HroFo2SN+xsOZJcGNOOL2NW2wg6AKcS7tkhtGKkpM/4qM2TCWrPQc+is4EKAr6TBxYcAA7CN@vger.kernel.org, AJvYcCVe53ds+bIdys+KaAjfmnxJC1xsRChPtYieBH8IwGqUB5U8ogLab4Mnd++byc0JMiy1pA7pcIkicxcs@vger.kernel.org
X-Gm-Message-State: AOJu0YyV8rMB7KufHVP1EmgIeLs9JBKh8hnpwaJ8ekSUYV1s46eC9JMj
	gSlmCkmg35UFEFrTYUemntyOeTK9xaAlQNFald3NmOx6GdVSxJ0g67BYn2vCGR7x5GXm5LfDjEI
	2w4G9+h1f3VelkO4C0bNuB6JlJmnbVPk/
X-Gm-Gg: ASbGncuFPaNKc1Wp2f59XGtNCUMKaKFa0+g/aZShTt2VtlramLfohr2P2TskqvquRhZ
	eBRXylPK0Hv6wvi8S0uUIMkmxCN5o8wbGqBg8ES/dmr1H3nMiPkN/CKOW8dGRWE8WrA89qubkni
	oJEzx9x5bcrlp9vubx4NLf9YjE
X-Google-Smtp-Source: AGHT+IGkEVMGuSbs52hJFtdDACZAKZBg6rFsmJZeiNRRWH8v3gKGVwRXQX51w7ypjbM0bIqr3OKtwO7zZieGhOhYSRg=
X-Received: by 2002:a05:6402:2803:b0:5ec:9513:1eaa with SMTP id
 4fb4d7f45d1cf-5f739838f99mr7758343a12.23.1745862531335; Mon, 28 Apr 2025
 10:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425-miix-630-venus-v2-1-cdfca385a0c8@oss.qualcomm.com>
 <CAOCk7NrcpwAnUKcVsc5D03Aazt=qWLZB034xa2FH2PF9LuL6ZA@mail.gmail.com> <vxwbzzds4lkixt2zsvjwnmfk22u3mmvp3cqk36aak2thomyagu@znr6b7gcue6w>
In-Reply-To: <vxwbzzds4lkixt2zsvjwnmfk22u3mmvp3cqk36aak2thomyagu@znr6b7gcue6w>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 28 Apr 2025 11:48:39 -0600
X-Gm-Features: ATxdqUGktcu0J7t2I4ixs3X_7ObRlCOmP1j6lxe04liPkzVFBas9H1tZkKrd_YY
Message-ID: <CAOCk7NqLQdpbvdknEHEB0NNU7OPhmmHkH3Q4PCYiOzf2fBQBkw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8998-lenovo-miix-630: add Venus node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 10:21=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Apr 28, 2025 at 09:40:52AM -0600, Jeffrey Hugo wrote:
> > On Fri, Apr 25, 2025 at 12:28=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > Enable Venus on Lenovo Miix 630 and specify corresponding firmware fi=
le.
> >
> > I'm curious, how did this get validated?  I didn't think there was
> > enough infrastructure enabled on this platform to check that the
> > lights were even on on in Venus.
>
> I must admit, I basically checked that the firmware starts up. Marc
> Gonzalez worked on enablement of Venus on MSM8998 (on the freebox), so I
> didn't perform a thorough check.

If you got the FW starting up, that is farther than I expected.  I
must be wrong about the capabilities then.
The DT node looks right to me.

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

>
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > > Changes in v2:
> > > - Rebasde on top of linux-next
> > > - Link to v1: https://lore.kernel.org/r/20250408-miix-630-venus-v1-1-=
771c330ee279@oss.qualcomm.com
> > > ---
> > >  arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
>
> --
> With best wishes
> Dmitry

