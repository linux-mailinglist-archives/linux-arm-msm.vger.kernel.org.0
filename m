Return-Path: <linux-arm-msm+bounces-79906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D52BFC258D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 15:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 56A114F2793
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 14:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B82320380;
	Fri, 31 Oct 2025 14:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HMsl3vf7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA6C18626;
	Fri, 31 Oct 2025 14:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761920513; cv=none; b=l3DTbE09s9zvJix3mjlFHR72h/cgD/Xq3FlyQSah7SVs5jOabyrO6dGoSL1Jm30XOwWwAmHa8Qi0P+LmfjNN1FEMVeXJirIlCR9AorsljU/JmYge7iy9g57AnNAwOhTPb6IMicPJ5ANh69v26wYzB1H+DbBMTmhbz6ImNYRZPY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761920513; c=relaxed/simple;
	bh=HC0DE5hT5733A14iCFz7Atbo4IQ4lqqAvSwnLflL308=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHehJHvpFiu1NeiAXAW2r6fp8t9w8MgN0jn32vU1rmhDMjmnl73rn47kxmwKVUlLPb2OacNGl4ZQLK0y6wMPqpDqvuaAYm9r1D84C67+lKYCh1BCdMlMXsUfPexZln790TxKqLrxGrZu254qnI9fO9dVEPPw4tIvyrorUUEYl5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HMsl3vf7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F1BC4CEE7;
	Fri, 31 Oct 2025 14:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761920513;
	bh=HC0DE5hT5733A14iCFz7Atbo4IQ4lqqAvSwnLflL308=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HMsl3vf79NC7JSp6P07U/L1dmuyf3CO6ADs8mOnZDgVbjs/WkI4IbkvBZLj5n6ig/
	 U1kr+gMlpbAUnfudiMTgGVxMrJlObdS0HtRm++WW8SbqToqxvvIHZO4JQ++PzW/d0A
	 xlJKtYeLL72GKECECnhuKTpJCE0IBT1f2GNFbyyo=
Date: Fri, 31 Oct 2025 10:21:49 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 0/3] SDM630/660: Add missing MDSS reset
Message-ID: <20251031-pastel-precise-capuchin-6d8c8f@lemur>
References: <20251031-sdm660-mdss-reset-v1-0-14cb4e6836f2@postmarketos.org>
 <25579815-5727-41e8-a858-5cddcc2897b7@oss.qualcomm.com>
 <722a6cf2-7109-47e9-9957-cde5171d7053@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <722a6cf2-7109-47e9-9957-cde5171d7053@postmarketos.org>

On Fri, Oct 31, 2025 at 03:42:47PM +0300, Alexey Minnekhanov wrote:
> This is a result of me first time trying to use b4 and misconfiguration
> of git: user.email contained my email inside '<' and '>' which somehow
> caused the prep/send process to generate emails with broken half-empty
> "From:" field, containing only name and surname without email.

There is now a patch in master to handle this situation. Sorry about that.

> And then
> perhaps email server closer to your side decided to "fill the gaps" and
> append some non-existent web.codeaurora.org part? At least I don't have
> any better guess.

That's correct, that's the internal DNS name of one of our relays.

-K

