Return-Path: <linux-arm-msm+bounces-75737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0D6BB2251
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 02:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CAF9168D88
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 00:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDEC33987;
	Thu,  2 Oct 2025 00:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWxEgIwF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9382A5227;
	Thu,  2 Oct 2025 00:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759364715; cv=none; b=dgBOEkcLI7SnfQfl6vCQBfoz2L3a0674apWWfTtpBiZkiaHG9KReIhJd1ULHiGTrvYuK+PSDKnAygHvXPUlrKVy+7IIlqdUSHVKmFqvZM67yrLqW+nKZblRZj3ymuX4Yt1EcYX4RcNOrCxIIwBZWz3HmOVGESvj22AQbf1ivdjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759364715; c=relaxed/simple;
	bh=jaaoS+M6IveeBQvwajXI2NBIG0sD+p2sirzq8Fpklfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpdR2obvIU5YlRfMHbSli9EYnBdchz6Kl14jk4aQQG8cHzMzV/9NAhOI9Kr+M8N8Oqz4r7CeZtJxwkrhYCH7fs8lepreXlL77IGC1fAQA6Iu3OR11rNtDCKHYouxr/++WvAqF4pWbzUAwPqt9lFdqrbC02gO4nmuTLfc6rpSPRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWxEgIwF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F87EC4CEF1;
	Thu,  2 Oct 2025 00:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759364715;
	bh=jaaoS+M6IveeBQvwajXI2NBIG0sD+p2sirzq8Fpklfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KWxEgIwFlLRYGK66FkBqMYzfaRhjoaip8AULR2FMit+Gcs3W89RRHutm3zenzP4pC
	 tj3F+xniQmDXVmer3lvEGy+XfYZXhSeNDAAXXzgvop/60JzEmKJ8mNBWcmfdaIQxAk
	 Hz5e+1HxNILB5sXOoObMWCRyctajVq/gbAn7bs1BdmaclaDnV3LZL1uHi4+vEsdjeS
	 QQPKAW0+vuqOaMRUiWF7Irmvro5LEQZHHql/woqKK7vWtTAYkBBbbe88jrx0zO5S93
	 8lnFjTaIl4crXHIEHf1sd+65XLvvKZUeSRiVhxo92YwfSwjoMcneeKYpBMgcVvbAZK
	 zhYibdBJlvlzg==
Date: Wed, 1 Oct 2025 19:25:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
	conor+dt@kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Document Glymur CPUCP
 mailbox controller binding
Message-ID: <175936471237.2669084.7939795874975807384.robh@kernel.org>
References: <20250924144831.336367-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924144831.336367-1-sibi.sankar@oss.qualcomm.com>


On Wed, 24 Sep 2025 20:18:31 +0530, Sibi Sankar wrote:
> Document CPU Control Processor (CPUCP) mailbox controller for Qualcomm
> Glymur SoCs. It is software compatible with X1E80100 CPUCP mailbox
> controller hence fallback to it.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml     | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


