Return-Path: <linux-arm-msm+bounces-74466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 92107B92C5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 21:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F7254E10CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 19:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D3B31A556;
	Mon, 22 Sep 2025 19:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClYCiVN2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D049E1DE3AC;
	Mon, 22 Sep 2025 19:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758569231; cv=none; b=K8IaMrrz6lA683zf39iP1eBGPrDkQ3dq8OfwFYh3lWwAfCCAM1y65gyYV29gstFSUHJBdik50H0cP7D+KfLADHfBlUMJcYpcVetsoTbqU8D1w2PKFouAZZ+wTc4hu3ejozejmwXxwv4jgZbs7JnEPun9M4eQK0lfG6a5Pjeb3Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758569231; c=relaxed/simple;
	bh=ywrd1KKck6bPh6zOwROXdRwybYcsMLOnA7qGs+xm55A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjUXCyfa5WFxrXQuEe/8UUQh4gg2e9ueQ5tOedv8o9E/Bg2ZzpvxxNPV62/7V3ubmq4BRXkoji8NQ385kXu4d6ZdTo6B39Uc90nuCNMVjF2rr6UW5iX2H/PKFgzRzrDz/D09QdVKNX6hd36Ahkf9LASGlYD0uFhfmGbf8yB/reA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClYCiVN2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D487C4CEF0;
	Mon, 22 Sep 2025 19:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758569230;
	bh=ywrd1KKck6bPh6zOwROXdRwybYcsMLOnA7qGs+xm55A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ClYCiVN2ew1t6L0jzuvN8xoBKuEaxl5bkmn5nx+5Y+E5dSaKpq313iVoBQGCSw+Pq
	 HzyxI5Homtln1D4sifWdsTORikIulp4EadNh8Qdm0EDjobqBNeBEnGfYPozLc6eRwo
	 /WIR0CDbLzagdlfoIl68pTkLUET+5+fg1cTNKMqxoC/hUJNDJilq1sD4XWWDwjTzsr
	 q0zQUgB9y8exSeVkEEMkFgJvCWKOvdShnUodAO6jFPLP5pCNQKIndwtz8cJGCl1Mxc
	 GPXY+WNwa3f4MlFmjk+psgPcnyeDc/fP7yf/KGm0tX7ahkLfuMnNHvaklRBesDTpaa
	 u6uWyfbwORVNA==
Date: Mon, 22 Sep 2025 14:27:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jens Reidel <adrian@mainlining.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux@mainlining.org,
	phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, David Wronek <david@mainlining.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: sm7150-dispcc: Add MDSS_CORE
 reset
Message-ID: <175856922409.903995.288649430908180602.robh@kernel.org>
References: <20250919-sm7150-dispcc-fixes-v1-0-308ad47c5fce@mainlining.org>
 <20250919-sm7150-dispcc-fixes-v1-1-308ad47c5fce@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-sm7150-dispcc-fixes-v1-1-308ad47c5fce@mainlining.org>


On Fri, 19 Sep 2025 14:34:30 +0200, Jens Reidel wrote:
> Add the index for a reset inside the dispcc on SM7150 SoC.
> 
> Signed-off-by: Jens Reidel <adrian@mainlining.org>
> ---
>  include/dt-bindings/clock/qcom,sm7150-dispcc.h | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


