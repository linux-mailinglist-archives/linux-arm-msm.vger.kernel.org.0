Return-Path: <linux-arm-msm+bounces-44309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9373AA052B8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 06:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9136A7A146B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 05:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB84419B586;
	Wed,  8 Jan 2025 05:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sv/+tbMV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C05710E4
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 05:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736314933; cv=none; b=pbwNHuaevDO+jtXZSERmQEq0xFNuDQiQoEzmyg8/6G9oMNEArjEOUXO6UhipNUjOrOFoBnTkbkcUW0BcQbILfeHfOIsMhCL8vhi3eNRuulXvlsyynV8v9OG3JIx1cYw9CeG5hG9niypEcf+TE1xh3llrs3Sgxm8ZtmZzeZv3VMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736314933; c=relaxed/simple;
	bh=V1/eCskG0EEA3jK4/+w1sWmTTp3nj57YncqG93zlAl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFIXDWRR2xoiFgNwCNp77RecfxmzFifhfBUwP1cKPmGS3jGuiGtEFLP7YyDa4II+duuBMIQc/03dBsNnGpIkOdIDoNuDUS+JsvvMzZ7CG4H7esupIY9SsBjdMvj6H2ZoioOFV3xEOB4fbwzabt72v+Ese2KHBMeXqKrJGfOamxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sv/+tbMV; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2166360285dso245123235ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 21:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736314930; x=1736919730; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VRf3KLf8/gL60sYLc56uaXjwgEUxVqDlLqbN/+vh4pU=;
        b=sv/+tbMV3ApdnvA/8WHZ889/m6SYnlp9M5Ko1pyGD3S9B7ghS5FWiJ2r6T/I/Y/FOt
         HZ0JcWWE1cDa8Ly0GqTWsGwuz9E755m6k5jxnn1PqY1LCdw0a04zteiAFSWQMlcTP08c
         6cv2ZBqtqxKrUoJ+TtirqKzi02vKBhFLwBl0VydRq2F7APW+vKfmaINv1H6i/VLpPBUL
         cWKRhpcrkgD5T+D0cdSJr6JV269nyV49IfYP2vy47z3OGAkTaSDge9uBvLHSj0dv1wFw
         6rVA2sogAiEMDbeiQmQhAOpRAvnLKtf0YfZMnmVtD0neKzy6OqO0dCpuGDmM/67IW+HJ
         w6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736314930; x=1736919730;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VRf3KLf8/gL60sYLc56uaXjwgEUxVqDlLqbN/+vh4pU=;
        b=Ikm/yiZ1byGmZecStz6X4svAqn8GnNPkwsNFXCBQGqaawG/4fEm7X5Lzxe1pbXBOxw
         sgp1fo2tt3D3VgVtEZ6qc5HudlR/57DOOr56b5u9weHRXQBTvXMzL7VyC0Mm/Mjv2GDd
         f2b7DOZ2iqOl79tb+p7ykY2M2mjsWUvdgFvvz4PX/39pXzosT3RDeKFJfs07O3bXgtbP
         NsDvKrMDQzI3lRwGzIegMS0RrOdYb4CztinnvRMlIAZJ4zsTiu5cTLuMoIAjVdVbJlgA
         M/9IqSuJa/gkb1rRi2tFmOaJVV80fnAjn0KfAd6TqGy+oz130NifwXqThVzsMvXWhRvo
         PZWA==
X-Forwarded-Encrypted: i=1; AJvYcCXb1dtvwOFKJONxReoLW6xVXaFKXSTLqhcjwON682CQ/BqHjpgBU+ryK54jkmW+YU92ppEZVymKZwpM43In@vger.kernel.org
X-Gm-Message-State: AOJu0Yw14hUBTxFkshCdMHGkQtAO6K4l0Myc93Mh2r/RagiO1MKq8kZM
	dAXj/MoEAWVUTcBivYYj0KXObJczk128QDXbK1GkK7UzLAQl34G/51TcH2msiA==
