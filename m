Return-Path: <linux-arm-msm+bounces-28818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AFE954ED1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 18:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 447781F238B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 16:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AC71BD51F;
	Fri, 16 Aug 2024 16:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtyWZH3m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B5454F87;
	Fri, 16 Aug 2024 16:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723825819; cv=none; b=Id1TuMEZaVHbz6b3UwNSFF2/1QCfhjnSY9ykNJA6fUsgXWQimoteX3h9oerq6XRyn3ed7coPgxjl0w1jfHcIqvEIwaAtO99dujXu0RhmAd5lBi4RRwsKUDo3MxB2Dlj06mmyKuUZiQ7j3OPH5u5Fahx+pPT3e0SKSFnVZBYpWoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723825819; c=relaxed/simple;
	bh=IKNMIHKLN9VpVN0kVPJyQAwhyIrSzPN1sS13icrfprM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPyao8rMoXllTYwxlReA6xbJ0NzP3zQJAm0jr3p38XYVn9GSOKOCZNE2Jo5ysXvwCxSGuurvH9cm0HXxy01/4d0jPUeOO7Ts6BtrbXHnjp/hhw781Y8Mhxbp0PMDMk4deTb6FdfV+NZVb5GM1v3TXoPgKpkbI9B/J3wBnZHSquM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtyWZH3m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E4BC4AF0E;
	Fri, 16 Aug 2024 16:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723825819;
	bh=IKNMIHKLN9VpVN0kVPJyQAwhyIrSzPN1sS13icrfprM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZtyWZH3mzvXR8GBnunZmgQm+whApyByTCQQ6o77l8JH0aefv/VyypIjzPXGw5r3yu
	 UD6oKEz21OX60O7cuDlH4TeLBwAHAY24JsQ1dXBmRxubszA8HzJ1Uo6iGsUngtLejv
	 /LR4CbGurCGaas6EsTiO+zrK+l3wfeXlh8SpQNBDrs3H1hShsYd6qcGAQpng2maRId
	 qFYmrIpxkZ4i+3mdXX1ghx8WfaRVxtuIfC4/cciLawLq/KowqxCwe5+D4tpVRckKBU
	 I67LZB8FMGOG9V3mH9HVZTd4gPFYO/m/ZiUm7VsKnh0GqQHhnKz83rO8Mw+fKU8SwX
	 uNam0bWtC5ztA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ef2fccca2cso24528231fa.1;
        Fri, 16 Aug 2024 09:30:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWejNBhGqtfyoW80JBTbDvVBsucSv+lrKo3cVBwUGGbjJJ4WCyTy/SjqGBsPOnTyJbh8LT82YM5CThpSIxg2GZ9qyUJaQ3TAqgbpJPUA/8QfEpACX2FBXhOy9umJ/aK9rfMDyGwYSf0OJjHPFWnPpYDSBoZXxIm5OM+5wziZ0YWmYjonGlHo/o=
X-Gm-Message-State: AOJu0YwWSXPwZ2rUMIcSo+qghkmzGt/DEHFKAnLF/zWRX/reSafDSbUu
	wgLG71zNeiYZ/fqrtFD8pODNVJXwU4WzeZOCGcSnxSrJT2DCo/H/fjHauuvwyklLS+cnCuMXKMu
	MMn067wt5FVvdNN31NGOJveaaGg==
X-Google-Smtp-Source: AGHT+IGgpmwBcXZ9HTSOfvUEUc5YWJFeu7rJyjBeWb0X2+k9K4FOx5shMS23qw0CAoWNfN3Ttgp8RQwFBrbDiBAqO5k=
X-Received: by 2002:a2e:b888:0:b0:2f3:c82d:9e7d with SMTP id
 38308e7fff4ca-2f3c913ef7dmr323261fa.47.1723825817683; Fri, 16 Aug 2024
 09:30:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org> <172222551321.175430.17493901039813561000.b4-ty@kernel.org>
In-Reply-To: <172222551321.175430.17493901039813561000.b4-ty@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 16 Aug 2024 10:30:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLiGxqDYXTJzYNE=4LN2Cpa+G_LY6C7YAfHRVmz=cfkPg@mail.gmail.com>
Message-ID: <CAL_JsqLiGxqDYXTJzYNE=4LN2Cpa+G_LY6C7YAfHRVmz=cfkPg@mail.gmail.com>
Subject: Re: (subset) [PATCH 0/3] ThinkPad T14s Gen 6 support
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 28, 2024 at 9:58=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
>
> On Fri, 19 Jul 2024 22:16:35 +0200, Konrad Dybcio wrote:
> > As good as the other X1 laptops
> >
> > See this page for more hw info:
> >
> > https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadt/lenovo-thinkp=
ad-t14s-gen-6-(14-inch-snapdragon)/len101t0099
> >
> >
> > [...]
>
> Applied, thanks!
>
> [2/3] firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s
>       commit: e6b5a4c3ae3b883cb13be2e1cd9fbf364928173e

Now "lenovo,thinkpad-t14s" is listed as undocumented.

Rob

