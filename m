Return-Path: <linux-arm-msm+bounces-65230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C19A0B07569
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 172EE5658C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2512F4309;
	Wed, 16 Jul 2025 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LbqXpgvf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF952EFDA0;
	Wed, 16 Jul 2025 12:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752668214; cv=none; b=VNf1m3Wii4ZF5iwlIsTPSvH1VXRCqiD6jo19vF0dsSHrRywzUL/ysi78GrJLt9YFB0EbXDRMfhIaEIUoXkT68W7xi6h7PRQ1PPtpf7JbKaDKiwX2GY4MeN24auGEJJQW5nrHg8fVYppucOvu1LhQLWl1kmIbReOCGO02+sn8UPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752668214; c=relaxed/simple;
	bh=ZdKYnmi/StfE8TCjXd6hVVx/sxTYZ9HyoHzT57RRx6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJPv5xSKfDv8Y+Kgb6k+zYV+hc6DOAz07mVmU8//LLBIUu4Jp9YHbamtGgglUpQlfy8rGYiTYQL3g+s9fQRzeCcOadVaU14yD6rHgINrA6GfE9JqlUK5Rkbrvq55qvZ/Nx/htiPOcm1IcL5moTQp2KI9NwYqhuY3/b+vqewK39I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LbqXpgvf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49799C4CEF0;
	Wed, 16 Jul 2025 12:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752668213;
	bh=ZdKYnmi/StfE8TCjXd6hVVx/sxTYZ9HyoHzT57RRx6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LbqXpgvfDP50uDmSRo6uQ6HOiZ9ALPgkX4KsIfFV9g4zM8zKEZZbejN9huOhZJSQC
	 5vN8B5XP1CTAmyhWYu6JVohO1zLXPwMvldH/6w5TWnfz2YmtYPQN413RBnEyU7gZ3W
	 OMTxu6E319zVKGZVTrp6L9WoCsTmSO/GMFJnwIIk=
Date: Wed, 16 Jul 2025 14:16:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: fastrpc: Use of_reserved_mem_region_to_resource()
 for "memory-region"
Message-ID: <2025071645-unwieldy-chrome-8904@gregkh>
References: <20250703183455.2074215-1-robh@kernel.org>
 <acd5b3e3-5370-49a4-aad9-b1001aa0eb5a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acd5b3e3-5370-49a4-aad9-b1001aa0eb5a@kernel.org>

On Sat, Jul 12, 2025 at 07:27:42PM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 7/3/25 7:34 PM, Rob Herring (Arm) wrote:
> > Use the newly added of_reserved_mem_region_to_resource() function to
> > handle "memory-region" properties.
> > 
> > The error handling is a bit different. "memory-region" is optional, so
> > failed lookup is not an error. But then an error in
> > of_reserved_mem_lookup() is treated as an error. However, that
> > distinction is not really important. Either the region is available
> > and usable or it is not. So now, it is just
> > of_reserved_mem_region_to_resource() which is checked for an error.
> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> 
> Reviewed-by: Srinivas Kandagatla <srini@kernel.org>
> 
> 
> Greg, there are no more patches for fastrpc for this cycle, can you
> please pick this up via char-misc tree?

Will do, thanks.

greg k-h

