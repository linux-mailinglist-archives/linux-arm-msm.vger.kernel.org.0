Return-Path: <linux-arm-msm+bounces-79841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1502C24491
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04CF5405732
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 09:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5833B334C33;
	Fri, 31 Oct 2025 09:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="LpJ5blfh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F2C3346B9;
	Fri, 31 Oct 2025 09:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904306; cv=none; b=Zzk3ktuOpnkMM24rofamrbBSslulVHU6yPhWsA+ze9pW549pnamZpWggJEBsEWhpGE3Pi6jP9/LpFbeH9iaHyUXIs2arcuRxryWkh/7TBm915mrZe27mwW4AF6gktmibq/n8xUTZGdy+EU5TKSaiNm0nV3KXH2Yc3Lj3rYctYx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904306; c=relaxed/simple;
	bh=V3h67l/YJivgjslRR3dUfpSLfjEIiPGwudDhHT1FrmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnpCt8/FGefS1afNBYXclLxChqIeCGkUhkPdHJozCiDSZGKMHqgytJ11turcmGA7kZhKL9U5U1SwO51DUvuQthnY1MCSixAiW16W69bjE6o0Ma0qx/YlH887o7lSBuVZLsYxOtxqRP+rwImG9OMvnPxa50mqcw02EU9Jc4kul8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=LpJ5blfh; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=UZ0qETE+2EHUpUJARoZZ2B3gO0gU9IkpKcpdI06eKSQ=; 
	b=LpJ5blfhVbzcON1f0fdCyrw9FMa0rd07Ht3luLo2Ud1ZZU4Czoh3fO3xWTVFdLNXMgSgwz9Oqe6
	bf5zH8ZJor3vmpXrfCudaecoxyWF6jdZiNfKgBRZiLJHLTdy4p2yPvXbaGpkuqOyjSJ7qTp0bTWlh
	edB6cLNl8zVxc25lowE9ifUioKxSz+9Dz2KntibGAeLsI5mmQi2DFGQfCoIcTcOKxq4j4kLNVXbXw
	d24nQ9vhHTmZkh6iCRNG2N2UuDF3dfAbDAtteM14gJZ94v9EiTzymNZ0Xbc1LvFry65O/2kI/gm7M
	2DmZrGj6PY1USVU2CregQxY8cQqdBSm/DNhQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vElnF-00H1h0-0O;
	Fri, 31 Oct 2025 17:51:38 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 31 Oct 2025 17:51:37 +0800
Date: Fri, 31 Oct 2025 17:51:37 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: qce: Provide dev_err_probe() status on DMA
 failure
Message-ID: <aQSGqZDI8E1lrVH5@gondor.apana.org.au>
References: <20251024-qce-dma-err-probe-v1-1-03de2477bb5c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-qce-dma-err-probe-v1-1-03de2477bb5c@oss.qualcomm.com>

On Fri, Oct 24, 2025 at 02:35:07PM -0700, Bjorn Andersson wrote:
> On multiple occasions the qce device have shown up in devices_deferred,
> without the explanation that this came from the failure to acquire the
> DMA channels from the associated BAM.
> 
> Use dev_err_probe() to associate this context with the failure to faster
> pinpoint the culprit when this happens in the future.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/crypto/qce/dma.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

