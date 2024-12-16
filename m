Return-Path: <linux-arm-msm+bounces-42398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 610EE9F3D17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 22:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 268FD188A78B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 21:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122CD1D61BC;
	Mon, 16 Dec 2024 21:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U8Qm1ytN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF5A1D5AD9
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 21:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734386052; cv=none; b=l/588X1cwmcTX+9NP9/NJJW/atidZu46UvE+HraAw/MpGsqnWlVFXi28RCXhodCubecCwKKkAjb+6wi6zmsCaAKcu9LToiEPtV5vn2vbOxn9ake2FXqiEyDyCKdmlVBGZ0xRslb0cA6yLxrmfndad8qcrrJ3zEsOl9hXVqJGAzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734386052; c=relaxed/simple;
	bh=0X/mAoqp/sXaxB7xCWI05qdv/rXkeMO6dZ+zaMAc/ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IeIpQteoXPJDT6xh/jiwHg1rzhwxyzg/OKbez/4tMO/AO0xFG3udM0twvWKRf/aM85noqdDqzdz2xkPEvnGBiw5r1cJ1ktXwMZjWHKEA0Tq8rCE8hGBDFy0KfLUa1xeNrHlHi1ZBrVnS0b5v4x5mhOQDHHaPDolg0IX523rQ1E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U8Qm1ytN; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401e6efffcso5378391e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 13:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734386045; x=1734990845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0X/mAoqp/sXaxB7xCWI05qdv/rXkeMO6dZ+zaMAc/ww=;
        b=U8Qm1ytNMyPQrSHg6ytIe41ORudbwMIn5e63Tffa7H1hFRI//YvrD7puY0up3DETVL
         MUN7rF2K+jw2f666f9tARXxaSnX+lToAmMmDHtX9bcImL9DwQ7uHiMIRxDry74B2B6i1
         uaFat9wtmWzfpdL0YBRK4Al5KYuRC9De6siXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734386045; x=1734990845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0X/mAoqp/sXaxB7xCWI05qdv/rXkeMO6dZ+zaMAc/ww=;
        b=kiAHJmz7v3DM+oe6CQG8SV4NRpx4/EggVsXBd06mqob96hqMkB2hcVvvuKvX5lCB3J
         /qm8s9Uf/GZNQoiEKfODnaIXBcvZM7SMVCC5GZAsyvqUxTCQwLJ8OM83q6drTrk9rdzG
         xkoZUMkmYm9l7E0+MtEedSKyfKuENeF/TNHfXEJ+ahdoQa+g7dghT03g/ZeEzclh/atx
         9p0m+JNhFl6H+8Zxemy19dKY1vaNtm25///yekNcRexQJeaPRwl5YfqydarwCQkTrLmZ
         bSDiufCdpJX5D5M45EWaUYUrxIuw9NobSUHVOUF2SeOIs4wks2ibF30QZ6PSbg2uaQhB
         3oyw==
X-Forwarded-Encrypted: i=1; AJvYcCUqfLlvagJds+CyJk3off7O5HkJf/4QPDMKQw3BOsqdAVXcQU6MzUroNetv8wEGQK1B7c38XcVL3xd7LHl8@vger.kernel.org
X-Gm-Message-State: AOJu0YyPdzHayIEcIrDUDIkkrABjJPlF3mwkndJgYQi5RX2yY/F5ajsm
	THvgnawApp54zdmvI7HSwocOMK1dPkLr99x1K1sdY02BDr2kTtvKJ22EOstcFPyDyezsArGF/B1
	g5w==
X-Gm-Gg: ASbGncuaba4l0d1lMYUSBBdyl9FUOUj+CSsXKM0Jlb+uIzql5IwEecIA5QOApZxA7t9
	mgxYfxCyGMIEijNI9lpBAH346fZvUVoJWYBGqzkcnKdqpB7b3Fj7niSQaiIZARacigCgwk5ZwUd
	fnLWXY1Ly8WtUSoSyL/3h62GMbqXRevE1T4hsjJFZW9+mouZCPK9f7viXIDsGkAwtLrBdQpSBgB
	odxjrXZyvOROaUL17XbtLDghKKoXhBZ6Aa+30SNiVhR00P6Vg2KDw7DqTJ5a/sLru9hA2yKVm05
	mLePL/Lfjmwle6zgg+ARc1/g
X-Google-Smtp-Source: AGHT+IH9G6y35cnK7fJWQpHMapxtxOMyOpai4mk5A8odTlj9HfJ9Qu+MJI1kqUObG/y5qW8vhIITTA==
X-Received: by 2002:a05:6512:1296:b0:540:3566:5b37 with SMTP id 2adb3069b0e04-54099b6a827mr4919044e87.57.1734386045005;
        Mon, 16 Dec 2024 13:54:05 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120baa4e8sm974865e87.102.2024.12.16.13.54.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 13:54:04 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30229d5b22fso49139201fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 13:54:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUt6DOT6JTiarA4Q688POzYg7C3Q6xfgFQuO3IaZLy0gjgFKbPRv13TsGG+fgEDUueVzGYV8pwVxX6igY6T@vger.kernel.org
X-Received: by 2002:a2e:ab07:0:b0:302:3508:f4ab with SMTP id
 38308e7fff4ca-3025447d9dcmr52859421fa.21.1734386043147; Mon, 16 Dec 2024
 13:54:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.5.I41e227ed809ea607114027209b57d02dc0e98384@changeid>
 <l5rqbbxn6hktlcxooolkvi5n3arkht6zzhrvdjf6kis322nsup@5hsrak4cgteq>
 <CAD=FV=WQf+ig21u316WvQh0DoKsdKAmZgqPn5LB-myDXsJtXig@mail.gmail.com>
 <CAODwPW919K+XdxjUe3aPgxsv0CEWwx0P_Hxvf=VniLhk8eagkQ@mail.gmail.com> <2qx75syaojhnsqt256li6sinafml4gohohvld6uw3zhejrayuj@biiep5dvko7t>
In-Reply-To: <2qx75syaojhnsqt256li6sinafml4gohohvld6uw3zhejrayuj@biiep5dvko7t>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Dec 2024 13:53:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WQhJcCNhSV7NJkdsuGjV2TVSvepdGisMU4reVUBURAzg@mail.gmail.com>
X-Gm-Features: AbW1kvafuAWb2tKHIUPH2ZldlV7L89d5SkwGUAoEp9RCWUT_FGgm1aB4MxqcSSg
Message-ID: <CAD=FV=WQhJcCNhSV7NJkdsuGjV2TVSvepdGisMU4reVUBURAzg@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: errata: Add QCOM_KRYO_5XX_GOLD to the spectre_bhb_k24_list
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Julius Werner <jwerner@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Roxana Bradescu <roxabee@google.com>, 
	bjorn.andersson@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Dec 14, 2024 at 3:39=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, Dec 13, 2024 at 05:28:55PM -0800, Julius Werner wrote:
> > > Interesting. So the Gold/Prime are actually IDing themselves as
> > > straight Cortex A77. The Silver is IDing itself the same as
> > > KRYO_4XX_SILVER. ...so in that sense there's nothing to do here for
> > > those cores.
> >
> > Should we add some comments to cputype.h to record which other
> > products are matched under the same ID?
>
> I'd say, yes.

Sure. I'll send a v3 with this tomorrow.

-Doug

