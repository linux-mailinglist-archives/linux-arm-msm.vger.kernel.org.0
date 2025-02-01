Return-Path: <linux-arm-msm+bounces-46626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D9AA2478E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 08:38:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F4017A34A6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 07:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BF1132122;
	Sat,  1 Feb 2025 07:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gy4nv8CU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EC2AD2C;
	Sat,  1 Feb 2025 07:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738395533; cv=none; b=B0750jCADSmm0hBiQhREukO//iWSMRgar0vhPgVowFZQRfs9cSGV0rixVYLFal94H4b15xCOQmJYCutjlx5C/8/Fh5ZA4os+S3UWknMPjiIifcaz9RYz5yxB9/y1fvaVxG7II797iR3W+XaNZ2RxofMYwt42R97nLgGi4amBvzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738395533; c=relaxed/simple;
	bh=9xmvHIq9dsoshm+uhUroh5H2iby22JoiDwJUC4ufiTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uYCSDC+nQd1cp4/aRuAxaMmcaYeal8kxXUJBTf3kEVhB/iZGaH0HIrJnhgxeMOZmZZ0bXQd4SmbFW6EJv3VgwtadMEFSzR2ULEj3ZJNhhPbFyQ4BOxzWH3lf3DGNI8Ox3MBOh6kHNuN60IrSEuMqh0EH/xSFQ1G2PXZhn1paPAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gy4nv8CU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2161eb95317so48351115ad.1;
        Fri, 31 Jan 2025 23:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738395531; x=1739000331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xmvHIq9dsoshm+uhUroh5H2iby22JoiDwJUC4ufiTU=;
        b=gy4nv8CU8XdDxtKiQT9BGQbldOULrx6auZ8fHmSo4Lu1FZQy/c2hUPApuCpg5irj+R
         dzeiGgtABFCTwJIAFV0uhWLw27nZnH/gTj46QZg+WwSR6sGU44+QjBtF7Dzkc7Q6iXX1
         h/CyUE+PIf11pXANqIAOdg0B8lx5ZiUm3CmeesRsa4myQeSyaYba9NLKHA9LQ4RQIhGW
         z+/GqvPQ2cr2edIShefP1dUs/5XNSxFgDWh9icdhG05dJSyJTnG/4tK+fPQTL3aTmZOB
         zwXfiZ5phOCy/KTLEw3ipuSvdR9Pe6aiZ4Hc8kyeDk0QLgGhKqsh/PVy/Rh6sdNOKfMl
         /vNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738395531; x=1739000331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xmvHIq9dsoshm+uhUroh5H2iby22JoiDwJUC4ufiTU=;
        b=iMAiwEcuIQEiympzeY8l4BT50LAhCM7Vv6XzBPUCx6BOE0PiGGdipDVBQos/vnRqxL
         VrNJfSAZHfUUkIDdLFXS1PSBCIpas/HZKvyXLUrtGspg3QokHZYP7EcD5D8vahl9jQuI
         aCL00/cKu7F5OWOdWfivNnHPmYDaj8mMOfzO686skmSsyQy4t5iW0vrFfAA1HeykVImC
         YLHvc4A+t7DmgEJ5sE1nik/mBPtCuCuFzGvhEhbM5n8o5gn1MGwuIa+6jm84Vxa2JoLN
         M5b6hkLcUDTGOeeqF66lbEKGMH5N+AsB7OKcRfxqOuPbsuRYVwf7VAjRhIMjf8BY3b/a
         a+Aw==
