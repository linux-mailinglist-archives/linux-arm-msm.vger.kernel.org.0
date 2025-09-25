Return-Path: <linux-arm-msm+bounces-75203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD20BA18A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1BFA169500
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7D3286D70;
	Thu, 25 Sep 2025 21:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmmMuQl1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B39CA6F;
	Thu, 25 Sep 2025 21:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758835912; cv=none; b=ZLPd7JMEzwtpwkt0oQy/YUUZbV0XD2hHTLg+RgjI93sIETrbyS2C5sdIsR8CItcTEfn+c8Bdk30oJV8cm/elN595IdD8OIdcKLYbb4Cwo+DxUh9DywxTriM5DdMOHugg/j/ywdfnXZfDHzchFS26P+D9pU+l5ecfstEYEum0D2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758835912; c=relaxed/simple;
	bh=2rdE884ixAkfLh4eDjI+jatwgporJLTY5lqZ7Hh2KGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYznGUFAgQsJZiHcJqSdfXBVJBDdBk8FhFA/Y4JCw5tpRC8id1wQJsn8vZOQyXhGl+v4pNiqT9aD8IHveitP3e4ArZgwGjS1OF1/wkinj51ue8oUJBu0OlLM917PEXtMjc7OhMXydjVGmbdEPbGkYcjyImFZn2dlebI5TcctGKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmmMuQl1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E092EC4CEF0;
	Thu, 25 Sep 2025 21:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758835912;
	bh=2rdE884ixAkfLh4eDjI+jatwgporJLTY5lqZ7Hh2KGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fmmMuQl1nSZpZUZE2/hqygssvGmLUSYK1XgihiOlfrR+TGt6BIZ+9GtdeJ+Q+YgtH
	 7+Hfq12TSUL3cg+6LK644mP5ANAp58L3qxCq/3DY6PaGsm4budf5beDbv2OmtbdgbW
	 RaS6+Eu6z2JuwN0M+oHsTQrgcqm6nsB6C3TmEmkRjh1bO3qNoRsL+oWkCkCOHOlw3p
	 UCmQVxXKwFhHBAFqaXCjs6H+esr/8kp5g22HeADv463ZZ0v7947G4rKZnhBE7ZyXF7
	 ena2q25wzk40UNjY/L09f5e62klBzKJ5ZiMVtYuvDKSqoZE/UVparFNcAx8GhBarje
	 JhyxIszQ6nQ3w==
Date: Thu, 25 Sep 2025 16:31:51 -0500
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski.k@gmail.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Subject: Re: [PATCH 06/20] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
Message-ID: <20250925213151.GA2455023-robh@kernel.org>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-6-3fdbc4b9e1b1@oss.qualcomm.com>
 <CAJKOXPcbJY4JEjfZLvOAXEWCTYFpe7En+Riis2t3K5fWJgNU5A@mail.gmail.com>
 <3up4xqgd2ay3tex4ckzgews3ukyrdikcmgk7tbddggj3s5gt4d@foqcpnfptjk7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3up4xqgd2ay3tex4ckzgews3ukyrdikcmgk7tbddggj3s5gt4d@foqcpnfptjk7>

On Thu, Sep 25, 2025 at 08:57:56AM -0500, Bjorn Andersson wrote:
> On Thu, Sep 25, 2025 at 10:50:10AM +0900, Krzysztof Kozłowski wrote:
> > On Thu, 25 Sept 2025 at 09:17, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
> > >
> > > From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > >
> > > Add the base USB devicetree definitions for Kaanapali platform. The overall
> > > chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> > > (rev. v8) and M31 eUSB2 PHY.
> > >
> > > Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 155 ++++++++++++++++++++++++++++++++
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
> 
> > Year
> > ago, two years ago, we were discussing it already and explained that's
> > just inflating the patchset without reason.
> > 
> 
> We used to add things node by node and that was indeed not
> comprehensible. Overall this adds features in large logical chunks, but
> there are a few of the patches that could have been squashed.
> 
> > New Soc is one logical change. Maybe two. Not 18!
> 
> I can see your argument for one patch to introduce the soc. But two
> doesn't make sense, because that incremental patch is going to be the
> kitchen sink.
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
> 
> > 
> > NAK and I'm really disappointed I have to repeat the same review .
> 
> I'm not sure what you're disappointed in, this initial series is larger
> than any we've seen before. I really like the work Jingyi has done here,
> aggregating the otherwise scattered patches into one series.

The QCom folks can review all this first because I don't care to review 
the 50+ binding (just bindings!) patches sent all at once right before 
the merge window.

One comment on commit messages though. Please explain how the h/w block 
is or isn't compatible with some existing platforms. Many just state the 
obvious "add a compatible" or such. I've yet to find what kaanapali is 
in relation to any other QCom chip. It may be the next SoC for the smart 
toaster market for all I know.

Rob

