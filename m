Return-Path: <linux-arm-msm+bounces-40116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6559D9E2173
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 16:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24A65285B22
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 15:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBCD1F9A94;
	Tue,  3 Dec 2024 15:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SouZNHzi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D050D1F9437
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 15:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733238618; cv=none; b=NDSnfjc1vaACUX8wc/oB9TtteoF4ICCXdNNY+XoYVDydpRHFzz0a5ncF7WULwjBtDmEB17IZtxpauxWhERxXPHk8P228idqdPN7IdxG6MKCID5HyEltE9ngOaA8K5jhID+T6KfS7H/5y0B1zLUIgfBULureWA0mOYqQwEgxwvwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733238618; c=relaxed/simple;
	bh=U/OoOzXsIi2r7sSP/cLR0FzyZqfuU3DiHqvIkCvcvj8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uzq9INFTFhKvyHEb3nNf03E82D4VvByKLvLfuY5NBBoHEKSW9CxdPnJUz70SUTgrdJ9/JUTluLsIm8XJoPGL07KFH9l4rpRTUC4HTcAV+2UyqiuATZaRuK7GGCPXzEtXih/+hkR/8+M3tvYMcztnGbNzrLT5P1/KL488fio63bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SouZNHzi; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7ee51d9ae30so3887936a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 07:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733238616; x=1733843416; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=p0ezAqCKNWBAiuxAl3Y2kJKU1te23QxF0JI4IxEegt0=;
        b=SouZNHzingFWow5COB5W5tgVUhP/qi8eFeiHs4lESYZtkRSF2bGbFC1c5NmE97OfZq
         DKb5APHfqw8Q9OIT2nSClQ6gAWzIuHc9ZI7DwsPmX+taeYs9kSVKyg9TYLDFDZud5Up8
         vfIrWcXGdfk+U4eZ3f5Cs4hGQrNpbNSR/6XywidzeuDOqN0XHoeu3S090pUaGOxse7z2
         whcN4x8YlDM5yRkqrvy7vJmnVOG5z+LL73ozPlsYYWCIaDm2UkyvFJ+l84/7oLnpR2rO
         JUDy4k6+sDFzL9DHoY3k537qGV+rFV8pDRZm3dr96hIr9XE4ZHQYw+/zrac1Sxg44i3h
         wU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733238616; x=1733843416;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p0ezAqCKNWBAiuxAl3Y2kJKU1te23QxF0JI4IxEegt0=;
        b=stT95JFWE4jFBo1RSY6Ui1gRykqI5Vqd4hOJ0xOjmFp8NsS7Af0/aYVVVAh8QP2T8o
         4pMpp+Uo+nACotca+Y/VGtK6mL7qOHXXb2IxS+rsJ/NkAckZiViTFC6UypNAi7nBFNqE
         nBWd18eMQD0OcwjZPBWgg8aIe1iLDl4yvVuFBQS7IG21lRFG77QY37yKP5SFVdM1B9Qw
         +qkPEXiAHgNpmsAXODvureAqCsQaSzkas/ALuUU/Qf/Z2R2Zvu/Isz/7GeI9hreUr9wv
         S5Ef+7DTtVw19cJs6ykmALJCg41XvqO8vFMTcIBNCis6bj6cL3HKRpaSjjU7Lm9OSNxU
         Hnwg==
X-Forwarded-Encrypted: i=1; AJvYcCXfUdeQEViA5euxsXA4saqSSU3kl3WF3Opm9PeL7iA0V+7qEdT5EAdg5yKhxl8GA94ZH6Ra3d0jGK0GIJn2@vger.kernel.org
X-Gm-Message-State: AOJu0YzJaVIhY9vyBJwVI3IJKnU768VmG8K+vFvShKrpydpxYSMR/ICZ
	EFibRqj2KqYm+h+vrI3IfmF6zLiSkkPzyDjMjqtwwYHOjgO8V/vJZ307YuA6sqvxzyaBXdP39rQ
	QI9OEffnTkHsKvDkmGUMuypNc94na4+SaXoOX6A==
