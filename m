Return-Path: <linux-arm-msm+bounces-64608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6066BB01E29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 15:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B27AB61CEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 13:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492682D97B0;
	Fri, 11 Jul 2025 13:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfKB8JDD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B12D2D0C82;
	Fri, 11 Jul 2025 13:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752241359; cv=none; b=JC/qe2ajXlv3CvSFO09ljpG3ombv7Ov1F/puORMWy4RulNyMQLla/G3nlNcLWuxpxO1f5LmuJgpRrjqKBU/Xxh4bGgpK9vT5BY1KfJYbLJ4ilRgE96VvaPnQDzrVH2Npil2Qv8gJ3Bd8vTLsiQ06hAgJzyB34wg4Z3gzlWNGbl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752241359; c=relaxed/simple;
	bh=oROE2Ps45qAjTMX5vLh9GPq6k9n0b7mp9Nu8qZt33tU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OGyw2MkTkpUCl8q7CTKuS/9ZxL6UMTFTSF20bG53XHU+Cw9w3jpBRwDtOmdZaDVy+TNPKoXoGs6DLuf4kj1uNjm6rnykJdYSyE12LnkOdg8OL11+dBaidUpD/ZtLAIzG+Cot627cxpF+eGUztkJLz7lO6TKY2W+Li3c2VV96elI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfKB8JDD; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b7f41d3e6so26798071fa.1;
        Fri, 11 Jul 2025 06:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752241355; x=1752846155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39EoorCQWAQoQFijm8lMtfRFrqL7nR8KMeohvrKmerY=;
        b=kfKB8JDDGABglRRuBYj5yCRm8aZ17bxOVBLYXGl+f+MI/VA92L/j6G1r81NPIaD3cT
         HXja7fNCuebW7Oq8Qczb8KTP0zb8dDmYeffyzqMf2w7a00C294kvKDptRi2UtuoMw6rx
         a2YInlNk72SA58ZRNocpJB5xgkvYAakS/7s/HYXBDBxeApRiDGq4keSQjysgsH5VV+65
         hVlUXi5ooTLnsNAJYawuulR4krzVR1WjsO4GQGvhaZWgcjvlLIZ6NHsTSbxt54el7lbN
         SUKrbpZgu74A3ym9E0cXeW4sLa7xv8UtaSx3VoY/18z3RMUrtniZBZ3Hc33ICSVO4M6Y
         WsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752241355; x=1752846155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39EoorCQWAQoQFijm8lMtfRFrqL7nR8KMeohvrKmerY=;
        b=xVVfZ29W/Du+WvhCXL7xf9WGwBLA3VuEnklCyEIjZnF090EgE9ovpG3FCyN4utssMH
         fJNuPD7XfdH+fF5FkZSARrou/jvvoP2KnlONn0zCXtnPQWCT+UqGSkswRaivNlJdcN1j
         o/fcxNeaYFZdE3Y/Qkm/vmTecBSrQga2h3e+QP9hclcd1zGbt1aCKgdnVgksfXtQw6ij
         l5JxeL1mFdYy6DymErvFU1Q0x1Spg4/o6bNnIR5DmDgKqwzd31pNiEzMdbHZOytZQdF0
         2P2QKDEF0ZabsSiuuSmlFwqAPYjuboNrYtUOYcwv7rlJ53rc8qf5nR8LKlaoQHJO78Am
         sczA==
X-Forwarded-Encrypted: i=1; AJvYcCUKO0+p5fjXQk1tLCZ2wZUw0PR3RNRKewAjFj36aXDi0u1TTwc6A6PLm3Ri80hth3ws1Rjfh6SqI9EItx1j@vger.kernel.org, AJvYcCUm1+TuCNeCO61huMPm/mvp/dugUiHZ0RnF7WGg966oNqD5s6e5/I4aY4/dLKX4B8avdaIyll0nJEh8HAz/RFjn@vger.kernel.org, AJvYcCV7mpiAAg0rDFXcbPFvTnicZBqhA4jy+vfLdap2U3QU/qNciRKLOJnhP4/ioRiqplom5XNazXOu1fHZVkKu@vger.kernel.org
X-Gm-Message-State: AOJu0YxCbFawew0/Kl/2UwBuYFBUKFnVEDOWK81bbOt7jutpLnsthoAU
	VRHZFXeGTJt+zQRpFbydWfOA1ZaMmA9P5QGnJ7msT8KWypVfvipsl+qJ3GPaPb8AwHpU5lO9p/X
	ExNdWA3yWNleKR/4AQ8+xk1cM5NsLxo8ZTaj/
