Return-Path: <linux-arm-msm+bounces-28656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D314B9539B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44F94B22F75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 18:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD7F54656;
	Thu, 15 Aug 2024 18:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="WmGWoU/s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D8052F70;
	Thu, 15 Aug 2024 18:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723745584; cv=none; b=l/qtThE8dmYjtqON4Zu1RY9clInIW9DYnS5WlkW0UbEzVPDrIOD7MWuuQEhbdRFmrvyz5bZH/u0ykMduRB6QHx4FY1+Ht5eo90EMlKaQ6smOvq+3Txh6tp5k53cY4gkryKmBTNYJFXc25NdNU6wBNIHUjVEc96v1WCaZ0RRUyVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723745584; c=relaxed/simple;
	bh=QLpkNJNzoaAHnbBQ4AWeZQvG502e3lojYe6fHsgjlHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHudUSyOM/jbJOhCFRWXY0CcXTNkgoLmHEgVQjV78+aU1TO9cFCO5tYJuEHg87e9DPrQsZen637g9BDIqU8nqENYR2gcb+3FMHWyJ8r3hhknLQWv2l/DUYyunypOpg5vYfEVdEp020ZEOzvcdWp5PyJ8ghQcloYIhXzIHSDoCcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=WmGWoU/s; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4WlCsV1wDwz6ClY8q;
	Thu, 15 Aug 2024 18:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1723745578; x=1726337579; bh=jDb14L3lWgizVd8YVVokf0Mc
	CWBt85gMRsDtGW9avug=; b=WmGWoU/sBgn5UTqf98/lKkKXO0qtdDjcW3v48AFw
	TvETP38R8AsrTVJAN+CvJTxR3dBgNKHJvspL+3G0gRKXJs04k3p+72WD667qWZtk
	NkSF+trk3yeY4tY7TBf5u2SGEkiT+RqRbd/UgugjcsaKb0RJziuEqEys3cisdmoG
	WOv/aiVqcUgbcDOergNl6IBf+E3Y1thRuSQZNbSVfwdp6/vUJswMwZBMD37gihjl
	X67n4dEM5l0PmgX6FetpOIKxg+af4VzIJivTNZMIlfohvlwcyoNWYjSv6dN7E4ww
	hafwJTXj9rrqocQ8M2Ik5R3bjEkpG3CrLWsBxr6l6gmfzg==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 7-BDC4myUpIp; Thu, 15 Aug 2024 18:12:58 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4WlCsP4g36z6CmR09;
	Thu, 15 Aug 2024 18:12:57 +0000 (UTC)
Message-ID: <869108d2-638a-473f-81bd-21304d473fab@acm.org>
Date: Thu, 15 Aug 2024 11:12:57 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ufs: core: Add a quirk for handling broken LSDBS
 field in controller capabilities register
To: manivannan.sadhasivam@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>,
 Amit Pundir <amit.pundir@linaro.org>
References: <20240815-ufs-bug-fix-v2-0-b373afae888f@linaro.org>
 <20240815-ufs-bug-fix-v2-2-b373afae888f@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240815-ufs-bug-fix-v2-2-b373afae888f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/24 10:16 PM, Manivannan Sadhasivam via B4 Relay wrote:
> +	/*
> +	 * This quirk needs to be enabled if the host controller has the broken
> +	 * Legacy Queue & Single Doorbell Support (LSDBS) field in Controller
> +	 * Capabilities register.
> +	 */
> +	UFSHCD_QUIRK_BROKEN_LSDBS_CAP			= 1 << 25,

The above comment is misleading because it suggests that the definition
of this bit in the UFSHCI specification is broken, which is not the
case. How about this comment?

	/*
	 * This quirk indicates that the controller reports the value 1
	 * (not supported) in the Legacy Single DoorBell Support (LSDBS)
	 * bit although it supports the legacy single doorbell mode.
	 */

Thanks,

Bart.

