Return-Path: <linux-arm-msm+bounces-31987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C4497C235
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 01:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B629B2185C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 23:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A3C175D2E;
	Wed, 18 Sep 2024 23:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELXhnBVx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB0A137764
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2024 23:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726702866; cv=none; b=GG3eCLXuCbHuOaVNCXIIZpvvs23IjdIoopiODESUQq2XE43cQOzscV9tC1n46/tcUUdPpdAZB+DHBrJCdZS58ZbBXXb/aerXGP+amieE/bdSbXez9w2AHoD6qiW+21GpB6A0MKmpp+6khYMFZMuaba/tJUg3UQglFRnmR7cisxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726702866; c=relaxed/simple;
	bh=1C9SOnuSnT0Tp2Ar3WNtQJeS14t2wGBYD8udyPCVaVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0lisw34bhkl8BUWR86vFNsblTxoHHC9/eTIFGj+qvM/O4xAW7DAbdzCXtHtUyHX3m1VT1wT3bOgw2d66CSuAm7W7wS+/MbL4XoJpdwd8tPj8Gx04flVQ+EQ4VahxyxALl1PSQF7uM+HeRp8KQqK7jln51//sjY2FZMSwS+ck6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELXhnBVx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152A5C4CEC2;
	Wed, 18 Sep 2024 23:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726702866;
	bh=1C9SOnuSnT0Tp2Ar3WNtQJeS14t2wGBYD8udyPCVaVg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ELXhnBVxw4G/RXl2OyNr+TWbOLLOjj+gcsFRxt2tUfENFHm0h2RUWSaV6Kp2OXkht
	 GXrG/3JCH/2tSS3zP8btrv47tKs5dzvGnwmjIRmAsaRqXYFnSbxWxggMyPN54GwgWK
	 PF6/k87RHoO+qh/75yGfONrwu5tTWPDxCPzhWTgOueGz2wk9h5uTGn5duDLc27r6Pu
	 Pbw7gCMpyhuIufLnvGUflgtYxk2opzlTdN4pb6L81EU+sGiwpzE7NbvXn6MSX6g1/j
	 ZZ3FgyvmnD1KF9OZZ4XD07LHY6uChuPCDx45uEoRjPNxrF8NMKW9BWk+KcfxHDr44r
	 uwIa9sGTXb9xg==
Message-ID: <630b2044-eaec-4a8a-bd29-d20751d33e2f@kernel.org>
Date: Thu, 19 Sep 2024 01:41:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add crashdump to Sahara
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, andersson@kernel.org,
 jacek.lawrynowicz@linux.intel.com, quic_carlv@quicinc.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20240918155254.3186031-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240918155254.3186031-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.09.2024 5:52 PM, Jeffrey Hugo wrote:
> The Sahara protocol has a crashdump functionality. In the hello
> exchange, the device can advertise it has a memory dump available for
> the host to collect. Instead of the device making requests of the host,
> the host requests data from the device which can be later analyzed.
> 
> Implement this functionality and utilize the devcoredump framework for
> handing the dump over to userspace.
> 
> Similar to how firmware loading in Sahara involves multiple files,
> crashdump can consist of multiple files for different parts of the dump.
> Structure these into a single buffer that userspace can parse and
> extract the original files from.
> 
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---

I gave this a brief read, but.. aren't you dumping however much DRAM the
AIC100 has (and then some SRAM) onto the host machine without the user
asking for it (i.e. immediately after the AIC crashes)?

Konrad

