Return-Path: <linux-arm-msm+bounces-75024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F582B9E2B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 23D734E2CE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D01257844;
	Thu, 25 Sep 2025 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EL8Drhlx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDEE248896
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758790890; cv=none; b=InrD8BG10ufKu42nQLSxL713IPw4682lXz4xHLNTSE043715JBJb+h/3CX24yORzeJ//lI/UnX8eYYIr6dBM8tr56uuLJ+TSBDC9vBbT9HUO6iExXRgOpP2Yj1R41bAGbbGCQYTD0MthV/RAZww/RX1X4ZTBhDpSkOG83H6e+xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758790890; c=relaxed/simple;
	bh=fD8ApcusGcdw4m6JF+k8e+dqbfT02VTIYtFa3Uz/XPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SnQg6/9DF9k8dCQOzWK3tkdOLS+8aUWvXBNJrL5tAesDpUSr4F/yliKEIxyrDcP7VL3ShKbATTjFwTa62XbF+A/5zZCKZE4k5Xpz4BiBQqWLlHBLFRqtwRvhJ94FFAZ8jPN/FQ1qR4kVomR1Vjb/+oT1wMQomByCHLq33M2THTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EL8Drhlx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5119C4CEF7
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 09:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758790889;
	bh=fD8ApcusGcdw4m6JF+k8e+dqbfT02VTIYtFa3Uz/XPY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EL8DrhlxaQqp3RWzdH9PiveThCsFgdzRl9JBw1mQ4q81M10pVlIcPc0l97S13vluj
	 9KwEMgTQFEnw7tMCD+rwMpIzk0hJcDqC21WqHophxtdeTbO63khRa00xLmDKDkhOGl
	 M6fokCbYuCDYMW3LNkeZT2dY76JAiJQKXLUq3jbKQrg7WiPw0J4T90EWKOc0So52mn
	 PazNk2I7qfASUw1kH5gnct5y8sTGW0AZYbf3msFB/oW03pgASE1UKzdw8SsCfuxFk5
	 9jhf4axjqbIa3CdpwkA0FQy/FFCOd1W0r5nHfptJXP6NkPZoyugew7qW9HDhAnIKsY
	 uaaXosC2qiKHg==
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b551b040930so494679a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:01:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/CJ3STO+o6HM0F5I516qH+V9wnkD2UfsJVlsZ2VybP/UEBpPcli0pi31afLBGNjCyDvoFkEXLM/yj56Z0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy84dJMBOVGJ87vNQ5PIe74MOtpG+OGE3eea7mmCBnSA4oA4IiC
	BZPq/vl+mbME1/eGw9qJFbtbxz8amMP2B1xoP22M2IY3HnzBsvvWjaEcTvDYz1rKeTMo/Shf+GN
	Pe/69aXqw5L1+AEsYmZxY+BDRBXQhiyo=
X-Google-Smtp-Source: AGHT+IG3ej2HHVybp4+rYJBAMsKx4UiDYKhW2qkPfNaRZpitN1plIE4OoCr/H+en0xBaU83dJRUAaFQz2rvvflsPJvc=
X-Received: by 2002:a17:902:e78e:b0:25c:6159:8ec0 with SMTP id
 d9443c01a7336-27ed4a607f8mr24947925ad.51.1758790889405; Thu, 25 Sep 2025
 02:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-6-3fdbc4b9e1b1@oss.qualcomm.com> <CAJKOXPcbJY4JEjfZLvOAXEWCTYFpe7En+Riis2t3K5fWJgNU5A@mail.gmail.com>
 <53d63dd6-a022-4e80-a317-3218976a7474@oss.qualcomm.com> <CAJKOXPfGC=FK7AKOtmmSV7=3NNXAHe8A_PGjjhTKgRs4Jk25xA@mail.gmail.com>
In-Reply-To: <CAJKOXPfGC=FK7AKOtmmSV7=3NNXAHe8A_PGjjhTKgRs4Jk25xA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 25 Sep 2025 18:01:15 +0900
X-Gmail-Original-Message-ID: <CAJKOXPe6Gdc8qb7fwwNsMLiv0SxXm=aOtrR0HsU0S9wiu6erKw@mail.gmail.com>
X-Gm-Features: AS18NWCcdYHhlfDr6MT8BcOkfsqFVNv3n-aNcPx7RGOvPf1-osy5VNyVN2DH77I
Message-ID: <CAJKOXPe6Gdc8qb7fwwNsMLiv0SxXm=aOtrR0HsU0S9wiu6erKw@mail.gmail.com>
Subject: Re: [PATCH 06/20] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

> > >> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > >>
> > >> Add the base USB devicetree definitions for Kaanapali platform. The overall
> > >> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> > >> (rev. v8) and M31 eUSB2 PHY.
> > >>
> > >> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > >> ---
> > >>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 155 ++++++++++++++++++++++++++++++++
> > >>  1 file changed, 155 insertions(+)
> > >>
> > >
> > >
> > > Second try, without HTML:
> > >
> > > I really don't understand why you created such huge patchset. Year
> > > ago, two years ago, we were discussing it already and explained that's
> > > just inflating the patchset without reason.
> > >
> > > New Soc is one logical change. Maybe two. Not 18!
> >
> > It was previously squashed into the base soc dtsi patch and mark like:
> > Written with help from Jyothi Kumar Seerapu(added bus), Ronak Raheja
> > (added USB), Manish Pandey(added SDHCI), Gaurav Kashyap(added crypto),
> > Manaf Meethalavalappu Pallikunhi(added tsens), Qiang Yu(added PCIE) and
> > Jinlong Mao(added coresight).
> >
> > While it is over 4000+ lines when we squash it together.
>
> That's why you send one node per patch? Multiple huge patch bombs land
> the same time from Qualcomm, with patches adding one node. It's like
> the "no more patch bombs" discussion and rule never existed (yeah, I
> know it was removed but the spirit of keeping maintainers mailboxes
> sane remains).
>
>
> > Also as offline reviewed with Bjorn, he suggested us to split out the
> > USB and other parts.
> >
> > >
> > > Not one patch per node or feature.
> > >
> > > This hides big picture, makes difficult to review everything,
> > > difficult to test. Your patch count for LWN stats doesn't matter to
> > > us.
> >
> > With the current splitting, the different author as each co-developer
> > can get the meaningful LWN stats.>
>
> We don't care about your LWN stats.
>
> Sending stuff like this for your stats, means that community and
> reviewers pay with their time.
>
> This is really just selfish. No care how maintainers need to scroll
> through their mailboxes.
>
> > > NAK and I'm really disappointed I have to repeat the same review .
> > Currently, there are 10 SoC DTSI patches sent, structured as follows:
>
> Why did you ignore all the feedback from 2024 and 2023? Every year it
> has to be repeated?
>
> >
> > SoC initial
> > Base MTP board
> > SoC PCIe0
> > SoC SDC2
> > SoC USB
> > SoC remoteproc
> > SoC SPMI bus, TSENS, RNG, QCrypto, and Coresight
> > SoC additional features
> > SoC audio
> > SoC CAMSS
> > SoC video
> >
> > Which parts would you prefer to squash into pls?
>
> I made very clear statements year and two years ago. We also discussed
> it on IRC multiple times. Can you join discussions instead of ignoring
> them?

(Apologies for lack of trimming, typos, HTML - using phone)

...and you sent both inflated, LWN-stats-gaming huge patchbombs
(Kaanapali and Glymur) three days before the merge window starts.
Community works for free, doesn't it?

