Return-Path: <linux-arm-msm+bounces-58012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E33B5AB7839
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 108A4864F0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7C4223709;
	Wed, 14 May 2025 21:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ozfqu7Fk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB201FC7CB;
	Wed, 14 May 2025 21:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747259692; cv=none; b=P9Whx6dHIy2yGkZEE5dILmwR5/YdpdGsQU2n0r965743XgNq4vISyW7DfCEPiKcEFXC51phsaBj6EnfJC/T4YBlLNd4d+0EM1bXu5vHYtRf5lZVMLjQN7xlyJZ+oo9/Ps3QUeYSzY6IPgIJrMeiVY/C0k/8yi+gvev4vQIHPrKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747259692; c=relaxed/simple;
	bh=ufp36USMm3AYvRgWJhupIDmwZhopTTam+PAek9DV0Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqEoWA5iTSZFmZ+Gq2nAkmrQy4hyX/41itHSKbIicoIEhcKgxUw9Ih3Cl/7tYtg9E3Vge0sRMLyT7EzJ6aS7iRAegEXqVWqNSOmS6Uqs7fP8BvLAMVnPuUYMIkl62+3gg6UmqFfH8KH9RA7Z5akRbZ8zdQJbQvuRX0M1cjf7uqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ozfqu7Fk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E507DC4CEE3;
	Wed, 14 May 2025 21:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747259692;
	bh=ufp36USMm3AYvRgWJhupIDmwZhopTTam+PAek9DV0Ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ozfqu7Fkt1fTAvYxhaOfdlXba9aTBc+IB3j0tvrpUl1Mys6LZ8kj04vCvAYPecOXv
	 rDly7Kr3WRDgS1hfNcobKgclOe5uHzGQ8zNz9fDdbowcxTSgyc2aHy68WJp+wN3/cx
	 bevY6PxqpeFkjw07lccSgavyalD/f61BsDse5S9GRb7X4ACkG0JALsd7skBxZTtxD5
	 ZE+HHGjWGUe+EVfFJyiMVnV5oEUIRnYNv1lF5aXOTypepQnMpkN33FAAdVqmWjnooN
	 ZflerT1ZVMDk6YVhShQCqU5iOceGKeewBytq5jBW6CHJx2iRMOUM+4Si/CMcJU7AWR
	 pH7830MBR3eww==
Date: Wed, 14 May 2025 16:54:50 -0500
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	George Moussalem <george.moussalem@outlook.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] Add the download mode support for IPQ5018
Message-ID: <20250514215450.GA3101794-robh@kernel.org>
References: <20250512-ipq5018-syscon-v1-0-eb1ad2414c3c@outlook.com>
 <174725663047.90041.16492317619640781307.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174725663047.90041.16492317619640781307.b4-ty@kernel.org>

On Wed, May 14, 2025 at 10:03:45PM +0100, Bjorn Andersson wrote:
> 
> On Mon, 12 May 2025 18:36:45 +0400, George Moussalem wrote:
> > Enable support for download mode to collect the RAM dumps in case of
> > system crashes, to perform post mortem analysis.
> > 
> > 
> 
> Applied, thanks!
> 
> [2/2] arm64: dts: qcom: ipq5018: enable the download mode support
>       commit: 43fefd6c71291b5793e7c4052b6e3e54d1d87715

You should really either wait a bit for the binding to be applied or 
just take the binding patch when it is trivial. Then we're not getting 
temporary warnings added which seems to happen a lot on QCom platforms.

Rob

