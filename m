Return-Path: <linux-arm-msm+bounces-55021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC93A97C97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 04:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A66097AC6F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 02:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA4F2638A9;
	Wed, 23 Apr 2025 02:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DE9OgOV2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCCA10F9;
	Wed, 23 Apr 2025 02:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745374168; cv=none; b=uWdilxkEtxVrsUSfMbUOtfSCSE0Gzw5ffPeSVLyDvXdTdaal5VPqiyLRRWPh9u4btoi4n/Tle34ZzvLTrwae3IboBl1vHy+bIZ/9Til28b90EIYdDQjHEWY4QFsgExxYo3rjE7vp039Jzhf7BKPJuCW33Y57apujPJ6wVQQfNWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745374168; c=relaxed/simple;
	bh=UBnQaCV//yg967A/9uE6enHkyJdNZjfOvSrMoDjBkno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItkCA9z04Y9+ON/xgBbx2a7VQOJsnNJXuL0CQ5sT/z+zJtQWPkdZF5xbJZO45WBoSDQL9DNnOMaNm+dMQO25qFLfDSodjgPFLHGSCSp88/yartzy3ssovGufA6oaY/Zu/l4kxKGHPDphsIyMoN330Wvr+GCsmfh6zCAHpKTlrpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DE9OgOV2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9CEC4CEE9;
	Wed, 23 Apr 2025 02:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745374168;
	bh=UBnQaCV//yg967A/9uE6enHkyJdNZjfOvSrMoDjBkno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DE9OgOV2eH5NQkUpwEWGdMYVvqx9xfqi5Tr9Cto2AOon+pq7t8VfrjgaEUj5h20fN
	 pU994/5jvQPCjlSAtcJoZGsIbKVAYuyXFCICHw/IP/5kTcGKyLU5KT+VPQxQItjldu
	 3V6CYLu4UlnrnwipwWqa5sMXn56CkC/EJVi6l9ooKcFhfNHklhRdecAsk09NhaxvIV
	 xHPTuocr//cyraIB41TPTiSEIzOclWdv8CP7CsfZIIObReiz2U7/4hKTvJIK1/0Lak
	 sATF5jD5wimhvyFxuEnvovG0YFsjUwBk8UOrLft0UtPJdCWw8yoQg8uT/2OyqTchoJ
	 PtjmR1Uqqabyg==
Date: Tue, 22 Apr 2025 21:09:25 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ARM: dts: qcom: msm8974-oneplus-bacon: Add alias for
 mmc0
Message-ID: <uiocx75uir23fiaaun2etbafqwmstez4teoi566m35bdk4mui4@gjid3e5rbm7i>
References: <20250419-msm8974-mmc-alias-v1-0-82aa131224b6@lucaweiss.eu>
 <20250419-msm8974-mmc-alias-v1-1-82aa131224b6@lucaweiss.eu>
 <k7dm2tpw3mg34fydyug3rjnkwgfu2lwwzddd4edmano6jsgoiv@6klzba5rjpdy>
 <ea7ac010-3b9d-4915-9a19-cb5ebb77c764@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea7ac010-3b9d-4915-9a19-cb5ebb77c764@lucaweiss.eu>

On Sun, Apr 20, 2025 at 07:14:12PM +0200, Luca Weiss wrote:
> Hi Bjorn,
> 
> On 20-04-2025 7:05 p.m., Bjorn Andersson wrote:
> > On Sat, Apr 19, 2025 at 11:03:57AM +0200, Luca Weiss wrote:
> > > Add an alias for the internal storage so it always becomes mmcblk0.
> > > 
> > 
> > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > calls for a problem description to start your commit message. Sometimes
> > the problem is obvious, but here &sdhc_2 is disable on this board, so
> > when does this not become mmcblk0? What is the problem you're solving?
> 
> I have really seen internal storage become mmcblk1 on one of these devices
> with no SD card. I can't recall which one anymore, but this was the main
> idea why I wrote these patches. Maybe it's something to do with the mmc wifi
> on some of the boards?
> 
> But I think it's not a bad idea to make this explicit for all, and align the
> boards with each other.
> 

Thanks for clarifying. I have no concrete objections to the patch, but
from the commit message it's not clear if this patch solves a problem or
not. So, please incorporate your motivation in the commit message.

Thanks,
Bjorn

> Regards
> Luca
> 
> > 
> > Regards,
> > Bjorn
> > 
> > > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > > ---
> > >   arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
> > > index 4c8edadea0ac63db668dbd666fbb8d92e23232b7..88ff6535477bffefe475cc5fe927b3cc5d223084 100644
> > > --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
> > > +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
> > > @@ -13,6 +13,7 @@ / {
> > >   	qcom,board-id = <8 0>;
> > >   	aliases {
> > > +		mmc0 = &sdhc_1;
> > >   		serial0 = &blsp1_uart2;
> > >   	};
> > > 
> > > -- 
> > > 2.49.0
> > > 
> 

