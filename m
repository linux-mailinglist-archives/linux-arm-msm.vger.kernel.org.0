Return-Path: <linux-arm-msm+bounces-75148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92699B9FF3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 16:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F19503848C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 14:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406582D1913;
	Thu, 25 Sep 2025 14:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqbGpmIa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A43B2D0C9F
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758809583; cv=none; b=W5UUF6Yd5wXuBfJ/gALsbENHcVsr/Uk6JHax8OvGAmbQuE+AUvqVyK6V4wh2pipO8DrB651LFAMto/qibTGTaoYq0hkPvUviylOLQh9MwPa5xHhHVKI4F3Wj54hqTFQQ8NJDJSzo7Rg5SNC3xwTugt4z4pFZwn19poxpF4aVlQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758809583; c=relaxed/simple;
	bh=SbXoEDQ7WLR3dmdmv7fgmJJsFDthJfzEwnz1VFkMwCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rizHd3d+T8R0WUg+FgRjkz8SrXcnHC8jeEdFTNZ0FXwWMZY49rZeSVmdEIQNANkkFo/48xyOUy4bizg7u5GrCbIR1HVdAQXNqwHCAlpVsWb4HMmRY75ls+g4TavjOWPesm2msDWjkngt4I2yDiWEhciv6ZXM5wMBrvmQYmDvEBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqbGpmIa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA4C2C4CEF5
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758809582;
	bh=SbXoEDQ7WLR3dmdmv7fgmJJsFDthJfzEwnz1VFkMwCg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fqbGpmIaiygu1Jh7D94/ZLiLppHo15nCdQCAzbMoT9HMXFPOTlwmTHCkX57O30Kxe
	 0jEu1RulZpEtPjW+8+hSPnirTmNu+w9Lvq+lhzB/YZoXk9b/XqrvBwJ9HkR0GQTbbh
	 plD3WtyZUGdPMRDZZp8NyA1yUDKQonR4dX3LJL4/wcQWhq2sSlBIhFKVgEk03fos8K
	 rc2G0EqOhe7aPMNMNNbhQmImLT4mKHAEXjGjcCLLk/hgPrUcBcvPbSEBhpPnTRrfb6
	 7Ye5WFb3QSMukYl2XCtuYveVqBubaQFsm37U50zz1z5k69akX3pFuKo7S8AJeztmUo
	 UGNJMgz9oFJUA==
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2570bf6058aso14671795ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:13:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUCUNvpKew1WXud+4Ik1xjo67Clnaojqxf+C33LOFnIQq3/i90McD/gk3+8WVAYfS147QzdX/ssGHM2ej5@vger.kernel.org
X-Gm-Message-State: AOJu0YyueTQgiG9vL7I22eYConLvaEXR0EGkC/14NQCh8IcIfUCG7yco
	hxvTnDEez+C2JVQ6I4dZu8PwJMR3GRK5XntiJvk/l6UmLyUWKgt3r650sEvt/w6OHA3U/DIoblr
	C42qo8ElT7G4raIyPLma1xKXzZOHwzjg=
X-Google-Smtp-Source: AGHT+IGcMOQgtwcOqFCwjqZh00GTdD82XtGmDHMOs4TXAHw1QObB4CgtHu/ewEzkYQ3M77/ioIJDxofMCIBmnaviPtQ=
X-Received: by 2002:a17:902:d4c5:b0:261:1abb:e302 with SMTP id
 d9443c01a7336-27ed49d2955mr45354495ad.14.1758809582159; Thu, 25 Sep 2025
 07:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-6-3fdbc4b9e1b1@oss.qualcomm.com> <CAJKOXPcbJY4JEjfZLvOAXEWCTYFpe7En+Riis2t3K5fWJgNU5A@mail.gmail.com>
 <3up4xqgd2ay3tex4ckzgews3ukyrdikcmgk7tbddggj3s5gt4d@foqcpnfptjk7>
