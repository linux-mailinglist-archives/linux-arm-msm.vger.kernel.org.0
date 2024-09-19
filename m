Return-Path: <linux-arm-msm+bounces-32034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B2E97CDD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 20:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AACE284CDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 18:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13640291E;
	Thu, 19 Sep 2024 18:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="MSuxslZ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D22D23749
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2024 18:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726771732; cv=none; b=ZgU1vfanLFJMV0eVblDA3k5cGzEYXD89B0f0hsWZXmYHExvyA/u/vw377HUFNlvv8SXuwqa2O8gHry3Vz63DvMWMiS/zM1+pugegy3KR7X141CAYVAMv6j/eGznfStLmDL/hBWTvojTkq6bYW651iQrSuxXBXcdAShfdRLkcNXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726771732; c=relaxed/simple;
	bh=tBkFsOEGKki/Ujou0mi5ka3jQDUd4rYy6dVeLu5RC6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IRq9fK/4mTRKRBR+TeWQOcXzUL4PwLlR4o6g/ybEHshErJnprAmu7RwQJZmAK+BAwe+LyT6pMsiJgiED0osdwaaB2UqXb68H2FfN820tVtCV+DdpZvm0Tv3a860W0LlsMnmMecoXnWp7T1j5YjtKtQA92FKYlrpUwttDDigi1mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=MSuxslZ8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so10476715e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2024 11:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1726771729; x=1727376529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NKj5Iywn8pi1HV6RavjZasiS19LGez3AtSbupjyBc4=;
        b=MSuxslZ8E9y9YmWorzOb7RA3Csz+2Okf1MY9ZvOQwn1+sKSyIokoQ9ZXhP7UpHPAYW
         NOu41thxDOC6siauWBFnbk86zqlCxnFU+EY5UXLM3uUvzSGBVgcY3yWHQQQPzrhJO9sq
         DclOU6+tYc/4qXtepr8bLvlv6j8p5LstNqOnpk7cROnWS2qw6O1IsMUZ/mVQ2KsiVw78
         8/wWfXJC0De51TbrfLbv/e/shjHSp00fmCWXpLfmKCDxkvbaonhWqUF2OKz2IRlo8JFJ
         UMAI0qxgTsXwKlRpVGPhIFkRZ6gSeF8HVD5DgShbPjZ0oni6wBiQQmYZuDDUEKGq+uZU
         FfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726771729; x=1727376529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NKj5Iywn8pi1HV6RavjZasiS19LGez3AtSbupjyBc4=;
        b=FvhlQoduvf+QduE3K+FF5NAztjaOCmlanmHVODq++POSiPZvIPW9AkypxTy22VntMv
         vHctFSS3NTZYkuTDv24iswNJDGNuMg0e/G5o7RY/L1TRj3hS+hVe2SllF2CxYxI9Y1Q4
         rq7lM7ch5YyFcmAoXVuXOm8+oSNvvYkjZ8hh4ei4orGYuM8ezYmucBOWCmh0HOyx3Rdg
         nHGsF+aa1GQ5oZwyuMa3JgFZHP+Tx7RodYUQVjGHsFbHNyHDxGF8joA5sGNf4wep1SYl
         wxOdqmUhjwP2F1vNI3YZR+5f+2by5EK3mSRg0L7nC34Wz0R09csKtUFhpmyNGdvW0J7B
         e6gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNec/pyBYF8FTLbzHkKO0w7B8Qo0YY05SAeeOST9BmGVyhdq8BOFD+jmH1NumJ9MLigB+an1Gv/6P+Raj8@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQ9kOAZ8EJU0WmsjBJr0+Nq4AxFOiYndKNtCE5Q3J1qzcjdo2
	WfTV4Olc5BhcgjbjxowU4g7jk7DpM7nyjYuGCd7QC2848m3TOZjjI2MHmZxeB1qdhrvpxziTo3w
	3Qj64a1+iCoSP9sB28eiiYJ6Zhj5wT0Xs5XJ8iA==
X-Google-Smtp-Source: AGHT+IFwZ00ICb5UCjsH6ziqz8Xe7HABIip24+gKr+pPgaD0kCyAzp+K0Fw2+tCzsUPMbb7TJM5PAUtR0m7y7h5wl6k=
X-Received: by 2002:a5d:410b:0:b0:369:9358:4634 with SMTP id
 ffacd0b85a97d-37a42277e15mr193773f8f.19.1726771728546; Thu, 19 Sep 2024
 11:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240919-topic-apps_smmu_coherent-v1-0-5b3a8662403d@quicinc.com>
 <D4A2FKPTXHS5.3AHU7ZEKFVMGG@fairphone.com> <2fb16b35-e6c5-4239-a745-a9dd7412539a@kernel.org>
In-Reply-To: <2fb16b35-e6c5-4239-a745-a9dd7412539a@kernel.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Thu, 19 Sep 2024 13:48:37 -0500
Message-ID: <CAKXuJqj=5wZg2+EZOmbS4TjrvqNm9UhsqeSPHZyVbOLnir_juA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/11] Affirm SMMU coherent pagetable walker
 capability on RPMh SoCs
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

On Thu, Sep 19, 2024 at 5:07=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> On 19.09.2024 9:00 AM, Luca Weiss wrote:
> > On Thu Sep 19, 2024 at 12:57 AM CEST, Konrad Dybcio wrote:
> >> I only read back the SMMU config on X1E & 7280, but I have it on good
> >> authority that this concerns all RPMh SoCs. Sending as RFC just in cas=
e.
> >>
> >> Lacking coherency can hurt performance, but claiming coherency where i=
t's
> >> absent would lead to a kaboom.
> >
> > Hi Konrad!
> >
> > You want people with the affected SoCs to test this I imagine?
>
> Yeah, would be nice to confirm
>
> >
> > Just boot it and see if it doesn't implode, or do you have any more
> > elaborate test plan for this?
>
> No, booting should be enough of a test
>
> Konrad

I have tested sc8280xp on the Thinkpad X13s.  It still boots and
nothing seems to be more broken than usual (kidding, it seems to be
running exactly as it was before the patchset was applied.)  I will
try to find the time to test sc8180x on a Flex 5G as well as the
sdm845 on the Lenovo Yoga C630, but I can't promise I'll find the
time.

Tested-by: Steev Klimaszewski <steev@kali.org> # Thinkpad X13s (sc8280xp)

