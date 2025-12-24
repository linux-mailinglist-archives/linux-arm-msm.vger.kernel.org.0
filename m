Return-Path: <linux-arm-msm+bounces-86572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A65FCDC2CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 13:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98B1C3026B94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 12:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A802F6903;
	Wed, 24 Dec 2025 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=veygax.dev header.i=@veygax.dev header.b="FWTsFneU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C180249E5
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 12:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766578065; cv=none; b=n1y6GM41e69AzlsR6cFUUS3oB8PEbSVa1OCCq9k9nojpYGoOvAuXGrZddbNgYWT7Gb4ua+j84UMCxpwYDq80lnXxAdIr0wcNSR6km1JfgTJ8Df6WZYfgc73raoxLOgBFdDhyZE6Msf14pLR8awVMxKPD1rmukNTSyQXzAZ1uRX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766578065; c=relaxed/simple;
	bh=u11tm5fXuqSTgUw3ZLkQSJnfK/d7A/tilMzruSHpnV0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t4kqvt8vNyK0EM5Q7Pzm6JYWe/qZuw2rEz9dpUjOjSSDYo6s5imUJxj+wffO7mwEHwSG7GxkG5Acdg59mmQhDLMH3V3c0Rpaxj/gdJUpmCA4gguuS7iXc5EO3walazu2or+x69QCvfd8BhQjUIT9WSjq3xUwKl3kTeOvdQMXo1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=veygax.dev; spf=pass smtp.mailfrom=veygax.dev; dkim=pass (2048-bit key) header.d=veygax.dev header.i=@veygax.dev header.b=FWTsFneU; arc=none smtp.client-ip=109.224.244.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=veygax.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=veygax.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veygax.dev;
	s=protonmail; t=1766578054; x=1766837254;
	bh=sWwI4o499TZh/aJYoMPPUZGIMI7Kvm3jNl6akq2JPVw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FWTsFneUrpMVCl8GFx0t8en+MdWeHNDV1YZiNI6OT0pHvGCiVQuGCN4aZkp/NTFfy
	 KrAEKikwa+AVl15t39A4kS3qfdfYdvV8AsllDQce2LO/ZxW8mBfOYAK/xO17vdzPRI
	 c0AJSBjqui2Y5/AUzQgil8L8ZwYOCumfyfuHgBE2kgKoDi3MX6lwYuFlrbubcVDvde
	 U3VNNnimlOWq12fWsQnPuf3FBcE8+1sfMrtzu+MUz4qAIFhcgbl/l76pbOxsD7cI/q
	 //PW+ZAThG4rHQGwgphUAnD1PDydLMACpszPI37fWyHdG1E52B1ZjCD13oRxF8VNOO
	 T21byZWcI1hwg==
Date: Wed, 24 Dec 2025 12:07:29 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, robin.clark@oss.qualcomm.com, lumag@kernel.org
From: veygax <veyga@veygax.dev>
Cc: abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Replace unsafe snprintf usage with scnprintf
Message-ID: <a5b8cf57-8697-49ba-b225-ec735bb4e337@veygax.dev>
In-Reply-To: <176656845704.3796981.11008925293580480750.b4-ty@oss.qualcomm.com>
References: <20251130012834.142585-2-veyga@veygax.dev> <176656845704.3796981.11008925293580480750.b4-ty@oss.qualcomm.com>
Feedback-ID: 160365411:user:proton
X-Pm-Message-ID: 3ad0eae39b17dc513940a2b0790d259d64335f94
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 24/12/2025 09:27, Dmitry Baryshkov wrote:
> [1/1] drm/msm: Replace unsafe snprintf usage with scnprintf
>       https://gitlab.freedesktop.org/lumag/msm/-/commit/093cbd754382

Hi Dmitry,

Apologies but I've just noticed that I signed-off with my screen name
instead of my real name. Would you like me to submit a patch V2 fixing this=
?

--=20
- Evan Lambert / veygax



