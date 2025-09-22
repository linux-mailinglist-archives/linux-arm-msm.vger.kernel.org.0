Return-Path: <linux-arm-msm+bounces-74460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19634B927EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 19:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1CB42A576B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 17:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8484316903;
	Mon, 22 Sep 2025 17:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6qKDuG/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994B43168FB;
	Mon, 22 Sep 2025 17:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758563859; cv=none; b=lGPUg1qwfCPzRFnl/fQMD/Hqftc7OqpAIByjEbVFCnSf0cDxNWaGRdJ8Kl7boLxsDPOeJopNPp6Az0tmRR3qLrvdCCmzqoJrjP/nZ8u02kA1ELkDg2XxcahQ4IK7lS59fqgPvBIefmaakU8xa+3pLXt2/WmFQK+7M67eLzqd9M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758563859; c=relaxed/simple;
	bh=0F18IDnsz7JXkePubAluCire1XgLYaaeZD6WqTJdBpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZlnpG0vhinSRRaGfKfyEdfO96Gxa2KbdpRHcZxh9TwyAhWxk3s56nvTuafQVFvOsrhVlkV5haTwsPfKePTsCFPW48qTBQmEHdGxRKAkWi/yKhTp+p+tqOPbo8Z4/T/dLFvB07lAu8g979fHWjKaRm3+cQkYz6o+0m8fHTMjUgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6qKDuG/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0661C4CEF5;
	Mon, 22 Sep 2025 17:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758563859;
	bh=0F18IDnsz7JXkePubAluCire1XgLYaaeZD6WqTJdBpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e6qKDuG/vBTbq9udABo/6c2f6m0njzeSnf7gGWRILOBalwwXIIUUnuoPdyD7u41mH
	 Dt3UVZOTu6Fc1jR0VnLwwr5UCdrp3/96Fj+ZKYp94ZnAfS+GRyL4YRziyAlWwJFrmp
	 WpX/5p4TI8sBxMoyP/3FJIs78xZytvQK6it4rhFc3lVsZMA5p0OyAdv+x2uXnxIBAw
	 sVp69DDlGAosI8+Sb5XfrOACKH19tiOVNfaY47JLGIJne+rF2+ARNuzD+786vaoE8k
	 x/60YlJeysWzOqL7T8t6nfRtsM2THOTx8mNK0xF4mK3CILC/MmPN4vNQD7PdVMuoD6
	 HeOteCqMeYACA==
Date: Mon, 22 Sep 2025 12:57:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, andersson@kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: qcom,pdc: Document
 Glymur PDC
Message-ID: <175856385559.538981.18258530352807939148.robh@kernel.org>
References: <20250918140249.2497794-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918140249.2497794-1-pankaj.patil@oss.qualcomm.com>


On Thu, 18 Sep 2025 19:32:49 +0530, Pankaj Patil wrote:
> Document compatible for the Power Domain Controller(PDC)
> block on Glymur.PDC acts as interrupt controller in
> SoC states where GIC is non-operational.
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


