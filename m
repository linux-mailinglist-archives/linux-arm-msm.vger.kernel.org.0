Return-Path: <linux-arm-msm+bounces-30352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 034D696735F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 23:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A88891F220CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 21:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5FE17B401;
	Sat, 31 Aug 2024 21:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kuruczgy.com header.i=@kuruczgy.com header.b="Epo4RKkb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C91416EC1B
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Aug 2024 21:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725141058; cv=none; b=BsmRT8gtp11gL+iCx1gM5o/X+HxPKJau3XVJItwubibr/bZ9DDuwcEMK6eIrSFCn85Jrv1VA7QylMssFLoFNplXMdVoozLHbVN1zt5n0osoQb44rYyG4qjwa0ofPx265InSmlNwRb5WjsvpniGYwcD09rfUHDaE+jhdhu8wYEk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725141058; c=relaxed/simple;
	bh=3wGrMnM2vclQhrcQmwGiVliT+rHB6JAHjVx5LHqeLCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBIdJqJW6LfEMIJy3nBm4aAtMNpjhBDHJUFD8p81v/XhO2pftOYCQPZWxJtjhJFchFFAu0CUDNuTrZPwoHaf7MM5UkUZ9OaRrJRFN2xXImZiESSDpbrYubYRUMt1Pq5u439/iQOCAUTfYm+4lrRzfxXburYGRpAZofRpcY+FuXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kuruczgy.com; spf=pass smtp.mailfrom=kuruczgy.com; dkim=pass (1024-bit key) header.d=kuruczgy.com header.i=@kuruczgy.com header.b=Epo4RKkb; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kuruczgy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuruczgy.com
Message-ID: <1f6676ae-62bf-40e1-b93c-463fa7d04cef@kuruczgy.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuruczgy.com;
	s=default; t=1725141053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oTTxbm5FRKBWZJPjYUBnkFj2GnM7Zwi1RSotZuqKSv0=;
	b=Epo4RKkbvgj0Pu3nc0WR0rnBMIqrltiBcOrQH60nPt+RmBRL4pTlEiqvDdGCqzQHLaQphA
	GxHcqdRBReY4Aby9hey2tRCLxkBRnlBjht5nKuPUJHYsGx3htSfPomMuRmcijkhmf5e5VH
	LA00B8U2KZCkpHSIrjeY0l+AmXfD9pU=
Date: Sat, 31 Aug 2024 23:50:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [v2,1/2] drm/msm/dpu1: don't choke on disabling the writeback
 connector
To: Leonard Lausen <leonard@lausen.nl>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org
References: <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
 <b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com>
 <0b2286bf-42fc-45dc-a4e0-89f85e97b189@lausen.nl>
 <56bf547a-08a5-4a08-87a9-c65f94416ef3@kuruczgy.com>
 <9d359542-bd16-4aba-88a8-0bdea1c1de44@lausen.nl>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>
In-Reply-To: <9d359542-bd16-4aba-88a8-0bdea1c1de44@lausen.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Dear Leonard,

I installed KDE. First, I ran it with the my regular kernel without this 
patch. The first interesting thing I notice is that the screen *does* 
come back after resume. (The error messages are still present though.)

> Ack. Do you mean that Rob Clark also uses Yoga Slim 7x but does not face the "screen never comes back (always have to switch VT back-and-forth to bring it back)" issue?

Yes, at least that's what I gathered from our conversations on IRC. But 
with the above in mind, I now suspect that this comes down to desktop 
environment differences.

> It would be great if you can validate whether this patch breaks CRTC state (which includes the CTM state) on Yoga Slim 7x, or whether that is specific to the trogdor lazor (Chromebook Acer Spin 513), though it may require you to install KDE.

Well "Night Light" seems to be even more broken under KDE. I went into 
System Settings, set it to "Always on night light", and tried to adjust 
the temperature slider. While adjusting the slider, the screen goes 
black, and only comes back after a few seconds. The color temperature 
does not change, no matter what I change the slider to. Afterwards I 
tried with this patch as well, but it produces the exact same behavior.

Best regards,
György

