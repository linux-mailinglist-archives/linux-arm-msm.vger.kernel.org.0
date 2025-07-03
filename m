Return-Path: <linux-arm-msm+bounces-63584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2F3AF8397
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 00:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E632E7B43B4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 22:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EBF2C08CC;
	Thu,  3 Jul 2025 22:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fJJuxuyd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73DF2BF3E2
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 22:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582356; cv=none; b=ucf+v16+eo7ymVAIe4JHRv/FM6iXevaHCvJmHF1JajWszWPDcZ/7gR5wG8MqQYDuUYxQNOacPVl/tE+aku6j+/LuTCMIPzFHZBQHqna6YUvMpWp5xgHZCwpWZeUzQXc6OlQfFVSw+qPSDJxL+ssducbet77MSi5fNBochHnJhSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582356; c=relaxed/simple;
	bh=qHiJGvw/4jGa4QsGOCrg7eO9558uRKsIgpy7SwSLppQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eYnH6q0JiS3yrkdQfAqbsUhl5cmveALqnnYGVWfSlktCVXffYZSDl5TJKJzpkUjDAvEaRpDrZ2u0JZU19kxb5Np1NyCv+/EqAKnQE420CUmkMnSuXfZHYRU2xg1kJZ8a4WRgGYMdpBWXyJOlA7LSOIr/OkIHdX+01TpKG6iQn74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fJJuxuyd; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5535652f42cso406639e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 15:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751582353; x=1752187153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHiJGvw/4jGa4QsGOCrg7eO9558uRKsIgpy7SwSLppQ=;
        b=fJJuxuydbWi1fBH+rZ+u6VqGTiuFmdhNuDBHoAEiA2EP/VcIBFbpuljSObYqIx3QxT
         TxXQWRpeLBS+o0Tjc/vzxU7nLvozxVMl1o4ESAXN97oLqp8IA/Bv7Agu5BMoY2g5lZ6t
         kEX+ASWGkO7JZKok0QL7tjXzeK2bfitJbzUbPGFmObpIup1Ye8EUoMCmZthC36mVTWKZ
         NFqoFBguOm7UFPp39y19cvfhIjcwCJCGoy2NDQaVo5kpH6PyDRlP/I0fkHb70K+6dUuq
         Ne+Ilfbnfihzu9qDamktPzbF7jdazBOY7MZpxW2OgfN3qyF5PfabsTXVEyMM0LM6jvD8
         JwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751582353; x=1752187153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHiJGvw/4jGa4QsGOCrg7eO9558uRKsIgpy7SwSLppQ=;
        b=T37s8Qf9uSX74j/9ZmUtxf/506ZtQAYcZtboXRFbCcdh29H2g4AUwhPyN129PXuLR1
         eKswGWdftq+rFTlE/hTRQlQpNKyBNdgbvLsrdLNIWgwGyyNweSCsOB8oLOpWYiwyIKTZ
         MDOILq3MdMGM1Jilm+NqCv4N2PV9v3v9M0FP15vpOXeDseT2xFRz4BMvA1M5e2a9b+ng
         ZiK6uSFRivGEuJOXSe9bkERfL/vbDd4TdSKTbhgj/ebPGwScXC75vr9n6ozBovb6CirV
         X61jFRJtHMqE5UW5zyZO7mPLlJbxhJ4ZL7opDnHYXXTpA8VEXMm8zfqVZfvzq/9Cz5GT
         5Q2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNxyOs/PhMX/R1ADxT8dlTOjveva91bcg+O9YboDVxzn1N7nkd/mr6lWV/XlOFfpn0aI07nO8moHlDjP+K@vger.kernel.org
X-Gm-Message-State: AOJu0YzD6hOhmW6sa4WzFcVPYai9LO3bY3jscGcVDGLdm2J28rDYJHQi
	7L23jFQRs2w3D48G/Pl8sW95DKAUMon5J4rIi6DMrEspWYX2o5XCIelgI0wUGF53f9+/u/BwgD6
	98o27zJlx+WPgWWVhixHF+wphQBO07lwWf6iybbLwXg==
X-Gm-Gg: ASbGnctTgJXwEnrGQSe/5D3Eqekd+aFXNCHCVHXjd8lk24FsHQvtFl9fqiNT+w7KL2s
	yojQOI2mC2JAutYF+meirEVDY64KlXovpLnm6PWKN837/hbzIWqUa2X8Eh5iNo5dC5UA22GcU/H
	I2/k1fzK+Mfv/KTsz5ndfAol4MCE3eEAG1DOGu5dOHd04=
X-Google-Smtp-Source: AGHT+IGv3ck00tYjA0oJ1uAFiXX8dKOpbmMnkAsSvX3eRdG6T6/6PMHb5TEQ2nljlmc/vsAEZrYKze2AdV98N+dH7KI=
X-Received: by 2002:a05:6512:1589:b0:553:2e37:6952 with SMTP id
 2adb3069b0e04-556e73fd335mr44356e87.55.1751582352961; Thu, 03 Jul 2025
 15:39:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
In-Reply-To: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 00:39:01 +0200
X-Gm-Features: Ac12FXxyLpl7_cYrO9sRsqDV9GRQvTlee2Fpz1xlmG_qIRP703som7M3nlLO-ZY
Message-ID: <CACRpkdZKsfFWCKxd8QbUjrgrzHind6fJcZ0n0LeHmE1xPdUxuw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/5] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 10:45=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Note: this really is an RFC. Please don't spend too much time revieweing
> the code in detail. I'd like to figure out if that's a good approach at
> all first.

I like what I see.

Go ahead with this patch series!

I can use this to strictify other pin controllers as well.

Yours,
Linus Walleij

