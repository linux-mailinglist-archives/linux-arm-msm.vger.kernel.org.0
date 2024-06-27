Return-Path: <linux-arm-msm+bounces-24480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 541B791A913
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 16:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8247C1C21BB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 14:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEDC195B35;
	Thu, 27 Jun 2024 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="y55/YVSn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889D6178CCB;
	Thu, 27 Jun 2024 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719498139; cv=none; b=tQxqdtpHXMZYl+sQ6TmlTDbBvv0vJeN7fVk+7SCA5zjdKCQFzyBOGScBl6MAnP851cyDUd8XiNo+s3ZGy/d8nFoXaC79pWu7qyMOGIvEYclahkP97gFEQUGlvQ+1ByJro2sSAJLMkRu8laiMpT9pC9uzdF17eTkw7y0wHtQKl6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719498139; c=relaxed/simple;
	bh=yS2yL3/tn3Cw8IPl616aI0+FdfPZgH9pKmml9kGuYXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWv9UM4h38aGuKihxz0jp3jOhL0MQNDhW9yf6+7G1PtZOLTumlyYZAL5mK5xLxN6W7rck/kJr/piJqrhrKK9KsKgu3kOLpgcwH7h7hE60YUNlqNFsReXAJd77I8eA76aucqr2R9FD/zlbVPt6rD0eoP5tf8v0GExsDsGor+hw30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=y55/YVSn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432FFC2BBFC;
	Thu, 27 Jun 2024 14:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719498139;
	bh=yS2yL3/tn3Cw8IPl616aI0+FdfPZgH9pKmml9kGuYXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=y55/YVSn1vFGOZ4+u5zeFwHI/Q6C7QKxZ4M4p4Jt5EalUOMN0t5bhuvJqe9K0h62r
	 jR35Doo8TDIytQGcAGDEQGZX/e7z23hj0RmkxEvhjKGKDtKobE9n2Y9ErcaFcrFQev
	 6ERDRlRmOpJc9ubYi1RqzXFhgcWHu/UuekS3NmIo=
Date: Thu, 27 Jun 2024 16:22:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Nikita Travkin <nikita@trvn.ru>
Subject: Re: [PATCH v9 2/2] usb: typec: ucsi: add Lenovo Yoga C630 glue driver
Message-ID: <2024062701-afar-rogue-4f37@gregkh>
References: <20240624-ucsi-yoga-ec-driver-v9-0-53af411a9bd6@linaro.org>
 <20240624-ucsi-yoga-ec-driver-v9-2-53af411a9bd6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240624-ucsi-yoga-ec-driver-v9-2-53af411a9bd6@linaro.org>

On Mon, Jun 24, 2024 at 06:08:13PM +0300, Dmitry Baryshkov wrote:
> The Lenovo Yoga C630 WOS laptop provides implements UCSI interface in
> the onboard EC. Add glue driver to interface the platform's UCSI
> implementation.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/usb/typec/ucsi/Kconfig          |   9 ++
>  drivers/usb/typec/ucsi/Makefile         |   1 +
>  drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 204 ++++++++++++++++++++++++++++++++
>  3 files changed, 214 insertions(+)
> 

Ok, worked this time, now in my tree, thanks for sticking with it!

greg k-h

