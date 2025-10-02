Return-Path: <linux-arm-msm+bounces-75739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A91BB2268
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 02:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37E4B1778D3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 00:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7963AC1C;
	Thu,  2 Oct 2025 00:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUP6ji1v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A781758B;
	Thu,  2 Oct 2025 00:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759365277; cv=none; b=WRXM8zs0jj8CNqpqbv5gtCkQDi3lw+kiQG6LUZI3q0/qGHa6QuC9YYxbTWTSu6vxrY6uM7PFrbMo+JvOEW/wGEPyWJbbscoaKMm72JImVtiLM190MZ72n+JrLGMI9oCONjy7T3s0E21RAyrS3hoczANkzDCxL5d4x3Sh1lo4hpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759365277; c=relaxed/simple;
	bh=gjOTJli6M8zGzeuRzvYHCyoKoewturxE7at7kfehWos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5g7Ar68VAGfRBWXSSWtkI9aT3OoTpmWo6KeqAfwJu8/1wzXZAjzvGzPXPR7n14Kd58nWlndKCnZjv3YHwLkVBI7vqhVdvrXJmmeThkWOh1wXS3kF7vs7+n8mNMm2+im+2lS2LbXg3LUtaHg+IgT4iomLK2Jj3c4SM2t7cFkO9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUP6ji1v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B2CC4CEF1;
	Thu,  2 Oct 2025 00:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759365276;
	bh=gjOTJli6M8zGzeuRzvYHCyoKoewturxE7at7kfehWos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bUP6ji1vEWavXjnx8umZ7TmoVyLWgg+2Ky9vtJKnYVeQLrIty+4e9pJqtotzmbd2h
	 oqdIctYMWDQMOtrjAKObm3wAOTcIyg7bywHEZIAR/4PNU4/F11BfIaSylm+8RQVi0E
	 X/kNUo59JYNvqN5rrrPrEA2W3U1j/8XC8TXDhBNI/rnqYJnF3/VAEo+GXNp64F8BDy
	 Mw3RqvlQfhMgEylOcuYoukc9Mm761AWIjwX1EzD0i0lBZmKfeJL5WowCIJLcjJNzda
	 PBbKn4lungdBRa2pJpSxb/iW7rJmRCdAHUiPjUZ4jMoU0wMihxFfX7/ilKzBtuVAGK
	 dqMKYE+6zrlfg==
Date: Wed, 1 Oct 2025 19:34:32 -0500
From: Rob Herring <robh@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Add bindings for
 physical client ids
Message-ID: <20251002003432.GA2714683-robh@kernel.org>
References: <20250922-ipcc-header-v1-1-f0b12715e118@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922-ipcc-header-v1-1-f0b12715e118@oss.qualcomm.com>

On Mon, Sep 22, 2025 at 08:34:20PM -0700, Jingyi Wang wrote:
> Physical client IDs instead of virtual client IDs are used for qcom new
> platforms in the Inter Process Communication Controller (IPCC) driver
> as virtual physical mapping logic is removed in HW. Add the bindings.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  include/dt-bindings/mailbox/qcom-ipcc.h | 48 +++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)

This looks incomplete. Where's the binding additions for the new h/w 
that uses these ids. This series looks more complete:

https://lore.kernel.org/all/20250924183726.509202-3-sibi.sankar@oss.qualcomm.com

Can QCom please coordinate your work so we're not getting the same thing 
a day apart.

Rob

