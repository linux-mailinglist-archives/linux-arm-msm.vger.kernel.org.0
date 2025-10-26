Return-Path: <linux-arm-msm+bounces-78828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E5BC0B534
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 23:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E1003B3EE5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 22:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A277266565;
	Sun, 26 Oct 2025 22:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gnKfiX4h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AE91D90DF;
	Sun, 26 Oct 2025 22:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761516681; cv=none; b=sPXFoqtPCTurzNjemqHTN12KJ5JPLIu++Wf9Odt9LrLdmFzszeSgJ0ktjl5Pn/uA5DW9r5evA2dWLNfdAMCFp0KIy/7X41fDc9XVsBe6/92QfzjI4chHj5/5Nz1tG1udOtXmRXWt31mDjKk4ncgBzJXsPi41AwJKXlAaevNqSy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761516681; c=relaxed/simple;
	bh=9xm02AGCq9f35Pl0ykXDcv9Pxwm1nzshMInrzYpBjvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ius9E8uOf3OME1h4CcLW7C3z3S1POGYVOZu1sB7UyPqjSbf5veV6mz/WoO9SSxQB89KhKq5c5LBYi5PgVsZYEfotzYIuH+XOK/pidkANpq8jISezKJQrNtmqbjys1IfxV0Y7AQbSwc7fDa+8RxCs10P5hh7nE+i3HDcF2Eb0hXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnKfiX4h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2BDC4CEE7;
	Sun, 26 Oct 2025 22:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761516680;
	bh=9xm02AGCq9f35Pl0ykXDcv9Pxwm1nzshMInrzYpBjvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gnKfiX4hX7Tk8jjmygo1dNTKfNRji6Ds0/eC4hxD6NtamWsNWqf8MIf02EvR9TCtK
	 BOgEKIMB8usNr0TWqhFln9qibWV4js9SdMj3j6nfYHuI96zjPRLe8DCbh5dYPLjq/y
	 28QPvEDRKIQsQWYvUrLNkC/EecAzXxH1u35adqbI4uIwv/P6RvenscXH6QbE7hXvke
	 YynrTDAFJ4zL2KOfeAOGYQ/NoQGVIOIou5pD3tYTPEYpELBaaxLtqfzxyZRskHe7DH
	 l+91Z0Z29sa/hiRBizO7gKtm/HBMy7jcIArR9SXyK9YAqDPTcZ8e02WxNVr18RBX23
	 FAHWMZaCG+n4g==
Date: Sun, 26 Oct 2025 17:11:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, trilok.soni@oss.qualcomm.com,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	aiqun.yu@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v2] dt-bindings: mailbox: qcom: Add CPUCP mailbox
 controller bindings for Kaanapali
Message-ID: <176151667552.3027028.7193532259261459150.robh@kernel.org>
References: <20251021-knp-cpufreq-v2-1-95391d66c84e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-knp-cpufreq-v2-1-95391d66c84e@oss.qualcomm.com>


On Tue, 21 Oct 2025 23:32:30 -0700, Jingyi Wang wrote:
> Document CPUSS Control Processor (CPUCP) mailbox controller for Qualcomm
> Kaanapali, which is compatible with X1E80100, use fallback to indicate
> this.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Changes in v2:
> - patch rebased
> - Link to v1: https://lore.kernel.org/r/20250924-knp-cpufreq-v1-1-1bda16702bb1@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


