Return-Path: <linux-arm-msm+bounces-23322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBBE90FD49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 09:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C704282EDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 07:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272A941C6C;
	Thu, 20 Jun 2024 07:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JhVI2imD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF324502C
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 07:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718867240; cv=none; b=lnA3fEoTdzeb55NGGrElTispOfBez6Cb1TLFX0eLA0pTOnkHUOYPnEfvjL9UudGJO64AnKTWqWvl3mWGXtmHveXdcX7Y7E0fzMDnEhi+Vpi9rvJ6ftaGhanhxjfYIEmY1tZ9VxJtlgUc07UYsxtLKug9g1/+tt93gGej1eITrGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718867240; c=relaxed/simple;
	bh=xkborBVQqATfxeYuZo0pqhRK2jK4AIFNMSFgIY20WZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FEHQK47Osj5BgVFU0kWe2oPz4m9c8sn9waPySPDMrZ+HMDEHyn0WAwLqc+QjuWFZY1wtPk9EfDi7PtTYGJ4UiYH3VM9HxZ9JaWHW4leCoO6+uvqRVUDF1b8ZkHqJCherZ7Wvk+la5tB7xS+WQ/JLjnouPu9La52Z+JJUPa/sGvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JhVI2imD; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52b78ef397bso1465502e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 00:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718867237; x=1719472037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkborBVQqATfxeYuZo0pqhRK2jK4AIFNMSFgIY20WZ4=;
        b=JhVI2imDWXMunBxbUd1ROI/FGgRBWx5GAF+G+hjysWhRHs170sr3YZ8bZkWogTForn
         1zeAORmlKXD3uMGOoXrAEOeX3qFDW818Zcw9SN+7RbuTykyiJC2f+32ayU2x+BmiMW+M
         IYXgvmI5Y2WKnI/mtGXgU6Lvb8kzBc7t5Lrztqo7IdTntTaoUhsef+YLVav7mOTKJZzH
         +MbT8D6FuMud5z+RHJcIqhfsql91LPeoQrYORZWJgGlr9hiOfWLVclFR8nIgLWTzeY3l
         ID23HEvsj4ypwsknrLd3O7H202m32X86SSm0NhLDnXdKkE27mSl2l1kjPIghBxuOZ36I
         D6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718867237; x=1719472037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkborBVQqATfxeYuZo0pqhRK2jK4AIFNMSFgIY20WZ4=;
        b=l+1dGhRO04Gc3TZxYNQiqlFyzgV5+g9Yv1mT438IKfDWZHwhvHAwcq1hLweaj1kh3y
         w3ha33TLNzt6fX3BcegoB9+gjk+diSlxLYUrRDKO9fMImODG6TtauF8Ps+NIT5dHpkpG
         yZ6E4xnhbRGPdhBtMC63vkr4rmobmbR+mLoamOb2If1KMOGExv+tbyVW5HOjJsv8AH6c
         njMZCtY+vZMlHOkQ3maDDnnAJQUUzuTQPKyizbS4d8JuEHOrq/jEem6kXjYPSCZKl2T9
         Pf8mcm9gkroUVtQSD3rKOxPNzhtWLHSaEkgK+Q3T9syjonzdNkyYV9QCymH9rYjK6RYr
         QCUg==
X-Forwarded-Encrypted: i=1; AJvYcCVnBmRRaZjf6k3bMTuFzhT1vTDl3LuqvASmhPWDm2pCtX6tm4faWZMXZaMAxaw7YWHmO72Jkt9Xk70oG06wcCviPiBoLJEHOBd840Gtvg==
X-Gm-Message-State: AOJu0YwCuQM1pTT2Deec4bB9ITRL5hY+BLiW6FQJv7ouWXZ42dj4Mcnp
	hjcrXots59U/9TfKOfG7plz7+B7wx3ATencdofZz/sQTkepso+J+8S6LSjghXX2h0IJQvhBO/2m
	62SnzaMItOoYv/VC3v91Q1XTFBw1c9XlB2yipZA==
X-Google-Smtp-Source: AGHT+IGznKypN67m5DazZCw9I7mRhhfCAaES87tn5Nfb7CJ3RodSunoLhO3DfVgiL8JmRA7ov/LfT+ssq6hhezZHP/U=
X-Received: by 2002:a05:6512:689:b0:52b:c023:6e53 with SMTP id
 2adb3069b0e04-52cca1bf700mr1557692e87.11.1718867236530; Thu, 20 Jun 2024
 00:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619183255.34107-1-brgl@bgdev.pl> <4df2a52c-c21e-4da0-9ca0-13f28e81018c@linaro.org>
In-Reply-To: <4df2a52c-c21e-4da0-9ca0-13f28e81018c@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Jun 2024 09:07:05 +0200
Message-ID: <CAMRc=Mf4dZHMyexj1Xaw1dMVw0OT3=1t8OMfpHCB0xGJ9JdvSw@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sa8775p-ride: support both board variants
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 8:50=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
>
>
> On 6/19/24 20:32, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Split the current .dts into two: the existing one keeps the name and
> > supports revision 2 of the board while patch 2 adds a .dts for revision=
 3.
>
> Are both gonna be actively used?
>

Yes! This is the reason for the split. I initially wanted to just
change the PHY in the original .dts but then I learned there are a lot
of r2 boards in the wild at QCom so we need to support both.

Bart

