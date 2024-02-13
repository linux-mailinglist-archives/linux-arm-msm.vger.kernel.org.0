Return-Path: <linux-arm-msm+bounces-10918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D617853625
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 17:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 151B628B38E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 16:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBA85FBAB;
	Tue, 13 Feb 2024 16:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xvVe6Qag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0555FBB5
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 16:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707842079; cv=none; b=Lu1ossP5Iluj74UFusij92X146GufA89b/lxvQAxBs7XhkOPUlG5G6nwySqHxFb8NOVvNUL+SO2+Y6pEZDtPkdOJ8dDSrF1jU2aOJLElRDVMyo/70PkWKgpA40LRP2Wpa5ZuOObjKMTB5fSLbwCDcXX+VJlM9U8OXELf1/T8nV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707842079; c=relaxed/simple;
	bh=qh9Zi6tg5C8H6VJFMfs4rvu5i4YkiIKOWDivVxYtq48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=agfo4m0eBLXEIvKKxV1IFTznFpcXZ8UiJA+L+7g0d9vh40S7HlnQfG52fZLWWX5r5TlzmnVX6EzQiTv8UPuDvNX+Jrt25s2LwGEV29pjbsHF+Gj90l022jw6KyFWCQNzNhhniNvyt/0PvsVWB8nVjdDK3NUWStMcTlEdKJ3k4lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xvVe6Qag; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4c02bdc2892so2287087e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 08:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707842076; x=1708446876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QTZIUFrrp7MxF81J3CDcDQvti3Wc8zOpi4mNhiqNKo=;
        b=xvVe6QagAceznq0PTUM0WaqEZCCYMHBjjfBp+CSLai3VAFJb2lEc3gfHHEgR3SGW0A
         ++dVh7UXgpTsHh/h4egAp40tnwp4jX1ihMiFkb6oMCP5ChaECRVxKP9bljmmSUL6w8x3
         WOrzctnIrqOaYk3lz8Fchz85qg4mXp3eb/m78KhaJghCGeM/wDa7DtC9ZhytKMk4WNAV
         l6jvqYcyG6ZGUYG82QCoNXyEyMSudRZDXY1kauim5RwMV0AiPhZy/JJ84KWqiExn+lii
         9Bezt1FFr828oyHXaiaBv1n1hKnZeTgLfLV9qjbQyJvP3RmdMWVpIBILh2jSQHmm9MBK
         Yh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707842076; x=1708446876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QTZIUFrrp7MxF81J3CDcDQvti3Wc8zOpi4mNhiqNKo=;
        b=w9y32SSoSfv1rdLe+BdFKQE4ljF/YlTnqN0x/mtGBo4afccIPvYvD/cnZg5xk7FVLY
         4GdBIfGzIYmQSeraYQr+BL7Fz4Y4M0AFkczw8P/+PAmLfZOmVC56dnTnMUYxmKrdLyDu
         tzjoMs3cjThl3KknzrY+7R2rjd5w6/sL3ayV/YuraIbP2f5BEepyvvxvvsA2Ii/7rKMp
         JGLOfVSSlpJO99C3mRGcq9dwxjNSYDBdwyfrN7Uw5GoEJVa5wCoUobfwJYBF0y+I/FHE
         gmSm4pfq0zhNaMR8KQYoTuHtV7Xs1ULKl4RruqTOgNlcwJxsy22YV5a52bYAQig9eZ0L
         n2dw==
X-Gm-Message-State: AOJu0Yx1beG8hq5eGs2z78nv2CxtZild16IHZC8QH1OTymUR8aslmUwG
	UwkGRhtf4jt3VD/6vYAzxHATilT4qsBORXi81FYOBhOJDMK6LDA0ffsFIz3qLtBsVztmglfAzzI
	l6TjBHZZxs6Do98z3Yj0gUd17tNXRyA35Z06JKA==
X-Google-Smtp-Source: AGHT+IHLrGY/9w7JE8p14AKLwUvvhQ6K08W9tSUadgwCQ43pxqBRLZe/15lo9E5igUFN0xb253wR/IYEhjg3+2D4N+U=
X-Received: by 2002:a05:6122:4c83:b0:4bd:800d:7308 with SMTP id
 fg3-20020a0561224c8300b004bd800d7308mr2775525vkb.3.1707842076222; Tue, 13 Feb
 2024 08:34:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205182810.58382-1-brgl@bgdev.pl>
In-Reply-To: <20240205182810.58382-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 13 Feb 2024 17:34:25 +0100
Message-ID: <CAMRc=MfbcweVTo0-Xqe0aMyWfX14AHqYB+Y-1iK2nY_gOTHaiw@mail.gmail.com>
Subject: Re: [PATCH v7 00/12] arm64: qcom: add and enable SHM Bridge support
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Guru Das Srinagesh <quic_gurus@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 7:28=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>

[snip]

>
> Tested on sm8550 and sa8775p with the Inline Crypto Engine and
> remoteproc.
>

I forgot to mention that I also tested it on db410c where it correctly
reports that:

[    0.107312] qcom_scm firmware:scm: SHM Bridge not supported

and falls back to using non-SHM bridge allocator.

It was also tested on other platforms by other people which is
reflected in Tested-by tags in this series.

Bart

