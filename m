Return-Path: <linux-arm-msm+bounces-62282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBAFAE77C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EA677A25CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 07:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9E61F866B;
	Wed, 25 Jun 2025 07:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0rNqbEsp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CBD8F4A;
	Wed, 25 Jun 2025 07:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835302; cv=none; b=DA1xc05p8UUTgBLT0cnkPHxEfKIbaYwHJlIaF0dRSBVCLL9MoB+94yHUhe248lbTDxHF6eko4Hlnn6BqB8Cf+cR4TstH3UCWlT3Jsu5+NPtUb9uDOUNr41RTospOx+MZx+w9AaRpXyFVfCTg8M6zyKZPuxefX1gPONkwfGpf+B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835302; c=relaxed/simple;
	bh=CHm5OV3W0KUMqplu/gRPB+lt1EfnCyIHCgP7omgKaPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyxjUdZM0/jq4V0F7Hc8kJYNBVc7nLXixCiyB2rfApWZ9IdyQS3T86QZRFB0GrzI3No0dr4PoQBitkD11Esrrn1PATy/JCFTEBOHa2IaDOhPJGqBlSaK9UpdvpsOQaWT8kCcAf/5C/Km51v2kO/gn0rn5UQEG7awsJ708aHryww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0rNqbEsp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1329C4CEEA;
	Wed, 25 Jun 2025 07:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750835301;
	bh=CHm5OV3W0KUMqplu/gRPB+lt1EfnCyIHCgP7omgKaPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0rNqbEspWPFPt/zAKVCr0S0wNlKMXQ03YJDeHpgpLS1QjLsYqT1I8eKQu3G6XnWkB
	 lYVZdt3fTaZyweqQkIcaWe9okp7JOTXWBQciP8FZuc9i6AnquSGdELM3bDRlvZmFgU
	 2NZkuzIlvxPSxNOpgmbAujiS+JFumt9p7wZhEP0E=
Date: Wed, 25 Jun 2025 08:08:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: heikki.krogerus@linux.intel.com, lumag@kernel.org,
	neil.armstrong@linaro.org, johan+linaro@kernel.org,
	quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: ucsi_glink: Increase buffer size to
 support UCSI v2
Message-ID: <2025062528-grip-maverick-7a19@gregkh>
References: <20250624222922.2010820-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624222922.2010820-1-anjelique.melendez@oss.qualcomm.com>

On Tue, Jun 24, 2025 at 03:29:22PM -0700, Anjelique Melendez wrote:
> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
> This makes the total buffer size increase from 48 bytes to 528 bytes.
> Update the buffer size to support this increase.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 50 ++++++++++++++++++++++++++---
>  1 file changed, 45 insertions(+), 5 deletions(-)

40 lines added new, but:

> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 8af79101a2fc..d20f01a0cd5c 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
>   * Copyright (c) 2023, Linaro Ltd
> + * ​Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

Please don't add odd characters, AND work with your corporate lawyers to
go over the rules for when you should, and should not, add your
copyright line to a file that you did not author from the beginning.

Hint, 40 lines added to a file that is 426 lines long does not trigger
this type of response based on the legal advice I was told to follow
many years ago, if yours differ, I would love to talk to your lawyers
about this please.

thanks,

greg k-h

