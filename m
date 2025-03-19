Return-Path: <linux-arm-msm+bounces-51909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC10A68789
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 10:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA4517A2B68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 09:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5E42517A7;
	Wed, 19 Mar 2025 09:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+++vtEm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62552116ED;
	Wed, 19 Mar 2025 09:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742375435; cv=none; b=CnKLUeq8T33m9+HhKeiTKA3O5BSEMinucTwGDrAAWAZtsQEYyJxZs4LI/eM3RcfL3n1eSG6TlunIam/XhtpG4lucJHO9hV7Ffnt5/NPm+f03MNNEhG9WwbxslF/jwLPvFSZSugrvbhM7nEpFbxGS5hnPiaX9YaDfzbvdThcAjGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742375435; c=relaxed/simple;
	bh=5A4dbLDyV/nTRWUH8Ca3qmdXR5GKU+r9taWr3MHSIYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmCFa5hLkJPB4gxjuhgv2WJoAlExNJ/HM/tVpYA+bfQywrrRxIdC7kxBj1aG2UV0fZ3ezbwqR4dIH5sawjpE3pIDNA6i3gKRpeIT6GojqCJnvVyYE1JzN/9XPkCXhzjJbpb94T00S8/7ZeRfHJY9Xs3E7SZD+HEy0hdfmIgEI1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+++vtEm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A2FC4CEE9;
	Wed, 19 Mar 2025 09:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742375435;
	bh=5A4dbLDyV/nTRWUH8Ca3qmdXR5GKU+r9taWr3MHSIYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+++vtEmBuPYGgUbdW1qWKiJKlcvRuuuD/MQozqvIyAvUKwV5jumG/klNi86i/nwH
	 GJQ8JYEG0P+fIVPC98fYuGmx3tcujYxE6a2FZZLOvP8zvh616R6MSF0ys2Dr2LGgB8
	 qQDOnu8VX4DtkRfvWNqk1lXCrqIlwI1fxVeh5YGYn93L8lpVEFoGPghSgESrwC26bF
	 K2LjNkO7WhTSgjB20TF1/bkAhsyCz6mAqSnKwbqHte0tVca/lDG8AJ2tDxWvNfGEFl
	 7QXIcGKAUWMeJtkQRWO++bqrwcCfe6HrgLCXo4ipxFsic2cCfWXHjOnySOF+isDfNz
	 UqspsmHjd/U2w==
Date: Wed, 19 Mar 2025 10:10:26 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, 
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, andersson@kernel.org, mturquette@baylibre.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, geert+renesas@glider.be, lumag@kernel.org, heiko@sntech.de, 
	biju.das.jz@bp.renesas.com, quic_tdas@quicinc.com, nfraprado@collabora.com, 
	elinor.montmasson@savoirfairelinux.com, ross.burton@arm.com, javier.carrasco@wolfvision.net, 
	ebiggers@google.com, quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, quic_varada@quicinc.com, 
	quic_srichara@quicinc.com
Subject: Re: [PATCH v12 4/6] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
Message-ID: <qf36kofpouii3m5bdihy5fizmsnnd7pzxltuhorynql57ivvey@uxplo7joejsd>
References: <20250313110359.242491-1-quic_mmanikan@quicinc.com>
 <20250313110359.242491-5-quic_mmanikan@quicinc.com>
 <65gl7d6qd55xrdm3as3pnqevpmakin3k4jzyocehq7wq7565jj@x35t2inlykop>
 <ef86ccad056bc03af7f01d5696787766.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef86ccad056bc03af7f01d5696787766.sboyd@kernel.org>

On Tue, Mar 18, 2025 at 03:50:31PM -0700, Stephen Boyd wrote:
> Quoting Marek Behún (2025-03-17 07:08:16)
> > On Thu, Mar 13, 2025 at 04:33:57PM +0530, Manikanta Mylavarapu wrote:
> > 
> > > +static struct clk_rcg2 nss_cc_clc_clk_src = {
> > > +     .cmd_rcgr = 0x28604,
> > > +     .mnd_width = 0,
> > > +     .hid_width = 5,
> > > +     .parent_map = nss_cc_parent_map_6,
> > > +     .freq_tbl = ftbl_nss_cc_clc_clk_src,
> > > +     .clkr.hw.init = &(const struct clk_init_data) {
> > > +             .name = "nss_cc_clc_clk_src",
> > > +             .parent_data = nss_cc_parent_data_6,
> > > +             .num_parents = ARRAY_SIZE(nss_cc_parent_data_6),
> > > +             .ops = &clk_rcg2_ops,
> > > +     },
> > > +};
> > 
> > This structure definition gets repeated many times in this driver,
> > with only slight changes. (This also happens in other qualcomm clock
> > drivers.)
> > 
> > Would it be possible to refactor it into a macro, to avoid the
> > insane code repetition?
> > 
> 
> We have this discussion every couple years or so. The short answer is
> no. The long answer is that it makes it harder to read because we don't
> know what argument to the macro corresponds to the struct members.
> 
> It could probably use the CLK_HW_INIT_PARENTS_DATA macro though.
> 
> static struct clk_rcg2 nss_cc_clc_clk_src = {
>      .cmd_rcgr = 0x28604,
>      .mnd_width = 0,
>      .hid_width = 5,
>      .parent_map = nss_cc_parent_map_6,
>      .freq_tbl = ftbl_nss_cc_clc_clk_src,
>      .clkr.hw.init = CLK_HW_INIT_PARENTS_DATA("nss_cc_clc_clk_src",
>                                               nss_cc_parent_data_6,
> 					      &clk_rcg2_ops, 0),
>      },
> };
> 
> but then we lose the const. Oh well.
> 
> The whole qcom clk driver probably needs an overhaul to just have
> descriptors that populate a bunch of clks that are allocated at probe
> time so that the memory footprint is smaller if you have multiple clk
> drivers loaded and so that we can probe the driver again without
> unloading the whole kernel module.

Okay then, in that case just ignore me :)

