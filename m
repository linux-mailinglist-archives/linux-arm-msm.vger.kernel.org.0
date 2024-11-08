Return-Path: <linux-arm-msm+bounces-37346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B2E9C2140
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 16:56:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B619E281462
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 15:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0D821A715;
	Fri,  8 Nov 2024 15:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rs8LAjmT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4478945023;
	Fri,  8 Nov 2024 15:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731081388; cv=none; b=WMa0T6bYJfVOA/wFraVa2zzoZ33NcbuIriAd1pwsHs2kdorNfgVxYwtlfucq6cbXx9gBARP2vsKcDInM+43L9qeMmUjsMWCczEoMSoHEjNSyVPetOaF7VeN102WXrJOqbhB1btSv5FMzOqsgYpR3ES1GzBfnQKmC0PwFjEfaphk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731081388; c=relaxed/simple;
	bh=M7Lc2QagtdMaBItv34y0AyMzk8MYqGKDbeTFdFJ0laI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTNnlkowCxyTEJCXUmTHas/GrqchmqMmq9o44LAvAi3iHZlatX25H65Cr7KgHh8iTQNJNPx724SCurdIiOPacOzQ7h/01ctXQcbOiFKY9bTCkLOVCHXEEdRhR4W2aJY8hf/UxhLR3GtKEwJ8DGo6Ou7qaizf7JxPc8AxN0y49lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rs8LAjmT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A5AC4CECF;
	Fri,  8 Nov 2024 15:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731081386;
	bh=M7Lc2QagtdMaBItv34y0AyMzk8MYqGKDbeTFdFJ0laI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rs8LAjmT5GwP0erV26mbKzgyu1LLyeHmFa21FsuMA00piroCs6eqAnG2raJ4kAZf0
	 gIdhxFhRFRqoruDJVOlRpXDQQKLSKMGG1dN0MQg8TExJBGY5yq2pTNIXZXYjtWHnpx
	 iXpEhPTzdvXQNk2pxwSq1+10hijxBA5lnhQ58WltJVeaZiXQSMFkXzvCR0EZMnK7J6
	 1DLLXAyd6NbfbCiSCaMGaNyC+saHExI2HZ89olJ753gBPU5YgX6478Ac89oCPVbWtg
	 7Fg153ID58b6YTg1RRBiWLvQc8i+pqieJJYd6Kd74aq95SecDwIw5v5MiW5STUbP0n
	 GkB4SZn7ZYq+g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t9RLZ-000000008UN-1CLf;
	Fri, 08 Nov 2024 16:56:29 +0100
Date: Fri, 8 Nov 2024 16:56:29 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogeurs@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 1/2] usb: typec: ucsi: glink: fix off-by-one in
 connector_status
Message-ID: <Zy40rRqrWEbZKFsu@hovoldconsulting.com>
References: <20241106-ucsi-glue-fixes-v1-0-d0183d78c522@linaro.org>
 <20241106-ucsi-glue-fixes-v1-1-d0183d78c522@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106-ucsi-glue-fixes-v1-1-d0183d78c522@linaro.org>

On Wed, Nov 06, 2024 at 05:45:54PM +0200, Dmitry Baryshkov wrote:
> UCSI connector's indices start from 1 up to 3, PMIC_GLINK_MAX_PORTS.
> Correct the condition in the pmic_glink_ucsi_connector_status()
> callback, fixing Type-C orientation reporting for the third USB-C
> connector.
> 
> Fixes: 76716fd5bf09 ("usb: typec: ucsi: glink: move GPIO reading into connector_status callback")
> Reported-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nice find!

With CC-stable tag added:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

