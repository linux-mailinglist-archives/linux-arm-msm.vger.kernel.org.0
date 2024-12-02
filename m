Return-Path: <linux-arm-msm+bounces-39882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D61B9E0494
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91A95B465CF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 13:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A2E1FF7C9;
	Mon,  2 Dec 2024 13:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npBdrIyG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5E91FE469;
	Mon,  2 Dec 2024 13:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733145493; cv=none; b=BZa6qYQUa5ewZ5EncDM23IcqWIG1LXN70eqrxeiadAd2jkfAkyW5yD6P7MEUmldMjNX78ckSNmbseISAZtytpQ1K30hGNwdPDr2m0VYpolNkXPlotEOKeA44ft+/OFqPxuIbfnp/5siijnoUTTaz2wGZsghS9lIRNhlmFeM9RMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733145493; c=relaxed/simple;
	bh=5/X2VWZcLhb884B2U06+UxdVUml1aa+Rb3ufKfjRT9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BbI8vO5ceB9gxU3kcSmJ7Hos+TwO1r0uZ8MyThZG5dCTjUIn8I48HpeBjGk6fWUdHKLY881l/FlbWLf/F5LB9kMpP7yf6c+mlBqvrvx1Ovj1wo55RESezz/c4vxj7ZClJnWHRq7r+nVv0wRykqmYOT4XLtOCjpNRMnl+eh7Q+Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npBdrIyG; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5f1ef6324aeso1729829eaf.2;
        Mon, 02 Dec 2024 05:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733145491; x=1733750291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNkzhZsX5grWLCVpB7LFS/T82bw7a5CHASaDFwVA1Hk=;
        b=npBdrIyGhfNK07Un0W8DcI8ZMbodwXav7ebnkVpM6H21F1CGKDmv4XiWlBeJZGeN5A
         ySRpoZvjx0WcO6xcH52dLpHHQIYQ2oMOGB9pPR1jjOA4z/LJ7pQZnldWgdwpcUVY0qbY
         JUdJ5qUngRn+1qSVqxWQkDxcUKLTWYhtOC1DWyEw+bhUvxzdnP0HKJX/Y13bJTEROY+0
         8KIuKzIJoyGtBwGQBZp4XIkYYEAiZenA0CGr5YtYV+utcjCLTHQP+IXx+qbul2+EbSmY
         xI+e7t30/osdp3lqdo+Ak1BvLp6B/5XFllCmMQUuYNkHJiwmmwTsQRY+kpu1/cwG5Xas
         C+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145491; x=1733750291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNkzhZsX5grWLCVpB7LFS/T82bw7a5CHASaDFwVA1Hk=;
        b=aIZ5xxkluhzptAMLtKDVAZrxcJCea9/4QH39EYwyqr8u/Dopo8TgnPC808pGAiqxO3
         qaGQV7gcrTv9733/Qzv5uXcnLqhJh0OEzVYJZ8q4LSrl71q4EJkLPwTIyqGEuvfnBaLG
         dQVSSdH2a1/26s0j6zfrzqKDuxFcs9E92zBh0+ixUz+6E5ntfBFdgLRliJu3LW++KtLE
         oyzYIj+1OAk7FQ9+xf23f4wP5KcdGtY6jJMKVzCIoP5C4UQd1PJ3R/XRY7GW4NU+98sz
         hFZA+ckUJglSL/haoHan/eAsiM88VrgJf/HkDYkS3G5s3MRcaO0jbvj2CVHKzlrhNTyr
         1dlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoVh1fcTHouWTHKwlxt5OU+T68hKfrWqZK5Az3RjMGDCP4HDKARenI7pZCBsvcjUEe/ahakzd4Rflq@vger.kernel.org, AJvYcCWm+v21yorREAlL4fQ4bppJTymihkencX9UQ6AkOv4o+0SMpjLQseZ1MKfxVxVnJ+XWuBE4jZIFjIPpTAAr@vger.kernel.org, AJvYcCXtKjA8fnbiAAoKQUGKhHfRlsxV5e+6PCkMrf3KlSefE/uoatpYv53dXvuZd7gz7LHFt/CbCbYjtvzK7eTH3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhUqNdKjhaCU+hASSjbccBYtNpw1gSV4eqvwgfg0ANftAKqYdP
	BZVAe/mijCFCVZ2mSnQRnV+sahyCNTx7Fw40HTdjGAWViY18IBtw21wd3gzoQZaKun8rFP/bc2P
	irfJiI19jDfiKKgbI2HgV++EgrcM=
X-Gm-Gg: ASbGncut4Ht4L6L/KmqzHeauHpBBRtUnokKUkXZieTrDVqm3q23cGLqEvtf9FvzAeb5
	L3iRw41++SKhg3TYy+Yv63JH3BjIZ9w==
X-Google-Smtp-Source: AGHT+IFRt02lZMTpOM1bIS2v4MnRUOIjLLxGB7sjqggzgFKovM0VxSCGDIp3nEMxIqbchMvq1WVzeeNNUcq8+NihUfQ=
X-Received: by 2002:a05:6358:7e95:b0:1ca:9540:33d4 with SMTP id
 e5c5f4694b2df-1cab16a8c0bmr850755055d.23.1733145490862; Mon, 02 Dec 2024
 05:18:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
 <20241008-starqltechn_integration_upstream-v6-8-5445365d3052@gmail.com> <ee668cbf-54e0-4c0a-b690-8606cb3785b7@oss.qualcomm.com>
In-Reply-To: <ee668cbf-54e0-4c0a-b690-8606cb3785b7@oss.qualcomm.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 2 Dec 2024 16:18:00 +0300
Message-ID: <CABTCjFAUp9Oa_qRweO-EpLHDTi78=07i_St+L9EDSgYxHMrc4w@mail.gmail.com>
Subject: Re: [PATCH v6 08/12] arm64: dts: qcom: sdm845-starqltechn: add
 display PMIC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 4 =D0=BD=D0=BE=D1=8F=D0=B1. 2024=E2=80=AF=D0=B3. =D0=B2 17:15=
, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>
> On 8.10.2024 6:51 PM, Dzmitry Sankouski wrote:
> > Add support for s2dos05 display / touchscreen PMIC
> >
> > Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> > ---
> > Changes in v6:
> > - refactor: s/starqltechn/sdm845-starqltechn in subject
> > - refactor: 'i' < 'm', so put tlmm i2c node before motor*
>
> Now you have 'i'2c21 before 'g'pio-regulator :/

That refactor was about tlmm inner nodes. For soc nodes
rule `nodes of the same type can be grouped together` should apply I guess.
I think I should move it to regulators.

> [...]
>
> >
> > +     i2c21 {
> > +             compatible =3D "i2c-gpio";
>
> I'm not sure this has been asked before - is the GENI SE for I2C21
> disabled? Or are there reasons to use i2c-gpio instead?
>

I2c21 is wired on pins 127, 128, and those pins don't have a GENI SE functi=
on.

--
Best regards and thanks for review,
Dzmitry

