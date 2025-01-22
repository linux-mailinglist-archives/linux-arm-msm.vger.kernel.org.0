Return-Path: <linux-arm-msm+bounces-45853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45931A19856
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 19:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 244B13A8A5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 18:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE02185B62;
	Wed, 22 Jan 2025 18:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9FQcBWz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1C621516F;
	Wed, 22 Jan 2025 18:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737570070; cv=none; b=kNW+3oeAASeKo53XRLz8LHR5M9+6D+SD5uxSsCbioMqnsYPx/bxvGz1+tkOMQWc7l1fTHwrkzO5xPqHybc8yxW1F2Fc7Sb2K8A0hOsEhBYIR8eSIQ0T+vNzbYqopMSzSnGAT53u+fnlWgPyIJQfxNVvS1ACuDOLMxNDHxU+cJPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737570070; c=relaxed/simple;
	bh=v2rw43wmJ3J1EY/wawrZrH9N9S2k44P0mU6CV2K1KQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UxqQ/4fdL1dNQ2nYwYm6AEfnz9bn0/hbX6ZF9tOf03x+mkQV9o1tMr0cvfRixQpcKdJNzeWa9ncwbm4ON3c6Latr8qSKQVAwDG6Maz6Lt1ep/WLiXmPkSHg78s4heNplzp6jLmTyvmKBZNLXvHLEC8RJ1tnL8zWUsM0tQzrG4/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9FQcBWz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948A0C4CEE3;
	Wed, 22 Jan 2025 18:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737570069;
	bh=v2rw43wmJ3J1EY/wawrZrH9N9S2k44P0mU6CV2K1KQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P9FQcBWzvpZgQxJ4Puwjj4gkM34ahweMbDPbylCjsp7hL2CWlXLSDEL2kKob4Io9C
	 sPeYlDpNnxM+lynhXjaFXvDMEMe6iv6kFIHHT3c8nwQZAM+k3Hz7usJZQJtw/uZd24
	 s0k+LJ5WktRZdFCcRFDZyZlv2R8egJujyniXv34vCHGsLNlFeeJywXtR3lHtJcalFT
	 q0Gw2AElVGp+8/94oXASqm+C0mh82iGmGvUZ5UiX9CDoEOHRl3AOvepzYwcqzuuk/9
	 0krYfuV4ZHKDwqxTym03JlrWozWvpSeqPPEpYNBe+YRrGuYQIiyEuheSAwkz+JeoFz
	 rfrgD2FzWJV8w==
Date: Wed, 22 Jan 2025 18:21:08 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
	beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
	martin.petersen@oracle.com, quic_nguyenb@quicinc.com,
	quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/8] scsi: ufs: qcom: Implement the
 freq_to_gear_speed() vops
Message-ID: <20250122182108.GA2924475@google.com>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-5-quic_ziqichen@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122100214.489749-5-quic_ziqichen@quicinc.com>

On Wed, Jan 22, 2025 at 06:02:10PM +0800, Ziqi Chen wrote:
> From: Can Guo <quic_cang@quicinc.com>
> 
> Implement the freq_to_gear_speed() vops to map the unipro core clock
> frequency to the corresponding maximum supported gear speed.
> 
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>

vop, not vops.  It's one operation.

- Eric

