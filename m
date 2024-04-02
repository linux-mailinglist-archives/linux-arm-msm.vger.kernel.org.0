Return-Path: <linux-arm-msm+bounces-16031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A32894DCD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 10:44:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C762283B08
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 08:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EECC45BF9;
	Tue,  2 Apr 2024 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i/GPU6/P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486F04501C
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 08:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712047485; cv=none; b=sEdSLB/zySnSSpKmcf7zPF21yDUT0nTePLm99fgqf0CXqYSD5WX7manUDUScRD71amfEDFZj9YPasHnKqa0dl0d/gMxP0yRh3+TgX0MRvM50/k20F8fqkeyIWgd7ls3fEvDIlkvp4s4nihX760oLPrIqZp+dc8U1LYqcdZ7iLYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712047485; c=relaxed/simple;
	bh=zcYPc3kIDg6rlnh2gZjjeIvpIPzvaeFy4b1q5o+QnUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VH4J1hRp4+VvObEKZr/zNBFLlf1QRzQSJsqVc/JaMmR2tDEZRwMXK9RGQbZ2rwto+gQvdRk3fHjMV+hZB2w6RywNs2ZgnTN/se3gL9qBbLISIVIZxOaDo2LqhJWddc4Z6f0p3k/2szNwqkXz9dFJNn284fac50hvf7QzHoUgDQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i/GPU6/P; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d4360ab3daso63098441fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 01:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712047482; x=1712652282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3IzUDTGA+qb6viFGbq1/XCjFFQY+f33uVg0Jns5ZNU=;
        b=i/GPU6/PwF05cXrBInMN32uDAecOmqunsSopmS7f2fLx/OBCz3G1VAkP0LnVoD607v
         p+xtEvySzVcPnyDOLLmhRY4kBFmNkESzSuX9FpUupZweABiGd8PR0c7/lnZnxfq0VQNt
         PC7+ZPklPJSuuPQR+aLjKMTxIPt2mzEyulW+gfAxblF7eiVWeOTRHO6FFrg+1BSCUOcL
         Lbn48bawRY5XmNfHfk+nzBtClwohr6eRI0EWrAM9qZIrkldq5MLuyWtLpDPiH51Ublpv
         iFA9SZGYrhdHb6kXPRoXvN9iBiDk3dvtPAV8+qCglbChIkq1pi3xbz8UVQ1q6qducfJP
         iBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712047482; x=1712652282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3IzUDTGA+qb6viFGbq1/XCjFFQY+f33uVg0Jns5ZNU=;
        b=Iwx7uHgiMM8IUR5ZXZENHk++vXnzB7oz9EMX4OZ5Ch1CTwhP6F3hhCx6mBApq5EANC
         POw+k+orlwYNAPCwoXdKY9Aq2lmxyQvS1SFqCjTz5rPcSMg9l74RPGjD5Kqzs7QPofNP
         JdlHA1FBLwP+wkVSB7prPZqxJdTpXLBmr+BHCWaYcpzUlUeQRsVqf5Myl/3+yFHSpO+W
         05kzaYSKQeBvpwcvrdxNB8BePpT803z4wcD1JgH47CECAc+6xjpznFe/lk2jdIZzXwvj
         hR2ER9671C159AH53yALjn76e5bXtMccxinkyMS9fudo7cZv/GZNPOem1gZ06Uk7cIWm
         YiXw==
X-Forwarded-Encrypted: i=1; AJvYcCVvZqQ2M55LaXOvHTPJWZgrx0LCaOAlYfRfeop90WU0oUQzgudpsPcdPD1Sm1k0t+eIw43U2Wy99O3KMLxA7b3YCUuNNc4kimyJB6okOg==
X-Gm-Message-State: AOJu0Yxzt0iLt5qh2IGZo+9AXCy2qpW7R9lY9jENnLb6fAGHclGeKfMe
	wgOtoM5lXIiQnuTkBR+suH5HVwELPgHUMd51krv2mzkA22DUhUhU9V6VQpFRZcgQt5kbZEULprx
	RQY1aUhvajDzu5lP3uhHL6CuSbnN3NHxF+WA59A==
