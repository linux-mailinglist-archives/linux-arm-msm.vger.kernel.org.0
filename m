Return-Path: <linux-arm-msm+bounces-68546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9E8B2147B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 20:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A55437A4CA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D300D224891;
	Mon, 11 Aug 2025 18:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5LKXWwT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A980821C160;
	Mon, 11 Aug 2025 18:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754937123; cv=none; b=QBC5EASnWv6M5Tk7qgf+u8u8+XDfcflTImT2k4dfGT26LBTV51U/TDOcPDfgmUWPO8NmMSKPY7tApuBNNVtBNE0nLZLtW7YPmznmgxqyHaWznBJyJMNhxMG72m6DZ7RF+ZHTNY1yU5OXFPg0lW1SkGN0x34yT5+3AJ4ATjcyrZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754937123; c=relaxed/simple;
	bh=mP5Y9VhoNdvsaLseYwiMflA18xwULaoWsufwBLeppy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hON8IdgKpHyt0K7GBzbDZbzueb6qnpSUFnUWPJd4RAJb5VofsMMex/fkWBiXxwyAG+0sLtp2rClX+Al1Q9s8M1E9kY4kDppos6mSEBlFzX+b1e9AynvNdVo1MZuIh+A6iZI4aO+o1ZRm0MK8Vl8Qu/XZFaWd9P09eSGHTqgF6gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5LKXWwT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930E4C4CEED;
	Mon, 11 Aug 2025 18:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754937123;
	bh=mP5Y9VhoNdvsaLseYwiMflA18xwULaoWsufwBLeppy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I5LKXWwTme9/QqYLE6ohLftBUb3bC6YmaNPEzi1BIEPi7RZLuH1RHz/dSii67G5rl
	 grbT5YqSC5wDAj2J4kv8Iy5P2N78KjiYRQU8DFdT8EP++Tg88rCqP/uRT06S2U+bKt
	 G2hfxPD1s/Kp24JdwnpT1eM9uBVIprNoU4LVG6F1L6BYI46ksK5K2bmh10Guak5LsC
	 5rFwJLNtyUBAFxHCX65H5CxJU+cvrsMBZ0qqO8CHTvmCE4eZCn/WXh63njNXP1UgmS
	 XloQyODfagcdN5lfljeD3NrGltSADvlHpK47vaoFXTERDU+8eCGdQDK5kM+yMIG4HE
	 rugSWHEzqlz9A==
Date: Mon, 11 Aug 2025 13:32:00 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ubwc: Add missing UBWC config for SM7225
Message-ID: <xsrkh75xb6klntc4mc564iq4wipe6iaqjiugk2r743n2y2h5dt@s33t7fckn5gq>
References: <20250723-ubwc-sm7225-v1-1-d688caff70f1@fairphone.com>
 <blibzpqgbjbbwvnsx3cu3fzjxk776lamnmd4erokc5jx7qkubh@7da6ihmb6xxj>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <blibzpqgbjbbwvnsx3cu3fzjxk776lamnmd4erokc5jx7qkubh@7da6ihmb6xxj>

On Wed, Jul 23, 2025 at 10:03:15PM +0300, Dmitry Baryshkov wrote:
> On Wed, Jul 23, 2025 at 04:19:22PM +0200, Luca Weiss wrote:
> > SM7225 is a variation of SM6350, and also needs an entry in the table.
> > 
> > Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> > Note, due to other bugs on next-20250723 I couldn't fully test that
> > DPU/GPU are working, but this seems to be required in any case...
> > ---
> >  drivers/soc/qcom/ubwc_config.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

@Dmitry will you pick this as well through your tree, so we avoid (the
trivial) conflict.

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> 
> -- 
> With best wishes
> Dmitry

