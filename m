Return-Path: <linux-arm-msm+bounces-15761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24769892479
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 20:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 477ED1C213F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 19:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BAA139D04;
	Fri, 29 Mar 2024 19:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A25Bg9vF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF25913AD1E
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 19:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711741621; cv=none; b=gljObZX8jnkcR9jIrzITDrj/mU2rPtIJ/vNUzo+qLDR5FSJcPinP/2n3kz41Qc1y8FnqJRHnc/fNgIxQzGU4XNQ4HXU/7cOLyiZaLF3cTieEkIT7rnRFvovfAo4xHOk80G6VA5N3VqFjaXWgDqdp3mT9abFVq2zop6N8vOowGug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711741621; c=relaxed/simple;
	bh=s8LTLkiOqhoQx9nKUjUGrsIhCVuP+jNs3wYFq5ptfmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAXEnP3doX9nki9YfB4UViqpK61/Ov8ZIX+3nXN/KtUCueaBeNVJpZA86OHD1S5DZ8guE8HNJ1Itzlz59boibXujZdjBgyY2EKu4Z8T/FgDcNLIycGGSEDlYLxotAB4u7DcFIR8C/doVCcVP30zTKBOnyJDMO6WHqyo3BDOmge0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A25Bg9vF; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6143266c9ddso13676897b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 12:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711741619; x=1712346419; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s8LTLkiOqhoQx9nKUjUGrsIhCVuP+jNs3wYFq5ptfmU=;
        b=A25Bg9vFL/yvir9byw0wqM3rgGjI1MWzywXMbs3+SZCD2qnvVeudt/pE0SI1z1pkFL
         Np9Th7I8F2+68bRiihCQ5Bg0yhl92yUg3p7MLwNw4ygGBr8SdtdPhTcr4w3xWgzslhym
         GZCNAQ2Xa///EPo6WK+ZeE0aqIqanGg76S/T+Oj0EWBdsS9oWe3g28CJCUygJeiZDvIu
         0MnB5iEvrlaBusZWRoRyxtXc0ZXDOaoDB0PVp6XgD8+SDuBd8EVrkUWobkMdERBuRDfk
         oRuMkobp+g+9slssqTTmcNWw4rueVFN8wKn+6JsV4LnmSsZ0EyAFsJCPTLJxMZDhuksu
         ubmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711741619; x=1712346419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8LTLkiOqhoQx9nKUjUGrsIhCVuP+jNs3wYFq5ptfmU=;
        b=WeE4FcrsjtlsE2ZjVis2GzZ6zvAGOjFgRYqbt0ff/lHF77KFEPOb5yB35gyi5glbWv
         i05UvqsY3wc6ZT2H1f9jt8JcbxDTTNpIS31vcjchLMuZp36gAukpJBKrGzzTS9a8kig+
         GnWI5fw8gQ7RLIB2VUKxlBseCii2+SzS2G80GzqwNMmIe+7pFYqJsSWhK70rAyNrvJKW
         zLpKMPQQI8Nr8eDABHhWIBsLKKrbyR7ECFbhLN3xYo6MXkWeF1M6EOZmDcju1EwKSxby
         OHCmma/EZJijbzvMwMd+8Bvu1UoO/7FiaqFzu9TFBIyxVVdTawGDwSKGuEvxDPF/EAUI
         MtIw==
X-Forwarded-Encrypted: i=1; AJvYcCWMjd15WmGyf4z9ULyMSviM4V/hBN2iuShbR3DkRG00r0nXU1PfKzNKFEuS+ANLACtbKPKjr0kk31xrxDhzLKeCdMpHRXQvRSjZlE5T0A==
X-Gm-Message-State: AOJu0Ywihk0tcrUeXGZHCtWvH+BHUemjTxsp6Kwhsb7H4436DmsatEd9
	+qTVTZvjZt+GzPdNIQ8pkt9bLx0R9feJt0cnEoFd85+cTBjeDTnB8MTa2idHlJDrqWg8015oyOT
	bzLLOmLzKMqshd0PTBTGyJlsQfOVcSnLXRA9Bkg==
X-Google-Smtp-Source: AGHT+IFP75qnlI+7OWttRgssl4+y5s2yWymZzuPS/gH2JCV2G5l9/7PLZafJPbyi2RtseP1tlvKpO1i4BIwpvjFl3Ew=
X-Received: by 2002:a25:b10:0:b0:dcd:1b8f:e6d3 with SMTP id
 16-20020a250b10000000b00dcd1b8fe6d3mr2059070ybl.48.1711741618942; Fri, 29 Mar
 2024 12:46:58 -0700 (PDT)
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
 <9b1e5ea0-bb32-4c42-b2e9-204bde31b905@gmail.com>
In-Reply-To: <9b1e5ea0-bb32-4c42-b2e9-204bde31b905@gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Fri, 29 Mar 2024 20:46:48 +0100
Message-ID: <CACMJSesvM6_PhhR_2sP4JX6bR4ytVVg=MwWBEVrCHf5FNp2JXw@mail.gmail.com>
Subject: Re: [PATCH v9 00/13] firmware: qcom: qseecom: convert to using the TZ allocator
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Guru Das Srinagesh <quic_gurus@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Mar 2024 at 20:39, Maximilian Luz <luzmaximilian@gmail.com> wrote:
>
> On 3/29/24 8:26 PM, Bartosz Golaszewski wrote:
> > On Fri, 29 Mar 2024 at 20:22, Maximilian Luz <luzmaximilian@gmail.com> wrote:
> >>
> >> On 3/29/24 8:07 PM, Bartosz Golaszewski wrote:
> >>>
> >>> Both with and without SHM bridge?
> >>
> >> With CONFIG_QCOM_TZMEM_MODE_GENERIC=y (and the upcoming fix) everything
> >> works. With CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y things unfortunately
> >> still get stuck at boot (regardless of the fix). I think that's
> >> happening even before anything efivar related should come up.
> >>
> >
> > This is on X13s? I will get one in 3 weeks. Can you get the bootlog
> > somehow? Does the laptop have any serial console?
>
> Surface Pro X (sc8180x), but it should be similar enough to the X13s in
> that regard. At least from what people with access to the X13s told me,
> the qseecom stuff seems to behave the same.
>
> Unfortunately I don't have a direct serial console. Best I have is
> USB-serial, but it's not even getting there. I'll have to try and see if
> I can get some more info on the screen.
>

I have access to a sc8180x-primus board, does it make sense to test
with this one? If so, could you give me instructions on how to do it?

Bart

