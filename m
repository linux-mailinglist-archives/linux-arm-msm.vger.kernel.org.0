Return-Path: <linux-arm-msm+bounces-17454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2202A8A5954
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 19:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FDC01C20BF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 17:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C611272B8;
	Mon, 15 Apr 2024 17:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ATeo5rCl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D2D495CC
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 17:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713202910; cv=none; b=n3QCBFnPDeqEh8hG5xMz9YDawE9DlFi+Lw5/6DkvRonNL8sfYWhk0VADcQt620pgn/RC00GHCYS5q/YAqoHzFkI1zcBl5fPvHAn9H0l6LHIJ1STnv/fczrDxTavBKXnoBvbKfsN/MNL1kQRTUmY0QrH5ZggUqBmT9jGbQDw9UVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713202910; c=relaxed/simple;
	bh=xDzP8JtH++TeG6a490HKNdr4gYMBp0MXFefRWtUa87E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GgpFStGQc7aEF7jbHTmVa531yG3iapiEsIqlodonr7caI3NmUCnqCHsIB32nHeju1hVKcluxLqx0YWDGzVaMVf4Pgy0LD8MBYa0qa7QVhXLbKZjCZrO9gOySoXFBZUi/u2+mom+Te1RRPJZA5HwSISzBeA0X375n51I9WKIpxeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ATeo5rCl; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso3399556276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 10:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713202908; x=1713807708; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYgIyvMvRWICpRScbQV/k/jY5uYOgDdkXOWDfquSjCo=;
        b=ATeo5rClKw3FS7E6DymOTXcte5a7C45OqKGWyd6e8dONwLEwCz/K3oXTy9ighRjuyb
         /EWaU+ANG8N0FjAh4xSL4jE/b6DyKGuqc/JEKMwCMDhQ1m4TAN6nH+s4xhebIdWii+Tj
         736xA+AGi4CD1jCjE60s2Ofv5H5NXix9XXYEqveOMvhH0k989iVqpPcTEyUEJb3bdYsF
         msR29IKkmevBqlFDs/NljGFHvC/K0+9pPjiTC6modLhyeROG3PqBk+stEQCDlHz0rsnS
         U4XbnQnU+FNt6q187ERxC2ZVMwKP4TeCDc2Chrpe1K0KCDctKCkTw6rXzn/cJ6x4N80E
         agdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713202908; x=1713807708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYgIyvMvRWICpRScbQV/k/jY5uYOgDdkXOWDfquSjCo=;
        b=i5/gkLgJUnidRjjfuNJDHXUCW0LsNC6h+hO/qQ/iuJNLsWoCaLRyGgT9klAFmNephP
         0xO6c+C2IMkK1EDNzex+ti+mHzeQojF7BEPiauQrIqe45DNZK6aWU2GQaYqMrnG3oeBB
         FMu+wFglCbafEzcEQisz2bJMesba4CUyj5M8cAh8nmyVujt2pIljezuyGb4aBGSqDnSp
         vXtVxbc9wCqLw6c8NEBRe4uPsdvseL/HCSewpiAjRkzTIkW9FnChvjSW0C9KVHYQKCn9
         mXs4Zk4WH47nKUdTeCwqkg6lsDTTv5ggpvCDSc+1TisG7oQJfh+lj3nC1hbRlCvtwIra
         0bCw==
X-Forwarded-Encrypted: i=1; AJvYcCWgULUExPX7Dk4QZTPdfCvnq97tNle6vAidqyZklvM0FBQA/PE4OIhNSINva1RY7dM9JjCG+KEfv7jQgkodqXtMFjvQ+Vy2//x8gT4T8Q==
X-Gm-Message-State: AOJu0Yx8f6LjOu1xj2bw6MppFqkHKtqO9vHB5LtLLxL0I1hDfjIkJvPl
	m30RSt9o/epXYAZ9Ip6eMjn13oxHu6NCX3LOsQe6/9fCRrVl9CVmgQ9M1Yz58t0eyACg4oSUNcw
	guAd9rSkxgrDv+DVDpmgYPG3z4ErwnT/XaaNQEQ==
X-Google-Smtp-Source: AGHT+IHKpNfr2TaUgVv6Ugvchn9mUOD77xP6+GIEtmI5RLKRLLZLr1EmobTo6CX82MQ9pJIWGNHcl6abRXCvRtZsfeM=
X-Received: by 2002:a25:80c6:0:b0:dcb:aa26:50fe with SMTP id
 c6-20020a2580c6000000b00dcbaa2650femr10533953ybm.15.1713202908173; Mon, 15
 Apr 2024 10:41:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240412222857.3873079-1-robh@kernel.org> <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqL2T4bJZqtZ9KF=V2NLnFxUjouA6_Hu_H07DofifZaoQ@mail.gmail.com>
 <CAL_Jsq+q3OLEMT=d8=d9o1D9deKGQ5TAtZg_bgptDPQ1cWcctw@mail.gmail.com> <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
In-Reply-To: <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Apr 2024 20:41:36 +0300
Message-ID: <CAA8EJporYZBfDoN6m0Wu2wGqq=Y+TskNCguMOHtDAz05eXS6LA@mail.gmail.com>
Subject: Re: [PATCH] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, 
	Khuong Dinh <khuong@os.amperecomputing.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Robert Richter <rric@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com, 
	Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-realtek-soc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Apr 2024 at 20:15, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Apr 15, 2024 at 12:05=E2=80=AFPM Rob Herring <robh@kernel.org> wr=
ote:
> >
> > On Mon, Apr 15, 2024 at 11:52=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Mon, 15 Apr 2024 at 16:46, Bjorn Andersson <quic_bjorande@quicinc.=
com> wrote:
> > > >
> > > > On Fri, Apr 12, 2024 at 05:28:51PM -0500, Rob Herring wrote:
> > > > [..]
> > > > >  arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
> > > > >  arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
> > > > >  arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 2 +-
> > > > >  arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-
> > > >
> > > > Acked-by: Bjorn Andersson <andersson@kernel.org>
> > >
> > > Note, we'd need to override PMU compatibles in sdm636.dtsi and
> > > sdm660.dtsi. Ideally it should come as the same patch.
> >
> > Uh, that's an A for reuse, but an F for readability... It's sdm632 as
> > well. Will drop sdm630.
>
> Actually, aren't those Kryo cores just Cortex-A53 derivatives? So the
> A53 PMU compatible is an improvement over the generic one still. We
> can't just add kryo260-pmu compatibles because that breaks
> compatibility. We could have a fallback, but then that introduces a
> pattern we don't want.

I think it is believed that Gold cores are A73-derivatives.

--=20
With best wishes
Dmitry

