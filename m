Return-Path: <linux-arm-msm+bounces-72146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68043B44A3A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 01:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3436216AEB4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 23:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093562EE262;
	Thu,  4 Sep 2025 23:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWVGnI3y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4E42EC0A3;
	Thu,  4 Sep 2025 23:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757027328; cv=none; b=HugtC1WV9kZaq/W4c06bRZjHaLX8Ft/PsEaf5rlo7WZvhyriVpiTDBiKGs7T842OKtEkhyDyw7QjQkjFwuDp3LjHe03IgGOHKqo9nsUTAAtp4QJLXR9XACmnXgQyVFEpRPSsOjywWknaG3n3SXTctfzFppdJiRK1Xofd40mC8T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757027328; c=relaxed/simple;
	bh=pKSe2I7FsIz9oUe8RUcoh1IepJvglPcizoO8xLPceOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXBymYMqL0NnVUqAR9tIzWr8eOld1HGd4ktbs6LZwsZPqTEiHniVgBRLhaNqabyqSIENdDQDHktdbqr16pEAymiaUTCgXWbWa2impKCQaCiYvXOYKFvLJ4MrIOOL4+WxASh0/jNY9XCbsR9jai8kvqm+BXp5y6TiBdDxsmfPoIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWVGnI3y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B532C4CEF0;
	Thu,  4 Sep 2025 23:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757027328;
	bh=pKSe2I7FsIz9oUe8RUcoh1IepJvglPcizoO8xLPceOs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PWVGnI3yQot/KdaG1EVdkAbuVJdE/TtmQUqBtPWtO0/WAT5bhvfpna2y5JWrO6Bt3
	 UC1qy2MIPAxZK84a4VpO9a8W6VZWWhd8yaPZulKoMh8IgJM5BSd1hYZxWFLfoJMOX/
	 SQ5wIB6s1Y8ba9+dbAPOcPvIZb0bOfi8EcErC1h6mhWY5P7i7kl1R7YoYP6n5CM9Eh
	 jDl27KFiR9BdMu2Dg7Th4WEHiQlPJL8/f0iumlFPX+bizIJOe/vDqqnUtd6FDKDLbL
	 XL264+1re99nRp+4j+PQzgLa/a+LgonEirFWkL1TJC5dDWWj4wm0L7YkCURaGSd8MC
	 z5oZ01kV9P+BA==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6188b5b113eso2598872a12.0;
        Thu, 04 Sep 2025 16:08:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUh8/3hTcMMOcBMzoT9u3w7qKK2NxHnA4SJyPHWYsJ+IRHwM/rkrvtIR+O3QYerfp1YxiRGRdzE+ZwGXLng@vger.kernel.org, AJvYcCW1bzbFyEkJOinGH2HbpS8P8Bb69Y/L+ghrz1scP0BB2X/juHN+mT0QZxs3ZpgDC+OdE1e6YBRxvKcjQx0=@vger.kernel.org, AJvYcCWDcg+DE40RJQeeQQpWqOsxd8HWCpwaszdXGf/nPsFCT6q/jDJZEToRqlLR3hfjirHWOF7VIQdK5CbgfnY5Zw==@vger.kernel.org, AJvYcCXvwp8ZlF2lcD3KyMUJvoir65w1qDce3lHv1g7IFeBhuZcTOplCrCFihwPGOBbmspFG/C1r5Cnx1Wh2@vger.kernel.org
X-Gm-Message-State: AOJu0YwG4zbyA2ng8YsLCZCxsyInjcxsd0A0pjBhy12rLlR4f+t5pHRB
	1jjQZe9phoMotN3ly+UL7jqQgIezQ8B1PwCgajhJNVzB9VZogPEj4kSJnk5yBmHDhRn5ruGb+4N
	oWREdWF11SJnHw2f4wjEkUlVp8u7tKA==
X-Google-Smtp-Source: AGHT+IENPZS9r0ij8qIOTkrijmtaIJvR+B2HNNGoggTiYYs/kxVwzXqyQELzGZLM6QK19zRSdfZJVmKtU72fD3rHT2Q=
X-Received: by 2002:a05:6402:84e:b0:61c:f0cb:94f1 with SMTP id
 4fb4d7f45d1cf-61d26fd1008mr18367716a12.18.1757027326925; Thu, 04 Sep 2025
 16:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
 <CAL_JsqKG+dcMgp1QF4F3Oxh5Shvagg6cSde=g1JMcEAquZhH_Q@mail.gmail.com> <990cb5af-3846-44a3-b373-ded62d3309b9@oss.qualcomm.com>
In-Reply-To: <990cb5af-3846-44a3-b373-ded62d3309b9@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 4 Sep 2025 18:08:35 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+zC91GPdzQQa9F8KEw5UL4xc13u5U_5vTyQG1WeJa5rw@mail.gmail.com>
X-Gm-Features: Ac12FXw7xn0otJeNBaP13ioqKPeSvsenM1h4BTS1EUlXELhLcOu6XHmBpXxjmMc
Message-ID: <CAL_Jsq+zC91GPdzQQa9F8KEw5UL4xc13u5U_5vTyQG1WeJa5rw@mail.gmail.com>
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 8:44=E2=80=AFAM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> Thanks Rob for reporting this,
>
> On 8/19/25 2:35 PM, Rob Herring wrote:
> > On Thu, Jul 24, 2025 at 8:28=E2=80=AFAM <srinivas.kandagatla@oss.qualco=
mm.com> wrote:
> >>
> >> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> >>
> >> Qcom Slimbus controller driver is totally unused and dead code, there =
is
> >> no point in keeping this driver in the kernel without users.
> >>
> >> This patch removes the driver along with device tree bindings.
> >>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.c=
om>
> >> ---
> >>  .../bindings/slimbus/qcom,slim.yaml           |  86 --
> >>  drivers/slimbus/Kconfig                       |   7 -
> >>  drivers/slimbus/Makefile                      |   3 -
> >>  drivers/slimbus/qcom-ctrl.c                   | 735 -----------------=
-
> >>  4 files changed, 831 deletions(-)
> >>  delete mode 100644 Documentation/devicetree/bindings/slimbus/qcom,sli=
m.yaml
> >>  delete mode 100644 drivers/slimbus/qcom-ctrl.c
> >
> > This adds warnings to dt_binding_check:
> >
> > Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> > /example-0/soc/slim@28080000: failed to match any schema with
> > compatible: ['qcom,apq8064-slim', 'qcom,slim']
>
> Will replace this example with slim-ngd and fold it in the original patch=
.

Still warning in linux-next...

