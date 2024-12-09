Return-Path: <linux-arm-msm+bounces-41029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C489E9289
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 699C81884C19
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B28921C9E2;
	Mon,  9 Dec 2024 11:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/Vxd8MS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976AD21B91B;
	Mon,  9 Dec 2024 11:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733744097; cv=none; b=czeNev0gxnvaIIhx2Q5Of55eAWwyySAYBkQcUbXka1l6c+xdQIbvfvdDzC9cg/wtpGPtf0n+TGnYFD64ZEOG2j02qvcVeB4O6uvvi8k2nw18s0oI191dFptdgWaUnD0LIv4nALDed6IhwwWHiEaevIksKSDKz2SuimCsqWokMcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733744097; c=relaxed/simple;
	bh=VisIAnTx5U+oQrY5ZSCcf+Gc6Fft91thVQHa0JVjhl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B9vnMP5wj4wfw8vYlQdYqlUMhn8PTkDA/oK7jXWES5QIZutf7q8Bl3HQOG5iE6P6c3jql7pwaCmCUIoGTF7nAR7tc/HgE6ePiiazdSfMursmGSfAafMF8o40KmDcy2ex6SzHLVccfleP2ntsPRh0rqR7eQjEYmh9CvuZEJ8B6HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/Vxd8MS; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afed7b7d1bso372705137.2;
        Mon, 09 Dec 2024 03:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733744094; x=1734348894; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ebu7p9NTIfYxuGvm9siYxKYSccj74jjKSbtt7BFvug=;
        b=l/Vxd8MSNRwHysQiH+MbYJVJueZ3P74rVZbaMMJDMvm3Dnf+o6KXWNbqtLVuwMsq9B
         AprMFo/HIDVD9B3SdqwKwQ4Udsc3W8t1PpJ59rmZkudzr/Gz57BU8ydTR91OxfMWL/IW
         ocyva5MwIgE9Ru9b+9yBjwW+PQ4ztzh41M6IWRYL0JeBe3UfDAAAEud+UfZSf6oCtQP0
         3zG9fAPDcoCVmRewc8CdBu0xFbn0JauE/6pL0XBw0pEHujx7/3BzSB4iDQWVB/I9xzFS
         JtT9N55/+VWDL5/roNqlCHaCPHrN3jjvpYMEIvEIQxmF/cw2ugK0Y1MlFJ1tFx7oqn4v
         VtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733744094; x=1734348894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ebu7p9NTIfYxuGvm9siYxKYSccj74jjKSbtt7BFvug=;
        b=V8m2Q6ThTXBOO4tiv5mW62p3ZtJj95p3aLVm3gYen4pU87KqZknqDSZf7qz+4HJNlN
         oXEjCR8qifDQDCWHKoTq/ZJmjaTzMfB6xdLArFXl53lc6udPsslIh4OsoOxGjg9q5rxr
         k0SKOExWkXAAQRf91vAr5rj+1euGWTR2k957vOTrD6hM+B/FXzpAiUc4ckVwCPIQp2jR
         aD/2rbchuzf1u5gpxH/mrEIqTitpZhYUyqQeItrd6nf/t0ZUDimIqKFpZoomZ3tDV9Ca
         IqFpMOVdFy5/V9x0l4bsPG8xjSBb17NVufTG1q1rR68FBKsxcwm99WipnUboL9iKkliM
         mAAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBDK4m2qFEsQklLsoCwMbyANI6dvG70eXvDzXFP00a36yi1W+M/SvetMkv5ll+bE7DGpGArPwmLqa1@vger.kernel.org, AJvYcCUm5+ak3y42qvWxRddz2L++cFQaPtK5iAOdosBBsc9P8woqrU7ygirAdBuFHsrdPQUgS1IXrR0MgPfxkWdE@vger.kernel.org, AJvYcCVYl+PPLKmxiL3negI+nveyp7Z9An9qBHG4H4LGKsfoUMItUeYpu7hnn9OAd5zoAGFji6vUFHcQYxt/YUo=@vger.kernel.org, AJvYcCVp5BhKxXVf1QHZVPomXMmMU7Kr2G8qcvXXkE9xjrvq3vENZlIj0a+05qObPjWmrHuxRdfxPvPXRp57pd2lwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy27hlTFMxptFWYAqxx2nNgsxeA4HUa+vCh2zZvuywiB3dewOEB
	IatrO1LoFZrCZfhIrDJbO1J5heLH03wmaNs0PPI52FZQ/kXu4achq6FYdkj6DRMjgkhpjUVTTYN
	1oJdGisD7+nDNBUnkTZ+fWQHxpfw=
X-Gm-Gg: ASbGncs/jO2FmkKSWqwPnkOFWMjdhNYyFINRFH0/BZwfZ8+TnhH64fZXg7Izcha5VMz
	94kC9MLT8KfK5HVyYusE38BOwo5LqQA==
X-Google-Smtp-Source: AGHT+IGtmVjLKoGd6CR1dsJ7bk5m4v+gp3aMfu1tO6DJItUCNdu6lrk4rHszLlF8FDXFP44pobOC4YFjTnJ7W04gO0w=
X-Received: by 2002:a05:6102:cce:b0:4af:eccf:e3c6 with SMTP id
 ada2fe7eead31-4afeccfe90cmr4037029137.11.1733744094469; Mon, 09 Dec 2024
 03:34:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
 <20241205-starqltechn_integration_upstream-v7-12-84f9a3547803@gmail.com> <c703e70a-c705-4010-8f12-bb55d67f2255@oss.qualcomm.com>
In-Reply-To: <c703e70a-c705-4010-8f12-bb55d67f2255@oss.qualcomm.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 9 Dec 2024 14:34:43 +0300
Message-ID: <CABTCjFD7ChwXEZYLqAro_rerNN490ZViZ=qRA6sx1dGWVW5SeA@mail.gmail.com>
Subject: Re: [PATCH v7 12/14] arm64: dts: qcom: sdm845-starqltechn: add
 initial sound support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 5 =D0=B4=D0=B5=D0=BA. 2024=E2=80=AF=D0=B3. =D0=B2 19:45, Konr=
ad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>
> On 4.12.2024 10:34 PM, Dzmitry Sankouski wrote:
> > Add support for sound (headphones and mics only)
> > Also redefine slpi reserved memory, because adsp_mem overlaps with
> > slpi_mem inherited from sdm845.dtsi.
> >
> > Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> >
> > ---
>
> [...]
>
>
> > +     audio-routing =3D "RX_BIAS", "MCLK",
> > +                     "AMIC2", "MIC BIAS2",   /* Headset Mic */
> > +                     "AMIC3", "MIC BIAS2",   /* FMLeft Tx */
> > +                     "AMIC4", "MIC BIAS2",   /* FMRight Tx */
>
> FM - FM radio, or "Front Mic" / earpiece?

FM radio. I'll fix the comment to avoid ambiguity.

>
> > +                     "DMIC0", "MCLK",        /* Bottom Mic */
> > +                     "DMIC0", "MIC BIAS1",
> > +                     "DMIC2", "MCLK",        /* Top Mic */
>
> Looking at some pictures, I'm guessing these two are the little holes
> in the top/bottom edges of the device?

Yes.

--=20
Best regards and thanks for review,
Dzmitry