X-Google-Smtp-Source: AGHT+IFkAYNM/XEAIBAAOr81EfU+jKUMoadzrsQHB7L061fV8T1Dmp/9EAGJYHlLGFygqdYZr9Z+bOn9ffLbuXiHoqQ=
X-Received: by 2002:a2e:9d97:0:b0:2d8:2422:c1d3 with SMTP id
 c23-20020a2e9d97000000b002d82422c1d3mr1876534ljj.44.1712047482269; Tue, 02
 Apr 2024 01:44:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325100359.17001-1-brgl@bgdev.pl> <56e1c63a-4c09-4d92-9ef2-aad5390879cc@gmail.com>
 <CAMRc=Mf_pvrh2VMfTVE-ZTypyO010p=to-cd8Q745DzSDXLGFw@mail.gmail.com>
 <CAMRc=MfsVWcoMC-dB-fdxy332h-ucUPTfEUMAnCt5L-q3zJxWg@mail.gmail.com>
 <82f94b54-82d1-49b9-badf-63d948b347fc@gmail.com> <97e1f121-9e84-4e63-9c9c-57e2de0b29d7@gmail.com>
 <CAMRc=McLJFGcy-A6PZNmjgDXnvx8z0J4k-Dbak-txvWnycHG2A@mail.gmail.com>
 <2b1dc031-d645-494c-9103-a2bb422ea60b@gmail.com> <CAMRc=MdoSPuedbGhy4toDEkw0vSzESDz2bXGpyt_=R4hqXW+Uw@mail.gmail.com>
 <9b1e5ea0-bb32-4c42-b2e9-204bde31b905@gmail.com> <CACMJSesvM6_PhhR_2sP4JX6bR4ytVVg=MwWBEVrCHf5FNp2JXw@mail.gmail.com>
 <9db0fc7b-f24a-4d76-b8bd-ec577ecba0c6@gmail.com> <CAMRc=Me9x1OXKXXxyhzZ6mxffmaoq=4QhMXCL6L71_xso2epWA@mail.gmail.com>
In-Reply-To: <CAMRc=Me9x1OXKXXxyhzZ6mxffmaoq=4QhMXCL6L71_xso2epWA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Apr 2024 10:44:30 +0200
Message-ID: <CAMRc=Me0MamtJoPtQnucKyZx9pfkEPDAAZqWFWRU0CBcj+P50A@mail.gmail.com>
Subject: Re: [PATCH v9 00/13] firmware: qcom: qseecom: convert to using the TZ allocator
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Guru Das Srinagesh <quic_gurus@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 30, 2024 at 8:16=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Fri, 29 Mar 2024 20:57:52 +0100, Maximilian Luz <luzmaximilian@gmail.c=
om> said:
> > On 3/29/24 8:46 PM, Bartosz Golaszewski wrote:
> >> On Fri, 29 Mar 2024 at 20:39, Maximilian Luz <luzmaximilian@gmail.com>=
 wrote:
> >>>
> >>> On 3/29/24 8:26 PM, Bartosz Golaszewski wrote:
> >>>> On Fri, 29 Mar 2024 at 20:22, Maximilian Luz <luzmaximilian@gmail.co=
m> wrote:
> >>>>>
> >>>>> On 3/29/24 8:07 PM, Bartosz Golaszewski wrote:
> >>>>>>
> >>>>>> Both with and without SHM bridge?
> >>>>>
> >>>>> With CONFIG_QCOM_TZMEM_MODE_GENERIC=3Dy (and the upcoming fix) ever=
ything
> >>>>> works. With CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=3Dy things unfortunate=
ly
> >>>>> still get stuck at boot (regardless of the fix). I think that's
> >>>>> happening even before anything efivar related should come up.
> >>>>>
> >>>>
> >>>> This is on X13s? I will get one in 3 weeks. Can you get the bootlog
> >>>> somehow? Does the laptop have any serial console?
> >>>
> >>> Surface Pro X (sc8180x), but it should be similar enough to the X13s =
in
> >>> that regard. At least from what people with access to the X13s told m=
e,
> >>> the qseecom stuff seems to behave the same.
> >>>
> >>> Unfortunately I don't have a direct serial console. Best I have is
> >>> USB-serial, but it's not even getting there. I'll have to try and see=
 if
> >>> I can get some more info on the screen.
> >>>
> >>
> >> I have access to a sc8180x-primus board, does it make sense to test
> >> with this one? If so, could you give me instructions on how to do it?
> >
> > I guess it's worth a shot.
> >
> >  From what I can tell, there shouldn't be any patches in my tree that
> > would conflict with it. So I guess it should just be building it with
> > CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=3Dy and booting.
> >
> > I am currently testing it on top of a patched v6.8 tree though (but tha=
t
> > should just contain patches to get the Pro X running). You can find the
> > full tree at
> >
> >      https://github.com/linux-surface/kernel/tree/spx/v6.8
> >
> > The last commit is the fix I mentioned, so you might want to revert
> > that, since the shmem issue triggers regardless of that and it prevents
> > your series from applying cleanly.
> >
> > Best regards,
> > Max
> >
>
> sc8180x-primus' support upstream is quite flaky. The board boots 50% of t=
ime.
> However it's true that with SHM bridge it gets to:
>
> mount: mounting efivarfs on /sys/firmware/efi/efivars failed: Operation n=
ot supported
>
> and stops 100% of the time. Without SHM bridge I cannot boot it either be=
cause
> I suppose I need the patch you sent yesterday. I haven't had the time to
> rebase it yet, it's quite intrusive to my series.
>
> I can confirm that with that patch the board still boots but still 50% of=
 the
> time.
>
> Bart

Hi!

I was under the impression that until v8, the series worked on sc8180x
but I'm seeing that even v7 has the same issue with SHM Bridge on
sc8180x-primus. Could you confirm? Because I'm not sure if I should
track the differences or the whole thing was broken for this platform
from the beginning.

Bart

