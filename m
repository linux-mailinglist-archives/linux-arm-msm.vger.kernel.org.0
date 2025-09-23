Return-Path: <linux-arm-msm+bounces-74499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69872B94B99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 09:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B1E91902811
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 07:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FB0310777;
	Tue, 23 Sep 2025 07:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D82LJQIF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015433101BB;
	Tue, 23 Sep 2025 07:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758611843; cv=none; b=HionfzWdeKFm7BFkJt3M1jL2gXm7OmHxCvCcuU8xmkhS6plWm1+XwwLtoKYRf366k51TkAY3j89yOWJi2XQBmBwpBsp5DDzQVS1tjcAvuQPlpDwLCGClsv0XfkJPKYCKoKkEBgxGTlNzy0YdbQAOxxm+RymhqiVL5CmerTYkzZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758611843; c=relaxed/simple;
	bh=74uoFJ7jMNWnVtO7bbEppI+Nrv/MCVrxXDa+msiKANQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K40zmAx3j0OVODud1KXGWKa2VTHEnVnmzh54PNFzPMuO3pJS5nEUIFg5/HL4aWjK15DN3DsRfBPc/tkNlrT6NBqLJfQQXKdYa9xAEFpUPZy489aZploFjT8XHtxK6r0hr4G142vuiULAchze+Ly8kW/eujNt4G0fecDJrQoyy3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D82LJQIF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9E4C4CEF5;
	Tue, 23 Sep 2025 07:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758611842;
	bh=74uoFJ7jMNWnVtO7bbEppI+Nrv/MCVrxXDa+msiKANQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D82LJQIFPu/EeRuyEz2rYqGcTDm+R1XkM9O6FxHLiLTeke+TImCmzeyxB1b8JvJr7
	 nFL3wqZ8bso+3eocJOkDd4P8pR/skH993xgSDrmMt6looq7LfeS+tUJUi0gTRXUCPW
	 D6A+OFZNrBR/2m+PQFVSEvwjwncPJcPDQ//eCV0gi/woXhWbN1ncS8YN//dUqknzTM
	 TZzhfDVHzR87ntapXZuHdFq9VP5cAt9wU/Kf9zIbgdzQ1Ee2KsoobiiSVOTSX4Hu2K
	 zbVTv2VlNyf9wpe3xKMnmIIxU8npsDLjeqKbTWOdbEWc1K3yujsZsNeXNSJRO5BzfC
	 ZBzlyJ1Sy+3TQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v0xH1-0000000015X-1rqd;
	Tue, 23 Sep 2025 09:17:15 +0200
Date: Tue, 23 Sep 2025 09:17:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>, srini@kernel.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.16-6.6] ASoC: qcom: sc8280xp: Enable DAI format
 configuration for MI2S interfaces
Message-ID: <aNJJe20u8bEOE3VP@hovoldconsulting.com>
References: <20250922175751.3747114-1-sashal@kernel.org>
 <20250922175751.3747114-5-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922175751.3747114-5-sashal@kernel.org>

On Mon, Sep 22, 2025 at 01:57:36PM -0400, Sasha Levin wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> [ Upstream commit 596e8ba2faf0d2beb9bb68801622fa6461918c1d ]
> 
> Add support for configuring the DAI format on MI2S interfaces,
> this enhancement allows setting the appropriate bit clock and
> frame clock polarity, ensuring correct audio data transmission
> over MI2S.
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Rule: add
> Link: https://lore.kernel.org/stable/20250908053631.70978-4-mohammad.rafi.shaik%40oss.qualcomm.com
> Message-ID: <20250908053631.70978-4-mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> 
> LLM Generated explanations, may be completely bogus:

Yeah, it's bogus. Please drop.

Johan

