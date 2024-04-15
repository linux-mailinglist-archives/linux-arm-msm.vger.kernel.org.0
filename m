Return-Path: <linux-arm-msm+bounces-17414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A398A46AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 04:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 189E5B22154
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 02:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBEED29E;
	Mon, 15 Apr 2024 02:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lF+oduuh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB90C15EA6;
	Mon, 15 Apr 2024 02:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713146434; cv=none; b=O9e8OXDL3XJ+iLP+aBneWEYr3ZGTiK8gf03J/QmCQg91sMC1TmXLo12WcZXKGXV8DzL+ixcmm5w8AOXF/WdT3w+GvRvzaQb7gqe5/2VI/jpBJ907s+44pJ8bI4/pvcWcupALhzShzIQz2t0XBHMxbVtg76enkkzopkdA8GPVd9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713146434; c=relaxed/simple;
	bh=YNDzleZCu6hmbfP3uyTnrd57aj1IGli2gey+jPWy/T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBFSs9fmiJgrXin6FVmk6MY3OIFpfW5dtyA3eVdfe4g5Ch59Gwafc0d/xhVHXEGJBk+NiHaMmXWSkGC+8RE0xUnmRNrJVNXD+WT9t+iN+Wmu8TEqyTcBp5RjSzZodCJQ2opA4WTCzUCnXQ3LqRWdyJJtz23ct1vmsMASIpaTCQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lF+oduuh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74241C072AA;
	Mon, 15 Apr 2024 02:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713146434;
	bh=YNDzleZCu6hmbfP3uyTnrd57aj1IGli2gey+jPWy/T4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lF+oduuhMIPZasr77eCuYDcBMR7YBHfHKHPlEfwpgy3LxMOJBa7ghATgPZdpqe3W3
	 y1Ef1yWgkytzMpwiyHoEjFduRVSw5e+bTDKlqFHZb6foM1/M0BDS5i9/H6OYqJl6Wo
	 S1yJLrD69HiRgzYE67V8pJGefmjyvzV6lU3N+g7wthgtkZoximqgvunIqEiffZ8yUD
	 EoHu4tL4GMRB2T85sCreGzmZLwOSVdnYNRu408h8T5bohiQsoaR6btXwsZuDfKaY7e
	 6TpW7XyT6oWKVceY1MZM0XeKAg5TDcSOFwZ8rQLipG43Wnp8hNDWobHNHhdQo+ca1G
	 UJaER+yoqjBXQ==
Date: Sun, 14 Apr 2024 21:00:31 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Umang Chheda <quic_uchheda@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] arm64: dts: qcom: qcs6490-rb3gen2: enable PMIC
 Volume and Power buttons
Message-ID: <jlwxlnllpt557eiktovujcrfm2qwd3ynlxpo2v2witkekvocey@indbptcgvitm>
References: <20240403132839.2117675-1-quic_uchheda@quicinc.com>
 <6b3gqfrvljvlfaf365l55kjcbjd4rfmw223tro6rqy5crykxgb@l66dptcrujip>
 <3ca2f601-ce45-43cf-b0dd-e28865874455@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ca2f601-ce45-43cf-b0dd-e28865874455@quicinc.com>

On Fri, Apr 12, 2024 at 04:18:36PM +0530, Umang Chheda wrote:
> Hi Bjorn,
> 
> On 4/9/2024 8:47 PM, Bjorn Andersson wrote:
> > On Wed, Apr 03, 2024 at 06:58:39PM +0530, Umang Chheda wrote:
> >> The Volume Down & Power buttons are controlled by the PMIC via
> >> the PON hardware, and the Volume Up is connected to a PMIC gpio.
> >>
> >> Enable the necessary hardware and setup the GPIO state for the
> >> Volume Up gpio key.
> >>
> >> Signed-off-by: Umang Chheda <quic_uchheda@quicinc.com>
> >> ---
> > 
> > I suppose this isn't a "resend" either, so please send me a new version
> > of this as well.
> > 
> 
> I had earlier sent [1] for review, on which I hadn't received any review comments.
> 

I see.

If you want reviews on your patches, ask a colleague to invest a few
minutes in the patch and send a Reviewed-by or Tested-by. That both 

Not only will this give you reviews, it will show the community and the
maintainer that there's someone out there who's interested in seeing the
patch merged.

> Hence, I resent this patch again after 2 weeks for review.
> 

Please only resend patches if you strongly believe that necessary
recipients didn't receive the patch.

Regards,
Bjorn