X-Gm-Gg: ASbGncvhwJnMXr0frrZj/N5YvtW8JPy0RcRIpkbaBevNRSTZEY0BK+lO24PQK63SGm1
	kcOj6bv+amMiKjATGKn0EU94NatQBndoOBQzqt6zYfU/kfuwp5DBiUxkUIe4PjTuszxHm+BM37/
	nWrJdHqpVF5lozTZTeMcMGrB1xC8IEN0oh+ew7MotWMryO4MEk90mME7057YNDHJtsiopuUiAHN
	k++sESOIjU48TNfbH9MqkvZVxp9D75iNiuKoNtmE1jgsIKk8jger07CF+XCJcV+ubck
X-Google-Smtp-Source: AGHT+IHfb7DiJvfS8v29jxsUziZRhFKDaY9dPzRiz3np6wV51MwuSsfBjIEy6SOqBmGKPG5YDPPdEQ==
X-Received: by 2002:a17:902:d491:b0:215:54a1:8584 with SMTP id d9443c01a7336-21a83f4c070mr21127315ad.17.1736314930490;
        Tue, 07 Jan 2025 21:42:10 -0800 (PST)
Received: from thinkpad ([117.213.100.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4429sm318970325ad.173.2025.01.07.21.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 21:42:09 -0800 (PST)
Date: Wed, 8 Jan 2025 11:12:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, quic_yabdulra@quicinc.com,
	quic_mattleun@quicinc.com, quic_thanson@quicinc.com,
	ogabbay@kernel.org, lizhi.hou@amd.com,
	jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH 2/7] bus: mhi: host: Add a policy to enable image
 transfer via BHIe in PBL
Message-ID: <20250108054202.r4bqxduuhpcvpqm4@thinkpad>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-3-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241213213340.2551697-3-quic_jhugo@quicinc.com>

On Fri, Dec 13, 2024 at 02:33:35PM -0700, Jeffrey Hugo wrote:
> From: Matthew Leung <quic_mattleun@quicinc.com>
> 
> Currently, mhi host only performs firmware transfer via BHI in PBL and

s/mhi/MHI here and below.

> BHIe from SBL. To support BHIe transfer directly from PBL, a policy
> needs to be added.
> 
> With this policy, BHIe will be used to transfer firmware in PBL if the
> mhi controller has bhie regs, sets seg_len, and does not set

s/bhie/BHIe

> fbc_download. The intention is to transfer firmware using BHIe in PBL
> without further BHIe transfers in SBL.
> 
> Signed-off-by: Matthew Leung <quic_mattleun@quicinc.com>
> Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/bus/mhi/host/boot.c     | 80 +++++++++++++++++++++++++++------
>  drivers/bus/mhi/host/init.c     |  2 +-
>  drivers/bus/mhi/host/internal.h |  8 ++++
>  3 files changed, 75 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index e3f3c07166ad..c9ecb6427209 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -452,12 +452,62 @@ static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
>  	}
>  }
>  
> +static enum mhi_fw_load_type mhi_fw_load_type_get(const struct mhi_controller *mhi_cntrl)
> +{
> +	enum mhi_fw_load_type ret = MHI_FW_LOAD_UNKNOWN;

You can directly return the enum without a local variable.

> +
> +	if (mhi_cntrl->fbc_download) {
> +		if (mhi_cntrl->bhie && mhi_cntrl->seg_len)

I don't think this condition can fail. If 'mhi_cntrl->bhie' is NULL,
mhi_prepare_for_power_up() will fail. So I think MHI_FW_LOAD_UNKNOWN is not
needed.

Also, all the validation should be performed early, not while loading fw.

> +			ret = MHI_FW_LOAD_FBC;
> +	} else {
> +		if (mhi_cntrl->bhie && mhi_cntrl->seg_len)
> +			ret = MHI_FW_LOAD_BHIE;
> +		else
> +			ret = MHI_FW_LOAD_BHI;
> +	}
> +	return ret;
> +}
> +
> +static int mhi_send_image_bhi(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)

mhi_load_image_bhi?

> +{
> +	struct image_info *image;
> +	int ret;
> +
> +	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> +	if (ret)
> +		return ret;
> +
> +	mhi_firmware_copy_bhi(mhi_cntrl, fw_data, size, image);
> +
> +	ret = mhi_fw_load_bhi(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
> +	mhi_free_bhi_buffer(mhi_cntrl, image);
> +
> +	return ret;
> +}
> +
> +static int mhi_send_image_bhie(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)

mhi_load_image_bhie?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

