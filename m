Return-Path: <linux-arm-msm+bounces-36928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCE09BB3E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 12:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52A331F21D19
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EEE51B0F2C;
	Mon,  4 Nov 2024 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYEf8Zax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A304430;
	Mon,  4 Nov 2024 11:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730721159; cv=none; b=ubIGZqNsEPi+De4NNyA667iyfQMrD4vRBSTjqQMPXaQxTwlU3VRil3FOG33bn7km7s4f0ovgd8EIKJ+ji6FPQ9UaaIy6yl4E5QMj/liXz4VXPHjF31bqIgRjeMcEDTr0Mu3ZL7HiIpesAwZBAib5zBaeK7JxjawAx3DugDOyPPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730721159; c=relaxed/simple;
	bh=jrlWt5vVEgQhbvNsEfxgX8LzoJjDyTOI4FiZQj4aXNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OdNuLV/P2A/0Sve+IpObGv0JRunau4M12sWFl3H+gJukYez4qJ7NPqxGY/oOBZvUzACdCW8zeR6cum4bPd4cQnGN7++pmObHrjXbXo1V252EXBMsDSHIwleXodh7QtAwGEyKiPFdV8EIL792oEq0p/zKH3g6759C7ELhk/mpyeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYEf8Zax; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F13C4AF09;
	Mon,  4 Nov 2024 11:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730721158;
	bh=jrlWt5vVEgQhbvNsEfxgX8LzoJjDyTOI4FiZQj4aXNk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JYEf8ZaxDA3521GMC8+lsy2VXaVGTqZhAX+zb1BHjJw/uP87jDcMu6FsbntrY8nRX
	 Hh0k4Umq2uJ0rUpt/kWc7F/aGSIJjQt813PhimAZ/+qayDAONP/MVdae+nBXUG9UCq
	 t0SUsJGmKPVLC2THvhyZGaGUcMmHVvLLe/nM6ugJ/e9ocOkndyK018llbxPtCn42RX
	 PkJj0N8kSFnT8fgQweftGSG/egbdTKqKRcgqK7FgrP157LOKdixAdNd9x9LeI4dtMV
	 A+vayycmbsNz2wGH+gLNM2WG0jKYeieX/+phV4oNhr7r3w9BCH2gX75+S9iKF6UnmG
	 hADpGfE9UpwCQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539fb49c64aso5511809e87.0;
        Mon, 04 Nov 2024 03:52:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2tr7GNgU3cEW8VYAFX7tNRGFx91ol+ERNmikSvTVi+vAxMhmcbx+b1x1uuMX9u6NKDzrzq1h+2pgC8e6A@vger.kernel.org, AJvYcCW9rJ9kcuWdYnaV0tk+jJEG/tDDkwF6FcZLjWccjzyne+DElMwIVOSUCpROtX2c3VQtIduL/HtPTUZ7tjLN@vger.kernel.org
X-Gm-Message-State: AOJu0YwYnAxjFOu5rr530NM6pLbWtbl5w0J8vQkWH8VYBfMUGPkCy4EH
	Fth1GchM74E/JF7Ci34W0iBbgesDL6FrqKX+ixHHzgIBXwn7oU6oLZlGp/gCFvNNWBl7OS8AVhS
	nZ8aj2xKMcHYDa6chj8HNthe7tMY=
X-Google-Smtp-Source: AGHT+IHOLYnwFSb9KBpeoWpWkpPxWEFAYUIdVKIVNNpEmCe0aybibfjYsoY5R2GKKWfs4LrM9+oAoTYv4X5bZTldauU=
X-Received: by 2002:a05:6512:1295:b0:538:9e36:7b6a with SMTP id
 2adb3069b0e04-53d65df25a3mr8861824e87.32.1730721156964; Mon, 04 Nov 2024
 03:52:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org> <dk7dxsyunx47gvmlnarjkqx63en52hktdnzwyyeyhohts7rkjn@a6lx6sq46vb4>
In-Reply-To: <dk7dxsyunx47gvmlnarjkqx63en52hktdnzwyyeyhohts7rkjn@a6lx6sq46vb4>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 4 Nov 2024 12:52:25 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEPM+4B4xTThOejMZ5bLHcwzNYbW333ZZu1YFJGy5johg@mail.gmail.com>
Message-ID: <CAMj1kXEPM+4B4xTThOejMZ5bLHcwzNYbW333ZZu1YFJGy5johg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: implement cacheinfo support (for v7/v7m)
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

(cc Linus)

On Mon, 4 Nov 2024 at 12:51, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Oct 14, 2024 at 04:55:19PM +0300, Dmitry Baryshkov wrote:
> > Follow the ARM64 platform and implement simple cache information driver.
> > As it reads data from CTR (ARMv6+) and CLIDR (ARMv7+) registers, it is
> > limited to the ARMv7 / ARMv7M, providing simple fallback or just
> > returning -EOPNOTSUPP in case of older platforms.
> >
> > In theory we should be able to skip CLIDR reading and assume that Dcache
> > and Icache (or unified L1 cache) always exist if CTR is supported and
> > returns sensible value. However I think this better be handled by the
> > maintainers of corresponding platforms.
> >
> > Other than just providing information to the userspace, this patchset is
> > required in order to implement L2 cache driver (and in the end CPU
> > frequency scaling) on ARMv7-based Qualcomm devices.
>
> Sudeep, Ard, Arnd, Russell, I have been struggling to get reviews for
> this for several months. Is there a chance to hear anything? I'd really
> like to scratch this off my 'pending' list.
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - Handle cores like ARM1176, which have cpu_architecture() ==
> >   CPU_ARCH_ARMv7 (because of VMSAv7 implementation), but no CLIDR
> >   register (because they are ARMv6) (Arnd).
> > - Link to v1: https://lore.kernel.org/r/20231231-armv7-cacheinfo-v1-0-9e8d440b59d9@linaro.org
>
> --
> With best wishes
> Dmitry

