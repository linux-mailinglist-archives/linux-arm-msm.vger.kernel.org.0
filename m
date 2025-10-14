Return-Path: <linux-arm-msm+bounces-77229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 27725BDA3CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 17:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 879A6349427
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 15:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E63224244;
	Tue, 14 Oct 2025 15:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIwqjw8j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308182C0F8E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454642; cv=none; b=DYDjPBL2mgItT2ebA2Sy0tuzvsJNCnLiIw+cHYTb44ZJSJ3v4w2DZee22dqW11OJ0ISDOaAq/1nyleoy3UoZPvM/TQzu39EFxJmXv41fTA3K+v9dB0qliBn0p6xLoE/mqQUM0eGU/2OVXNTFFNMg94o5+7gk+dpy5UbTCN1rINA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454642; c=relaxed/simple;
	bh=N45NLKx5qz/uWyKxlofVnpvkJRX+F3r7dB9pwWo/Bh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzBN/fSSTQIO7LEqtgp/hW+0q71+fZHcHlgLRHjolbuYjK7+8B3FB8UNM/7l0jT68qZN3A27c7KSfm8SQFl04LJLPG9W17i04qvSXbiG8Mt7WVTmSs4bRumwTki2dY5JQ796a/QNhh/+MfXDD2RQfaBN66FpOzrph6H370Gj8yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIwqjw8j; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71d71bcac45so56830307b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454640; x=1761059440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N45NLKx5qz/uWyKxlofVnpvkJRX+F3r7dB9pwWo/Bh4=;
        b=fIwqjw8jl1RqtcbDjDGkeNyqgqMfCXA3JgCx43UpS/0X6LYOoyp4xffa6PGHw3E5Si
         vLfnptyA1MGdns2e4Xlz2u8psDiW2Dzv4Q8e+qWBOPFFkAxpv/I2NvFwUI06eWYfXs2C
         aD7u0ZtPVD3+/Oph73K58cT0NiA39YeVQAfEYju6uZQOusIY/XrlJNZmp3p/ACOWjSRt
         RxPyKFqsGuSasa75muxl2sBpHkIvvK+ZVyGTuI+IyfSLBINV8Q21IJnzSGlA8rF0GGWe
         y7b0gvGbcV17CU4thP8qoBPWnkBjEClG44V2tPn3nVzEeD9xN62FzK/XPK/DreczcVzT
         kd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454640; x=1761059440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N45NLKx5qz/uWyKxlofVnpvkJRX+F3r7dB9pwWo/Bh4=;
        b=aVG9ru1jC2kjtiuPPBwJnjAzpfhVT8Ra1+HbY5cJyfwD+pJtDX3rl3zc4YUJRoT40k
         JcJbAbivQDHO25ecVKQ9SubGRqkDSHtkJIBC3QEhjuL3U3jTh1wPXP36vY2gjmO96gcR
         7/cpMt4dtl36GZge3C7Xi3IowAkhDhN+25Q4SfblUoF8fCUv1y2KvckpOkVawPGvY/3u
         0cTUyLu/PJqA2U9RbxyyLY5tFvGu/dB1Pa103AQ0pBjHhTkEzLs+76auGJmYMSJbLQzU
         R6uJcehby6Cbf1HWQQBvPJbaSqwNT/97hOxO0CfrFiUSl0nFk8gQTs10mPzgNjtqXqWG
         kReg==
X-Forwarded-Encrypted: i=1; AJvYcCUfCOkgBhhIdicakST8xrHBtEAMrAt7XYlxDe6komPxVPk+hzBIgnV4d7uvySIYD9O1XS8bvrUEfL1NHU14@vger.kernel.org
X-Gm-Message-State: AOJu0YxALZI/oAVvrRZ0xs+iubYK8P5SC+Aj5TCfxE6I0qhC7yW37Rh+
	3d3yW9C4ouNSfKxQtRgr1bAsQtSdTNGRlHatrc7g3TnM9Z0Nq9h0q/LqFkHCtFhJ4DOjXCKjALD
	NWgBCB87TUI1wedyLgwbx15jEMIrwqd8=
X-Gm-Gg: ASbGnctjUU4JKDafIID7QShfTSzfNXFXaGD7G6hs/b/1ciNVufMfJPmOfsUCK/PXHxU
	R7OhloOrtUJwKpo9T7jSNtb6Sav+IaVGEQkd7jwzSsCXdpeW71T3hfYEBMgb4by2lssysHw9Bie
	8PGpM3XfCztt4Ca0Mk9zdrSI/9d98gq1u+R+Ym+nsiue7Rrm7p4Jk6v/7AkLR94oL1I05GTRWlT
	jSJAnufMfKtuDUPx8poeLEQWmUUA1sYNFIeQV0=
X-Google-Smtp-Source: AGHT+IEFfM4FGXJTQvWxhXUxdmWsCY/lm3PJuw9ZamSWPJz4UM3zNM8yD1Az1RQbZf5hUGrZH3eo7Ks3oQB0n6rIc2A=
X-Received: by 2002:a53:ed49:0:b0:63c:f478:a389 with SMTP id
 956f58d0204a3-63cf478a761mr8925251d50.3.1760454639956; Tue, 14 Oct 2025
 08:10:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014044135.177210-1-ghatto404@gmail.com> <20251014044135.177210-4-ghatto404@gmail.com>
 <e114504e-4bdd-46b9-b708-8eebc3075163@oss.qualcomm.com>
In-Reply-To: <e114504e-4bdd-46b9-b708-8eebc3075163@oss.qualcomm.com>
From: Ghatto <ghatto404@gmail.com>
Date: Tue, 14 Oct 2025 12:10:26 -0300
X-Gm-Features: AS18NWDwBpX6-RyiTxhZNQIFNlFjEHOZ4VGcSVYA_G4DwYI9zaRA-L3iyRKhUSw
Message-ID: <CAMQHOhfjsi1L+3j3TrcjEjPp3xkn94KOdsrVZvJCyUDFBBSeqg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: r0q: add touchscreen support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 7:01=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/14/25 6:41 AM, Eric Gon=C3=A7alves wrote:
> > Enable the ST-Microelectronics FTS2BA61Y touchscreen. This patch
> > depends on "Input: add support for the STM FTS2BA61Y touchscreen".
>
> The second sentence doesn't really make sense to be included in
> the git log
I'll keep it to the cover letter then
>
> > The device has an issue where SPI 8 (the bus which the touchscreen is
> > connected to) is not working properly right now, so
> > spi-gpio is used instead.
>
> Some Samsung devices used to use spi/i2c-gpio intentionally, also
> on downstream. I'm assuming this isn't the case for r0q.
It isn't, the device uses fts2ba61y on the spi8 bus - I hosted the
DT at https://github.com/ghatt-o/ss_experiments/blob/main/r0q.dts if you
want to take a look.
>
> Did you enable gpi_dma1, qupv3_id_1 before spi8, when testing
The driver probes, but it fails to recognize the touchscreen device
and ends up erroring, spi-gpio solves this and I did try enabling those.
It also works on the S22+ with spi-gpio, so I decided to do the same on r0q=
.
> that? I don't see any obvious errors in the dt that would cause
> problems
>
> Konrad