In-Reply-To: <3up4xqgd2ay3tex4ckzgews3ukyrdikcmgk7tbddggj3s5gt4d@foqcpnfptjk7>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 25 Sep 2025 23:12:50 +0900
X-Gmail-Original-Message-ID: <CAJKOXPdB+MS964FViEjh1xQL2kGkBgddfkq7zULiYK5GG2scwQ@mail.gmail.com>
X-Gm-Features: AS18NWB_acSGELeDRDxwgDFftNK0X5mLSzjOk3Qx77tKu5x0o9zGrSDmMDj9UGA
Message-ID: <CAJKOXPdB+MS964FViEjh1xQL2kGkBgddfkq7zULiYK5GG2scwQ@mail.gmail.com>
Subject: Re: [PATCH 06/20] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: Bjorn Andersson <andersson@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Sept 2025 at 22:57, Bjorn Andersson <andersson@kernel.org> wrote=
:
>
> On Thu, Sep 25, 2025 at 10:50:10AM +0900, Krzysztof Koz=C5=82owski wrote:
> > On Thu, 25 Sept 2025 at 09:17, Jingyi Wang <jingyi.wang@oss.qualcomm.co=
m> wrote:
> > >
> > > From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > >
> > > Add the base USB devicetree definitions for Kaanapali platform. The o=
verall
> > > chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PH=
Y
> > > (rev. v8) and M31 eUSB2 PHY.
> > >
> > > Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 155 ++++++++++++++++++++++=
++++++++++
> > >  1 file changed, 155 insertions(+)
> > >
> >
> >
> > Second try, without HTML:
> >
> > I really don't understand why you created such huge patchset.
>
> Because I looked at the logical changes that went into the big squash
> that was initially planned, and requested that some of those was kept
> intact - because they where independent logical changes.

Ack

>
> > Year
> > ago, two years ago, we were discussing it already and explained that's
> > just inflating the patchset without reason.
> >
>
> We used to add things node by node and that was indeed not
> comprehensible. Overall this adds features in large logical chunks, but
> there are a few of the patches that could have been squashed.

This patch adds three device nodes.

Other patches add one node. Some other remove the lines which were
added before!

The last argument is the most important. I don't say anything new...
If you add code, which you immediately remove, you do it wrong.

>
> > New Soc is one logical change. Maybe two. Not 18!
>
> I can see your argument for one patch to introduce the soc. But two
> doesn't make sense, because that incremental patch is going to be the
> kitchen sink.

Ack. Plus argument of actual patch line count
So maybe two SoC patches? Maybe three?

>
> >
> > Not one patch per node or feature.
> >
>
> Definitely agree that we don't want one patch for every tiny block!
>
> > This hides big picture, makes difficult to review everything,
> > difficult to test.
>
> The big picture is already obscured due to the size of the content
> added.

Not happy about this either, but understand the principle and business
choices, thus I don't comment on that.

>
> Comparing to previous targets, I see the baseline content in 2-3
> patches, and the remainder of the series being things that usually has
> been scattered in many more small changes in the following weeks or
> months.
>
> There's plenty of features in this series that are yet to be concluded
> for SM8750.
>
> > Your patch count for LWN stats doesn't matter to
> > us.
>
> I agree with this. That's why the QRD is 1 patch, and MTP is 4 (this I
> think should be squashed to 2) - compared to 13 patches for across the
> pair for SM8750 with less scope.

Ack, plus reorganize patches which are removing code added in previous patc=
h.

>
> >
> > NAK and I'm really disappointed I have to repeat the same review .
>
> I'm not sure what you're disappointed in, this initial series is larger
> than any we've seen before. I really like the work Jingyi has done here,
> aggregating the otherwise scattered patches into one series.

Disappointing is only that I had this exactly talk with Qualcomm two
years ago and year ago and 2 months ago (QCS), and maybe more...

I'm sure that we had a internal meeting about Glymur and I said the
same. I emphasized this issue. Look at Glymur DTS - did my internal
emphasizing succeed?

No. I can speak on mailing lists every year, I can have internal
meeting(s) and it doesn't work.

Plus the timing of merge window with these two huge patch bombs is
just cherry on top.

