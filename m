Return-Path: <linux-arm-msm+bounces-60968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C97AD566E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 15:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A86BD1BC4CF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 13:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE16258CDC;
	Wed, 11 Jun 2025 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hG2DfL5J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE695284B36;
	Wed, 11 Jun 2025 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646972; cv=none; b=BBHwnwnzz/rRrBkC65d2VHgHDBaipx6S3XjTIyyD1hjP2HgtDLhYf7hB3XVOeLlJguYD/ZoT4v3FRnQoXCJoVj3/+aznvqFp4gJ+K2WsMUiAdWzBKSdWJqsLMgIcP4tfilHLTRF9/gXZ+K3TXRd96JhAq6KjETAUcqHmhgXMz8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646972; c=relaxed/simple;
	bh=GWYTVxKC93YJVMhVzanm/CX1o4JT55CaAW87EgvJi2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ci+F7hVuPNhEddKSNmRNWvItHlBFK1kchnLJn9z90JZo/VQLwkNbWebqTN9ZUng9C8I7f2kJZPPcQTblSWPPrKFGCY5F6VLHvqNOmEe0clyjST1GfCZ6GlBOX93YuJdNrGvvzzUWy5EJjCmsB1/HYs7vfs8k4Vmxn5DkhgzKKxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hG2DfL5J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C76C4CEEE;
	Wed, 11 Jun 2025 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749646972;
	bh=GWYTVxKC93YJVMhVzanm/CX1o4JT55CaAW87EgvJi2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hG2DfL5JR+8qDvnZmSLi/lKndMr1EnbHqsT75jBCcqxPrs46YBWQs78lBKvfIE+aC
	 Ft54mn2k1z/VL94FG/gGRpAFTrRaNC2WrIJddrIdSTxXBdhZ11poBFM5GyIKizdlje
	 XLei3+O+DuE8lYoCRgHIF7PTD81y3M8EX7/gvgRuJe7aWmOSpRkCP450dZW1rVp1Z+
	 271mRK0wm/Wxo+Pbymb6PpDzhp7/YZF5km8FQlnR2xbYKftcYV784uiCDkHso6pVrU
	 yVZ1Vy0MKOlQ4a+FR2WvVC+7/32bydLAzh0g3S0E3MX5pQZwhALd++Sh1U+r04u37P
	 Y8AgWtX7mANzQ==
Date: Wed, 11 Jun 2025 18:32:43 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Apurupa Pattapu <quic_apurupa@quicinc.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 05/12] tee: increase TEE_MAX_ARG_SIZE to 4096
Message-ID: <aEl-c-eoezGYKOpE@sumit-X1>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
 <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-5-024e3221b0b9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-5-024e3221b0b9@oss.qualcomm.com>

On Mon, May 26, 2025 at 11:56:50PM -0700, Amirreza Zarrabi wrote:
> Increase TEE_MAX_ARG_SIZE to accommodate worst-case scenarios where
> additional buffer space is required to pass all arguments to TEE.
> This change is necessary for upcoming support for Qualcomm TEE, which
> requires a larger buffer for argument marshaling.
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  include/uapi/linux/tee.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> index 441d97add53f..71a365afb89b 100644
> --- a/include/uapi/linux/tee.h
> +++ b/include/uapi/linux/tee.h
> @@ -42,7 +42,7 @@
>  #define TEE_IOC_MAGIC	0xa4
>  #define TEE_IOC_BASE	0
>  
> -#define TEE_MAX_ARG_SIZE	1024
> +#define TEE_MAX_ARG_SIZE	4096
>  
>  #define TEE_GEN_CAP_GP		(1 << 0)/* GlobalPlatform compliant TEE */
>  #define TEE_GEN_CAP_PRIVILEGED	(1 << 1)/* Privileged device (for supplicant) */
> 
> -- 
> 2.34.1
> 
> 