X-Gm-Gg: ASbGncsB+4V2xD7xRKS3AOwmT1GfwP+BJ814crOegjHg6jFAu+nXtZZQpNg4vvDX5EY
	cahzVQTbXbSZ5ryGDSRBO9+s9RU59co8=
X-Google-Smtp-Source: AGHT+IGIUqVE82b+dvpoCo08vBA9hrCj+aCzVv5qZgUaQJourUSn2MQUzu2S39lm+R0r8d/vqoADCueK4RgwsGjH9Bk=
X-Received: by 2002:a05:6a21:38b:b0:1e0:d9e9:a2c7 with SMTP id
 adf61e73a8af0-1e1653b9c06mr3889882637.15.1733238616139; Tue, 03 Dec 2024
 07:10:16 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Dec 2024 10:10:13 -0500
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <d6220576-eaf5-4415-b25f-b5984255ab78@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
 <20241203-crypto-qce-refactor-v1-9-c5901d2dd45c@linaro.org> <d6220576-eaf5-4415-b25f-b5984255ab78@linaro.org>
Date: Tue, 3 Dec 2024 10:10:13 -0500
Message-ID: <CAMRc=MevaM4tUNQUs_LjFYaUtDH=YqE-t2gBponGqtK5xE9Gpw@mail.gmail.com>
Subject: Re: [PATCH 9/9] crypto: qce - switch to using a mutex
To: neil.armstrong@linaro.org
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Dec 2024 14:53:21 +0100, neil.armstrong@linaro.org said:
> On 03/12/2024 10:19, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> Having switched to workqueue from tasklet, we are no longer limited to
>> atomic APIs and can now convert the spinlock to a mutex. This, along
>> with the conversion from tasklet to workqueue grants us ~15% improvement
>> in cryptsetup benchmarks for AES encryption.
>
> Can you share on which platforms you did the tests and the results you got ?
>

Sure, I tested on sm8650 with the following results (they vary from
one run to other but are more or less in this range):

With this series:

#     Algorithm |       Key |      Encryption |      Decryption
        aes-cbc        128b        94.1 MiB/s       138.6 MiB/s
    serpent-cbc        128b               N/A               N/A
    twofish-cbc        128b               N/A               N/A
        aes-cbc        256b        94.8 MiB/s       128.5 MiB/s
    serpent-cbc        256b               N/A               N/A
    twofish-cbc        256b               N/A               N/A
        aes-xts        256b       132.9 MiB/s       131.8 MiB/s
    serpent-xts        256b               N/A               N/A
    twofish-xts        256b               N/A               N/A
        aes-xts        512b       122.6 MiB/s       122.4 MiB/s
    serpent-xts        512b               N/A               N/A
    twofish-xts        512b               N/A               N/A

Without it:

#     Algorithm |       Key |      Encryption |      Decryption
        aes-cbc        128b        96.4 MiB/s       141.0 MiB/s
    serpent-cbc        128b               N/A               N/A
    twofish-cbc        128b               N/A               N/A
        aes-cbc        256b        67.0 MiB/s        97.8 MiB/s
    serpent-cbc        256b               N/A               N/A
    twofish-cbc        256b               N/A               N/A
        aes-xts        256b       131.7 MiB/s       132.0 MiB/s
    serpent-xts        256b               N/A               N/A
    twofish-xts        256b               N/A               N/A
        aes-xts        512b        93.9 MiB/s        96.8 MiB/s
    serpent-xts        512b               N/A               N/A
    twofish-xts        512b               N/A               N/A

AES-CBC and AES-XTS with shorter keys remain pretty much the same. I'm not
sure why that is. I also tested on sa8775p but there are no visible
improvements there. :(

Bart