X-Forwarded-Encrypted: i=1; AJvYcCV37Fib72Huq4iuH1BQNWgEDdSjAsKMkz4uoy/lErvHtqVAn9dWuwKk/R8pqro8IPvZ8rROOXgc+0Y3E+k=@vger.kernel.org, AJvYcCWkxL8bJzEe526KpcZA4DVrOAhU1H7Ix9BS/IoiPNeYHXAbbPUw0JhzZUG2YbSgdiNn7LlJVTYt81zn@vger.kernel.org, AJvYcCWy5t2rtFLg/ftmbKcD77mQaYBSqPGDQH7USRN7eLWdxtvsRtXO2Vv0/YhW8J3QsFhXK3cv3hU/eEU7YD88wg==@vger.kernel.org, AJvYcCWzmTeXMCI19iAa1lSG03CKqEsfi+m27JEGP4Z3I5cFDKUkwLmxJyYw9YTNrsz+4mCPrzKH6Rxlw7orOy2v@vger.kernel.org, AJvYcCXLk1AqoayVw3kMWIO7rVHBLP9S+11PRy60JDX8ouha2JuTepty4mEXlUbZvB4MgjDcX0MuTJfvkU0brPErx1io5T2S2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiSps+IFpF4w4tIxHOpQtuOzy6dq0jKBGTTA4LWugM+LIBjvn5
	QTo7Za9x8q1fyVxD8P87fkmtjI/0mwzeY0+aFBAxiwQN/lXPfKnw
X-Gm-Gg: ASbGnct2h49gLJyRlQpTaXeLgpuOH30CiYeBx9q5jTLWbnyw4vUSzbW98zA4VNo7R90
	5u7sQA0b0KPA2RYNpvH+dhf19rcR3rz3ngjt39WLkJQ9twi2GY8caxCu+BjQwekhLcE+00Dcw0w
	JNUKMQtF23cUzOM62nYEA2piGB+emoLYe/enpareamWZF6WQOoj3UNi1jY3/zHV3Svi8gR0DGfx
	bcWJet0/3VrsgmNaDm+WljHZt+evpO+cacwTA2YykPGzZhflGzA/b4Sovt+j85UF9CJfkmwdH+A
	0DOwTiZ+Mkqc+k3S
X-Google-Smtp-Source: AGHT+IEH7GLuMVenB+DGZ11031+0Z7QM64QuG4lUZJW7bAL42hdA0RgOGjpRPyREV+YjQByA00/2yQ==
X-Received: by 2002:a17:902:d50f:b0:21a:8716:faab with SMTP id d9443c01a7336-21dd7d78cd3mr216024245ad.16.1738395530815;
        Fri, 31 Jan 2025 23:38:50 -0800 (PST)
Received: from SC8280XP.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31edc21sm40719225ad.42.2025.01.31.23.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 23:38:50 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: krzk@kernel.org
Cc: andersson@kernel.org,
	bryan.odonoghue@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	mitltlatltl@gmail.com,
	platform-driver-x86@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH RESEND v6 0/3] platform: arm64: Huawei Matebook E Go embedded controller
Date: Sat,  1 Feb 2025 15:38:37 +0800
Message-ID: <20250201073838.3278-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <33f8a68f-46d8-472f-8061-52800e5bd014@kernel.org>
References: <33f8a68f-46d8-472f-8061-52800e5bd014@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Feb 1, 2025 at 5:20 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 31/01/2025 10:21, Pengyu Luo wrote:
> > This adds binding, drivers and the DT support for the Huawei Matebook E Go
> > (sc8280xp-based) Embedded Controller which is also found in Huawei Matebook
> > E Go LTE (sc8180x-based), but I don't have the sc8180x one to perform
> > tests, so this series enable support for sc8280xp variant only, this series
> > provides the following features:
> >
> > - battery and charger information report
> > - charging thresholds control
> > - FN lock (An alternative method)
> > - LID switch detection
> > - Temperature sensors
> > - USB Type-C altmode
> > - USB Type-C PD(high power)
> >
>
> Why are you resending?
>
> Previous version was only week ago and minimal time is two weeks. Plus
> its merge window, so this resend is unjustified.

Sorry, I am still new to the process, I may have misunderstood something.
I sent it because I had got at leaset one reviewed tag for every patch
from the corresponding subsystem maintainer. Can I expect that there would
be no reviewing? All I need to do is wait for it to be applied.

For merge window, I noticed pr from platform-driver-x86 had been merged a
week ago. Maybe I shouldn't assume for every subsystem.

Best wishes,
Pengyu

