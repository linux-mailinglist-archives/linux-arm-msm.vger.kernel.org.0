Return-Path: <linux-arm-msm+bounces-75881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0941FBB685F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 13:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A08274E055A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 11:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E0B1DE3A4;
	Fri,  3 Oct 2025 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XG2xY3m/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4030224679F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 11:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759490116; cv=none; b=PeISqV+5zRP8rEpsTk0JA2j/8gzxbDCheOb1yxlbiKbqv81sCQFCkKcrnvBBsjfhqP1PkyBoZMz6F+1hJ+C2IOnogTZqvohS6jGS+QNi30tupMZhbssbaxnuZMNFU/N3a5xsGZwcR69JmlbonIZIb9vgINNypyplmrOr/OpdLMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759490116; c=relaxed/simple;
	bh=2tqpiNZgNhAVF3MRgwUn6SkPmwtMEmAFgBWl0QKe3+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WbdT0gyk7m1NXEQgKYWJIFPbJPS25NZ4ohUHNr/4wL/IG4PgnhuQAZvfH3PIIoaKhrzIu8b7Nv5kGFdOgCa3kTc1SRaAOvBZTw4uE7oam1g6/LuqIWmiT6BbhYtGK3ZMX9b2NGbJrj1sCH/MF7UgZVRCboOXVtJiPAAfKmIgd5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XG2xY3m/; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-62fc28843ecso3141198a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 04:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759490112; x=1760094912; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FWB1l3GhtvvQRLGif85/yxZOUyZcqzxNH5HwDVS5Pe4=;
        b=XG2xY3m/N157wdQL9gOJmAeTc2C+z9U8t470Y8mM5kXpzVnxqeJnYAtikESem6TP/4
         jDVz5UXRBJ5MjQFTE0ItnSZswbq2XCuPbfHWAv1Bf0xx5QQhEOgtKWuNaXSs0g6r8ESR
         uvRWS2K0KJaQcYI3K5HiVpIdzAcQKSddiUFWSxlImgmco3dJSqkdnxylkhOqBliB2wht
         wSiMTms4ZI4Ef9ZFAUqUI9wDDtAL/nlQrb9ePycaDuTswxFZDB8kX7IvbeSV/gTIkCke
         WsgEGL98TzZyebmxu0Y+jz9yMSxSaBeVUW2YryLMGnC4bthJGS/I9UHlIppyQeyIHnIp
         px6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759490112; x=1760094912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FWB1l3GhtvvQRLGif85/yxZOUyZcqzxNH5HwDVS5Pe4=;
        b=wtt3zqIyj6nOdSLx15IP73k5PB5LK8aLBWVAjuJZfV/U+ZyYLkv9+IaM2EyXM5J1AV
         gdM2/yuDVW96UbI5/pDnbJpIrJRIjVLHNYiz54LCoBCLcDWfX4/InrspVoZ08ctzq2fV
         /iS+jK6ZTM87LvQiK6G7Zb7Ep5Ya9kzcFqg8EWE/IECt4Mr7xbYcAA6dV7rzHKOYDDpd
         cqlctBp8ZTOeO+f8i7WPk3cZGURb1Q3Nr36dbym456RaTK8c5rFJ1AH87R81WnhcSHYs
         jXIsNNc2TBZeRslh7naIbUrwQq7NZ+rvPFb/AJzvShd2okStM0ljPfEEExO2NsCwaCjQ
         InbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXII5NfWgqhd6t2ZYcIgEMt2gS84cKsoOFjzleM4zJIkHWRK0374C+0MaTE8iKSq9OigJFfbIu3/cVB65Cw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfm5uszTLeb7oJb/vep4ADBncLCT0gniOdFTdRQUmTSyAUzbHO
	u/ZiAwxxOd84xQKjwu/0jGp4EVCCrg5lYPqDiOEnXp2sqifU+llXxps14+1/Anijns26hu1pTE0
	4RMy4/MWhWza3xSuVbCT5UhOjSkiYqvI22A==
X-Gm-Gg: ASbGncsGDtyqMeszeG5eqnuaYuIMV0eifvRthAdts9gQQZkgSms9BiX+ubO+4wmIAcx
	E/6uP3+6Ou33dX8hozOIf5sy0hEuFjze1zQ+QjBsFy467bH1OYZswF8UeVKKcc2lAxyXqDNXq9z
	gQQVWCqDZwXn4PconYaiM4j7yH4aUpfjTUWu0lVpl214GOKXRMtRiH9AzZIHtMJ+uqmGL+oPXpP
	kbNu62ERTdjurydJRz23jN/CTmykDZIpIKAn70EwkJevZiC6Csee+Ij8i5OmHaQt/6AxJhxDUv+
	KpjRr9RttMAfUAlJlBZvPba7bGkceNOx9dW3T0YlfHsWKdFIxA==
X-Google-Smtp-Source: AGHT+IFjm21eDqpyMA/7zNk9WQu/hgKPJE76JATEXSYRRHQ+tCbniUTffgJ2HnQM9/+vdQgii5IRucrKIDdjAPB0LwU=
X-Received: by 2002:a05:6402:1ec8:b0:636:6489:4db6 with SMTP id
 4fb4d7f45d1cf-639346c8026mr2597965a12.4.1759490112151; Fri, 03 Oct 2025
 04:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003104236.1813979-1-pbrobinson@gmail.com> <f31278b3-9f60-43c7-bfc4-027b24a49854@oss.qualcomm.com>
In-Reply-To: <f31278b3-9f60-43c7-bfc4-027b24a49854@oss.qualcomm.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Fri, 3 Oct 2025 12:15:01 +0100
X-Gm-Features: AS18NWAWW07gb3Yiz8QMMgh85gWD8hWUFJkX_gW4j2OOJmpv4f_RDk7Q93ixEtk
Message-ID: <CALeDE9Np+WBpr1rfx1w4L0oivZF_hk+Mzp2dZFPs5oa4c-BKJA@mail.gmail.com>
Subject: Re: [PATCH] tee: qcom: depend on ARCH_QCOM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, Sumit Garg <sumit.garg@kernel.org>, 
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Oct 2025 at 12:00, Kathiravan Thirumoorthy
<kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
>
>
> On 10/3/2025 4:12 PM, Peter Robinson wrote:
> > Add a dependency on ARCH_QCOM, and compile test, as the driver
> > depnds on QCom specific Trusted Applications (TAs) and it's
> > only, currently at least, supported on QCom hardware.
>
>
> Thanks, but this is already taken care.
> https://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git/commit/?h=next&id=3b63efa21bc6acc1a0fadd1dd0f0e1988a4c0177

Awesome, thanks, a quick search and I failed to find it when looking.

> >
> > Fixes: d6e290837e50f ("tee: add Qualcomm TEE driver")
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > ---
> >   drivers/tee/qcomtee/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/tee/qcomtee/Kconfig b/drivers/tee/qcomtee/Kconfig
> > index 927686abceb15..9f19dee08db49 100644
> > --- a/drivers/tee/qcomtee/Kconfig
> > +++ b/drivers/tee/qcomtee/Kconfig
> > @@ -2,6 +2,7 @@
> >   # Qualcomm Trusted Execution Environment Configuration
> >   config QCOMTEE
> >       tristate "Qualcomm TEE Support"
> > +     depends on ARCH_QCOM || COMPILE_TEST
> >       depends on !CPU_BIG_ENDIAN
> >       select QCOM_SCM
> >       select QCOM_TZMEM_MODE_SHMBRIDGE

