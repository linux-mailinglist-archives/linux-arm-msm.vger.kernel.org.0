Return-Path: <linux-arm-msm+bounces-79487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCF0C1BA13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71FA91893F6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572EC30E82B;
	Wed, 29 Oct 2025 15:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFixKe+a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2364F2E62D0;
	Wed, 29 Oct 2025 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761751464; cv=none; b=rnBTzjlb4XQskKs9pc22wItzurK/YLttU9MEJ+CkQxwIHOpVGANwDBZ1Ef4iP69Tdjz1jBnwJ+InPcPLG8w02NO7GKl32ovcs32Jlrcf+x4Bl9vhZy18Uagw+5GA2OKRc77ubYjIFQtu8LIPU8VRZer3HOgdv8N3av9e9+1H2lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761751464; c=relaxed/simple;
	bh=C78jSd2R7ge8lnlFlJKPQI9tQmjpUUXAcq2TBYPRtsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7mXrd7uU+3Zsdtmw6bYmPiEHfin6ztX1GJtEAwN99TibG1ytv3tDvUTJjutfr4Cy9kEaj+tF1xHw8RZeE55kAPm6t5W7IA1lKKm2VNBkAo1Wmo5MytD++ENToUhSW6C60xxg86/+7BZfvQ4SfwNVSmB1+IdK1KaE5TESwen92A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sFixKe+a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FFDC4CEF7;
	Wed, 29 Oct 2025 15:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761751463;
	bh=C78jSd2R7ge8lnlFlJKPQI9tQmjpUUXAcq2TBYPRtsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sFixKe+aIbeQujqaC/YV1xKNvQDajUPI3gt1V/tMkOThpr9JXeUGMO+EPU8/N76tL
	 5nI9bwWf/7RH1BmMNdduG6y+mCwmlbl3ezcbXxMAqElyS58nJNYVyuth8gEghkA8Oh
	 IuzipPhzUFZqmNWR0nCeB5DfhsDsGsQkcL5KJZqoexAQ4f5+pSHJA9iHo5cH+HKpoo
	 FXnjjkCCUx8tK8iR6r6K0z7veF9UjK4VlMilddnA5YYZw1pvmS9feULnPEQWt1O0ey
	 TSjMiPPKa6uZVfC47c9jb5SC/bPHNEnHfHczM0zctmHitWdSg/bapuWYI6kTChRm1J
	 mSEXaHQKQECKQ==
Date: Wed, 29 Oct 2025 10:27:26 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] crypto: qce: fix version check
Message-ID: <fkqs3deirpi3sdljuo4fnod2pryoqg2ho5bbuie77k55mktrlq@heg4gvoo2rvy>
References: <20251029-knp-crypto-v2-0-b109a22da4f7@oss.qualcomm.com>
 <20251029-knp-crypto-v2-3-b109a22da4f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-knp-crypto-v2-3-b109a22da4f7@oss.qualcomm.com>

On Wed, Oct 29, 2025 at 01:25:31AM -0700, Jingyi Wang wrote:
> From: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
> 
> The previous version check made it difficult to support newer major
> versions (e.g., v6.0) without adding extra checks/macros. Update the
> logic to only reject v5.0 and allow future versions without additional
> changes.
> 
> Signed-off-by: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> ---
>  drivers/crypto/qce/core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index e95e84486d9a..b966f3365b7d 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -21,7 +21,6 @@
>  #include "sha.h"
>  #include "aead.h"
>  
> -#define QCE_MAJOR_VERSION5	0x05
>  #define QCE_QUEUE_LENGTH	1
>  
>  #define QCE_DEFAULT_MEM_BANDWIDTH	393600
> @@ -161,7 +160,7 @@ static int qce_check_version(struct qce_device *qce)
>  	 * the driver does not support v5 with minor 0 because it has special
>  	 * alignment requirements.
>  	 */
> -	if (major != QCE_MAJOR_VERSION5 || minor == 0)
> +	if (major == 5 && minor == 0)
>  		return -ENODEV;
>  
>  	qce->burst_size = QCE_BAM_BURST_SIZE;
> 
> -- 
> 2.25.1
> 

