Return-Path: <linux-arm-msm+bounces-75013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E63B9E0FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BB9C189FB1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DAEB223339;
	Thu, 25 Sep 2025 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guLmprg6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4894217A2EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758789165; cv=none; b=mRlJHGEV8BNQYqDD/wDKSOf5P/0Ec2AFhXLMUi97H/wnb4ZBWIoutL66yaO3chMwvEcXbCjf057OXAKXCH/QZDjL/dpLhB71QSJ9F0LuC8Kx53h5xpq/YWTypJc/mPir0MkCiBsZDmndpKSW4jfP2214EvDIOyVyYzlCPfRp5QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758789165; c=relaxed/simple;
	bh=1U+8ZCeOt54StVgsf4liIhu0wX+Pc0FpxnKK3mlY/jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LxxeU4vm98QsTk3p6wWQ9VI5Jya+FVMCt6OX1pkgQZ7kzxUqziHj0PoulivsltskmJVZVdAK9r/kJxy7MqUzZduUnVahS04GBZsb0NuVyLyvuw4Y2CSQusSf8FEUEWEbFuTLdRKyRphnd3qbIyL/hfs/wPiLrsWLaQhueQPAYhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guLmprg6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E977EC4CEF7
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758789164;
	bh=1U+8ZCeOt54StVgsf4liIhu0wX+Pc0FpxnKK3mlY/jg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=guLmprg69iEj9j9rhTzMBWFxQWpPSriawQEcGtxa5WMyo14QgLGvSuv3CQ/ITD5XQ
	 XA5+giTE8rOC9EaZIPsMUnluF/kbPZTOMB55ICSyY/KaBSX3x8uxzvNwQ5ZvhlzdAO
	 YkbjPiLW2441RK7d2310vtMlZn61qHBNavncdnCJcQ3P2/M5I4OWGSKE2ac6dftDHk
	 ILxT1T9BlFVnCcPDSz843PQt+1MIK4KBJNgWnpSrq5HrGkir1kBJCziXs2N0iIExBT
	 Qy2lIJ/3xmEtPYGqfElFkn9Zk3b7ds3NbuXeilJWaktSmNAHqF8QcxB+8tHl0hsX9w
	 QWPe7cxwCVcfA==
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b555ed30c1cso551370a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:32:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWXfMIJBVgDJia6iEjv8LoQFO3Ir/OL2HS+yaq8S1MFHG7Axkn4qNGQKmZnLNuwZw56V57OgImPATC1C77J@vger.kernel.org
X-Gm-Message-State: AOJu0YzDzywvQyXsfIMoqCt2c3Y+a0Cm6ZI0/sTHuZauKMbCFWBaNE97
	33Ku7oU8EbYo0D7NmWMSGWcsr870UB/H4rF2Bwt1h0LLOSFyVHI3j9CIPr12/zI1LSIztFRR1xn
	HZUiYHA2Ie7IdBOT0EWbJEZfCJ8NEfU8=
X-Google-Smtp-Source: AGHT+IHrvc9iLpq88k/Zf2/yoLib+v2N+khBqKsA2oA+V+eLxVmijCZXO8s6yPfX0FiHRvQikyL7AZmaklD7LlHAvYs=
X-Received: by 2002:a17:903:196b:b0:273:495d:53ab with SMTP id
 d9443c01a7336-27ed4a4bb29mr29165935ad.46.1758789164533; Thu, 25 Sep 2025
 01:32:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-6-3fdbc4b9e1b1@oss.qualcomm.com> <CAJKOXPcbJY4JEjfZLvOAXEWCTYFpe7En+Riis2t3K5fWJgNU5A@mail.gmail.com>
 <53d63dd6-a022-4e80-a317-3218976a7474@oss.qualcomm.com>
In-Reply-To: <53d63dd6-a022-4e80-a317-3218976a7474@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 25 Sep 2025 17:32:31 +0900
X-Gmail-Original-Message-ID: <CAJKOXPfGC=FK7AKOtmmSV7=3NNXAHe8A_PGjjhTKgRs4Jk25xA@mail.gmail.com>
X-Gm-Features: AS18NWA0tiWyortDfCg8UAI-zrEfvMwzuEt9g3SfxjzbYCGEe5OINQIMsodub3k
Message-ID: <CAJKOXPfGC=FK7AKOtmmSV7=3NNXAHe8A_PGjjhTKgRs4Jk25xA@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Sept 2025 at 16:39, Aiqun(Maria) Yu
<aiqun.yu@oss.qualcomm.com> wrote:
>
> On 9/25/2025 9:50 AM, Krzysztof Koz=C5=82owski wrote:
> > On Thu, 25 Sept 2025 at 09:17, Jingyi Wang <jingyi.wang@oss.qualcomm.co=
m> wrote:
> >>
> >> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> >>
> >> Add the base USB devicetree definitions for Kaanapali platform. The ov=
erall
> >> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> >> (rev. v8) and M31 eUSB2 PHY.
> >>
> >> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 155 +++++++++++++++++++++++=
+++++++++
> >>  1 file changed, 155 insertions(+)
> >>
> >
> >
> > Second try, without HTML:
> >
> > I really don't understand why you created such huge patchset. Year
> > ago, two years ago, we were discussing it already and explained that's
> > just inflating the patchset without reason.
> >
> > New Soc is one logical change. Maybe two. Not 18!
>
> It was previously squashed into the base soc dtsi patch and mark like:
> Written with help from Jyothi Kumar Seerapu(added bus), Ronak Raheja
> (added USB), Manish Pandey(added SDHCI), Gaurav Kashyap(added crypto),
> Manaf Meethalavalappu Pallikunhi(added tsens), Qiang Yu(added PCIE) and
> Jinlong Mao(added coresight).
>
> While it is over 4000+ lines when we squash it together.

That's why you send one node per patch? Multiple huge patch bombs land
the same time from Qualcomm, with patches adding one node. It's like
the "no more patch bombs" discussion and rule never existed (yeah, I
know it was removed but the spirit of keeping maintainers mailboxes
sane remains).


> Also as offline reviewed with Bjorn, he suggested us to split out the
> USB and other parts.
>
> >
> > Not one patch per node or feature.
> >
> > This hides big picture, makes difficult to review everything,
> > difficult to test. Your patch count for LWN stats doesn't matter to
> > us.
>
> With the current splitting, the different author as each co-developer
> can get the meaningful LWN stats.>

We don't care about your LWN stats.

Sending stuff like this for your stats, means that community and
reviewers pay with their time.

This is really just selfish. No care how maintainers need to scroll
through their mailboxes.

> > NAK and I'm really disappointed I have to repeat the same review .
> Currently, there are 10 SoC DTSI patches sent, structured as follows:

Why did you ignore all the feedback from 2024 and 2023? Every year it
has to be repeated?

>
> SoC initial
> Base MTP board
> SoC PCIe0
> SoC SDC2
> SoC USB
> SoC remoteproc
> SoC SPMI bus, TSENS, RNG, QCrypto, and Coresight
> SoC additional features
> SoC audio
> SoC CAMSS
> SoC video
>
> Which parts would you prefer to squash into pls?

I made very clear statements year and two years ago. We also discussed
it on IRC multiple times. Can you join discussions instead of ignoring
them?

>
> --
> Thx and BRs,
> Aiqun(Maria) Yu