X-Gm-Gg: ASbGnctZyuo5Pvi2sRygt0T9NOkSLMOGhGhs7AihXpPNB2KjjDn5EPAbt378vSCc3sp
	qYohx7YsqOQtzLTl81i6/Esf4tLecsF/By1369vLNtx6Bh9co4a+dpdwciTNHFflmNRZT/PegxX
	vImOiR/p4K0hINWKA7a7I1RrRo6/jvjap74wrFe6t5eRXPYhppo29AK+AnS+iB2SZ7tgkYOKvVQ
	++yWBnMfYRFLpyI
X-Google-Smtp-Source: AGHT+IET3tChwRNmUwM9hHVguZQq8p8eI58/zOz0l+xdRxUmz5WK7rH/mwNHDzxM4utV5gWoBUaRNo/tCTeqtKNnO1M=
X-Received: by 2002:a2e:8e27:0:b0:329:136e:300f with SMTP id
 38308e7fff4ca-32f50fe171emr18095851fa.13.1752241354222; Fri, 11 Jul 2025
 06:42:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709144728.43313-1-brgl@bgdev.pl> <141abf1f-2739-4ccf-8a2b-3451c299ef49@oss.qualcomm.com>
 <CAMRc=McYqNm4gVgDir=Er_TdOCFUknapFx8a7q4cdyY63sb-0A@mail.gmail.com>
In-Reply-To: <CAMRc=McYqNm4gVgDir=Er_TdOCFUknapFx8a7q4cdyY63sb-0A@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 11 Jul 2025 09:42:21 -0400
X-Gm-Features: Ac12FXwohiTsCZROcI6K5kmmLycoMCK7116-tdsQW2O4iTGVevZHLq6FbkCuz4U
Message-ID: <CABBYNZJQrHEWGBaNy77NqTbNn8jU=iRi0wsnvPqDb6rA9E5-7g@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: add a sub-entry for the Qualcomm
 bluetooth driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Shuai Zhang <quic_shuaz@quicinc.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-bluetooth@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Thu, Jul 10, 2025 at 10:22=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Wed, Jul 9, 2025 at 7:06=E2=80=AFPM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 7/9/25 4:47 PM, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Patches modifying drivers/bluetooth/hci_qca.c should be Cc'ed to the
> > > linux-arm-msm mailing list so that Qualcomm maintainers and reviewers
> > > can get notified about proposed changes to it. Add a sub-entry that a=
dds
> > > the mailing list to the list of addresses returned by get_maintainer.=
pl.

Should this go via bluetooth-next or arm-msm has its own dedicated
tree? If we continue using bluetooth-next let's agree to have someone
from linux-arm-msm signing-off the patches for these drivers before we
merge them in bluetooth-next, including this change.

> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > > Changes in v2:
> > > - add remaining QCA files (Dmitry)
> > >
> > >  MAINTAINERS | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index efba8922744a3..d018923ddd3eb 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -20464,6 +20464,13 @@ S:   Maintained
> > >  F:   Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
> > >  F:   drivers/net/wwan/qcom_bam_dmux.c
> > >
> > > +QUALCOMM BLUETOOTH DRIVER
> > > +L:   linux-arm-msm@vger.kernel.org
> > > +S:   Maintained
> > > +F:   drivers/bluetooth/btqca.[ch]
> > > +F:   drivers/bluetooth/btqcomsmd.c
> > > +F:   drivers/bluetooth/hci_qca.c
> >
> > + Jeff, maybe you/ath would like to be included there too?
> >
>
> I suppose this is material for a separate patch and MAINTAINERS entry?
>
> Bart
>


--=20
Luiz Augusto von Dentz

