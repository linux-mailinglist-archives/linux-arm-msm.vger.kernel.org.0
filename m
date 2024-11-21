Return-Path: <linux-arm-msm+bounces-38634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 277ED9D4991
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 10:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67D16B20D26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 09:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8AD41C7B79;
	Thu, 21 Nov 2024 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X3PG1Gv4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5DF147C79
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 09:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732180160; cv=none; b=r0Z+oERksbbUqzEVQVKn2I/Z09o6t8QdRsZ/bRgCdTXCZztQtauNZp7P3ZWmMd+4I/wYTRSh/OyqL7AwZiOUVckfpVyVXztsQqD1ZteovIuttw1WAP292SQu6rIFT5V0YdbvNTce0CrkFKKym6aWPmom60gI1Z19eyJV/VYQl3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732180160; c=relaxed/simple;
	bh=ZAyrck5tlQevYqpMXOTskbTcJyaWO8Hs8gXBxfr1uf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Adp29TdxCUMkIKcxo97JVEUzze4B90DSZfqgcWRph7rD/jYC9hsC+y2w2pmO+XX0hN2P9CQk24V7SW/7RjdyFdj1bR3XTGyuSwJd0dE0eKeUFZPuuK7oShI7Mf0vOpKO06W98VcIRJaTlpc+0Q+S3cpNt6eFD8lEtzrnsJAp4V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X3PG1Gv4; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5ee3e12b191so350912eaf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 01:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732180158; x=1732784958; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OxHbi6ASfjiq8iEPoZc72oeQ6cf3BdSdOcjBRpGls9o=;
        b=X3PG1Gv4pozV9GCqt4ynVNV7RV23xK1HTQ777xWKR9yvvModLnnDVuf0T9zgxd+tXG
         sVSdH/RnLhRxpH7asqIrkyp77vkmK4WFlaaXJPhQ8bnXvINehE8LWIUIn2RyVriFE5bo
         lwvM/GvTcOMSYuf7kGgQJ02vEvnprNAGtD46DEeEEyE1/+sYYH7CGD8xOTFvgPXlPkl2
         0Is+I3emjxWcHOk32waqVSmF1AvOTwJ726UBECkqpjUDVAaQrDCZBzie+SR96eZxXf7Z
         BRZfnfwTDs264yEwoUoQM7LFtHbvvksevORwbEt0wqYpWurCEVEuQUSsyUCj46ld56Ll
         jlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732180158; x=1732784958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OxHbi6ASfjiq8iEPoZc72oeQ6cf3BdSdOcjBRpGls9o=;
        b=xE78RDfN8T/PCsc5BogL2F3HC6ajX2Fb3D5BvRrqaG42Ww4xwQ5EeMKAQDp9d21KZj
         ZRvq3xtYd7QTEmefdlx3GAxGKJkSAUjoeZ/7ksOilMFXC3+alPUZizzWoA/rfzqHznMP
         RD46lVaS8y3WV++Y1G0KZLOUibpK2hkTkoXZRbuA2Gup6+qy+7fmxo5Ad/fmuKnWVEi/
         jeDKqNZg220xpkB/ayC0Saq8WRGiWjj1QW89TIjKIqU1t69weuoUgqHMc+wqWVuFfxxz
         tpg5y7t+WstEcACJcMVtG9umRYq85hTHUYREOBr394xYUBmGQ1q1FpD7XGZqR3MQHApd
         Ah2g==
X-Forwarded-Encrypted: i=1; AJvYcCW6jKAAxzAy8RIlRg4j1qN7k2HzQ39ajb1XjXIqC1pZ7+z92paHVf5hjPShA99uv08VmzQ9Lkk0miTwNHWy@vger.kernel.org
X-Gm-Message-State: AOJu0YydhBfPaAsXfH/4fLY9dq6KqKCiXew9qYnCnBO8/BoSGs1FDW37
	XI+5UKSeTUTDJQt3LLa+a2uy+14hnaNh6Nsun7yDIZA5PDPUgSHEHF1CEu2cnx0mPC9tf0/qCVJ
	74Ag648T/LToRE5zqmdXTeey138ZG+9rUD5zkDJ6WzkmNTPijXO58yg==
X-Gm-Gg: ASbGncsfDcfonkP9J8HKCMPF5ZWl/qyGzZliCVAylLM/TBGboNeHB5YvsOElvlKcFNx
	0Xo88wiyfe5VNGIluP8ZoWNkIAeoXb9L5Ha9jCWIEt5xC4HfpNIqTeEqlQlj1Aw==
X-Google-Smtp-Source: AGHT+IGlBrhM1he89NTY6gbHyTFxW/0w/9MnZ6DHduJEKWDUclBwVD79cdcU9z96VzKNIRfTYH3d9MO2sG8QjenfPWw=
X-Received: by 2002:a05:6870:d914:b0:296:aef8:fe9a with SMTP id
 586e51a60fabf-296d9affe47mr5902908fac.7.1732180158357; Thu, 21 Nov 2024
 01:09:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120093904.8629-1-jerry.meng.lk@quectel.com>
 <863ba24c-eca4-46e2-96ab-f7f995e75ad0@gmail.com> <fbb61e9f-ad1f-b56d-3322-b1bac5746c62@quicinc.com>
In-Reply-To: <fbb61e9f-ad1f-b56d-3322-b1bac5746c62@quicinc.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Thu, 21 Nov 2024 10:08:42 +0100
Message-ID: <CAMZdPi_FyvS8c2wA2oqLW5iVPXRrBhFtBU8HOqSdNo0O1+-GUQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: wwan: Add WWAN sahara port type
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>, Jerry Meng <jerry.meng.lk@quectel.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Nov 2024 at 22:48, Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> On 11/20/2024 1:36 PM, Sergey Ryazanov wrote:
> > +Manivannan
> >
> > Hello Jerry,
> >
> > this version looks a way better, still there is one minor thing to
> > improve. See below.
> >
> > Manivannan, Loic, could you advice is it Ok to export that SAHARA port
> > as is?
>
> I'm against this.
>
> There is an in-kernel Sahara implementation, which is going to be used
> by QDU100.  If WWAN is going to own the "SAHARA" MHI channel name, then
> no one else can use it which will conflict with QDU100.
>
> I expect the in-kernel implementation can be leveraged for this.

Fair enough, actually the same change has already been discussed two
years ago, and we agreed that it should not be exposed as a WWAN
control port:
https://lore.kernel.org/netdev/CAMZdPi_7KGx69s5tFumkswVXiQSdxXZjDXT5f9njRnBNz1k-VA@mail.gmail.com/#t

Regards,
Loic

