Return-Path: <linux-arm-msm+bounces-65313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F10CB07DD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 21:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 196B51C22884
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 19:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FAF2E2F1B;
	Wed, 16 Jul 2025 19:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZznVnO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85042BD598;
	Wed, 16 Jul 2025 19:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694312; cv=none; b=NyHRzqUvu3pYudhgXfvVKgptrEDIRin6/D6sZiN3cXLgc8a+sL+qICXzSF9gr9pMigpLmQV5ze99MldUQxapR8GDyhJIPuUhpVs2yi1IluHGWdQmXzNsSYVZ1UM5lpM4bFKvVhmGEXXad3q1b+a1W3T24VI+AwEBoHIEBe8zs+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694312; c=relaxed/simple;
	bh=eBe8s1XgfnGkHifuAa5Fbx70CJfHUg3nJuCjIt3mEik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AfDWagCqFM6+xPqwd3SzQGPaelUmH5BkbHyimCyah2ebBOIiZJ5kya5vDAvafK0R7xPSEhpIXsnW5l+jN2lnBuMCINYl4jSyaaoAFrWwOQqIDIjWdsAR29rxpnBZP7UNBl5+jaU+PmbEH8aDOUgxaLzwCGsRvMebMxW686nHN0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VZznVnO1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D602C4CEE7;
	Wed, 16 Jul 2025 19:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752694311;
	bh=eBe8s1XgfnGkHifuAa5Fbx70CJfHUg3nJuCjIt3mEik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VZznVnO1NqAzTOARXAeGzxBt8qYlSfVcjMxU4BCDgN/H8bk74cjMjfsu43DVCzozh
	 UQapc7Vw0Nr16SZf23tE2ntBY4npTEmAci30pMTX9Vto584FzSjNsD1fg6Kq442fiU
	 DqAU52F/jaNHnpP+Uxw1zAehZjT2+RwSMec9lRduWjPVfzCGU0wds1ruzVHCakSnNx
	 1HjZw4Dz0dqyM7I+Do3QhC5XTz7G7NVPdRdjY1D3VdR8rmqLTQ+fAp/2/U0ai1i4Yh
	 WTpAtsWUGVHzZaiPwz/y1BqINqBr1e0D91dmkdySRTjtdktHkLEO1cxM8aUty2Vf6t
	 pHQ0iSk4IVYhw==
Date: Wed, 16 Jul 2025 14:31:48 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/4] misc: fastrpc: add support for gdsp remoteproc
Message-ID: <qg7uvhr2pazrjqrqyraj7pr3hxbzadhenbkps7q4uqhilao2o2@653xyxcx2iak>
References: <20250714054133.3769967-1-quic_lxu5@quicinc.com>
 <20250714054133.3769967-5-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714054133.3769967-5-quic_lxu5@quicinc.com>

On Mon, Jul 14, 2025 at 11:11:33AM +0530, Ling Xu wrote:
> Some platforms (like sa8775p) feature one or more GPDSPs (General
> Purpose DSPs). Similar to other kinds of Hexagon DSPs, they provide
> a FastRPC implementation, allowing code execution in both signed and
> unsigned protection domains. Extend the checks to allow domain names
> starting with "gdsp" (possibly followed by an index).
> 

This was called cdsp1 before patch 3 where you removed it and now the
same id is introduced but this time with the name GDSP.

Iirc there was a cdsp1 in SA8295P/SA8540P, are you silently dropping
support for that here? Or perhaps just renaming it?

Regards,
Bjorn

> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 85b6eb16b616..d05969de406e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -27,6 +27,7 @@
>  #define MDSP_DOMAIN_ID (1)
>  #define SDSP_DOMAIN_ID (2)
>  #define CDSP_DOMAIN_ID (3)
> +#define GDSP_DOMAIN_ID (4)
>  #define FASTRPC_MAX_SESSIONS	14
>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
> @@ -2249,6 +2250,8 @@ static int fastrpc_get_domain_id(const char *domain)
>  		return MDSP_DOMAIN_ID;
>  	else if (!strncmp(domain, "sdsp", 4))
>  		return SDSP_DOMAIN_ID;
> +	else if (!strncmp(domain, "gdsp", 4))
> +		return GDSP_DOMAIN_ID;
>  
>  	return -EINVAL;
>  }
> @@ -2323,13 +2326,14 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	case ADSP_DOMAIN_ID:
>  	case MDSP_DOMAIN_ID:
>  	case SDSP_DOMAIN_ID:
> -		/* Unsigned PD offloading is only supported on CDSP */
> +		/* Unsigned PD offloading is only supported on CDSP and GDSP */
>  		data->unsigned_support = false;
>  		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
>  		if (err)
>  			goto err_free_data;
>  		break;
>  	case CDSP_DOMAIN_ID:
> +	case GDSP_DOMAIN_ID:
>  		data->unsigned_support = true;
>  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
>  		err = fastrpc_device_register(rdev, data, true, domain);
> -- 
> 2.34.1
> 

