Return-Path: <linux-arm-msm+bounces-58033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5455DAB7E73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 09:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FAF13B6B65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 07:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3057D194A44;
	Thu, 15 May 2025 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXw2zpr4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039751C36;
	Thu, 15 May 2025 07:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747292442; cv=none; b=BpV1PQ766aud+Y8tA59BtaAn0DSGG0A482T0EWpzN5jB615wVON88S9P8lAZlqrRqmZrrIq8eoQ5GttJZRv+aST169obOr4uXtCTImNDXk4fZcnrXzT42x8TPykzuWD1NrVf7T8uCbrNNHEX8ALdhZLwiAZnrqoB1TCo3XG2ML0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747292442; c=relaxed/simple;
	bh=pZqtIsDy3wuaPCc03El0JXK0GMJDD4EQ7KXryFmRoOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gp5YQy1xMEhNTbcsG/mTehXLMhzHP/fjRakeEYOUIdzQ7ahJ/ooABQ+AVOVDtrfjodPX3gVDz5q/w+OuPE7N9VKT1q8cgQ6YnamMcJ7oUQR0DjeqVGlChh6S6L7euX/ylhmJjOMFCDNdb2w3yw18sxHOTUY/IEUf2upljHUojCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXw2zpr4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D1DC4CEE7;
	Thu, 15 May 2025 07:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747292441;
	bh=pZqtIsDy3wuaPCc03El0JXK0GMJDD4EQ7KXryFmRoOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXw2zpr4xeLfF40kp9j4/AuHE07aGuGcOyguMOVKkP4gt0/B34WWlft0CC7Pwt5d7
	 PYy8NXnjwAf7eJid4LkeuNAGhdoHnSPYYMgwv9Ehp4Nz1f+SSjCQGO88r+/iagBTw9
	 VoZuvLxioPqcccrujLBGyQP04JJeI9SzfShBU9+qFDtAZe6T0dV/oGLcmps7jLSzoz
	 a1W/WYir66n/i7WKOMKZdsosBur7HoUGlnqbTqcIFVwErazcio6qE0BKNqHY5uFSCX
	 4HeYBanESuacVGazjvEJah4OeV+ejJwJNjjigHRm0kcuqTNUqJJ8wZchc2J3ed0fKe
	 DsxdW92OBzGpg==
Date: Thu, 15 May 2025 08:00:36 +0100
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	George Moussalem <george.moussalem@outlook.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] Add the download mode support for IPQ5018
Message-ID: <20250515070036.GC2936510@google.com>
References: <20250512-ipq5018-syscon-v1-0-eb1ad2414c3c@outlook.com>
 <174725663047.90041.16492317619640781307.b4-ty@kernel.org>
 <20250514215450.GA3101794-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250514215450.GA3101794-robh@kernel.org>

On Wed, 14 May 2025, Rob Herring wrote:

> On Wed, May 14, 2025 at 10:03:45PM +0100, Bjorn Andersson wrote:
> > 
> > On Mon, 12 May 2025 18:36:45 +0400, George Moussalem wrote:
> > > Enable support for download mode to collect the RAM dumps in case of
> > > system crashes, to perform post mortem analysis.
> > > 
> > > 
> > 
> > Applied, thanks!
> > 
> > [2/2] arm64: dts: qcom: ipq5018: enable the download mode support
> >       commit: 43fefd6c71291b5793e7c4052b6e3e54d1d87715
> 
> You should really either wait a bit for the binding to be applied or 
> just take the binding patch when it is trivial. Then we're not getting 
> temporary warnings added which seems to happen a lot on QCom platforms.

First option is fine, but please don't apply the bindings, since it'll
cause annoying conflicts.

-- 
Lee Jones [李琼斯]

