Return-Path: <linux-arm-msm+bounces-81970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4952FC61336
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 12:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 313884E41DF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 11:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4AD42BD024;
	Sun, 16 Nov 2025 11:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSPrTJ7C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7145E29E0E9;
	Sun, 16 Nov 2025 11:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763292337; cv=none; b=b1+9ivpveJEkBuMWz378XsFzaQCWkbwgdQuF5OGzwhWeQ73Tmd1QPrBmG6CZkG5AlRck9uRPDAJWVTI37s0lZVLASxZJm8pIK6u3cWiTr5TVClxUm1GrO3cwAfD4TTXIl0Ei8Sj3o25qVZVKmCWumlJ5bRx8In4XIBkxJlUHhm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763292337; c=relaxed/simple;
	bh=oyNlEgEWKEr9utUc/8CdQXVjJlLilqYmewQphb3NJZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7vfjdsHhoF/tG9brjmkLh7tByI7JfXwAnpo4qfODLLEytBY/5bniZYDRUXbjbDbvfN/JDmmfmuOaGg4qPr3O0+KUHTMQsfu52gFohofjHMNFKvWM8N+L2adlpw8U6oWIe2zf4/eni8sw6Z95mAIs7963gvK74074Qe8XVr1R8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSPrTJ7C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0933C4CEF5;
	Sun, 16 Nov 2025 11:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763292337;
	bh=oyNlEgEWKEr9utUc/8CdQXVjJlLilqYmewQphb3NJZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FSPrTJ7CXRqauAGRZ+rELGN16drTw7HnMRpy0J7EvYk5KpumKku6laRJhPpv0Y0Dv
	 vDIR6cw9rmYrIK3iNG52PTztqrtu8SIjhRNkWKhGNBm44Bbx2lBXife3yWLCgPpLYJ
	 QIv9vjUxxH7e+frnLe7wQnAHpBCYjaShHaTOhyjVUxi0mGR+rFk5ZV3qdxV757iLxx
	 3xcYaGY64crmuka+B7QJIVLaZk64jr3fULYVKmiQzpTxKd/r60y76mNsHBxqzo/sth
	 0PgAkgqEnYn1qPFTHgu+hREmRHSPKxNJkOJIvSpKFrOQIKtcUHtd+eEU3pBIZc1G9T
	 1SQml1382O/hA==
Date: Sun, 16 Nov 2025 12:25:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: mmcc-sdm660: Add missing MDSS
 reset
Message-ID: <20251116-caped-light-skunk-82c1ea@kuoka>
References: <20251116-sdm660-mdss-reset-v2-0-6219bec0a97f@postmarketos.org>
 <20251116-sdm660-mdss-reset-v2-1-6219bec0a97f@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251116-sdm660-mdss-reset-v2-1-6219bec0a97f@postmarketos.org>

On Sun, Nov 16, 2025 at 04:12:33AM +0300, Alexey Minnekhanov wrote:
> Add definition for display subsystem reset control, so display
> driver can reset display controller properly, clearing any
> configuration left there by bootloader. Since 6.17 after
> PM domains rework it became necessary for display to function.
> 
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
> Cc: <stable@vger.kernel.org> # 6.17
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  include/dt-bindings/clock/qcom,mmcc-sdm660.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


