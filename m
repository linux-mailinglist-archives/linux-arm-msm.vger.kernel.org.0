Return-Path: <linux-arm-msm+bounces-80169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D670C2EB6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 02:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C288E3A5FBB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 01:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F85C1F30C3;
	Tue,  4 Nov 2025 01:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDsiA5MI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2480F27456;
	Tue,  4 Nov 2025 01:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762218824; cv=none; b=WWeeJFX308s3zTsw765BDIf7tH+JTeG/RIDQrXuDnZa92HIfurR3YeRTzoxL+qE6+6Feouxch/V6fLXb1Ai45B8qRv/Ztkgl+bYN7XyZlhKeNtPkSeAtC8BtrUy3GeqRaWRSNIUFMoow0rv4KMzP6JTR4yeIPuIAM0GV1f2LgkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762218824; c=relaxed/simple;
	bh=kZAzXxW1Fh2V0sxziB8q0IzN5//dKUhqI0Z5iOgiRYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/D7pN4t29jojXAIZHlSMowCLjqRvNkesNwOCw3bZkaW6GZ2icej/pwANB7cdosDJBKoqR9Ei5BZfpUYvemsc6hXamglRm32y/pQCEZ1wbYNRaMVpgb0jOuZVoZMlL0BwdYCuwEdnOo1XqTJK7lMFiPL34Ls2TYuz7ga3wM+m4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDsiA5MI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFCCC4CEFD;
	Tue,  4 Nov 2025 01:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762218823;
	bh=kZAzXxW1Fh2V0sxziB8q0IzN5//dKUhqI0Z5iOgiRYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bDsiA5MI6ACGZpAZXmBrmnIcYj7GT93asldg/7BpA5thXI0XXr1kdc5PjNp/1Ivse
	 nyW7Wi0oFe04XSrZdfXSRoHcpl/xZ13fRwt5n94tN94kPPRiGXj5W1WY2ek1JyJuI2
	 L+KSejTDfF90B9JSOaAqvpDu5hHCGrSlfIeVSJyccfD/TYSou/EDMBuzsH3cEMNsNE
	 /AJi6F8BBFP9QZXNAneGxHF28KjuajY4nqDZelJ8wBqdI3zVAPXhrlcuReJxBtUBdR
	 KCW2uR2habVEB0pq19WPxDBAO+/9dcTpt+K07X3a6nF5cHh5WMpn+9SIvYOXnIks3M
	 V+eVxyUPb6asw==
Date: Mon, 3 Nov 2025 19:17:15 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Cc: chris.lew@oss.qualcomm.com, konradybcio@kernel.org, 
	jingyi.wang@oss.qualcomm.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V2 0/2] soc: qcom: smp2p: Add support for remoteproc
 early attach
Message-ID: <iis32vl6ximfpgp7yd4l3htnpdvq3pipbcqluqmpktujrrb6qt@jzrkjv55l7q5>
References: <20251103152929.2434911-1-deepak.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103152929.2434911-1-deepak.singh@oss.qualcomm.com>

On Mon, Nov 03, 2025 at 08:59:27PM +0530, Deepak Kumar Singh wrote:
> Changes from v1:
> [PATCH 1/2]
> Update condition to check version 2 in qcom_smp2p_start_in().
> Add more comment to describe above condition.
> [PATCH 2/2]
> Add description for version v1 and v2 of smp2p.
> Check validity of in_version.
> 

This doesn't look like the format of any other cover-letter...

Please adopt b4.

Regards,
Bjorn

> Chris Lew (2):
>   soc: qcom: smp2p: Add irqchip state support
>   soc: qcom: smp2p: Add support for smp2p v2
> 
>  drivers/soc/qcom/smp2p.c | 102 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 99 insertions(+), 3 deletions(-)
> 
> -- 
> 2.34.1
> 

