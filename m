Return-Path: <linux-arm-msm+bounces-73625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90458B58C51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 05:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BA5F16AC0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 03:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BC324C076;
	Tue, 16 Sep 2025 03:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNfbdMtP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207DC1C5F23;
	Tue, 16 Sep 2025 03:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757993194; cv=none; b=jYiLL1qOdqsLxuZOraYFWd5A0Vxs5uMnuX621JzMG9n7uuIjFbN1ME7tIb9/8w/YSQ7MvpLgPtALuEhGzcXCr5gBf5Z2fDGQKtBsHm53IroKfRl2L1kagw/6VB5abEQzRlOQYK5bhwiGn6kWKDa1x+VRyXcx56LbsAwlJRTizfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757993194; c=relaxed/simple;
	bh=unH+YFOQ0pD1jPcayEQlvD+bfPTrAe9Uh8+AJ5yu9L4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0r2R5KUDNYjV9x3lnoqQT/QFZPeUOrH+MD+0ZApq8Ku7Sv4bDHjUzZg4YdNWiJOLsepfs2SbTcnV8HqNIqq9CuoTeECdA7r5IDcHpoeFduOGSkv+cksLrSXHUhMdqDk2aGoiA8N/UDhjutZxJt2Q22Hw0NwZPj7LGJ7s19/rCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNfbdMtP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED409C4CEEB;
	Tue, 16 Sep 2025 03:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757993193;
	bh=unH+YFOQ0pD1jPcayEQlvD+bfPTrAe9Uh8+AJ5yu9L4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JNfbdMtP+E2Tly5vFhD9niRfjVECjxx3j4iduiyLeiL9P0yROsMhX38W4O1oRkJaH
	 8G7MiKdteB1/BEbTa7ODG+eTfnz6PAaF5axn0YXTjJoV7sHn6K9Q0unJW7qZb88UwV
	 r0ADEA5ODtq+9TQtrsRUq0BBn/+z8+oivNruGODXLbaZHd6T25zVAUyyU/th0FfgDY
	 WG+pDKxuJfkFWv/VSz8fzxWx6y3xi48GH+7OlwkdRZ5eZ+CexAGFNTzdP/c3x2D9UT
	 ZkVkE/AgtuNd/xGzToYacgSMkFDghwiHErIW15rejWLu3QqnNHbi1UKu7yfX33IuQr
	 uPFZ89oquEp1A==
Date: Mon, 15 Sep 2025 22:26:30 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: qcm6490: Introduce Particle Tachyon
Message-ID: <4gx66y2oncjppqjhap5q2fmwlgkhv74rupeo4iwbyqw6ipoddn@fpp56byglnwe>
References: <20250910-tachyon-v1-0-5090bfd133e0@oss.qualcomm.com>
 <2tnzsjw3xy5jct4bcmahcwhjbzlmyxgcx6fzlz5qrzxume2uoy@phpcz6mnydlt>
 <nweaxuma3dkhzcc46ztfhmxxrchgidxjprc2tz5eahle6sxsuy@qvczmexs4qnn>
 <2bc767td7gw4bxts4k4xwhdiv5tgxmpyjwwv6nqeatvncdov6c@u7gfilzxgomp>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bc767td7gw4bxts4k4xwhdiv5tgxmpyjwwv6nqeatvncdov6c@u7gfilzxgomp>

On Fri, Sep 12, 2025 at 04:22:18AM +0300, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 02:19:39PM -0500, Bjorn Andersson wrote:
> > On Thu, Sep 11, 2025 at 03:01:35AM +0300, Dmitry Baryshkov wrote:
> > > On Wed, Sep 10, 2025 at 06:05:36PM -0500, Bjorn Andersson wrote:
> > > > Introduce the Particle Tachyon board (https://www.particle.io/tachyon/),
> > > > a single board compute with 5G connectivity and AI accelerator.
> > > > 
> > > > The boards currently ships with the Android Boot Loader, but replacing
> > > > this with abl2esp allows writing a EFI System Parition and OS partitions
> > > > to all of LUN0, and a more UEFI boot experience. A prebuilt version of
> > > > abl2esp is provided at [1], as abl2esp-v6.elf.
> > > > 
> > > > With a (very) recent version of QDL, a flash programmer from a Tachyon
> > > > software release, and a full distro image, this can be achieved with:
> > > > 
> > > >   qdl prog_firehose_ddr.elf write abl_a abl2esp-v6.elf write abl_b abl2esp-v6.elf write 0 image.raw
> > > > 
> > > > The following firmware files are currently used, on top of what's in
> > > > linux-firmware already:
> > > >   qcom/qcm6490/particle/tachyon/a660_zap.mbn
> > > >   qcom/qcm6490/particle/tachyon/adsp.mbn
> > > >   qcom/qcm6490/particle/tachyon/cdsp.mbn
> > > >   qcom/qcm6490/particle/tachyon/ipa_fws.mbn
> > > >   qcom/qcm6490/particle/tachyon/modem.mbn
> > > 
> > > Is it locked?
> > 
> > It doesn't look that way.
> 
> Then anything preventing us from using the default, non-signed FW?
> 

Looking at the version, they are not from the same branch or year.

I suggest that we stick with the firmware that the vendor has validated
on their piece of hardware together with the other pieces of firmware,
at least for now.

Once/if we built confidence in the QLI firmware, we can replace these
paths.

Regards,
Bjorn

> > 
> > > Would it be possible to Particle-signed firmware into linux-firmware?
> > 
> > That is something that would have to be discussed...
> 
> It would be really nice...
> 
> -- 
> With best wishes
> Dmitry

