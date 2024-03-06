Return-Path: <linux-arm-msm+bounces-13427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0745873018
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 08:58:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C523B263ED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 07:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA895CDDF;
	Wed,  6 Mar 2024 07:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="yH/ZJ/LP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351AA5CDEB;
	Wed,  6 Mar 2024 07:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709711823; cv=none; b=oKKjWr3oA93Wu9zxg3rdZq22E2woqvYT/9TppPYnLOM/Hu96N4xqiJkm37pnDYMqqPOh83l3ZTWW+Dl5mgYvYkr2bkjOfJXHl0nVKs53BYtdYx6bp88dtd9aSVYXsN/lvP1MciheIoxVgE2s8Vq3/LgI+XN76xwQ5aJoB/6Wml4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709711823; c=relaxed/simple;
	bh=URL17ztwuUWJWCvFf0Mih9U+lXmtbksLU7rosB/nrU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=k2Eoo51OlxApqiej5QRTo55o8fE5RJajL9a00zjYprhpICMb/ylygXNu+PGOKIun0tHxXh8MDAKoShSCPuznOUT7o9XEdSYPkxWVN1nTtISrpGGnfIGtCcAdWggIeguc4KN1hWMlZIMTfamCGKmnfCeOH3CzN9sWCZ1n2BWPh08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=yH/ZJ/LP; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:Reply-To:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=v2Qokh0H4nQ8Uerb1M5MYDQB0W979+jRDY/Cb/gZBOc=; t=1709711821;
	x=1710143821; b=yH/ZJ/LPxwC4gJStq/2weq+QZcg2BGNK7eAH2LCc0j/mk7SJte/PQC+cn+zje
	pYMSnOeGs2ooV9+4i+gAUxgfURIh8bS3iBaZ2p2jSGVVftfRoKl0j+vqkk7LqTydhLculqOCY6xEy
	5Ghtd/XzDDrsy1d1EOFOu1q9ziXJAPQWPZYRNNhbaG7iGYAYGhwRs9fI+wdIiR6XwduluiYh7b7ql
	/hNVhgYVpu3y3GJoeMyTB5HmF2Hop7biOcPZ8FHBs2AcmnRsjhgT/rNY9xQ9UtMbaPyQ2xLaXHB1r
	XUb3QfDi+c7uZyNBWgAxY5LAPtfqmjG5r3vGUM38WFXfWzTYrA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rhm94-0004A4-HI; Wed, 06 Mar 2024 08:56:58 +0100
Message-ID: <4e55f6fd-8875-4a61-9070-f0ecad8082ea@leemhuis.info>
Date: Wed, 6 Mar 2024 08:56:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [pull] drm/msm: drm-msm-next-2024-02-29 for v6.9
Content-Language: en-US, de-DE
To: Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <CAF6AEGtCq=CObbqKNOswWZdPw5dL8jq8BxD_hxP7kOCePUwNrg@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <CAF6AEGtCq=CObbqKNOswWZdPw5dL8jq8BxD_hxP7kOCePUwNrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1709711821;06b6289e;
X-HE-SMSGID: 1rhm94-0004A4-HI

On 29.02.24 20:04, Rob Clark wrote:
> 
> This is the main pull for v6.9, description below.
> 
> [...]
>
> GPU:
> - fix sc7180 UBWC config

Why was that queued for 6.9? That is a fix for a 6.8 regression that for
untrained eyes like mine does not look overly dangerous (but of course I
might be wrong with that).

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

